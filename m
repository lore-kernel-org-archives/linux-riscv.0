Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE10C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGnWBnd4WiRCMPQg5UFejHAgSulrvYSpWQF94NpgmvQ=; b=0w6ppdkyuqMbAT
	WtXrOLC2LhqxCX0ReP/YgtRhUuLDp3pii2AgOya7+TKEi81pL5IxnZ9tT9QNCbBXrihg2S1mwd2BU
	7AEkBmessewqQQYQv8Hj2l4YqHVsVKNHzgEaHXfA3nciY5GkP9iHeX4jiKvRxTpTHN3KaK2Oc3z/y
	+wTEVLLm6pRRB63ZDdccV9DdliaCCv9h3S92uzme+4QgFWspiSiRKx9IPkHieEGqBRCT8tZp8I6vn
	0fMycpP+Rwh+JpBo1YwCaUzJFY6c1k/8MugzZuCVExZ834oO/mVBXbHdbgiaYQ6MWehz81qsfL+5D
	Fmp3+uc6OHh7PSl4JJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK4r-005ZWe-CH; Thu, 08 Sep 2022 16:08:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK4o-005ZVW-Lg
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 16:08:27 +0000
Date: Thu, 8 Sep 2022 18:08:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1662653305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3melgoxOyPm2WW+MNhQzQQlSABq+pMymGaM5BLeai9A=;
	b=Gp7zAcq+7nzep4nzUQTlLdgRIUFuc+CYrEawsF2uMxsBS2OCy2xJ6e9vaGHj5Akw1AhABk
	1WOEwlsYw+6q/zbB6J46ir2O6l884q5B3EW5aXqiaNGvhko4xkD6wb83FtXsPQqho5nJxS
	IH9PHxxbCmX4xOycUcdzrelBnit9tcaUOlO3PRfU9JLFgkqgKngO6h9udx5HvJzuwRz+5n
	S9Dgwelw9WHpk1a2yfx1AOHnMRNEMQA65RwjsuXGRLRcSocegsJlbExOtjw9m9rZT/rhWJ
	5A7XVgKn4T3q2+oAKJN/kK2yoU2MViFP0VmKgj/DXxpx/GeydYWqwPIneYOJ+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1662653305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3melgoxOyPm2WW+MNhQzQQlSABq+pMymGaM5BLeai9A=;
	b=h8h0ZIYnWSbUEFvLZoVbXhjwdVf0TrAXuHPJieWzTDYNEf6tCIWWlU8leHT7kCHnJxQ6NW
	T1VaQjp3ssK/XyCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 6/8] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
Message-ID: <YxoTdxk772vneG53@linutronix.de>
References: <20220908022506.1275799-1-guoren@kernel.org>
 <20220908022506.1275799-7-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220908022506.1275799-7-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_090826_871014_F78A5D08 
X-CRM114-Status: UNSURE (   8.40  )
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

On 2022-09-07 22:25:04 [-0400], guoren@kernel.org wrote:
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a07bb3b73b5b..a8a12b4ba1a9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -433,6 +433,14 @@ config FPU
>  
>  	  If you don't know what to do here, say Y.
>  
> +config IRQ_STACKS
> +	bool "Independent irq stacks"
> +	default y
> +	select HAVE_IRQ_EXIT_ON_IRQ_STACK
> +	help
> +	  Add independent irq stacks for percpu to prevent kernel stack overflows.
> +	  We may save some memory footprint by disabling IRQ_STACKS.

Do you really think that it is needed to save memory here? Avoiding
stack overflows in deep call chains is probably more important than
saving ~8KiB per CPU.

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
