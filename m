Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC88C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 08:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiZ82geiSvNpH4e6ElJ1SrxfdVOSyaQmQEEc9Hct/kw=; b=TZH4UCjiWI5qKQ
	nGUY22bP/ipXgU20n8J37NmxuMvx680dLPn8Lg40gSq+bE+SOeyVMxPUNQqgD6ltN/k6pXq+lC4YW
	Oc7BGy2VLakAcSXvn8pO348LI+HVcSbiPCibhbifX/JAOQ0pbHg063HHMe4y+uX9SX8pwsoBHqxRj
	aNNKAOaPGR1PooZqa/aRt5cXz1DyyFwckLOPgieTSdix0Tzvdp5XQNsm8pXcNc/GjLwsGBW9nTpv6
	ZBmBfrpG57POvabyLA6Cok6Uu59ptkuYwOORqnahRzVMQJBBM307rGwyICvojlH2qSqmlwoDm7iWg
	m6lwHcoNqmA2IiP8Z2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCjK-008u9g-03;
	Wed, 17 May 2023 08:41:54 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCjF-008u7p-1X
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 08:41:51 +0000
X-QQ-mid: bizesmtp81t1684312895tdqo2h9z
Received: from linux-lab-host.localdomain ( [119.123.131.162])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 May 2023 16:41:34 +0800 (CST)
X-QQ-SSF: 01200000000000C0V000000A0000000
X-QQ-FEAT: BGlUkj2vj1Vlw3cqviNPr1FXLSw0rL6fFlVdSFDdnHK4imlM/GpxHzF47PbPo
	0ieCxDHtQooEdrZlCxOjDZ/5GG6wapIlN9g54Loj6vBhSofiNOcH6P9uS446BGXF6mffRHf
	x4c4VqAI+lv7fQ+F8/mbBIGYX9hGdvO88Vxz2t/LAJHKLdMj8+n2s/XYWlILDXNUQA5tAv3
	hmvMob3q97kwLgxOxSw7E3NvaHO3bZsb3CWSjyNo7gWnYlPIRC0gF+NmZUoZJdogg2mwU0u
	hAuvsyvmT/kAWz58Opf08fzCaEw6/zjKTyW8ToojgYBe8kK/cFy7x29vrlXOuj5nCu0+GV+
	m/qeuL4yGR6MDqsYh+24HgAQJnPBKfNhVuh/HbvnEGlrA0PH3CJpanEgIf7pw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14251911762333626776
From: Zhangjin Wu <falcon@tinylab.org>
To: palmer@rivosinc.com
Cc: falcon@tinylab.org,
	conor@kernel.org,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	npiggin@gmail.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	vincent.chen@sifive.com,
	tim.bird@sony.com
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
Date: Wed, 17 May 2023 16:41:34 +0800
Message-Id: <20230517084134.37892-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230517082936.37563-1-falcon@tinylab.org>
References: <20230517082936.37563-1-falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_014149_813012_92D81837 
X-CRM114-Status: GOOD (  15.80  )
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

Hello, Maintainers

No changes from v2 to v3, only rebased on v6.4-rc2, it compiled and
booted.

This is part of my tinylinux work for RISC-V, the other patches are
coming soon.

Thanks,
Zhangjin Wu

> Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> the user to enable dead code elimination. In order for this to work,
> ensure that we keep the alternative table by annotating them with KEEP.
> 
> This boots well on qemu with both rv32_defconfig & rv64 defconfig, but
> it only shrinks their builds by ~1%, a smaller config is thereforce
> customized to test this feature:
> 
>           | rv32                   | rv64
>   --------|------------------------|---------------------
>    No DCE | 4460684                | 4893488
>       DCE | 3986716                | 4376400
>    Shrink |  473968 (~10.6%)       |  517088 (~10.5%)
> 
> The config used above only reserves necessary options to boot on qemu
> with serial console, more like the size-critical embedded scenes:
> 
>   - rv64 config: https://pastebin.com/crz82T0s
>   - rv32 config: rv64 config + 32-bit.config
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  arch/riscv/Kconfig              | 1 +
>  arch/riscv/kernel/vmlinux.lds.S | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 348c0fa1fc8c..d2eb1a862ea8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -111,6 +111,7 @@ config RISCV
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>  	select HAVE_KRETPROBES if !XIP_KERNEL
>  	select HAVE_RETHOOK if !XIP_KERNEL
> +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>  	select HAVE_MOVE_PMD
>  	select HAVE_MOVE_PUD
>  	select HAVE_PCI
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index e5f9f4677bbf..0f5dfbc113d4 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -112,7 +112,7 @@ SECTIONS
>  	. = ALIGN(8);
>  	.alternative : {
>  		__alt_start = .;
> -		*(.alternative)
> +		KEEP(*(.alternative))
>  		__alt_end = .;
>  	}
>  	__init_end = .;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
