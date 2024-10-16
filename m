Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DC4D2F7C8
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 21:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mqjhru559J2wXRYv7x2rF7rCS4v+RYqJPQbAf7z20M=; b=PZENDbly7rewe6
	hLAMVeOtzj39igDWAaiKN9NKBzxxXc0KKzyi7JAKQ3BMS+e7DxlE+VV2cOVdobDL2c3zdZIGktAH9
	D6u8GaTZHDyD43PH/LzDdS9Dl38rWQZfOKcIezVq4Z6O9QL0MQ7GrGYG1CPmYJC3WxGYkdNuUQzH8
	Y6JbvufIFu/cbsEee95v1H5u3i+wUfKJJsppSlUI5mROPLWED8mvRchlHepoLiiGWgoWtr968uqLZ
	i1i0Btr/0ZRnH7NPfl2iJPNeQM3TtALN2FP+C5vmALbnaTHqEcVj+byaoRxhEER+GQ68vGF/DyPtR
	zMR7a6/IUHmQhjkgV8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1BjX-0000000D4Hv-3XVV;
	Wed, 16 Oct 2024 21:39:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Bib-0000000D4D0-1FQ3
	for linux-riscv@bombadil.infradead.org;
	Wed, 16 Oct 2024 21:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2YznlNfPmglMUg5tZFDFUIFHN41LFVDmI36C4tGvTFk=; b=jr5zfIyYqa4UjMFVIX6Bv5/dz3
	wvJdiIIu+1dioFQTQrY+OIPKQY5opykE8tLDapgG1kkgFMwnOtOtIMVldXwMGnQwGDTq1UBw3OVh2
	pMrstqmXLKgxyj6LL5aImOuBdFJF4H7cSbk7bYn6tv7tbXAT3JAxO8q8fMg8wAohBpbv6eMFZ1fM4
	l7vRWEIZ9NZfYMAEGmKimZkw92j0vMSkslRWkd6UE4H4e1C/V+UQd1SjT1kQJllUC95ll45a+bzWn
	/4E8QDpoSUdV7sTTJ0Bed+u0ZOqv0rq/Y+FakxKw6cL7ntfOuDJVOvZ7X0pOkFK9cP0/BK0wp4Rd0
	dGlbgBBw==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1BiW-00000006vkY-1U1Q
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 21:38:07 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-539f53973fdso202335e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1729114677; x=1729719477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YznlNfPmglMUg5tZFDFUIFHN41LFVDmI36C4tGvTFk=;
        b=YU18MasJsHFFRJLQpN6jSq24ZnZHONz/dnvfWQuM5+AcEezykdrxNzTmfek2vNC9TZ
         tTyA9jD3Wle2dbtCaIzFyqvJOYzT7SIAxthhBCOnm13C2Tq3mEHy+/uYhIrxajoAhWpJ
         MlJiefQ29gToqo8/w2FvmnQMAw8TN5NyER6yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729114677; x=1729719477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YznlNfPmglMUg5tZFDFUIFHN41LFVDmI36C4tGvTFk=;
        b=truyFO2z0R1Mt3pWu70Kcuul0oUwB9aQ8ggBNM0XNEpd/R5jAXnhseMV/UYoEsgaMA
         G1h28+2z6MZ0LUUY7JBxpdcwJHbo4s+pZOSscs9WkCTY/MwpR6nDYqeoJZxW8ZKW+sMq
         daDVJh9jtCXP3lX4HE4e5UvucS1/EalMlwvcws8x7lQugUFf+/g+UYpVmk0AD5YThjND
         Zf4qmZQqJ4AJjz0qVEv4OF+BX1bLQbAMNmGFno00Byz7m2pUF7PD7JLQhE8RFh/YybMN
         DwNV8H4OM9xg/EwTuy+EJ0TTkMYn7o9rGfzJEd5IVKzl9HGdbwWnEVjRdF6VC6T618Nh
         6LxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR1ADC6igU50tso3I+0Nuz9A1iuNMLkJYnE2/RJRYwkYvRDLIJzEgeoQDVwQXTc5XoJBYFUG2FE6HqhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxia872d4GZY5lfT9VA8rkrCtr9dkH2BTxePN3VyuJ+rd5mFNTr
	8E/4VxjV3K6EZnBC47rvFb+aTF7U8hgztvvJSVJ2l4zFmtc2g3vftmwHK+AF31vxIizSRj1gPpF
	RIxdHhho5VMIz6v6nm7bxDtrqa9pxtqWVRDR3
X-Google-Smtp-Source: AGHT+IFj9tyESsCJ6J96tM8hMvteUTyEpM92Iaw4llEr3qWo3ylAwmBp3kDxxSD8nRDRtkcl2BXGiAgd+cAwfJXLyIQ=
X-Received: by 2002:a05:6512:3c81:b0:53a:41a:69bb with SMTP id
 2adb3069b0e04-53a0c709c49mr241179e87.28.1729114677218; Wed, 16 Oct 2024
 14:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240719160913.342027-1-apatel@ventanamicro.com> <20240719160913.342027-5-apatel@ventanamicro.com>
In-Reply-To: <20240719160913.342027-5-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 16 Oct 2024 14:37:45 -0700
Message-ID: <CAOnJCU+4qNAsqDO4bvL9OdRdFBDavpTiLEEYSaYpHG4R=1W0Og@mail.gmail.com>
Subject: Re: [PATCH 04/13] RISC-V: KVM: Break down the __kvm_riscv_switch_to()
 into macros
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_223806_067710_F2304287 
X-CRM114-Status: GOOD (  14.08  )
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

T24gRnJpLCBKdWwgMTksIDIwMjQgYXQgOTowOeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEJyZWFrIGRvd24gdGhlIF9fa3ZtX3Jpc2N2X3N3aXRj
aF90bygpIGZ1bmN0aW9uIGludG8gbWFjcm9zIHNvIHRoYXQKPiB0aGVzZSBtYWNyb3MgY2FuIGJl
IGxhdGVyIHJlLXVzZWQgYnkgU0JJIE5BQ0wgZXh0ZW5zaW9uIGJhc2VkIGxvdy1sZXZlbAo+IHN3
aXRjaCBmdW5jdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5TIHwgNTIg
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
MCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3N3aXRjaC5TIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUwo+IGlu
ZGV4IDNmOGNiYzIxYTY0NC4uOWYxM2U1Y2U2YTE4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc3dpdGNoLlMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5TCj4g
QEAgLTExLDExICsxMSw3IEBACj4gICNpbmNsdWRlIDxhc20vYXNtLW9mZnNldHMuaD4KPiAgI2lu
Y2x1ZGUgPGFzbS9jc3IuaD4KPgo+IC0gICAgICAgLnRleHQKPiAtICAgICAgIC5hbHRtYWNybwo+
IC0gICAgICAgLm9wdGlvbiBub3JlbGF4Cj4gLQo+IC1TWU1fRlVOQ19TVEFSVChfX2t2bV9yaXNj
dl9zd2l0Y2hfdG8pCj4gKy5tYWNybyBTQVZFX0hPU1RfR1BSUwo+ICAgICAgICAgLyogU2F2ZSBI
b3N0IEdQUnMgKGV4Y2VwdCBBMCBhbmQgVDAtVDYpICovCj4gICAgICAgICBSRUdfUyAgIHJhLCAo
S1ZNX0FSQ0hfSE9TVF9SQSkoYTApCj4gICAgICAgICBSRUdfUyAgIHNwLCAoS1ZNX0FSQ0hfSE9T
VF9TUCkoYTApCj4gQEAgLTQwLDEwICszNiwxMiBAQCBTWU1fRlVOQ19TVEFSVChfX2t2bV9yaXNj
dl9zd2l0Y2hfdG8pCj4gICAgICAgICBSRUdfUyAgIHM5LCAoS1ZNX0FSQ0hfSE9TVF9TOSkoYTAp
Cj4gICAgICAgICBSRUdfUyAgIHMxMCwgKEtWTV9BUkNIX0hPU1RfUzEwKShhMCkKPiAgICAgICAg
IFJFR19TICAgczExLCAoS1ZNX0FSQ0hfSE9TVF9TMTEpKGEwKQo+ICsuZW5kbQo+Cj4gKy5tYWNy
byBTQVZFX0hPU1RfQU5EX1JFU1RPUkVfR1VFU1RfQ1NSUyBfX3Jlc3VtZV9hZGRyCj4gICAgICAg
ICAvKiBMb2FkIEd1ZXN0IENTUiB2YWx1ZXMgKi8KPiAgICAgICAgIFJFR19MICAgdDAsIChLVk1f
QVJDSF9HVUVTVF9TU1RBVFVTKShhMCkKPiAtICAgICAgIGxhICAgICAgdDEsIC5Ma3ZtX3N3aXRj
aF9yZXR1cm4KPiArICAgICAgIGxhICAgICAgdDEsIFxfX3Jlc3VtZV9hZGRyCj4gICAgICAgICBS
RUdfTCAgIHQyLCAoS1ZNX0FSQ0hfR1VFU1RfU0VQQykoYTApCj4KPiAgICAgICAgIC8qIFNhdmUg
SG9zdCBhbmQgUmVzdG9yZSBHdWVzdCBTU1RBVFVTICovCj4gQEAgLTYyLDcgKzYwLDkgQEAgU1lN
X0ZVTkNfU1RBUlQoX19rdm1fcmlzY3Zfc3dpdGNoX3RvKQo+ICAgICAgICAgUkVHX1MgICB0MCwg
KEtWTV9BUkNIX0hPU1RfU1NUQVRVUykoYTApCj4gICAgICAgICBSRUdfUyAgIHQxLCAoS1ZNX0FS
Q0hfSE9TVF9TVFZFQykoYTApCj4gICAgICAgICBSRUdfUyAgIHQzLCAoS1ZNX0FSQ0hfSE9TVF9T
U0NSQVRDSCkoYTApCj4gKy5lbmRtCj4KPiArLm1hY3JvIFJFU1RPUkVfR1VFU1RfR1BSUwo+ICAg
ICAgICAgLyogUmVzdG9yZSBHdWVzdCBHUFJzIChleGNlcHQgQTApICovCj4gICAgICAgICBSRUdf
TCAgIHJhLCAoS1ZNX0FSQ0hfR1VFU1RfUkEpKGEwKQo+ICAgICAgICAgUkVHX0wgICBzcCwgKEtW
TV9BUkNIX0dVRVNUX1NQKShhMCkKPiBAQCAtOTcsMTMgKzk3LDkgQEAgU1lNX0ZVTkNfU1RBUlQo
X19rdm1fcmlzY3Zfc3dpdGNoX3RvKQo+Cj4gICAgICAgICAvKiBSZXN0b3JlIEd1ZXN0IEEwICov
Cj4gICAgICAgICBSRUdfTCAgIGEwLCAoS1ZNX0FSQ0hfR1VFU1RfQTApKGEwKQo+ICsuZW5kbQo+
Cj4gLSAgICAgICAvKiBSZXN1bWUgR3Vlc3QgKi8KPiAtICAgICAgIHNyZXQKPiAtCj4gLSAgICAg
ICAvKiBCYWNrIHRvIEhvc3QgKi8KPiAtICAgICAgIC5hbGlnbiAyCj4gLS5Ma3ZtX3N3aXRjaF9y
ZXR1cm46Cj4gKy5tYWNybyBTQVZFX0dVRVNUX0dQUlMKPiAgICAgICAgIC8qIFN3YXAgR3Vlc3Qg
QTAgd2l0aCBTU0NSQVRDSCAqLwo+ICAgICAgICAgY3NycncgICBhMCwgQ1NSX1NTQ1JBVENILCBh
MAo+Cj4gQEAgLTEzOCw3ICsxMzQsOSBAQCBTWU1fRlVOQ19TVEFSVChfX2t2bV9yaXNjdl9zd2l0
Y2hfdG8pCj4gICAgICAgICBSRUdfUyAgIHQ0LCAoS1ZNX0FSQ0hfR1VFU1RfVDQpKGEwKQo+ICAg
ICAgICAgUkVHX1MgICB0NSwgKEtWTV9BUkNIX0dVRVNUX1Q1KShhMCkKPiAgICAgICAgIFJFR19T
ICAgdDYsIChLVk1fQVJDSF9HVUVTVF9UNikoYTApCj4gKy5lbmRtCj4KPiArLm1hY3JvIFNBVkVf
R1VFU1RfQU5EX1JFU1RPUkVfSE9TVF9DU1JTCj4gICAgICAgICAvKiBMb2FkIEhvc3QgQ1NSIHZh
bHVlcyAqLwo+ICAgICAgICAgUkVHX0wgICB0MCwgKEtWTV9BUkNIX0hPU1RfU1RWRUMpKGEwKQo+
ICAgICAgICAgUkVHX0wgICB0MSwgKEtWTV9BUkNIX0hPU1RfU1NDUkFUQ0gpKGEwKQo+IEBAIC0x
NjAsNyArMTU4LDkgQEAgU1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlzY3Zfc3dpdGNoX3RvKQo+ICAg
ICAgICAgUkVHX1MgICB0MSwgKEtWTV9BUkNIX0dVRVNUX0EwKShhMCkKPiAgICAgICAgIFJFR19T
ICAgdDIsIChLVk1fQVJDSF9HVUVTVF9TU1RBVFVTKShhMCkKPiAgICAgICAgIFJFR19TICAgdDMs
IChLVk1fQVJDSF9HVUVTVF9TRVBDKShhMCkKPiArLmVuZG0KPgo+ICsubWFjcm8gUkVTVE9SRV9I
T1NUX0dQUlMKPiAgICAgICAgIC8qIFJlc3RvcmUgSG9zdCBHUFJzIChleGNlcHQgQTAgYW5kIFQw
LVQ2KSAqLwo+ICAgICAgICAgUkVHX0wgICByYSwgKEtWTV9BUkNIX0hPU1RfUkEpKGEwKQo+ICAg
ICAgICAgUkVHX0wgICBzcCwgKEtWTV9BUkNIX0hPU1RfU1ApKGEwKQo+IEBAIC0xODUsNiArMTg1
LDM0IEBAIFNZTV9GVU5DX1NUQVJUKF9fa3ZtX3Jpc2N2X3N3aXRjaF90bykKPiAgICAgICAgIFJF
R19MICAgczksIChLVk1fQVJDSF9IT1NUX1M5KShhMCkKPiAgICAgICAgIFJFR19MICAgczEwLCAo
S1ZNX0FSQ0hfSE9TVF9TMTApKGEwKQo+ICAgICAgICAgUkVHX0wgICBzMTEsIChLVk1fQVJDSF9I
T1NUX1MxMSkoYTApCj4gKy5lbmRtCj4gKwo+ICsgICAgICAgLnRleHQKPiArICAgICAgIC5hbHRt
YWNybwo+ICsgICAgICAgLm9wdGlvbiBub3JlbGF4Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAg
ICAqIFBhcmFtZXRlcnM6Cj4gKyAgICAgICAgKiBBMCA8PSBQb2ludGVyIHRvIHN0cnVjdCBrdm1f
dmNwdV9hcmNoCj4gKyAgICAgICAgKi8KPiArU1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlzY3Zfc3dp
dGNoX3RvKQo+ICsgICAgICAgU0FWRV9IT1NUX0dQUlMKPiArCj4gKyAgICAgICBTQVZFX0hPU1Rf
QU5EX1JFU1RPUkVfR1VFU1RfQ1NSUyAuTGt2bV9zd2l0Y2hfcmV0dXJuCj4gKwo+ICsgICAgICAg
UkVTVE9SRV9HVUVTVF9HUFJTCj4gKwo+ICsgICAgICAgLyogUmVzdW1lIEd1ZXN0IHVzaW5nIFNS
RVQgKi8KPiArICAgICAgIHNyZXQKPiArCj4gKyAgICAgICAvKiBCYWNrIHRvIEhvc3QgKi8KPiAr
ICAgICAgIC5hbGlnbiAyCj4gKy5Ma3ZtX3N3aXRjaF9yZXR1cm46Cj4gKyAgICAgICBTQVZFX0dV
RVNUX0dQUlMKPiArCj4gKyAgICAgICBTQVZFX0dVRVNUX0FORF9SRVNUT1JFX0hPU1RfQ1NSUwo+
ICsKPiArICAgICAgIFJFU1RPUkVfSE9TVF9HUFJTCj4KPiAgICAgICAgIC8qIFJldHVybiB0byBD
IGNvZGUgKi8KPiAgICAgICAgIHJldAo+IC0tCj4gMi4zNC4xCj4KClJldmlld2VkLWJ5OiBBdGlz
aCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
