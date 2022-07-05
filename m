Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2587DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 11:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Igrt6ZbymmbKJwVs7VrK5F3wv3K18kRyKHE9ZSK5V5Q=; b=kdGQMTzTXbu6s7
	Q3kAO+fgA6uHQYcQf0RdNN4O7at9XQA2BwZUe4sMgEvvbz4XmmPL3lEpD6iQd3O72jet2Ur2DR/Wi
	AndvCfaeDDTZvsHQoJMvgdJGMiKN42nyIRM1m3tG9Lv4ClOnfnpz9bjiBB6V4kWUpTCv85esgijnw
	7W8eXHltWvojKGpuSe3xp85Vo3HqimSJ1MB58XUVyk5n1/QXBITcM6fFWuN/qWFKJbCRcEH7gvPsf
	e+nZG3Geyh++XTc7nDw+dTgjBphpWpsO7rvg5HCFcU7Be19+sq3s5x3aCOfNCXAVpxuRCLgLuaN8r
	5VJx1ORQ+e6kOGODJFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8gxU-00HUrW-9Y; Tue, 05 Jul 2022 11:43:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8gxQ-00HUpW-5x
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 11:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657021388; x=1688557388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WfImbQtfeMtGGz2Cw5g0Es7g3tuLxqK4vIhrQdT+d4M=;
  b=YV/Vtpjsq8N1vPIykgxburLRe1OgmCGKyh/6X9fLg9XWaGNivcEgTWhm
   3rgOLKE+riaUBfg6FP4QONqrTXQ5elkgc4NcwIo+Tl4yQLcDkgM9gAHHx
   30H8VhMSwhuqwFl5U4iSC5A2rPtsYpbGkk56bkKHhNgsrc87OPBSwUiYo
   lF5WhhPiid1XrfSrlkIh19++Si+PMzhMqkjp0nfW8t8s2+PBTsnfLXFxZ
   W8HmS799uEQSqSmWcnGwAVCuvzqY6Kor++k2fTwtI0TKu7H8H8KyH1OtN
   pX86udYy+7/dydXAiJhI367+EbWzq1QjS3FZZE+qqLO1CGE66EC+mwTAI
   w==;
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="180778158"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 04:43:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 04:42:57 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 5 Jul 2022 04:42:53 -0700
From: Daire McNamara <daire.mcnamara@microchip.com>
To: <conor@kernel.org>, <conor.dooley@microchip.com>
CC: <aou@eecs.berkeley.edu>, <atishp@atishpatra.org>,
	<daire.mcnamara@microchip.com>, <devicetree@vger.kernel.org>,
	<ivan.griffin@microchip.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <palmer@rivosinc.com>, <paul.walmsley@sifive.com>,
	<robh+dt@kernel.org>, <sudeep.holla@arm.com>
Subject: Re: [PATCH] riscv: dts: microchip: hook up the mpfs's l2cache
Date: Tue, 5 Jul 2022 12:42:30 +0100
Message-ID: <20220705114229.2734205-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629200732.4039258-1-conor@kernel.org>
References: <20220629200732.4039258-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_044308_278104_0A66A597 
X-CRM114-Status: GOOD (  13.48  )
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

Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>

> From: Conor Dooley <conor.dooley@microchip.com>
> Date: Monday, 4 July 2022 at 10:04
> To: FPGA ESS Linux patches <FPGA-ESS-Linux-Patches@microchip.com>
> Cc: Conor Dooley - M52691 <Conor.Dooley@microchip.com>
> Subject: [PATCH] riscv: dts: microchip: hook up the mpfs' l2cache
> 
> The initial PolarFire SoC devicetree must have been forked off from
> the fu540 one prior to the addition of l2cache controller support being
> added there. When the controller node was added to mpfs.dtsi, it was
> not hooked up to the CPUs & thus sysfs reports an incorrect cache
> configuration. Hook it up.
> 
> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/mpfs.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> index ed8739350587..2df555a57003 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -50,6 +50,7 @@ cpu1: cpu@1 {
>                          riscv,isa = "rv64imafdc";
>                          clocks = <&clkcfg CLK_CPU>;
>                          tlb-split;
> +                       next-level-cache = <&cctrllr>;
>                          status = "okay";
>  
>                          cpu1_intc: interrupt-controller {
> @@ -77,6 +78,7 @@ cpu2: cpu@2 {
>                          riscv,isa = "rv64imafdc";
>                          clocks = <&clkcfg CLK_CPU>;
>                          tlb-split;
> +                       next-level-cache = <&cctrllr>;
>                          status = "okay";
>  
>                          cpu2_intc: interrupt-controller {
> @@ -104,6 +106,7 @@ cpu3: cpu@3 {
>                          riscv,isa = "rv64imafdc";
>                          clocks = <&clkcfg CLK_CPU>;
>                          tlb-split;
> +                       next-level-cache = <&cctrllr>;
>                          status = "okay";
>  
>                          cpu3_intc: interrupt-controller {
> @@ -131,6 +134,7 @@ cpu4: cpu@4 {
>                          riscv,isa = "rv64imafdc";
>                          clocks = <&clkcfg CLK_CPU>;
>                          tlb-split;
> +                       next-level-cache = <&cctrllr>;
>                          status = "okay";
>                          cpu4_intc: interrupt-controller {
>                                  #interrupt-cells = <1>;
> -- 
> 2.36.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
