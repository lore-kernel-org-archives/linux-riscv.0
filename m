Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48AE7CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQXYlZP5aAI/u15/+jvFim4ST6BSeXEx3NWKVmkqceo=; b=cslfbL1UNhcqUz
	bBfCDkoEKby70wUeyU55E/A4Aun9y6CmaruxYZVovdTFLpobcKhYOR0i/PI4d8ZEiaKuNwnr6c91K
	DttYfmCmFtVAcYMrUJXDkQVDpUaYBroudZ6WYvW/aLT6afnTzwvD976WY+jcdHDLGlEUxycUtE6bX
	G6JFCMbexVjTuxAU6IZ/d+hAaXIncbYnFgwHAnP6QIBaVz/hbDy+HUz7LeYGw45PZ/Y7hJVvO5eNb
	4kyBCOuKeINmkjpedQO2ztTF9h1MJzfr08MuDiiS8jDMjOkoQy8YGQQK5Prkv0o3R4UFGK3fGb3x7
	ku2UqdELKwD7xHASl/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgNp-0000000BP7Y-2kxW;
	Sat, 25 Oct 2025 15:40:45 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgNm-0000000BP73-2tYM
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 15:40:43 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-63c2d72581fso4692487a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761406841; x=1762011641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HY16VFXZq4Fs4AqSUpKJwWPQq433JoGDwf5zAVL/Es=;
        b=MfFe64vRroYIN9NT/+UyKyYOfQ2xwxDDU/C7YCzdixoUqMDmcSq0U5q/fXSVx1Hfkq
         VEnGjCpUaAmEdz9U/5NKvAEGjUWrMxko2bKfp8go379jKrjaOLxVdDFK2Nn2Lw4tSaOf
         sc7yf6u4iWjzjhceT6qktm229BKbd0mWTa1uAeDuAhQVHgHEj5JbAQ2uU1KDpGLnPbbG
         lglgv9B4rrYdIX7iotkNo73E9YT69H0y3qMp7+dtwvShk/77DsQ/xO/eqcRMFe2h+xqm
         AQskQKQrpIQzUV1ZlFmO0mtPw8wS88DE1ksznOez9ArKnFcJ17dEDyMJSjBhc/pFeX4X
         lV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761406841; x=1762011641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HY16VFXZq4Fs4AqSUpKJwWPQq433JoGDwf5zAVL/Es=;
        b=rZmjliynBMnenzdre6bFbrLJLps9hXpxxSEiWBp3dDgAGK+Iu3hwGD0oNhCmYx/LBW
         gSF/T2vJDgLE9zulil5GTgDsqfexLr8NgN4cw4dXf/aa/yNLbz5B2rTNDHigWT9ihJNv
         L7RsiOiASaROHAQiki8Rzz3pm33HqV0baxXHGs/TV3MZSbCfP0fCSyCvRahLtfeBAdzJ
         zwVVmjbnlmVDNxDSUmVNXDIg81aOJcxElLFg+PeIFjzBDgYwdRQrXN3Tkw/kcWAn4Vz1
         ybZxGsi+NiO/0hiFm7HmOk2oEoZNU6P5DRjm4kUXHQmmE7GGcqsVa0juAz2yQ33cSGHY
         09yA==
X-Forwarded-Encrypted: i=1; AJvYcCV0JRg3iQl+JnvdrSnP6t1/k3lEhsrko8UPzPA4aH8UKNeA6UdL5Eo21lMa13wlsE5rOxJCQtu3V6XkEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyURH4LA0Jm8qK6m2wAMDRA5eqPFVYAJY071XNZBTdoTe5hjxeU
	zrgVC6cwsRIQdqzcJTBf8BG0e0gQ7t7UyqgEgu2RHyd9MFDwMTZ56P6psbbkZVaElf+fw2UdR61
	5QgfC9n3h3CUArJK4Q8CGG6O6Naa7GNpn4fKfvqFFDA==
X-Gm-Gg: ASbGncsPAsCf8hARIwOyCno1safuqHt+sFicZHsu6VlzeUtel0AaREIKJ1AhysLfWEG
	C758wnHjHTZw9s/aeC2oqOxqBkCqTxA72rJBKlQmVKV6KiK+r17aMuaQNxTHKCNatHFQE0eQbIY
	lVyDYFDGUzO2HGR4lD0EAnuNflaSQy5DYXG07KeoDAjLIR012fYHak2XlZ7/Pj/1TBg00rIcdGc
	pRvFd1Qmxad/XW+a2V4v41O9FR50ODIK7QeJatDwSkCnPVmCJxf1bYP9Bu+XLIKsu+4dBmsTNsi
	RWDj4GpPDToSLnDQ8A==
X-Google-Smtp-Source: AGHT+IHusR3pR0UReEeTXHeTWS5omMas6c+gaYiIEsLmjRg06Miw4AMQcuQX3fi9PVgOyyAmpc1NpRtLuc0jLuFpHKE=
X-Received: by 2002:a05:6402:4504:b0:63c:103b:e1cf with SMTP id
 4fb4d7f45d1cf-63c1f584283mr30192670a12.0.1761406840700; Sat, 25 Oct 2025
 08:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <6-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <6-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:40:04 -0400
X-Gm-Features: AWmQ_bmCjfexrZLPPfdt56XAonJ2DbSa1CpJkmBpIfIxbAsyN_ouXa6sCMuBecc
Message-ID: <CA+CK2bDZ1RX9o80x2+HTshix0zxLcruzDfW--NMS8CjWo1PfUg@mail.gmail.com>
Subject: Re: [PATCH v7 06/15] iommupt: Add unmap_pages op
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_084042_747182_53F46DC2 
X-CRM114-Status: GOOD (  18.35  )
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMjoyMOKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gdW5tYXBfcGFnZXMgcmVtb3ZlcyBtYXBwaW5ncyBhbmQgYW55
IGZ1bGx5IGNvbnRhaW5lZCBpbnRlcmlvciB0YWJsZXMgZnJvbQo+IHRoZSBnaXZlbiByYW5nZS4g
VGhpcyBmb2xsb3dzIHRoZSBub3ctc3RhbmRhcmQgaW9tbXVfZG9tYWluIEFQSSBkZWZpbml0aW9u
Cj4gd2hlcmUgaXQgZG9lcyBub3Qgc3BsaXQgdXAgbGFyZ2VyIHBhZ2Ugc2l6ZXMgaW50byBzbWFs
bGVyLiBUaGUgY2FsbGVyIG11c3QKPiBwZXJmb3JtIHVubWFwIG9ubHkgb24gcmFuZ2VzIGNyZWF0
ZWQgYnkgbWFwIG9yIGl0IG11c3QgaGF2ZSBzb21laG93Cj4gb3RoZXJ3aXNlIGRldGVybWluZWQg
c2FmZSBjdXQgcG9pbnRzIChlZyBpb21tdWZkL3ZmaW8gdXNlIGlvdmFfdG9fcGh5cyB0bwo+IHNj
YW4gZm9yIHRoZW0pCj4KPiBBIGZ1dHVyZSB3b3JrIHdpbGwgcHJvdmlkZSAnY3V0JyB3aGljaCBl
eHBsaWNpdGx5IGRvZXMgdGhlIHBhZ2Ugc2l6ZSBzcGxpdAo+IGlmIHRoZSBIVyBjYW4gc3VwcG9y
dCBpdC4KCkFyZSB0aGVyZSBwbGFucyB0byBhZGQgImZyZWUiIHdoZW4gYSB0YWJsZSBiZWNvbWVz
IGVtcHR5IG9uIGFuIHVubWFwPwpOb3Qgc3VyZSB3aGF0IHdvdWxkIGJlIGFuIGVmZmljaWVudCBp
bXBsZW1lbnRhdGlvbiBmb3IgdGhhdCwgbWF5YmUgYQpyZWZjbnQgZm9yICMgZW50cmllcyBpbiB0
YWJsZT8KCj4gdW5tYXAgaXMgaW1wbGVtZW50ZWQgd2l0aCBhIHJlY3Vyc2l2ZSBkZXNjZW50IG9m
IHRoZSB0cmVlLiBJZiB0aGUgY2FsbGVyCj4gcHJvdmlkZXMgYSBWQSByYW5nZSB0aGF0IHNwYW5z
IGFuIGVudGlyZSB0YWJsZSBpdGVtIHRoZW4gdGhlIHRhYmxlIG1lbW9yeQo+IGNhbiBiZSBmcmVl
ZCBhcyB3ZWxsLgo+Cj4gSWYgYW4gZW50aXJlIHRhYmxlIGl0ZW0gY2FuIGJlIGZyZWVkIHRoZW4g
dGhpcyB2ZXJzaW9uIHdpbGwgYWxzbyBjaGVjayB0aGUKPiBsZWFmLW9ubHkgbGV2ZWwgb2YgdGhl
IHRyZWUgdG8gZW5zdXJlIHRoYXQgYWxsIGVudHJpZXMgYXJlIHByZXNlbnQgdG8KPiBnZW5lcmF0
ZSAtRUlOVkFMLiBNYW55IG9mIHRoZSBleGlzdGluZyBkcml2ZXJzIGRvbid0IGRvIHRoaXMgZXh0
cmEgY2hlY2suCj4KPiBUaGlzIHZlcnNpb24gc2l0cyB1bmRlciB0aGUgaW9tbXVfZG9tYWluX29w
cyBhcyB1bm1hcF9wYWdlcygpIGJ1dCBkb2VzIG5vdAo+IHJlcXVpcmUgdGhlIGV4dGVybmFsIHBh
Z2Ugc2l6ZSBjYWxjdWxhdGlvbi4gVGhlIGltcGxlbWVudGF0aW9uIGlzIGFjdHVhbGx5Cj4gdW5t
YXBfcmFuZ2UoKSBhbmQgY2FuIGRvIGFyYml0cmFyeSByYW5nZXMsIGludGVybmFsbHkgaGFuZGxp
bmcgYWxsIHRoZQo+IHZhbGlkYXRpb24gYW5kIHN1cHBvcnRpbmcgYW55IGFycmFuZ21lbnQgb2Yg
cGFnZSBzaXplcy4gQSBmdXR1cmUgc2VyaWVzCj4gY2FuIG9wdGltaXplIF9faW9tbXVfdW5tYXAo
KSB0byB0YWtlIGFkdmFudGFnZSBvZiB0aGlzLgo+Cj4gRnJlZWQgcGFnZSB0YWJsZSBtZW1vcnkg
aXMgYmF0Y2hlZCB1cCBpbiB0aGUgZ2F0aGVyIGFuZCB3aWxsIGJlIGZyZWVkIGluCj4gdGhlIGRy
aXZlcidzIGlvdGxiX3N5bmMoKSBjYWxsYmFjayBhZnRlciB0aGUgSU9UTEIgZmx1c2ggY29tcGxl
dGVzLgo+Cj4gVGVzdGVkLWJ5OiBBbGVqYW5kcm8gSmltZW5leiA8YWxlamFuZHJvLmouamltZW5l
ekBvcmFjbGUuY29tPgo+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPgoK
UmV2aWV3ZWQtYnk6IFBhc2hhIFRhdGFzaGluIDxwYXNoYS50YXRhc2hpbkBzb2xlZW4uY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
