Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCDAC87FC9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 07:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yN9nreU0zm5SORyTq5Jo4PuNKZaJWU9IU8loMV6PNOE=; b=pDFUBEVAZ/B2Hq
	nBxpog+GJ4GSn31m2z7o6ckNdcNcgRaAAJALvean/QJfkKpc3WcycQx/7vrEEuUGePXTABknnDFkn
	T5ETTtj1FGsTHPkUh7hlWYOjuqTh5ODxDRHg3HeTwdGpW9iN1b0IwLSA4rpde0t/+yLbHepp0od6i
	lpIvrCZkYl2YNevzCrAFNNmFsYrW+alighMKAMrqrl2kTYaF3ziEtywDpe2Z3H0zStHnFz7tbc9dC
	gdwG10P/vG8TyYSP7XNKiV1J8JOPF/UcjXD3LULw7rQTt5mRMU+q3dKoeD41YqQlVEJtZFxsCnexJ
	KwYSqP4XrW+dHG+2o5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh0wJ-00000000qkW-3uTm;
	Wed, 30 Jul 2025 07:09:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh0td-00000000qT8-3TTs
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 07:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C6B65C1851;
	Wed, 30 Jul 2025 07:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA33C4CEE7;
	Wed, 30 Jul 2025 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753859201;
	bh=KlI1XPaFmUg2EcZ0srrQoO2VB9R/Kuj5mD2SUgA4Yho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VgTLrhnxvCTrx9QaVzU9EIM2tTnQ9jk06DoDKo1YEgouN01AsKMo5YVcOkoliFp0u
	 0uxNM2NW9iHq2EgCrzaBF14wUjCbVtGUQCPSghydc1Sd1nwxEz+fuce4nC1mluLc+C
	 a7Rn+9kfaD6COIA5FHkWtfnTqQ9Jd1kRvFSx6i6xJQu8QHdZnw3zqzkTSg3X4v+a2C
	 0e3yibcFCUcyWUPUIY+kE+0eg0E7+A4EaNfgwqeMqThVaH9WmuOkqvnu992OSc5s9L
	 k/PV2AnKGPgMrndn5g8nn39Vi1hcF/m65dVdPcRG/MobFxDuH+o9nIF43sm5HHDY/P
	 I2fNRSVSURb1A==
Date: Wed, 30 Jul 2025 09:06:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Samuel Holland <samuel.holland@sifive.com>, Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v7 3/3] riscv: dts: canaan: Add clock definition for K230
Message-ID: <20250730-laughing-dancing-emu-5540d6@kuoka>
References: <20250730-b4-k230-clk-v7-0-c57d3bb593d3@zohomail.com>
 <20250730-b4-k230-clk-v7-3-c57d3bb593d3@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250730-b4-k230-clk-v7-3-c57d3bb593d3@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_000641_904206_936D1B8E 
X-CRM114-Status: GOOD (  14.77  )
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

On Wed, Jul 30, 2025 at 02:43:53AM +0800, Xukai Wang wrote:
> This patch describes the clock controller integrated in K230 SoC
> and replace dummy clocks with the real ones for UARTs.
> 
> For k230-canmv and k230-evb, they provide an additional external
> pulse input through a pin to serve as clock source.
> 
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  arch/riscv/boot/dts/canaan/k230-canmv.dts | 11 +++++++++++
>  arch/riscv/boot/dts/canaan/k230-evb.dts   | 11 +++++++++++
>  arch/riscv/boot/dts/canaan/k230.dtsi      | 26 ++++++++++++++++++--------
>  3 files changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k230-canmv.dts b/arch/riscv/boot/dts/canaan/k230-canmv.dts
> index 9565915cead6ad2381ea8249b616e79575feb896..6579d39e2c1690d9e9c2b9c884db528c37473204 100644
> --- a/arch/riscv/boot/dts/canaan/k230-canmv.dts
> +++ b/arch/riscv/boot/dts/canaan/k230-canmv.dts
> @@ -17,8 +17,19 @@ ddr: memory@0 {
>  		device_type = "memory";
>  		reg = <0x0 0x0 0x0 0x20000000>;
>  	};
> +
> +	timerx_pulse_in: timer_pulse_in {

Follow DTS coding style.

Please use name for all fixed clocks which matches current format
recommendation: 'clock-<freq>' (see also the pattern in the binding for
any other options).
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml?h=v6.11-rc1

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
