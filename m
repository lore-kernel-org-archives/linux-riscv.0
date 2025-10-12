Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3D8CCD184
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 06:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLBp0obSuJKGn0b7dke4vWBwCXy/K1TcVXzLqsH0DRM=; b=TgODq8shua9XlB
	FWYeSEf9fFGHBf1diWTVgKT2irPo4TTEj4XhiAfs2cnZQviagS3xDWnyAS3FIO0S9GPs3HnBTeeLJ
	7tLFF8aaMQlYNL5EWAIqQDjxp9Hp6l11AaSC3kkW9YZVggh0VdOGYDJ8298XfjqwZI/oOCjaAAKHK
	snekygrqbs4OScB8OvHVwwIADQEQ0aeS0Qd5Qts52bcU4GW71sqI+3l954PQLLSMAc+1B0zjOYc3i
	S4a3YY6j9bXlDRWuVOQehaY7KvcDF5k9P8v38Te7dcW0rALFNjtLLBWhKVysQ+zb883HSxRuj6wYo
	QjpeHgSf9JKjJ1AmlUXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7pFG-0000000B6mp-1Rch;
	Sun, 12 Oct 2025 06:07:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7pFE-0000000B6mL-3CZu
	for linux-riscv@lists.infradead.org;
	Sun, 12 Oct 2025 06:07:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 368DA4552E;
	Sun, 12 Oct 2025 06:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD6FC4CEF8;
	Sun, 12 Oct 2025 06:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760249267;
	bh=rK12P4zeLhl5dtVhuIaoUuWetGo8+ztMKq3/BFcQ8Dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tg3mm9Pcneyg7FlIlIo0yoNLQLgbU/EruZIviOVfP4woAGYTOP0xCMBZ3D+8mlqdK
	 SzCyfXlYygGOHak6FkQKlYLtd4HN3MoJNaoMkjRcMLDJXuHdHs+y/s88dRh4VoDSmi
	 95pJkf4H+8fPCA9CumGuehpGE0HY08d+rqspd7tsdDTE7DoyBCi6NI2tVzB3kjpvqg
	 mgOlPSYqOnaPvqKilYMPDsw6eP6LXQTnKm3DduZvd5yTev/hSePAVosEe2YmVW6Omu
	 UKCo2sAR76HCJarFVJbzZsRxZCxvhI65wbdKo8ZTL9zBMIYwXtt+3SDjdGvkYiSqWh
	 gWFyQGk3mx2hg==
Date: Sun, 12 Oct 2025 02:07:34 -0400
From: Guo Ren <guoren@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: Define pgprot_dmacoherent() for non-coherent
 devices
Message-ID: <aOtFpju/42kVkBsx@gmail.com>
References: <20250820152316.1012757-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820152316.1012757-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_230748_826072_B68118C5 
X-CRM114-Status: GOOD (  19.89  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 20, 2025 at 08:53:16PM +0530, Anup Patel wrote:
> The pgprot_dmacoherent() is used when allocating memory for
> non-coherent devices and by default pgprot_dmacoherent() is
> same as pgprot_noncached() unless architecture overrides it.
> 
> Currently, there is no pgprot_dmacoherent() definition for
> RISC-V hence non-coherent device memory is being mapped as
> IO thereby making CPU access to such memory slow.
> 
> Define pgprot_dmacoherent() to be same as pgprot_writecombine()
> for RISC-V so that CPU access non-coherent device memory as
> NOCACHE which is better than accessing it as IO.
> 
> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 91697fbf1f90..00d8bdaf1e8d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -653,6 +653,8 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>  	return __pgprot(prot);
>  }
>  
> +#define pgprot_dmacoherent pgprot_writecombine
I missed this patch and sent out a duplicate one [1]. Maybe the comments
from [1] could be appended to this one.

Tested-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>

> +
>  /*
>   * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
>   * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
