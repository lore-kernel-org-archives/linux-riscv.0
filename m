Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE1AC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQZiCICjwgmTwItK15ydh3izqYBziOQCzpUFpX6W4dE=; b=TIKAlan+MkM6b9Wc09wE6+HVTM
	zaPoDLGgZunCs8jjFWJWk41Kb14ptWUUZEID0djHb6ZRzPjBjumQz2V5h/JLgFOAZJdR8fmFOnM35
	XYNYZeKeFKw53BknNzcIdcc5uJDdXKNg3+ptuIKFmc2fAeXkW7CB/0uFUT5T0c1UuHOvddCcBmkCu
	98iOMmqVm4aG7x33+Uh1cw9OVT9vhPx3U+mqUeT6nhnlAmPSQ7/Wdxi92q84p6zXYthpuJFTV224k
	G09B2aoN0gBj/QqRKBP6CpDtLJy9POcNtY7MDib2dhezd00wpBZMRsD2JhCq9N5hRbG+BagehAjZT
	TBTZdgLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hdh-005LEE-96; Fri, 01 Jul 2022 14:28:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hde-005LCj-49
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 14:28:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3577662233;
	Fri,  1 Jul 2022 14:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC2DC341C7;
	Fri,  1 Jul 2022 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656685730;
	bh=eb0RVw4u/anxVBhBeK6RNGoBor+v7IkGnAADFe79wz8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N4dveUvYzzWyC8fMV0v0hedmOK1ZAMnFbdqhysk4WaSM0nBJ5UGNNFqdZwQ6rvMIn
	 CP7ClyXkRLM/63cRf55J9y6B7IMxWTTHcdoGVsMy4uSFk7LGQjzFjqRc6omPUcwwRn
	 B9kqf9pRrlu6yoi8KFGJ7VRs49YYxJ/d2sia7XcvSGprDsbgyvadOiPqbzPAT1XDvJ
	 9lUkAzGaYu2A49lfHm5lhFMTyzyBYx8+fliV5Kgwv/5AtG9NtVvmMuvIb5P+3JK/48
	 moPFmDTxjnYJm7qHwhnkR8pKAXK4Y2HtDwBqgBMGVmYIOksPHsfjZwJ/VArWBElV2u
	 fj3qZ04BLthLw==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1o7HdY-004bu7-EO;
	Fri, 01 Jul 2022 15:28:48 +0100
MIME-Version: 1.0
Date: Fri, 01 Jul 2022 15:28:48 +0100
From: Marc Zyngier <maz@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Prabhakar
 <prabhakar.csengg@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] Add PLIC support for Renesas RZ/Five SoC / Fix
 T-HEAD PLIC edge flow
In-Reply-To: <20220630100241.35233-1-samuel@sholland.org>
References: <20220630100241.35233-1-samuel@sholland.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <92a45bf04cfe140c7605559fa3d8f4eb@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: samuel@sholland.org, prabhakar.mahadev-lad.rj@bp.renesas.com, prabhakar.csengg@gmail.com, sagar.kadam@sifive.com, paul.walmsley@sifive.com, palmer@dabbelt.com, guoren@kernel.org, tglx@linutronix.de, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_072854_297882_67D31BBF 
X-CRM114-Status: GOOD (  21.02  )
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

On 2022-06-30 11:02, Samuel Holland wrote:
> This patch series adds PLIC support for Renesas RZ/Five SoC.
> 
> Since the T-HEAD C900 PLIC has the same behavior, it also applies the
> fix for that variant.
> 
> This series is an update of v2 of the RZ/Five series[0], and replaces
> the separate T-HEAD series[1].
> 
> [0]:
> https://lore.kernel.org/linux-riscv/20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> [1]:
> https://lore.kernel.org/linux-riscv/20220627051257.38543-1-samuel@sholland.org/
> 
> Changes in v3:
>  - Add a more detailed explanation for why #interrupt-cells differs
>  - Add andestech,nceplic100 as a fallback compatible
>  - Separate the conditional part of the binding into two blocks (one 
> for
>    the PLIC implementation and the other for the SoC integration)
>  - Use a quirk bit for selecting the flow instead of a variant ID
>  - Use the andestech,nceplic100 compatible to select the new behavior
>  - Use handle_edge_irq instead of handle_fasteoi_ack_irq so .irq_ack
>    always gets called
>  - Do not set the handler name, as RISC-V selects 
> GENERIC_IRQ_SHOW_LEVEL
>  - Use the same name for plic_edge_chip as plic_chip
> 
> Changes in v2:
>  - Fixed review comments pointed by Marc and Krzysztof.
> 
> Changes in v1:
>  - Fixed review comments pointed by Rob and Geert.
>  - Changed implementation for EDGE interrupt handling on Renesas 
> RZ/Five
>    SoC.
> 
> Lad Prabhakar (2):
>   dt-bindings: interrupt-controller: sifive,plic: Document Renesas
>     RZ/Five SoC
>   irqchip/sifive-plic: Add support for Renesas RZ/Five SoC
> 
> Samuel Holland (2):
>   dt-bindings: interrupt-controller: Require trigger type for T-HEAD
>     PLIC
>   irqchip/sifive-plic: Fix T-HEAD PLIC edge trigger handling
> 
>  .../sifive,plic-1.0.0.yaml                    | 65 +++++++++++++--
>  drivers/irqchip/irq-sifive-plic.c             | 80 +++++++++++++++++--
>  2 files changed, 135 insertions(+), 10 deletions(-)

I'm going to provisionally queue this into -next so that it
can get some testing. I'd still want the DT changes to be
Ack'ed before the next merge window though.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
