Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B4AC3DA61
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vBPfcHMQWEL4FQZuRJolh5vHej3aIHEVzlg2Q6X3iZk=; b=kxu8T2qd2bA14qq7CTA9lO0j2T
	cG/nao8z+emz9z+mKF5FSLeo27YoQMyxaDC7G2eY6sBEMwHpgZCvIq9Fk9bVUdXdTSeZXrb1QmYat
	FWcj1Mm3HyyVy5kzhVXj4MahKrF01ZHMLne7LOaNmuGrRrgqhLecEoWtIeNBYEq9hI57EBvtZZy+P
	7LohfXMaFldDt10OZ8Mym79CkdGxI0NvDGsS+JyIcpWC4PExb+KpIkHHxBjcz+hLKmsYQD7UE99Ha
	511rx8q/StymqBzm+dLUx1gEPGcTl+3R6brs5Vrm90aN4Pe+OGSwXhiAJCuaHxZIUZqOIdfzOjRFt
	6UM56Keg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWczA-0000000Faxm-0KRU;
	Wed, 24 Jul 2024 14:28:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWcz5-0000000Fawy-1AGk
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 14:28:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fc569440e1so17554115ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1721831329; x=1722436129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3nqH72VDw8RmqB9fqgozAQLD4BBtCtnc7ICMb0pdqo=;
        b=k7bEfqduhXWN3FDM61duAVVI89TpIUvhly7THAq+xKi8WnoZrXe7bJNayYxYYTYd08
         Q7NEryukYcFGTYC64q+mbt9ION9gsujivfilZFbtrRxkp5etzcQfcI3xDehhj2xrdoCs
         I6EvjhH6IDo4Zis9DUpLrYea0O+XDA8QJOp1YlKkw7R7ajl7kpVlZc1bXmElPNe799tk
         B4dOn5iM0ur7yv1cmTbF6jMS6GaBz8Uxhyf1MxAOC4+KEGDjNIuna72+znZNgK+7pdRC
         tGr09ILAPcYNFAdKProrWGHg9dE10yUrppJ11GltzR6BEVtpTn0Mo627P72V3QpaGdej
         l2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721831329; x=1722436129;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3nqH72VDw8RmqB9fqgozAQLD4BBtCtnc7ICMb0pdqo=;
        b=K9cXDGHWFmL5lOkRQzXfhsWXDrlB2sRd+zyYIQNllhJqvzv7jVha+1I6K7FyN1DzSX
         BTSiFNbPhhotw2C4V8pNmhiOgclCFxeMT+VH0P+Wyekc8zfmbb9x8WdkSxjqp+RUUaql
         Hlyg7tGimF724gGp/rwx+V3ffepY0z9f98TymP0zfAsCO6BPCWNS10wkSrQASKrGqI4L
         L5Rqh5Izy5s+Ju+uH8UH2G5AV8GyL+f3EsK1zvkvgbu+W41BjdlxphxYh5pvvgfuKmqp
         XFqXdSfHIVmK6hEte5hl8Sbe+twmOD7o3ue89b7McPZSqUJuVZ3UtZTWoAxlPhVJJ+1H
         7auA==
X-Forwarded-Encrypted: i=1; AJvYcCUT9eu7MxHIRwRd7n/XwSrAcYMDdyXse/Se7TaLibm272SxO8EO4urBSOJH5XSxwL7H5OR4T/xGwnvLlsXhqCTmroUavPEfG7njIFWX2Ozu
X-Gm-Message-State: AOJu0YyfF22Nd2MTdJ/brXqpGwdElBsFdXvLCtlX8qqUwhIqBKybwASl
	pmASSkkag7BgB6qNLBkWY559TySWg0v8NGtRg7YeS8eMOI673lpK+VccL+MF4F0=
X-Google-Smtp-Source: AGHT+IFi9T6gbkXmV6M0gUQxgPzjIznneNDGAuodoVLIsAjbkzHFshyyaJKmfCemmSEUumBxU+lXIw==
X-Received: by 2002:a17:903:1c7:b0:1fa:4b9:d00f with SMTP id d9443c01a7336-1fdd558b54emr23328495ad.53.1721831329437;
        Wed, 24 Jul 2024 07:28:49 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd73e6868csm91370235ad.96.2024.07.24.07.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 07:28:48 -0700 (PDT)
Date: Wed, 24 Jul 2024 07:28:48 -0700 (PDT)
X-Google-Original-Date: Wed, 24 Jul 2024 07:28:47 PDT (-0700)
Subject: Re: [PATCH v8 0/7] Linux RISC-V IOMMU Support
In-Reply-To: <cover.1718388908.git.tjeznach@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tjeznach@rivosinc.com
Message-ID: <mhng-7ec26af6-5347-4d42-b1de-696d2b7628ae@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_072851_531072_732A1CC9 
X-CRM114-Status: GOOD (  30.11  )
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
Cc: apatel@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, tjeznach@rivosinc.com, linux@rivosinc.com, Will Deacon <will@kernel.org>, joro@8bytes.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, seb@rivosinc.com, iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr, krzk+dt@kernel.org, robin.murphy@arm.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 14 Jun 2024 22:27:30 PDT (-0700), tjeznach@rivosinc.com wrote:
> This patch series introduces support for RISC-V IOMMU architected
> hardware into the Linux kernel.
>
> The RISC-V IOMMU specification, which this series is based on, is
> ratified and available at GitHub/riscv-non-isa [1].
>
> At a high level, the RISC-V IOMMU specification defines:
>
> 1) Data structures:
>   - Device-context: Associates devices with address spaces and holds
>     per-device parameters for address translations.
>   - Process-contexts: Associates different virtual address spaces based
>     on device-provided process identification numbers.
>   - MSI page table configuration used to direct an MSI to a guest
>     interrupt file in an IMSIC.
> 2) In-memory queue interface:
>   - Command-queue for issuing commands to the IOMMU.
>   - Fault/event queue for reporting faults and events.
>   - Page-request queue for reporting "Page Request" messages received
>     from PCIe devices.
>   - Message-signaled and wire-signaled interrupt mechanisms.
> 3) Memory-mapped programming interface:
>   - Mandatory and optional register layout and description.
>   - Software guidelines for device initialization and capabilities discovery.
>
>
> This series introduces RISC-V IOMMU hardware initialization and complete
> single-stage translation with paging domain support.
>
> The patches are organized as follows:
>
> Patch 1: Introduces minimal required device tree bindings for the driver.
> Patch 2: Defines RISC-V IOMMU data structures, hardware programming interface
>          registers layout, and minimal initialization code for enabling global
>          pass-through for all connected masters.
> Patch 3: Implements the device driver for PCIe implementation of RISC-V IOMMU
>          architected hardware.
> Patch 4: Introduces IOMMU interfaces to the kernel subsystem.
> Patch 5: Implements device directory management with discovery sequences for
>          I/O mapped or in-memory device directory table location, hardware
>          capabilities discovery, and device to domain attach implementation.
> Patch 6: Implements command and fault queue, and introduces directory cache
>          invalidation sequences.
> Patch 7: Implements paging domain, using highest page-table mode advertised
>          by the hardware. This series enables only 4K mappings; complete support
>          for large page mappings will be introduced in follow-up patch series.
>
> Follow-up patch series, providing large page support and updated walk cache
> management based on the revised specification, and complete ATS/PRI/SVA support,
> will be posted to GitHub [2].
>
> Changes from v7:
> - rebase on v6.10-rc3
> - fix address shift (ppn -> pfn) for queue base register read
> - add invalidation after DDTE update
>
> Best regards,
>  Tomasz Jeznach
>
> [1] link: https://github.com/riscv-non-isa/riscv-iommu
> [2] link: https://github.com/tjeznach/linux
> v7 link:  https://lore.kernel.org/linux-iommu/cover.1717612298.git.tjeznach@rivosinc.com/
> v6 link:  https://lore.kernel.org/linux-iommu/cover.1716578450.git.tjeznach@rivosinc.com/
> v5 link:  https://lore.kernel.org/linux-iommu/cover.1715708679.git.tjeznach@rivosinc.com/
> v4 link:  https://lore.kernel.org/linux-iommu/cover.1714752293.git.tjeznach@rivosinc.com/
> v3 link:  https://lore.kernel.org/linux-iommu/cover.1714494653.git.tjeznach@rivosinc.com/
> v2 link:  https://lore.kernel.org/linux-iommu/cover.1713456597.git.tjeznach@rivosinc.com/
> v1 link:  https://lore.kernel.org/linux-iommu/cover.1689792825.git.tjeznach@rivosinc.com/
>
> Tomasz Jeznach (7):
>   dt-bindings: iommu: riscv: Add bindings for RISC-V IOMMU
>   iommu/riscv: Add RISC-V IOMMU platform device driver
>   iommu/riscv: Add RISC-V IOMMU PCIe device driver
>   iommu/riscv: Enable IOMMU registration and device probe.
>   iommu/riscv: Device directory management.
>   iommu/riscv: Command and fault queue support
>   iommu/riscv: Paging domain support
>
>  .../bindings/iommu/riscv,iommu.yaml           |  147 ++
>  MAINTAINERS                                   |    8 +
>  drivers/iommu/Kconfig                         |    1 +
>  drivers/iommu/Makefile                        |    2 +-
>  drivers/iommu/riscv/Kconfig                   |   20 +
>  drivers/iommu/riscv/Makefile                  |    3 +
>  drivers/iommu/riscv/iommu-bits.h              |  784 ++++++++
>  drivers/iommu/riscv/iommu-pci.c               |  119 ++
>  drivers/iommu/riscv/iommu-platform.c          |   92 +
>  drivers/iommu/riscv/iommu.c                   | 1684 +++++++++++++++++
>  drivers/iommu/riscv/iommu.h                   |   88 +
>  11 files changed, 2947 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>  create mode 100644 drivers/iommu/riscv/Kconfig
>  create mode 100644 drivers/iommu/riscv/Makefile
>  create mode 100644 drivers/iommu/riscv/iommu-bits.h
>  create mode 100644 drivers/iommu/riscv/iommu-pci.c
>  create mode 100644 drivers/iommu/riscv/iommu-platform.c
>  create mode 100644 drivers/iommu/riscv/iommu.c
>  create mode 100644 drivers/iommu/riscv/iommu.h
>
>
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670

This came up in the patchwork meeting this morning because people 
weren't sure if it was for my tree.  I'd been assuming it was for the 
IOMMU tree, from IRC it sounds like Will is OK with that.  So

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case that helps any.  No rush on my end, I just want to make sure I'm 
not dropping the ball.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
