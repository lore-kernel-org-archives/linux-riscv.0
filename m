Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552BDC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbZQ7MjvT7CfNr67y9XZcaOkBRvFbjCyncTbQx8eyB0=; b=fn7tW4bPu5f19d
	zO1dtPPakGu4+b50n+2ZZcUOHKCEa3x1sUtYmH8qFrHHM4wgNyWCQhbqtpgw9Y2GbUgdPxI0T/HBB
	Ol8hI3m8m6IXzatWH7sz56zCa28RFz7dPXpKn9E2ubeFn5iuwLEHvftx/wsh72R1PGdtDc/rnopt9
	UmBIFt18jNvGy7e93elOrmkltDidBED5QjJJS+BaOj8bVfWzTyvxqn6yzckCxXJCPqBU+xTKr7Mnz
	j3506vfcTGsNQ7tVWEUxkvUivfrb/x/8o+utwd4hGMysBZeVAcKs6eylnyawixdKHxPSALs3pssD4
	VReFFnujp/rgjH5rd3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWNK-00F0tf-0P;
	Wed, 27 Dec 2023 16:03:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIWNH-00F0t8-2E
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 16:03:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 47619B80D10;
	Wed, 27 Dec 2023 16:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0FFC433C8;
	Wed, 27 Dec 2023 16:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703692993;
	bh=w4l0ziBQD5BKenyLSX5hoKKoL4xt66ApvAEEBRXc3BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OabpMPYLkty7z4VERKGYdiml7+nRnd1s2Oq6cxbcv33SPQHECsKINff03ehGKjEZe
	 F9TAq5gUZRvW3GG7BvGQa8AKOjce5mnk6a0KsUB8Ppx5ey9IyCuvPXMf5InI0XgfTA
	 9+NQ2+SQz/RZITHfcQymP1rQBnVraKxMENCdz8qdXlmStrZ3Mt3NGkH98/2to87PyP
	 GjzueFKy6C3PTpvvg3yzeSDsK2vEFGJMoq94x0cn7CZwE8w8fZ15zpSo1+x+AmUcdx
	 DAvbYa4joxMw9CRw1RvZYyA/UE9esIneiJjMoxgDduFP3zcdHCtKFSUVG0hsNaIy2K
	 l7xreXFt49TtA==
Date: Wed, 27 Dec 2023 17:03:05 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Message-ID: <ZYxKuVs6Pzu7D7lj@lpieralisi>
References: <20231214072839.2367-1-minda.chen@starfivetech.com>
 <20231214072839.2367-20-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214072839.2367-20-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_080316_030448_61B82643 
X-CRM114-Status: GOOD (  18.69  )
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
> ---
>  drivers/pci/pci.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

This needs Bjorn's ack.

Thanks,
Lorenzo

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
