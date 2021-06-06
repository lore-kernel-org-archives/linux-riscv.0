Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1174DC4743E
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:30:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B5F6142D
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 16:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B5F6142D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNZ+U8P8h1JM2LVIVQ8prmB0WIuKRDYMlMIoasOjTIE=; b=1vDo/Dco6dBojs
	Ce9ufKKv9hCClo1h1YrUvNwbgXOtQCkf0Iy3RrYcaO7UOrkQgSrD+fP9K8UedPTdKlVpm+QP+noq8
	1jVtwFKfcpqb0fdac/XmduthB6QTTiQFfNY6wfUkUzChrNKV+YHZkaFC92o3wP+7i/dYc1iwXMjHl
	Vz7Z2B00ukH0CdKWR1TuDAwoaqlVwnRtFAgilodZetRRVx9KjBCa14I495+qYsJDPdyn5ksif4L2N
	NFTYIRwZMwo3T3J/MFbqPZpvInL7Imq8OppgCIvfmJvWXqnC5UMvzeKufkV3kIVTC1bxk/c74MhOl
	ggoBIjjgS1dHQ+AkWBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpveh-000YC7-SM; Sun, 06 Jun 2021 16:29:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpvee-000YBi-US
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 16:29:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so8513711wmq.3
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qxkRqzdPS7sAeenmAuAvXZNGk/e4PdC5sUpAPxYKCMA=;
 b=n4gGZKDBFX45+p0Oca5kJ8IwxlnU0aUbBahQijaeb3j27qEE2IJahLAUPVrStQRjQx
 dbCgI70DMtLse1Z+A8cRbAStEDKVKP0sIsZubxQt6Ui1PLFahD7lZQwp0l82/s9rMYf/
 sQqgxc2oWrAyAyWdmMCBIyURlyTplSYS8R+Vy9OzAn3yba4lsIan869Eefdd2d4556n8
 zWb2+dl0SKmLtwSDBr+DC9P2ieoeKmvFGy9F5feO+oOtbGOlD1RyBFojHSZJyLYdTe7Q
 mdelZj99XyiwcT3twseJY++oUXVzEE7vhFN+vPeTbD8Dl0Lel50cnxhMtP1J/cgIEU4d
 HRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qxkRqzdPS7sAeenmAuAvXZNGk/e4PdC5sUpAPxYKCMA=;
 b=CghmIhBX5rzFZaSSVRDL/s0Qh9bAwb3IXX3benqKGT+7fVxzE+st7JZeBZO5QeCECY
 9K34Tr6cNbFZLHjEyVirs6dt3ebkj3nDLAW8JO3zzkO2+Z6zfZLVyzl+TL+iFfaUrYJ7
 E7JEw/I2NM9u3n1RYndpmGztGogsKi26qDIWDOEvscWWvqaNVsCJhEkSFhmt2SOjZNnQ
 6uFDV89IO5cx4wc1MmrDuK1J2AgZFUYmjhcYrHtz8eRPIP5MsFCj5bAIEEc8utPReE4l
 fZz0CC81ANfgHd4JWyiLLENoPuzHVw0+FfAnj7VjevUiWiHb2xXY+kpLRPAW27mwEVw0
 Lxbw==
X-Gm-Message-State: AOAM531QNisu3ujeNWqvJlVMo2Uic8k17qsuX7yxFk7/JlG1chycuCYg
 +hNr3My0vpvF+wc19MssnmY=
X-Google-Smtp-Source: ABdhPJyrscID/EgtH33p7P2vPcGxNXzPY1ijc8FmSRl2qmAONrX/E6TS55YTH52Ls7/wzKf9m0odbw==
X-Received: by 2002:a1c:6503:: with SMTP id z3mr13027277wmb.72.1622996979205; 
 Sun, 06 Jun 2021 09:29:39 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net.
 [86.58.17.133])
 by smtp.gmail.com with ESMTPSA id g21sm14000384wrb.46.2021.06.06.09.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 09:29:38 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com,
 guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH v2 00/11] riscv: Add DMA_COHERENT support for
 Allwinner D1
Date: Sun, 06 Jun 2021 18:29:37 +0200
Message-ID: <3110420.cQCZQDpDj9@jernej-laptop>
In-Reply-To: <1622970249-50770-1-git-send-email-guoren@kernel.org>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_092941_022983_27881806 
X-CRM114-Status: GOOD (  22.77  )
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

Hi!

Dne nedelja, 06. junij 2021 ob 11:03:55 CEST je guoren@kernel.org napisal(a):
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
> vendors define the custom properties of memory regions in PTE.
> 
> This patchset helps SOC vendors to support their own custom interconnect
> coherent solution with PTE attributes.
> 
> For example, allwinner D1[1] uses T-HEAD C906 as main processor, C906 has
> two modes in MMU:
>  - Compatible mode, the same as the definitions in spec.
>  - Enhanced mode, add custom DMA_COHERENT attribute bits in PTE which
>    not mentioned in spec.
> 
> Allwinner D1 needs the enhanced mode to support the DMA type device with
> non-coherent interconnect in its SOC. C906 uses BITS(63 - 59) as custom
> attribute bits in PTE.
> 
> The patchset contain 4 parts (asid, pgtable, cmo, soc) which have been
> tested on D1:
>  - asid: T-HEAD C906 of D1 contains full asid hw facilities which has no
>    conflict with RISC-V spec, and hope these patches soon could be
>    approved.
>  - pgtable: Using a image-hdr to pass vendor specific information and
>    setup custom PTE attributes in a global struct variable during boot
>    stage. Also it needs define custom protection_map in linux/mm.
>  - cmo: We need deal with dma_sync & icache_sync & __vdso_icache_sync.
>    In this patchset, I just show you how T-HEAD C9xx work, and seems Atish
>    is working for the DMA infrustructure, please let me know the idea.
>  - soc: Add allwinner gmac driver & dts & Kconfig for sunxi test.
> 
> The patchset could work with linux-5.13-rc4, here is the steps for D1:
>  - Download linux-5.13-rc4 and apply the patchset
>  - make ARCH=riscv CROSS_COMPILE=riscv64-linux- defconfig
>  - make ARCH=riscv CROSS_COMPILE=riscv64-linux- Image modules dtbs
>  - mkimage -A riscv -O linux -T kernel -C none -a 0x00200000 -e 0x00200000
> -n Linux -d arch/riscv/boot/Image uImage - Download newest opensbi [2],
> build with [3], and get fw_dynamic.bin - Copy uImage, fw_dynamic.bin,
> allwinner-d1-nezha-kit.dtb into boot partition of TF card.
>  - Plugin the TF card and power on D1.
> 
> Link: https://linux-sunxi.org/D1 [1]
> Link: https://github.com/riscv/opensbi branch:master [2]
> Link:
> https://github.com/riscv/opensbi/blob/master/docs/platform/thead-c9xx.md
> [3]
> 

Some patches are marked with v2 and some V5. It's very confusing. Mark them 
with same version in next revision.

Best regards,
Jernej

> Changes since v1:
>  - Rebase on linux-5.13-rc4
>  - Support defconfig for different PTE attributes
>  - Support C906 icache_sync
>  - Add Allwinner D1 dts & Kconfig & gmac for testing
>  - Add asid optimization for D1 usage
> 
> Guo Ren (10):
>   riscv: asid: Use global mappings for kernel pages
>   riscv: asid: Add ASID-based tlbflushing methods
>   riscv: asid: Optimize tlbflush coding convention
>   riscv: pgtable: Fixup _PAGE_CHG_MASK usage
>   riscv: pgtable: Add custom protection_map init
>   riscv: pgtable: Add DMA_COHERENT with custom PTE attributes
>   riscv: cmo: Add dma-noncoherency support
>   riscv: cmo: Add vendor custom icache sync
>   riscv: soc: Initial DTS for Allwinner D1 NeZha board
>   riscv: soc: Add Allwinner SoC kconfig option
> 
> liush (1):
>   riscv: soc: Allwinner D1 GMAC driver only for temp use
> 
>  arch/riscv/Kconfig                                 |    9 +
>  arch/riscv/Kconfig.socs                            |   12 +
>  arch/riscv/boot/dts/Makefile                       |    1 +
>  arch/riscv/boot/dts/allwinner/Makefile             |    2 +
>  .../boot/dts/allwinner/allwinner-d1-nezha-kit.dts  |   29 +
>  arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi    |  100 +
>  arch/riscv/configs/defconfig                       |    1 +
>  arch/riscv/include/asm/cacheflush.h                |   48 +-
>  arch/riscv/include/asm/mmu_context.h               |    2 +
>  arch/riscv/include/asm/pgtable-64.h                |    8 +-
>  arch/riscv/include/asm/pgtable-bits.h              |   20 +-
>  arch/riscv/include/asm/pgtable.h                   |   44 +-
>  arch/riscv/include/asm/sbi.h                       |   15 +
>  arch/riscv/include/asm/soc.h                       |    1 +
>  arch/riscv/include/asm/tlbflush.h                  |   22 +
>  arch/riscv/include/asm/vendorid_list.h             |    1 +
>  arch/riscv/kernel/sbi.c                            |   19 +
>  arch/riscv/kernel/soc.c                            |   22 +
>  arch/riscv/kernel/vdso/flush_icache.S              |   33 +-
>  arch/riscv/mm/Makefile                             |    1 +
>  arch/riscv/mm/cacheflush.c                         |    3 +-
>  arch/riscv/mm/context.c                            |    2 +-
>  arch/riscv/mm/dma-mapping.c                        |   53 +
>  arch/riscv/mm/init.c                               |   26 +
>  arch/riscv/mm/tlbflush.c                           |   57 +-
>  drivers/net/ethernet/Kconfig                       |    1 +
>  drivers/net/ethernet/Makefile                      |    1 +
>  drivers/net/ethernet/allwinnertmp/Kconfig          |   17 +
>  drivers/net/ethernet/allwinnertmp/Makefile         |    7 +
>  drivers/net/ethernet/allwinnertmp/sunxi-gmac-ops.c |  690 ++++++
>  drivers/net/ethernet/allwinnertmp/sunxi-gmac.c     | 2240
> ++++++++++++++++++++ drivers/net/ethernet/allwinnertmp/sunxi-gmac.h     | 
> 258 +++
>  drivers/net/phy/realtek.c                          |    2 +-
>  mm/mmap.c                                          |    4 +
>  34 files changed, 3714 insertions(+), 37 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
>  create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi create
> mode 100644 arch/riscv/mm/dma-mapping.c
>  create mode 100644 drivers/net/ethernet/allwinnertmp/Kconfig
>  create mode 100644 drivers/net/ethernet/allwinnertmp/Makefile
>  create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac-ops.c
>  create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac.c
>  create mode 100644 drivers/net/ethernet/allwinnertmp/sunxi-gmac.h





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
