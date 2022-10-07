Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE06C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 13:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4DQLwVGPfmBs/XFTEMJKyHivFTYC3Mu+TTyfT445w2Q=; b=F8mi9aVfcPnE8H
	ZEEeTnf8omwImWShoo7GNUoU9A1I/3TlvZo6x8q7Ztmxp2LrIC0MhSZ/IsqGc3biuMz753tUPeRwr
	AeogNsYKyyEL9BJel9WFDfOX+jTgvAJf95AuFh2PyUV9vKW+B4B1B93ZoGNlaol8Atr6rV4ZZHMqQ
	M83A3BchkvNJDvJ/RQk1EgAb3nyHeXIl7xyXQcnZ8DrdKiJqD5FlpkAlYk0TuSBXEsjThkRcHWj2O
	eRg5LYuigmrSR56OkBzTPC91/XxrUn/FTzXKqeCI5yVysRDdnWn5K/KgIYhTvIbVgfxhkLeH+a2RQ
	YmMhTYKu9PhAsfvarjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ognYk-0097o6-0k; Fri, 07 Oct 2022 13:38:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ognYg-0097ln-Ac
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 13:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665149914; x=1696685914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tsmSIjIJ46YXGPAI+5kmgawlLLaMNxEFDnlFEJVg1h4=;
  b=kse/FDvQVyOyLw1HSrlwCy4kw4yMHBlx7bdDBTrmMXTPwUTsXkd0Fq6J
   1Lc0EdFsZdX1TLGvICDbj365EUgvckDlyevRiT0oMy3sOIggAosFsqBsP
   YDlGlNp4pvkP1ft4xWfqtXORm8zH08SxRJph/ntLUu7ZRrc9o/wA2Rbnx
   VJUim4nRmCPH/waf4CiUsEmesrWsfY6mWoC7NXvmQd0TpNvwwpkz6PUl7
   2UbDW5c7tgKxkSyAq0e+TuhGmuXHmGTd0DTD1FfqPVPn0I9Lp3CvfxVnY
   zefRBaC/NwcSj5ZS0wUJQLN5BdzXDCzOnY0peNntOVo6Q0GcNQ3PsOSb7
   w==;
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="180892143"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2022 06:38:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 7 Oct 2022 06:38:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 7 Oct 2022 06:38:21 -0700
Date: Fri, 7 Oct 2022 14:37:59 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Hugh Breslin <hugh.breslin@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: dts: microchip: fix fabric i2c reg size
Message-ID: <Y0Art7TVBW8vTeUv@wendy>
References: <20220920093734.29287-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920093734.29287-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_063834_467390_F65A1728 
X-CRM114-Status: GOOD (  17.94  )
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

On Tue, Sep 20, 2022 at 10:37:35AM +0100, Conor Dooley wrote:
> The size of the reg should've been changed when the address was changed,
> but obviously I forgot to do so.
> 
> Fixes: 7f3be227e818 ("riscv: dts: microchip: icicle: re-jig fabric peripheral addresses")

Forgot about this patch... Changed the fixes tag since I had to rebase
the branch it was based on, and applied:
https://git.kernel.org/conor/c/c210b91818e81068ca2573c20684644b8e110a07

Figured it was better to apply despite being in the merge window rather
than submit a PR for a dt that I know is not right.

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> index c196bbfc0c24..917ed4c7b18f 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> @@ -17,7 +17,7 @@ core_pwm0: pwm@40000000 {
>  
>  	i2c2: i2c@40000200 {
>  		compatible = "microchip,corei2c-rtl-v7";
> -		reg = <0x0 0x40000200 0x0 0x1000>;
> +		reg = <0x0 0x40000200 0x0 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		clocks = <&ccc_nw CLK_CCC_PLL0_OUT3>;
> -- 
> 2.37.3
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
