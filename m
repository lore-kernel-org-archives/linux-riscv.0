Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BA3C27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jun 2024 23:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70KiMrhs9V/Cu0Bc/67wue5jiKx7luXZPOD1z8IUNOU=; b=xu4Atn6fIj2hoN
	mcH2NY7ba48rqIC1r/2qqYYJn06ESIpdIwOy7MnH8vvMxR8fV2Gmkj0MdszNjXpzypfl+ciizY2jg
	DPEgxjk4W7Hc2nX2k6hJaeuhaoU1WDebBufi74KHF/WchgIL6gH7PmXYrbvS0yBZ4kdMX7aBnc64/
	evGZ36n8cYT14lMXY5S1q2Wq9X9kvxdNMXdtdtwx60R7c3aAF8Ryn3H5sO2TWf3Cwc1VDH0Q+3OEV
	a+/XfUOg8mtPidcJQp7VQOF7ileonY8sd1xUwJGfyPsf6U/eZv8BIlgIxcRC9YQVpZbILSukZKqmw
	UKlaZTypoVKvas1xg3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLWLg-0000000EzrZ-2y38;
	Sun, 23 Jun 2024 23:10:17 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLWLb-0000000Ezq6-3RLh
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jun 2024 23:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=milkv.io;
	s=pmbt2212; t=1719184152;
	bh=c1FNIYKWK2v/CHo6YcQ80GNZCeRUA6RKed6FfWTijXY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=cRD8faYiyjEljLSBnN4JrMpn/8+BflswiXAs0xDYYcVEmXsW1Z2uN7auNdd9XGb3e
	 EYceAH4NNcEv0WRTIOgjpeJPyCF7G7ODZ4f9eGJF13+MRv1dceoE6JLuQxbhZeR0g5
	 S7iXgynjBb6jUIOgws2W1a/Z8UHsLCnThQPw8efg=
X-QQ-mid: bizesmtpsz10t1719184150t1mqgn
X-QQ-Originating-IP: c0Hs9XbuCd2FmITUynqFI5aLu5qHBI4STk38ou+Ta8Q=
Received: from [192.168.159.131] ( [106.150.157.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 24 Jun 2024 07:09:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7920811834183669360
Message-ID: <2C13D76B7FA9727D+6cf7c812-5cf9-4fd6-a79b-8f2899c7c3de@milkv.io>
Date: Mon, 24 Jun 2024 08:09:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: starfive: enable heartbeat LED for Milk-V
 Mars
From: FUKAUMI Naoki <naoki@milkv.io>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, kernel@esmil.dk
References: <20240613024827.36512-1-naoki@milkv.io>
 <20240613024827.36512-2-naoki@milkv.io>
 <8ceef5c1-03b3-4468-96e3-d86db5434e82@canonical.com>
 <AC74C056BD8A7945+7d7e4fa9-25e6-40a0-b571-ff3d01cb575f@milkv.io>
Content-Language: en-US
In-Reply-To: <AC74C056BD8A7945+7d7e4fa9-25e6-40a0-b571-ff3d01cb575f@milkv.io>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:milkv.io:qybglogicsvrgz:qybglogicsvrgz8a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_161012_780229_DE1672FB 
X-CRM114-Status: GOOD (  12.86  )
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

SGksCgpPbiA2LzIxLzI0IDEwOjAyLCBGVUtBVU1JIE5hb2tpIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDYvMjEvMjQgMDg6MTMsIEhlaW5yaWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4+IE9uIDYvMTMvMjQg
MDQ6NDgsIEZVS0FVTUkgTmFva2kgd3JvdGU6Cj4+PiBNaWxrLVYgTWFycyBoYXMgYSBncmVlbiBM
RUQgdG8gc2hvdyBzeXN0ZW0gbG9hZC4gVGhpcyBwYXRjaCBlbmFibGVzCj4+PiBhIGdyZWVuIExF
RCBhcyBhIGhlYXJ0YmVhdCBMRUQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRlVLQVVNSSBOYW9r
aSA8bmFva2lAbWlsa3YuaW8+Cj4+PiAtLS0KPj4+IMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3Rh
cmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzIHwgMTMgKysrKysrKysrKysrKwo+Pj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMgCj4+PiBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzCj4+PiBpbmRleCBm
YTBlYWM3OGUwYmEuLjRmNGJiZjY0ZGJlNCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzCj4+PiArKysgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1taWxrdi1tYXJzLmR0cwo+Pj4gQEAgLTQsMTEgKzQs
MjQgQEAKPj4+IMKgwqAgKi8KPj4+IMKgIC9kdHMtdjEvOwo+Pj4gKyNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9ncGlvL2dwaW8uaD4KPj4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbGVkcy9jb21tb24u
aD4KPj4+IMKgICNpbmNsdWRlICJqaDcxMTAtY29tbW9uLmR0c2kiCj4+PiDCoCAvIHsKPj4+IMKg
wqDCoMKgwqAgbW9kZWwgPSAiTWlsay1WIE1hcnMiOwo+Pj4gwqDCoMKgwqDCoCBjb21wYXRpYmxl
ID0gIm1pbGt2LG1hcnMiLCAic3RhcmZpdmUsamg3MTEwIjsKPj4+ICsKPj4+ICvCoMKgwqAgbGVk
cyB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJncGlvLWxlZHMiOwo+Pj4gKwo+
Pj4gK8KgwqDCoMKgwqDCoMKgIGxlZC0wIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdw
aW9zID0gPCZhb25ncGlvIDMgR1BJT19BQ1RJVkVfSElHSD47Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBjb2xvciA9IDxMRURfQ09MT1JfSURfR1JFRU4+Owo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbGludXgsZGVmYXVsdC10cmlnZ2VyID0gImhlYXJ0YmVhdCI7Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9IRUFSVEJFQVQ7Cj4+Cj4+
IEFjY29yZGluZyB0byB0aGUgc2NoZW1hdGljcyB0aGUgU3RhckZpdmUgVmlzaW9uRml2ZSAyIGJv
YXJkIGxpa2UgdGhlIAo+PiBNYXJzIGJvYXJkIGhhcyBSR1BJTzMgY29ubmVjdGVkIHRvIGEgZ3Jl
ZW4gTEVEIHRvIGRpc3BsYXkgdGhlIHBvd2VyIAo+PiBzdGF0dXMuIFNob3VsZG4ndCB3ZSBjb25z
aWRlciBib3RoIGJvYXJkcz8KPiAKPiBJIHRoaW5rIExFRCB1c2FnZSBpcyB2ZW5kb3IvYm9hcmQg
c3BlY2lmaWMuCgpkbyBJIG5lZWQgdG8gZG8gc29tZXRoaW5nIGZvciBWRjIgdG8gbWVyZ2UgbXkg
cGF0Y2g/CgotLQpGVUtBVU1JIE5hb2tpClNoZW56aGVuIE1pbGtWIFRlY2hub2xvZ3kgQ28uLCBM
dGQuCgo+IEJlc3QgcmVnYXJkcywKPiAKPiAtLSAKPiBGVUtBVU1JIE5hb2tpCj4gU2hlbnpoZW4g
TWlsa1YgVGVjaG5vbG9neSBDby4sIEx0ZC4KPiAKPj4gQmVzdCByZWdhcmRzCj4+Cj4+IEhlaW5y
aWNoCj4+Cj4+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICvCoMKgwqAgfTsKPj4+IMKgIH07Cj4+
PiDCoCAmZ21hYzAgewo+Pgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
