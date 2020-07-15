Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C481C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 03:15:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E378620663
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 03:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="11H8PttC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E378620663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JTNdhkEuur5i3IQc7QWugcUAdEwgj5+GCYn5KJ1VYLw=; b=11H8PttC9+1oYXBBfKS+yjAl8
	YFh9p6TMXOR4ElHMWjZt9Wx/UgPds4G8/C1LVMgxsq5qBL/vLVPeYLNasDhSWhlu+ZUM8KYa75FsF
	wTyevMKuRtDqCSKg6ae+6HMqhdR2L2AR1F7aSoZ2Okz2x9CROr8rZgfiGcAI4IJ28qrphHAk6Zo5y
	m1B3dsMm87Z7re8X5uCROI99+BX29cThagzZ73Xr7DR1TFERUhh/3GL5rT6NhjGfFi1bC+nYc8KfX
	OrhPFpQRAiBmCGpknD4JDxlJx3ONQhc84AgXPxU3Dp43nePAtiTnoMvmHmZLYdbtiTt1WoUFnHtZ2
	/iTjLH2lA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvXt2-00060G-2Y; Wed, 15 Jul 2020 03:15:12 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvXsy-0005z4-1s
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 03:15:10 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01358; MF=cooper.qu@linux.alibaba.com;
 NM=1; PH=DS; RN=13; SR=0; TI=SMTPD_---0U2lnJE7_1594782897; 
Received: from L-X0CGLVDL-0840.local(mailfrom:cooper.qu@linux.alibaba.com
 fp:SMTPD_---0U2lnJE7_1594782897) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 15 Jul 2020 11:14:58 +0800
Subject: Re: [PATCH v3 2/2] riscv: Enable per-task stack canaries
To: Palmer Dabbelt <palmerdabbelt@google.com>, guoren@kernel.org
References: <mhng-1f027fd5-a558-4bf4-8168-59a75f36caac@palmerdabbelt-glaptop1>
From: cooper <cooper.qu@linux.alibaba.com>
Message-ID: <54bdad8c-cb15-f334-5a9b-7e693ea00399@linux.alibaba.com>
Date: Wed, 15 Jul 2020 11:14:57 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <mhng-1f027fd5-a558-4bf4-8168-59a75f36caac@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_231508_353273_B030CE99 
X-CRM114-Status: GOOD (  14.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: guoren@linux.alibaba.com, keescook@chromium.org, anup@brainfault.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 zong.li@sifive.com, Bjorn Topel <bjorn.topel@gmail.com>,
 greentime.hu@sifive.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjAvNy8xNSDkuIrljYg1OjM3LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBGcmks
IDEwIEp1bCAyMDIwIDA5OjE5OjU4IFBEVCAoLTA3MDApLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90
ZToKPj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+Pgo+PiBUaGlz
IGVuYWJsZXMgdGhlIHVzZSBvZiBwZXItdGFzayBzdGFjayBjYW5hcnkgdmFsdWVzIGlmIEdDQyBo
YXMKPj4gc3VwcG9ydCBmb3IgZW1pdHRpbmcgdGhlIHN0YWNrIGNhbmFyeSByZWZlcmVuY2UgcmVs
YXRpdmUgdG8gdGhlCj4+IHZhbHVlIG9mIHRwLCB3aGljaCBob2xkcyB0aGUgdGFzayBzdHJ1Y3Qg
cG9pbnRlciBpbiB0aGUgcmlzY3YKPj4ga2VybmVsLgo+Pgo+PiBBZnRlciBjb21wYXJlIGFybTY0
IGFuZCB4ODYgaW1wbGVtZW50YXRpb25zLCBzZWVtcyBhcm02NCdzIGlzIG1vcmUKPj4gZmxleGli
bGUgYW5kIHJlYWRhYmxlLiBUaGUga2V5IHBvaW50IGlzIGhvdyBnY2MgZ2V0IHRoZSBvZmZzZXQg
b2YKPj4gc3RhY2tfY2FuYXJ5IGZyb20gZ3MvZWwwX3NwLgo+Pgo+PiB4ODY6IFVzZSBhIGZpeCBv
ZmZzZXQgZnJvbSBncywgbm90IGZsZXhpYmxlLgo+Pgo+PiBzdHJ1Y3QgZml4ZWRfcGVyY3B1X2Rh
dGEgewo+PiDCoMKgwqDCoC8qCj4+IMKgwqDCoMKgICogR0NDIGhhcmRjb2RlcyB0aGUgc3RhY2sg
Y2FuYXJ5IGFzICVnczo0MC7CoCBTaW5jZSB0aGUKPj4gwqDCoMKgwqAgKiBpcnFfc3RhY2sgaXMg
dGhlIG9iamVjdCBhdCAlZ3M6MCwgd2UgcmVzZXJ2ZSB0aGUgYm90dG9tCj4+IMKgwqDCoMKgICog
NDggYnl0ZXMgb2YgdGhlIGlycSBzdGFjayBmb3IgdGhlIGNhbmFyeS4KPj4gwqDCoMKgwqAgKi8K
Pj4gwqDCoMKgwqBjaGFywqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnc19iYXNlWzQwXTsgLy8gOigK
Pj4gwqDCoMKgwqB1bnNpZ25lZCBsb25nwqDCoCBzdGFja19jYW5hcnk7Cj4+IH07Cj4+Cj4+IGFy
bTY0OiBVc2UgLW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQtb2Zmc2V0ICYgZ3VhcmQtcmVnCj4+IMKg
wqDCoMKgZ2NjIG9wdGlvbnM6Cj4+IMKgwqDCoMKgLW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQ9c3lz
cmVnCj4+IMKgwqDCoMKgLW1zdGFjay1wcm90ZWN0b3ItZ3VhcmQtcmVnPXNwX2VsMAo+PiDCoMKg
wqDCoC1tc3RhY2stcHJvdGVjdG9yLWd1YXJkLW9mZnNldD14eHgKPj4KPj4gcmlzY3Y6IFVzZSAt
bXN0YWNrLXByb3RlY3Rvci1ndWFyZC1vZmZzZXQgJiBndWFyZC1yZWcKPj4gwqDCoMKgwqBnY2Mg
b3B0aW9uczoKPj4gwqDCoMKgwqAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZD10bHMKPj4gwqDCoMKg
wqAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZC1yZWc9dHAKPj4gwqDCoMKgwqAtbXN0YWNrLXByb3Rl
Y3Rvci1ndWFyZC1vZmZzZXQ9eHh4Cj4+Cj4+IEhlcmUgaXMgcmlzY3YgZ2NjJ3Mgd29yayBbMV0u
Cj4+Cj4+IFsxXSBodHRwczovL2djYy5nbnUub3JnL3BpcGVybWFpbC9nY2MtcGF0Y2hlcy8yMDIw
LUp1bHkvNTQ5NTgzLmh0bWwKPj4KPj4gSW4gdGhlIGVuZCwgdGhlc2UgY29kZXMgYXJlIGluc2Vy
dGVkIGJ5IGdjYyBiZWZvcmUgcmV0dXJuOgo+Pgo+PiAqwqAgMHhmZmZmZmZlMDAwMjBiMzk2IDwr
MTIwPjrCoMKgIGxkwqDCoMKgwqDCoCBhNSwxMDA4KHRwKSAjIDB4M2YwCj4+ICrCoCAweGZmZmZm
ZmUwMDAyMGIzOWEgPCsxMjQ+OsKgwqAgeG9ywqDCoMKgwqAgYTUsYTUsYTQKPj4gKsKgIDB4ZmZm
ZmZmZTAwMDIwYjM5YyA8KzEyNj46wqDCoCBtdsKgwqDCoMKgwqAgYTAsczUKPj4gKsKgIDB4ZmZm
ZmZmZTAwMDIwYjM5ZSA8KzEyOD46wqDCoCBibmV6IGE1LDB4ZmZmZmZmZTAwMDIwYjYxYyAKPj4g
PF9kb19mb3JrKzc2Nj4KPj4gwqDCoCAweGZmZmZmZmUwMDAyMGIzYTIgPCsxMzI+OsKgwqAgbGTC
oMKgwqDCoMKgIHJhLDEzNihzcCkKPj4gwqDCoCAweGZmZmZmZmUwMDAyMGIzYTQgPCsxMzQ+OsKg
wqAgbGTCoMKgwqDCoMKgIHMwLDEyOChzcCkKPj4gwqDCoCAweGZmZmZmZmUwMDAyMGIzYTYgPCsx
MzY+OsKgwqAgbGTCoMKgwqDCoMKgIHMxLDEyMChzcCkKPj4gwqDCoCAweGZmZmZmZmUwMDAyMGIz
YTggPCsxMzg+OsKgwqAgbGTCoMKgwqDCoMKgIHMyLDExMihzcCkKPj4gwqDCoCAweGZmZmZmZmUw
MDAyMGIzYWEgPCsxNDA+OsKgwqAgbGTCoMKgwqDCoMKgIHMzLDEwNChzcCkKPj4gwqDCoCAweGZm
ZmZmZmUwMDAyMGIzYWMgPCsxNDI+OsKgwqAgbGTCoMKgwqDCoMKgIHM0LDk2KHNwKQo+PiDCoMKg
IDB4ZmZmZmZmZTAwMDIwYjNhZSA8KzE0ND46wqDCoCBsZMKgwqDCoMKgwqAgczUsODgoc3ApCj4+
IMKgwqAgMHhmZmZmZmZlMDAwMjBiM2IwIDwrMTQ2PjrCoMKgIGxkwqDCoMKgwqDCoCBzNiw4MChz
cCkKPj4gwqDCoCAweGZmZmZmZmUwMDAyMGIzYjIgPCsxNDg+OsKgwqAgbGTCoMKgwqDCoMKgIHM3
LDcyKHNwKQo+PiDCoMKgIDB4ZmZmZmZmZTAwMDIwYjNiNCA8KzE1MD46wqDCoCBhZGRpwqDCoMKg
IHNwLHNwLDE0NAo+PiDCoMKgIDB4ZmZmZmZmZTAwMDIwYjNiNiA8KzE1Mj46wqDCoCByZXQKPj4g
wqDCoCAuLi4KPj4gKsKgIDB4ZmZmZmZmZTAwMDIwYjYxYyA8Kzc2Nj46wqDCoCBhdWlwY8KgwqAg
cmEsMHg3ZjgKPj4gKsKgIDB4ZmZmZmZmZTAwMDIwYjYyMCA8Kzc3MD46wqDCoCBqYWxywqDCoMKg
IC0xNzY0KHJhKSAjIAo+PiAweGZmZmZmZmUwMDBhMDJmMzggPF9fc3RhY2tfY2hrX2ZhaWw+Cj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPj4g
U2lnbmVkLW9mZi1ieTogY29vcGVyIDxjb29wZXIucXVAbGludXguYWxpYmFiYS5jb20+Cj4KPiBJ
SVJDIHdlJ3JlIHJlcXVpcmVkIHRvIHVzZSBmdWxsIG5hbWVzIGhlcmUuwqAgSSdtIGFzc3VtaW5n
IHRoYXQncyBtZWFudCAKPiB0byBiZQo+ICJTaWduZWQtb2ZmLWJ5OiBDb29wZXIgUXUgLi4uIiwg
YW5kIEkga25vdyBpdCdzIGEgYml0IHByb2NlZHVyYWwgYnV0IEkgCj4gY2FuJ3QKPiBtYWtlIHRo
YXQgY2hhbmdlLgo+Cj4gT3RoZXJ3aXNlIHRoZXNlIHR3byBsb29rIGdvb2QsIHRoZSBmaXJzdCBv
bmUgaXMgb24gZm9yLW5leHQuwqAgSSBjYW4gCj4gYm9vdCB3aXRoIGEKPiBkZWZjb25maWcgYW1t
ZW5kZWQgd2l0aCBDT05GSUdfU1RBQ0tQUk9URUNUT1I9eSwKPiBUaGFua3MhCj4KSGkgUGFsbWVy
LAoKVGhhdCdzIG9rIHRvIGNoYW5nZSBpdCB0byBmdWxsIG5hbWVzIGFzIGZvbGxvd3MuCgpTaWdu
ZWQtb2ZmLWJ5OiBDb29wZXIgUXUgPGNvb3Blci5xdUBsaW51eC5hbGliYWJhLmNvbT4KCgpCZXN0
IFJlZ2FyZHMsCgpDb29wZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
