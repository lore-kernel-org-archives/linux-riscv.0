Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38F1C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 20:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+5kWWv2P59iZ9ewrZCKygLNg5jolaHL7HDGAhDX62c=; b=U/sNPfK4d7rHls
	3haV1UYcDAhhjGWR3Rs5EqT/luP9cDhLGdEj6chHSj7TeP0lG49zkw8EEN4RlsHBcl788/Aw8Y9KF
	vrn8Ke/gaNIFFSXWbeZLI1+7JA6U1jF+fxcIvWISvv8B1IIaa9Es6q9Yp6hBQRgVPQDnUz/CvR7bD
	P2BZDhztkXPFAshx3rji3Nk5UCqvs3pjFiTn7SAIQMVDq3wzlMNWAiuFUBRLEKhtmib71z5K8SiO/
	De56kXRTqqe9Ff8LhgTC6zQgSR/IviwnWpFTEDRSNGnbKWKEyuqg5nNe+YcCblE2Dx/bk/dRVkuwG
	lD31TXErrzs+ofviUe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5tea-003024-08;
	Wed, 22 Nov 2023 20:16:56 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5teV-003013-1g;
	Wed, 22 Nov 2023 20:16:53 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1f92cc9b2c5so18716fac.1;
        Wed, 22 Nov 2023 12:16:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700684210; x=1701289010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+AKNbPfGcSitF9DQBk43/GENfS9BTVC5pjwY2CWch8=;
        b=CByHlT0yOYrxlQ2MJ06VyKf9hB49nJMPI7f+rQgIZi7Igr/LLcfqTduPGOvB1P/yus
         UuDNViqTCE06ejdsayPpVXM9eyv9sw53N93yQExqmiehvtNZ5YoGl1OW2je6KEvfPSyq
         sycP65809V8w1Hcc752tSlod83ILQbsn5gIQ+6MsjQr5X0ZK3c1Xz77mtuiJRuq4acWG
         33qPzNfXADfyweVue6TJLWkxxMgyuCILP27S6CrGPeaxOaVskzU5j7IIxQ6m54aI+CY8
         13dVjxiQuMgzMVO1mrvlOOTX5XwR4PIyTzEhmPPJCTPwG/0RGhoOJj9f6pG7uj97iq7O
         e/Dw==
X-Gm-Message-State: AOJu0YxhpVxgdtZPT4P4am9SAn5yWlCEQklVlz3Wk9FBeAH61DwnK2pk
	qCgpiyWLmhEJDqXM/o/B4FgJSSrWlLKZ7IvAsKM=
X-Google-Smtp-Source: AGHT+IEZOuwWL+O8Ns2NywQDonavCXvBHcgdxxi2QZSHFBHwzFPNR8Ac+xre6B7/Fz+/eqIGB2UbpAfb/c6ikknz6l8=
X-Received: by 2002:a05:6871:7a0:b0:1e9:8a7e:5893 with SMTP id
 o32-20020a05687107a000b001e98a7e5893mr4323044oap.5.1700684209905; Wed, 22 Nov
 2023 12:16:49 -0800 (PST)
MIME-Version: 1.0
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk> <E1r5R31-00Csyt-Jq@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1r5R31-00Csyt-Jq@rmk-PC.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 22 Nov 2023 21:16:39 +0100
Message-ID: <CAJZ5v0iYRXh369M3XTM0V8Q9mWkAT2y+9pJMD7HMaGjgpvFEMw@mail.gmail.com>
Subject: Re: [PATCH 05/21] ACPI: Move ACPI_HOTPLUG_CPU to be disabled on arm64
 and riscv
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, 
	Salil Mehta <salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, 
	justin.he@arm.com, James Morse <james.morse@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_121651_583825_C18BBE95 
X-CRM114-Status: GOOD (  26.53  )
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

T24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgMjo0NOKAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5l
bEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1v
cnNlQGFybS5jb20+Cj4KPiBOZWl0aGVyIGFybTY0IG5vciByaXNjdiBzdXBwb3J0IHBoeXNpY2Fs
IGhvdGFkZCBvZiBDUFVzIHRoYXQgd2VyZSBub3QKPiBwcmVzZW50IGF0IGJvb3QuIEZvciBhcm02
NCBtdWNoIG9mIHRoZSBwbGF0Zm9ybSBkZXNjcmlwdGlvbiBpcyBpbiBzdGF0aWMKPiB0YWJsZXMg
d2hpY2ggZG8gbm90IGhhdmUgdXBkYXRlIG1ldGhvZHMuIGFybTY0IGRvZXMgc3VwcG9ydCBIT1RQ
TFVHX0NQVSwKPiB3aGljaCBpcyBiYWNrZWQgYnkgYSBmaXJtd2FyZSBpbnRlcmZhY2UgdG8gdHVy
biBDUFVzIG9uIGFuZCBvZmYuCj4KPiBhY3BpX3Byb2Nlc3Nvcl9ob3RhZGRfaW5pdCgpIGFuZCBh
Y3BpX3Byb2Nlc3Nvcl9yZW1vdmUoKSBhcmUgZm9yIGFkZGluZwo+IGFuZCByZW1vdmluZyBDUFVz
IHRoYXQgd2VyZSBub3QgcHJlc2VudCBhdCBib290LiBhcm02NCBzeXN0ZW1zIHRoYXQgZG8gdGhp
cwo+IGFyZSBub3Qgc3VwcG9ydGVkIGFzIHRoZXJlIGlzIGN1cnJlbnRseSBpbnN1ZmZpY2llbnQg
aW5mb3JtYXRpb24gaW4gdGhlCj4gcGxhdGZvcm0gZGVzY3JpcHRpb24uIChlLmcuIGRpZCB0aGUg
R0lDUiBnZXQgcmVtb3ZlZCB0b28/KQo+Cj4gYXJtNjQgY3VycmVudGx5IHJlbGllcyBvbiB0aGUg
TUFEVCBlbmFibGVkIGZsYWcgY2hlY2sgaW4gbWFwX2dpY2NfbXBpZHIoKQo+IHRvIHByZXZlbnQg
Q1BVcyB0aGF0IHdlcmUgbm90IGRlc2NyaWJlZCBhcyBwcmVzZW50IGF0IGJvb3QgZnJvbSBiZWlu
Zwo+IGFkZGVkIHRvIHRoZSBzeXN0ZW0uIFNpbWlsYXJseSwgcmlzY3YgcmVsaWVzIG9uIHRoZSBz
YW1lIGNoZWNrIGluCj4gbWFwX3JpbnRjX2hhcnRpZCgpLiBCb3RoIGFyY2hpdGVjdHVyZXMgYWxz
byByZWx5IG9uIHRoZSB3ZWFrICdhbHdheXMgZmFpbHMnCj4gZGVmaW5pdGlvbnMgb2YgYWNwaV9t
YXBfY3B1KCkgYW5kIGFyY2hfcmVnaXN0ZXJfY3B1KCkuCj4KPiBTdWJzZXF1ZW50IGNoYW5nZXMg
d2lsbCByZWRlZmluZSBBQ1BJX0hPVFBMVUdfQ1BVIGFzIG1ha2luZyBwb3NzaWJsZQo+IENQVXMg
cHJlc2VudC4gTmVpdGhlciBhcm02NCBub3IgcmlzY3Ygc3VwcG9ydCB0aGlzLgo+Cj4gRGlzYWJs
ZSBBQ1BJX0hPVFBMVUdfQ1BVIGZvciBhcm02NCBhbmQgcmlzY3YgYnkgcmVtb3ZpbmcgJ2RlZmF1
bHQgeScgYW5kCj4gc2VsZWN0aW5nIGl0IG9uIHRoZSBvdGhlciB0aHJlZSBBQ1BJIGFyY2hpdGVj
dHVyZXMuIFRoaXMgYWxsb3dzIHRoZSB3ZWFrCj4gZGVmaW5pdGlvbnMgb2Ygc29tZSBzeW1ib2xz
IHRvIGJlIHJlbW92ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBNb3JzZSA8amFtZXMubW9y
c2VAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogU2hhb3FpbiBIdWFuZyA8c2hhaHVhbmdAcmVkaGF0
LmNvbT4KPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3Jn
LnVrPgoKSSBjYW4gYXBwbHkgdGhpcyBpZiBpdCBnZXRzIEFDS3MgZnJvbSB0aGUgbWFpbnRhaW5l
cnMgb2YgdGhlIGFmZmVjdGVkCmFyY2hpdGVjdHVyZXMuCgo+IC0tLQo+IENoYW5nZXMgc2luY2Ug
UkZDOgo+ICAqIEV4cGFuZGVkIGNvbmRpdGlvbnMgdG8gYXZvaWQgQUNQSV9IT1RQTFVHX0NQVSBi
ZWluZyBlbmFibGVkIHdoZW4KPiAgICBIT1RQTFVHX0NQVSBpc24ndC4KPiBDaGFuZ2VzIHNpbmNl
IFJGQyB2MzoKPiAgKiBEcm9wcGVkIGlhNjQgY2hhbmdlcwo+IC0tLQo+ICBhcmNoL2xvb25nYXJj
aC9LY29uZmlnICAgICAgICB8ICAxICsKPiAgYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAg
fCAgMSArCj4gIGRyaXZlcnMvYWNwaS9LY29uZmlnICAgICAgICAgIHwgIDEgLQo+ICBkcml2ZXJz
L2FjcGkvYWNwaV9wcm9jZXNzb3IuYyB8IDE4IC0tLS0tLS0tLS0tLS0tLS0tLQo+ICA0IGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZyBiL2FyY2gvbG9vbmdhcmNoL0tjb25maWcKPiBpbmRl
eCBlZTEyMzgyMGE0NzYuLjMzMWJlY2IyY2I0ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL2xvb25nYXJj
aC9LY29uZmlnCj4gKysrIGIvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZwo+IEBAIC01LDYgKzUsNyBA
QCBjb25maWcgTE9PTkdBUkNICj4gICAgICAgICBzZWxlY3QgQUNQSQo+ICAgICAgICAgc2VsZWN0
IEFDUElfR0VORVJJQ19HU0kgaWYgQUNQSQo+ICAgICAgICAgc2VsZWN0IEFDUElfTUNGRyBpZiBB
Q1BJCj4gKyAgICAgICBzZWxlY3QgQUNQSV9IT1RQTFVHX0NQVSBpZiBBQ1BJX1BST0NFU1NPUiAm
JiBIT1RQTFVHX0NQVQo+ICAgICAgICAgc2VsZWN0IEFDUElfUFBUVCBpZiBBQ1BJCj4gICAgICAg
ICBzZWxlY3QgQUNQSV9TWVNURU1fUE9XRVJfU1RBVEVTX1NVUFBPUlQgaWYgQUNQSQo+ICAgICAg
ICAgc2VsZWN0IEFSQ0hfQklORk1UX0VMRl9TVEFURQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9L
Y29uZmlnIGIvYXJjaC94ODYvS2NvbmZpZwo+IGluZGV4IDM3NjJmNDFiYjA5Mi4uZGJkY2ZjNzA4
MzY5IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L0tjb25maWcKPiArKysgYi9hcmNoL3g4Ni9LY29u
ZmlnCj4gQEAgLTU5LDYgKzU5LDcgQEAgY29uZmlnIFg4Ngo+ICAgICAgICAgIwo+ICAgICAgICAg
c2VsZWN0IEFDUElfTEVHQUNZX1RBQkxFU19MT09LVVAgICAgICAgIGlmIEFDUEkKPiAgICAgICAg
IHNlbGVjdCBBQ1BJX1NZU1RFTV9QT1dFUl9TVEFURVNfU1VQUE9SVCBpZiBBQ1BJCj4gKyAgICAg
ICBzZWxlY3QgQUNQSV9IT1RQTFVHX0NQVSAgICAgICAgICAgICAgICAgaWYgQUNQSV9QUk9DRVNT
T1IgJiYgSE9UUExVR19DUFUKPiAgICAgICAgIHNlbGVjdCBBUkNIXzMyQklUX09GRl9UICAgICAg
ICAgICAgICAgICBpZiBYODZfMzIKPiAgICAgICAgIHNlbGVjdCBBUkNIX0NMT0NLU09VUkNFX0lO
SVQKPiAgICAgICAgIHNlbGVjdCBBUkNIX0NPUlJFQ1RfU1RBQ0tUUkFDRV9PTl9LUkVUUFJPQkUK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL0tjb25maWcgYi9kcml2ZXJzL2FjcGkvS2NvbmZp
Zwo+IGluZGV4IGY4MTllNzYwZmYxOS4uYTNhY2ZjNzUwZmNlIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvYWNwaS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9hY3BpL0tjb25maWcKPiBAQCAtMzEwLDcg
KzMxMCw2IEBAIGNvbmZpZyBBQ1BJX0hPVFBMVUdfQ1BVCj4gICAgICAgICBib29sCj4gICAgICAg
ICBkZXBlbmRzIG9uIEFDUElfUFJPQ0VTU09SICYmIEhPVFBMVUdfQ1BVCj4gICAgICAgICBzZWxl
Y3QgQUNQSV9DT05UQUlORVIKPiAtICAgICAgIGRlZmF1bHQgeQo+Cj4gIGNvbmZpZyBBQ1BJX1BS
T0NFU1NPUl9BR0dSRUdBVE9SCj4gICAgICAgICB0cmlzdGF0ZSAiUHJvY2Vzc29yIEFnZ3JlZ2F0
b3IiCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9hY3BpX3Byb2Nlc3Nvci5jIGIvZHJpdmVy
cy9hY3BpL2FjcGlfcHJvY2Vzc29yLmMKPiBpbmRleCAwZjUyMThlMzYxZGYuLjRmZTJlZjU0MDg4
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYwo+ICsrKyBiL2Ry
aXZlcnMvYWNwaS9hY3BpX3Byb2Nlc3Nvci5jCj4gQEAgLTE4NCwyNCArMTg0LDYgQEAgc3RhdGlj
IHZvaWQgX19pbml0IGFjcGlfcGNjX2NwdWZyZXFfaW5pdCh2b2lkKSB7fQo+Cj4gIC8qIEluaXRp
YWxpemF0aW9uICovCj4gICNpZmRlZiBDT05GSUdfQUNQSV9IT1RQTFVHX0NQVQo+IC1pbnQgX193
ZWFrIGFjcGlfbWFwX2NwdShhY3BpX2hhbmRsZSBoYW5kbGUsCj4gLSAgICAgICAgICAgICAgIHBo
eXNfY3B1aWRfdCBwaHlzaWQsIHUzMiBhY3BpX2lkLCBpbnQgKnBjcHUpCj4gLXsKPiAtICAgICAg
IHJldHVybiAtRU5PREVWOwo+IC19Cj4gLQo+IC1pbnQgX193ZWFrIGFjcGlfdW5tYXBfY3B1KGlu
dCBjcHUpCj4gLXsKPiAtICAgICAgIHJldHVybiAtRU5PREVWOwo+IC19Cj4gLQo+IC1pbnQgX193
ZWFrIGFyY2hfcmVnaXN0ZXJfY3B1KGludCBjcHUpCj4gLXsKPiAtICAgICAgIHJldHVybiAtRU5P
REVWOwo+IC19Cj4gLQo+IC12b2lkIF9fd2VhayBhcmNoX3VucmVnaXN0ZXJfY3B1KGludCBjcHUp
IHt9Cj4gLQo+ICBzdGF0aWMgaW50IGFjcGlfcHJvY2Vzc29yX2hvdGFkZF9pbml0KHN0cnVjdCBh
Y3BpX3Byb2Nlc3NvciAqcHIpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgbG9uZyBzdGE7
Cj4gLS0KPiAyLjMwLjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
