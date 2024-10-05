Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06AECFB42B
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 19:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHXmcmYl1wP7D+mVlr6UKXEZEcumZmgpIjrzHN+YZJ8=; b=hR6hSe+/hSGjgc
	pvl5TP6rgEZBhNUvRttccHisCQPDbjRqLfXXcpSCvhml9t9luKe9ODi3zFM+ZNtYP4BdWj79GQnhI
	7LPno+Lv4dSkqqaI19vO7XDe7DRWRpDovN0+7GUCELTeTUN7Zgyi/znR1092Txxw6GQM8PP6t5Etc
	S2akNV+LiowWnAC+xsoQLDCtRHhasXTXL2KgSVk4DTHCACNfuzwAQB2X2sDkS4sPA8diZP09dnsci
	Q3eth1Coc3cDk8DlXVxSPeeK5ggly8vu73wLAQ501Gq8DC+XgcEDUq2IBhpGpLvGhMQkqbfTqrV6g
	heF76+3KYdETh4Ae+s6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAgP-0000000FodF-3oJ3;
	Sat, 05 Oct 2024 19:43:17 +0000
Received: from smtp-23.smtpout.orange.fr ([80.12.242.23] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAgL-0000000Focd-3Fcp
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:43:15 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id xAgGsMYyMHPunxAgGsZaMT; Sat, 05 Oct 2024 21:43:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1728157390;
	bh=uVTxSZ1QCpD+AHyNGxez/F+Qz/tYFhVlU8T4Mvuja4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=SbdM5s44g1/SP9yUNyzsQAX/07lA+C513byvOzb46p4ls0i/2quldk7bF1wkMnqnB
	 rJFBhM8O+qEG7Txwp1MmetMiL1wXQBvDf5geLsOUQcHbwx7tRdugZk/pH9bOZbwk/C
	 mFkHioOqoc2IjaR/hd+Pb+nmXdmequ0QEGVSMVeSxDwOb6pROK5zRKZ/NVfitv5Czs
	 UVerpYtDVyjSjJ/3cdzfYx+giUSy6MRUCzklxdM+zpg/VxjvhPjUvNM81DWp6b8Zex
	 H3/UyVtgryFvzfJusVVxnZUVn1rLjhCJ7vSJNDPO2hodqSWob5mzEdjdu3eyOlka3b
	 oobPrkuSHNFug==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 05 Oct 2024 21:43:10 +0200
X-ME-IP: 90.11.132.44
Message-ID: <a42a738a-b52d-4ff9-ac21-cffd808bc055@wanadoo.fr>
Date: Sat, 5 Oct 2024 21:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
 <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_124314_112646_29E1AB2B 
X-CRM114-Status: GOOD (  14.72  )
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

TGUgMDUvMTAvMjAyNCDDoCAyMTozNSwgRHJldyBGdXN0aW5pIGEgw6ljcml0wqA6Cj4gQ29udmVy
dCB0aDE1MjBfcGluY3RybF9kdF9ub2RlX3RvX21hcCgpIHRvIHVzZSBndWFyZGVkIG11dGV4IGZv
cgo+IHRocC0+bXV0ZXguCj4gCj4gU3VnZ2VzdGVkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxkZnVzdGlu
aUB0ZW5zdG9ycmVudC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC10aDE1
MjAuYyB8IDggKysrLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4gCgpIaSwKCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9waW5j
dHJsLXRoMTUyMC5jIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMKPiBpbmRleCA5
MzMxZjQ0NjI0ODAuLmQwM2EwYTM0MjIwYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwv
cGluY3RybC10aDE1MjAuYwo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLXRoMTUyMC5j
Cj4gQEAgLTQyNSw3ICs0MjUsNyBAQCBzdGF0aWMgaW50IHRoMTUyMF9waW5jdHJsX2R0X25vZGVf
dG9fbWFwKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwKPiAgIAlpbnQgcmV0Owo+ICAgCj4g
ICAJbm1hcHMgPSAwOwo+IC0JZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxkX29mX25vZGUobnAsIGNo
aWxkKSB7Cj4gKwlmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZV9zY29wZWQobnAsIGNo
aWxkKSB7CgpVc2luZyBfc2NvcGVkIGl0ZXJhdG9yIGlzIG5vdCBkZXNjcmliZWQgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLgpJcyBpdCBleHBlY3RlZCB0byBiZSBwYXJ0IG9mIHRoaXMgcGF0Y2g/CgpJ
ZiB5ZXMsIHRoZSAib2Zfbm9kZV9wdXQoY2hpbGQpOyIganVzdCBhIGZldyBsaW5lcyBiZWxvdyBz
aG91bGQgYmUgcmVtb3ZlZC4KCj4gICAJCWludCBucGlucyA9IG9mX3Byb3BlcnR5X2NvdW50X3N0
cmluZ3MoY2hpbGQsICJwaW5zIik7Cj4gICAKPiAgIAkJaWYgKG5waW5zIDw9IDApIHsKPiBAQCAt
NDQ0LDggKzQ0NCw4IEBAIHN0YXRpYyBpbnQgdGgxNTIwX3BpbmN0cmxfZHRfbm9kZV90b19tYXAo
c3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LAo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAgIAo+
ICAgCW5tYXBzID0gMDsKPiAtCW11dGV4X2xvY2soJnRocC0+bXV0ZXgpOwo+IC0JZm9yX2VhY2hf
YXZhaWxhYmxlX2NoaWxkX29mX25vZGUobnAsIGNoaWxkKSB7Cj4gKwlndWFyZChtdXRleCkoJnRo
cC0+bXV0ZXgpOwo+ICsJZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxkX29mX25vZGVfc2NvcGVkKG5w
LCBjaGlsZCkgewoKU2FtZSBoZXJlLi4uCgo+ICAgCQl1bnNpZ25lZCBpbnQgcm9sbGJhY2sgPSBu
bWFwczsKPiAgIAkJZW51bSB0aDE1MjBfbXV4dHlwZSBtdXh0eXBlOwo+ICAgCQlzdHJ1Y3QgcHJv
cGVydHkgKnByb3A7Cj4gQEAgLTUzMCw3ICs1MzAsNiBAQCBzdGF0aWMgaW50IHRoMTUyMF9waW5j
dHJsX2R0X25vZGVfdG9fbWFwKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwKPiAgIAo+ICAg
CSptYXBzID0gbWFwOwo+ICAgCSpudW1fbWFwcyA9IG5tYXBzOwo+IC0JbXV0ZXhfdW5sb2NrKCZ0
aHAtPm11dGV4KTsKPiAgIAlyZXR1cm4gMDsKPiAgIAo+ICAgZnJlZV9jb25maWdzOgo+IEBAIC01
MzgsNyArNTM3LDYgQEAgc3RhdGljIGludCB0aDE1MjBfcGluY3RybF9kdF9ub2RlX3RvX21hcChz
dHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsCj4gICBwdXRfY2hpbGQ6Cj4gICAJb2Zfbm9kZV9w
dXQoY2hpbGQpOwoKLi4uIHRoaXMgc2hvdWxkIGJlIHJlbW92ZWQsIGFuZCBtYXliZSB0aGUgbGFi
ZWwgcmVuYW1lZC4KCkNKCgo+ICAgCXRoMTUyMF9waW5jdHJsX2R0X2ZyZWVfbWFwKHBjdGxkZXYs
IG1hcCwgbm1hcHMpOwo+IC0JbXV0ZXhfdW5sb2NrKCZ0aHAtPm11dGV4KTsKPiAgIAlyZXR1cm4g
cmV0Owo+ICAgfQo+ICAgCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
