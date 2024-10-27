Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9FDD13582
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 20:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjqjJBeID5uB07wmWdQOvg4v0vigaNDT/5+BJkyCSpY=; b=hnRMfU0Pl4KRJf
	WVh2ItXnaFs2hsT+VKMp4xnpRSY4aP1n3CCrEXzJxq1ViFMe8PHRjt/TOAYJvKk7NGoAUWdSbS0Tj
	zQq6HpImQ/WevRpfsNs7nd++g9RHkXmJN9YU6WkJG3UsK/MEyzvfKUbLaZsTKqdmf/WfBRlC3Smnv
	pccECpVUZf1Kuvurbc6EZfnBjLoDrx6h8+atV/5BI5PkcJgTEoLCHzCIfVOvu3l40I8in/JlFbCj1
	E7nUqb08pDm/rxY0kmFTBor/A/3FeRUQUphM3vKFMeUnXuwZIBEvF2RkLiAkE8uqQZLKHTU2pKFVo
	Tx6lnOH+CX9Mt9EonpAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59fL-00000008oX0-05FD;
	Sun, 27 Oct 2024 20:15:11 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59ab-00000008o1R-1kIc
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 20:10:18 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71e5a62031aso2593960b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 13:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730059816; x=1730664616; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IcPykXlVzWmap0WJxwNrZ0QmvkKZjb6ImovIhp64Ts=;
        b=WO4aESmd2XLvbDrAPb5mxHWRgpVYojRB6TEC+qEflkR8+N6Q2amijMU6VxWG66iBtH
         y8jbaDaZASPCVoklYZ+u+NGHl6j+0zAFjLxN6PpRcMTY/aOFzUyvHrRIlBCBy/rnJm+3
         Fp782CjZMoowQi2Gt0j/y29AGvmujSQst77Yy0GYqiPSPeIpGuiM4zS7WzHVI7Dzg/+v
         HNYpU+tG1AK280f6oQOCaNvk+LxJr9iusWFHJHQRYhIMMEUJOtpjIxm/EBeEqsdMVAdO
         fQmfDTh4MQcPkRl3HVAom76x08G6ktqOmYbUnaX3ESis5qxYGdxY3EcijjltiM1GjlpH
         nbRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059816; x=1730664616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IcPykXlVzWmap0WJxwNrZ0QmvkKZjb6ImovIhp64Ts=;
        b=tttSElc7tMgcGy25C2rUiNqWbH7qx6LiFa0nIMvXrWL23Rb/FQ9Mqb5c75U92YXM0+
         X+kKqyjoFtWrvZPdqxQk23Elw5X9YILyy1yX0KggUceH7Ip7JLSvxIZt8g/jd64V9IDr
         dIYzPv9zS3LH1lkQKuoXXEMIB/LUm5eQKVuegMY/KBxDewgnk48ufRgCGJq0PvrK4xOU
         WZ7KaK3r1gK6UpA8f8VxKg/BZN/ACHceijqwti1YnzHnnkUEkKWHne1g/SajNOzN8rnh
         SbBAbu0ZLGLCgLi/2EtG5JYRxBxwOjF/Ul7lRyk7DQ80NsLzx7Vm9UIghvUA0PElVVPx
         rjVg==
X-Forwarded-Encrypted: i=1; AJvYcCUwrXdzZlGK4Wc6TZMm/BLXjtsic3MHSEoPhpHcv4IPus25le5fM79Ru6RLin7zn+f+EkxR10pEpWrjuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgczmhu0WngFbfBrphzyz3DtLiPkqquknnUQHTZsXGNQeeeSmE
	mww/GEJQEM/rLr9jGmNloNtnaYwinWpr1tUWAD6O9O+rGbv8ywCS0bf+2vFlyChiokgblnRq0WZ
	hvZEXRPNBYj95+/ami+BtWm5MLsE=
X-Google-Smtp-Source: AGHT+IFM947AOOL5ljeFnUR8gsVzYkcDbeaK9fbdkVpqGbimn1UTrDsCfmAGHViUdXQaSxuKdeigDcHjISoZ8+a4oeY=
X-Received: by 2002:a05:6a00:a1d:b0:71e:5de:ad6d with SMTP id
 d2e1a72fcca58-72063094ed0mr9783146b3a.24.1730059815864; Sun, 27 Oct 2024
 13:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241026171441.3047904-1-samuel.holland@sifive.com> <20241026171441.3047904-3-samuel.holland@sifive.com>
In-Reply-To: <20241026171441.3047904-3-samuel.holland@sifive.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Sun, 27 Oct 2024 16:09:40 -0400
Message-ID: <CAJFTR8SM0itMgdYYKNS6YAaBRMrwsEcNu9zyxKn5cV_uyZR1MQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] riscv: Allow NOMMU kernels to access all of RAM
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_131017_502678_EC7DE284 
X-CRM114-Status: GOOD (  20.25  )
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

T24gU2F0LCBPY3QgMjYsIDIwMjQgYXQgMToxNuKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE5PTU1VIGtlcm5lbHMgY3VycmVudGx5IGNh
bm5vdCBhY2Nlc3MgbWVtb3J5IGJlbG93IHRoZSBrZXJuZWwgbGluawo+IGFkZHJlc3MuIFJlbW92
ZSB0aGlzIHJlc3RyaWN0aW9uIGJ5IHNldHRpbmcgUEFHRV9PRkZTRVQgdG8gdGhlIGFjdHVhbAo+
IHN0YXJ0IG9mIFJBTSwgYXMgZGV0ZXJtaW5lZCBmcm9tIHRoZSBkZXZpY2V0cmVlLiBUaGUga2Vy
bmVsIGxpbmsgYWRkcmVzcwo+IG11c3QgYmUgYSBjb25zdGFudCwgc28ga2VlcCB1c2luZyBDT05G
SUdfUEFHRV9PRkZTRVQgZm9yIHRoYXQgcHVycG9zZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVl
bCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgpSZXZpZXdlZC1ieTogSmVzc2Ug
VGF1YmUgPG1yLmJvc3NtYW4wNzVAZ21haWwuY29tPgoKPiAtLS0KPgo+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BhZ2UuaCAgICB8IDEyICsrKystLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3BndGFibGUuaCB8ICAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGFnZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKPiBpbmRleCAzMmQzMDhh
MzM1NWYuLjI0ZDFhYzA1MjYwOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BhZ2UuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4gQEAgLTI2LDEy
ICsyNiw5IEBACj4gICAqIFdoZW4gbm90IHVzaW5nIE1NVSB0aGlzIGNvcnJlc3BvbmRzIHRvIHRo
ZSBmaXJzdCBmcmVlIHBhZ2UgaW4KPiAgICogcGh5c2ljYWwgbWVtb3J5IChhbGlnbmVkIG9uIGEg
cGFnZSBib3VuZGFyeSkuCj4gICAqLwo+IC0jaWZkZWYgQ09ORklHXzY0QklUCj4gICNpZmRlZiBD
T05GSUdfTU1VCj4gKyNpZmRlZiBDT05GSUdfNjRCSVQKPiAgI2RlZmluZSBQQUdFX09GRlNFVCAg
ICAgICAgICAgIGtlcm5lbF9tYXAucGFnZV9vZmZzZXQKPiAtI2Vsc2UKPiAtI2RlZmluZSBQQUdF
X09GRlNFVCAgICAgICAgICAgIF9BQyhDT05GSUdfUEFHRV9PRkZTRVQsIFVMKQo+IC0jZW5kaWYK
PiAgLyoKPiAgICogQnkgZGVmYXVsdCwgQ09ORklHX1BBR0VfT0ZGU0VUIHZhbHVlIGNvcnJlc3Bv
bmRzIHRvIFNWNTcgYWRkcmVzcyBzcGFjZSBzbwo+ICAgKiBkZWZpbmUgdGhlIFBBR0VfT0ZGU0VU
IHZhbHVlIGZvciBTVjQ4IGFuZCBTVjM5Lgo+IEBAIC00MSw2ICszOCw5IEBACj4gICNlbHNlCj4g
ICNkZWZpbmUgUEFHRV9PRkZTRVQgICAgICAgICAgICBfQUMoQ09ORklHX1BBR0VfT0ZGU0VULCBV
TCkKPiAgI2VuZGlmIC8qIENPTkZJR182NEJJVCAqLwo+ICsjZWxzZQo+ICsjZGVmaW5lIFBBR0Vf
T0ZGU0VUICAgICAgICAgICAgKCh1bnNpZ25lZCBsb25nKXBoeXNfcmFtX2Jhc2UpCj4gKyNlbmRp
ZiAvKiBDT05GSUdfTU1VICovCj4KPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18KPgo+IEBAIC05Nywx
MSArOTcsNyBAQCB0eXBlZGVmIHN0cnVjdCBwYWdlICpwZ3RhYmxlX3Q7Cj4gICNkZWZpbmUgTUlO
X01FTUJMT0NLX0FERFIgICAgICAwCj4gICNlbmRpZgo+Cj4gLSNpZmRlZiBDT05GSUdfTU1VCj4g
ICNkZWZpbmUgQVJDSF9QRk5fT0ZGU0VUICAgICAgICAgICAgICAgIChQRk5fRE9XTigodW5zaWdu
ZWQgbG9uZylwaHlzX3JhbV9iYXNlKSkKPiAtI2Vsc2UKPiAtI2RlZmluZSBBUkNIX1BGTl9PRkZT
RVQgICAgICAgICAgICAgICAgKFBBR0VfT0ZGU0VUID4+IFBBR0VfU0hJRlQpCj4gLSNlbmRpZiAv
KiBDT05GSUdfTU1VICovCj4KPiAgc3RydWN0IGtlcm5lbF9tYXBwaW5nIHsKPiAgICAgICAgIHVu
c2lnbmVkIGxvbmcgcGFnZV9vZmZzZXQ7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBpbmRl
eCBlNzlmMTUyOTM0OTIuLmUyMjRhYzY2ZTYzNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oCj4gQEAgLTEyLDcgKzEyLDcgQEAKPiAgI2luY2x1ZGUgPGFzbS9wZ3RhYmxlLWJpdHMuaD4K
Pgo+ICAjaWZuZGVmIENPTkZJR19NTVUKPiAtI2RlZmluZSBLRVJORUxfTElOS19BRERSICAgICAg
IFBBR0VfT0ZGU0VUCj4gKyNkZWZpbmUgS0VSTkVMX0xJTktfQUREUiAgICAgICBfQUMoQ09ORklH
X1BBR0VfT0ZGU0VULCBVTCkKPiAgI2RlZmluZSBLRVJOX1ZJUlRfU0laRSAgICAgICAgIChVTCgt
MSkpCj4gICNlbHNlCj4KPiAtLQo+IDIuNDUuMQo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
