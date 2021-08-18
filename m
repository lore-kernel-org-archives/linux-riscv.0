Return-Path: <SRS0=tTyi=NJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2C9C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Aug 2021 00:15:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92C7E60EBC
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Aug 2021 00:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92C7E60EBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgWwG00stTMMB3zCdYQjrPZbhBdAcZ3Bw1GAziC/o0U=; b=EfemzDxBra94fR
	fxzB5f/Kjhz1ppCG1tnV0zLxubMD2ey1IRQBjqje8Au3VI5TJHveem1CgscKLev6WXa5NzoFtVS3I
	HH0tHWxRzPbeCsqQgVyHd18/XWgr8SnAMOWlnHumbwVHREYzOpUsRJFs+A6lOxhfs1nSMaNKtvBQ+
	TPUZ7eNzfclMHnDkIkxiyUiIG/H8jpYad/RnP7lRrD/wDsrJy/O3CYTdtTFoVKziDXz/0RM8Oc0o6
	thaIGn1caDiHOYgreXgYO2/mi0EQpXSSor8OUNL6J/FYXh66rogmbQ4Sae1BaYjpU2OzQMGQotD4E
	pNZVkNxODZEKT6W/QwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG9E9-003lB1-BP; Wed, 18 Aug 2021 00:14:41 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG9Ch-003khY-6C; Wed, 18 Aug 2021 00:13:12 +0000
Received: by mail-oi1-f171.google.com with SMTP id bd1so1911035oib.3;
 Tue, 17 Aug 2021 17:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=++h8bUGhJWF7B6yyYyoh0nKkVdcF8eCL74y7f9GeZ4Y=;
 b=hGdA7FeGe3+Jso4pBOdBQfqJdq3Xu5mzPLEU02n5GcrtIx/Q5B6CAMyOhh5CpTaHu5
 RbOxB+bhQw0BgOXHvUqLAwYceNbXEmA8hQUyNVmT9xpaFkg/Zk4JeJfRT45U60HYQc2D
 6xno1qx9KMRFG/Jg5x5BSMswjq7ukzYDUuFsbmJTq5wEKP0ZqBu4TO53mpoQR99cKQb4
 wiwqoIOwRHv1btcWWB+RSLs9qjnP6wcsE1n4CtBT4dPsoh+2duVR/GjAXIA61ZqGTocm
 aAgl93TRgatPW01eATN4CPzzh8Wjgea2pEQlT1RfP3FBHzu051lR0rX83E6m1cfNtAD2
 MczA==
X-Gm-Message-State: AOAM5323t0th+PnewAg3xg8jQCCK6yI0kJWRlYA7ctCH6ynF/a13/QUi
 qYFxMm9UHeKfPCpSXBNiYA==
X-Google-Smtp-Source: ABdhPJyJOifM/j6dYvgpX8URevK/gXq/UxE91n+1ytfa41bf6TcZ7UPHLnQ6y0p94fi4QGOLVqhW9w==
X-Received: by 2002:aca:b984:: with SMTP id j126mr4666629oif.32.1629245590250; 
 Tue, 17 Aug 2021 17:13:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k16sm738270oor.16.2021.08.17.17.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 17:13:09 -0700 (PDT)
Received: (nullmailer pid 1094241 invoked by uid 1000);
 Wed, 18 Aug 2021 00:13:07 -0000
Date: Tue, 17 Aug 2021 19:13:07 -0500
From: Rob Herring <robh@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, linux-mm@kvack.org,
 linux-mips@vger.kernel.org, 
 "Kirill A . Shutemov" <kirill.shtuemov@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Peter Zijlstra <peterz@infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Will Deacon <will@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Lutomirski <luto@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, 
 Russell King <linux@armlinux.org.uk>, Russell King <rmk+kernel@armlinux.org.uk>,
 Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
 linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
 Guenter Roeck <linux@roeck-us.net>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Hansen <dave.hansen@linux.intel.com>, linux-s390@vger.kernel.org, 
 kvmarm@lists.cs.columbia.edu, devicetree@vger.kernel.org
Subject: Re: [PATCH v5] memblock: make memblock_find_in_range method private
Message-ID: <YRxQk0Cjj5yzmvBA@robh.at.kernel.org>
References: <20210816122622.30279-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816122622.30279-1-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_171311_311936_B01EC009 
X-CRM114-Status: GOOD (  21.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 16 Aug 2021 15:26:22 +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> There are a lot of uses of memblock_find_in_range() along with
> memblock_reserve() from the times memblock allocation APIs did not exist.
> 
> memblock_find_in_range() is the very core of memblock allocations, so any
> future changes to its internal behaviour would mandate updates of all the
> users outside memblock.
> 
> Replace the calls to memblock_find_in_range() with an equivalent calls to
> memblock_phys_alloc() and memblock_phys_alloc_range() and make
> memblock_find_in_range() private method of memblock.
> 
> This simplifies the callers, ensures that (unlikely) errors in
> memblock_reserve() are handled and improves maintainability of
> memblock_find_in_range().
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Kirill A. Shutemov <kirill.shtuemov@linux.intel.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>	# ACPI
> Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Acked-by: Nick Kossifidis <mick@ics.forth.gr>			# riscv
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>		# arm64
> ---
> v5:
> * restore the original behaviour on x86 with addition of more elaborate
>   comment; I will address the issue in memory_map_top_down() in a separate
>   series.
> 
> v4: https://lore.kernel.org/lkml/20210812065907.20046-1-rppt@kernel.org
> * Add patch that prevents the crashes reported by Guenter Roeck on x86/i386
>   on QEMU with 256M or 512M of memory and EFI boot enabled.
> * Add Acked-by and Reviewed-by, thanks everybidy!
> 
> v3: https://lore.kernel.org/lkml/20210803064218.6611-1-rppt@kernel.org
> * simplify check for exact crash kerenl allocation on arm, per Rob
> * make crash_max unsigned long long on arm64, per Rob
> 
> v2: https://lore.kernel.org/lkml/20210802063737.22733-1-rppt@kernel.org
> * don't change error message in arm::reserve_crashkernel(), per Russell
> 
> v1: https://lore.kernel.org/lkml/20210730104039.7047-1-rppt@kernel.org
> 
> 
>  arch/arm/kernel/setup.c           | 20 +++++---------
>  arch/arm64/kvm/hyp/reserved_mem.c |  9 +++----
>  arch/arm64/mm/init.c              | 36 ++++++++-----------------
>  arch/mips/kernel/setup.c          | 14 +++++-----
>  arch/riscv/mm/init.c              | 44 ++++++++++---------------------
>  arch/s390/kernel/setup.c          | 10 ++++---
>  arch/x86/kernel/aperture_64.c     |  5 ++--
>  arch/x86/mm/init.c                | 23 ++++++++++------
>  arch/x86/mm/numa.c                |  5 ++--
>  arch/x86/mm/numa_emulation.c      |  5 ++--
>  arch/x86/realmode/init.c          |  2 +-
>  drivers/acpi/tables.c             |  5 ++--
>  drivers/base/arch_numa.c          |  5 +---
>  drivers/of/of_reserved_mem.c      | 12 ++++++---
>  include/linux/memblock.h          |  2 --
>  mm/memblock.c                     |  2 +-
>  16 files changed, 81 insertions(+), 118 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
