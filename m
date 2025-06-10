Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EC5C61CE8
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 02:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29YlalRYq/E1Ry0JixnH0pbmxC2YPVGE6XHNjBtpbB8=; b=WSGBYRDQCgSmrP
	mJkGSx0dn3Il+nWWkQJoo2Y7/uvO9hD2AE/REkk2gXbuVFuRP08EQqPDzH4ELDoqMznRO0+cEa5Vk
	yDdZB6jdy0FWVY08dZqCnVUpyLWG4wh2xUrP9aGyHdPXoE73sWocpNq9+SwqHp0h9bkB+ngKyp+U0
	VhBOQK9tKkKRskVzO9iRPMV9APCryxMYg7K9ka/eBKUhKxTsa1erFAt+2dF3JLvMhlP7XFPduj13g
	kqznB5VDLr7Xn4vPviauLTqw1OWkCQ/3K37hp3r68i57iPiAKrOvnFClBOzhhkhlVkqqfwLjbg3Td
	x7UQxIR/SH88CGuhBjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOoiw-00000005dm5-3EZj;
	Tue, 10 Jun 2025 02:28:26 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOoiu-00000005dll-2cGj
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 02:28:25 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7d38b84984dso363285685a.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 19:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749522503; x=1750127303; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hHVkk904jRd3p8Rs3sg+4bhDmyEClu0AdMZHFrriZZA=;
        b=S2jq7tZGrIpfQcq5+ady7k2X3A0KH7LxIwr1ePhAcygudxPeja5ogIgcaqYW6oVyap
         IGkkv+J0zsATypTus231m2rNTC4HIwrXCawDUtniPQ6PLIWj4msCkdUBbcabXS/P7s/b
         O/fV1SdpvOtKOJjeQUMJ+a4un50t9b9ZaH9syVxJj9Vt9Bwi7kMEhVAz4gl7Rt3UcMBV
         koifcNG7l/pxIozXyEKbPr1IjyleAv+zj/1u1ng2mod+sIDS4ak3Gj+DhaGmEgakGg3N
         weN+g1Q/F8LIqw1Y7VD7ktm9RJhldSKyQpPamNbzUV8bT8xEJX4clMxNmrGahpZDhsxv
         7m9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749522503; x=1750127303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHVkk904jRd3p8Rs3sg+4bhDmyEClu0AdMZHFrriZZA=;
        b=j77L0PoSEKlmfksboqRDlKM8bPhDYMsZayQyJ7x27wIEa2taI4qNabAGOcvQZzyoUG
         1stf/sYnpHUUZQwuM7zX7tkfODhGcz1nN/bGru1/pE7YCZzE/RTmlWrWpvTg0fIcfuoB
         PQJVccVnCtfi6Qnnlq7t9xn3x0Csmy35VfzDhK7/tUR4N4SSy8bGvSBNGGWKC/N+sKZN
         Su7b2tQYPxjtZF8PYccsalatJNzfnVDF0VzVCLi+EI64J5xEHnmPc8wd+EKZHnf23xU4
         EIO7KUcCFnCkoItHvbL3I9dY+A2awDpaGSCYTdMk/P84AQbRPupNCRzuReQ8yqVWRrur
         zNPg==
X-Forwarded-Encrypted: i=1; AJvYcCUJw5t+DvdphWQ9YzHxunenY2j/J2iOHEAi/Cj2ov89jtb0TV7ep3jcmXtFyK6OuPU2LEaDKfcoUW46cA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYpD7RcnN8FJ/Nra15GH852dp4Av55x87M04DM44zu2vt2tw48
	hixfxbs2FDT6gnIlMK6IZk3e2WrJx2eZq5zflkLMyzvBAhIbpYsZAKxx
X-Gm-Gg: ASbGnctkuPGTlhkOlahmnvAqL/klS6ROLZINUTpmmsY95F7GIS/ite4FyiKzZkm9wje
	1lU9jBJinNw+2su9jt1HojhFkgek5/kBCejYIDa9NVcyooe5dYdRcoMRfP0aA6bij/nZzQqBAXI
	P1kvJHgTdHfNWNOHqbtLbjLTEnV9DsLC5zLLi+t1YRrnK51VBfh53osIlUiJRO0c+YzJb0Y7UEP
	oOWqOkdoNTzd3ttOVokQMZ41uZcYFs77ZneqmX44Uiyc4NlLBwJDYbDSS0Obhfb2N+pM3oRGRoj
	EGIjPN9OCvJVc0ThV4us03CMwr5GDUW5rzB6xw==
X-Google-Smtp-Source: AGHT+IEpLXDyWFpr+QTE1t3BBh1T+C6HjXUfs7iH1u+dmM9n5c1zkotSRoihvMGYroFl6LbrYzLmQw==
X-Received: by 2002:a05:620a:1b8e:b0:7ca:f3ac:9eae with SMTP id af79cd13be357-7d229895a42mr2604428585a.30.1749522503555;
        Mon, 09 Jun 2025 19:28:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a53745esm622860885a.46.2025.06.09.19.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 19:28:23 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:27:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/4] riscv: dts: sophgo: add reset generator for
 Sophgo CV1800 series SoC
Message-ID: <xyet5vt7nnyx3qtjlcai5zhcpi7vm2dyolpi74ph6jlmeyp2mp@ayqhwsbcblnv>
References: <20250608232214.771855-1-inochiama@gmail.com>
 <20250608232214.771855-4-inochiama@gmail.com>
 <ff7d26c2-47a4-4c39-84a6-f3e554f4009e@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff7d26c2-47a4-4c39-84a6-f3e554f4009e@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_192824_665159_4ED51A44 
X-CRM114-Status: GOOD (  20.19  )
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

T24gVHVlLCBKdW4gMTAsIDIwMjUgYXQgMTA6MTU6MjlBTSArMDgwMCwgSnVuaHVpIExpdSB3cm90
ZToKPiBIaSBJbm9jaGksCj4gCj4gT24gMjAyNS82LzkgMDc6MjIsIElub2NoaSBBbWFvdG8gd3Jv
dGU6Cj4gPiBBZGQgcmVzZXQgZ2VuZXJhdG9yIG5vZGUgZm9yIGFsbCBDVjE4WFggc2VyaWVzIFNv
Qy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWls
LmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRz
aSAgICB8ICA3ICsrCj4gPiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTh4eC1yZXNl
dC5oIHwgOTggKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAx
MDUgaW5zZXJ0aW9ucygrKQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290
L2R0cy9zb3BoZ28vY3YxOHh4LXJlc2V0LmgKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc29waGdvL2N2MTgweC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3Bo
Z28vY3YxODB4LmR0c2kKPiA+IGluZGV4IGVkMDZjMzYwOWZiMi4uNGMzZDE2NzY0MTMxIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kKPiA+ICsr
KyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgweC5kdHNpCj4gPiBAQCAtNyw2ICs3
LDcgQEAKPiA+ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxjdjE4MDAuaD4K
PiA+ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgo+ID4gICAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gPiArI2luY2x1ZGUgImN2
MTh4eC1yZXNldC5oIgo+ID4gICAvIHsKPiA+ICAgCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4g
QEAgLTI0LDYgKzI1LDEyIEBAIHNvYyB7Cj4gPiAgIAkJI3NpemUtY2VsbHMgPSA8MT47Cj4gPiAg
IAkJcmFuZ2VzOwo+ID4gKwkJcnN0OiByZXNldC1jb250cm9sbGVyQDMwMDMwMDAgewo+ID4gKwkJ
CWNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMGItcmVzZXQiOwo+ID4gKwkJCXJlZyA9IDwweDMw
MDMwMDAgMHgxMDAwPjsKPiA+ICsJCQkjcmVzZXQtY2VsbHMgPSA8MT47Cj4gPiArCQl9Owo+ID4g
Kwo+ID4gICAJCWdwaW8wOiBncGlvQDMwMjAwMDAgewo+ID4gICAJCQljb21wYXRpYmxlID0gInNu
cHMsZHctYXBiLWdwaW8iOwo+ID4gICAJCQlyZWcgPSA8MHgzMDIwMDAwIDB4MTAwMD47Cj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LXJlc2V0LmggYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgtcmVzZXQuaAo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYjliNmRkNTZhOWUyCj4gPiAtLS0gL2Rl
di9udWxsCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgtcmVzZXQu
aAo+ID4gQEAgLTAsMCArMSw5OCBAQAo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMCBPUiBNSVQpICovCj4gPiArLyoKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUgSW5v
Y2hpIEFtYW90byA8aW5vY2hpYW1hQG91dGxvb2suY29tPgo+ID4gKyAqLwo+ID4gKwo+ID4gKyNp
Zm5kZWYgX1NPUEhHT19DVjE4WFhfUkVTRVQKPiA+ICsjZGVmaW5lIF9TT1BIR09fQ1YxOFhYX1JF
U0VUCj4gPiArCj4gPiArI2RlZmluZSBSU1RfRERSCQkJCTIKPiA+ICsjZGVmaW5lIFJTVF9IMjY0
QwkJCTMKPiA+ICsjZGVmaW5lIFJTVF9KUEVHCQkJNAo+ID4gKyNkZWZpbmUgUlNUX0gyNjVDCQkJ
NQo+ID4gKyNkZWZpbmUgUlNUX1ZJUFNZUwkJCTYKPiA+ICsjZGVmaW5lIFJTVF9URE1BCQkJNwo+
ID4gKyNkZWZpbmUgUlNUX1RQVQkJCQk4Cj4gPiArI2RlZmluZSBSU1RfVFBVU1lTCQkJOQo+ID4g
KyNkZWZpbmUgUlNUX1VTQgkJCQkxMQo+ID4gKyNkZWZpbmUgUlNUX0VUSDAJCQkxMgo+ID4gKyNk
ZWZpbmUgUlNUX0VUSDEJCQkxMwo+ID4gKyNkZWZpbmUgUlNUX05BTkQJCQkxNAo+ID4gKyNkZWZp
bmUgUlNUX0VNTUMJCQkxNQo+ID4gKyNkZWZpbmUgUlNUX1NEMAkJCQkxNgo+ID4gKyNkZWZpbmUg
UlNUX1NETUEJCQkxOAo+ID4gKyNkZWZpbmUgUlNUX0kyUzAJCQkxOQo+ID4gKyNkZWZpbmUgUlNU
X0kyUzEJCQkyMAo+ID4gKyNkZWZpbmUgUlNUX0kyUzIJCQkyMQo+ID4gKyNkZWZpbmUgUlNUX0ky
UzMJCQkyMgo+ID4gKyNkZWZpbmUgUlNUX1VBUlQwCQkJMjMKPiA+ICsjZGVmaW5lIFJTVF9VQVJU
MQkJCTI0Cj4gPiArI2RlZmluZSBSU1RfVUFSVDIJCQkyNQo+ID4gKyNkZWZpbmUgUlNUX1VBUlQz
CQkJMjYKPiA+ICsjZGVmaW5lIFJTVF9JMkMwCQkJMjcKPiA+ICsjZGVmaW5lIFJTVF9JMkMxCQkJ
MjgKPiA+ICsjZGVmaW5lIFJTVF9JMkMyCQkJMjkKPiA+ICsjZGVmaW5lIFJTVF9JMkMzCQkJMzAK
PiA+ICsjZGVmaW5lIFJTVF9JMkM0CQkJMzEKPiA+ICsjZGVmaW5lIFJTVF9QV00wCQkJMzIKPiA+
ICsjZGVmaW5lIFJTVF9QV00xCQkJMzMKPiA+ICsjZGVmaW5lIFJTVF9QV00yCQkJMzQKPiA+ICsj
ZGVmaW5lIFJTVF9QV00zCQkJMzUKPiA+ICsjZGVmaW5lIFJTVF9TUEkwCQkJNDAKPiA+ICsjZGVm
aW5lIFJTVF9TUEkxCQkJNDEKPiA+ICsjZGVmaW5lIFJTVF9TUEkyCQkJNDIKPiA+ICsjZGVmaW5l
IFJTVF9TUEkzCQkJNDMKPiA+ICsjZGVmaW5lIFJTVF9HUElPMAkJCTQ0Cj4gPiArI2RlZmluZSBS
U1RfR1BJTzEJCQk0NQo+ID4gKyNkZWZpbmUgUlNUX0dQSU8yCQkJNDYKPiA+ICsjZGVmaW5lIFJT
VF9FRlVTRQkJCTQ3Cj4gPiArI2RlZmluZSBSU1RfV0RUCQkJCTQ4Cj4gPiArI2RlZmluZSBSU1Rf
QUhCX1JPTQkJCTQ5Cj4gPiArI2RlZmluZSBSU1RfU1BJQwkJCTUwCj4gPiArI2RlZmluZSBSU1Rf
VEVNUFNFTgkJCTUxCj4gPiArI2RlZmluZSBSU1RfU0FSQURDCQkJNTIKPiA+ICsjZGVmaW5lIFJT
VF9DT01CT19QSFkwCQkJNTgKPiA+ICsjZGVmaW5lIFJTVF9TUElfTkFORAkJCTYxCj4gPiArI2Rl
ZmluZSBSU1RfU0UJCQkJNjIKPiA+ICsjZGVmaW5lIFJTVF9VQVJUNAkJCTc0Cj4gPiArI2RlZmlu
ZSBSU1RfR1BJTzMJCQk3NQo+ID4gKyNkZWZpbmUgUlNUX1NZU1RFTQkJCTc2Cj4gPiArI2RlZmlu
ZSBSU1RfVElNRVIJCQk3Nwo+ID4gKyNkZWZpbmUgUlNUX1RJTUVSMAkJCTc4Cj4gPiArI2RlZmlu
ZSBSU1RfVElNRVIxCQkJNzkKPiA+ICsjZGVmaW5lIFJTVF9USU1FUjIJCQk4MAo+ID4gKyNkZWZp
bmUgUlNUX1RJTUVSMwkJCTgxCj4gPiArI2RlZmluZSBSU1RfVElNRVI0CQkJODIKPiA+ICsjZGVm
aW5lIFJTVF9USU1FUjUJCQk4Mwo+ID4gKyNkZWZpbmUgUlNUX1RJTUVSNgkJCTg0Cj4gPiArI2Rl
ZmluZSBSU1RfVElNRVI3CQkJODUKPiA+ICsjZGVmaW5lIFJTVF9XR04wCQkJODYKPiA+ICsjZGVm
aW5lIFJTVF9XR04xCQkJODcKPiA+ICsjZGVmaW5lIFJTVF9XR04yCQkJODgKPiA+ICsjZGVmaW5l
IFJTVF9LRVlTQ0FOCQkJODkKPiA+ICsjZGVmaW5lIFJTVF9BVUREQUMJCQk5MQo+ID4gKyNkZWZp
bmUgUlNUX0FVRERBQ19BUEIJCQk5Mgo+ID4gKyNkZWZpbmUgUlNUX0FVREFEQwkJCTkzCj4gPiAr
I2RlZmluZSBSU1RfVkNTWVMJCQk5NQo+ID4gKyNkZWZpbmUgUlNUX0VUSFBIWQkJCTk2Cj4gPiAr
I2RlZmluZSBSU1RfRVRIUEhZX0FQQgkJCTk3Cj4gPiArI2RlZmluZSBSU1RfQVVEU1JDCQkJOTgK
PiA+ICsjZGVmaW5lIFJTVF9WSVBfQ0FNMAkJCTk5Cj4gPiArI2RlZmluZSBSU1RfV0RUMQkJCTEw
MAo+ID4gKyNkZWZpbmUgUlNUX1dEVDIJCQkxMDEKPiA+ICsjZGVmaW5lIFJTVF9BVVRPQ0xFQVJf
Q1BVQ09SRTAJCTI1Ngo+ID4gKyNkZWZpbmUgUlNUX0FVVE9DTEVBUl9DUFVDT1JFMQkJMjU3Cj4g
PiArI2RlZmluZSBSU1RfQVVUT0NMRUFSX0NQVUNPUkUyCQkyNTgKPiA+ICsjZGVmaW5lIFJTVF9B
VVRPQ0xFQVJfQ1BVQ09SRTMJCTI1OQo+ID4gKyNkZWZpbmUgUlNUX0FVVE9DTEVBUl9DUFVTWVMw
CQkyNjAKPiA+ICsjZGVmaW5lIFJTVF9BVVRPQ0xFQVJfQ1BVU1lTMQkJMjYxCj4gPiArI2RlZmlu
ZSBSU1RfQVVUT0NMRUFSX0NQVVNZUzIJCTI2Mgo+ID4gKyNkZWZpbmUgUlNUX0NQVUNPUkUwCQkJ
MjY4Cj4gCj4gCj4gTG9va3MgbGlrZSB0aGlzIGFuZCB0aGUgZm9sbG93aW5nIHN0aWxsIGRvZXNu
J3QgcmlnaHQuIFNpbmNlIGl04oCZcyBiaXQgMAo+IGF0IG9mZnNldCAweDAyNCwgaXQgc2hvdWxk
IGJlIDB4MjQgKiA4ID0gMHgxMjAgPSAyODgsIG5vdCAyNjguCj4gCgpZb3UgYXJlIHJpZ2h0LCBJ
IGFkZCBhIHdyb25nIHN0ZXAuCkkgd2lsbCBmaXggdGhpcywgdGhhbmtzLgoKUmVnYXJkcywKSW5v
Y2hpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
