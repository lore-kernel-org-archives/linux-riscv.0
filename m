Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A512C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 11:41:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF97E64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 11:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF97E64EC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5y+7d5bFoB6LZ/5t6ODZ0shOW6XbH3CkMpb7wcOf64Y=; b=kkTvFnC7Fflf2YQrMVAn204qU
	HKqq5i237rJFtyQl1AkxynS/4og3285B21MP75H9OWOMG3ygwZDAg20E21GgxShhXHVW07ag7FRRB
	7SI//erba9YCSrCwoxFp7bc7Sf09FmY/k66KYGqMIjWpZmB1yfXG+/lrw68iGFeYBKMA0VhKQKl9c
	SPPjiQvApnO52jeTWqaR8GR0wlMuZvmsiFi5NzR5aAvDjMR3gmDGQft2k9pse5BznrsHPtawtPQ0S
	8d9T2JLzWkjlmGMRypd9VxdldQbuYLm4yhOomSE8NP6KABgHKdXvOTmgBeN+sdER4E0SU4jS3Ezng
	GKxLs8nQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHmLt-008V28-CC; Thu, 04 Mar 2021 11:41:09 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHmLl-008Uwm-Ee
 for linux-riscv@lists.infradead.org; Thu, 04 Mar 2021 11:41:05 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DrpmM0hrCz7sqp;
 Thu,  4 Mar 2021 19:38:59 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Thu, 4 Mar 2021 19:40:37 +0800
Subject: Re: question about RISCV EFI stub support
To: Palmer Dabbelt <palmer@dabbelt.com>, <atishp@atishpatra.org>
CC: <ardb@kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 <linux-riscv@lists.infradead.org>
References: <mhng-cb425c13-c9ad-46e7-9b8a-b017be00e098@penguin>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <f61fbd55-653a-df8a-7dd3-226dbdb65569@huawei.com>
Date: Thu, 4 Mar 2021 19:40:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-cb425c13-c9ad-46e7-9b8a-b017be00e098@penguin>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
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

Ck9uIDIwMjEvMy80IDEwOjI1LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBUdWUsIDAyIE1h
ciAyMDIxIDAwOjIwOjEyIFBTVCAoLTA4MDApLCBhdGlzaHBAYXRpc2hwYXRyYS5vcmcgd3JvdGU6
Cj4+Ci4uLgo+Pj4gPgo+Pj4gPiBBbnkgY29tbWVudCBhYm91dCB0aGUgdG9vIGlzc3VlLAo+Pj4g
Pgo+Pj4gPiAxKcKgIGRpcmVjdGx5IHVzZSAuc2hvdXQgTVpfTUFHSUMgdG8gZGVjb3VwbGUgRUZJ
X1NUVUIgYW5kIAo+Pj4gUklTQ1ZfSVNBX0MuCj4+PiA+Cj4+PiA+IDIpwqAgZG9uJ3Qgc2V0IFJJ
U0NWX0lTQV9DwqAgdG8gZGVmYXVsdCB5Cj4+PiA+Cj4+Pgo+Pj4gQnV0IGRvZXNuJ3QgdGhhdCBi
cmVhayBub24tRUZJIGJvb3Qgd2l0aCB0aGUgc2FtZSBpbWFnZT8gVGhlIG9wY29kZQo+Pj4gc3Rp
bGwgbmVlZHMgdG8gYmUgZXhlY3V0YWJsZSwgYW5kIGhhdmUgY2xvc2UtdG8tTk9QIHNlbWFudGlj
cy4KPj4KPj4gQ29ycmVjdC4gSXQgd2lsbCBicmVhayBub24tRUZJIGJvb3QgZm9yIHRoZSBoYXJk
d2FyZSBpZiB0aGUgcGxhdGZvcm0KPj4gZG9lc24ndCBzdXBwb3J0IEMgZXh0ZW5zaW9uLgo+PiBU
aGVvcmV0aWNhbGx5LCB3ZSBjYW4gZGVjb3VwbGUgRUZJX1NUVUIgJiBSSVNDVl9JU0FfQy4gQnV0
IHRoYXQncwo+PiB1c2VsZXNzIGFzIHRoZSBoYXJkd2FyZSBoYXMgdG8gc3VwcG9ydCBDIGFueXdh
eXMuCj4+IEFwb2xvZ2llcyBmb3Igbm90IHNlZWluZyB0aGlzIHRocm91Z2guCj4+Cj4+IElmIGEg
cGxhdGZvcm0gZG9lc24ndCBoYXZlIGEgQyBleHRlbnNpb24sIHRoZXkgY2FuIG5vdCB1c2UgdGhl
IEVGSQo+PiBib290aW5nIG1ldGhvZC4KPgo+IFNvIHRoZSBkZXBlbmRlbmN5IGhlcmUgaXMgYWN0
dWFsbHkgYSBiaXQgb2RkOiBwbGF0Zm9ybXMgd2l0aG91dCBDIAo+IF9jYW5fIHVzZSBFRkksIHRo
ZSBFRkkgaW1hZ2VzIGp1c3QgY2FuJ3QgYmUgYm9vdGVkIG9uIG5vbi1FRkkgc3lzdGVtcyAKPiAo
YmVjYXVzZSB0aGUgZmxhdCBiaW5hcmllcyBuZWVkIHRvIGV4ZWN1dGUgdGhlIFBFL0NPRkYgaGVh
ZGVyKS7CoCBUaGUgCj4gaXNzdWUgaXMgcmVhbGx5IHRoYXQgd2UgY2FuJ3Qgc3VwcG9ydCBhbGwg
dGhyZWUgb2Ygbm9uLUMsIEVGSSwgYW5kIAo+IG5vbi1FRkkgaW4gdGhlIEltYWdlIGZvcm1hdC4K
Pgo+IFRoZSByZWFzb24gd2UgY291cGxlZCBDIGFuZCBFRkkgaXMgcmVhbGx5IHRvIGF2b2lkIHRo
ZSBleGlzdGVuY2Ugb2YgCj4gRUZJLW9ubHkga2VybmVscywgd2hpY2ggYXJlIGEgaGVhZGFjaGUg
dGhlc2UgZGF5cyBiZWNhdXNlIEVGSSBpc24ndCAKPiB3aWRlbHkgc3VwcG9ydGVkIG9yIHVzZWQg
b24gUklTQy1WLsKgIFRoZSBnZW5lcmFsIGFzc3VtcHRpb24gaXMgdGhhdCwgCj4gc2luY2Ugd2Ug
cmVjb21tZW5kIHJ2NjRnYyBmb3IgcG9ydGFibGUgc3lzdGVtcyBhbmQgRUZJIGlzIG1vc3RseSBv
ZiAKPiBpbnRlcmVzdCB0byBwb3J0YWJsZSBzeXN0ZW1zLCB3ZSB3b24ndCBlbmQgdXAgd2l0aCBu
b24tQyBFRkkgc3lzdGVtcyAKPiBhbmQgdGhlcmVmb3IgZG9uJ3QgbmVlZCB0byB3b3JyeSBhYm91
dCBoYXZpbmcgaW5jb21wYXRpYmxlIGtlcm5lbHMuwqAgCj4gVGhhdCBzYWlkLCBpZiB0aGVyZSdz
IG9uZSB0aGluZyBJJ3ZlIGxlYXJuZWQgZnJvbSB0aGUgd2hvbGUgUklTQy1WIAo+IHRoaW5nIGl0
J3MgdGhhdCB3aGVuZXZlciBJIHNheSAid2UgZG9uJ3QgdGhpbmsgaGFyZHdhcmUgdGhhdCBkb2Vz
IFggCj4gd2lsbCBzaG93IHVwIiBpdCBkb2VzLsKgIEFzc3VtaW5nIHRoYXQncyB0aGUgY2FzZSBh
bmQgd2UgZW5kIHVwIHdpdGggCj4gbm9uLUMgc3lzdGVtcyB0aGF0IHBlb3BsZSB3YW50IHRvIHJ1
biBFRkkgb24sIHdlJ2xsIGZpZ3VyZSBvdXQgYSB3YXkgCj4gdG8gZG8gdGhhdCAtLSBpZiBzb21l
b25lIGhhcyByZWFsIGhhcmR3YXJlIEknbSBpbmNsaW5lZCB0byBzdXBwb3J0IGl0LCAKPiBvdGhl
cndpc2Ugd2UganVzdCBlbmQgdXAgd2l0aCBhIG1lc3Mgb2YgdmVuZG9yLXNwZWNpZmljIGZvcmtz
Lgo+Cj4gT25lIG9wdGlvbiB3b3VsZCBiZSB0byBqdXN0IGxldCBwZW9wbGUgYnVpbGQgRUZJLW9u
bHkga2VybmVscy4gVGhpcyAKPiB3b3VsZCBiZSBhIHRyaXZpYWwgbWF0dGVyLCBhcyBzdWdnZXN0
ZWQgc29tZXdoZXJlIGluIHRoaXMgdGhyZWFkIC0tIAo+IEknZCBwcm9iYWJseSBhZGQgc29tZSBL
Y29uZmlnIGp1Z2dsaW5nIHRvIHRyeSBhbmQgZ2V0IHBvcnRhYmxlIAo+IGJpbmFyaWVzIHdoZXJl
IHBvc3NpYmxlLCBidXQgdGhhdCdzIHByZXR0eSBzdHJhaWdodC1mb3J3YXJkIHN0dWZmLsKgIAo+
IFRoZSBpc3N1ZSB0aGVyZSBpcyB0aGF0IHdlJ2xsIGVuZCB1cCB3aXRoIGtlcm5lbHMgdGhhdCBj
YW4gb25seSBiZSAKPiBib290ZWQgb24gRUZJIHN5c3RlbXMuwqAgVGhhdCBtYXkgYmUgYSByZWFz
b25hYmxlIHRoaW5nIHRvIGRvIGF0IHNvbWUgCj4gcG9pbnQgaW4gdGhlIGZ1dHVyZSBpZiBFRkkg
ZW5kcyB1cCB3aWRlbHkgaW1wbGVtZW50ZWQsIGJ1dCBpdCdkIGJlIGEgCj4gaGVhZGFjaGUgdG9k
YXkgd2l0aCBFRkkgbm90IGJlaW5nIGFsbCB0aGF0IGNvbW1vbi4KPgpUaGlzIG9wdGlvbiBpcyBz
dHJhaWdodC1mb3J3YXJkLCBpcyBFRkkgYm9vdCB3aWRlbHkgdXNlZCBpbiB4ODYvQVJNIApzZXJ2
ZXIsIEkgaGF2ZSBubyBzdGF0aXN0aWNzIGFib3V0IGl0LCBidXQgaXQgc2hvdWxkIGJlIHVzZWQg
d2lkZWx5LMKgIAphbmQgZm9yIFJJU0NWLCBpdCB3aWxsIG9uZSBkYXksIElNTy4KPiBBbm90aGVy
IG9wdGlvbiB3b3VsZCBiZSB0byBqdXN0IGZvcm1hbGl6ZSB0aGUgZmlyc3QgZm91ciBieXRlcyBv
ZiB0aGUgCj4gSW1hZ2UgZm9ybWF0IGFzIG5vdCBhY3R1YWxseSBiZWluZyBpbnN0cnVjdGlvbnMs
IGJ1dCBiZWluZyBhIGhlYWRlciAKPiB0aGF0IGRlc2NyaWJlcyB3aGVyZSB0byBiZWdpbiBleGVj
dXRpb24gZnJvbS7CoCBUaGF0IHdvdWxkIGJlIGFuIEFCSSAKPiBicmVhayBhbmQgdGhlcmVmb3Ig
d291bGQgcmVxdWlyZSBjaGFuZ2luZyB0aGUgSW1hZ2UgZm9ybWF0LCBidXQgd2UnZCAKPiBkbyBp
dCBpbiBhIHdheSB0aGF0J3MgQUJJLWNvbXBhdGlibGUgZm9yIEMgc3lzdGVtcyBhbmQgd2UnZCBt
YWludGFpbiAKPiB0aGUgb2xkIEltYWdlIGZvcm1hdCBmb3IgdGhlIG9sZCBzeXN0ZW1zLsKgIFRo
YXQncyBub3QgcmVhbGx5IG11Y2ggCj4gY29kZSwgYnV0IGl0IGlzIGEgYml0IG9mIGEgaGVhZGFj
aGUgb24gdGhlIHNwZWNpZmljYXRpb24gc2lkZS7CoCAKPiBQcm9iYWJseSB0b28gbXVjaCB0byBi
ZSB3b3J0aCBpdCwgYXMgaWYgcGVvcGxlIHJlYWxseSB3YW50IEVGSSBvbiAKPiB0aGVzZSBzeXN0
ZW1zIHRoZW4gRUZJIHdpbGwgcHJvYmFibHkgYmUgY29tbW9uIGVub3VnaCB0aGF0IHdlJ2xsIGFs
bCAKPiBiZSBydW5uaW5nIGl0Lgo+IEkgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gZG8gYW55IG9mIHRo
YXQsIHNvIEknbSBnb2luZyB0byBqdXN0IGhvcGUgd2UgCj4gZ2V0IGx1Y2t5IGFuZCBkb24ndCBl
bmQgdXAgd2l0aCBub24tQyBoYXJkd2FyZSB0aGF0IGFueW9uZSB3YW50cyB0byAKPiBydW4gRUZJ
IG9uLgoKVGhlIFJJU0NWIGlzIGdyb3dpbmcgdmVyeSBxdWlja2x5LCBhbmQgdmVuZG9yIGNvdWxk
IGRvIHNvbWUgY3VzdG9taXplLCAKc28gSSB0aGluayBub24tQyBoYXJkd2FyZSBpcyBsaWtlbHkg
dG8gZXhpc3QgaW4gdGhlIGZ1dHVyZSA6KQoKVGhhbmtzIGFsbCzCoCBnb3QgdGhlIHN0YXR1cyBi
ZXR3ZWVuIEMgYW5kIEVGSS4KCgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo+IC4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
