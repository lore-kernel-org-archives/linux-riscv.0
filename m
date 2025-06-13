Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4620C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 03:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nl4TlJ5dtIoudiBAXFH7cLsMlEFLJ2eJIalkdQTCNyk=; b=SzUDDBtxq9sEdc
	gkfB0LW23uj1WN9K8dR6IrsYIir7P7oGFq5kH22hiKCSMgkCKvEXaFBZyo3BHYIsQPHmAQXtjFwSe
	GlsAq0k6U07tNI/F8YC90K2XDXxbSV0FAmKxJqgu5mQFCEMEBX6fOCTtvEdOrInnw8mRGtbcpFNqf
	iHzzyOHXG8S0SDkgvSx0mDXR0TQWzoC177n+bIL+Qb4lJo3IHVxLWrzDEjPlC/SPHy4lKIuYmVX0t
	XFuRBs8nuKaA5ddB3WJ6QP2coTDslnW9o2OGaRcj6fKkCLB5Z6/2lCohM9dQOPAK58lY1pxvBo+ir
	CmLjVIltlLOXLGpRvRHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPul8-0000000FCb2-1bcU;
	Fri, 13 Jun 2025 03:07:14 +0000
Received: from kuriko.dram.page ([65.108.252.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPul5-0000000FCaE-1fHJ
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 03:07:12 +0000
Message-ID: <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dram.page; s=mail;
	t=1749784027; bh=cA+IcBU1gia9Td2DjCXd/ukireOfXEXdOVKdoG1N2b8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AQSmdXxdX0T+5qO8FcZSVfEVbNkoeROXd5dG+BsEBuS+BEYtoDnVBsbFPRTxiCUXg
	 BVx7OXq9YmitSfaTIx5PtVZPSuQ1fOVirJfwl1eIwT4uypvHc5MqeHyOIiw9pnxrb0
	 CbSrJQuRXmzHWeJdhPwA00Zqmhu/QawSrHUWxh6w=
Date: Fri, 13 Jun 2025 11:06:43 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 5/8] riscv: dts: spacemit: Add dma bus and PDMA node for
 K1 SoC
To: Guodong Xu <guodong@riscstar.com>, vkoul@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com,
 emil.renner.berthing@canonical.com, inochiama@gmail.com,
 geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com,
 joel@jms.id.au, duje.mihanovic@skole.hr, Ze Huang <huangze@whut.edu.cn>
Cc: elder@riscstar.com, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250611125723.181711-1-guodong@riscstar.com>
 <20250611125723.181711-6-guodong@riscstar.com>
Content-Language: en-US
From: Vivian Wang <uwu@dram.page>
In-Reply-To: <20250611125723.181711-6-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_200711_607816_CA84F9CF 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

On 6/11/25 20:57, Guodong Xu wrote:
> <snip>
>
> -			status = "disabled";
> +		dma_bus: bus@4 {
> +			compatible = "simple-bus";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
> +				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
> +			ranges;
>  		};

Can the addition of dma_bus and movement of nodes under it be extracted
into a separate patch, and ideally, taken up by Yixun Lan without going
through dmaengine? Not specifically "dram_range4", but all of these
translations affects many devices on the SoC, including ethernet and
USB3. See:

https://lore.kernel.org/all/20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn/
https://lore.kernel.org/all/20250613-net-k1-emac-v1-0-cc6f9e510667@iscas.ac.cn/

(I haven't put eth{0,1} under dma_bus5 because in 6.16-rc1 there is
none, but ideally we should fix this.)

DMA address translation does not depend on PDMA. It would be best if we
get all the possible dma-ranges buses handled in one place, instead of
everyone moving nodes around.

@Ze Huang: This affects your "MBUS" changes as well. Please take a look,
thanks.

>  
>  		gpio: gpio@d4019000 {
> @@ -792,3 +693,124 @@ pwm19: pwm@d4022c00 {
>  		};
>  	};
>  };
> +
> +&dma_bus {
>
> <snip>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
