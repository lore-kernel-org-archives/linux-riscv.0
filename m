Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A93EC54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 08:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MV+zwd781d/bphUMITbfIlBK5OBso63Rw557S3TV/uc=; b=yL7eJto4a5IMe3
	prY44FsGFXZRr6de2BMEtJf8dAjgk+SadjG63TKuVXxixF2FGGOZhP522tFGIMpFNxmhIPhFhtbKm
	4OFXadxtOw1cNpcV04xz1hxQxkyFpGUKZeV43v2Ve3k0ZUaosgGT0t8AEataDVw3LkWQ4zknIjHda
	pXb5zyWwN7BFN6ill4EHWFH+jnmZsbOFr4EPqrPALr1Ae9YXtNuViTmq7KQmNpreL3ElUvd7dTK+9
	rrCMXPCAjuf/mRBxSxwhqr++eRf6tTpeYI8s2g2flx4UqrA++uAMR53Pe00b3l6roGCeVs3BwNETg
	tW22zWnFdB5a+gJqXRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQNn-0000000Cebe-3egk;
	Tue, 05 Mar 2024 08:42:43 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQNk-0000000CeZt-3CGj
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 08:42:42 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2d180d6bd32so68272211fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 00:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709628159; x=1710232959; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/6peNBdk69VycNv0NnzT94cpIyuuvaLqCVKnWNPdGI=;
        b=OyUBIFlHecOGujM1kpdYYXzSl6+gv/TFG8osjT2vlhb9XloHOhgMfsCqaQZqiNlTTH
         f59ODhqQJjFQ5J4FupLzA6dY6X6reV0kiT1Lo9BHRnCPe7EhbYLXE2+2Vat2Peb7U9S5
         0a465BNzi5qn2cxJlMRXeuTAI5kvG+UAn6d5kfQCrQHESEd71SBdivGacbyNAbM92I0l
         VVx4nFUExIxVoU2DS4gqieZpQS8bP94UFhJ3rkew2zdg2RaTbVfpAJrTPGXXqxaGUvp3
         U9jU15OaB4Apy42RY6ZCYtkI1Fxb1u1OCI9ai7bxkaDGAK/CjUeDVY7mKh6BBPX5L1P6
         VrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709628159; x=1710232959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/6peNBdk69VycNv0NnzT94cpIyuuvaLqCVKnWNPdGI=;
        b=o0V95y6HAbD4TxjxGRVeZITwiPmo8qEV9A1ywEPflKzbGAXmzja+6gA3/74Av6JzCJ
         g1GOntQTtvagGAGIl6UjHSkRVXQ/FQzDjhzYYmSSTf63wVHvyH0FMep642sOxfmtS/C4
         9wtNk3UnodTzg5/DzyXOxRa9tb/2d2iABxGoaxvcK8E3s0/idc6/WjUhqvHu9EHDELb6
         8GOQt8ue7g1g2xBId9YFYLqcgeLTIiBunGFPLXYDsboCSAEkjcxH5/BX12ZnKbKriMd5
         k/aT3oZS7V+kYHrwz8D7lBpccaXWuNvnkf7U9LeE5z1xpcFw7e/cHvFrtEjyca1lRQ84
         rryQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc3pjtZ9Txy24smTjuUEkq+zwTtD6j4rnt66mFkYkRtLsADGzMgufCjze01eSBgk/B+Kkuut7i0uRJBRf7nm4KyruU5q+AF+V1fqmN4Ti+
X-Gm-Message-State: AOJu0YwV+5Lw9yWls/+Zg1MIWEN0/PmD2SiSSs/9al97oCT2KezWcyKl
	2gEuRii+IDooUxif4cCZw1qLFeKDw6INCJcFKncU4OT3svNS8FKTkYXLvSWKINwKLGBxthcJDoK
	fldweXeIiBNckxzmLxhiMFk0EXQY=
X-Google-Smtp-Source: AGHT+IHyY77JiYRLDD6eQqOVrpXJRS94mPpqIWxOA1v3+O5DjbZ2B6MqEj48fOLN0m3u1rRN77VrKtOPvZSR6dDTTyc=
X-Received: by 2002:a2e:b0e5:0:b0:2d3:ba52:f878 with SMTP id
 h5-20020a2eb0e5000000b002d3ba52f878mr812382ljl.0.1709628158807; Tue, 05 Mar
 2024 00:42:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706603678.git.haibo1.xu@intel.com> <a1e20de53156f50385c7609507982f08866e859b.1706603678.git.haibo1.xu@intel.com>
 <ZeailF+UYf/+4NQq@sunil-laptop>
In-Reply-To: <ZeailF+UYf/+4NQq@sunil-laptop>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Tue, 5 Mar 2024 16:42:27 +0800
Message-ID: <CAJve8okkwtvheMMURhsuboLwA+jMtryf-fn0nOvYzTMGX63yvA@mail.gmail.com>
Subject: Re: [PATCH 2/4] ACPI: NUMA: Add handler for SRAT RINTC affinity structure
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Baoquan He <bhe@redhat.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Chen Jiahao <chenjiahao16@huawei.com>, James Morse <james.morse@arm.com>, 
	Evan Green <evan@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>, Yuntao Wang <ytcoode@gmail.com>, 
	Alison Schofield <alison.schofield@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_004240_840909_ACE99782 
X-CRM114-Status: GOOD (  28.79  )
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

T24gVHVlLCBNYXIgNSwgMjAyNCBhdCAxMjo0MuKAr1BNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEhpIEhhaWJvLAo+Cj4gT24gV2VkLCBKYW4gMzEsIDIw
MjQgYXQgMTA6MzE6NTlBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBBZGQgUklOVEMgYWZm
aW5pdHkgc3RydWN0dXJlIGhhbmRsZXIgZHVyaW5nIHBhcnNpbmcgU1JBVCB0YWJsZS4KPiA+IFRo
ZSBBUkNIIHNwZWNpZmljIGltcGxlbWVudGF0aW9uIHdpbGwgYmUgYWRkZWQgaW4gbmV4dCBwYXRj
aC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvYWNwaS9udW1hL3NyYXQuYyB8IDMyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystCj4gPiAgaW5jbHVkZS9saW51eC9hY3BpLmggICAgIHwgIDMgKysr
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9udW1hL3NyYXQuYyBiL2RyaXZlcnMvYWNw
aS9udW1hL3NyYXQuYwo+ID4gaW5kZXggMDIxNDUxOGZjNTgyLi41MDNhYmNmNjEyNWQgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL2FjcGkvbnVtYS9zcmF0LmMKPiA+ICsrKyBiL2RyaXZlcnMvYWNw
aS9udW1hL3NyYXQuYwo+ID4gQEAgLTE2NSw2ICsxNjUsMTkgQEAgYWNwaV90YWJsZV9wcmludF9z
cmF0X2VudHJ5KHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRlciAqaGVhZGVyKQo+ID4gICAgICAg
ICAgICAgICB9Cj4gPiAgICAgICB9Cj4gPiAgICAgICBicmVhazsKPiA+ICsKPiA+ICsgICAgIGNh
c2UgQUNQSV9TUkFUX1RZUEVfUklOVENfQUZGSU5JVFk6Cj4gPiArICAgICAgICAgICAgIHsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYWNwaV9zcmF0X3JpbnRjX2FmZmluaXR5ICpw
ID0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgKHN0cnVjdCBhY3BpX3NyYXRfcmludGNf
YWZmaW5pdHkgKiloZWFkZXI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcHJfZGVidWcoIlNS
QVQgUHJvY2Vzc29yIChhY3BpIGlkWzB4JTA0eF0pIGluIHByb3hpbWl0eSBkb21haW4gJWQgJXNc
biIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcC0+YWNwaV9wcm9jZXNzb3Jf
dWlkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAtPnByb3hpbWl0eV9kb21h
aW4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHAtPmZsYWdzICYgQUNQSV9T
UkFUX1JJTlRDX0VOQUJMRUQpID8KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
ZW5hYmxlZCIgOiAiZGlzYWJsZWQiKTsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAgICAgICAg
ICAgICBicmVhazsKPiA+ICsKPiA+ICAgICAgIGRlZmF1bHQ6Cj4gPiAgICAgICAgICAgICAgIHBy
X3dhcm4oIkZvdW5kIHVuc3VwcG9ydGVkIFNSQVQgZW50cnkgKHR5cGUgPSAweCV4KVxuIiwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICBoZWFkZXItPnR5cGUpOwo+ID4gQEAgLTQ0OCw2ICs0NjEs
MjEgQEAgYWNwaV9wYXJzZV9naV9hZmZpbml0eSh1bmlvbiBhY3BpX3N1YnRhYmxlX2hlYWRlcnMg
KmhlYWRlciwKPiA+ICB9Cj4gPiAgI2VuZGlmIC8qIGRlZmluZWQoQ09ORklHX1g4NikgfHwgZGVm
aW5lZCAoQ09ORklHX0FSTTY0KSAqLwo+ID4KPiA+ICtzdGF0aWMgaW50IF9faW5pdAo+ID4gK2Fj
cGlfcGFyc2VfcmludGNfYWZmaW5pdHkodW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFk
ZXIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQo+
IEFsaWdubWVudCBkb2Vzbid0IGxvb2sgcmlnaHQuIENvdWxkIHlvdSBwbGVhc2UgcnVuIGNoZWNr
cGF0Y2ggb24gYWxsCj4gdGhlIHBhdGNoZXM/Cj4KClNlZW1zIHNvbWV0aGluZyBpcyB3cm9uZyB3
aXRoIG15IHZpbSBjb25maWd1cmF0aW9uLgpXaWxsIGZpeCBpdCBpbiB2Mi4KCj4gPiArewo+ID4g
KyAgICAgc3RydWN0IGFjcGlfc3JhdF9yaW50Y19hZmZpbml0eSAqcmludGNfYWZmaW5pdHk7Cj4g
PiArCj4gPiArICAgICByaW50Y19hZmZpbml0eSA9IChzdHJ1Y3QgYWNwaV9zcmF0X3JpbnRjX2Fm
ZmluaXR5ICopaGVhZGVyOwo+ID4gKyAgICAgYWNwaV90YWJsZV9wcmludF9zcmF0X2VudHJ5KCZo
ZWFkZXItPmNvbW1vbik7Cj4gPiArCj4gPiArICAgICAvKiBsZXQgYXJjaGl0ZWN0dXJlLWRlcGVu
ZGVudCBwYXJ0IHRvIGRvIGl0ICovCj4gPiArICAgICBhY3BpX251bWFfcmludGNfYWZmaW5pdHlf
aW5pdChyaW50Y19hZmZpbml0eSk7Cj4gPiArCj4gSXMgaXQgcmVxdWlyZWQgdG8gaGF2ZSB0aGlz
IGNvbW1pdCBmaXJzdCBwcmlvciB0byBhcmNoaXRlY3R1cmUKPiBmdW5jdGlvbmFsaXR5PyBJIGFt
IHdvbmRlcmluZyB3aGV0aGVyIGl0IGlzIGxvZ2ljYWxseSBiZXR0ZXIgdG8KPiBpbXBsZW1lbnQg
dGhlIGZ1bmN0aW9uIGZpcnN0IGFuZCB0aGVuIGNvbnN1bWUgaW4gbmV4dCBjb21taXQ/Cj4KCk5v
IGRlcGVuZGVuY3kgYmV0d2VlbiB0aGlzIGNvbW1pdCBhbmQgdGhlIG5leHQgY29tbWl0LgpXaWxs
IGNoYW5nZSB0aGUgb3JkZXIgaW4gdjIuCgo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4g
Kwo+ID4gIHN0YXRpYyBpbnQgX19pbml0ZGF0YSBwYXJzZWRfbnVtYV9tZW1ibGtzOwo+ID4KPiA+
ICBzdGF0aWMgaW50IF9faW5pdAo+ID4gQEAgLTUwMSw3ICs1MjksNyBAQCBpbnQgX19pbml0IGFj
cGlfbnVtYV9pbml0KHZvaWQpCj4gPgo+ID4gICAgICAgLyogU1JBVDogU3lzdGVtIFJlc291cmNl
IEFmZmluaXR5IFRhYmxlICovCj4gPiAgICAgICBpZiAoIWFjcGlfdGFibGVfcGFyc2UoQUNQSV9T
SUdfU1JBVCwgYWNwaV9wYXJzZV9zcmF0KSkgewo+ID4gLSAgICAgICAgICAgICBzdHJ1Y3QgYWNw
aV9zdWJ0YWJsZV9wcm9jIHNyYXRfcHJvY1s0XTsKPiA+ICsgICAgICAgICAgICAgc3RydWN0IGFj
cGlfc3VidGFibGVfcHJvYyBzcmF0X3Byb2NbNV07Cj4gPgo+ID4gICAgICAgICAgICAgICBtZW1z
ZXQoc3JhdF9wcm9jLCAwLCBzaXplb2Yoc3JhdF9wcm9jKSk7Cj4gPiAgICAgICAgICAgICAgIHNy
YXRfcHJvY1swXS5pZCA9IEFDUElfU1JBVF9UWVBFX0NQVV9BRkZJTklUWTsKPiA+IEBAIC01MTIs
NiArNTQwLDggQEAgaW50IF9faW5pdCBhY3BpX251bWFfaW5pdCh2b2lkKQo+ID4gICAgICAgICAg
ICAgICBzcmF0X3Byb2NbMl0uaGFuZGxlciA9IGFjcGlfcGFyc2VfZ2ljY19hZmZpbml0eTsKPiA+
ICAgICAgICAgICAgICAgc3JhdF9wcm9jWzNdLmlkID0gQUNQSV9TUkFUX1RZUEVfR0VORVJJQ19B
RkZJTklUWTsKPiA+ICAgICAgICAgICAgICAgc3JhdF9wcm9jWzNdLmhhbmRsZXIgPSBhY3BpX3Bh
cnNlX2dpX2FmZmluaXR5Owo+ID4gKyAgICAgICAgICAgICBzcmF0X3Byb2NbNF0uaWQgPSBBQ1BJ
X1NSQVRfVFlQRV9SSU5UQ19BRkZJTklUWTsKPiA+ICsgICAgICAgICAgICAgc3JhdF9wcm9jWzRd
LmhhbmRsZXIgPSBhY3BpX3BhcnNlX3JpbnRjX2FmZmluaXR5Owo+ID4KPiA+ICAgICAgICAgICAg
ICAgYWNwaV90YWJsZV9wYXJzZV9lbnRyaWVzX2FycmF5KEFDUElfU0lHX1NSQVQsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3QgYWNwaV90YWJs
ZV9zcmF0KSwKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2FjcGkuaCBiL2luY2x1ZGUv
bGludXgvYWNwaS5oCj4gPiBpbmRleCBiNzE2NWU1MmIzYzYuLmE2NTI3M2RiNTVjNiAxMDA2NDQK
PiA+IC0tLSBhL2luY2x1ZGUvbGludXgvYWNwaS5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2Fj
cGkuaAo+ID4gQEAgLTI2OSw2ICsyNjksOSBAQCBhY3BpX251bWFfZ2ljY19hZmZpbml0eV9pbml0
KHN0cnVjdCBhY3BpX3NyYXRfZ2ljY19hZmZpbml0eSAqcGEpIHsgfQo+ID4KPiA+ICBpbnQgYWNw
aV9udW1hX21lbW9yeV9hZmZpbml0eV9pbml0IChzdHJ1Y3QgYWNwaV9zcmF0X21lbV9hZmZpbml0
eSAqbWEpOwo+ID4KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQKPiA+ICthY3BpX251bWFfcmludGNf
YWZmaW5pdHlfaW5pdChzdHJ1Y3QgYWNwaV9zcmF0X3JpbnRjX2FmZmluaXR5ICpwYSkgeyB9Cj4g
PiArCj4gSSB0aGluayB0aGlzIGNhbiBiZSBmaXQgaW4gc2luZ2xlIGxpa2UgYXMgd2UgY2FuIGhh
dmUgdXB0byAxMDAKPiBjaGFyYWN0ZXJzLgo+CgpTdXJlLiB3aWxsIGZpeCBpdCBpbiB2Mi4KClRo
YW5rcywKSGFpYm8KCj4gPiAgI2lmbmRlZiBQSFlTX0NQVUlEX0lOVkFMSUQKPiA+ICB0eXBlZGVm
IHUzMiBwaHlzX2NwdWlkX3Q7Cj4gPiAgI2RlZmluZSBQSFlTX0NQVUlEX0lOVkFMSUQgKHBoeXNf
Y3B1aWRfdCkoLTEpCj4gPiAtLQo+ID4gMi4zNC4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
