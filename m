Return-Path: <SRS0=+XCi=PL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0385C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 20:37:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 905C36052B
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 20:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 905C36052B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7M8FF/iLZK+l23icEhLJ+ezjcz2+RqOQKYt6bZWce0=; b=l81MdnqxLQKUu8Kf5kXV7lY1dg
	34pFyiZlxPsI/WVvdnJfP/dgsDK34OgEzuJJr7fdRWjik7NoGCcb4z9m07GyApe/BqKWeedYcYy3t
	vpVotfbCk4gXeedpvs5A6SOpH5cmK56ncUzG2qkxQcuuAxlMXfywYWTDGu8IaRbjbw4/yc8USGh2u
	Ghq7Ce/yohim+5SulD0R98xmrIwiEf2AzMMK+7YG/hrHoiCgHPHE2lu/YTndFSLY4k1t/YSVZdc8j
	Ay0Mi/sbaVfYgwLOI7yKev6h/QZLhrQeLn6THA1ymK8bmK8qse4UX7lvQhOfe+UBklv3hNhviG7iC
	dfJTJvsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meNlu-00DHdX-LZ; Sat, 23 Oct 2021 20:37:42 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meNl2-00DH8y-Ga; Sat, 23 Oct 2021 20:36:48 +0000
Subject: Re: [PATCH] riscv: cacheinfo: fix typo of homogenous
To: Palmer Dabbelt <palmer@dabbelt.com>, georgedanielmangum@gmail.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, peterz@infradead.org,
 wangkefeng.wang@huawei.com, will@kernel.org, tglx@linutronix.de,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-51275835-4c34-4099-85f5-13c6dbef4e19@palmerdabbelt-glaptop>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <750f6239-154d-9190-24ff-ece033add638@infradead.org>
Date: Sat, 23 Oct 2021 13:36:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <mhng-51275835-4c34-4099-85f5-13c6dbef4e19@palmerdabbelt-glaptop>
Content-Language: en-US
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

T24gMTAvMjMvMjEgMTozMCBQTSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gRnJpLCAwOCBP
Y3QgMjAyMSAxMzo1NjoyNSBQRFQgKC0wNzAwKSwgZ2VvcmdlZGFuaWVsbWFuZ3VtQGdtYWlsLmNv
bSB3cm90ZToKPj4gVXBkYXRlcyAnaG9tb25vZ2Vub3VzJyB0byAnaG9tb2dlbm91cycgaW4gY29t
bWVudC4KPiAKPiBJIGRvbid0IHJlYWxseSBrbm93IHNwZWxsaW5nIHRoYXQgd2VsbCwgYnV0IGNo
ZWNrcGF0Y2ggc2F5cwo+IAo+ICDCoMKgIFdBUk5JTkc6ICdob21vZ2Vub3VzJyBtYXkgYmUgbWlz
c3BlbGxlZCAtIHBlcmhhcHMgJ2hvbW9nZW5lb3VzJz8KPiAKPiB3aGVuIGFwcGx5aW5nIHRoaXMu
wqAgSXQgbG9va3MgbGlrZSB0aGV5J3JlIGJvdGggd29yZHMsIGJ1dCAiaG9tb2dlbmVvdXMiIGlz
IHRoZSByaWdodCBvbmU/Cj4gCgpJbnRlcm5ldCBzZWFyY2ggdG8gZ3JhbW1hci5jb20gc2F5czoK
ClRvIHN1bW1hcmlzZSwgRWFybGllciwgaG9tb2dlbm91cyB3YXMgdXNlZCBhcyBhIHNjaWVudGlm
aWMgdGVybSwgbWFpbmx5IGluIGJpb2xvZ3ksIGJ1dCBub3cgaXQgaXMgYWxtb3N0IG9ic29sZXRl
LCBiZWluZyByZXBsYWNlZCBieSBob21vbG9nb3VzLiBXaGVyZWFzLCBob21vZ2VuZW91cyBpcyBh
IGNvbW1vbiB3b3JkLCB2ZXJ5IG11Y2ggaW4gdXNlIGFuZCBtZWFucyBoYXZpbmcgc2ltaWxhciBv
ciBjb21wYXJhYmxlIGNoYXJhY3RlcmlzdGljcy4KClNldmVyYWwgd2ViIHNpdGVzIGFncmVlIHRo
YXQgaG9tb2dlbmVvdXMgaXMgY3VycmVudGx5IHByZWZlcmFibGUuCgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBoYXNoZWRkYW4gPGdlb3JnZWRhbmllbG1hbmd1bUBnbWFpbC5jb20+Cj4+IC0tLQo+PiDC
oGFyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIHwgMiArLQo+PiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYwo+
PiBpbmRleCA5MGRlYWJmZTYzZWEuLmZmOTg1NDZiMTE1MiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVp
bmZvLmMKPj4gQEAgLTI5LDcgKzI5LDcgQEAgc3RhdGljIHN0cnVjdCBjYWNoZWluZm8gKmdldF9j
YWNoZWluZm8odTMyIGxldmVsLCBlbnVtIGNhY2hlX3R5cGUgdHlwZSkKPj4gwqDCoMKgwqAgLyoK
Pj4gwqDCoMKgwqDCoCAqIFVzaW5nIHJhd19zbXBfcHJvY2Vzc29yX2lkKCkgZWxpZGVzIGEgcHJl
ZW1wdGFiaWxpdHkgY2hlY2ssIGJ1dCB0aGlzCj4+IMKgwqDCoMKgwqAgKiBpcyByZWFsbHkgaW5k
aWNhdGl2ZSBvZiBhIGxhcmdlciBwcm9ibGVtOiB0aGUgY2FjaGVpbmZvIFVBQkkgYXNzdW1lcwo+
PiAtwqDCoMKgwqAgKiB0aGF0IGNvcmVzIGhhdmUgYSBob21vbm9nZW5vdXMgdmlldyBvZiB0aGUg
Y2FjaGUgaGllcmFyY2h5LsKgIFRoYXQKPj4gK8KgwqDCoMKgICogdGhhdCBjb3JlcyBoYXZlIGEg
aG9tb2dlbm91cyB2aWV3IG9mIHRoZSBjYWNoZSBoaWVyYXJjaHkuwqAgVGhhdAo+PiDCoMKgwqDC
oMKgICogaGFwcGVucyB0byBiZSB0aGUgY2FzZSBmb3IgdGhlIGN1cnJlbnQgc2V0IG9mIFJJU0Mt
ViBzeXN0ZW1zLCBidXQKPj4gwqDCoMKgwqDCoCAqIGxpa2VseSB3b24ndCBiZSB0cnVlIGluIGdl
bmVyYWwuwqAgU2luY2UgdGhlcmUncyBubyB3YXkgdG8gcHJvdmlkZQo+PiDCoMKgwqDCoMKgICog
Y29ycmVjdCBpbmZvcm1hdGlvbiBmb3IgdGhlc2Ugc3lzdGVtcyB2aWEgdGhlIGN1cnJlbnQgVUFC
SSB3ZSdyZQoKCi0tIAp+UmFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
