Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A02CCD18E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 01:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LGp81phDE3pjisMwc2wxfRZ5T8kaczCT1auwxypER8=; b=ydO5xpcH4CzeZx
	aSddWpcyUdRoG4SExFfGt+Js8fzLjceiwYrDLq2af0DM9E7q2qfxnG01WG9mKu+0VhWhBhrpOTbsd
	0RRk4SEAjE7L3qV1PN8tY3/idVk4J1w0jQ8bJ4OS1rYo2aEGQJIMEAtRDqZrrUrRy11yviO9Ta9uQ
	dQuwwBgyuTakpAt6KW2fQ/VxKcyt9CXRrm/JRO26kEBd/4Zu31i0j5fGV4t6OPI/QKBq/S8rXsYuV
	KdsulTYLJmcwsNKH878QGFalVonrsgNOYywPP6U6GMpWG+curs0Oft/pf58tobVgNsCi2GPvZnT0Z
	rMX3aisv236/QHQkUhyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8q1Z-000000008f1-0fBu;
	Wed, 15 Oct 2025 01:09:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8q1X-000000008eg-1C7L
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 01:09:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0B2B490F9
	for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 01:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACA9C116D0
	for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 01:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760490590;
	bh=eAc8ToLT++sjML7CILZCptHEuY2mOuZKGs45HA4rKDQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hqvdr8EAoSCMceVboYhaIrNbKUgrG6K/GONU/pN9c6K741lte0ksBgF631dRUmXAR
	 TOzQruoAOww3Ku9spozdvs9MGRvEYZrJGYgoayVrQXxF9KKsr3Q4K2N7AtEk4/A7zv
	 Y/SwQ86CPtqnqkTcnrlwVvbub61h4B99VLX4krs5HxMD4MoBgnA+irgsc48gSceJqU
	 e+leT8Wx/OpI6DiOfHHISaNnRag5x4xjVGu3DVUTJJJuc3SGT4GelLFO5TqQIMs/gs
	 iwCLtF6XjvxbXxY5v3og+3yofqRuAkQ/k6hrBOe5ptJobRjulroWS1vkcBJgzIYh1C
	 mBWMupSqhkxlA==
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e504975dbso35618385e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 18:09:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgdiuApeVo5BeR2XwjuupA+1iw/tyQHXPSx+GjeCpYVOCNMeEUywm+YlZKVn/C/Y8KUjFTi8B7dQCZaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVXO3XWLSiT+EyyWc+jw4UXxbtbdZ1A/dtBcUpYeOJBUm+WkTz
	A4QB49M6suLf4O9LqPl7ewVcCoxzjNYZyc1KLPV62RevKt1VjJW51ROlUBD0ISu0UFYTDn5eSAV
	aNq/Wc7kKTyE52G7GFN6jn+YX2XcAxUs=
X-Google-Smtp-Source: AGHT+IEf1qHDhIy3ghKtvb57UtTDu7Eu45y/mQdGhF+whW4lndi3TKlBmmJMDsWa7NiJS7VrCQsWX0uq8LcDgSwPQp8=
X-Received: by 2002:a05:600c:4e0c:b0:46e:4c67:ff17 with SMTP id
 5b1f17b1804b1-46fa9a98d8cmr165301465e9.14.1760490589115; Tue, 14 Oct 2025
 18:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251014131032.49616-1-ziyao@disroot.org> <20251014131032.49616-2-ziyao@disroot.org>
In-Reply-To: <20251014131032.49616-2-ziyao@disroot.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 15 Oct 2025 09:09:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQX+7sUU5mwO_VW1evTCTVR6bvVNuEXzgTuW3WB5w7e3Q@mail.gmail.com>
X-Gm-Features: AS18NWBQYrQzenUDz05dqM7PP-EICAzNJPLTN3D8td0YUM6voGD9A9WUDe25oSI
Message-ID: <CAJF2gTQX+7sUU5mwO_VW1evTCTVR6bvVNuEXzgTuW3WB5w7e3Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: reset: thead,th1520-reset: Remove
 non-VO-subsystem resets
To: Yao Zi <ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_180951_363686_72AEF5EF 
X-CRM114-Status: GOOD (  13.74  )
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgOToxMeKAr1BNIFlhbyBaaSA8eml5YW9AZGlzcm9vdC5v
cmc+IHdyb3RlOgo+Cj4gUmVnaXN0ZXJzIGluIGNvbnRyb2wgb2YgVEgxNTIwX1JFU0VUX0lEX3tO
UFUsV0RUMCxXRFQxfSBiZWxvbmcgdG8gQVAKPiByZXNldCBjb250cm9sbGVyLCBub3QgdGhlIFZP
IG9uZSB3aGljaCBpcyBkb2N1bWVudGVkIGFzCj4gInRoZWFkLHRoMTUyMC1yZXNldCIgYW5kIGlz
IHRoZSBvbmx5IHJlc2V0IGNvbnRyb2xsZXIgc3VwcG9ydGVkIGZvcgo+IFRIMTUyMCBmb3Igbm93
Lgo+Cj4gTGV0J3MgcmVtb3ZlIHRoZSBJRHMsIGxlYXZpbmcgdGhlbSB0byBiZSBpbXBsZW1lbnRl
ZCBieSBBUC1zdWJzeXN0ZW0KPiByZXNldCBjb250cm9sbGVyIGluIHRoZSBmdXR1cmUuCgpMR1RN
LgoKQWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKPgo+IEZpeGVzOiAzMGU3
NTczYmFiZGMgKCJkdC1iaW5kaW5nczogcmVzZXQ6IEFkZCBULUhFQUQgVEgxNTIwIFNvQyBSZXNl
dCBDb250cm9sbGVyIikKPiBTaWduZWQtb2ZmLWJ5OiBZYW8gWmkgPHppeWFvQGRpc3Jvb3Qub3Jn
Pgo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+
ICBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L3RoZWFkLHRoMTUyMC1yZXNldC5oIHwgMyAtLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kdC1iaW5kaW5ncy9yZXNldC90aGVhZCx0aDE1MjAtcmVzZXQuaCBiL2luY2x1ZGUvZHQtYmlu
ZGluZ3MvcmVzZXQvdGhlYWQsdGgxNTIwLXJlc2V0LmgKPiBpbmRleCBlZTc5OTI4NmMxNzUuLmU1
MWQ2MzE0ZDEzMSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L3RoZWFk
LHRoMTUyMC1yZXNldC5oCj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC90aGVhZCx0
aDE1MjAtcmVzZXQuaAo+IEBAIC05LDkgKzksNiBAQAo+Cj4gICNkZWZpbmUgVEgxNTIwX1JFU0VU
X0lEX0dQVSAgICAgICAgICAgIDAKPiAgI2RlZmluZSBUSDE1MjBfUkVTRVRfSURfR1BVX0NMS0dF
TiAgICAgMQo+IC0jZGVmaW5lIFRIMTUyMF9SRVNFVF9JRF9OUFUgICAgICAgICAgICAyCj4gLSNk
ZWZpbmUgVEgxNTIwX1JFU0VUX0lEX1dEVDAgICAgICAgICAgIDMKPiAtI2RlZmluZSBUSDE1MjBf
UkVTRVRfSURfV0RUMSAgICAgICAgICAgNAo+ICAjZGVmaW5lIFRIMTUyMF9SRVNFVF9JRF9EUFVf
QUhCICAgICAgICAgICAgICAgIDUKPiAgI2RlZmluZSBUSDE1MjBfUkVTRVRfSURfRFBVX0FYSSAg
ICAgICAgICAgICAgICA2Cj4gICNkZWZpbmUgVEgxNTIwX1JFU0VUX0lEX0RQVV9DT1JFICAgICAg
IDcKPiAtLQo+IDIuNTAuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
