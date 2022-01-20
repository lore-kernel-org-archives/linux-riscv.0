Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B382CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 04:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2q4cEnheFyb0vQ/mHskl/MFL9V+03Pl33jo1rPeQs/o=; b=AiBvnjutpVR2oOZGPbHr1Kw2LF
	rT8UMETOPBAe4oUcpZsDSvAAqGpuICBzu9akfNuq6Tpcj5haZ3hG9cDaM0anTVVMIZ8lVysNMBENQ
	IG4s2jWFCMDjjg6IctIYI5wps1dBh0SQEF42verU+vZt8xY/9d25G2W++VV2w0XvPxpN3Rxm6VHo5
	E10IGxlWhMpCmZpLOb1rwa4rW27fWCyLYLkCBBgLv00lW18uDUDDg4OCnPsvgXOueiXWAztekri71
	hf+C9I8M5zvV0QpR8bditf4RdRBm647xLd4NhPAj7r2Uu4/uUauojj1fE0cxe79QicoAyB6T7Ao9T
	HW4S8TiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAOts-008dba-9c; Thu, 20 Jan 2022 04:18:16 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAOtp-008daK-5d
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 04:18:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id n11so4158636plf.4
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 20:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iT9AIdLj55ev5yKtI8ieivVAM11HecgPIKI9gy4uM7k=;
 b=DjFVfnxNhRsSwTU9uitv8nBpFpyZoEPgLUZGOan4mUiDJt5pyEAxtehajlOQCbWuf+
 /Wjdh7DhgpSJaOBKQcAeHHxixW7eFCUvdDKg6lUNhXHDmqVHrM+vGbW1YNCk/pnL2Fb+
 /l4sOvXHcX9kI7Wg+EfiCvfAtA8uMqltpslD66ck7p8Tj+0tG0/m2Jm3lZq4SLynRqd9
 zGEBqh8D4eyb1NsEzrJm1GJm+NJ0PoLGMh2MRSomAS3e/GfM40ehvEFp0lqMAHB9Co7V
 HjCJ2aVf4gQRo6MRUM00cNV8hkz/QJ039gPSXx1OA41uYuRcqVgacGfEEJJaFfPWgjqK
 Ez4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iT9AIdLj55ev5yKtI8ieivVAM11HecgPIKI9gy4uM7k=;
 b=vIwUO8uIm9bEmpcBwzC1AyxnjB/q+Dy5LEZI8Ams8yJeBfdqp1CA+V1g/ejj0MmA4F
 Y4lvdgcbKW0G7c7XuWDcI0elD0vIl3cFw2VfBmhL0cHUcbAfhttFXULSWCiLW6oQG8hn
 mvQJp+mEeZlpHvNIgWrHmJvdpvrKaE9ESKABtoTG3H+8laBayOjzCcSJvHo6OmVj97oZ
 bXRUw/PD0mnOW6KFMLX22ZhcTkspxUnT+lPXMvRTqrvIuVtAX3KVKWazffz+lLStYF0X
 yhV4394bYKPNHYruRgxg0QS+NdRHRcJ2ubtuDqabvsKnK1HYHgS1HTC1CbRI4hUDafQZ
 l3hw==
X-Gm-Message-State: AOAM5325gtb2xbzsvzga+aB3gGzbgwFKs+cnsobW5vSVANoNWI/pVTcc
 OVZQV3c9te77AYB47ITcn9dmqQ==
X-Google-Smtp-Source: ABdhPJwAFUf4SqZ74zUYUmkHi3E/lwX3x/hS+sVaKeSaIBNtbyJOTOIUjLud5tljRhqKM56Yf7lGNA==
X-Received: by 2002:a17:902:704c:b0:14a:fd51:3b5d with SMTP id
 h12-20020a170902704c00b0014afd513b5dmr3945207plt.172.1642652291221; 
 Wed, 19 Jan 2022 20:18:11 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id t7sm1081924pfj.138.2022.01.19.20.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 20:18:10 -0800 (PST)
Date: Wed, 19 Jan 2022 20:18:10 -0800 (PST)
X-Google-Original-Date: Wed, 19 Jan 2022 20:13:10 PST (-0800)
Subject: Re: [PATCH v3 00/13] Introduce sv48 support without relocatable kernel
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
CC: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 zong.li@sifive.com, anup@brainfault.org, Atish.Patra@rivosinc.com,
 Christoph Hellwig <hch@lst.de>, 
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, ardb@kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, keescook@chromium.org, guoren@linux.alibaba.com,
 heinrich.schuchardt@canonical.com, mchitale@ventanamicro.com,
 panqinglin2020@iscas.ac.cn, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org, alexandre.ghiti@canonical.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexandre.ghiti@canonical.com
Message-ID: <mhng-cdec292e-aea2-4b76-8853-b8465521e94f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_201813_294968_E3D4D17B 
X-CRM114-Status: GOOD (  31.19  )
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

On Mon, 06 Dec 2021 02:46:44 PST (-0800), alexandre.ghiti@canonical.com wrote:
> * Please note notable changes in memory layouts and kasan population *
>
> This patchset allows to have a single kernel for sv39 and sv48 without
> being relocatable.
>
> The idea comes from Arnd Bergmann who suggested to do the same as x86,
> that is mapping the kernel to the end of the address space, which allows
> the kernel to be linked at the same address for both sv39 and sv48 and
> then does not require to be relocated at runtime.
>
> This implements sv48 support at runtime. The kernel will try to
> boot with 4-level page table and will fallback to 3-level if the HW does not
> support it. Folding the 4th level into a 3-level page table has almost no
> cost at runtime.
>
> Note that kasan region had to be moved to the end of the address space
> since its location must be known at compile-time and then be valid for
> both sv39 and sv48 (and sv57 that is coming).
>
> Tested on:
>   - qemu rv64 sv39: OK
>   - qemu rv64 sv48: OK
>   - qemu rv64 sv39 + kasan: OK
>   - qemu rv64 sv48 + kasan: OK
>   - qemu rv32: OK
>
> Changes in v3:
>   - Fix SZ_1T, thanks to Atish
>   - Fix warning create_pud_mapping, thanks to Atish
>   - Fix k210 nommu build, thanks to Atish
>   - Fix wrong rebase as noted by Samuel
>   - * Downgrade to sv39 is only possible if !KASAN (see commit changelog) *
>   - * Move KASAN next to the kernel: virtual layouts changed and kasan population *
>
> Changes in v2:
>   - Rebase onto for-next
>   - Fix KASAN
>   - Fix stack canary
>   - Get completely rid of MAXPHYSMEM configs
>   - Add documentation
>
> Alexandre Ghiti (13):
>   riscv: Move KASAN mapping next to the kernel mapping
>   riscv: Split early kasan mapping to prepare sv48 introduction
>   riscv: Introduce functions to switch pt_ops
>   riscv: Allow to dynamically define VA_BITS
>   riscv: Get rid of MAXPHYSMEM configs
>   asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
>   riscv: Implement sv48 support
>   riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
>   riscv: Explicit comment about user virtual address space size
>   riscv: Improve virtual kernel memory layout dump
>   Documentation: riscv: Add sv48 description to VM layout
>   riscv: Initialize thread pointer before calling C functions
>   riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
>
>  Documentation/riscv/vm-layout.rst             |  48 ++-
>  arch/riscv/Kconfig                            |  37 +-
>  arch/riscv/configs/nommu_k210_defconfig       |   1 -
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   1 -
>  arch/riscv/configs/nommu_virt_defconfig       |   1 -
>  arch/riscv/include/asm/csr.h                  |   3 +-
>  arch/riscv/include/asm/fixmap.h               |   1
>  arch/riscv/include/asm/kasan.h                |  11 +-
>  arch/riscv/include/asm/page.h                 |  20 +-
>  arch/riscv/include/asm/pgalloc.h              |  40 ++
>  arch/riscv/include/asm/pgtable-64.h           | 108 ++++-
>  arch/riscv/include/asm/pgtable.h              |  47 +-
>  arch/riscv/include/asm/sparsemem.h            |   6 +-
>  arch/riscv/kernel/cpu.c                       |  23 +-
>  arch/riscv/kernel/head.S                      |   4 +-
>  arch/riscv/mm/context.c                       |   4 +-
>  arch/riscv/mm/init.c                          | 408 ++++++++++++++----
>  arch/riscv/mm/kasan_init.c                    | 250 ++++++++---
>  drivers/firmware/efi/libstub/efi-stub.c       |   2
>  drivers/pci/controller/pci-xgene.c            |   2 +-
>  include/asm-generic/pgalloc.h                 |  24 +-
>  include/linux/sizes.h                         |   1
>  22 files changed, 833 insertions(+), 209 deletions(-)

Sorry this took a while.  This is on for-next, with a bit of juggling: a 
handful of trivial fixes for configs that were failing to build/boot and 
some merge issues.  I also pulled out that MAXPHYSMEM fix to the top, so 
it'd be easier to backport.  This is bigger than something I'd normally like to
take late in the cycle, but given there's a lot of cleanups, likely some fixes,
and it looks like folks have been testing this I'm just going to go with it.

Let me know if there's any issues with the merge, it was a bit hairy.  
Probably best to just send along a fixup patch at this point.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
