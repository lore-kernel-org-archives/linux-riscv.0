Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA30C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 11:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	To:Subject:MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+N5QUx+7ud5g8evEMp8mxl5Lq6N/FSwtwecyQJl3jk=; b=RTOVlUoweWTUUT
	uEmSRNCjaIlLXf1vvG78yJtT3SkFCR91iJ0pPolCo0Xr0DCh0bx+p0KJl9iYSF8bBbhl4zWby2Vs9
	NnSl9a7dBZ6TZVCLKVIqLT2f3Hbl5JIo3p0UcOZ1dfBsQoVkNbrW1+a1K/u6gSUrcnVm6OJJUnOBL
	7LmDifmmKJuJ4WcSOiwRuR8/e8/Ngk/W4jJxhsxJka4mW8eL5QkvfwCB+NtQEDynTzmL+Ps2GhVk+
	/ypL1t4QzP1CudtwPTbqe9MEIDjId9RhSK5tZr7lFAtptfNnr+HhY7pXq2la1c0w7M8IhlJ8pLkYz
	o9gWbkB1tC921Ac+Q/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBYKy-0000000Eg4r-1uOH;
	Mon, 27 May 2024 11:16:20 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBYKu-0000000Eg3U-4B9I
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 11:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=1SX+hjPO8iXzPnEmnZdrhvcBPehECadE4WnLUAtHG/s=; t=1716808577;
	x=1717240577; b=esZHF0VVNbZKOwbyl90UdnFj4LYU5uxZ4xUCi7iS7ryLC92DaoKZKC9mYd44E
	hg4BPywcp4abeQplqix55b6WcLGkWC8zZoWkQ4tfo6kWBmxjQsBlwnkfXLoVj5Txue6GxXxU9RA4O
	1FxBF8D8B32SCVOZC6wirFcXHDOBimizoHZF/sC/gJhND6HbRKrZY67VlYfJNq1wbWVELMXLwoT+S
	XecXJ8lOd8mYiV3Bu5hB69AaZUIvhMKoL4PMFrtYd6jbBZRZgCvxuHq4TCYgqL4HKFF2KTsp8nvvU
	Mh7PyYEMK+AkdgfBBqYdrTqyEhG9RzVcHkfloxgPraBOtiLJCQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sBYKk-0003Yd-SU; Mon, 27 May 2024 13:16:06 +0200
Message-ID: <d7f0c16a-0d83-4060-8d95-95b293d95dfd@leemhuis.info>
Date: Mon, 27 May 2024 13:16:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clkdev: report over-sized strings when creating clkdev
To: Ron Economos <re@w6rz.net>, Guenter Roeck <linux@roeck-us.net>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 regressions@lists.linux.dev, linux-clk@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <28114882-f8d7-21bf-4536-a186e8d7a22a@w6rz.net>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <28114882-f8d7-21bf-4536-a186e8d7a22a@w6rz.net>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716808577;ed289632;
X-HE-SMSGID: 1sBYKk-0003Yd-SU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_041617_205482_7AA1536E 
X-CRM114-Status: GOOD (  21.57  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjcuMDUuMjQgMTI6NDUsIFJvbiBFY29ub21vcyB3cm90ZToKPiBPbiBGcmksIE1heSAxNywg
MjAyNCBhdCAwMzowOToxNFBNIC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+Pgo+PiBPbiBG
cmksIE1hciAxNSwgMjAyNCBhdCAxMTo0Nzo1NUFNICswMDAwLCBSdXNzZWxsIEtpbmcgKE9yYWNs
ZSkgd3JvdGU6Cj4+ID4gUmVwb3J0IGFuIGVycm9yIHdoZW4gYW4gYXR0ZW1wdCB0byByZWdpc3Rl
ciBhIGNsa2RldiBlbnRyeSByZXN1bHRzIGluIGEKPj4gPiB0cnVuY2F0ZWQgc3RyaW5nIHNvIHRo
ZSBwcm9ibGVtIGNhbiBiZSBlYXNpbHkgc3BvdHRlZC4KPj4gPgo+PiA+IFJlcG9ydGVkIGJ5OiBE
dWFucWlhbmcgV2VuIDxkdWFucWlhbmd3ZW5AbmV0LXN3aWZ0LmNvbT4KPj4gPiBTaWduZWQtb2Zm
LWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+
PiA+IFJldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4+Cj4+IFdp
dGggdGhpcyBwYXRjaCBpbiB0aGUgbWFpbmxpbmUga2VybmVsLCBJIGdldAo+PiBbLi4uXQo+PiB3
aGVuIHRyeWluZyB0byBib290IHNpZml2ZV91IGluIHFlbXUuCj4+Cj4+IEFwcGFyZW50bHksICIx
MDAwMDAwMC5jbG9jay1jb250cm9sbGVyIiBpcyB0b28gbG9uZy4gQW55IHN1Z2dlc3Rpb24gb24K
Pj4gaG93IHRvIHNvbHZlIHRoZSBwcm9ibGVtID8gSSBndWVzcyB1c2luZyBkZXZfbmFtZShkZXYp
IGFzIGRldl9pZAo+IHBhcmFtZXRlcgo+PiBmb3IgY2xrX2h3X3JlZ2lzdGVyX2Nsa2RldigpIGlz
IG5vdCBvciBubyBsb25nZXIgYSBnb29kIGlkZWEuCj4+IFdoYXQgZWxzZSBzaG91bGQgYmUgdXNl
ZCBpbnN0ZWFkID8KPiAKPiBUaGlzIGlzc3VlIGNhdXNlcyBhIGNvbXBsZXRlIGJvb3QgZmFpbHVy
ZSBvbiByZWFsIGhhcmR3YXJlIChTaUZpdmUKPiBVbm1hdGNoZWQpLgoKSG1tbS4gVGhhdCBhbmQg
YmVjYXVzZSBub2JvZHkgYWZhaWNzIGhhcyB0aW1lL21vdGl2YXRpb24gdG8gZml4IHRoaXMKYW55
dGltZSBzb29uIChvciBhbSBJIG1pc3Rha2VuIHRoZXJlPykgbWFrZXMgbWUgd29uZGVyIGlmIHdl
IHNob3VsZApyZXZlcnQgdGhpcyBjaGFuZ2UgZm9yIG5vdyAoYW5kIHJlbWVyZ2UgaXQgbGF0ZXIg
b25jZSB0aGUgcHJvYmxlbSB0aGlzCmNoYW5nZSBleHBvc2VkIHdhcyBmaXhlZCkuIE9yIGlzIGFu
b3RoZXIgc29sdXRpb24gaW4gc2lnaHQgc29tZXdoZXJlPwoKQ2lhbywgVGhvcnN0ZW4KCj4gVGhl
IGJvb3Qgb25seSBnZXRzIGFzIGZhciBhcyAiU3RhcnRpbmcga2VybmVsIC4uLiIgd2l0aCBubwo+
IG90aGVyIGluZGljYXRpb24gb2Ygd2hhdCdzIGdvaW5nIG9uLgo+IAo+IEd1ZW50ZXIncyBzdWdn
ZXN0ZWQgcGF0Y2ggc29sdmVzIHRoZSBpc3N1ZS4KPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
bGsvc2lmaXZlL3NpZml2ZS1wcmNpLmMKPiBiL2RyaXZlcnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJj
aS5jCj4gaW5kZXggMjViOGUxYTgwZGRjLi4yMGNjOGY0MmQ5ZWIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9jbGsvc2lmaXZlL3NpZml2ZS1wcmNpLmMKPiArKysgYi9kcml2ZXJzL2Nsay9zaWZpdmUv
c2lmaXZlLXByY2kuYwo+IEBAIC01MzcsNyArNTM3LDcgQEAgc3RhdGljIGludCBfX3ByY2lfcmVn
aXN0ZXJfY2xvY2tzKHN0cnVjdCBkZXZpY2UKPiAqZGV2LCBzdHJ1Y3QgX19wcmNpX2RhdGEgKnBk
LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gcjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgciA9IGNsa19od19yZWdpc3Rlcl9jbGtkZXYoJnBpYy0+aHcs
IHBpYy0+bmFtZSwKPiBkZXZfbmFtZShkZXYpKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByID0gY2xrX2h3X3JlZ2lzdGVyX2Nsa2RldigmcGljLT5odywgcGljLT5uYW1lLCAicHJj
aSIpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyKSB7Cj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJuKGRldiwg
IkZhaWxlZCB0byByZWdpc3RlciBjbGtkZXYgZm9yCj4gJXM6ICVkXG4iLAo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
bml0Lm5hbWUsIHIpOwo+IAo+IAo+IAoKI3JlZ3pib3QgZHVwOgpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzdlZGE3NjIxLTBkZGUtNDE1My04OWU0LTE3MmU0YzA5NWQwMUByb2Vjay11cy5u
ZXQvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
