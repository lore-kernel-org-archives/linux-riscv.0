Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37354C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsCZvl+WfB+YeVkme4IWxrbMXAEIdsSbSTl66niNdJg=; b=uerUMpKhPUBXRp
	6faKvao6Vk+zd9MO07YCrfmG6Z0TKIYQaOTcAJpjNoRmJJpddihd/PzZS1SpLYjW2KR4m4dmaZysm
	/Nr/AWdOKivCj6hKKhnwTH3jETw08alc/uZRYlc5675ms4xkvnxW1fUW67abSfF7OgNs0BpuhQMQ5
	pbzRSASqEJcsxhtvzkHhifbvmuZw+C4oAbmn44nUDlyBoYxQDO7C34COO/A4ehifhr1J2JxYXaokL
	7dt/mnKFy2rWCgBLUE17ZbJ/3sspYiHCvmvlfNBbAj1srnih1dboj0GTdINzYN7ZdyzHrKq8QaEU4
	pgDH+SnixOgtrvB4i4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOq-00000007cJt-3FDf;
	Thu, 24 Jul 2025 13:54:20 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueuv4-00000007P1M-1SpL
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 12:19:31 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A885F340FB1;
	Thu, 24 Jul 2025 12:19:27 +0000 (UTC)
Date: Thu, 24 Jul 2025 20:19:16 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 6/8] riscv: dts: spacemit: Add PDMA0 node for K1 SoC
Message-ID: <20250724121916-GYA748228@gentoo>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
 <20250714-working_dma_0701_v2-v3-6-8b0f5cd71595@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250714-working_dma_0701_v2-v3-6-8b0f5cd71595@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_051930_415070_EB646BA1 
X-CRM114-Status: GOOD (  16.61  )
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

Hi Guodong,

On 17:39 Mon 14 Jul     , Guodong Xu wrote:
> Add PDMA0 dma-controller node under dma_bus for SpacemiT K1 SoC.
> 
> The PDMA0 node is marked as disabled by default, allowing board-specific
> device trees to enable it as needed.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v3:
> - adjust pdma0 position, ordering by device address
> - update properties according to the newly created schema binding
> v2:
> - Updated the compatible string.
> - Rebased. Part of the changes in v1 is now in this patchset:
>    - "riscv: dts: spacemit: Add DMA translation buses for K1"
>    - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn/
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..46dc002af947893cc2c234ee61e63c371cd966ca 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -660,6 +660,17 @@ dma-bus {
>  			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
>  				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
>  
> +			pdma0: dma-controller@d4000000 {
does K1 has more than one pdma controller? No? as I checked..
so, I'd suggest simply naming it as 'pdma' - which clear the confusion
that there will be more than one pdma nodes..

> +				compatible = "spacemit,k1-pdma";
> +				reg = <0x0 0xd4000000 0x0 0x4000>;
..
> +				interrupts = <72>;
for consistency in this dtsi file, I'd suggest moving "interrupts" after "clocks",
or even after "resets"? leave "clocks & resets" together..

> +				clocks = <&syscon_apmu CLK_DMA>;
> +				resets = <&syscon_apmu RESET_DMA>;
> +				dma-channels = <16>;
> +				#dma-cells= <1>;
> +				status = "disabled";
> +			};
> +
>  			uart0: serial@d4017000 {
>  				compatible = "spacemit,k1-uart",
>  					     "intel,xscale-uart";
> 
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
