Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3542DCAC59A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QS4pHfzlhBYiwt1FMLzcw7Uw2dmoVd9OGqxEM5iuFZY=; b=RI9jGd/x4MfEkg
	fFGnSS9Zwz+z+ZFD4fi4idy5OUH+3J4yJAA6GwglekfzgrCsUfVbP+CcFQS32CEP61GC7IW1nAHMZ
	9JiYml9/JdW3epgrEWf4ehWMzK9xTYptjS9nGhW5RouBldwPoIlkV41AHWKddll8q623fL++bhDcy
	AfbaUukq8a0wwvj9pFhoXWrpoCoFGVjzwoD1ZJjzggbiKMbPv443Rbq2Tn5rdRqyJ6FGIkRYWhn1s
	nZo8CgIE2BIzvDVFGwiGZqR6v8o51e8bMxSeZsLs16+QM7AuDnbUewPIM9SVkrtADRIY1wEd1r9bd
	bmIKLWTM24XTKHNOLsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9OB-0000000GbgM-1RdR;
	Thu, 18 Sep 2025 07:49:11 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9O8-0000000GbbY-1ZNv
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 07:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758181678;
	bh=yrjO2XRs5IM/Lr/k6cLIhIZx2sFkrnGAyhn5oP54jOw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=mpSPjDIGOfhhr/8wF+WIdD2IwnflsPbnjyBXdJffUzk179MJPzpCbObogamMYCXss
	 Pw5ttBwBw1zFnCxt0Y7mCgHL0wjSqcVx6sIZpIKdy8t2H0EVrAcOcvKqMRbAoldyC+
	 daNeGbvE/VS/p0UdPeb+nML8CCaXMcJ2L+ooFmsE=
X-QQ-mid: esmtpsz18t1758181670te2195bfb
X-QQ-Originating-IP: 2P3awJ/rAckBQ5WJim/2vC85B1eBTLxK95O56RQ2eV8=
Received: from = ( [120.239.196.247])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 18 Sep 2025 15:47:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5320209065315358107
EX-QQ-RecipientCnt: 17
Date: Thu, 18 Sep 2025 15:47:47 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 2/3] spi: spacemit: introduce SpacemiT K1 SPI controller
 driver
Message-ID: <4C1E339412373423+aMu5I4jmngaN0rOy@LT-Guozexi>
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917220724.288127-3-elder@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M3vv73qU6a4ugCzqDFfnm2c0kftPPN2oeSZe4HIiQvcAP5oUjy7P3yxb
	xh34y70MtrJ0Z8JmUPwHeA647kNnsiOCaXXn12jQ0G/NNr9uXGpUjXcp8tyCX1N9NKWx2y6
	WHqQGhruYsPSsTRrHLgkf8CtqI4dqVM06CWBPyrSwRTA8qh0bKOhze8SKug/abUcI2ir6Ek
	U01Nsj7muia5+tir9JG7A/rJ4b0/+SN0HUtH3kjxWVWetK2xqFJNVhJVBWUhwCGY9YfkWRJ
	wZpg1oT8Jw+SbMTeYwIA17KkoOTHaFoHdQq6tRi4fRWgHkaRUZQo4hgimTPDXd8q4RkzDW+
	grEoXuOaUG92bLj3s0+ev70Kzu/XbG/V1b/ZtZ4B6WM8vPCo2MKQuaMYGDqPLAZIoJmMEeg
	P20mq54lQG4jvYOqfSWQ+ILFLTbBeFzQN7BNF+D4zNZZiKQLtiMpefhyzD04uJhSWMjuhf9
	qSGKE3se0/cETsWh16+3bhtR5+u+ECdVNNKmblw9qC5HZprOk/OdVcnwwxo4w2tDYeQ4Mfw
	6RW1RKuXTjQzPHn6+CWdcQ0DbN81Fl8uID37EVrzC0RVUyIBLq9PsrbMH0MiBfZhbR8WOT9
	pFAt7EirZQFyXmbDAHHoFc8rKXtujVxlL5c67rMIUhEe9oLQRd3/0P9kL6Ez+YoTHJL+7C8
	4QjOTA7qEE1+3McTvbihJbEH+AR8nHWsr0EK5ZR/F6tfynhPBZvY3cStWuckK2Gn46ubHtv
	USHEp/e7OxSxP0esQlsf/huT5AS1bRLfPSORfkYOeKODw5Wz9AXijkYROB428v28za6mvt5
	Aqcb3n51yvKq+NN4HiJ6dgOV81QYgkDIpR4A7Aad6x6LxoGqtuzsVDfOv5IGj7X/jwndxo+
	HNiA7zAjeF9vZjo0dSZuqf/lEMWCD9ioi449Bpzg+Aw1Thv/cFfFDys2vegQJa0zeVXpcpf
	2BPY/uWDnuUpUKV+8GmU00MW6fXSGE4P8wN0eO14GvV1vQqqFI+scnyNnZ7x5bdv5q6MoE9
	lzfY/yr7ibyubsUGBCUSQIJ+CafJoxy5SQJtM5ry7OTcakuAb4S5td7F/LAqvrD/IEbjbBJ
	SgcgtjlgTxWgj+mBPNi240=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_004908_763726_D7CB0A67 
X-CRM114-Status: GOOD (  16.48  )
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

On Wed, Sep 17, 2025 at 05:07:22PM -0500, Alex Elder wrote:
> This patch introduces the driver for the SPI controller found in the
> SpacemiT K1 SoC.  Currently the driver supports master mode only.
> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
> supports both PIO and DMA mode transfers.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/spi/Kconfig           |   8 +
>  drivers/spi/Makefile          |   1 +
>  drivers/spi/spi-spacemit-k1.c | 985 ++++++++++++++++++++++++++++++++++
>  3 files changed, 994 insertions(+)
>  create mode 100644 drivers/spi/spi-spacemit-k1.c
> 
> +static void k1_spi_remove(struct platform_device *pdev)
> +{
> +	struct k1_spi_driver_data *drv_data = platform_get_drvdata(pdev);
> +
> +	k1_spi_register_reset(drv_data, false);
> +}
> +
> +static struct platform_driver k1_spi_driver = {
> +	.driver = {
> +		.name	= "k1x-spi",
k1x? iis it from vendor driver? please keep k1-spi

                - Troy

> +		.of_match_table = k1_spi_dt_ids,
> +	},
> +	.probe = k1_spi_probe,
> +	.remove = k1_spi_remove,
> +};
> +
> +module_platform_driver(k1_spi_driver);
> +
> +MODULE_DESCRIPTION("SpacemiT K1 SPI controller driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.48.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
