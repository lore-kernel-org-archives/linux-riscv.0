Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D1FC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 01:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E8V3jl0p5QVQHlExAlQf2y/yf9xc7szDz6ZTKvrySh8=; b=eHFx2zKIFFoU47
	VIGiAZt65XEOzqvwtEq6T6REo2RI1l/FxosGJ9sHvCO0naB/Cg+um65Ot6tSr4tOky1qG3z2TtjZp
	pzG+oOwMgocehYjXlMkW5AdgXvxNSJsu2cxxqaoDHGxci4LwBydaLsw2fI2Ft91ltPrrnAtpJeDMR
	W/uG3WD6UjwRjVAhFDJo6U89V79A2nKjxKKBo0tOQma98m1wOUU2WQ4xCH05z6jKXV5RKcNwj8E28
	TnE4Kg4Rc8qOcaCm84Zv6yQbP+E+wSnRbS0kUDF+6CKkFx17f+2K31Endz5x54XK/0dhc/YDL14MT
	17obMpkPBEgTgZcjaLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5Xn-00EkRz-2i;
	Tue, 23 Jan 2024 01:25:39 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS5Xl-00EkR5-1o
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 01:25:38 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e0cc84fe4dso1949234a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 17:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705973076; x=1706577876; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2t04bRrjEPqvRZY9vsZb+gHmac8X05fevidcqS/qug=;
        b=N+W7xHGZ9FzKMJ0i7+LXYFIT9XOZ6BGTx36FIoCZLUbMmvn1Eyjb1C8senj18L6N9k
         fkPacplslMTzOp20TSMgN3mat5bdjru0WMxNpPBB9d9nCVozvhf7TvmvJ8KddlmMCrmv
         LU/WXM54M1K7OpghBPl5qlNt9CEymJ9Ar04PJL3Hu5ERFwn1tT5+qrLc7YRXixpE2bcj
         Tnbm7yQVKNkHPoVSqTQIqSUhrCEQQsqfwavri2WwAXf6z0pPe2MdUTNwQZPZaoUn76hc
         2jeufVPkjiGc7p0xNDga51zk2XUDvkjO+2kZMjF3Ht6sTMXmfgQkfpQdpAAcPaGAXzCj
         U4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705973076; x=1706577876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2t04bRrjEPqvRZY9vsZb+gHmac8X05fevidcqS/qug=;
        b=IZw5bpkuqIr/6Q+ed96NNwNQoZ28RKfN2c+0lprs7AKVm/fdzHHsb0s7EqECnlNX1n
         zIfB0WCVuDaddIzx2nXdrq5NtKS9ntn4Mjvmepa7IOqoRJkh9SKCnY1DLgUxlafP+Ky2
         XDtpIG1fhLVx+n/e2fNjr5FnxJ6rbsmE0xVEuki+88rIBFQyWH3CrmqQw9FhVpG8zvGC
         dWVJlHTVR0/TfpazRAr6N8N8lzkeaxyLAOfq3v/oLcahwnIca2gvn1onflEkSKrLk0eZ
         oJIAquj+TcZJW1b2Dr/WeOpgkb95S4aHrlzKS/YoXx2/ptKLap7FCF0TAh8fL7z+0jKO
         4Sog==
X-Gm-Message-State: AOJu0YxUlHgVDhE9iRD4X9TUHgWCigApYbjm8SxJdHMkYmwL7WJ7A/b1
	c56PmJDQS6Fy2q+T7XnPjRYFK75wkLtYhJ5DUTd4iCZP9W278ZbTl4aTPzIr6kz0qJHuJtX8Yoc
	vEIqbVLvI5xNOdw5yBfb5xUKLEM4=
X-Google-Smtp-Source: AGHT+IHyY3YAlXk1zADzHlDpVnX/XjnGBBzGqQKcyHspAZ/1NjdilCVSUG/kGR3Z1882PQbbKMdzT6m2GOHS5+Vb+Lk=
X-Received: by 2002:a05:6870:d1d5:b0:214:8a13:2025 with SMTP id
 b21-20020a056870d1d500b002148a132025mr29115oac.96.1705973075749; Mon, 22 Jan
 2024 17:24:35 -0800 (PST)
MIME-Version: 1.0
References: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com>
 <20240122080631.2880-2-qiujingbao.dlmu@gmail.com> <CAJM55Z_DFox9c_eDeHtx9H+9e4A6pjkCkt7po94j_mu-tQWywg@mail.gmail.com>
In-Reply-To: <CAJM55Z_DFox9c_eDeHtx9H+9e4A6pjkCkt7po94j_mu-tQWywg@mail.gmail.com>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Tue, 23 Jan 2024 09:24:24 +0800
Message-ID: <CAJRtX8SiVazctKcmbrM3qhooQ9J_yuSAuUAh-nSW+sk8NWKv2g@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_172537_603385_B0D483A0 
X-CRM114-Status: GOOD (  13.87  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgOToyNeKAr1BNIEVtaWwgUmVubmVyIEJlcnRoaW5nCjxl
bWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IEppbmdiYW8gUWl1
IHdyb3RlOgo+ID4gQWRkIHRoZSBydGMgZGV2aWNlIHRyZWUgbm9kZSB0byBjdjE4MDAgU29DLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEppbmdiYW8gUWl1IDxxaXVqaW5nYmFvLmRsbXVAZ21haWwu
Y29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNp
IHwgNyArKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kKPiA+IGluZGV4IGRmNDBlODdl
ZTA2My4uMGNkN2ViOWEzMDQ4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9z
b3BoZ28vY3YxODAwYi5kdHNpCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9j
djE4MDBiLmR0c2kKPiA+IEBAIC0xMTksNSArMTE5LDEyIEBAIGNsaW50OiB0aW1lckA3NDAwMDAw
MCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NzQwMDAwMDAgMHgxMDAwMD47
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmY3B1MF9p
bnRjIDM+LCA8JmNwdTBfaW50YyA3PjsKPiA+ICAgICAgICAgICAgICAgfTsKPiA+ICsKPiA+ICsg
ICAgICAgICAgICAgcnRjOiBydGNANTAyNTAwMCB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJzb3BoZ28sY3YxODAwLXJ0YyI7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDB4NTAyNTAwMCAweDIwMDA+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlu
dGVycnVwdHMgPSA8MTcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gPiArICAgICAgICAgICAgICAg
ICAgICAgY2xvY2tzID0gPCZvc2M+Owo+ID4gKyAgICAgICAgICAgICB9Owo+Cj4gQmVmb3JlIHRo
aXMgcGF0Y2ggaXQgbG9va3MgbGlrZSB0aGUgbm9kZXMgYXJlIHNvcnRlZCBieSB0aGVpciBhZGRy
ZXNzLAo+IGJ1dCB0aGlzIHdvdWxkIGJyZWFrIGl0LgoKVGhhbmtzLCBJIHdpbGwgZml4IGl0LgoK
QmVzdCByZWdhcmRzLApKaW5nYmFvIFFpdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
