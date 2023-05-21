Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42074C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 02:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=472EhJtfkNGoRjC2HOIOey7UB36Tcxml1p5uA4pslfQ=; b=S4D7YgBS2XHlmC
	UQcFrEFUhFt6GS/UcFvcRfaB8YGY0ob0iKDdaYjmd7KYiIJ4FVUdxGjg7M4CVchThn36FcBtwn/GF
	yBqHToXfUcJ6T7oK7agqCemWt9lvioHGysFJl6P0IFAdT6XzWZ1afcf1DQI1LW8b+BGoFkYZiacHu
	kNJNrEsYS2J1y/hjGtErcfNg0cpznpkGdvz5/7KETPrVGFzQD3cMsbXLSTnR4sTOKIK8j5trvhgUH
	TpTJS2axo5P49tsTkcWebsiwpUkreyYlwvlfVYw4kCNIKwmlJx+R8LnfrjK+4dcbNyyOu3Ph40tzk
	2nt8NeSwaKxWLV9jq7QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0YjF-002pr7-2A;
	Sun, 21 May 2023 02:23:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0YjA-002pq5-2d
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 02:23:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34F3060B40;
	Sun, 21 May 2023 02:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF01C433D2;
	Sun, 21 May 2023 02:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684635799;
	bh=RHW80sJHmW5Qqx75Hy0vyujMaMVpH+8l0k3YudQV2wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mooVlLsc91A2gkf2LcYLhp8SBftmNELazGRBRC+AawEjkWKsjEZsEOfWy84veaPRk
	 xt5EYvKhA30EULP8WIUDL+hoFzpsTW9I2PqNe1GjqVQjSJSYyOX840X1ui6eJxCG3t
	 3/d4cjNoiHriZVUMHxw3VFQsjkyy2P5Ft9EMS1PV4jOA1ldBjAEHUNvsF+aI1lum9g
	 3G4EcY2b+YQoWI3zSsz+V+tSLTs3PnPqedfcg57GtQA074c3M2sINxYs9N4zL+5lJC
	 Q4iA55CRT+CTHYqUSpmSiRjZaiaTdyBnc1xZdH6i86QaJraA4Q/k3Aa49ycnUuQXno
	 ugRwm1qe0hlYA==
From: guoren@kernel.org
To: falcon@tinylab.org,
	guoren@kernel.org
Cc: conor@kernel.org,
	linux-riscv@lists.infradead.org,
	npiggin@gmail.com,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	tim.bird@sony.com,
	vincent.chen@sifive.com
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
Date: Sat, 20 May 2023 22:23:13 -0400
Message-Id: <20230521022313.3758709-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230517082936.37563-1-falcon@tinylab.org>
References: <20230517082936.37563-1-falcon@tinylab.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_192320_922628_D42ECB4D 
X-CRM114-Status: GOOD (  18.31  )
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

> 
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
Good point and other arch also support the feature e.g. commit:
c0436b503591 ("MIPS: Enable dead code elimination")

Reviewed-by: Guo Ren <guoren@kernel.org>

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
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
