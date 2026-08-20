Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A04C5DF82
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 06:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k19DyC5tdHbyABmffVG08o4k1kxYevsma9+ZCwViIB8=; b=4Qtx/puLMnlrV7
	UjS9k4K81jQtpbXzvKgEbQClLZJuYHrxOSMTijJbtyZ+OWU9aXHqVrOszJLWfWyPT0zakSTEv2b2h
	AJypNXIo235ED0BtMd9qHhC5o1i3OJ3uRvylswpom5uK5DVO0mS1pkCddMdIdWWoW+kiKNolcqeWY
	j1xmF/IKAIYv5NAofHW85WW59YtB4LNRoISTRuFa7JyaeyMawsarTvJ8VwFqAmYs0BV/aJ1+Dt8wU
	hkCxnifooMHnsbxBBbgY9GdZhdbtIguNv2GeUDVA9aWhOcuLEv3tiEvuillf2+yQj2qdu9f2FSjOw
	uPcMwMR/p4ZRQyOzuVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwNo-0000000AxLx-37LU;
	Thu, 20 Aug 2026 06:36:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwNn-0000000AxLr-2G1z
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 06:36:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D361561887;
	Thu, 20 Aug 2026 06:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C421F000E9;
	Thu, 20 Aug 2026 06:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787207770;
	bh=NvOqV6tAvUA+UfSBrJhmn6ljrq+Y5x9eRpqWn/0PU+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CTpUCuKDCfb75NeMv8H8F+kHtwAtir0Ej7VxcTBobBj+qB+AWHR9o3BDh/3nU0hbX
	 vm8W6DSOv4mvHa8VHFtZNYU3fNDRj1bG+fsFK0vL6Xaf8wX5Jb/E1X5A5WvW7BfYvo
	 8ne9tO7tf0qg2vEXb7AiiJvAglJk20fHGmpXKQ5QD0r/PvP93LGF2fzo7+KmBTEEmp
	 8wYc2ol4ypLK/sqFWRNGBCQXhk5gh0jUKCa4po10n+izdd8njf5aqLgTEm4Fr65C0l
	 YDY2S5imQ3VIn9r02H8vFE5sG+mui+OW9XrWO0Bqa8KtYNeVkOKoatdf1e6qh166JK
	 EeKadmInWEpnA==
From: Thomas Gleixner <tglx@kernel.org>
To: Haofeng Li <920484857@qq.com>
Subject: Re: [PATCH 03/16] irqchip/sifive-plic: do not iounmap devm mappings
In-Reply-To: <tencent_A781C26C35482A03F6BD42B277ED977B8F08@qq.com>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <tencent_A781C26C35482A03F6BD42B277ED977B8F08@qq.com>
Date: Thu, 20 Aug 2026 08:36:06 +0200
Message-ID: <874igpjo2x.ffs@fw13>
MIME-Version: 1.0
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
Cc: Haofeng Li <13266079573@163.com>, Haibo Xu <haibo1.xu@intel.com>, Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley <pjw@kernel.org>, Haofeng Li <lihaofeng@kylinos.cn>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14 2026 at 21:24, Haofeng Li wrote:
> -	iounmap(regs);
> +	/* Only OF path uses of_iomap(); ACPI/platform uses devm mapping. */

Instead of this comment and conditional unmap the OF specific map side
should just use devm_of_iomap(), no?

> +	if (is_of_node(fwnode))
> +		iounmap(regs);
>  	return error;
>  }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
