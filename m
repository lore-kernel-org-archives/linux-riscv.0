Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13776CD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jumt3w04t57RJSCzZakTIfsbBDpQhXzJvllSU9j2v44=; b=J1m7WyOgtiMVwx
	pFJH0/LGmwvXvAmCAIjByxRrjCPU/FaAXpuj/baP9PgPDS1iFUF27CdxEabTI+6L3pVKwWpM5jMpW
	W81oq+4NYBnnmGvqycQaMXKebxLMmKrM/9gQmNCX1FTA79LjeXz1omhvDZo2sRSgAJUnAkNv7tznK
	RuFCqyWF+hXgIaCiJGFTHadHyzGGRPrOcMSoCBGpz0rpQ7rXqFatNyCEQd4zzcaD8oACc9bWOidaG
	TpMkBrx+V2oFArYQ9j4smnukY3NDOCqnKrsEYDG5xZUS1MIDa5olrM/OIZy0GoZQxOo3yKU6bTvMm
	w6Iko+dCapiFBZbL60NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIic-0000000Gu6h-3GdF;
	Tue, 05 May 2026 16:33:58 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIiZ-0000000Gu5q-2UHz
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:33:56 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7de4e6c5a30so4765902a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777998834; cv=none;
        d=google.com; s=arc-20240605;
        b=Mg8ioxr9T4lYmAEUEUmlPvCiR9bVhbtJHxJETNgmcbUJU6tDd848Aau+ZxRjksmEB8
         n+BVGdJiy72F9dI/D7F5zvGXkGmjyA3UmOLoP/TF+G5c0DAPpf+aa8WqbyOQrj5byJx1
         TCzYo70lzim9MBlkVufWjQ4VYmF2lUiAmlxsUd0KX4+TMuQ2EonctYLLLORHaZ8z0ovq
         B4YlOiPIwcIXUBr70jUOW7dKWnIGEvRG9CkYpbbBkiKgUgWDKvYI6a3lNY+8wcRepVzk
         fZw0Ihokr3QBKz//IgELWawbO8QPiJE1z8o7EBh+m2/gUn4WmQdUNY6/z5G0mYghV2wf
         e/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vtpazpB/8eE6pYzC9wjuU+7s+d59WdlAMcKHmpMIbC4=;
        fh=uFn+SFGoQBl9YW8Ti7UWuKDsGWTb3KKI6xtgah0oPeI=;
        b=VHfhGRZBqmmGRv/a2+q1oM4bxis6QMSs7MAFjxPozgNnbSsDNcFPnt1nBCJbfVBVTB
         UEAqa/88yisxotQtasHxYGHkSFVY5EsoVHnk+MMUAQQXx3HoSJp+BLo7KFOMCWKSYiTj
         gybdLBmt/CAfEmcT5nigs9twsOVuBuhz6qI74wmPZe672+mMzz40EgX267r4LAb/YAiY
         vskv58NXfC3jeY+3A36K7UskEkflEdnes9EF75QWodt3lzezZhcF/OgIywIkrieW7DTw
         wU2qkpcA4IPu5hR4Ds0Po6aUjeqw6CR6WcuZtWFZjdjLVwZFZDY3GtWmH/VEOBNO+3TI
         XN1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1777998834; x=1778603634; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtpazpB/8eE6pYzC9wjuU+7s+d59WdlAMcKHmpMIbC4=;
        b=Rq6JpdQWfzi/IJmZZp732jHlCJM4sP451mWfuIRBSYeRwMhiyznrNmE3Uul/fUIDRY
         faPEMy7N2sh8okALUWPoAyG7p0TZh+chxrB0eymDu5cBcLCDWMXvImycpcO2R2hYj7s3
         uxjCZ0RsTkx1xKuB3ZBYpgqIX0qwYLKrcbbU60DXPqn2sYCBWo/ATKYuQDRVUeRvJm8O
         i9iH/69ALbxy03SWd39Vu+b26z0j4hqEzU+ygo6T5LMleDTMvYq9oeXqs9lhuHME/Wa7
         aoErFXOGdE96oWizoW1Rp/0JZVj1Afew6/BoDrrYyn7FnI5q3wLzY9SHeWqw6e8HQyq2
         9Iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998834; x=1778603634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vtpazpB/8eE6pYzC9wjuU+7s+d59WdlAMcKHmpMIbC4=;
        b=R5G6Uf3P2++b+9kPc28lxHmfw+8I/F8PwZLNZDGyjXZEiXEhmDMSUJ7f2297JWGGtl
         vCyUG614NXs5wKsiQbJti5vIPYz7SxUzldD/mxHNNIvmomN3euamkBChhPrivvC9zxYv
         X7wXbsCiC7T7Y7Gg9vZGE0fB7WwaJeKmY28WJvTq/rqsnR8wGgZ+S6GacWZBskiwS0ig
         CtIrDas4OAWmlkqjlIqmND7lQCmS8IhhTgkgmd+jrkNwqwaxhXvCHClRDDVDBkqYwxsU
         Mt8cXqYAOOxOZVbKYHDN3vMsEdOYTNcfhRIWfbA6C/jvvRI5eI4mpx+KAvqY9uUr1KWI
         myBw==
X-Forwarded-Encrypted: i=1; AFNElJ9Gc3BsJoHWWKWvs/Nmy8eIOXi1gnZsGFwtO4gQ+Ci45FWLYSKIS6bJIVptN1jgsqmh/hUIE92sgNvQVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJIMcV4xLfV0iGWCle1aNFw/h6Wp93lzeX/zDXHJPkUSTCbkq6
	qQLzVi2E/FuY3moy0V0vTYAtJsJBrqmPX4I7t17xzAIudSKdn/oARwCvC6DDJC6JRjrzc0S7QCG
	5LkQHv94ewihaObvi0G4g6f/CsLdxTt2MUdUgYPrp1g==
X-Gm-Gg: AeBDies6BEUs8+/HVAWi1P+K0ohFQhqCIs3uomlTNUh5q+GJmWqEgxqqM28goZev2SO
	ZguvdHftqD7p5CC64dcSSJJPdkYvWBYeEP4Cyqvb5gVHm3GEgoFW9KlsXPS7MBJrwlv+tkgY30B
	FhaAo7oTzSycT4jjA8gVUeBN8H741iuq+ylQ2QA0eXJaZiVyQgPscHmLGj+rQKlei6eGlhaHPHT
	C37WNHtmv7CKcd+SJFuL5uSJbhcZbf6VAZ7PDsjEpDHLh+0hH9NZXQAWWGkSwmGWIHkrT5W4EmB
	BbVOOlVTiri1ZVhHwg==
X-Received: by 2002:a05:6820:6ae3:b0:694:89e2:74fd with SMTP id
 006d021491bc7-699981b5a39mr88918eaf.50.1777998834219; Tue, 05 May 2026
 09:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com> <4-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
In-Reply-To: <4-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 5 May 2026 09:33:41 -0700
X-Gm-Features: AVHnY4Jo2M_oYIkIR0EQC-NGrzHu318spP9O1zFNVhPiXz7QU2_Oa1GP5rSq1Uk
Message-ID: <CAH2o1u6--LxUM0L_yEGUZU7THzO8=kdYUSG6CwR0-H49ss0ECg@mail.gmail.com>
Subject: Re: [PATCH 4/7] iommu/riscv: Enable PT_FEAT_DETAILED_GATHER and pass
 gather to iotlb_inval
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Will Deacon <will@kernel.org>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_093355_647550_51B7F848 
X-CRM114-Status: GOOD (  24.10  )
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
aWRpYS5jb20+IHdyb3RlOgo+Cj4gUklTQy1WIGNhbiB1c2UgdGhlIGluZm9ybWF0aW9uIGZyb20g
UFRfRkVBVF9ERVRBSUxFRF9HQVRIRVIgdG8KPiBjb21wdXRlIHRoZSBiZXN0IHN0cmlkZSB0byBn
ZW5lcmF0ZSB0aGUgc2luZ2xlIFRMQiBpbnZhbGlkYXRpb25zLgo+Cj4gUGFzcyB0aGUgZ2F0aGVy
IGRvd24gdG8gdGhlIGxvd2VyIGZ1bmN0aW9ucyBhbmQgY3JlYXRlIGEgZnVsbC1yYW5nZQo+IGdh
dGhlciBmb3IgdGhlIGZsdXNoLWFsbCBjYWxsYmFjay4KPgo+IFNpZ25lZC1vZmYtYnk6IEphc29u
IEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaW9tbXUvZ2VuZXJp
Y19wdC9mbXQvaW9tbXVfcmlzY3Y2NC5jIHwgIDQgKy0KPiAgZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS5jICAgICAgICAgICAgICAgICAgfCA0NCArKysrKysrKysrKysrLS0tLS0tLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvaW9tbXVfcmlzY3Y2NC5jIGIvZHJp
dmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9pb21tdV9yaXNjdjY0LmMKPiBpbmRleCBjYmY2MGZm
ZmE5YmY3ZC4uYjE4ZmM0ZDEwOWY1MzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pb21tdS9nZW5l
cmljX3B0L2ZtdC9pb21tdV9yaXNjdjY0LmMKPiArKysgYi9kcml2ZXJzL2lvbW11L2dlbmVyaWNf
cHQvZm10L2lvbW11X3Jpc2N2NjQuYwo+IEBAIC02LDYgKzYsOCBAQAo+ICAjZGVmaW5lIFBUX0ZN
VF9WQVJJQU5UIDY0Cj4gICNkZWZpbmUgUFRfU1VQUE9SVEVEX0ZFQVRVUkVTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIChCSVQoUFRfRkVBVF9TSUdOX0VYVEVO
RCkgfCBCSVQoUFRfRkVBVF9GTFVTSF9SQU5HRSkgfCBcCj4gLSAgICAgICAgQklUKFBUX0ZFQVRf
UklTQ1ZfU1ZOQVBPVF82NEspKQo+ICsgICAgICAgIEJJVChQVF9GRUFUX1JJU0NWX1NWTkFQT1Rf
NjRLKSB8ICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICBCSVQoUFRfRkVBVF9ERVRB
SUxFRF9HQVRIRVIpKQo+ICsjZGVmaW5lIFBUX0ZPUkNFX0VOQUJMRURfRkVBVFVSRVMgQklUKFBU
X0ZFQVRfREVUQUlMRURfR0FUSEVSKQo+Cj4gICNpbmNsdWRlICJpb21tdV90ZW1wbGF0ZS5oIgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11
L3Jpc2N2L2lvbW11LmMKPiBpbmRleCBhMzFmNTBiYmFkMzUzNS4uNTU2ZDVkYzljNTg2ODEgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gKysrIGIvZHJpdmVycy9p
b21tdS9yaXNjdi9pb21tdS5jCj4gQEAgLTkyOSwxMiArOTI5LDI4IEBAIHN0YXRpYyB2b2lkIHJp
c2N2X2lvbW11X2JvbmRfdW5saW5rKHN0cnVjdCByaXNjdl9pb21tdV9kb21haW4gKmRvbWFpbiwK
PiAgI2RlZmluZSBSSVNDVl9JT01NVV9JT1RMQl9JTlZBTF9MSU1JVCAgKDIgPDwgMjApCj4KPiAg
c3RhdGljIHZvaWQgcmlzY3ZfaW9tbXVfaW90bGJfaW52YWwoc3RydWN0IHJpc2N2X2lvbW11X2Rv
bWFpbiAqZG9tYWluLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBpb21tdV9pb3RsYl9nYXRoZXIgKmdhdGhlcikKPiAgewo+
ICsgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydDsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZW5k
Owo+ICAgICAgICAgc3RydWN0IHJpc2N2X2lvbW11X2JvbmQgKmJvbmQ7Cj4gICAgICAgICBzdHJ1
Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSwgKnByZXY7Cj4gICAgICAgICBzdHJ1Y3Qgcmlz
Y3ZfaW9tbXVfY29tbWFuZCBjbWQ7Cj4KPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBXaGVuIG5v
bi1sZWFmIHBhZ2UgdGFibGUgZW50cmllcyB3ZXJlIGNoYW5nZWQsIHRoZSBiYXNlIHNwZWMKPiAr
ICAgICAgICAqIHJlcXVpcmVzIGEgZnVsbCBQU0NJRCBpbnZhbGlkYXRpb24gKEFWPTApIHNpbmNl
IHRoZXJlIGlzIG5vCj4gKyAgICAgICAgKiB3YXkgdG8gZG8gdGFyZ2V0ZWQgbm9uLWxlYWYgaW52
YWxpZGF0aW9uIHdpdGhvdXQgdGhlIE5MCj4gKyAgICAgICAgKiBleHRlbnNpb24uIEZvcmNlIGds
b2JhbCBpbnZhbGlkYXRpb24gdG8gcHJlc2VydmUgY29ycmVjdG5lc3MuCj4gKyAgICAgICAgKi8K
PiArICAgICAgIGlmIChnYXRoZXItPnB0LnRhYmxlX2xldmVsc19iaXRtYXApIHsKPiArICAgICAg
ICAgICAgICAgc3RhcnQgPSAwOwo+ICsgICAgICAgICAgICAgICBlbmQgPSBVTE9OR19NQVg7Cj4g
KyAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBzdGFydCA9IGdhdGhlci0+c3RhcnQ7
Cj4gKyAgICAgICAgICAgICAgIGVuZCA9IGdhdGhlci0+ZW5kOwo+ICsgICAgICAgfQo+ICsKPiAg
ICAgICAgIC8qCj4gICAgICAgICAgKiBGb3IgZWFjaCBJT01NVSBsaW5rZWQgd2l0aCB0aGlzIHBy
b3RlY3Rpb24gZG9tYWluICh2aWEgYm9uZHMtPmRldiksCj4gICAgICAgICAgKiBhbiBJT1RMQiBp
bnZhbGlhdGlvbiBjb21tYW5kIHdpbGwgYmUgc3VibWl0dGVkIGFuZCBleGVjdXRlZC4KPiBAQCAt
MTE0NSw4ICsxMTYxLDE0IEBAIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2lvZGlyX3VwZGF0ZShz
dHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSwKPiAgc3RhdGljIHZvaWQgcmlzY3ZfaW9t
bXVfaW90bGJfZmx1c2hfYWxsKHN0cnVjdCBpb21tdV9kb21haW4gKmlvbW11X2RvbWFpbikKPiAg
ewo+ICAgICAgICAgc3RydWN0IHJpc2N2X2lvbW11X2RvbWFpbiAqZG9tYWluID0gaW9tbXVfZG9t
YWluX3RvX3Jpc2N2KGlvbW11X2RvbWFpbik7Cj4gKyAgICAgICBzdHJ1Y3QgaW9tbXVfaW90bGJf
Z2F0aGVyIGdhdGhlciA9IHsKPiArICAgICAgICAgICAgICAgLnN0YXJ0ID0gMCwKPiArICAgICAg
ICAgICAgICAgLmVuZCA9IFVMT05HX01BWCwKPiArICAgICAgICAgICAgICAgLnB0LmxlYWZfbGV2
ZWxzX2JpdG1hcCA9IDB4RkYsCj4gKyAgICAgICAgICAgICAgIC5wdC50YWJsZV9sZXZlbHNfYml0
bWFwID0gMHhGRSwKPiArICAgICAgIH07Cj4KPiAtICAgICAgIHJpc2N2X2lvbW11X2lvdGxiX2lu
dmFsKGRvbWFpbiwgMCwgVUxPTkdfTUFYKTsKPiArICAgICAgIHJpc2N2X2lvbW11X2lvdGxiX2lu
dmFsKGRvbWFpbiwgJmdhdGhlcik7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCByaXNjdl9pb21tdV9p
b3RsYl9zeW5jKHN0cnVjdCBpb21tdV9kb21haW4gKmlvbW11X2RvbWFpbiwKPiBAQCAtMTE1NCwx
OSArMTE3Niw4IEBAIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2lvdGxiX3N5bmMoc3RydWN0IGlv
bW11X2RvbWFpbiAqaW9tbXVfZG9tYWluLAo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgcmlzY3ZfaW9t
bXVfZG9tYWluICpkb21haW4gPSBpb21tdV9kb21haW5fdG9fcmlzY3YoaW9tbXVfZG9tYWluKTsK
Pgo+IC0gICAgICAgaWYgKGlvbW11X3BhZ2VzX2xpc3RfZW1wdHkoJmdhdGhlci0+ZnJlZWxpc3Qp
KSB7Cj4gLSAgICAgICAgICAgICAgIHJpc2N2X2lvbW11X2lvdGxiX2ludmFsKGRvbWFpbiwgZ2F0
aGVyLT5zdGFydCwgZ2F0aGVyLT5lbmQpOwo+IC0gICAgICAgfSBlbHNlIHsKPiAtICAgICAgICAg
ICAgICAgLyoKPiAtICAgICAgICAgICAgICAgICogSW4gMS4wIHNwZWMgdmVyc2lvbiwgdGhlIHNt
YWxsZXN0IHNjb3BlIHdlIGNhbiB1c2UgdG8KPiAtICAgICAgICAgICAgICAgICogaW52YWxpZGF0
ZSBhbGwgbGV2ZWxzIG9mIHBhZ2UgdGFibGUgKGkuZS4gbGVhZiBhbmQgbm9uLWxlYWYpCj4gLSAg
ICAgICAgICAgICAgICAqIGlzIGFuIGludmFsaWRhdGUtYWxsLVBTQ0lEIElPVElOVkFMLlZNQSB3
aXRoIEFWPTAuCj4gLSAgICAgICAgICAgICAgICAqIFRoaXMgd2lsbCBiZSB1cGRhdGVkIHdpdGgg
aGFyZHdhcmUgc3VwcG9ydCBmb3IKPiAtICAgICAgICAgICAgICAgICogY2FwYWJpbGl0eS5OTCAo
bm9uLWxlYWYpIElPVElOVkFMIGNvbW1hbmQuCj4gLSAgICAgICAgICAgICAgICAqLwo+IC0gICAg
ICAgICAgICAgICByaXNjdl9pb21tdV9pb3RsYl9pbnZhbChkb21haW4sIDAsIFVMT05HX01BWCk7
Cj4gLSAgICAgICAgICAgICAgIGlvbW11X3B1dF9wYWdlc19saXN0KCZnYXRoZXItPmZyZWVsaXN0
KTsKPiAtICAgICAgIH0KPiArICAgICAgIHJpc2N2X2lvbW11X2lvdGxiX2ludmFsKGRvbWFpbiwg
Z2F0aGVyKTsKPiArICAgICAgIGlvbW11X3B1dF9wYWdlc19saXN0KCZnYXRoZXItPmZyZWVsaXN0
KTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2ZyZWVfcGFnaW5nX2RvbWFpbihz
dHJ1Y3QgaW9tbXVfZG9tYWluICppb21tdV9kb21haW4pCj4gQEAgLTEyNjcsNyArMTI3OCw4IEBA
IHN0YXRpYyBzdHJ1Y3QgaW9tbXVfZG9tYWluICpyaXNjdl9pb21tdV9hbGxvY19wYWdpbmdfZG9t
YWluKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgICAgICAgICAqLwo+ICAgICAgICAgY2ZnLmNvbW1v
bi5mZWF0dXJlcyA9IEJJVChQVF9GRUFUX1NJR05fRVhURU5EKSB8Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQklUKFBUX0ZFQVRfRkxVU0hfUkFOR0UpIHwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBCSVQoUFRfRkVBVF9SSVNDVl9TVk5BUE9UXzY0Syk7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQklUKFBUX0ZFQVRfUklTQ1ZfU1ZOQVBPVF82NEspIHwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoUFRfRkVBVF9ERVRBSUxFRF9HQVRI
RVIpOwo+ICAgICAgICAgZG9tYWluLT5yaXNjdnB0LmlvbW11Lm5pZCA9IGRldl90b19ub2RlKGlv
bW11LT5kZXYpOwo+ICAgICAgICAgZG9tYWluLT5kb21haW4ub3BzID0gJnJpc2N2X2lvbW11X3Bh
Z2luZ19kb21haW5fb3BzOwo+Cj4gLS0KPiAyLjQzLjAKPgoKUmV2aWV3ZWQtYnk6IFRvbWFzeiBK
ZXpuYWNoIDx0amV6bmFjaEByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
