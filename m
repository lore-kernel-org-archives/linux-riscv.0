Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA20C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBE4PQTCFVcXLMWyfBsdXXfdk0Zm+zblt08Pr5bRzQA=; b=kMAWuGMittFO4r
	jS2KOHmE/AfthiddXBwDa+ONVIA6hu6uby67psY/m0Wgn4qaUhr2n0VOwjaf+5nTAalNCssH8kZ9P
	YXArsf/Sr0rIV/cE6FUxe3AJgsjAuJEwu7KKCTBWvGG9kui2rWYqpZU7vMYde/dioqE5Cnu5PObir
	dfO29sdXeWTEvQqJ5I3ZR4JcgS8n3CGP7KMGHD/nS7tY5VzPXhrYCdVe5G2QA6TdeFyCzeyL2WTwk
	EWXtEXWsr933WlW6Q4ISzwkqMBng4gzepwStzZeyCArSniyicbiJpzIiDTaLSCsxCzymBxkV2+/kD
	WP+w3x8LBlcvqNIcHtPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7vKm-004vCF-05;
	Tue, 28 Nov 2023 10:28:52 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7vJV-004uFP-1t
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 10:27:35 +0000
Date: Tue, 28 Nov 2023 11:27:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701167247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Com+dSCJOw0HxlqQXnru2ux2jzcwVajuCWhe2agRAKM=;
	b=Qz/nZK38xViHxCURslOIAFGVL4DxjuvyNG3tjFfxiIFqdZMk13EArChMFoUXd/nGq0TL0X
	1+1jmw/IYGkk4vZLpidXLUe7llSzSOoTmS0F5BRFBTG5Cx426y+ydkZ1XZz2lN81dfIJXa
	iSHf7uaftCbeD8CZV4AJQ063SosFwFRcyO3tb2njriWkNQcyu8cR17azq6Brd+c8DnyHYt
	/+klD0il/PTXON1abstAkCKvZyLvDsekTBDgz0Pl8HCcMaw16jzEV3FFxG8/VgqzItwlNg
	vQGHX99r56d4aUEUocehn+jUJDcLJcDjJJpjuiIlaDgRrQt0zTCZMEI9Om5N2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701167247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Com+dSCJOw0HxlqQXnru2ux2jzcwVajuCWhe2agRAKM=;
	b=egK6HftxIq/OD6FIebCHW6srKzLu+xB9bJpMlmAIyyle7tSA0tlL/Z2WY/EJaHTkP7OVC5
	W29g0WvSoA0ziKDA==
From: Nam Cao <namcao@linutronix.de>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
Message-ID: <20231128102722.fQizGKfo@linutronix.de>
References: <20230525061836.79223-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230525061836.79223-1-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_022733_780093_C470601B 
X-CRM114-Status: GOOD (  13.35  )
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

On Thu, May 25, 2023 at 02:18:36PM +0800, Jia Jie Ho wrote:
> Selects ARM_AMBA platform support for StarFive SoCs required by spi and
> crypto dma engine.
> 
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> ---
>  arch/riscv/Kconfig.socs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1cf69f958f10..381cd46e6373 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -29,6 +29,7 @@ config SOC_STARFIVE
>  	bool "StarFive SoCs"
>  	select PINCTRL
>  	select RESET_CONTROLLER
> +	select ARM_AMBA
>  	help
>  	  This enables support for StarFive SoC platform hardware.

I'm considering sending this to stable trees. Without this, it is not
possible to configure the kernel with SPI driver for the starfive board.

I just want to check with you first, in case I miss something obvious.
Any objection to backporting this patch?

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
