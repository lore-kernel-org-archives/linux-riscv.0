Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C943C2BA18
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 01:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/n+uh7Mjp8i3HgQIvft7YsbQyIEXBvN6U2Q8aqHKSW0=; b=qF9Xoe1gukDBE4
	P0Us0ljCJb0yPIA2R3NkZmDFd9KTpbwnVBVDtPI62JB4mPCvB1CUZW6ML86xn8s9Ucl+h9jPO3Y2X
	AV0h7Vp7HQaHWpEUr9i/gl9Zcdju17foFmITR4xlPMaQu+NKowQlOjHinGIulRX50FGJd37FqVZHj
	fsPZYqBxBCCLKkcCSRarry0z6nBfse7QPNyidvGdiB7NS7vE9zACgdjnd1VtSenzavb+zLX607A2n
	p38z9DHeebpN8Hpy4IpU8dU1ttNklCakiIYkyjgGq6JLDj2O7OY7fcoqAbRBCWSzQL04n3kxMcUuh
	dGt8iHTQRPULr9a6434Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKSgH-00000007HqM-2pQK;
	Fri, 21 Jun 2024 01:03:09 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKSgF-00000007Hp8-0sLI
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 01:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=milkv.io;
	s=pmbt2212; t=1718931750;
	bh=OOnXnpfjNpMMeI7D5CG1cn0mBZZguiF2GaV0QN+Mjx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=rfAzRzQlyQdRAuDqRhfNE63A6IUqLaWf46Dm9W9RWcPy+BgCs9FmzVPpYqIffwcO+
	 5I+d6USc8fEkPFJtoqAF19/nBYZym6UOlD7/T91M3Ww5ZrxmoRxqsvE8U+pZpJLmCq
	 bLGNfYFSsjqGzaXSqJKUA5CqG7zcDLXdBx14L7HQ=
X-QQ-mid: bizesmtpsz5t1718931749te96ozg
X-QQ-Originating-IP: zjYGwuMdIrwIDDvfKZ5cWx2aSQlpvGNYvMQAT1lIQ5I=
Received: from [192.168.159.131] ( [106.150.157.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 21 Jun 2024 09:02:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8327780796254329127
Message-ID: <AC74C056BD8A7945+7d7e4fa9-25e6-40a0-b571-ff3d01cb575f@milkv.io>
Date: Fri, 21 Jun 2024 10:02:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: starfive: enable heartbeat LED for Milk-V
 Mars
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, kernel@esmil.dk
References: <20240613024827.36512-1-naoki@milkv.io>
 <20240613024827.36512-2-naoki@milkv.io>
 <8ceef5c1-03b3-4468-96e3-d86db5434e82@canonical.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@milkv.io>
In-Reply-To: <8ceef5c1-03b3-4468-96e3-d86db5434e82@canonical.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:milkv.io:qybglogicsvrsz:qybglogicsvrsz4a-2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_180307_627689_BF943B3A 
X-CRM114-Status: GOOD (  10.96  )
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

SGksCgpPbiA2LzIxLzI0IDA4OjEzLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+IE9uIDYv
MTMvMjQgMDQ6NDgsIEZVS0FVTUkgTmFva2kgd3JvdGU6Cj4+IE1pbGstViBNYXJzIGhhcyBhIGdy
ZWVuIExFRCB0byBzaG93IHN5c3RlbSBsb2FkLiBUaGlzIHBhdGNoIGVuYWJsZXMKPj4gYSBncmVl
biBMRUQgYXMgYSBoZWFydGJlYXQgTEVELgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGVUtBVU1JIE5h
b2tpIDxuYW9raUBtaWxrdi5pbz4KPj4gLS0tCj4+IMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3Rh
cmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzIHwgMTMgKysrKysrKysrKysrKwo+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMgCj4+IGIvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMKPj4gaW5kZXggZmEwZWFj
NzhlMGJhLi40ZjRiYmY2NGRiZTQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzCj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnMuZHRzCj4+IEBAIC00LDExICs0LDI0IEBACj4+
IMKgwqAgKi8KPj4gwqAgL2R0cy12MS87Cj4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9n
cGlvLmg+Cj4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbGVkcy9jb21tb24uaD4KPj4gwqAgI2lu
Y2x1ZGUgImpoNzExMC1jb21tb24uZHRzaSIKPj4gwqAgLyB7Cj4+IMKgwqDCoMKgwqAgbW9kZWwg
PSAiTWlsay1WIE1hcnMiOwo+PiDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibWlsa3YsbWFycyIs
ICJzdGFyZml2ZSxqaDcxMTAiOwo+PiArCj4+ICvCoMKgwqAgbGVkcyB7Cj4+ICvCoMKgwqDCoMKg
wqDCoCBjb21wYXRpYmxlID0gImdwaW8tbGVkcyI7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGxl
ZC0wIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3Bpb3MgPSA8JmFvbmdwaW8gMyBHUElP
X0FDVElWRV9ISUdIPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29sb3IgPSA8TEVEX0NP
TE9SX0lEX0dSRUVOPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGludXgsZGVmYXVsdC10
cmlnZ2VyID0gImhlYXJ0YmVhdCI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZ1bmN0aW9u
ID0gTEVEX0ZVTkNUSU9OX0hFQVJUQkVBVDsKPiAKPiBBY2NvcmRpbmcgdG8gdGhlIHNjaGVtYXRp
Y3MgdGhlIFN0YXJGaXZlIFZpc2lvbkZpdmUgMiBib2FyZCBsaWtlIHRoZSAKPiBNYXJzIGJvYXJk
IGhhcyBSR1BJTzMgY29ubmVjdGVkIHRvIGEgZ3JlZW4gTEVEIHRvIGRpc3BsYXkgdGhlIHBvd2Vy
IAo+IHN0YXR1cy4gU2hvdWxkbid0IHdlIGNvbnNpZGVyIGJvdGggYm9hcmRzPwoKSSB0aGluayBM
RUQgdXNhZ2UgaXMgdmVuZG9yL2JvYXJkIHNwZWNpZmljLgoKQmVzdCByZWdhcmRzLAoKLS0KRlVL
QVVNSSBOYW9raQpTaGVuemhlbiBNaWxrViBUZWNobm9sb2d5IENvLiwgTHRkLgoKPiBCZXN0IHJl
Z2FyZHMKPiAKPiBIZWlucmljaAo+IAo+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gK8KgwqDCoCB9
Owo+PiDCoCB9Owo+PiDCoCAmZ21hYzAgewo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
