Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292EDC48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYGMSUKe/eK5J8AeFkGolw5iwwpCDDlnx8RU+NvTqBg=; b=NrnxDDklMGQhrn
	4gEK5fmdd8b3e1iMDbLredvqhDZFKlSEnoEdEMZcnmZVKA9OuHIT7/VLp4g8l7BhOEDaTeDS03zXN
	Rftn8OLzUhV4yWPD26LTdh1raF9oJry1D01+6Ag6JvwMYMxuMnn0sqgjOUcmkBI+oyxIWKQPfMkWX
	yu+albruNi8eSMUCwkzI/yqcmfSVz0kuEEin3j4tbU3b4aZhA7GjrC08w94YDpU5CDZGhYoqZ9HpG
	tZmkIJG//66CQ7kUhGGVYFzi1H4F48MBOyGuUID3vqNIo1z7Agm6b0MH6+RkXHwtWoxFkfzmUGtQp
	01stO3oKQsLzoWB45DUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5L4-00000004DtB-1NL2;
	Thu, 22 Feb 2024 09:25:58 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5L1-00000004Drl-2jPK
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:25:57 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d22b8801b9so22779851fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708593953; x=1709198753; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXa26b/do4x6rjZVpwya8dphZV/GXKaMCMBGS7MKkmE=;
        b=M5AA8Z/FmCGo68nc7SxXnreYbxnvB8/Q6C9V+FDPlmNV/7wtChxAXxbnNhjVHm44X5
         i3BafCC/zSqZzF41X6gLCVHRIZFUEZAnf2J8PXQToWbib8J1a9vppVB2Jd2d6OnLi0zY
         XdU4+gugkQhESzyP0Hsp+FOsTfMkoziSX2gnp6woZtgsqmfhRtB+Mws3MGiRZw6xuX9V
         PryUNRbFzHs/f3cbZiifThfYTL3DdDTENIFbn4hEU112dI2WIpL16vOYVHZK8Lwc+hZ4
         /kyy5QMb3lQGDvOAJrqZlXMh789KPCdkWfMnlSKoCBGFKs2+mHyaUnPsjTiS7NUvLRE5
         mOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708593953; x=1709198753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXa26b/do4x6rjZVpwya8dphZV/GXKaMCMBGS7MKkmE=;
        b=GyA5RptHTf384gxbYpYxjaxdVfbIakPlWbQMKxpDM5cHSIpbCTLFobbVbRnJqvsIIS
         8V+0UjTe/YddQyxvjh8pX5hN8axs/zisbdFVwuIEtMFluoRuJgKI6gkbYIbuQy/2yO4h
         vYk9U9Nmv0mUOrVKYI8zPcq3QqXT1DrHM0F+tV/hrAkzWB9WjyrwobsiLGjhI2HBiop+
         35lh416aZ3U1ImHuHrxJ2Iuf8cjWtCiJ0PJvhK1z33WQzrvuXplWHfty06ThTlXq84TM
         UtKhuGYbJp1Olt4/eHC4IDhR6/A0L5C0g3eDvLUlZ4i/cksYwrS9v/h7f5hcR9EaiGFc
         uBqg==
X-Forwarded-Encrypted: i=1; AJvYcCU9QE35Gshg/9MaGQdAxthuQZ4zHjQtWoZwiqdYW7PiNctWJ1Jh8QaHoMkls2OKwNN823Nhei1sDqCh3n4VuAp1B1i5Tc4TTNR9vUF/C4xA
X-Gm-Message-State: AOJu0YwoA17hwoWhqdfTXEAaQFcnNLx9Kt44VBfed+I4CEEfxKpb22re
	/+XbjQeYqQLvC7UDyJ367JWMRMqWk+c+4Lo4MKfmjlsmguEK9D1b4h/K0gxrSegck/3CEwmlFXr
	qnnUMmFRgjjdetKs317t1B3K/KYo9XNakwkeS/A==
X-Google-Smtp-Source: AGHT+IGlGxBEhsTqo9FqHO/379rXbEug7N4jBXFhG8qz1xaYzSc7MzoS2sjWb05IeCm3cpmisGgHr2G8p7weBLGns/o=
X-Received: by 2002:a05:651c:1426:b0:2d2:2b84:763c with SMTP id
 u38-20020a05651c142600b002d22b84763cmr8288472lje.10.1708593952748; Thu, 22
 Feb 2024 01:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-2-apatel@ventanamicro.com> <87il2jih04.ffs@tglx>
In-Reply-To: <87il2jih04.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 22 Feb 2024 14:55:41 +0530
Message-ID: <CAK9=C2V_SVWTuV_Yap_=X5RwgctUs7eWHGXSp8KFUz3bWNf9JQ@mail.gmail.com>
Subject: Re: [PATCH v13 01/13] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_012555_698628_13E082FD 
X-CRM114-Status: GOOD (  16.43  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgMzozOeKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDIwIDIwMjQgYXQgMTE6MzcsIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4gPiBUaGUgUExJQyBkcml2ZXIgZG9lcyBub3QgcmVxdWlyZSB2ZXJ5
IGVhcmx5IGluaXRpYWxpemF0aW9uIHNvIGxldAo+ID4gdXMgY29udmVydCBpdCBpbnRvIGEgcGxh
dGZvcm0gZHJpdmVyLgo+Cj4gcy9sZXQgdXMgY29udmVydC9jb252ZXJ0Lwo+Cj4gUGxlYXNlIHVz
IHBhc3NpdmUgdm9pY2UgYW5kIGltcGVyYXRpdmUgbW9vZCBhbGwgb3ZlciB0aGUgY2hhbmdlbG9n
cy4gTm8KPiB3ZS91cywgbGV0Li4uLgoKT2theSwgSSB3aWxsIHVwZGF0ZS4KCj4KPiA+IEFzIHBh
cnQgb2YgdGhlIGNvbnZlcnNpb24sIHRoZSBQTElDIHByb2JpbmcgdW5kZXJnb2VzIHRoZSBmb2xs
b3dpbmcKPiA+IGNoYW5nZXM6Cj4gPiAxLiBVc2UgZGV2X2luZm8oKSwgZGV2X2VycigpIGFuZCBk
ZXZfd2FybigpIGluc3RlYWQgb2YgcHJfaW5mbygpLAo+ID4gICAgcHJfZXJyKCkgYW5kIHByX3dh
cm4oKQo+ID4gMi4gVXNlIGRldm1feHl6KCkgQVBJcyB3aGVyZXZlciBhcHBsaWNhYmxlCj4gPiAz
LiBQTElDIGlzIG5vdyBwcm9iZWQgYWZ0ZXIgQ1BVcyBhcmUgYnJvdWdodC11cCBzbyB3ZSBoYXZl
IHRvCj4gPiAgICBzZXR1cCBjcHVocCBzdGF0ZSBhZnRlciBjb250ZXh0IGhhbmRsZXIgb2YgYWxs
IG9ubGluZSBDUFVzCj4gPiAgICBhcmUgaW5pdGlhbGl6ZWQgb3RoZXJ3aXNlIHdlIHNlZSBjcmFz
aCBvbiBtdWx0aS1zb2NrZXQgc3lzdGVtcwo+Cj4gVGhpcyBwYXRjaCBpcyByZWFsbHkgZG9pbmcg
dG9vIG1hbnkgdGhpbmdzIGF0IG9uY2UsIHdoaWNoIG1ha2VzIGl0IGhhcmQKPiB0byByZXZpZXcu
IENhbiB5b3Ugc3BsaXQgdGhpcyBpbnRvIGRpZ2VzdGFibGUgcGllY2VzIHBsZWFzZT8KClN1cmUs
IEkgd2lsbCBzcGxpdCB0aGlzIGludG8gc21hbGxlciBncmFudWxhciBwYXRjaGVzLgoKPgo+ID4g
ICAgICAgICAgICAgICBpZiAodW5saWtlbHkoZXJyKSkKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICBwcl93YXJuX3JhdGVsaW1pdGVkKCJjYW4ndCBmaW5kIG1hcHBpbmcgZm9yIGh3aXJxICVsdVxu
IiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICBkZXZfd2Fybl9yYXRlbGltaXRlZChoYW5kbGVy
LT5wcml2LT5kZXYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJj
YW4ndCBmaW5kIG1hcHBpbmcgZm9yIGh3aXJxICVsdVxuIiwKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaHdpcnEpOwo+Cj4gTml0LiBQbGVhc2UgdXNlIGJyYWNrZXRz
IGFyb3VuZCB0aGUgY29uZGl0aW9uLiBTZWU6Cj4KPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2Rv
Yy9odG1sL2xhdGVzdC9wcm9jZXNzL21haW50YWluZXItdGlwLmh0bWwjYnJhY2tldC1ydWxlcwo+
Cj4gZm9yIHJlYXNvbmluZy4KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgpSZWdhcmRzLApBbnVwCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
