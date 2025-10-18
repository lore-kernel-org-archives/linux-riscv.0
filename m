Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6AFCCD184
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 04:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHh4FTZwMGWYngpidwwGNZIRtar955rUivMwkMyQX4A=; b=z95QffOPSp5V/t
	0Ij8ERwgPVzb5gD7rzaxujHacjmA9J7OuSm6Rpj5g5Fqm85G4ZRT1tdpqxBpu3RPcAasA+6AV/kCy
	t9GcfyoDSQaWOfE0oTE9VqhJ0NgppSGttJzaz8ghYIWLwU7iAHIHHB91ZNvl4mBVuEoUCqSpp1gex
	HEnRCRkhLhaaii/MiYAGZpZR2vo8VCGuWbl/NvALXWCQidJdXwdgS3AogaJsRskmucek8R9Oi7sBJ
	bLP2S740HyqjHgYbbhYL7fppifYRs4iQjSEVMWT7QbHDNulI5PFKWquFvF0OstLoFUPUeeUvESX8n
	Z28VVsc8nJ2WBRUxq+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ytq-00000009XNX-2Qqy;
	Sat, 18 Oct 2025 04:50:38 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9yto-00000009XMe-07mA
	for linux-riscv@lists.infradead.org;
	Sat, 18 Oct 2025 04:50:37 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6996792009C; Sat, 18 Oct 2025 06:50:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5EFDC92009B;
	Sat, 18 Oct 2025 05:50:30 +0100 (BST)
Date: Sat, 18 Oct 2025 05:50:30 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>
cc: linux-riscv@lists.infradead.org, pjw@kernel.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
    ajones@ventanamicro.com
Subject: Re: [PATCH] riscv: asm: use .insn for making custom instructioons
In-Reply-To: <20251017165527.701934-1-ben.dooks@codethink.co.uk>
Message-ID: <alpine.DEB.2.21.2510180543430.39634@angie.orcam.me.uk>
References: <20251017165527.701934-1-ben.dooks@codethink.co.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_215036_251773_57FBED10 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

On Fri, 17 Oct 2025, Ben Dooks wrote:

> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index 8bd2a11382a3..c92f0ff51ffa 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -12,6 +12,12 @@
>  #define __ASM_STR(x)	#x
>  #endif
>  
> +#ifndef CONFIG_AS_HAS_INSN
> +#define ASM_INSN(__x) ".4byte " __x
> +#else
> +#define ASM_INSN(__x) ".insn " __x
> +#endif

 FWIW writing code such that double negation applies to the else clause 
makes conditionals harder to parse by humans (it's !!CONFIG_AS_HAS_INSN 
effectively here).  Would you mind rewriting it as:

#ifdef CONFIG_AS_HAS_INSN
#define ASM_INSN(__x) ".insn " __x
#else
#define ASM_INSN(__x) ".4byte " __x
#endif

or has there been a particular reason you chose the proposed form?

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
