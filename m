Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E36EE49A4
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Aug 2023 12:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Sw1xpMhZNwI1/24lfgPt58BfhMrHI1QF0061HyNYE0=; b=gMyEBHBWiT02GE
	AqXb/5M5WItkZGi1kRAFcQbMP5OrmRhEQ9En6ZxsU/sm2rsC+FhSV4Dd7QiUqX0LoZ/JoEFtwimnE
	SCiHDReraNqKs79wWwPWYfQzp/g9x7bnbOw35p1zaySooS8eKOwaywd2ha0ChpRwGgF6wsIWBQC40
	CwhRQPG21uixDxCdsT/C8uRI7vBzJBicEgEsQ6PcT77mZYSJ0JXRH/MrPpIElS3PFL4gY97xN19LA
	cynWnu284dn/UK8YHIWuDXEDaOOWvHfFRcqqt+2iyIwMCamHX7ObaoJ7WG2WmO8+DlJzldjmEzyUP
	9tlLNvPqv7wY1HUcEXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXhLk-00Bt6R-1v;
	Sun, 20 Aug 2023 12:16:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXhLi-00Bt5p-26
	for linux-riscv@lists.infradead.org;
	Sun, 20 Aug 2023 12:16:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A01961587;
	Sun, 20 Aug 2023 12:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB45C433C8;
	Sun, 20 Aug 2023 12:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692533765;
	bh=Q2Gb7Zw4uMgI1awBfHQLxQO4w229GHAJOp+Sw2N0vS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5PShadJGkC4dSLdtBvX8zU1e+bcpwrx0dXYnWlhjqbqlbPZetHs0UozEWi4CiovB
	 qcPX2JSnSyte4oVd40vrGeFv01yfn+zbkbVWarzz3OxTk46cHtHb3OL7LYNzYwMa49
	 +G0kBWQMZMUFm3UJwIT4aD70NifYi9uFksn3hTdf3if/iQgsg9BynJ2Dps2fUXrpKK
	 FdFf3UcxD+XKu/f2ocizUOi6WKKfanZ4UaGKnC16nvEWLTek8flEhbqNBSuYVVSmlI
	 gnuPVMcMuqc3cHHgl7mcVqkTxGuo41Z2tkYZaVOB/IKBg8s0l5WZAfuLI4nrKlIe3l
	 amO9rnEiFrvKA==
Date: Sun, 20 Aug 2023 20:04:16 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <ZOIBQI3L4kP7c/T1@xhacker>
References: <20230820115353.1962-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230820115353.1962-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_051606_737364_58AFF3C7 
X-CRM114-Status: GOOD (  12.62  )
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

On Sun, Aug 20, 2023 at 07:53:53PM +0800, Jisheng Zhang wrote:
> riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> dma coherent, so set dma-noncoherent to reflect this fact.

correct typo in linux-riscv maillist addr
Add linux-riscv, sorry.

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 56a73134b49e..58108f0eb3fd 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -139,6 +139,7 @@ soc {
>  		interrupt-parent = <&plic>;
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> +		dma-noncoherent;
>  		ranges;
>  
>  		plic: interrupt-controller@ffd8000000 {
> -- 
> 2.40.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
