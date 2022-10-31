Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C71ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqcJ7gBtch0oCpqnRqp3NhbkCuUxnX3AlcUMDOmyQSc=; b=2FfOR38H/P/Qsy
	M7TtvHxiYb5eC3qhwC0HAu1xcvklPOoxTpWOkbflW8mP95w9lVD4ZnVFJcnq0WjFes6jW2QREjMCI
	QDOKVtZYdn4P6hcDRLoi5Y14xs2IB2mSGdGH2rEUvBSX/tnqbN3dw7zBpi9efQBaTx6iTj3m+PwoW
	bvthyzM93s87yb2A9YNdqE1h9XaAP7kVcnMDShXL4O/xHl3AWhWTmtF/YCgc21v5HbswFWSuONJeU
	HhpqANKpWUvB0xK1CxGPN/jNnSlUvTMkG0ko2zEEjk97V5G7QUi+fwjRSMIUrJPErpPfI5f9JyGHQ
	OajyOU8IpEBAtxa5T1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opasN-00ETDm-On; Mon, 31 Oct 2022 19:55:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opasL-00ETCL-Li
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 19:55:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BFD8BB81A56;
	Mon, 31 Oct 2022 19:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE0FC433D6;
	Mon, 31 Oct 2022 19:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667246105;
	bh=pyVKDV9QrizM1GaBQq4r6UkfjgqRTyFKgmg+DUJEeQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mW9DeEtixxOapdRHvxfLlxaq8LROL7F1QXfcV+G5uXeMnzoTrGmytiX0uHZI+YNzw
	 xvT0Sw8CjZRBFt/Q7mkklElI9RtFeYIEPTiAMnIxkpwCGXbZLE05jGHBpXzYNj+uAH
	 Jyk6ToZz7whWr+9xodG6dpq4kUxomyK4YvgRy99M8Uq6T94ievbr9ZoMBOO8H+/msf
	 n58dXAT+2VGsnqLz8EcAWGDiagcAPLiiEpt5LzZnQYH36hbj/vTbd04IiA/QiKL4xX
	 FiwIRacDl3ssyae3g6+FA7eNJ+BYnTRY+9ngedNVDycdGhQZpHiiMeYcVLm2+z2po8
	 vSWtzrDwF4nsQ==
Date: Mon, 31 Oct 2022 19:55:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: microchip: fix memory node unit address for
 icicle
Message-ID: <Y2AoFCbQFGnWT48Y@spud>
References: <20221025195643.1215890-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221025195643.1215890-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_125514_027663_B60D1213 
X-CRM114-Status: GOOD (  17.98  )
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

On Tue, Oct 25, 2022 at 08:56:44PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Evidently I forgot to update the unit address for the 38-bit cached
> memory node when I changed the address in the reg property..
> Update it to match.
> 
> Fixes: 6c1193301791 ("riscv: dts: microchip: update memory configuration for v2022.10")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied:
https://git.kernel.org/conor/c/d6105a8b7c160a73ae04054c8921eba80a294146

> ---
>  arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> index ec7b7c2a3ce2..8ced67c3b00b 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> @@ -37,7 +37,7 @@ ddrc_cache_lo: memory@80000000 {
>  		status = "okay";
>  	};
>  
> -	ddrc_cache_hi: memory@1000000000 {
> +	ddrc_cache_hi: memory@1040000000 {
>  		device_type = "memory";
>  		reg = <0x10 0x40000000 0x0 0x40000000>;
>  		status = "okay";
> -- 
> 2.38.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
