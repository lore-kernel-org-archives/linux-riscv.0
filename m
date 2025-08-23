Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0FCCA0EED
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVbESgjem5f3kLfNCvVVleAO2BDqXV863leZzg47snc=; b=PczB/vrsdFPlWl
	2IqwBVXO8b8cKAm6q4IiIM57ob5/KK0zw67d0xecvQ+8hTbOrLrBoHRnQO5ydlwCekXlwDP96AAiS
	yElosQbkiYGmKnz6YX/uJevJ62lec+9VOqZLBsXyl4nQQzn83IeH+UpzaUyqhvlvHmiOY4yCf/Zu4
	xNuunizLzvjfvo649LGV4AMOPDIVM4xuAh01qIG7U00Tcml9jKj94H555I9qr1RsLJ/brXZHaHMY2
	NEqdulJGDhg5PGqd9MXXWVKqiAmA7pxI0hAx5C83ac0V6YHkIaY7eHegZFenUSC4n9kyLpL0OjT6j
	0YWGhh5fD2+VxmUWJUeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uppUQ-00000004sJq-2DVL;
	Sat, 23 Aug 2025 14:45:06 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uppN4-00000004rT8-2XUh
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 14:37:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755959843; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i0gQp/bDFy9ZbVk4fLw3HLIa/f1GAQblOIedxJHhzUYGSCwuTkJvdY0wHjU21o0+og+XSqjtg3yYfKKap4WQzoWhTWXDEWrrVnVlBeSl9G1wubied71Ihhe+pCDnkfBFJo0U/WBrLh5DfsNi5y0CK+rhiE+gLHmgMBiU6tpZhaA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755959843; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w5+3Wj7vfPQ8crCgywXDIjFpd5kHVU1zcCL+s+Zd5yA=; 
	b=kBXB1g5C0ziF+S7ZfMaRqyDuwu379zZefxwotIZ1GP1UxgoFRpIV8kxoCscYEauQ/RMYDXeq9AXY1/qRqCqY5ufnszn4KfSl0zNUzNyD10dR5peGSjWLLQuYYt6DoS0AEbC8Hd7co3iZEliQOIrT74oi7TX/fpgP2X6pwNDiDR0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755959843;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=w5+3Wj7vfPQ8crCgywXDIjFpd5kHVU1zcCL+s+Zd5yA=;
	b=CNCTRXReAmkhoAUkpWYsBs4Cz0aIfjUPGIW85mAOd+QZLGoisIHsQKqvj2WQobPy
	NSxx54VcBo1e5tZWkf7KSF4PFIAEWqscylWk8Z3esZHmo+wY3QRtT6e05R6byNIgL8q
	oKBBsdiD7qCIRoSE1eM2gyYPH7exGKWFMo4X84MiGR4RtU7S7T9xDTGxsfNHLqliKgW
	GOPjocYyzPS6FhX8/Ks5g5lhekpbyzHjJ6TOEKNq9myNpjpgXtTa+bc9rHEGcdg60bL
	kahhwhWeHFslp8cbPZi7hMjxyLO0tWHW91TZWDdz+q95w/kw75TYsap+Dmx4SLaKWWx
	0/v+IRh9rg==
Received: by mx.zohomail.com with SMTPS id 1755959840626388.09144913566183;
	Sat, 23 Aug 2025 07:37:20 -0700 (PDT)
Message-ID: <6ac480db63aff3c59603db16e00b9c7b6580b663.camel@icenowy.me>
Subject: Re: [PATCH 1/3] riscv: dts: thead: th1520: add coefficients to the
 PVT node
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Yao Zi
 <ziyao@disroot.org>,  linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Sat, 23 Aug 2025 22:37:13 +0800
In-Reply-To: <aKjhOuqlQyuLCVEK@x1>
References: <20250816093209.2600355-1-uwu@icenowy.me>
	 <20250816093209.2600355-2-uwu@icenowy.me> <aKjhOuqlQyuLCVEK@x1>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_073730_688486_A87485AC 
X-CRM114-Status: GOOD (  18.55  )
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

5ZyoIDIwMjUtMDgtMjLmmJ/mnJ/kupTnmoQgMTQ6MjkgLTA3MDDvvIxEcmV3IEZ1c3Rpbmnlhpnp
gZPvvJoKPiBPbiBTYXQsIEF1ZyAxNiwgMjAyNSBhdCAwNTozMjowN1BNICswODAwLCBJY2Vub3d5
IFpoZW5nIHdyb3RlOgo+ID4gVGhlIG1hbnVhbCBvZiBUSDE1MjAgY29udGFpbnMgYSBzZXQgb2Yg
Y29lZmZpY2llbnRzIGEgbGl0dGxlCj4gPiBkaWZmZXJlbnQKPiA+IHRvIHRoZSBkcml2ZXIgZGVm
YXVsdCBvbmVzLgo+ID4gCj4gPiBBZGQgdGhlbSB0byB0aGUgZGV2aWNlIHRyZWUgbm9kZSBvZiBQ
VlQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1l
Pgo+ID4gLS0tCj4gPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgfCA0
ICsrKysKPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+ID4gYi9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gPiBpbmRleCAwM2YxZDczMTkwNDk5
Li5lOWM4MWJkYWJlZDhhIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVh
ZC90aDE1MjAuZHRzaQo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAu
ZHRzaQo+ID4gQEAgLTY3Niw2ICs2NzYsMTAgQEAgcHZ0OiBwdnRAZmZmZmY0ZTAwMCB7Cj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWctbmFtZXMg
PSAiY29tbW9uIiwgInRzIiwgInBkIiwgInZtIjsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsb2NrcyA9IDwmYW9uc3lzX2Nsaz47Cj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAjdGhlcm1hbC1zZW5z
b3ItY2VsbHMgPSA8MT47Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoG1vb3J0ZWMsdHMtY29lZmYtZyA9IDw0Mjc0MD47Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1vb3J0ZWMsdHMtY29lZmYtaCA9IDwy
MjA1MDA+Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBtb29ydGVjLHRzLWNvZWZmLWogPSA8KC0xNjApPjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbW9vcnRlYyx0cy1jb2VmZi1jYWw1ID0gPDQwOTQ+
Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Owo+ID4gwqAKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3Bpb0BmZmZmZjUyMDAwIHsKPiA+IC0tIAo+ID4g
Mi41MC4xCj4gPiAKPiAKPiBJIHRoaW5rIG1vb3J0ZWMsdHMtY29lZmYtWFhYIHdpbGwgbmVlZCB0
byBiZSByb3VuZGVkIHRvIG5lYXJlc3QKPiBtdWx0aXBsZQo+IG9mIDEwMCBhcyBkdGJzX2NoZWNr
IHdhcm5zIHRoYXQ6Cj4gCj4gcHZ0QGZmZmZmNGUwMDA6IG1vb3J0ZWMsdHMtY29lZmYtZzogNDI3
NDAgaXMgbm90IGEgbXVsdGlwbGUgb2YgMTAwCj4gwqDCoMKgwqDCoMKgwqDCoGZyb20gc2NoZW1h
ICRpZDoKPiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9od21vbi9tb29ydGVjLG1yNzUy
MDMueWFtbCMKPiBwdnRAZmZmZmY0ZTAwMDogbW9vcnRlYyx0cy1jb2VmZi1qOiAtMTYwIGlzIG5v
dCBhIG11bHRpcGxlIG9mIDEwMAo+IMKgwqDCoMKgwqDCoMKgwqBmcm9tIHNjaGVtYSAkaWQ6Cj4g
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaHdtb24vbW9vcnRlYyxtcjc1MjAzLnlhbWwj
Cj4gcHZ0QGZmZmZmNGUwMDA6IG1vb3J0ZWMsdHMtY29lZmYtZzogNDI3NDAgaXMgbm90IGEgbXVs
dGlwbGUgb2YgMTAwCj4gwqDCoMKgwqDCoMKgwqDCoGZyb20gc2NoZW1hICRpZDoKPiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9od21vbi9tb29ydGVjLG1yNzUyMDMueWFtbCMKPiBwdnRA
ZmZmZmY0ZTAwMDogbW9vcnRlYyx0cy1jb2VmZi1qOiAtMTYwIGlzIG5vdCBhIG11bHRpcGxlIG9m
IDEwMAo+IMKgwqDCoMKgwqDCoMKgwqBmcm9tIHNjaGVtYSAkaWQ6Cj4gaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvaHdtb24vbW9vcnRlYyxtcjc1MjAzLnlhbWwjCgpUaGVuIGl0IGxvb2tz
IGxpa2UgdGhlIGJpbmRpbmcgaXMgdG8gYmUgYmxhbWVkIGZvciBub3QgYWxsb3dpbmcgZmluZQp0
d2Vhay4KCj4gCj4gVGhhbmtzLAo+IERyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
