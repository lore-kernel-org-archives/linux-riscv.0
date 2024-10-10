Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79766CF11E1
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfmP44FhMX3DVYeDY1UAcgNqhWTLu3JCqb6F2dpnFtY=; b=TDP9nFUZEgblJI
	kFTr/dHiVfY96p1JecDxkIemNGqiAOb2FJG7CDdp5HwFwf1C2tEL8qYKA74hvNA6aXsrB/a5XexyR
	erxUN+Cg4H6/qhhQKZB2MkAvMqdPYSBYXNtAcPO26mZ4dks9LfXeOOfRgJOuvdObU9QIgf85trq7r
	TwGs1jDTgEGIf7g1vV1PVQDw+Njx0itSiKHrMLrefvzXYx+w8wgsFX8+LY+GyuiQcBLFP/iKQ6BjH
	mNILCVW9MDQ8QFXFH55CCcMCXkWYIoMafdNmsxiSs4Eyc9f1aTEJAr4eIczUGuuYbW7GWua8MAa41
	yY8V56FNDFrcGtE/k72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sys6B-0000000CgCV-2y0g;
	Thu, 10 Oct 2024 12:16:55 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syrYJ-0000000CaGJ-3NHR
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 11:41:57 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a3a3a9e4ffso2541135ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1728560515; x=1729165315; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLGEeXitWZKflpz7f8dvCOzHMw8lQ7/MkR5+khK1S4U=;
        b=NqDKW+GF+dMq6iwDTeFnnwg3bo9niSf6waU2rECeIzbb31lr9CmGWCEpk3O8RiDxZ2
         WqgHt/+EamPUNIso9dyNGabD7dR+ZgOoKL5lXNYW9oU9vHOF1s9i88Sgws6LmmBHt/F6
         Gl72lm53Q373ulMWrsbAa1rHelpfiVsNNvicZmWbCVeRfexnL3KZuhFtjEqNLynxrQN1
         vcJ4360CosN6E5jzavzHn2FXGXnnmwMAvg8q+30VVFmetumJHR7UcXhs2zpb/nEtuBCA
         llvDoQtVVIJuz6ctitQjt/P7mN7Z5GPSb6e/kgr7QhtoIqGWamUevUIKS7hYX+s9Cp9i
         TTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728560515; x=1729165315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLGEeXitWZKflpz7f8dvCOzHMw8lQ7/MkR5+khK1S4U=;
        b=LSRgCsv08PFdmhbvAvN90ONEjG83nqrkXBxK+P5epiiQycgJOZz6tZzABTpMLx5GFN
         PD3ihNT8hXTN542vGCfiaNerRBgV6PsF4bECPy4MPUnpiP74khhMUEB7mMeZLA3PrUON
         snyY2h4HvtAGl3SDIVZibagcCGpo7QHgfe73LlbGBR8K4a+WbNUVDdGaaENuBfMuQQDO
         kcwnnpyJYQwIUbHOxiVSPzlIISBm7QIcT3bJkUzA7W9WIwcoHBQt+9SJNpJubrou44tw
         UHNrCnyRjh8GhrzT949gThRRZCozCscI+sDnlePSyZCz1RMgYd4gKf2XyQgt4thU59qR
         lYgA==
X-Forwarded-Encrypted: i=1; AJvYcCVSgsN7eJL0qpUV0dZ15/r2xSv2bgS7vvFmCk4I1rl2QolUg9LugZG5zY2xJky5rXna7b8ukevQS50/fw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmXYtAO+DNXBWSuP2YrDKnucVDDuBKiiaKFyoktWwmIzweaEMs
	rtUAV1WNmERy1itmZ5yRqqTMg53IIeB3A/5ATGj2uWDAOD0jgeEpjIKpPfEFWDMB//MAPM4nnbB
	Gy98xs+tPIlnItciVxHY6WjaNxe5SnR7wxDD8qg==
X-Google-Smtp-Source: AGHT+IGdjd1/XT2c4B0Z8vQGIotkt4pyM5B4YYch5zcEe11pNDikzWWp/JAP0Tw+7KI97Zc523H2fMoWAABaV3y6nik=
X-Received: by 2002:a92:c265:0:b0:39f:325f:78e6 with SMTP id
 e9e14a558f8ab-3a3a6d2747dmr16106495ab.0.1728560514733; Thu, 10 Oct 2024
 04:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-2-seanjc@google.com>
In-Reply-To: <20241009154953.1073471-2-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Oct 2024 17:11:43 +0530
Message-ID: <CAAhSdy0Z27X9KMF-ps97-s5==7xdA=6B84Mxa2b-um_t+NjWkg@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] KVM: Move KVM_REG_SIZE() definition to common
 uAPI header
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_044156_055060_07AEBF52 
X-CRM114-Status: GOOD (  16.50  )
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

T24gV2VkLCBPY3QgOSwgMjAyNCBhdCA5OjE54oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gRGVmaW5lIEtWTV9SRUdfU0laRSgpIGluIHRoZSBj
b21tb24ga3ZtLmggaGVhZGVyLCBhbmQgZGVsZXRlIHRoZSBhcm02NCBhbmQKPiBSSVNDLVYgdmVy
c2lvbnMuICBBcyBldmlkZW5jZWQgYnkgdGhlIHN1cnJvdW5kaW5nIGRlZmluaXRpb25zLCBhbGwg
YXNwZWN0cwo+IG9mIHRoZSByZWdpc3RlciBzaXplIGVuY29kaW5nIGFyZSBnZW5lcmljLCBpLmUu
IFJJU0MtViBzaG91bGQgaGF2ZSBtb3ZlZAo+IGFybTY0J3MgZGVmaW5pdGlvbiB0byBjb21tb24g
Y29kZSBpbnN0ZWFkIG9mIGNvcHkrcGFzdGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hy
aXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgoKRm9yIEtWTSBSSVNDLVY6CkFja2VkLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+
ICBhcmNoL2FybTY0L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAzIC0tLQo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAzIC0tLQo+ICBpbmNsdWRlL3VhcGkvbGludXgva3Zt
LmggICAgICAgICAgfCA0ICsrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXggOTY0
ZGYzMWRhOTc1Li44MGIyNjEzNGU1OWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRl
L3VhcGkvYXNtL2t2bS5oCj4gKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL3VhcGkvYXNtL2t2bS5o
Cj4gQEAgLTQzLDkgKzQzLDYgQEAKPiAgI2RlZmluZSBLVk1fQ09BTEVTQ0VEX01NSU9fUEFHRV9P
RkZTRVQgMQo+ICAjZGVmaW5lIEtWTV9ESVJUWV9MT0dfUEFHRV9PRkZTRVQgNjQKPgo+IC0jZGVm
aW5lIEtWTV9SRUdfU0laRShpZCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiAtICAgICAgICgxVSA8PCAoKChpZCkgJiBLVk1fUkVHX1NJWkVfTUFTSykg
Pj4gS1ZNX1JFR19TSVpFX1NISUZUKSkKPiAtCj4gIHN0cnVjdCBrdm1fcmVncyB7Cj4gICAgICAg
ICBzdHJ1Y3QgdXNlcl9wdF9yZWdzIHJlZ3M7ICAgICAgIC8qIHNwID0gc3BfZWwwICovCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXggZTk3ZGIzMjk2NDU2Li40ZjhkMGMwNGE0
N2IgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gQEAgLTIwNyw5ICsyMDcsNiBA
QCBzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9zdGEgewo+ICAjZGVmaW5lIEtWTV9SSVNDVl9USU1FUl9T
VEFURV9PRkYgICAgICAwCj4gICNkZWZpbmUgS1ZNX1JJU0NWX1RJTUVSX1NUQVRFX09OICAgICAg
IDEKPgo+IC0jZGVmaW5lIEtWTV9SRUdfU0laRShpZCkgICAgICAgICAgICAgICBcCj4gLSAgICAg
ICAoMVUgPDwgKCgoaWQpICYgS1ZNX1JFR19TSVpFX01BU0spID4+IEtWTV9SRUdfU0laRV9TSElG
VCkpCj4gLQo+ICAvKiBJZiB5b3UgbmVlZCB0byBpbnRlcnByZXQgdGhlIGluZGV4IHZhbHVlcywg
aGVyZSBpcyB0aGUga2V5OiAqLwo+ICAjZGVmaW5lIEtWTV9SRUdfUklTQ1ZfVFlQRV9NQVNLICAg
ICAgICAgICAgICAgIDB4MDAwMDAwMDBGRjAwMDAwMAo+ICAjZGVmaW5lIEtWTV9SRUdfUklTQ1Zf
VFlQRV9TSElGVCAgICAgICAyNAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3Zt
LmggYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmgKPiBpbmRleCA2MzdlZmMwNTUxNDUuLjlkZWVi
MTNlM2UwMSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtLmgKPiArKysgYi9p
bmNsdWRlL3VhcGkvbGludXgva3ZtLmgKPiBAQCAtMTA3MCw2ICsxMDcwLDEwIEBAIHN0cnVjdCBr
dm1fZGlydHlfdGxiIHsKPgo+ICAjZGVmaW5lIEtWTV9SRUdfU0laRV9TSElGVCAgICAgNTIKPiAg
I2RlZmluZSBLVk1fUkVHX1NJWkVfTUFTSyAgICAgIDB4MDBmMDAwMDAwMDAwMDAwMFVMTAo+ICsK
PiArI2RlZmluZSBLVk1fUkVHX1NJWkUoaWQpICAgICAgICAgICAgICAgXAo+ICsgICAgICAgKDFV
IDw8ICgoKGlkKSAmIEtWTV9SRUdfU0laRV9NQVNLKSA+PiBLVk1fUkVHX1NJWkVfU0hJRlQpKQo+
ICsKPiAgI2RlZmluZSBLVk1fUkVHX1NJWkVfVTggICAgICAgICAgICAgICAgMHgwMDAwMDAwMDAw
MDAwMDAwVUxMCj4gICNkZWZpbmUgS1ZNX1JFR19TSVpFX1UxNiAgICAgICAweDAwMTAwMDAwMDAw
MDAwMDBVTEwKPiAgI2RlZmluZSBLVk1fUkVHX1NJWkVfVTMyICAgICAgIDB4MDAyMDAwMDAwMDAw
MDAwMFVMTAo+IC0tCj4gMi40Ny4wLnJjMC4xODcuZ2U2NzBiY2NmN2UtZ29vZwo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
