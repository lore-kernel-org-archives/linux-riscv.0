Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE57EC4332D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:40:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1077964FF4
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1077964FF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=r7CttfLg/tz6t0XoroqupQkRrPG4rCnfd4dKyjfKkw0=; b=qE0h9LOm5tDru+QvyZI5vqJeA
	Fg0X6+Fe9tkh6ZC45FLKOeCo863bvqQMQA9YPUEgwHr1ldBtwBjxAnx+XhHN7c+mbx0Qvo0F1dZpf
	aSLVuB/opq2FudJCU6uaFy68ljelr5yjRySVrEoqGsHYLMxh9gZ96m1Sw5vrPothKifBJpy3IawUz
	u7BnMOySOp/PutvS88usUiEeUuUkxHWmMyRdQQdDpYofny+IgntaX3QV8uyduWCke4u46c2iSGFll
	qm4QSeLzjZUxsSo5clqbh4GBd9EBEaqq2hHo1SAgI8Y+7owZIz9mzJfsS4YRBgYT79K8cyVLTxgHB
	0JUS92VXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJqdg-0060hj-SL; Wed, 10 Mar 2021 04:40:05 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJqcy-0060az-Lf
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 04:39:28 +0000
Received: by mail-pf1-x42f.google.com with SMTP id l7so11225526pfd.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 20:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ITTAq8qB7GUAYX2Mhi5FzjMq+yFZ01Ayu3/V3mZVrR4=;
 b=OxRF7jTLGeHot1pXkphmgbYk/JenRD/vXaGxyvUV6inrqg4j0Yja+LRRmtugRDQOr3
 1iUZu3vbZPHFnIj1cMEYYc7ZlozNJC1xXBkQauBp0YXWUgSQ2JO7gYk7ylhFyyRd5HBs
 MGHCbWCANbMZFnA/iJPDYmRhYtJnaqyxGXy1b51gzkovTzlNrugnC1YjR9claenhomnc
 UWFp/kTvjjfDCtlLYCmpDpOFnNEAZKScIWFMAlk31EMYbzNBsOs2pWGfLsBL/4UI4tfv
 7a9eDpbAOSp+nMdJBFsuFbJddw2MEHFzW4FQa1p9LnaVS8daCKHS3QI6xYghY8cx9vN6
 AdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ITTAq8qB7GUAYX2Mhi5FzjMq+yFZ01Ayu3/V3mZVrR4=;
 b=PB8nMwKUnzDQqHpTbeYH/dOMZ/NGZ3XxSqI4DeQdOBmXlLfTaaKfym6mkn91XrVXk+
 iQ4wix7D2M1OO8wudHmyAjSUinEI1g3IwC+EA4ML+cMuBs7wTRgDZxo0CDvv5HfHailS
 bj/45CtWItmmLK5NPLsfuRCMnEzLpah/HeFE3DjFvZBQrH7+CD7bd/mxlAKNoGJr34aG
 AH2iD6CV6rEfaJzqPduGJV2x4TCzTkFUyoHo1h59ox56iRhokZXiGXupMFEpkSZUF8Ho
 SKs+Si/wEkjkdOtBM/SFs5TmQ51gwl5Qae3LHXaIpTcBabL/mOajDO+0oUuyMUxjrPfV
 ea3w==
X-Gm-Message-State: AOAM532mfns/TlOzcsMQm8f6eqOc4Nz0nMkfyE4gqAZZ2jr5Utiz6JM6
 G21q0YA3JJrSzFBa0t4F0rUyzPpk/KIL5w==
X-Google-Smtp-Source: ABdhPJyGTYvo7TLqpmHH1cBxQQEZa0fXGLm1eqDJ8E8TcoWfQQ7UYiIqq1bUtofOEUJwc7Hk8ErBUQ==
X-Received: by 2002:a62:78d4:0:b029:1f1:595b:dfdf with SMTP id
 t203-20020a6278d40000b02901f1595bdfdfmr1122840pfc.81.1615351158979; 
 Tue, 09 Mar 2021 20:39:18 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y15sm16953995pgi.31.2021.03.09.20.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 20:39:18 -0800 (PST)
Date: Tue, 09 Mar 2021 20:39:18 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 20:33:49 PST (-0800)
Subject: Re: [RFC patch 0/4] riscv: introduce alternative mechanism to apply
 errata patches
In-Reply-To: <1615175897-23509-1-git-send-email-vincent.chen@sifive.com>
CC: linux-riscv@lists.infradead.org, Frank.Zhao@starfivetech.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 guoren@kernel.org, alankao@andestech.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-75c82ab1-f0f5-4738-b020-364d1a1d295f@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_043926_455500_9578C3A7 
X-CRM114-Status: GOOD (  32.17  )
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

On Sun, 07 Mar 2021 19:58:13 PST (-0800), vincent.chen@sifive.com wrote:
> With the emergence of more and more RISC-V CPUs, the request for how to
> upstream the vendor errata patch may gradually appear. In order to resolve
> this issue, this patch introduces the alternative mechanism from ARM64 and
> x86 to enable the kernel to patch code at runtime according to the
> manufacturer information of the running CPU. The main purpose of this patch
> set is to propose a framework to apply vendor's errata solutions. Based on
> this framework, it can be ensured that the errata only applies to the
> specified CPU cores. Other CPU cores do not be affected. Therefore, some
> complicated scenarios are unsupported in this patch set, such as patching
> code to the kernel module, doing relocation in patching code, and
> heterogeneous CPU topology.
>
> In the "alternative" scheme, Users could use the macro ALTERNATIVE to apply
> an errata to the existing code flow. In the macro ALTERNATIVE, users need
> to specify the manufacturer information (vendor id, arch id, and implement
> id) for this errata. Therefore, kernel will know this errata is suitable
> for which CPU core. During the booting procedure, kernel will select the
> errata required by the CPU core and then patch it. It means that the kernel
> only applies the errata to the specified CPU core. In this case, the
> vendor's errata does not affect each other at runtime. The above patching
> procedure only occurs during the booting phase, so we only take the
> overhead of the "alternative" mechanism once.
>
> This "alternative" mechanism is enabled by default to ensure that all
> required errata will be applied. However, users can disable this feature by
> the Kconfig "CONFIG_RISCV_ERRATA_ALTERNATIVE".

This all generally seems OK to me, though I have a few comments in the actual 
patches.

>
> The last patch is to apply the SiFive CIP-453 errata by this "alternative"
> scheme. Therefore, It can be regarded as an example. According to the
> results of running this image on the QEMU virt platform, kernel does not
> apply this errata at run-time because the CPU manufacturer information
> does not match the specified SiFive CPU core. Therefore, this errata does
> not affect any CPU core except for the specified SiFive cores.

Looking at the documentation for that I also saw CIP-1200.  That one seems way 
scarier, and also probably a better driver for building an errata framework as 
it has more than one caller.  Is that in this chip?  It's in a document just 
titled "Errata_FU740-C000_20210205".

>
> Vincent Chen (4):
>   riscv: Add 3 SBI wrapper functions to get cpu manufacturer information
>   riscv: Get CPU manufacturer information
>   riscv: Introduce alternative mechanism to apply errata solution
>   riscv: sifive: apply errata "cip-453" patch
>
>  arch/riscv/Kconfig                          |   1 +
>  arch/riscv/Kconfig.erratas                  |  32 ++++++++
>  arch/riscv/Kconfig.socs                     |   1 +
>  arch/riscv/Makefile                         |   1 +
>  arch/riscv/errata/Makefile                  |   2 +
>  arch/riscv/errata/alternative.c             |  69 +++++++++++++++++
>  arch/riscv/errata/sifive/Makefile           |   2 +
>  arch/riscv/errata/sifive/errata.c           |  56 ++++++++++++++
>  arch/riscv/errata/sifive/errata_cip_453.S   |  34 +++++++++
>  arch/riscv/include/asm/alternative-macros.h | 110 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/alternative.h        |  44 +++++++++++
>  arch/riscv/include/asm/asm.h                |   1 +
>  arch/riscv/include/asm/csr.h                |   3 +
>  arch/riscv/include/asm/errata_list.h        |   9 +++
>  arch/riscv/include/asm/hwcap.h              |   6 ++
>  arch/riscv/include/asm/processor.h          |   2 +
>  arch/riscv/include/asm/sbi.h                |   3 +
>  arch/riscv/include/asm/sections.h           |   2 +
>  arch/riscv/include/asm/soc.h                |   1 +
>  arch/riscv/include/asm/vendorid_list.h      |   6 ++
>  arch/riscv/kernel/cpufeature.c              |  17 +++++
>  arch/riscv/kernel/entry.S                   |  12 ++-
>  arch/riscv/kernel/sbi.c                     |  15 ++++
>  arch/riscv/kernel/setup.c                   |   2 +
>  arch/riscv/kernel/smpboot.c                 |   4 +
>  arch/riscv/kernel/soc.c                     |   1 +
>  arch/riscv/kernel/vmlinux.lds.S             |  14 ++++
>  27 files changed, 448 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/Kconfig.erratas
>  create mode 100644 arch/riscv/errata/Makefile
>  create mode 100644 arch/riscv/errata/alternative.c
>  create mode 100644 arch/riscv/errata/sifive/Makefile
>  create mode 100644 arch/riscv/errata/sifive/errata.c
>  create mode 100644 arch/riscv/errata/sifive/errata_cip_453.S
>  create mode 100644 arch/riscv/include/asm/alternative-macros.h
>  create mode 100644 arch/riscv/include/asm/alternative.h
>  create mode 100644 arch/riscv/include/asm/errata_list.h
>  create mode 100644 arch/riscv/include/asm/vendorid_list.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
