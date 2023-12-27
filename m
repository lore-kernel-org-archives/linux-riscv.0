Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD228C46CD4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 19:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lPnLPEO2ootKaCXAiVWmHMZ5Pw1h2v3dSRRsWsR9+Es=; b=yXkQo1tt6H3Coq
	y2+ch3g3bOIAYcoWYJUIWeKwJfd8I0A/zBORT6+LePLbjVdDNNq/h7M/T1mMk1UX8uXCZDqvUKLA9
	C3xLw0yJKwrdAbTSnrtd9p8w3jpSk2Yiq+CB6R3XJpQ40pQ9TYczGEC2vSpccReoVdFC+f/QOIfPg
	InNkAG7ExAbjkO0zn0Op1vNUm5yPhAXXXmNQC5WMTNM4cN9Kh0kfODe8tQnVS60ukTrkdtUEjXRoL
	e05/8/dy4psXw/VJ/wzy/2eRrr+Ge3Ryrxqt12G6Nof0aZ3x4CIjFVANOolY/+uSs24D6YZoEV8By
	UyvdwkrLcqScbcV2KlEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIZGa-00FMD0-1s;
	Wed, 27 Dec 2023 19:08:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIZGX-00FMA6-0W
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 19:08:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 52899CE12F3;
	Wed, 27 Dec 2023 19:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4118FC433C7;
	Wed, 27 Dec 2023 19:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703704095;
	bh=ATu15DdJu3KphR7LFYKeEXCMXYokrV8F6bk6Aa0fZc4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=F5TSRvAADaGRV2HGx2D8sugO90Z38C23ezQdcbj1FEmLF7yydZRoQ7gLUjrUxqJXS
	 YlMF0p4wMPtmIXqNH3X52dm5iFwSujhlJ0qk6m6/UFaeax70WR+jE2CJq4XioV28fT
	 HTWpu9uvSn/bZMt1tn2YKYqmV2jHOCyh96lm/qfaEZwRFsfTkHqnpta//0R+3eJrJT
	 v7mZqkGHrgCW0rov70FInyDP90P3Yn/S5dPWJ+531cfLshH4RdInaEKHfqqUxqUdXo
	 e74d5UuX9nTFcm8ZrltAKVoBrXYubi1XgzT7IZvQfYConmO1R9m1hcXTO3Z1/1uOvO
	 41IlJFs3gH6ow==
Date: Wed, 27 Dec 2023 13:08:13 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v13 19/21] PCI: Add PCIE_RESET_CONFIG_DEVICE_WAIT_MS
 waiting time value
Message-ID: <20231227190813.GA1508471@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214072839.2367-20-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_110829_652797_CFAAEF67 
X-CRM114-Status: GOOD (  18.84  )
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

On Thu, Dec 14, 2023 at 03:28:37PM +0800, Minda Chen wrote:
> From: Kevin Xie <kevin.xie@starfivetech.com>
> 
> Add the PCIE_RESET_CONFIG_DEVICE_WAIT_MS macro to define the minimum
> waiting time between exit from a conventional reset and sending the
> first configuration request to the device.
> 
> As described in PCI base specification r6.0, section 6.6.1 <Conventional
> Reset>, there are two different use cases of the value:
> 
>    - "With a Downstream Port that does not support Link speeds greater
>      than 5.0 GT/s, software must wait a minimum of 100 ms following exit
>      from a Conventional Reset before sending a Configuration Request to
>      the device immediately below that Port."
> 
>    - "With a Downstream Port that supports Link speeds greater than
>      5.0 GT/s, software must wait a minimum of 100 ms after Link training
>      completes before sending a Configuration Request to the device
>      immediately below that Port."
> 
> Signed-off-by: Kevin Xie <kevin.xie@starfivetech.com>
> Reviewed-by: Mason Huo <mason.huo@starfivetech.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/pci.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 5ecbcf041179..06f1f1eb878c 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -22,6 +22,22 @@
>   */
>  #define PCIE_PME_TO_L2_TIMEOUT_US	10000
>  
> +/*
> + * As described in PCI base specification r6.0, section 6.6.1 <Conventional
> + * Reset>, there are two different use cases of the value:
> + *
> + * - "With a Downstream Port that does not support Link speeds greater
> + *    than 5.0 GT/s, software must wait a minimum of 100 ms following exit
> + *    from a Conventional Reset before sending a Configuration Request to
> + *    the device immediately below that Port."
> + *
> + * - "With a Downstream Port that supports Link speeds greater than
> + *    5.0 GT/s, software must wait a minimum of 100 ms after Link training
> + *    completes before sending a Configuration Request to the device
> + *    immediately below that Port."
> + */
> +#define PCIE_RESET_CONFIG_DEVICE_WAIT_MS	100
> +
>  extern const unsigned char pcie_link_speed[];
>  extern bool pci_early_dump;
>  
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
