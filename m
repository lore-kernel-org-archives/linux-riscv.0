Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7965BC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3GVAhTTaoH8gNYl+ryq/Jthc3RYEBmFwEbVVwvKVrU=; b=E2ZaVwEErcIWNL
	PwLJcXF6emlZ3khCfrGSeh++BDjtlDLDh2K3VJqWlvJ3RjwsDybmMaXtxUQigPVc3eV+m1VMKS2mN
	SD5vn+hXXAKm1IEop55Rs4ZuK04PxRItF46N25/3gBky+ClzKJYN3oOcs+jo7/sVbUPp75rP00ITj
	YuLv/pVeG+ZHASmEGDuMl4huaKN5AY5v49EOpfJ+lX1bU5a1PfRsKsOf/ncOyPVfFm4M38+suuR/F
	bSvhQzmFIMLTSh9bgpdTDHxSS9yoQUgmftY1cZwos+rfoUNQ4upodz182mhwIxhC1pOkMdairCSKf
	DvneE6FVDsVRBH1E1xHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwjUp-0000000CRtH-0303;
	Tue, 16 Apr 2024 14:09:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwjUh-0000000CRsJ-34iY;
	Tue, 16 Apr 2024 14:09:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E52A06122D;
	Tue, 16 Apr 2024 14:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEE9C4AF0A;
	Tue, 16 Apr 2024 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713276546;
	bh=VpiBOyduHlcT5sitsX5cm2upCEOifFlYiu20YiiyzeY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HuleBCGZSPRpaxRNM76UXKsEIhVSJ3o9QyrSsYfKS2opt2asaKR9YXIRiRSIUMYf0
	 FBiZNMENQ+4r88trn4DDDh3cM1F/mbJ2EUVa84+mZXHyZsUsRgDa3AJ1pgP+6AIavc
	 DJOzoBQwRd6wbl0K+SRHwgkfvU0ja4l34HeqylsrGAizNp4M7XL7GqwdJQ7VSljFUt
	 JMDL8+kirIq/v7TjPRcHzkt2VZILBaS4EzgbfX77WkTNYPbtNWiBIgLMF8uLy60LYA
	 GplMDtCvGf9lo3oy3Jrz4nwcyLLvqK5+j6wHyj3rm5OEn0lV1j1j5bhP/5gRnFanBM
	 akB9zPD7t1nCg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huawei.com>, Xu Kuohai <xukuohai@huaweicloud.com>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Cc: Ivan Babrou <ivan@cloudflare.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>
Subject: Re: [PATCH bpf-next 2/2] riscv, bpf: Fix incorrect runtime stats
In-Reply-To: <39b55f13-69a1-401e-b87e-1040e33c9368@huawei.com>
References: <20240416064208.2919073-1-xukuohai@huaweicloud.com>
 <20240416064208.2919073-3-xukuohai@huaweicloud.com>
 <39b55f13-69a1-401e-b87e-1040e33c9368@huawei.com>
Date: Tue, 16 Apr 2024 16:09:03 +0200
Message-ID: <871q754cxs.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_070907_843536_250BB4B1 
X-CRM114-Status: GOOD (  10.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4gd3JpdGVzOgoKPiBPbiAyMDI0LzQvMTYgMTQ6
NDIsIFh1IEt1b2hhaSB3cm90ZToKPj4gRnJvbTogWHUgS3VvaGFpIDx4dWt1b2hhaUBodWF3ZWku
Y29tPgo+PiAKPj4gV2hlbiBfX2JwZl9wcm9nX2VudGVyKCkgcmV0dXJucyB6ZXJvLCB0aGUgczEg
cmVnaXN0ZXIgaXMgbm90IHNldCB0byB6ZXJvLAo+PiByZXN1bHRpbmcgaW4gaW5jb3JyZWN0IHJ1
bnRpbWUgc3RhdHMuIEZpeCBpdCBieSBzZXR0aW5nIHMxIGltbWVkaWF0ZWx5IHVwb24KPj4gdGhl
IHJldHVybiBvZiBfX2JwZl9wcm9nX2VudGVyKCkuCj4+IAo+PiBGaXhlczogNDliNWU3N2FlM2Uy
ICgicmlzY3YsIGJwZjogQWRkIGJwZiB0cmFtcG9saW5lIHN1cHBvcnQgZm9yIFJWNjQiKQo+PiBT
aWduZWQtb2ZmLWJ5OiBYdSBLdW9oYWkgPHh1a3VvaGFpQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAg
IGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCA2ICsrKy0tLQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmMKPj4gaW5kZXggMTVlNDgyZjJjNjU3Li5lNzEzNzA0YmU4MzcgMTAwNjQ0Cj4+
IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4gKysrIGIvYXJjaC9yaXNj
di9uZXQvYnBmX2ppdF9jb21wNjQuYwo+PiBAQCAtNzMwLDYgKzczMCw5IEBAIHN0YXRpYyBpbnQg
aW52b2tlX2JwZl9wcm9nKHN0cnVjdCBicGZfdHJhbXBfbGluayAqbCwgaW50IGFyZ3Nfb2ZmLCBp
bnQgcmV0dmFsX29mCj4+ICAgCWlmIChyZXQpCj4+ICAgCQlyZXR1cm4gcmV0Owo+PiAgIAo+PiAr
CS8qIHN0b3JlIHByb2cgc3RhcnQgdGltZSAqLwo+PiArCWVtaXRfbXYoUlZfUkVHX1MxLCBSVl9S
RUdfQTAsIGN0eCk7Cj4+ICsKPj4gICAJLyogaWYgKF9fYnBmX3Byb2dfZW50ZXIocHJvZykgPT0g
MCkKPj4gICAJICoJZ290byBza2lwX2V4ZWNfb2ZfcHJvZzsKPj4gICAJICovCj4+IEBAIC03Mzcs
OSArNzQwLDYgQEAgc3RhdGljIGludCBpbnZva2VfYnBmX3Byb2coc3RydWN0IGJwZl90cmFtcF9s
aW5rICpsLCBpbnQgYXJnc19vZmYsIGludCByZXR2YWxfb2YKPj4gICAJLyogbm9wIHJlc2VydmVk
IGZvciBjb25kaXRpb25hbCBqdW1wICovCj4+ICAgCWVtaXQocnZfbm9wKCksIGN0eCk7Cj4+ICAg
Cj4+IC0JLyogc3RvcmUgcHJvZyBzdGFydCB0aW1lICovCj4+IC0JZW1pdF9tdihSVl9SRUdfUzEs
IFJWX1JFR19BMCwgY3R4KTsKPj4gLQo+PiAgIAkvKiBhcmcxOiAmYXJnc19vZmYgKi8KPj4gICAJ
ZW1pdF9hZGRpKFJWX1JFR19BMCwgUlZfUkVHX0ZQLCAtYXJnc19vZmYsIGN0eCk7Cj4+ICAgCWlm
ICghcC0+aml0ZWQpCj4KPiBUaGFua3MuCj4KPiBSZXZpZXdlZC1ieTogUHUgTGVodWkgPHB1bGVo
dWlAaHVhd2VpLmNvbT4KCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3Jn
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
