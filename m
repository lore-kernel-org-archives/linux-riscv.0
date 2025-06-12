Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438B5C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 09:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihXF0IfI4i7sZpG8Fe+1QFQfTTWfshTsAkjJZ2xWaA4=; b=IqoqC6/fe8pbiI
	nZ8usx0MsRKO9mzZzqF956L8tAc5WVuwBZF4bVt8iT6mNQQM5Wrpg/sjHHhItOPavJwL54nJfMPLU
	te2Hd3pppm14DG47AzKdYxkAnhwjTfaw0WhC9/KUBNlTmDfy3e5NHsp0YQBrusBx6kvfYRaz7nR1N
	ylaKGShJYrfXW76I8lhFLNsgOJ0GVMZz+aOUg32OOQEhs2T5AOzrGaVbK+8c8KxCFwBgvfGatXXjj
	5arJg9upBSy6Lnij4Vq7pJInCzfJivlvlXk+JJB+OfEjPJp7Oc53Vv3Ck+JCkxO1F6qxewt41MPFq
	SnMLXHOQPkEwW+Z1fCXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPedE-0000000CsPc-2hic;
	Thu, 12 Jun 2025 09:54:00 +0000
Received: from relay16.mail.gandi.net ([217.70.178.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdR4-0000000CeCW-0LoU
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 08:37:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB3AB4386A;
	Thu, 12 Jun 2025 08:37:15 +0000 (UTC)
Message-ID: <92faa45d-0f3a-4bb6-afae-180c2b28fb65@ghiti.fr>
Date: Thu, 12 Jun 2025 10:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
To: Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Guodong Xu <guodong@riscstar.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
References: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddugeeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephffhuddtveegleeggeefledtudfhudelvdetudfhgeffffeigffgkeethfejudejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepughlrghnsehgvghnthhoohdrohhrghdprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihs
 ehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepghhuohguohhnghesrhhishgtshhtrghrrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_013722_266834_30C65FEA 
X-CRM114-Status: GOOD (  15.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Yixun,

On 6/11/25 16:56, Yixun Lan wrote:
> Changes to defconfig should be always updated via 'make
> savedefconfig', run this command to make it aligned again.
>
> This will ease the effort of reviewing changes of defconfig
> in the future.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Update PDMA config bring in unnecessary changes[1], let's fix
> it by run savedefconfig first.


It would be easier if this patch was part of the PDMA series since the 
last patch will depend on it: @Guodong can you integrate this patch to 
your next revision of your patchset?

Thanks,

Alex


>
> This patch is based on top of tag 6.16-rc1.
>
> Link: https://lore.kernel.org/all/20250611134859-GYA125008@gentoo/ [1]
> ---
>   arch/riscv/configs/defconfig | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index fe8bd8afb4183ce871020fb2992a21a13bccbc87..37c98c0f98ffc0ee9d021e4d07aa37a27d342f7a 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -134,6 +134,7 @@ CONFIG_MACB=y
>   CONFIG_E1000E=y
>   CONFIG_R8169=y
>   CONFIG_STMMAC_ETH=m
> +CONFIG_DWMAC_THEAD=m
>   CONFIG_MICREL_PHY=y
>   CONFIG_MICROSEMI_PHY=y
>   CONFIG_MOTORCOMM_PHY=y
> @@ -151,7 +152,6 @@ CONFIG_HW_RANDOM_JH7110=m
>   CONFIG_I2C=y
>   CONFIG_I2C_CHARDEV=m
>   CONFIG_I2C_DESIGNWARE_CORE=y
> -CONFIG_I2C_DESIGNWARE_PLATFORM=y
>   CONFIG_I2C_MV64XXX=m
>   CONFIG_SPI=y
>   CONFIG_SPI_CADENCE_QUADSPI=m
> @@ -159,11 +159,11 @@ CONFIG_SPI_PL022=m
>   CONFIG_SPI_SIFIVE=y
>   CONFIG_SPI_SUN6I=y
>   # CONFIG_PTP_1588_CLOCK is not set
> +CONFIG_PINCTRL_TH1520=y
>   CONFIG_PINCTRL_SOPHGO_CV1800B=y
>   CONFIG_PINCTRL_SOPHGO_CV1812H=y
>   CONFIG_PINCTRL_SOPHGO_SG2000=y
>   CONFIG_PINCTRL_SOPHGO_SG2002=y
> -CONFIG_PINCTRL_TH1520=y
>   CONFIG_GPIO_DWAPB=y
>   CONFIG_GPIO_SIFIVE=y
>   CONFIG_GPIO_SPACEMIT_K1=y
> @@ -240,7 +240,6 @@ CONFIG_RTC_DRV_SUN6I=y
>   CONFIG_DMADEVICES=y
>   CONFIG_DMA_SUN6I=m
>   CONFIG_DW_AXI_DMAC=y
> -CONFIG_DWMAC_THEAD=m
>   CONFIG_VIRTIO_PCI=y
>   CONFIG_VIRTIO_BALLOON=y
>   CONFIG_VIRTIO_INPUT=y
>
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250611-01-riscv-defconfig-7f90f73d283d
>
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
