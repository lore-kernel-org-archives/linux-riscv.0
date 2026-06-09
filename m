Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1868ACD8C85
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBse2vGljwt2SZCgTxXi3IiNZUIEAwHSzCCFhbtTyqg=; b=NyC+2FegOexxQ7
	CVEKSZSRkoBguFvz8eHdSRZyh3dnSiV/QTbRnna/anEpsGsQ6z6ZZTphcIfrmHN3kd1XzeB84XnH+
	ann/JNbVEwUWGHnIs3pw67Ia7xgDHZ2aMU5rOvr9shf4nS7NMV35yqvENSN45n0V861QZuCECPqXa
	hy/HkIzZLewV+bx6mSrMWTysTO0FaemHGJE1p+hTB0dQ+L/JygespJ52e/hz4+RDvHNcqu8OzsLF2
	fAANGHc33Z6k+gq/jkjznXLz6cwETFJ7UdCEmzqAP8sPhoL8Q78TkoTgxQJLVEAxVJc7gMY3A+bro
	H8Bh6B/5JwPyD+7NanyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXg-00000004n5l-0mi1;
	Tue, 09 Jun 2026 06:02:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpXa-00000004n1L-28N9;
	Tue, 09 Jun 2026 06:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Fcjd/zlFVY0nunhgxmUeD2hlkM4IOvznVuILW3ZgAOw=; b=krN+GmnIv3wjtM5nOaDm8iMv5b
	DBorLeRLfcUNsETz6kh0tsPhWM2gxHdB5pAPgpGSjCCvqdWlcyvqny//HPN5UUYtPfiMkRIbAlNjm
	SyzMIFXYyL08W4SyBjYZe9aFcOmYEv84jk5EidcXcvZUTfkLQbLmOtRGMiCIQeCYAzrJg/ZkYs14I
	opGn4xcEpx7ACav3C777+g5UkCbUSSE4VVy4uPs8AI8VCUWJlOHRxuwJMWMwJHU8XUMnYJx1h//NL
	0zElTA/iMMenf8Evrqt4p3F7lA2JOVFxDzoXj4hWCejCGZC4ju8UBo0vgJaxq8wgA3DhQjF7CANhG
	d5SBFV0w==;
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWpXV-0000000200m-0Rgf;
	Tue, 09 Jun 2026 06:02:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1780984918; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kQ86I763szj5XrihC4RMO3UE7e3pCv/7CyXlBorZ0jHp3QvBRgLnFSH24G967x/5+T3kClFVe8pDngKIlRkyr7qVuHjPBRh7WjWDCLy30Gh5huBE+K1U8LYEmroy6T6oi0RwMzNFyBTM1QFUsZE8C5HM1wiMhEIaC5+NVPeL9/Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780984918; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Fcjd/zlFVY0nunhgxmUeD2hlkM4IOvznVuILW3ZgAOw=; 
	b=Bke2SxBJiCOvWxu2RG3hDa4nW57QZzGjHqbfkAST3rsrhc5tN9MyumSLPybp0K2Kp03JJLExtngQH+T/WkuudMozeDUVFqrwrrFUZz+Low63tkWPtyQON6kvMt1kBvZ74DS6dK9ymbvleIvYkWQkeQbPXw0+egp5X5I7nuEoKMc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780984918;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Fcjd/zlFVY0nunhgxmUeD2hlkM4IOvznVuILW3ZgAOw=;
	b=o8LjYXGpCPngeralFGsnJ0EzL2xpelUI5SHz++VBOxpCkvHmWBmgrpwPuwP1pQcs
	WLSqG/kvtXU/jL8Rj4VGaR2cVX7M6Ayx2Dnp8nMhr2aovEpMFnuQwDa+IEMBwJGWja/
	YYWRRZlBwjK9yGT0hMXHcJKcAt9mjH+qwF033ZMAH0xhEM3QNM3GCfNYmGke5tuvEtP
	hpsaIiu4f4YGRer1sn0uRVmZ1+Rfncnbk+AaogeJ7+1b86cOwUSwyt0fAnxCSX1C8JA
	KEyiSh2PW+VPTBRqi0EchwOPGEWL95bVdRLaYzjiCEqR3uJ571JNXVELiec/4Ky01P2
	uTD4g4WAmA==
Received: by mx.zohomail.com with SMTPS id 1780984917247708.4348995858405;
	Mon, 8 Jun 2026 23:01:57 -0700 (PDT)
Message-ID: <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>
Subject: Re: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC
 subsys clocks
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Michael Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Paul Walmsley	 <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Jisheng Zhang	 <jszhang@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, 	linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-gpio@vger.kernel.org,
 linux-phy@lists.infradead.org, 	linux-usb@vger.kernel.org, Han Gao
 <rabenda.cn@gmail.com>, Yao Zi	 <ziyao@disroot.org>
Date: Tue, 09 Jun 2026 14:01:43 +0800
In-Reply-To: <aier9XppLeCkJydw@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
	 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
	 <aier9XppLeCkJydw@thelio>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_070217_711247_53A7BED5 
X-CRM114-Status: GOOD (  15.73  )
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

5ZyoIDIwMjYtMDYtMDjkuIDnmoQgMjM6MDAgLTA3MDDvvIxEcmV3IEZ1c3RpbmnlhpnpgZPvvJoK
PiBPbiBUaHUsIE1heSAwNywgMjAyNiBhdCAwNDoxNzowMFBNICswODAwLCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gVGhlIFRIMTUyMCBTb0MgY29udGFpbnMgYSBNSVNDX1NVQlNZUyBjbG9jayBj
b250cm9sbGVyLCB3aGljaAo+ID4gYWxsb3dzCj4gPiBjb250cm9sbGluZyBvZiBVU0IgcmVsYXRl
ZCBjbG9ja3MgYW5kIE1NQy9TRCBjb250cm9sbGVyIEFIQiBidXMKPiA+IGNsb2Nrcy4KPiA+IAo+
ID4gQWRkIHN1cHBvcnQgZm9yIHRoaXMgY2xvY2sgY29udHJvbGxlciwgaW4gb3JkZXIgdG8gZW5h
YmxlIFVTQgo+ID4gc3VwcG9ydC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVu
ZyA8emhlbmd4aW5nZGFAaXNjYXMuYWMuY24+Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9jbGsvdGhl
YWQvY2xrLXRoMTUyMC1hcC5jIHwgNjQKPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYwo+ID4gYi9kcml2ZXJzL2Ns
ay90aGVhZC9jbGstdGgxNTIwLWFwLmMKPiA+IGluZGV4IDNhNjg0N2YxYzk1MGYuLjI0Zjc4NWYw
YjMyOWEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2Nsay90aGVhZC9jbGstdGgxNTIwLWFwLmMK
PiA+ICsrKyBiL2RyaXZlcnMvY2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYwo+IFsuLi5dCj4gPiBA
QCAtMTYwOSw2ICsxNjYzLDEyIEBAIHN0YXRpYyBpbnQgdGgxNTIwX2Nsa19wcm9iZShzdHJ1Y3QK
PiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+IMKgCQkJcmV0dXJuIHJldDsKPiA+IMKgCX0K
PiA+IMKgCj4gPiArCWlmIChwbGF0X2RhdGEgPT0gJnRoMTUyMF9hcF9wbGF0ZGF0YSkgewo+ID4g
KwkJcmV0ID0gZGV2bV9jbGtfaHdfcmVnaXN0ZXIoZGV2LAo+ID4gJnVzYl9zdXNwZW5kX2Rpdl9j
bGsuaHcpOwo+ID4gKwkJaWYgKHJldCkKPiA+ICsJCQlyZXR1cm4gcmV0Owo+ID4gKwl9Cj4gCj4g
U2hvdWxkIHVzYl9zdXNwZW5kX2Rpdl9jbGsuaHcgaW5zdGVhZCBiZSByZWdpc3RlcmVkIHVuZGVy
Cj4gJ2lmIChwbGF0X2RhdGEgPT0gJnRoMTUyMF9hcF9wbGF0ZGF0YSknPwoKRG8geW91IG1lYW4g
bWlzY19wbGF0ZGF0YT8KClllcywgdGhpcyBpcyBhbiBjb3B5LW4tcGFzdGUgZXJyb3IgdGhhdCBk
ZXNlcnZlcyBhIGZpeC4KClRoYW5rcywKSWNlbm93eQoKPiAKPiBUaGFua3MsCj4gRHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
