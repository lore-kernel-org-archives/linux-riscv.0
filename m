Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDD0C19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 16:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=MZNSnzd1oc8osTUBLN0/mZmMgwgS1Daw03vtDbqjLAU=; b=HEY9VUpHLOstuU7AZQXFJKXv/N
	Rzk0vB17EIOeKKD0KJlm7hx4zC6lwas24Shn7mFyca5q/xGyE9T9k04Any0/p2HKgzTAuROq1keWA
	FYXT/5rXXk/xUplWoxm6u/XKDAW2ysXdgIpQ51f4uDG5DYrCj+T8aSov4dTQ3uVanXKA2UrD6xIiJ
	otWn41yESiG84L4aaKlt6/5jHUSPnEw4bEY7kxTN+BOtiyLMlUJ4+HM8t7T7V+XlcoqigoT3oFU7t
	d/3HQkJ1hmRxuo0HWVwo1weogpYId1y5o8bbE8qLZq+Vl8K8IC8VvY0rG8z2o9zU2wv1ED0xHRVzl
	9HMOrigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMAry-00EsF3-1e; Thu, 11 Aug 2022 16:17:14 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMArr-00Es9n-Db
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 16:17:13 +0000
Received: by mail-pg1-x531.google.com with SMTP id 202so10747936pgc.8
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 09:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=LqFU2f8KAu+do04+BY0xxELDBXMNilTFkQt1GBEIGfQ=;
        b=M5SXggdeqf0Sn+7PKP3FO4FHCkolQIZytuNY0IW7NgfUhG79K4Od/gB7Szl7KHQL+r
         kTCRgbFg95uEt8+VQKU8ifpiY1ZIAky3r70c5WTg3HLWYimywWKGCCn+A95AuGspzuQV
         qfsifv+llmMzI8thj3td00cNGT+SGje0tl2Se1dXm4CZ/kReQmcG2nRuuemdxi12tSSH
         HDsYkirsnxMdijIA8hr0QzDwt9nGwC1qGh65zuTzvnZc0WA2A/yLtHp1dxnevra9o0zC
         16k0kVcmgrPXcwm/MTIArxDUvbO+uBI7nZqJ+9LljkiQGnfz15iK3YHAuivCE3i1BAe1
         H1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=LqFU2f8KAu+do04+BY0xxELDBXMNilTFkQt1GBEIGfQ=;
        b=19ZtQ9PezxnwBkzOtDHfeg5WbU8XwPDviVORoXyCVIezdgcOdHKYS0dhUoZwdBWvQj
         mTbP6c8wWDpXFVZSb5x5xteKtIGOaCbrQKtmw4uuEqySpyWtT0wGQ74honk2q9gcjkxq
         ewHHPB6Xxos3K1qE1Sq+1x70hxYG2i9lPZdjTepK0+9rzl93VQIzrUbWRUO9rKaSPama
         rRjc81dRgmP4s4BIqbAkkKLWiDX2AzMvXmSiDk1yFJrPXQhIJUH7vLVTZQzTmPA9FvlD
         v17nhw+L8F7M85SetShCaY83vwxQW9T0cvWnHELpewlmG13MWx6hruEkiinVEw5bz4HN
         TC6Q==
X-Gm-Message-State: ACgBeo3y/x20JDDaZo2q08OcF97Yqh1gRv/pRHyizGIlrW+WPt0wXJT4
	uasCda/n6rcrnrSdJNNqvLNmSg==
X-Google-Smtp-Source: AA6agR4xlbNk9dH0j5rGK3Ka8Aw9IWX4A2wg8u1+lijEpKLCaXufEaSJjqRMp8RD42B6JjtYpF9QvQ==
X-Received: by 2002:a05:6a00:b41:b0:52f:59dc:75 with SMTP id p1-20020a056a000b4100b0052f59dc0075mr40627pfo.33.1660234624258;
        Thu, 11 Aug 2022 09:17:04 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id d14-20020a170902654e00b0016ed715d244sm15093049pln.300.2022.08.11.09.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 09:17:03 -0700 (PDT)
Date: Thu, 11 Aug 2022 09:17:03 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 09:12:03 PDT (-0700)
Subject: Re: [PATCH V6 0/6] RISC-V fixups to work with crash tool
In-Reply-To: <20220811074150.3020189-1-xianting.tian@linux.alibaba.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  anup@brainfault.org, heiko@sntech.de, guoren@kernel.org, mick@ics.forth.gr,
  alexandre.ghiti@canonical.com, bhe@redhat.com, vgoyal@redhat.com, dyoung@redhat.com, corbet@lwn.net,
  Conor.Dooley@microchip.com, kexec@lists.infradead.org, linux-doc@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, crash-utility@redhat.com,
  heinrich.schuchardt@canonical.com, k-hagio-ab@nec.com, hschauhan@nulltrace.org, yixun.lan@gmail.com,
  xianting.tian@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: xianting.tian@linux.alibaba.com
Message-ID: <mhng-f5fdaa37-e99a-4214-a297-ec81f0fed0c1@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_091711_493990_503BF620 
X-CRM114-Status: GOOD (  26.55  )
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

On Thu, 11 Aug 2022 00:41:44 PDT (-0700), xianting.tian@linux.alibaba.com wrote:
> I ever sent the patch 1 in the link:
> https://patchwork.kernel.org/project/linux-riscv/patch/20220708073150.352830-3-xianting.tian@linux.alibaba.com/
> And patch 2,3 in the link:
> https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-2-xianting.tian@linux.alibaba.com/
> https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-3-xianting.tian@linux.alibaba.com/
>
> This patch set just put these patches together, and with three new patch 4, 5, 6.
> these six patches are the fixups for machine_kexec, kernel mode PC for vmcore
> and improvements for vmcoreinfo, memory layout dump and fixup schedule out issue
> in machine_crash_shutdown().
>
> The main changes in the six patchs as below,
> Patch 1: Fixup use of smp_processor_id() in preemptible context, to cleanup
>          the console prints.
> Patch 2: Fixup to get correct kernel mode PC for kernel mode regs for vmcore.
> Patch 3: Fixup schedule out issue in machine_crash_shutdown()
> Patch 4: Add modules to virtual kernel memory layout dump.
> Patch 5: Add VM layout, va bits, ram base to vmcoreinfo, which can simplify
>          the development of crash tool as ARM64 already did
>          (arch/arm64/kernel/crash_core.c).
> Patch 6: Updates vmcoreinfo.rst for vmcoreinfo export for RISCV64.
>
> With these six patches(patch 2 is must), crash tool can work well to analyze
> a vmcore. The patches for crash tool for RISCV64 is in the link:
> https://lore.kernel.org/linux-riscv/20220801043040.2003264-1-xianting.tian@linux.alibaba.com/
>
> ------
> Changes v1 -> v2:
>   1, remove the patch "Add a fast call path of crash_kexec()" from this series
>      of patches, as it already applied to riscv git.
>      https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=3f1901110a89b0e2e13adb2ac8d1a7102879ea98
>   2, add 'Reviewed-by' based on the comments of v1.
> Changes v2 -> v3:
>   use "riscv" instead of "riscv64" in patch 5 subject line.
> Changes v3 -> v4:
>   use "riscv" instead of "riscv64" in the summary of patch 5 subject line.
> Changes v4 -> v5:
>   add a new patch "RISC-V: Fixup schedule out issue in machine_crash_shutdown()"
> Changes v5 -> v6:
>   1, move "fixup" patches to the start of the patch set.
>   2, change patch 1, 2, 6's subject to make it tell more what it's about.
>   3, add Fixes for patch 3.
>   4, adjuest the changes format for patch 6.
>
>
> Xianting Tian (6):
>   RISC-V: kexec: Fixup use of smp_processor_id() in preemptible context
>   RISC-V: Fixup get incorrect user mode PC for kernel mode regs
>   RISC-V: Fixup schedule out issue in machine_crash_shutdown()
>   RISC-V: Add modules to virtual kernel memory layout dump
>   RISC-V: Add arch_crash_save_vmcoreinfo support
>   Documentation: kdump: describe VMCOREINFO export for RISCV64
>
>  .../admin-guide/kdump/vmcoreinfo.rst          | 31 +++++++++++++++++++
>  arch/riscv/kernel/Makefile                    |  1 +
>  arch/riscv/kernel/crash_core.c                | 29 +++++++++++++++++
>  arch/riscv/kernel/crash_save_regs.S           |  2 +-
>  arch/riscv/kernel/machine_kexec.c             | 28 ++++++++++++++---
>  arch/riscv/mm/init.c                          |  4 +++
>  6 files changed, 89 insertions(+), 6 deletions(-)
>  create mode 100644 arch/riscv/kernel/crash_core.c

Thank.  I've taken the first 4 onto for-next, which is still targeted 
for 5.20, as they're fixes.  I'm not opposed to taking the documentation 
patch for this cycle as well, it just needs some going-over as the 
wording looks very odd (or at least it does to me right now, maybe I'm 
just still half asleep).  Patch 5 is a new feature, and given that it's 
being spun during the merge window it's too late.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
