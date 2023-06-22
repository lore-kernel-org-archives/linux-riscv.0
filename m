Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55321EB64D7
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 00:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vf5gdIrJCIOzjlvyz36CMiDOT6rSgon7MSD01EF7/fI=; b=49x4J3jDZKOXh1+cD7QR6yb/S8
	sUekYOe6et4sJ/QIL1FRYGCjouJ5Jk8sMDVdFCOETUburrdfbzOVPGcBuRnWDnN1WSmEWo8qCYahX
	ulpnqw247rmUKqkAxcxcpUrCGUDVatOHpzolWrW7H3ksKzsZqECaqKnuDxKLmzsPdzAADFsjo60v+
	YtxtgdINiiIDlYVGq9DEyYtMU3KzFXirxwbEau0Sj+b016PsmTA0Xtl3G4u48LToL6fcWp0BBQ62S
	J/jCyvIm/0Yg2QT9pkurIOnxpOeEEtolNCpLjzSKCGM2/zpyxODXDe79tqB8zI3hrSdyjV/yeir6B
	lUbudt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC7tO-00G7Si-1f;
	Thu, 22 Jun 2023 00:09:42 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC7tK-00G7Ra-2a
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 00:09:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-54fba092ef5so5156060a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 17:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687392576; x=1689984576;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPCjWQuh0tMubZzzG3kZbKYTL4R1/Hyq1qgdTGl4eLI=;
        b=MJFZFMsHmr01OG2VNsbcorKDHR/vf8xMKy5enKEXfwqs7HCBtGpP7Nc7/h079s754A
         /qudvs/X1buT/gSM133Ua1jBrcqB1/QIh3I8CxhYIU4fN1+WQGl8m/6GGAdVu+NBd82e
         s1ZxoS+R9OpUPRCoxLPF/80e9K3x8AqYqzWtSr9s3nHpklaLwzL5iM9GhOBBlyox4TBl
         qJu1aHiE4E8Sy1Td1qsTlbz7ib+pw3BZbZ6ZdPg/W1TRNAhYuFanVGwQjICxj4GhlBGu
         pCWvy2TYBojkD6FOvZYMUzUnThgcUHfDhsk4miI0CTBr6OQMmLRHF54+PxIGyP5TMaE9
         4MxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687392576; x=1689984576;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPCjWQuh0tMubZzzG3kZbKYTL4R1/Hyq1qgdTGl4eLI=;
        b=j/lB0HKWMO9ZFhS6+ZwXmCgAyWThc/qf1eb5xfa/rSlIUoSuCNrzC5FP8ySM6xEpZk
         W+6t2dsX/W4ihQvZGBNdU9NZrqDtrLwsLwJF97N+BtN2OnOct/2JCvkhYPnJS1fypwFN
         /gIqZRl4OnTWxP/hY0Z6tqOsCbyt8odPFv8ULS6pXxvZbul+EJNSe7WX7SVnF/0Ur0ZA
         UdUlo8JR5sUrbSMMXBSkxGdt6F3z+M2LnqfDTVEdM7kaxfdo8V2ft+Q/SKz3oyVIpLC/
         okRddLsjIBwYeWBInBaOd6E4DigSW5+mA+w9KZxMFBzscTZQyly1g28B6t/pOpjgx52c
         4SUQ==
X-Gm-Message-State: AC+VfDxSbyEBHkhGdYVZkzROZuo1hX1486remxpgDPS4aQckgGGiB4HG
	UUla7AbLbJexlnYKAls4SyvLQw==
X-Google-Smtp-Source: ACHHUZ4Btzr1xeO/iX9cHkLZZjSPO3a2rNBzXJNf8ixnyKeGhNl8zc6BsoRgI7UHfigPu4sBdmhRdQ==
X-Received: by 2002:a05:6a20:7290:b0:120:1baf:e56e with SMTP id o16-20020a056a20729000b001201bafe56emr14880065pzk.19.1687392576167;
        Wed, 21 Jun 2023 17:09:36 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n11-20020a170902d2cb00b001ab01598f40sm4037924plc.173.2023.06.21.17.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 17:09:35 -0700 (PDT)
Date: Wed, 21 Jun 2023 17:09:35 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jun 2023 17:08:56 PDT (-0700)
Subject: Re: [PATCH v3 0/5] riscv: Introduce KASLR
In-Reply-To: <20230606123242.20804-1-alexghiti@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-665efaa0-223e-411c-9c96-4ce1fba5396d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_170938_864192_5DD7F9D3 
X-CRM114-Status: GOOD (  21.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 06 Jun 2023 05:32:37 PDT (-0700), alexghiti@rivosinc.com wrote:
> The following KASLR implementation allows to randomize the kernel mapping:
>
> - virtually: we expect the bootloader to provide a seed in the device-tree
> - physically: only implemented in the EFI stub, it relies on the firmware to
>   provide a seed using EFI_RNG_PROTOCOL. arm64 has a similar implementation
>   hence the patch 3 factorizes KASLR related functions for riscv to take
>   advantage.
>
> The new virtual kernel location is limited by the early page table that only
> has one PUD and with the PMD alignment constraint, the kernel can only take
> < 512 positions.
>
> base-commit-tag: v6.4-rc2
>
> Changes in v3:
>   * Rebase on top of 6.4-rc2
>   * Make RANDOMIZE_BASE depend on 64bit
>   * Fix efi_icache_sync and efi_get_kimg_min_align which were undefined
>     in x86 (and certainly other archs)
>   * Add patch 4 to fix warning on rv32
>
> Changes in v2:
>   * Rebase on top of 6.3-rc1
>   * Add a riscv cache sync after memcpying the kernel
>   * Add kaslr_offset implementation for KCOV
>   * Add forward declaration to quiet LLVM
>
> Alexandre Ghiti (5):
>   riscv: Introduce virtual kernel mapping KASLR
>   riscv: Dump out kernel offset information on panic
>   arm64: libstub: Move KASLR handling functions to efi-stub-helper.c
>   libstub: Fix compilation warning for rv32
>   riscv: libstub: Implement KASLR by using generic functions
>
>  arch/arm64/include/asm/efi.h                  |   4 +
>  arch/riscv/Kconfig                            |  19 +++
>  arch/riscv/include/asm/efi.h                  |   4 +
>  arch/riscv/include/asm/page.h                 |   3 +
>  arch/riscv/kernel/image-vars.h                |   1 +
>  arch/riscv/kernel/pi/Makefile                 |   2 +-
>  arch/riscv/kernel/pi/cmdline_early.c          |  13 ++
>  arch/riscv/kernel/pi/fdt_early.c              |  30 ++++
>  arch/riscv/kernel/setup.c                     |  25 +++
>  arch/riscv/mm/init.c                          |  36 ++++-
>  drivers/firmware/efi/libstub/arm64-stub.c     | 112 +------------
>  drivers/firmware/efi/libstub/arm64.c          |   5 +
>  .../firmware/efi/libstub/efi-stub-helper.c    | 151 ++++++++++++++++++
>  drivers/firmware/efi/libstub/efistub.h        |  18 +++
>  drivers/firmware/efi/libstub/riscv-stub.c     |  28 ++--
>  drivers/firmware/efi/libstub/riscv.c          |   5 +
>  16 files changed, 332 insertions(+), 124 deletions(-)
>  create mode 100644 arch/riscv/kernel/pi/fdt_early.c

I'm marking this one as changes requested as well as LKP is pointing at 
some build failures.  It also touches libstub so I'd really prefer an 
Ack, but folks might not be looking with the build issues.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
