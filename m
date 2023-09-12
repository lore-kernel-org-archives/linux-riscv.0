Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAC4EE3F09
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8NGs32LxZNfF6zh4Zpupov/ElakAuIAsKtSaz9u1bw=; b=JnE2EFUihKhKNQ
	PLY/mXmgdG2HZ2VRDPVGPmvI4fP6n+TV40fLhLXmaWKQUr94uKA2SPGi5CYj2E5nEpE+6baAdHIGF
	7yZQ4zMlTpvBMph9gsV3t3FaoDyM3LrNjwKUAdXbIBOuJEmcrwVQwWuy4pnneTe1Hxhn4LQCfpX+I
	2zeBh2OcAmD7aFpbAyo316wTv4pjUJ50JnqqtqzV3fiTaBLnaFA9fzgrcyaIIQ0bpgT90veCOdF1V
	ZjSQYiDjJHcd5HYwjwN9Hyn5o6E6QfYTTycVx8sDCVryAZiAB/akBVNkWIDTJuYHRiOhjPTgFHl6U
	BmF0NfRraELc++yPjH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7cC-003xT7-0R;
	Tue, 12 Sep 2023 17:55:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7c8-003xSX-2A
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 17:55:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 53A66B81E5A;
	Tue, 12 Sep 2023 17:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44B9C433C7;
	Tue, 12 Sep 2023 17:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694541350;
	bh=NeiCnNPo3KOW64wUUmXZOw3OrKGWSoH40pjr74D8cEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ez4kU3Bb4kgBzNrxnsI6uBF3Wbe6qBzHTer7W/rvAOtyCbZZXAqCjiNwu4vIcrtHP
	 NVWrkNFGSxlxU4tMObk8yF8Up3APTrZkI0M4U/H0EYSkGrSkp5Y1E6GSaLIZog7qs8
	 i6/o1o4NGc3k5lIE0OTZcQ9HrYnvM5L3goYs3vhAPpM27X9vkCDI0QEu1UkJLp9LQ7
	 VZ/wNuoGJznbyiQXOF2/JzFEvtyPhwPm2LPpRQ8vUyVDSSU8YEl8hrwwwwrw7s/Th2
	 5Xhu6Lxn4Mq9ancHyaWbXTENfHCIkDkjjLHT5MUygJ9ZhFDEjArTscpYMxSm9zeEY1
	 RyQ5Gm/d05jWA==
Received: (nullmailer pid 995268 invoked by uid 1000);
	Tue, 12 Sep 2023 17:55:47 -0000
Date: Tue, 12 Sep 2023 12:55:47 -0500
From: Rob Herring <robh@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2 0/3] Change tuning implementation
Message-ID: <20230912175547.GA993874-robh@kernel.org>
References: <20230912081402.51477-1-william.qiu@starfivetech.com>
 <20230912081402.51477-4-william.qiu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230912081402.51477-4-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_105552_866674_420D17A0 
X-CRM114-Status: GOOD (  16.41  )
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

On Tue, Sep 12, 2023 at 04:13:59PM +0800, William Qiu wrote:
> Hi,
> 
> This series of patches changes the tuning implementation, from the
> previous way of reading and writing system controller registers to
> reading and writing UHS_REG_EXT register, thus optimizing the tuning
> of obtaining delay-chain.
> 
> Changes v1->v2:

Please don't send new versions as a reply to the prior version.

> - Rebased to v6.6rc1.
> - Keeped "starfive,sysreg" in dt-bindings but removed from required.
> - Changed the function interface name.
> - Maked the code implementation more concise.
> 
> The patch series is based on v6.6rc1.
> 
> William Qiu (3):
>   dt-bindings: mmc: Remove properties from required
>   mmc: starfive: Change tuning implementation
>   riscv: dts: starfive: Drop unused properties and limit frquency
> 
>  .../bindings/mmc/starfive,jh7110-mmc.yaml     |   2 -
>  .../jh7110-starfive-visionfive-2.dtsi         |   4 +
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |   2 -
>  drivers/mmc/host/dw_mmc-starfive.c            | 137 +++++-------------
>  4 files changed, 44 insertions(+), 101 deletions(-)
> 
> --
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
