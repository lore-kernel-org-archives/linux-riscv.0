Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77708EFCE5A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 03:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FtAGT1IwMixdto0W2GKO4dNoLd9iTVCFDB7EvizAkVM=; b=XuOrCi01XL2dPHQMM5j5nIXJXx
	5WPt1q+YOsHTUXLXtdxJJPNEE84eerAi7f+Av8QM0pSbjZaukEa/EQ/KfU+1EN/pjOPaEEIZDkWHY
	RMT/wNnu7lW+Zts9BZL4iJmRm1BrqvjShtIQinEgBSg8IADVST+DWPLZWekfSveq9M61wVAwAxjbV
	CTqdjLR+4s9BLG7AtYdqoDnXaEm7OKz7nHH4j1zMmQdJwESCUZS8YScxBbXtKWVrptO+e+hSKCfL9
	H/70nBKcWHG98L5kgEl/wZqgvlmSPa4V6S2SXfIDJ9D/jHBT1q+s+iVrLiaU2tnYHHe4ZtFuZZ26H
	0y2btZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzku-00000000sNK-0MvN;
	Thu, 05 Mar 2026 03:52:08 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzkr-00000000sMx-3Bu7
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 03:52:07 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b940a00415cso43036366b.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 19:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772682723; cv=none;
        d=google.com; s=arc-20240605;
        b=lOPhPQ0gVK6c/BgErSSFDCXaN3kaMm44m/zRcshgVlO8YvMW5CZLMNMBS++QWL7ULy
         QODH3IJ3KguQM740gLgohOg6BpIOvtmGCJ1v50HMkViSJOCeVZ/7Vdpo0VrVGhiEtXEU
         +vdtyMfqfOueNjeya2EOfFbsVAJTK3OTpzycdwxS3DwhCuKv+5ZC62Y44WWu23XKcpV/
         HOfxyqCL101SY+3BVQdUvEUUZcejM2wRD50DJl8TgHuhMRDqxrBbVRkU0MNAvA6e2IEu
         3kiG8weCPj5i1KiAGp7gSf5kJa0+SHpiyjgbEIf/SRxIE/AKOeUn9zZO3uA82v7OZbPq
         uoqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=laQ2AvpCgXuC+R6d2u3IgOfzliLlwjhc9p/ySjCR+uo=;
        fh=FJL6iGcxdK+xps467vlhZoD2Dp7CSPQ0+GoTb3vullQ=;
        b=Q0oHRdd+zZIOMmOBUML0IFpNEdCl5FC0ipvvuf+fNvuhnBIpOfyNkLvu766gyJrfHy
         1EWJLB8Z4BfZmeIoTTXOpQq+ksWEIAED7dKmhIzYAO2RPyXp8g18mjCqIz64ssJs2/FJ
         RHet90g4tGgkGsjYOccwb0dAyXP85zAY5/qLewrRjxNNj68K82c3dtRZplya8pwxFqbm
         gbp425FyOt+IcuhXW6oYuhHv03CN/EwUYtS2zZxAeAIf8i3gLTvMs+Fh3ma5b+3LQI9q
         abus/CMBz3htldILsR2325eB0bIUWFr7mr5uDpgJF0sfginLPT6DiONk0ozdzzSfDgNz
         9CgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1772682723; x=1773287523; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laQ2AvpCgXuC+R6d2u3IgOfzliLlwjhc9p/ySjCR+uo=;
        b=G0c7JlRRxP+WNMffVbEpA3IDML0+yw6LsVU0NSCy59R/pIJnYY2nZVXXBrJVlCacy5
         10m3m66adfOMYYRIFwzRPmnSKJRMkkbHXjN0s81e9ainHeTHCg2HxK7gIC5ITxBG2Rzl
         t66deeqvXfpq56h7RyWpAFLwdDaBFmCwUGXMvk5YGj5vqa+Ftl+gCFsGYOGZjlLYDN0y
         4mD7gpdWuxbfL7xIfwgPO1c26dUbYyMcp+fBFzzsx4LZnoaw5NHEnlq4VMN/TM8hW8uO
         WTmCkCT//OQdNTFJUx7nbJdirn5N7qcky4zxEweEyOxaDBVUOWJ8JDeUXcRciDJZUmGE
         ZRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772682723; x=1773287523;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=laQ2AvpCgXuC+R6d2u3IgOfzliLlwjhc9p/ySjCR+uo=;
        b=sNY+8EeD9Fk0CHovMVLJdVwaKyPZQVbS5EP+8snpHTWr85mvZeP6jJpcAW2oXa7zQZ
         XXEPLbUs+iYppC6IhTEE9h/adggTpBTs/K0Y7Ku8L0JRKpxmoUimN9FiD2ZbZ+e/rrH5
         yhxPt4DAOenGJ5MRdT0Qv5Y8VB6+QCM8uSeDexbf04uJczUE8/NX7GFT1Wx+AXN4j+yg
         wXiu/7apbhr+pdbCi/bhidinEh7nUNnMKzTGcfOoOWJp5ZLDX5FHrOclspklZ7JjuHgh
         1xJh3OUFL0cQluhLwlAYGe1RyBTDotLZihyT5gVwKCroMyone36ipqjZmp/DOdRXkI3p
         MHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0GW6F3/Q0id6rLP9WrTM8fym9LJEIzTABLEU+75p+p8dKgCU6QAcW8DWkVmkXaArImE78qVxcEDagUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFkuqRRERoycYNr1xKKHCestCcKXbbjw+78h1FQqfmWq+IbFZM
	eYSOYxdJ9bHde0sVFAfVMqZQ7t8upZl0vGohWXI9iJovfUmDgcjW5X6i0Cg06v3c8QumOr9Demo
	oHPUoYVaL+dk1/5kP2DohvH8cCc4wGYRyHaOAr6+Q6w==
X-Gm-Gg: ATEYQzyB2keS9yr1hStDKfBwX/IDpFU1XqSz3U40x0UuEnIaw+dz6KcxXy8KAdzrYYr
	ugEgu+qkhmPwZysfScl93PZg/P8s0N9rP+O7F5T43tYYrUmQetPNzLtrgfDskzdgqqvcMw5ooQz
	is0t2aAtMaQm9dQDDfu16jWCwR/nPRLlNYUkovSs/QvjPCerursycibDyXXAB7CATH9KQAUTLQw
	zCErlGJwZF0CsVX0sALjzlj+PYykqxARtSIhSl8x+7OD6XgG1vEY2RbVJb6kCYhvm6s7xoJhITK
	dedkpSmERQ==
X-Received: by 2002:a17:906:f59f:b0:b93:c5a9:a5f4 with SMTP id
 a640c23a62f3a-b93f1171a50mr230933866b.9.1772682723178; Wed, 04 Mar 2026
 19:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20260208063848.3547817-1-zong.li@sifive.com>
In-Reply-To: <20260208063848.3547817-1-zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 5 Mar 2026 11:51:54 +0800
X-Gm-Features: AaiRm52-PEQgHfjyPwhUeK2thl3vuXWbRxSFi-k5ctXKrtEiXxfPbnakyP7RYIc
Message-ID: <CANXhq0rLQYL3hVhirV09nQKjnFy2wR+TFr5E=_YMQJPYU25QkQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] RISC-V IOMMU HPM support
To: tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, robh@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, mark.rutland@arm.com, 
	conor+dt@kernel.org, guoyaxing@bosc.ac.cn, luxu.kernel@bytedance.com, 
	lv.zheng@linux.spacemit.com, andrew.jones@oss.qualcomm.com, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	Jingyu Li <joey.li@spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_195205_863942_CA026241 
X-CRM114-Status: GOOD (  35.53  )
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

T24gU3VuLCBGZWIgOCwgMjAyNiBhdCAyOjM44oCvUE0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGltcGxlbWVudHMgc3VwcG9ydCBmb3IgdGhlIFJJ
U0MtViBJT01NVSBoYXJkd2FyZSBwZXJmb3JtYW5jZQo+IG1vbml0b3IuCj4KPiBUaGUgUklTQy1W
IElPTU1VIFBNVSBkcml2ZXIgaXMgaW1wbGVtZW50ZWQgYXMgYW4gYXV4aWxpYXJ5IGRldmljZSBk
cml2ZXIKPiBjcmVhdGVkIGJ5IHRoZSBwYXJlbnQgUklTQy1WIElPTU1VIGRyaXZlci4gVGhlIGNo
aWxkIGRyaXZlciBjYW4gb2J0YWluCj4gcmVzb3VyY2VzIGFuZCBpbmZvcm1hdGlvbiBmcm9tIHRo
ZSBwYXJlbnQgZGV2aWNlLCBzdWNoIGFzIHRoZSBNTUlPIGJhc2UKPiBhZGRyZXNzIGFuZCBJUlEg
bnVtYmVyLgo+Cj4gQ3VzdG9tIGV2ZW50IHN1cHBvcnQgaXMgbm90IGluY2x1ZGVkIGluIHRoaXMg
c2VyaWVzIGFuZCB3aWxsIGJlIHN1Ym1pdHRlZAo+IGFzIGEgc2VwYXJhdGUgc2VyaWVzLiBUaGUg
aWRlYSBpcyB0aGF0IGN1c3RvbSBldmVudHMgd2lsbCBiZSBkZWZpbmVkCj4gdGhyb3VnaCB0aGUg
ZHJpdmVyIGRhdGEgb2YgdGhlIGF1eGlsaWFyeSBkcml2ZXIuIFdoZW4gdGhlIHBhcmVudCBJT01N
VQo+IGRyaXZlciBjcmVhdGVzIHRoZSBhdXhpbGlhcnkgZGV2aWNlLCBpdCBzaG91bGQgcGFzcyBh
IHZlbmRvci1zcGVjaWZpYwo+IG5hbWUgYXMgdGhlIGRldmljZSBuYW1lIGluIG9yZGVyIHRvIG1h
dGNoIHRoZSBjb3JyZXNwb25kaW5nIGF1eGlsaWFyeQo+IGRldmljZSBJRC4KPgo+IEFmdGVyIG15
IGluaXRpYWwgUkZDIGFuZCB0aGUgdjEgcGF0Y2ggc2VyaWVzIHdlcmUgcG9zdGVkLCBzaW1pbGFy
IHBhdGNoCj4gc2VyaWVzIGFsc28gYXBwZWFyZWQgb24gdGhlIG1haWxpbmcgbGlzdC4KPgo+IE9u
ZSB3YXMgZnJvbSBZYXhpbmcgR3VvOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1
MDkxNTAyMDkxMS4xMzEzLTEtZ3VveWF4aW5nQGJvc2MuYWMuY24vCj4KPiBhbmQgYW5vdGhlciBm
cm9tIEx2IFpoZW5nOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8zMEM3QUQzNTFEQjU1
Mjc2K2E4YjAzZGFjLWM1YWYtNDAzNC04NjMxLWFjMWMzNTJhNDY5ZkBsaW51eC5zcGFjZW1pdC5j
b20vCj4KPiBZYXhpbmcgaGFzIGFncmVlZCB0byBwYXVzZSBoaXMgc2VyaWVzLCBhcyBkaXNjdXNz
ZWQgaGVyZToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS8yY2U5ZDhiZS0x
MGIzLTQ4ZGQtYjk5ZS03MzU4MzQ3ZmMxNzFAYm9zYy5hYy5jbi8KPgo+IFRoZSBtb3RpdmF0aW9u
IGZvciBzZW5kaW5nIHRoaXMgdjIgdmVyc2lvbiBpcyBub3Qgb25seSB0byBhZGRyZXNzIHRoZQo+
IGZlZWRiYWNrIGFuZCBzdWdnZXN0aW9ucyBmcm9tIHRoZSBwcmV2aW91cyByb3VuZCwgYnV0IGFs
c28gdG8gaW50cm9kdWNlCj4gYSBtYWpvciBzdHJ1Y3R1cmFsIGNoYW5nZTogdGhlIFBNVSBkcml2
ZXIgaGFzIGJlZW4gbW92ZWQgdW5kZXIKPiBkcml2ZXJzL3BlcmYvLCB3aGljaCBoYXMgYmVlbiBt
ZW50aW9uZWQgcmVwZWF0ZWRseSBieSBzZXZlcmFsIHBlb3BsZS4KPiBUaGlzIHJlc3VsdHMgaW4g
YSBkaWZmZXJlbnQgZHJpdmVyIHN0cnVjdHVyZSBjb21wYXJlZCB0byBteSBlYXJsaWVyCj4gdmVy
c2lvbiBhbmQgdGhlIG90aGVyIHR3byBzZXJpZXMsIGFuZCBJJ2QgbGlrZSB0byBnYXRoZXIgZmVl
ZGJhY2sgYW5kCj4gc3VnZ2VzdGlvbnMgZnJvbSB0aGUgY29tbXVuaXR5IG9uIHRoaXMgYXBwcm9h
Y2guIElmIHRoZSBjb21tdW5pdHkgd291bGQKPiBwcmVmZXIgdG8gZ28gd2l0aCBMdiBaaGVuZ+KA
mXMgdmVyc2lvbiBpbnN0ZWFkLCBJIGFtIHBlcmZlY3RseSBmaW5lIHdpdGgKPiB0aGF0IGFzIHdl
bGwuCj4KPiBTaW5jZSBJIGRpZCBub3QgZm9sbG93IHVwIGNsb3NlbHkgb24gdGhlIHBhdGNoZXMg
ZnJvbSBMdiBaaGVuZywgSmluZ3l1Cj4gTGksIG9yIFlheGluZywgaXQgaXMgcG9zc2libGUgdGhh
dCB0aGlzIHYyIHNlcmllcyBtYXkgbWlzcyBzb21lIGltcG9ydGFudAo+IGZlYXR1cmVzIG9yIGZp
eGVzIGZyb20gdGhlaXIgd29yay4gVGhlcmVmb3JlLCBJIHdvdWxkIHJlYWxseSBhcHByZWNpYXRl
Cj4gaXQgaWYgZXZlcnlvbmUgY291bGQgaGVscCByZXZpZXcgdGhpcyB2MiBzZXJpZXMgYW5kIHBv
aW50IG91dCBhbnkKPiBhZGRpdGlvbmFsIGZpeGVzIG9yIGZlYXR1cmUgc3VwcG9ydCB0aGF0IEkg
bWF5IGhhdmUgbWlzc2VkLgo+CgpIaSBSb2JpbiwKClRoaXMgaXMgdGhlIG5leHQgdmVyc2lvbiBv
ZiB0aGUgcHJldmlvdXMgc2VyaWVzLiBJdCBzZWVtcyB0byBtZSB0aGF0CnRoaXMgdjIgdmVyc2lv
biBhZGRyZXNzZXMgYWxsIHRoZSBzdWdnZXN0aW9ucyB5b3UgbWVudGlvbmVkIGluIHRoZQpwcmV2
aW91cyBzZXJpZXMuCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTAxMTUwMzAzMDYu
Mjk3MzUtMS16b25nLmxpQHNpZml2ZS5jb20vCgpJIHRhbGtlZCB3aXRoIEx2IFpoZW5nLCB3ZSdk
IGxpa2UgdG8ga25vdyBpZiB0aGlzIHZlcnNpb24gbG9va3MgZ29vZAp0byB5b3UsIG9yIGlmIHRo
ZXJlIGlzIGFueXRoaW5nIGVsc2UgdGhhdCBjb3VsZCBiZSBpbXByb3ZlZD8KClRoYW5rcy4KCj4g
Q2hhbmdlZCBpbiB2MToKPiAtIFJlYmFzZWQgb250byB2Ni4xOS1yYzgKPiAtIFBpY2sgYWxsIHN1
Z2dlc3Rpb25zIGFuZCBmZWVkYmFja3MgZnJvbSB2MSBzZXJpZXMKPiAtIEFkZCBjcHUgaG90cGx1
ZyBpbXBsZW1lbnRhdGlvbiB0byBhdm9pZCByYWNlIGVuYWJsZW1lbnQKPiAtIE1vdmUgUE1VLXJl
bGF0ZWQgZGVmaW5pdGlvbiBmcm9tIGhlYWRlciB0byBjIGZpbGUKPiAtIENoYW5nZSBQTVUgZHJp
dmVyIHRvIGF1eGlsaWFyeSBkZXZpY2UgZHJpdmVyCj4KPiBDaGFuZ2VkIGluIFJGQzoKPiAtIFJl
YmFzZSBvbnRvIHY2LjEzLXJjNwo+IC0gQ2xlYXIgaW50ZXJydXB0IHBlbmRpbmcgYmVmb3JlIGhh
bmRsaW5nIGludGVycnVwdAo+IC0gRml4IHRoZSBjb3VudGVyIHZhbHVlIGlzc3VlIGNhdXNlZCBi
eSBPRiBiaXQgaW4gdGhlIGN5Y2xlIGNvdW50ZXIuCj4gLSBJbnZva2UgcmlzY3ZfaW9tbXVfaHBt
X2Rpc2FibGUoKSBpbnN0ZWFkIG9mIHJpc2N2X2lvbW11X3BtdV91bmluaXQoKQo+ICAgaW4gcmlz
Y3ZfaW9tbXVfcmVtb3ZlKCkKPgo+IFpvbmcgTGkgKDIpOgo+ICAgZHJpdmVycy9wZXJmOiByaXNj
di1pb21tdTogYWRkIHJpc2MtdiBpb21tdSBwbXUgZHJpdmVyCj4gICBpb21tdS9yaXNjdjogY3Jl
YXRlIGEgYXV4aWxpYXJ5IGRldmljZSBmb3IgSFBNCj4KPiAgZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS1iaXRzLmggfCAgNjEgLS0tCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyAgICAg
IHwgIDIwICsKPiAgZHJpdmVycy9wZXJmL0tjb25maWcgICAgICAgICAgICAgfCAgMTIgKwo+ICBk
cml2ZXJzL3BlcmYvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvcGVyZi9y
aXNjdl9pb21tdV9wbXUuYyAgIHwgNjYxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgNSBmaWxlcyBjaGFuZ2VkLCA2OTQgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BlcmYvcmlzY3ZfaW9tbXVfcG11LmMKPgo+IC0t
Cj4gMi40My43Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
