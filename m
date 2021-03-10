Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CF2C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 19:13:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 131F564F9F
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 19:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 131F564F9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BT/e0hrNz2gCkwBgkoCbdh6G4LY3DGjO1n0JBui8HxM=; b=q5PnS/1oiuKFu/P2x9M0lRrux
	GsnlJxR6zUh2xtuK3PFgEVrnf/iL3vUFCl/HxpFtXEDW+QxSO6rFzYQ5FdvkDgA2z5GVzt2x+GolZ
	IpQxSQ55WTtJ2QYGSPAbAgME1TuJQTsPRsGB2kwvjVYJpGrUv4VXh+ykrSxSnbOE6PNfgXyJxDHDv
	MoCETJfAgptsEB7FF0WokhmzdZwv2HYcyurHI0koVBz4AY7KwgrhNWILtfxiOnkKDVpogagZYMruc
	s5+XOCXMftvm+ULCaCMH+Fujq42U4YtMGWM0D5zxXYoKsze5O4ifAyvhmDn99dxGUgkbXtCmNZSMU
	9/Q9XoMtw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK4Gg-007ZvB-WF; Wed, 10 Mar 2021 19:13:15 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK4GU-007ZsL-Rg
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 19:13:05 +0000
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9F5FB100006;
 Wed, 10 Mar 2021 19:12:55 +0000 (UTC)
Subject: Re: [PATCH 2/3] Documentation: riscv: Add documentation that
 describes the VM layout
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Hildenbrand <david@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20210225080453.1314-1-alex@ghiti.fr>
 <20210225080453.1314-3-alex@ghiti.fr>
 <5279e97c-3841-717c-2a16-c249a61573f9@redhat.com>
 <7d9036d9-488b-47cc-4673-1b10c11baad0@ghiti.fr>
 <CAK8P3a3mVDwJG6k7PZEKkteszujP06cJf8Zqhq43F0rNsU=h4g@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <236a9788-8093-9876-a024-b0ad0d672c72@ghiti.fr>
Date: Wed, 10 Mar 2021 14:12:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3mVDwJG6k7PZEKkteszujP06cJf8Zqhq43F0rNsU=h4g@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_191302_942024_EEB604B1 
X-CRM114-Status: GOOD (  25.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQXJuZCwKCkxlIDMvMTAvMjEgw6AgNjo0MiBBTSwgQXJuZCBCZXJnbWFubiBhIMOpY3JpdMKg
Ogo+IE9uIFRodSwgRmViIDI1LCAyMDIxIGF0IDEyOjU2IFBNIEFsZXggR2hpdGkgPGFsZXhAZ2hp
dGkuZnI+IHdyb3RlOgo+Pgo+PiBMZSAyLzI1LzIxIMOgIDU6MzQgQU0sIERhdmlkIEhpbGRlbmJy
YW5kIGEgw6ljcml0IDoKPj4+ICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgfCAgICAg
ICAgICAgICAgICAgIHwgICAgICAgICB8PiArCj4+PiBmZmZmZmZjMDAwMDAwMDAwIHwgLTI1NiAg
ICBHQiB8IGZmZmZmZmM3ZmZmZmZmZmYgfCAgIDMyIEdCIHwga2FzYW4KPj4+PiArICAgZmZmZmZm
Y2VmZWUwMDAwMCB8IC0xOTYgICAgR0IgfCBmZmZmZmZjZWZlZmZmZmZmIHwgICAgMiBNQiB8IGZp
eG1hcAo+Pj4+ICsgICBmZmZmZmZjZWZmMDAwMDAwIHwgLTE5NiAgICBHQiB8IGZmZmZmZmNlZmZm
ZmZmZmYgfCAgIDE2IE1CIHwgUENJIGlvCj4+Pj4gKyAgIGZmZmZmZmNmMDAwMDAwMDAgfCAtMTk2
ICAgIEdCIHwgZmZmZmZmY2ZmZmZmZmZmZiB8ICAgIDQgR0IgfCB2bWVtbWFwCj4+Pj4gKyAgIGZm
ZmZmZmQwMDAwMDAwMDAgfCAtMTkyICAgIEdCIHwgZmZmZmZmZGZmZmZmZmZmZiB8ICAgNjQgR0Ig
fAo+Pj4+IHZtYWxsb2MvaW9yZW1hcCBzcGFjZQo+Pj4+ICsgICBmZmZmZmZlMDAwMDAwMDAwIHwg
LTEyOCAgICBHQiB8IGZmZmZmZmZmN2ZmZmZmZmYgfCAgMTI2IEdCIHwKPj4+PiBkaXJlY3QgbWFw
cGluZyBvZiBhbGwgcGh5c2ljYWwgbWVtb3J5Cj4+Pgo+Pj4gXiBTbyB5b3UgY291bGQgbmV2ZXIg
ZXZlciBoYXZlIG1vcmUgdGhhbiAxMjYgR0IsIGNvcnJlY3Q/Cj4+Pgo+Pj4gSSBhc3N1bWUgdGhh
dCdzIG5vdGhpbmcgbmV3Lgo+Pj4KPj4KPj4gQmVmb3JlIHRoaXMgcGF0Y2gsIHRoZSBsaW1pdCB3
YXMgMTI4R0IsIHNvIGluIG15IHNlbnNlLCB0aGVyZSBpcyBub3RoaW5nCj4+IG5ldy4gSWYgZXZl
ciB3ZSB3YW50IHRvIGluY3JlYXNlIHRoYXQgbGltaXQsIHdlJ2xsIGp1c3QgaGF2ZSB0byBsb3dl
cgo+PiBQQUdFX09GRlNFVCwgdGhlcmUgaXMgc3RpbGwgc29tZSB1bnVzZWQgdmlydHVhbCBhZGRy
ZXNzZXMgYWZ0ZXIga2FzYW4KPj4gZm9yIGV4YW1wbGUuCj4gCj4gTGludXMgV2FsbGVpaiBpcyBs
b29raW5nIGludG8gY2hhbmdpbmcgdGhlIGFybTMyIGNvZGUgdG8gaGF2ZSB0aGUga2VybmVsCj4g
ZGlyZWN0IG1hcCBpbnNpZGUgb2YgdGhlIHZtYWxsb2MgYXJlYSwgd2hpY2ggd291bGQgYmUgYW5v
dGhlciBwbGFjZQo+IHRoYXQgeW91IGNvdWxkIHVzZSBoZXJlLiBJdCB3b3VsZCBiZSBuaWNlIHRv
IG5vdCBoYXZlIHRvbyBtYW55IGRpZmZlcmVudAo+IHdheXMgb2YgZG9pbmcgdGhpcywgYnV0IEkn
bSBub3Qgc3VyZSBob3cgaGFyZCBpdCB3b3VsZCBiZSB0byByZXdvcmsgeW91cgo+IGNvZGUsIG9y
IGlmIHRoZXJlIGFyZSBhbnkgZG93bnNpZGVzIG9mIGRvaW5nIHRoaXMuCgpUaGlzIHdhcyB3aGF0
IG15IHByZXZpb3VzIHZlcnNpb24gZGlkOiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC82Lzcv
MjguCgpUaGlzIGFwcHJvYWNoIHdhcyBub3Qgd2VsY29tZWQgdmVyeSB3ZWxsIGFuZCBpdCBmaXhl
ZCBvbmx5IHRoZSBwcm9ibGVtIApvZiB0aGUgaW1wbGVtZW50YXRpb24gb2YgcmVsb2NhdGFibGUg
a2VybmVsLiBUaGUgc2Vjb25kIGlzc3VlIEknbSB0cnlpbmcgCnRvIHJlc29sdmUgaGVyZSBpcyB0
byBzdXBwb3J0IGJvdGggMyBhbmQgNCBsZXZlbCBwYWdlIHRhYmxlcyB1c2luZyB0aGUgCnNhbWUg
a2VybmVsIHdpdGhvdXQgYmVpbmcgcmVsb2NhdGFibGUgKHdoaWNoIHdvdWxkIGludHJvZHVjZSBw
ZXJmb3JtYW5jZSAKcGVuYWx0eSkuIEkgY2FuJ3QgZG8gaXQgd2hlbiB0aGUga2VybmVsIG1hcHBp
bmcgaXMgaW4gdGhlIHZtYWxsb2MgcmVnaW9uIApzaW5jZSB2bWFsbG9jIHJlZ2lvbiByZWxpZXMg
b24gUEFHRV9PRkZTRVQgd2hpY2ggaXMgZGlmZmVyZW50IG9uIGJvdGggMyAKYW5kIDQgbGV2ZWwg
cGFnZSB0YWJsZSBhbmQgdGhhdCB3b3VsZCB0aGVuIHJlcXVpcmUgdGhlIGtlcm5lbCB0byBiZSAK
cmVsb2NhdGFibGUuCgpBbGV4Cgo+IAo+ICAgICAgICAgIEFybmQKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
