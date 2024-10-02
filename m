Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A01CF8547
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 23:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghuULn3vHkE7s2y6AzFEpkZaZ+VS9/pblp1ddr8hl3w=; b=FlLNbvynT8V0oL
	/oppD2qEGFYoXLM7bcs4qg9TyTbrSQ5/VvrN+tmyqj+ImV3NvrNGdTyyBsDB8l+wNbgzC20rsXTlZ
	jxqEIusnoGqd6JbYPBhzGl7crTE/Lh5a0GsuoIuxEMPUmOeQiLTByYVe7x9ixCgPqmtl5HN/A9UWm
	IEjtkVJ5ChdEkdvxh6fqfDia8vMLAY5AJhBhWSzZ6uawwM178xCir9OoNt0BlirqLgAm9M3KeXGHw
	CWOpFup+c+LelHEXccv3cJ30MUDu93QaK913drejg3uDGF7Wuqg7G4P6ZUhZVUkBCIZ8Y/JLXlFOF
	jfTj/awfpITEGDBdTC4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw8ZS-00000007iUI-2iaD;
	Wed, 02 Oct 2024 23:15:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw8Xi-00000007iDO-0rho;
	Wed, 02 Oct 2024 23:14:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 389D25C5679;
	Wed,  2 Oct 2024 23:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AFEC4CEC2;
	Wed,  2 Oct 2024 23:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727910841;
	bh=7YYc3tKXWLUFk4DRNKpYVMKBIua9W9e+ZaMQmUrPvjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVwAaUa2LFESEmFu1zJ1Wzg+AJn37DVAWFp+xiTwBy9mcgc4iR9He3UQpBwbVTMzf
	 fisplMEFSlwzBvZR1vHIPVcL8fZdCBN+8ZQw5WDCFISKGZpv4kazuav4ShDEECwWTy
	 Nbaj16s5mrN38IV1SomH8OHbpMtCN/QqzYhOZOqxewImA0zPBD+4QVyKrhU4p4TxFM
	 2A9/Xb1UOyUe5ZGBXgWB9Y7yWgaZMKuKZC7G9pDLYvXm/EYsuubOGY/QfEFClFYreT
	 CEqnSPreSw7RiWM6xk9CCHjUt8RCZ0pvzVcm15OHgz2H/DsTuQyl8+oeu0XLMuifFQ
	 +BuUUk0k+B/WQ==
Date: Wed, 2 Oct 2024 18:13:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, pierre-henry.moussay@microchip.com,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	valentina.fernandezalanis@microchip.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Lee Jones <lee@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v1 01/11] dt-bindings: mailbox: mpfs: fix reg properties
Message-ID: <172791083082.1519634.10076484205246276978.robh@kernel.org>
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-stingily-condone-576e948e6d67@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241002-stingily-condone-576e948e6d67@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_161402_319723_B86D36D5 
X-CRM114-Status: GOOD (  18.37  )
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


On Wed, 02 Oct 2024 11:47:59 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> When the binding for this was originally written, and later modified,
> mistakes were made - and the precise nature of the later modification
> should have been a giveaway, but alas I was naive at the time.
> 
> A more correct modelling of the hardware is to use two syscons and have
> a single reg entry for the mailbox, containing the mailbox region. The
> two syscons contain the general control/status registers for the mailbox
> and the interrupt related registers respectively. The reason for two
> syscons is that the same mailbox is present on the non-SoC version of
> the FPGA, which has no interrupt controller, and the shared part of the
> rtl was unchanged between devices.
> 
> This is now coming to a head, because the control/status registers share
> a register region with the "tvs" (temperature & voltage sensors)
> registers and, as it turns out, people do want to monitor temperatures
> and voltages...
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/mailbox/microchip,mpfs-mailbox.yaml    | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
