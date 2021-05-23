Return-Path: <SRS0=hCbr=KS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05031C47081
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 05:08:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DD30600D3
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 05:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DD30600D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=MUoB3V6gtRdWmHhA5YB2sWK4weLAxKlKuNQReTnoLMA=; b=PO8zwLrbKD84bO8nCmN60CWAaf
	xYV8ui4gmbGos+CPxyPN30elt7soAtwkKLkIxvhHNAq/gu+nyv/P+tNF2Uh8jy2RFpefB3TeTvNaR
	MiHwnRVOQbo7ZbL/7sC3WuGtLDCFsWW5ZY8hO+kBQBAZwEpA7O3qxyHk9JR2O3E65LJeNcXTmlnI3
	FEykR3IM3S6iHNkQio+557/2+x87FeaGe13Ik7ihNTYZzvtcXgUyqdIjKfdoFv3RfneNsXC179YD6
	mCAmQc/bUHaCbQgrNhSFUYeY0KRnICN/ZWPjGEtmmtKk+QKLeYPJFMa2pB8mAVXxCmj9z8fMymDRZ
	Lwlq9Irg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkgL6-003mTt-7R; Sun, 23 May 2021 05:07:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkgL4-003mTh-Jd
 for linux-riscv@desiato.infradead.org; Sun, 23 May 2021 05:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=/qQb/S90UvV48ljwdF8CQVkKM31YJ8ZeoSQFCFOdl1E=; b=bqq6Ps/ztz5+lGU+iT7pmJ6fWN
 yCfrFRbLT7Qz9/ymMyMrF/MW53K8TVr/vdJG8NY4wh2FKBChiirveTNJNjzVCd25UkspmtUIX1yDU
 XneSpZz8++iAAOQ8jKTNPVqd6MFxUy0INB3zLnutwY5inrn5dvd+wQ/XQ79cboxaPhWj2ropyBn8t
 9NaAlFgPNQzDhzLq7FiJNMbSXzUrZ35BhtlagvDq29HcyAKq1LNl0gk1DQH+xw/J+QGPdxcMsCLx1
 232gnC+6LoT1YiWdO++wIpMoo/720Jhgq/agISZx8fS/6kibP1IfulIHhhKpc6NftVdSPnV6vlM/2
 pKc3IumQ==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkgL0-000Jug-KH
 for linux-riscv@lists.infradead.org; Sun, 23 May 2021 05:07:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id s4so11428615plg.12
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 22:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/qQb/S90UvV48ljwdF8CQVkKM31YJ8ZeoSQFCFOdl1E=;
 b=xP1BfJ+e3CzmSr2vcUbbyXe9+W51bcA+tK4/3BOZeqmwK/UAZCCHyLoW6pVENv5roY
 Tr5nMJnzEcFbfo3N6VUFOgxzKID/JdrYmrROZdtKkQurXDDtGPV9kzQdkZ1uZicfcWSu
 yq3/NCvA4i1bvCINw6pV0v/U42ciJc3prkFWf+H26AJDWt+cnM7ZlOuWAhLLebRnR+FH
 e6h9BmqUmuADtHeZdW+IVGWVdAxQRb0c2EC/61iHx+p+x4MuRf1XcxNu/hJynjrycYW2
 5NUdMDLdIonN8K/gxLMAZbArscJRjDkPkBvKHFZ5yCqpTpEp687vPB1EMt6UxOKOJRT4
 HHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/qQb/S90UvV48ljwdF8CQVkKM31YJ8ZeoSQFCFOdl1E=;
 b=C6aD0A07VK5G1Brubu1QuoQLid4fbz1I9HmlYmzGnQbVw4mpaGhXihc+y6n+ZINcLX
 Zym20MYnu7O3Ti/snzSiEZqlM/eN48RLOyUF21XnxKmjWgfOPHHhnmCCLEZ9duJRy66V
 mnyH537EiQrswVMNH9f77nlICl4EcVI3ElB/OMu3EHrifkKSJs1ckrsoUu4MD9ulmELn
 +niAJJGCZ+AoS/RqTv3Cg3/g+/sIvUrEvHAA3LG149VVTjDyKHZjTsx5sQADO/BWmyQs
 sP13k4CKMt25vyFc+Z2AXKLj54p5sQpjZhvtAMU0yFZQCupIDdyw8njCwvTX/jEtO92K
 KYTg==
X-Gm-Message-State: AOAM5313xmuXl1758FzhoziBhEH5ySo7suPS8s66WS5t61KVXZzFI7mQ
 ZcrBQbi6TgrbidJp9ohWXuNUUI+mFyoVlw==
X-Google-Smtp-Source: ABdhPJz+l01Gd3b4YWhwwE8NeWEK5m1FbOTtB9an0SIO4Hfo/rEryj2K8uMHFhPBGJGHU0W8pnEsyQ==
X-Received: by 2002:a17:90a:f98c:: with SMTP id
 cq12mr18755231pjb.235.1621746452821; 
 Sat, 22 May 2021 22:07:32 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 4sm8365995pgn.31.2021.05.22.22.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 22:07:32 -0700 (PDT)
Date: Sat, 22 May 2021 22:07:32 -0700 (PDT)
X-Google-Original-Date: Sat, 22 May 2021 22:05:04 PDT (-0700)
Subject: Re: [PATCH] riscv: kprobes: Fix build error when MMU=n
In-Reply-To: <20210508234347.0b40b94a@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-6c70b6b6-7828-403a-93f9-5814edb3e201@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_220742_761329_DAAD8652 
X-CRM114-Status: GOOD (  17.86  )
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

On Sat, 08 May 2021 08:43:47 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> lkp reported a randconfig failure:
>
> arch/riscv/kernel/probes/kprobes.c:90:22: error: use of undeclared identifier 'PAGE_KERNEL_READ_EXEC'
>
> We implemented the alloc_insn_page() to allocate PAGE_KERNEL_READ_EXEC
> page for kprobes insn page for STRICT_MODULE_RWX. But if MMU=n, we
> should fall back to the generic weak alloc_insn_page() by generic
> kprobe subsystem.
>
> Fixes: cdd1b2bd358f ("riscv: kprobes: Implement alloc_insn_page()")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  arch/riscv/kernel/probes/kprobes.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> index 10b965c34536..15cc65ac7ca6 100644
> --- a/arch/riscv/kernel/probes/kprobes.c
> +++ b/arch/riscv/kernel/probes/kprobes.c
> @@ -84,6 +84,7 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
>  	return 0;
>  }
>
> +#ifdef CONFIG_MMU
>  void *alloc_insn_page(void)
>  {
>  	return  __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
> @@ -91,6 +92,7 @@ void *alloc_insn_page(void)
>  				     VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
>  				     __builtin_return_address(0));
>  }
> +#endif
>
>  /* install breakpoint in text */
>  void __kprobes arch_arm_kprobe(struct kprobe *p)

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
