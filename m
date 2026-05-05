Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609F3FF8855
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Phw7Iv2UEynmNnTLwnL1hao3gTxg7H61ddkWXpL4vWk=; b=GS5NdklZYXsEE8
	DUckdpTYA+uswjLAsaz2jU/Gv9Exad0TRPcz2MZZIYWYwHdj+Zr1uNBbeApkFB2yIV0oNDyQ0+RRu
	GKdk2waSI8sInt+GDYxtC0+nrkRjmyMPeKGhlatDbEm+rqYUeGDIhQgr1eQSpzEUAHbV18oLkJVaS
	RXn/84/ugtI9QkGb6zMxv66UtLcSLoYJFuMoNRxLwlV3BOHXo8cEXX95z4EiOvzYqMnFgtqswN/s4
	tNgd7ezb9yjLw2q5+ojFNw6VjaQn6sfzEPnJn1X+kTYD0KPPoQYSF2oNjW+9ThRLE70OrlsuRDezX
	jXYxOHGAsU5yjmTY17fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIjZ-0000000GuMw-0Ouc;
	Tue, 05 May 2026 16:34:57 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIjX-0000000GuM1-0WEG
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:34:56 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6949f3eeaf6so36346eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777998894; cv=none;
        d=google.com; s=arc-20240605;
        b=U4x3OA9lGFaOpSUEEdyeUvFFQWazYWMaAnMJMzDlwCQfiM9mw8vbGXyHygi6CWf2B+
         9RTXA+ny2x/dC3TrrxGy9MYvf4sIqCraUFymfzLX4sT5Jf6ieGBpodgsXs67RIkEdFv1
         LVKJJuQOWaV82YwYoQLIlFKVsxL0S/FCAxbhw7FH9MmnsdvQTDzbYG8hEa2iut7f6Uff
         V9+h3ZZ2a9Boy4vMIaNCTUSwS2oTHoy1nf2VDd+/Ju412nrCOvQscQHJrSjnP7EtG+ee
         NxjI4cABbxDeoRYbCJRyvKs5ra9vUVXKiL0E4eDu8kxwK0B+rcQeIzbzpaC+owavMTi6
         ez4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDO3eiyh9Hz1u3onzFvnQb0LT/Ww16oACcFMq/SSUIc=;
        fh=/G9eAn8JDFQh4U4UE+p/W6iQ97K5xz5UY2ykwLhcj+s=;
        b=fR+WRAUh0fq24MYwo3V80qPQnzXsYV1pLTa3a093EdnG9Rc9LyeGxszlaTSAIwgiUj
         UYTw3A1aNNjPjzHObEjIrJr2D8eG5eqeRgw+k8PwzH4koLGmMNgPEnNKF7G+O0LaJdee
         TQfaGysQn6vbdopMWgqW7w2e3pAqw3PiQu4cTxdIAFnZRuS5E+Y8hI1yf5JWx7/AoXhA
         64Z/+HH0kREk+rmj00lPhN18E1gYs6JsurGyxIcQUsAWLHCgbt6F+2OY0lqiXlSb2fI4
         xnRsQj2kkAsEC8bBhWALb1L5dH5VALLpiP1gBRWl7MDJO+RAb/zahR/ooZ+TKRs0hFRd
         tuqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1777998894; x=1778603694; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDO3eiyh9Hz1u3onzFvnQb0LT/Ww16oACcFMq/SSUIc=;
        b=MndMBbPWTmhC3kVTPHO8A8OknP/c2BdPAyiLwe1RdGvsSGPUHCdrNSBuWu63/hwhEI
         gQNb8wMYmJtc3c9Tq4w1ktc8BgfgRTSldNIyWv8yqJW6R0MgTCS75Sr6ETJBAzu8bG2v
         Ct05F3vMZWFBnXs4kJ6dZjjPKbJLiNtxgywpnFydWr4dphpr2cj88GLdVY1NNVAMfMju
         WrrnSNDfDYlnhLrftpAzJ+EB0NZZUg2TT6i8Ihi0TFH4TZVAgxgL/yRdpGL2csa1O0IA
         ffnpapdOQ/MkEOPnHt5+2pH495hHApAQdngC0FWI8h0rzvI4JABy2LuWmTIfnU4wLCev
         TPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998894; x=1778603694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NDO3eiyh9Hz1u3onzFvnQb0LT/Ww16oACcFMq/SSUIc=;
        b=DrF44hp+CPZRVfKoGuhUqmUp8EZr9KxYymEL9teBuYxdu/V3I4t0JcSO1KFx/uoiTg
         nWvykrmXyC7YKRRLj0fs3bDLQO481mp+xyYJkwsxXED1qYNGKHxrgoMFVqtK2xbwaX94
         8+Uvhyx1VXYOXnOm/2KxShRbDllSerZW/qoI94XLJ2SRq+9kKJ9/KkY0PJDao3fYg7bk
         dsWK+QbQuIVrYuijeMw69gk7cR31akGeXZ+Z6Bafx46juS4FbMp87cNTG8K587MTzEc3
         ULtZNBdkWJi8lbE9DlnnkNVHgiNaE58qcLb3t0+QvQgkauYeFcM050wGf0Qb4sJgGFII
         Aqrg==
X-Forwarded-Encrypted: i=1; AFNElJ8jBPEqan7/XNNJs9jhw8nrGsD8MYc7kzXEY5D0d1dzuEEOKpusf29+aI2xqalQfCGI9bUdaubkRic9sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YywsYiE92dpgnAmPxStK9b7neCQqLCRG/votz3DEPJVIRB49U2l
	VcJG7o8MqTc8A5Y+/DY5cJRPUIDwSHrLFDVMy4kOM9tC6ZAnKBpFRV5djjSHjDhgaHbPD9e7v6g
	1lW9yRUj191XqaHR7bHlx6X6o1c5ah+4jRs4uMcCc2Q==
X-Gm-Gg: AeBDietfQ+BrC7Il8gmMG9/qvoZcAfRggIg/UOkfoxu4Kgfks5m47THeswpQdAE44v+
	ipDD2cMsuxbmfFQffMMp0tMsgTmrwWNRlAFTNFsWMK3M8S6kyjkztjvLps2Q/EKp6OygGlElviD
	FnWLRwy2XAsQy4kCs5Du7UhhqC7OUq1tD5HeQtqFowpQHMnWvNb0S9bn0vI/eW2oBMt0llcLJ0K
	MMvULxMI1JjvLwAMylPqe0/Op9+z6k5rnWQpNEbaCr6hjYpfTiAf2cFlD405rMIYkaeiw9t97jR
	sAhee9aRaTz1Cw5KeA==
X-Received: by 2002:a05:6820:2b03:b0:693:7a6f:b311 with SMTP id
 006d021491bc7-6989150d84emr1409508eaf.22.1777998892571; Tue, 05 May 2026
 09:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com> <5-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
In-Reply-To: <5-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 5 May 2026 09:34:41 -0700
X-Gm-Features: AVHnY4KmN3zuPOnphRUD3iSyHclk6jkkiTRo8gM7OfuZX2MGnqIi-uGqw8s8o2g
Message-ID: <CAH2o1u6RQBQARdL1VTYTJEb_6tskCizfbHPV=h+413H11RmV8A@mail.gmail.com>
Subject: Re: [PATCH 5/7] iommu/riscv: Compute best stride for single invalidation
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Will Deacon <will@kernel.org>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_093455_177610_D7DAB3C8 
X-CRM114-Status: GOOD (  26.61  )
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

T24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgODo1N+KAr0FNIEphc29uIEd1bnRob3JwZSA8amdnQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gUmVwbGFjZSB0aGUgcGVyLXBhZ2UgSU9UTEIgaW52YWxpZGF0
aW9uIGxvb3Agd2l0aCBzdHJpZGUtYmFzZWQKPiBpbnZhbGlkYXRpb24gdGhhdCB1c2VzIHRoZSBs
ZXZlbCBiaXRtYXBzIGZyb20gaW9tbXVfaW90bGJfZ2F0aGVyLgo+Cj4gUHJlLWNhbGN1bGF0ZSB0
aGUgaW52YWxpZGF0aW9uIGluZm9ybWF0aW9uIGJlZm9yZSBydW5uaW5nIG92ZXIgdGhlCj4gYm9u
ZHMgbG9vcCBhcyBpdCBpcyB0aGUgc2FtZSBmb3IgZXZlcnkgZW50cnkuCj4KPiBUaGUgbG93ZXN0
IHNldCBiaXQgaW4gdGhlIFBUX0ZFQVRfREVUQUlMRURfR0FUSEVSIGJpdG1hcHMgaW5kaWNhdGVz
Cj4gdGhlIHN0cmlkZS4gVGhpcyBkZXNpZ24gaWdub3JlcyB0aGUgU1ZOQVBPVCBjb250aWd1b3Vz
IHBhZ2VzIG9uIHRoZQo+IGFzc3VtcHRpb24gdGhhdCB0aGV5IHN0aWxsIGhhdmUgdG8gYmUgaW5k
aXZpZHVhbGx5IGludmFsaWRhdGVkIGxpa2UKPiBBUk0gcmVxdWlyZXMsIHRob3VnaCBpdCBpcyBu
b3QgY2xlYXIgZnJvbSB0aGUgc3BlYy4KPgo+IFJlcGxhY2UgdGhlIDJNIGN1dG9mZiBmb3IgZ2xv
YmFsIGludmFsaWRhdGlvbiB3aXRoIGEgNTEyIGNvbW1hbmQKPiBsaW1pdC4gVGhpcyBpcyB0aGUg
c2FtZSBmb3IgYSA0ayBzdHJpZGUgYW5kIG5vdyBzY2FsZXMgd2l0aCB0aGUKPiBzdHJpZGUgc2l6
ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyB8IDEwMyArKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyks
IDMyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9t
bXUuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+IGluZGV4IDU1NmQ1ZGM5YzU4Njgx
Li5mZDljNTI5NGRiYzA4MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LmMKPiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiBAQCAtOTIwLDIyICs5MjAs
NTggQEAgc3RhdGljIHZvaWQgcmlzY3ZfaW9tbXVfYm9uZF91bmxpbmsoc3RydWN0IHJpc2N2X2lv
bW11X2RvbWFpbiAqZG9tYWluLAo+ICAgICAgICAgfQo+ICB9Cj4KPiAtLyoKPiAtICogU2VuZCBJ
T1RMQi5JTlZBTCBmb3Igd2hvbGUgYWRkcmVzcyBzcGFjZSBmb3IgcmFuZ2VzIGxhcmdlciB0aGFu
IDJNQi4KPiAtICogVGhpcyBsaW1pdCB3aWxsIGJlIHJlcGxhY2VkIHdpdGggcmFuZ2UgaW52YWxp
ZGF0aW9ucywgaWYgc3VwcG9ydGVkIGJ5Cj4gLSAqIHRoZSBoYXJkd2FyZSwgd2hlbiBSSVNDLVYg
SU9NTVUgYXJjaGl0ZWN0dXJlIHNwZWNpZmljYXRpb24gdXBkYXRlIGZvcgo+IC0gKiByYW5nZSBp
bnZhbGlkYXRpb25zIHVwZGF0ZSB3aWxsIGJlIGF2YWlsYWJsZS4KPiAtICovCj4gLSNkZWZpbmUg
UklTQ1ZfSU9NTVVfSU9UTEJfSU5WQUxfTElNSVQgICgyIDw8IDIwKQo+ICtzdHJ1Y3QgcmlzY3Zf
aW9tbXVfdGxiaSB7Cj4gKyAgICAgICB1NjQgc3RhcnQ7Cj4gKyAgICAgICB1NjQgbGFzdDsKPiAr
ICAgICAgIGJvb2wgbm9uX2xlYWY7Cj4gKyAgICAgICBzdHJ1Y3Qgewo+ICsgICAgICAgICAgICAg
ICBib29sIHVzZV9nbG9iYWw7Cj4gKyAgICAgICAgICAgICAgIHU4IHN0cmlkZV9sZzI7Cj4gKyAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBudW07Cj4gKyAgICAgICB9IHNpbmdsZTsKPiArfTsK
Pgo+IC1zdGF0aWMgdm9pZCByaXNjdl9pb21tdV9pb3RsYl9pbnZhbChzdHJ1Y3QgcmlzY3ZfaW9t
bXVfZG9tYWluICpkb21haW4sCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGlvbW11X2lvdGxiX2dhdGhlciAqZ2F0aGVyKQo+ICtzdGF0aWMgdm9pZCByaXNjdl9p
b21tdV90bGJpX2NhbGMoc3RydWN0IHJpc2N2X2lvbW11X3RsYmkgKnRsYmksCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBpb21tdV9pb3RsYl9nYXRoZXIgKmdhdGhl
cikKPiArewo+ICsgICAgICAgdTggY29tYmluZWQgPSBnYXRoZXItPnB0LmxlYWZfbGV2ZWxzX2Jp
dG1hcCB8Cj4gKyAgICAgICAgICAgICAgICAgICAgIGdhdGhlci0+cHQudGFibGVfbGV2ZWxzX2Jp
dG1hcDsKPiArICAgICAgIHU2NCBudW07Cj4gKwo+ICsgICAgICAgdGxiaS0+bm9uX2xlYWYgPSBn
YXRoZXItPnB0LnRhYmxlX2xldmVsc19iaXRtYXAgIT0gMDsKPiArICAgICAgIHRsYmktPnN0YXJ0
ID0gZ2F0aGVyLT5zdGFydDsKPiArICAgICAgIHRsYmktPmxhc3QgPSBnYXRoZXItPmVuZDsKPiAr
Cj4gKyAgICAgICAvKiBObyBsZXZlbCBpbmZvcm1hdGlvbiBhdmFpbGFibGUgKi8KPiArICAgICAg
IGlmICghY29tYmluZWQpIHsKPiArICAgICAgICAgICAgICAgdGxiaS0+c2luZ2xlLnVzZV9nbG9i
YWwgPSB0cnVlOwo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgLyoKPiArICAgICAgICAqIENhbGN1bGF0ZSBzdHJpZGUgZnJvbSB0aGUgbG93ZXN0IGNo
YW5nZWQgbGV2ZWwuIFJJU0MtViB1c2VzIDRLaUIKPiArICAgICAgICAqIGdyYW51bGUgd2l0aCA5
IGJpdHMgcGVyIGxldmVsLgo+ICsgICAgICAgICovCj4gKyAgICAgICB0bGJpLT5zaW5nbGUuc3Ry
aWRlX2xnMiA9IDkgKiBfX2Zmcyhjb21iaW5lZCkgKyAxMjsKPiArICAgICAgIG51bSA9ICh0bGJp
LT5sYXN0IC0gdGxiaS0+c3RhcnQgKyAxKSA+PiB0bGJpLT5zaW5nbGUuc3RyaWRlX2xnMjsKPiAr
ICAgICAgIGlmICghbnVtIHx8IG51bSA+IDUxMikgewo+ICsgICAgICAgICAgICAgICB0bGJpLT5z
aW5nbGUudXNlX2dsb2JhbCA9IHRydWU7Cj4gKyAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAg
ICAgICB0bGJpLT5zaW5nbGUubnVtID0gbnVtOwo+ICsgICAgICAgICAgICAgICB0bGJpLT5zaW5n
bGUudXNlX2dsb2JhbCA9IGZhbHNlOwo+ICsgICAgICAgfQo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9p
ZCByaXNjdl9pb21tdV9pb3RsYl9pbnZhbF9pb21tdShzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNl
ICppb21tdSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQg
cHNjaWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHJpc2N2X2lvbW11X3RsYmkgKnRsYmkpCj4gIHsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgc3Rh
cnQ7Cj4gLSAgICAgICB1bnNpZ25lZCBsb25nIGVuZDsKPiAtICAgICAgIHN0cnVjdCByaXNjdl9p
b21tdV9ib25kICpib25kOwo+IC0gICAgICAgc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9t
bXUsICpwcmV2Owo+ICAgICAgICAgc3RydWN0IHJpc2N2X2lvbW11X2NvbW1hbmQgY21kOwo+ICsg
ICAgICAgdW5zaWduZWQgbG9uZyBpb3ZhOwo+ICsgICAgICAgdW5zaWduZWQgaW50IGk7Cj4gKwo+
ICsgICAgICAgcmlzY3ZfaW9tbXVfY21kX2ludmFsX3ZtYSgmY21kKTsKPiArICAgICAgIHJpc2N2
X2lvbW11X2NtZF9pbnZhbF9zZXRfcHNjaWQoJmNtZCwgcHNjaWQpOwo+Cj4gICAgICAgICAvKgo+
ICAgICAgICAgICogV2hlbiBub24tbGVhZiBwYWdlIHRhYmxlIGVudHJpZXMgd2VyZSBjaGFuZ2Vk
LCB0aGUgYmFzZSBzcGVjCj4gQEAgLTk0MywxMyArOTc5LDI4IEBAIHN0YXRpYyB2b2lkIHJpc2N2
X2lvbW11X2lvdGxiX2ludmFsKHN0cnVjdCByaXNjdl9pb21tdV9kb21haW4gKmRvbWFpbiwKPiAg
ICAgICAgICAqIHdheSB0byBkbyB0YXJnZXRlZCBub24tbGVhZiBpbnZhbGlkYXRpb24gd2l0aG91
dCB0aGUgTkwKPiAgICAgICAgICAqIGV4dGVuc2lvbi4gRm9yY2UgZ2xvYmFsIGludmFsaWRhdGlv
biB0byBwcmVzZXJ2ZSBjb3JyZWN0bmVzcy4KPiAgICAgICAgICAqLwo+IC0gICAgICAgaWYgKGdh
dGhlci0+cHQudGFibGVfbGV2ZWxzX2JpdG1hcCkgewo+IC0gICAgICAgICAgICAgICBzdGFydCA9
IDA7Cj4gLSAgICAgICAgICAgICAgIGVuZCA9IFVMT05HX01BWDsKPiAtICAgICAgIH0gZWxzZSB7
Cj4gLSAgICAgICAgICAgICAgIHN0YXJ0ID0gZ2F0aGVyLT5zdGFydDsKPiAtICAgICAgICAgICAg
ICAgZW5kID0gZ2F0aGVyLT5lbmQ7Cj4gKyAgICAgICBpZiAodGxiaS0+c2luZ2xlLnVzZV9nbG9i
YWwgfHwgdGxiaS0+bm9uX2xlYWYpCj4gKyAgICAgICAgICAgICAgIGdvdG8gZ2xvYmFsOwo+ICsK
PiArICAgICAgIGlvdmEgPSB0bGJpLT5zdGFydDsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCB0
bGJpLT5zaW5nbGUubnVtOyBpKyspIHsKPiArICAgICAgICAgICAgICAgcmlzY3ZfaW9tbXVfY21k
X2ludmFsX3NldF9hZGRyKCZjbWQsIGlvdmEpOwo+ICsgICAgICAgICAgICAgICByaXNjdl9pb21t
dV9jbWRfc2VuZChpb21tdSwgJmNtZCk7Cj4gKyAgICAgICAgICAgICAgIGlvdmEgKz0gMVVMTCA8
PCB0bGJpLT5zaW5nbGUuc3RyaWRlX2xnMjsKPiAgICAgICAgIH0KPiArICAgICAgIHJldHVybjsK
PiArZ2xvYmFsOgo+ICsgICAgICAgcmlzY3ZfaW9tbXVfY21kX3NlbmQoaW9tbXUsICZjbWQpOwo+
ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCByaXNjdl9pb21tdV9pb3RsYl9pbnZhbChzdHJ1Y3Qgcmlz
Y3ZfaW9tbXVfZG9tYWluICpkb21haW4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IGlvbW11X2lvdGxiX2dhdGhlciAqZ2F0aGVyKQo+ICt7Cj4gKyAgICAgICBz
dHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSwgKnByZXY7Cj4gKyAgICAgICBzdHJ1Y3Qg
cmlzY3ZfaW9tbXVfYm9uZCAqYm9uZDsKPiArICAgICAgIHN0cnVjdCByaXNjdl9pb21tdV90bGJp
IHRsYmk7Cj4gKwo+ICsgICAgICAgcmlzY3ZfaW9tbXVfdGxiaV9jYWxjKCZ0bGJpLCBnYXRoZXIp
Owo+Cj4gICAgICAgICAvKgo+ICAgICAgICAgICogRm9yIGVhY2ggSU9NTVUgbGlua2VkIHdpdGgg
dGhpcyBwcm90ZWN0aW9uIGRvbWFpbiAodmlhIGJvbmRzLT5kZXYpLAo+IEBAIC05OTAsMTkgKzEw
NDEsNyBAQCBzdGF0aWMgdm9pZCByaXNjdl9pb21tdV9pb3RsYl9pbnZhbChzdHJ1Y3QgcmlzY3Zf
aW9tbXVfZG9tYWluICpkb21haW4sCj4gICAgICAgICAgICAgICAgIGlmIChpb21tdSA9PSBwcmV2
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Cj4gLSAgICAgICAgICAgICAg
IHJpc2N2X2lvbW11X2NtZF9pbnZhbF92bWEoJmNtZCk7Cj4gLSAgICAgICAgICAgICAgIHJpc2N2
X2lvbW11X2NtZF9pbnZhbF9zZXRfcHNjaWQoJmNtZCwgZG9tYWluLT5wc2NpZCk7Cj4gLSAgICAg
ICAgICAgICAgIGlmIChlbmQgLSBzdGFydCA8IFJJU0NWX0lPTU1VX0lPVExCX0lOVkFMX0xJTUlU
IC0gMSkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaW92YSA9IHN0
YXJ0Owo+IC0KPiAtICAgICAgICAgICAgICAgICAgICAgICBkbyB7Cj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByaXNjdl9pb21tdV9jbWRfaW52YWxfc2V0X2FkZHIoJmNtZCwgaW92
YSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByaXNjdl9pb21tdV9jbWRfc2Vu
ZChpb21tdSwgJmNtZCk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgfSB3aGlsZSAoIWNoZWNr
X2FkZF9vdmVyZmxvdyhpb3ZhLCBQQUdFX1NJWkUsICZpb3ZhKSAmJgo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGlvdmEgPCBlbmQpOwo+IC0gICAgICAgICAgICAgICB9IGVsc2Ug
ewo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJpc2N2X2lvbW11X2NtZF9zZW5kKGlvbW11LCAm
Y21kKTsKPiAtICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICByaXNjdl9pb21tdV9p
b3RsYl9pbnZhbF9pb21tdShpb21tdSwgZG9tYWluLT5wc2NpZCwgJnRsYmkpOwo+ICAgICAgICAg
ICAgICAgICBwcmV2ID0gaW9tbXU7Cj4gICAgICAgICB9Cj4KPiAtLQo+IDIuNDMuMAo+CgpSZXZp
ZXdlZC1ieTogVG9tYXN6IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KClRoYW5rIHlv
dQotIFRvbWFzegoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
