Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12377E7718A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 18:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mvwc2jPOPS5kMv/EfdoDzSGy+WlHr7Bw0pOBpaaBtsI=; b=v3txWri/4Hczoh
	DUSYA1FylKdXljVCps6cWsPN2yFe0Xz013/KyZC6KGepbwDG6SZH4aznw8fe/84GPaIdaQyju3clD
	YmckqVb1nkRlh8dh6kVcX6HGqfC6d4goiP2JTPV/oEBER4KTB929bZmPmvSBLEIb3sVb41wIadr1S
	iMz4ZvSX5HcClxT60g7e0RTwyQC0buLF+jGXmigdELtgFcLyn+1aoEjbL6Ne5y+7Oo1D/4rE1eMWc
	4AOrkF+5BB9YiVCktPQrj3+FMhtUwW7D05ldd0af0NwucZQgercqPoY+05cFlA/lHjLyzqD5YD+dK
	sNB7RY1ABZ1EKPOd2yXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLXB-00000002lsc-1k48;
	Thu, 19 Dec 2024 18:46:05 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLX8-00000002lsG-2r62
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 18:46:04 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-725dac69699so1039083b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Dec 2024 10:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1734633961; x=1735238761; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=143UE/hj7ZBbFmrJrQEhrNzNTS4xZ3ycFkw9/SByLr8=;
        b=o+UE4ox3R5fqeNOfOzQIh+h2W0YrA6emjPrFe1fR8CxVxCOsKH/7BVQDp6Xdshwxw/
         NO6KUyA3XV9Uz2d6onzXY3XOyrpJc48I/zmFSPulXnXCxP1bAPNypcjMrkEvY1KDUipW
         xvKnQoXrt/mQZx0tLfBTvOoQaIyFYTBcQR5eWm59LJRatSX9Rklkiv8WJcnaiymv/F3x
         pXabZVg+P6PoyKWZZFCXeQq5FcMdrD44a5EXuOlwGjb6CBMNVYuxuU4xcmtAnBWGxn/u
         +Rt9lMpPsDzegAskeeA2DpNesWZyXbncGsUsxEuPZnzt9fJMLaXh8S3B7UHiMeLEPFrX
         RqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734633961; x=1735238761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=143UE/hj7ZBbFmrJrQEhrNzNTS4xZ3ycFkw9/SByLr8=;
        b=vItIWvSUIO5SAOoJWyXRzNXrA9iQBd0PjljtiQF+TO7Z2yPrPJwFyOAEzV5EZkV50M
         D3HAoQRe+yY1a2G0VSN8vancYdNgyxxpX6BK1jwXuiRWbUel6owQumV7msdxpzGOvenE
         zjCb0R+lj+kGYtRgU7Aq4Dy3Cgmf5I9mCyU+l8Y/PM+qPI1co87xgzt89LHmUX4kZmxO
         R+Ts9/22DlKwy4w4barI376QYrdoHA5zOshBlUtS87APCoYKVFLXD9t2iYfKaUUp70T/
         fY61imJT2rhUXiTxZShyTV34+l5JDw1GIsXhgMFtRGJyaT2Gi9p5mnos45T+bvvAj+NA
         9+aA==
X-Gm-Message-State: AOJu0Yx/VJAqwCVy0hmlt23BIj9SvR/BpZqf1C1quDqixPBBLLYB/oSc
	jF9qY6mbOZFTgEa2G5Wo6HZbp3tUvJhNxcfOuTLKo0QBOxLRFVFlMhSDC64RGiQ=
X-Gm-Gg: ASbGnctUSHhC7OQnNHj/pBJj1SFukpBWf3Ta4SLoOyiyM4rto6H+OGifFaZiyG3Lr4m
	0MBzBDj5SoQBvb8hB+OV9ZRuBHKAPJlChlCYZz1W91XYBPBAWgE7yN0whvXptp6xbqIqMeX6l4u
	e/Fle08/8VLOSvfoVoTbd5a3v2s0esFYvaH0JQYK6W8FlpouZAsAXsjIA1Co+PB/wSpoEgTqoag
	/EkmZyNCjVYyd6MoyG9eTwOI8wEk25O+rAju9U+q7uxxCalwkaT0O9KOBy1PJ9UN99Afh6kN/0M
	2n/ZEd1OHNKxWfX9XTv4DQ==
X-Google-Smtp-Source: AGHT+IHltwFcMOgzCvC4uC3OMeWy2r9UnN99hknMrb2FwIvD3MZSxai/hpqEHlY9UehBsEN3dwGx+A==
X-Received: by 2002:a05:6a21:3115:b0:1e1:af74:a235 with SMTP id adf61e73a8af0-1e5e0499fafmr257366637.24.1734633961250;
        Thu, 19 Dec 2024 10:46:01 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd4e2sm1633603b3a.169.2024.12.19.10.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 10:46:00 -0800 (PST)
Date: Thu, 19 Dec 2024 10:45:46 -0800
From: Olof Johansson <olof@lixom.net>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH] riscv: Fix the PAUSE Opcode for MIPS P8700.
Message-ID: <Z2Rp2q2HCAMbD0WA@chonkvm.lixom.net>
References: <20241218133340.51003-1-arikalo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241218133340.51003-1-arikalo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_104602_928678_4BFA3AA4 
X-CRM114-Status: GOOD (  21.17  )
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMDI6MzM6NDBQTSArMDEwMCwgQWxla3NhbmRhciBSaWth
bG8gd3JvdGU6Cj4gRnJvbTogUmFqIFZpc2h3YW5hdGhhbjQgPHJ2aXNod2FuYXRoYW5AbWlwcy5j
b20+Cj4gCj4gVGhlIHJpc2N2IE1JUFMgUDg3MDAgdXNlcyBhIGRpZmZlcmVudCBvcGNvZGUgZm9y
IFBBVVNFLgo+IEl0IGlzIGEg4oCYaGludOKAmSBlbmNvZGluZyBvZiB0aGUgU0xMSSBpbnN0cnVj
dGlvbiwgd2l0aCByZD0wLCByczE9MCBhbmQKPiBpbW09NS4gSXQgd2lsbCBiZWhhdmUgYXMgYSBO
T1AgaW5zdHJ1Y3Rpb24gaWYgbm8gYWRkaXRpb25hbCBiZWhhdmlvcgo+IGJleW9uZCB0aGF0IG9m
IFNMTEkgaXMgaW1wbGVtZW50ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFqIFZpc2h3YW5hdGhh
bjQgPHJ2aXNod2FuYXRoYW5AbWlwcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWxla3NhbmRhciBS
aWthbG8gPGFyaWthbG9AZ21haWwuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAg
ICAgICAgICAgICAgfCAxMiArKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9p
bnNuLWRlZi5oIHwgIDUgKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+IGluZGV4IGQ0YTdjYTAzODhjMC4uMDdhNzdmYTBhMDE0IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC03MTYsNiArNzE2
LDE4IEBAIGNvbmZpZyBSSVNDVl9JU0FfWkFDQVMKPiAgCj4gIAkgIElmIHlvdSBkb24ndCBrbm93
IHdoYXQgdG8gZG8gaGVyZSwgc2F5IFkuCj4gIAo+ICtjb25maWcgUklTQ1ZfTUlQU19QODcwMF9Q
QVVTRV9PUENPREVfRklYCj4gKwlib29sICJGaXggdGhlIFBBVVNFIE9wY29kZSBmb3IgTUlQUyBQ
ODcwMCIKPiArCWRlZmF1bHQgbgo+ICsJaGVscAo+ICsJICAgVGhlIFJJU0NWIE1JUFMgUDg3MDAg
dXNlcyBhIGRpZmZlcmVudCBvcGNvZGUgZm9yIFBBVVNFLgo+ICsJICAgSXQgaXMgYSAnaGludCcg
ZW5jb2Rpbmcgb2YgdGhlIFNMTEkgaW5zdHJ1Y3Rpb24sCj4gKwkgICB3aXRoIHJkPTAsIHJzMT0w
IGFuZCBpbW09NS4gSXQgd2lsbCBiZWhhdmUgYXMgYSBOT1AKPiArCSAgIGluc3RydWN0aW9uIGlm
IG5vIGFkZGl0aW9uYWwgYmVoYXZpb3IgYmV5b25kIHRoYXQgb2YKPiArCSAgIFNMTEkgaXMgaW1w
bGVtZW50ZWQuCj4gKwo+ICsJICAgSWYgeW91IGFyZSBub3QgdXNpbmcgdGhlIFA4NzAwIHByb2Nl
c3Nvciwgc2F5IG4uCj4gKwo+ICBjb25maWcgVE9PTENIQUlOX0hBU19aQkIKPiAgCWJvb2wKPiAg
CWRlZmF1bHQgeQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24tZGVm
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24tZGVmLmgKPiBpbmRleCA5YTkxMzAxMGNk
ZDkuLjc5M2VlZGRlMzUxNiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lu
c24tZGVmLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24tZGVmLmgKPiBAQCAt
MTk2LDcgKzE5NiwxMiBAQAo+ICAJSU5TTl9JKE9QQ09ERV9NSVNDX01FTSwgRlVOQzMoMiksIF9f
UkQoMCksCQlcCj4gIAkgICAgICAgUlMxKGJhc2UpLCBTSU1NMTIoNCkpCj4gIAo+ICsjaWZuZGVm
IENPTkZJR19SSVNDVl9NSVBTX1A4NzAwX1BBVVNFX09QQ09ERV9GSVgKPiAgI2RlZmluZSBSSVND
Vl9QQVVTRQkiLjRieXRlIDB4MTAwMDAwZiIKPiArI2Vsc2UKPiArI2RlZmluZSBSSVNDVl9QQVVT
RQkiLjRieXRlIDB4MDA1MDEwMTMiCj4gKyNlbmRpZgo+ICsKPiAgI2RlZmluZSBaQVdSU19XUlNf
TlRPCSIuNGJ5dGUgMHgwMGQwMDA3MyIKPiAgI2RlZmluZSBaQVdSU19XUlNfU1RPCSIuNGJ5dGUg
MHgwMWQwMDA3MyIKClRoaXMgbWVhbnMgdGhhdCBhIGtlcm5lbCB0aGF0J3MgYnVpbHQgZm9yIE1J
UFMgUDg3MDAgd29uJ3QgZG8gdGhlIHJpZ2h0CnRoaW5nIG9uIG90aGVyIHBsYXRmb3JtcywgaS5l
LiBzaW5nbGUgcGxhdGZvcm0gYnVpbGRzLiBUaGF0J3Mgbm90IHRoZQpyaWdodCBhcHByb2FjaC4K
Ckl0IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSB0byB0cmVhdCB0aGlzIGFzIGFuIGVycmF0YSB3aXRo
IGJvb3QgdGltZQpwYXRjaHVwLgoKCi1PbG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
