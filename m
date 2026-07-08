Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598A7C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 16:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhOQnoxdTBYP450s+3dhjKothrYBXbBM0Nl8GZ4d80w=; b=hrluZByqFRGg7p
	mVZ+zUjCZhjWxs2XoRpIXz8N0+EAsh6LMQWCkrPaB+cR7C6WQvMonkDeZy8fjoPbpTh8xU8Ob8viE
	aTTWBlL+7SDoXL2Z+5mlrF/PwIVxsr7xj1pCq2AH8AEZ0R2NM3va0xr16A+vYkN8H+TH+w0bBNC/u
	5LTtayl8GZB/KBOVkTsYPcyOGcXadVxV6FLveJ9ExW9KapSPu8I4nXEe31lTARjSAPAcxYM5uI6cF
	W/FlOi9/7MF4ZA9VCoxGLFUy/aqCygnSGKuv8/tpophS2kFzNJazXcscAy69GWMYiP5g8owItPxzz
	P8gc6Eyi9z57jENIpXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVVJ-000000001qE-0mKI;
	Wed, 08 Jul 2026 16:52:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVVH-000000001q8-3S0C
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 16:52:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B3B36001A;
	Wed,  8 Jul 2026 16:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67231F000E9;
	Wed,  8 Jul 2026 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783529526;
	bh=plHS15QW33IPNnenRu2SRoBFtCA/UKPiq/4pB5mHiV8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=JLuG1Ovs1tncsn3lEbkGAPhbclG+Mov9RB6nLDPXfC6RdEbijOLLntilzcn0T7WUl
	 v83nD+a4SuH3dDpdN2fYYP67Z3W0/KCCwZK32/yOqIzVRGEhntqabR0OdlmW3Cz9i3
	 Nx0aY6PDRumnYK2E6rM7vcqb5mWyPjag17TDlRLT+WpnnzNzRcbbA3CGwLlbWxwMgX
	 +9064x1jBy3B9N0IMT1UHyOj8rcrbz9T103cFS8Wg9xpYDdIn3wBPWt3VQt1gK4uTB
	 DCmV5CqDKXSx7y1SqYScCuKgc9DhcwPJuFbVlizYoUdQ8ZAXB3CS9t7d4o8ggpuIEf
	 JxghZB0++0N6w==
Date: Wed, 8 Jul 2026 10:52:02 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
    Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
    devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] riscv: add UltraRISC SoC family Kconfig support
In-Reply-To: <20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com>
Message-ID: <3cf5f6f0-25f2-c0ca-d0ac-aa8672ea4586@kernel.org>
References: <20260427-ultrarisc-pcie-v4-0-98935f6cdfb5@ultrarisc.com> <20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2026, Jia Wang wrote:

> The first SoC in the UltraRISC series is UR-DP1000, containing octa
> UltraRISC CP100 cores.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

I pulled this out and will queue it for v7.2-rc.  As Krzysztof mentioned, 
it's best if you group patches together into separate series that will be 
merged by specific maintainers.


thanks

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
