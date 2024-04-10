Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D30CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 19:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4n6KCJ3t2vvoLSXaPaF5kEBrUEnZZOVtMX3XGvBZEFA=; b=adqbg0aY29Ub8H
	NBD3fUtWO+GgLOIRHCZdxpnqi0Sm+24gfttdZzicYTN+S2hy4uuBbLv1bgAnEWw4hpv+chFiDsO5b
	NEuLeL8Xcng5VyolNNpofsmB0fOW3eH/PRvLMwBSQ1nv4n975FvjU/griE8Ll0rv3eegGXo5oRIgz
	UhjuHt2O66p2vCKqswC2SZtO96Ax0/oaIaLPXgZPoKDkGCReEHDQ0f7yZD2Py3qOAomLgm/YFEYDj
	xhcy0kaCBk+WQHKkKpaUGJxTdNlNoQgzoyO3qW96hWovMbv2ncR7UeyQp+iUFhxAEIMHabdwlFHF8
	0MVWaLsgAlyXRoV9GZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudJ5-00000008csX-3Xum;
	Wed, 10 Apr 2024 19:08:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudIz-00000008cpC-36mL;
	Wed, 10 Apr 2024 19:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 07A58CE2B57;
	Wed, 10 Apr 2024 19:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48374C433F1;
	Wed, 10 Apr 2024 19:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712776099;
	bh=+eWLmlEP0bVT8/CZ2rvIUuWI74CBRr7mdsinkobDlzU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kBer6g/FSVcQNlQN/dT52LUBGg0hkyFCcgbXq3fUnv4hC2VilA1zuyGqPVGaoI9rz
	 0/MBcRSiQDjk5VbvTar8s1MII5Y0adKzNxjkxeYxriw3mc+K55GlJawuRxte3IPF3T
	 0yjLhDefgapwQ1FYh/ibQke8EUvsYSFf2Bt7tSkMULO3L6dgzwxMmS2ZrG0XpBh0qj
	 TZ6p5zrmOCPyTsntakq4I6xUnUrHcUgIY7EjynOD9Edj3qR4Uj1GT2QnyWxaffty1+
	 T4vEkU9e25UakyTkLUOKd2E5zgMj5xwEQfwgEcWbJ/DWijYATCohmlmkXXuvdqLrVa
	 rpMLs6ScIMD8Q==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-22ed9094168so486562fac.1;
        Wed, 10 Apr 2024 12:08:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTUoEGq8e/IOaQYSVLGW66EQC3A0ovVFb4p0y2tiGpg2l6BkzNRd/BzmLf8zXGiLC1ObJ61ptmAIbOc7qVU5fg9KOWiis9whbtHWpUeOkyjLEc59E7sFPPWtxlJ1VqATvz3jkM/p9tQXcz/6VQyXVPHHU9PIg=
X-Gm-Message-State: AOJu0Yz4H+QCoClWQaSbNedSkF9XFR+sc7VJJgwdd5e/4dTC1wcOYsog
	5g+ViCm1ECPiT3EXVercQVliIn/gStmPcyrLf1Uu/3EF/F/wUfB9tmws7MTiW4ieUELy52B3foz
	XW8usKB1NSej5Zj99GhbedPvEV4o=
X-Google-Smtp-Source: AGHT+IH4A92J5HCRnizSgBq3+DCMERDHMutgLTgDu/kxW+WK07c2IT8FOUNC46ZvoIhnKLsY7Mrt28XT6qdFy5OJWR8=
X-Received: by 2002:a05:6870:219d:b0:22e:b2ea:5758 with SMTP id
 l29-20020a056870219d00b0022eb2ea5758mr3756127oae.0.1712776098584; Wed, 10 Apr
 2024 12:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk> <E1rVDmU-0027YP-Jz@rmk-PC.armlinux.org.uk>
 <CAJZ5v0iiJpUWq5GMSnKFWQTzn_bdwoQz9m=hDaXNg4Lj_ePF4g@mail.gmail.com>
 <20240322185327.00002416@Huawei.com> <20240410134318.0000193c@huawei.com>
 <CAJZ5v0ggD042sfz3jDXQVDUxQZu_AWaF2ox-Me8CvFeRB8nczw@mail.gmail.com>
 <20240410145005.00003050@Huawei.com> <ZhbgwBBvh6ccdO7x@shell.armlinux.org.uk>
In-Reply-To: <ZhbgwBBvh6ccdO7x@shell.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 10 Apr 2024 21:08:06 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gG0xLajHsWXVM+-V+fQZAudvojechUa-DzFgwCs2q8Dg@mail.gmail.com>
Message-ID: <CAJZ5v0gG0xLajHsWXVM+-V+fQZAudvojechUa-DzFgwCs2q8Dg@mail.gmail.com>
Subject: Re: [PATCH RFC v4 02/15] ACPI: processor: Register all CPUs from acpi_processor_get_info()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_120822_204026_8DC12693 
X-CRM114-Status: GOOD (  16.99  )
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

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgODo1NuKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFdlZCwgQXByIDEwLCAyMDI0IGF0
IDAyOjUwOjA1UE0gKzAxMDAsIEpvbmF0aGFuIENhbWVyb24gd3JvdGU6Cj4gPiBJZiB3ZSBnZXQg
cmlkIG9mIHRoaXMgY2F0Y2ggYWxsLCBzb2x1dGlvbiB3b3VsZCBiZSB0byBtb3ZlIHRoZQo+ID4g
IWFjcGlfZGlzYWJsZWQgY2hlY2sgaW50byB0aGUgYXJtNjQgdmVyc2lvbiBvZiBhcmNoX2NwdV9y
ZWdpc3RlcigpCj4gPiBiZWNhdXNlIHdlIHdvdWxkIG9ubHkgd2FudCB0aGUgZGVsYXllZCByZWdp
c3RyYXRpb24gcGF0aCB0byBiZQo+ID4gdXNlZCBvbiBBQ1BJIGNhc2VzIHdoZXJlIHRoZSBxdWVz
dGlvbiBvZiBDUFUgYXZhaWxhYmlsaXR5IGNhbid0Cj4gPiB5ZXQgYmUgcmVzb2x2ZWQuCj4KPiBB
cmVuJ3Qgd2UgdGhlbiBuZWVkaW5nIHR3byBhcmNoX3JlZ2lzdGVyX2NwdSgpIGltcGxlbWVudGF0
aW9ucz8KPiBJJ20gYXNzdW1pbmcgdGhhdCB5b3UncmUgc3VnZ2VzdGluZyB0aGF0IHRoZSAhYWNw
aV9kaXNhYmxlZCwgdGhlbgo+IGRvIG5vdGhpbmcgY2hlY2sgaXMgbW92ZWQgaW50byBhcmNoX3Jl
Z2lzdGVyX2NwdSgpIC0gb3IgdG8gcHV0IGl0Cj4gYW5vdGhlciB3YXksIGFyY2hfcmVnaXN0ZXJf
Y3B1KCkgZG9lcyBub3RoaW5nIGlmIEFDUEkgaXMgZW5hYmxlZC4KPgo+IElmIGFyY2hfcmVnaXN0
ZXJfY3B1KCkgZG9lcyBub3RoaW5nIGlmIEFDUEkgaXMgZW5hYmxlZCwgaG93IGRvCj4gQ1BVcyBn
ZXQgcmVnaXN0ZXJlZCAoYW5kIHN5c2ZzIGZpbGVzIGdldCBjcmVhdGVkIHRvIGNvbnRyb2wgdGhl
bSkKPiBvbiBBQ1BJIHN5c3RlbXM/IEFDUEkgd291bGRuJ3QgYmUgYWJsZSB0byBjYWxsIGFyY2hf
cmVnaXN0ZXJfY3B1KCksCj4gc28gSSBzdXNwZWN0IHlvdSdsbCBuZWVkIGFuIEFDUEktc3BlY2lm
aWMgdmVyc2lvbiBvZiB0aGlzIGZ1bmN0aW9uLgoKYXJjaF9yZWdpc3Rlcl9jcHUoKSB3aWxsIGRv
IHdoYXQgaXQgZG9lcywgYnV0IGl0IHdpbGwgY2hlY2sgKHVwZnJvbnQpCmlmIEFDUEkgaXMgZW5h
YmxlZCBhbmQgaWYgc28sIGlmIHRoZSBBQ1BJIE5hbWVzcGFjZSBpcyBhdmFpbGFibGUuICBJbgp0
aGUgY2FzZSB3aGVuIEFDUEkgaXMgZW5hYmxlZCBhbmQgdGhlIEFDUEkgTmFtZXNwYWNlIGlzIG5v
dCByZWFkeSwgaXQKd2lsbCByZXR1cm4gLUVQUk9CRV9ERUZFUiAoc2F5KS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
