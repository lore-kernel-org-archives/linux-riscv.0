Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E53C5321E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoTL3qQImPHYf003Y+hi6shoQM167rtY0B+jZL0Zsfc=; b=P03Nhx6KLgpjTf
	vDM82BaxkDSihIQCJTs8hOsO0XboQlySWpRwJs+Hplozvi69mdLRZ1i8cfS3s4K0YimjMEsfr03SD
	bBm4vvalZs1K230R1qeRf+WtKqYNYFuofVr9uD3VQJJIXrbaxISsIlym1q5L2cLSAyGyPYpXziXEZ
	YaSSQMqTuIep+m7AhmeDQ5ImAO2HIhR0cdZrfSREIX++ptuyQa4tVNhi02NHT+BD9QE+JzFTMZRMM
	5tYrvSkaDq1ekCf/0jp+DY4X6BVQk/BCSUyFTGt6dFBYhbXIIUmfNuND9C798h4N/hQ8v7Z3oMunY
	zyktcrtSKGj2OeCC7UNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicOE-00000007xwB-0Y6A;
	Mon, 26 Aug 2024 16:16:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sicNQ-00000007xoi-0xs3;
	Mon, 26 Aug 2024 16:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D470A414A6;
	Mon, 26 Aug 2024 16:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524E2C52FCE;
	Mon, 26 Aug 2024 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724688930;
	bh=jkqzvuLSKjk6lxkGNGUcsw4Ig8szieDjSx37poI+59o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NYWABbd0U6yyuZqn5kmSmh7Xdk00XRb45Dx7+od8kmc/pBgSbzMmA4k5NDBVX2wYI
	 5iJB/R9LzPZ6f5xCvUyJIXel4a+kYx6vhDtNmtl6Xj21jyiXxOe6qIo7uReIXrv0U2
	 F+M9qmx/R4K0bPMU1mSFNJFVApkx9rQ9jIvpqMqPKLU9E60rqVNW2O2X2nlh9/A8XC
	 UD6NzLGtFDvo0O92r7YhbEc/ge4S16B0nZ8viWUeReSOHHgRqogx3TZkk0BYqvR17X
	 b9hUpRe7laTZBx8dtKx8QUujAaTqLeNA4U+72f5NFg3PMezMyuNq/ubMbJ1jtw0oeN
	 vSDudxbd3Cijw==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2705dd4ba64so3119011fac.3;
        Mon, 26 Aug 2024 09:15:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYN9sRZ183n6IISDybz/zbjhEfMs5rVtK12yNFbGubwXS1QOVUx1exXPN3MnM6WpqBtvFCZzHYDaR1lkM=@lists.infradead.org, AJvYcCXf9SWYQvuYNg4Y99Oy5+1dzxw4Snm49ILx8AbKqgyOQgvph5hF5mkAFGyXWLUtqqzMQUdC25b8eapshwcBOLS3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1B6BCsDtyoS7RkueZr0hPNQ25XAeD2NtyVC5Wf4CGwKQadbdt
	/pGeS4hF8sfLWFaGQCyVRvgaH9Oc6dYzAKbfHt2F7hatcEpXjihD59M3+mT2I20yvJoG/vZWbXe
	A8TLKnxGLEo9pM+2vccYyZAd9kYM=
X-Google-Smtp-Source: AGHT+IFp1BTLSWH4mpHphZAC/nONYYceOu5PBYhd0g/XSqLewTat+1/1B6joUdncVGCUq66DbIYrXTslw/vMXVK62fc=
X-Received: by 2002:a05:6871:7419:b0:270:2879:e349 with SMTP id
 586e51a60fabf-273e6552ce8mr11105378fac.23.1724688929326; Mon, 26 Aug 2024
 09:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
 <ZrlgVUXC_dCW9ISM@sunil-laptop> <87mskzcnmf.ffs@tglx>
In-Reply-To: <87mskzcnmf.ffs@tglx>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 26 Aug 2024 18:15:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
Message-ID: <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
Subject: Re: [PATCH v8 00/17] RISC-V: ACPI: Add external interrupt controller support
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_091532_413064_68DDC670 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: linux-arm-kernel@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, acpica-devel@lists.linux.dev, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgNToyNeKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDEyIDIwMjQgYXQgMDY6MzcsIFN1
bmlsIFYuIEwuIHdyb3RlOgo+ID4gT24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMDY6Mjk6MTJBTSAr
MDUzMCwgU3VuaWwgViBMIHdyb3RlOgo+ID4+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3Ig
dGhlIGJlbG93IEVDUiBhcHByb3ZlZCBieSBBU1dHLgo+ID4+IDEpIE1BRFQgLSBodHRwczovL2Ry
aXZlLmdvb2dsZS5jb20vZmlsZS9kLzFvTUdQeU9ENThKYVBnTWwxcEthc1QtVktzSUtpYTd6Ui92
aWV3P3VzcD1zaGFyaW5nCj4gPj4KPiA+PiBUaGUgc2VyaWVzIHByaW1hcmlseSBlbmFibGVzIGly
cWNoaXAgZHJpdmVycyBmb3IgUklTQy1WIEFDUEkgYmFzZWQKPiA+PiBwbGF0Zm9ybXMuCj4gPgo+
ID4gVGhpcyBzZXJpZXMgaGFzIHNwZW50IHF1aXRlIGEgYml0IG9mIHRpbWUgbm93IG9uIHRoZSBs
aXN0LiBBcyB5b3UgYXJlCj4gPiBhd2FyZSwgZmV3IGNsYXJpZmljYXRpb25zIGxpa2UgX1BJQyBj
b2RlcyBhcmUgYWxzbyBkb25lIG5vdy4gVGhlcmUgaXMKPiA+IG5vIG1ham9yIGNoYW5nZSBhZnRl
ciB5b3UgaGFkIGFncmVlZCBmb3IgdGhlIGRlc2lnbi4gU28sIGNhbiB0aGlzIGJlCj4gPiBjb25z
aWRlcmVkIGZvciB0aGUgbmV4dCByZWxlYXNlIHBsZWFzZT8KPgo+IFJhZmFlbCwgaWYgeW91IHdh
bnQgdG8gdGFrZSBpdCB0aHJvdWdoIHRoZSBBQ1BJIHRyZWUsIHRoZW4gZm9yIHRoZQo+IGlycWNo
aXAgcGFydHMgcGxlYXNlIGFkZDoKPgo+ICAgQWNrZWQtYnk6IFRob21hcyBHbGVpeG5lciA8dGds
eEBsaW51dHJvbml4LmRlPgoKWWVzLCBJJ20gZ29pbmcgcm8gZG8gdGhpcy4KClRoYW5rIHlvdSEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
