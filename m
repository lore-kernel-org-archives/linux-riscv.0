Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1934CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 01:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gt7NLWwOY5YXyj1ZcPAyUL60lwzvElV0fQiN/IB6SIQ=; b=4CBcbvYngqhsjT
	i3nJ8cSq4GzLBu3K8zfxPs6NWei5OiIpKuVGddRgszNO+avvowA2PrGNkVvFW9Pz+2JKATvFBy0/j
	Cb3PivnMVmrmizu+9vnjjbjnXduAaHID1jxrsgZTSw85yU59cOkjBLPrR7VUqS9kjZ1x4p0qcAm95
	ApbpZz0p5zkp9lO5+w6x7t/I8VwbETa7MIKTsd3A84V73N9nMl8g70F6Cfy1kfqR1+RFHyiGtIxax
	v6EPeXfqbwZ2Wkw8dd/2erpezN2Pr+p1OEoA9JNq9/uNT7L7khu37k/e33qlS/7EoE0B2kTtbBfkC
	ZdIJ33a7o3BOEah6JV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYo1-0000000F5aA-2whK;
	Tue, 28 Oct 2025 01:47:25 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYny-0000000F5ZR-2IBO
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 01:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761616004;
	bh=ZZGiSuhveC35IDEiLoprkDlOVwgiu6jWGoH+rPsLx3c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=fRrVoPIs29UqTD0m3W7X56lgTJVygEyMciveva6ZK7qLlDlv+u9LNMQhkpu8IYult
	 cCBRkTBMQAaZxPko4cRncE/y3sPftOlL8w+tJXZnaYxlKG5jDzU3/HIrqS1gltW94g
	 xVsDdlE/6UQ8uZ+CCA9plMbuiVYnGNvhJKpJLrAI=
X-QQ-mid: esmtpgz16t1761615995t756b5b9f
X-QQ-Originating-IP: 7q80XCy0jGgLRN/KX1RproqfInXomRBfooCh3iM0zPE=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Oct 2025 09:46:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3934101092882309250
EX-QQ-RecipientCnt: 9
Date: Tue, 28 Oct 2025 09:46:33 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>, broonie@kernel.org, dlan@gentoo.org
Cc: p.zabel@pengutronix.de, linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v6 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
Message-ID: <FFC4D2691116C9D4+aQAgeeG28SpSI7YR@kernel.org>
References: <20251027125504.297033-1-elder@riscstar.com>
 <20251027125504.297033-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027125504.297033-3-elder@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NvGGTAUhB2iW18mMlxXY2mDBeJh78WNKTROkTk6L8LQ3hqB4wCe7vAlx
	Iov5PVGTOE8ckjEVZgx023uvmPdFZP8CzSX6DQnnZoUD42iCzQvoJNWebc2kdoWK3uuVXNG
	VukIcw4F3JB4WdP4lGomOfsWjUMLP7aN2mgX/BhnPHY3J38vLk2ddoh8ZI2hkqJSA4fodsi
	SGCCAPxMldj7BKBMBIHHXVrfuaktnMJf7B78VlqXId/1YwyMYJWIV0v21U8LTtqjQLl7szk
	MQrokQ5eSnLNLCamqlaLXhxziB6SYZRqmKcwmaZxoBf8YKc0mzi3bc0Fi+/9rj9fG3JtkxU
	AA2fIXD/yN0gg5qd9SKPkBbpHHrluJMoLMOdcYUVKLsCBcTIBNYTAb4C+fu7HHggvBR7FY7
	0HogkCpIzuT1OpQLjj4IKqMcGlp+pFw+sbHhrlKIXiQ5UjUDwyV6NlypS+tlbbuxHWfmoO4
	FSBXHvIM7E3gw+D5lGCb3YSien6Yf+r8OpUiLgU6LEl53mVDwXj0AblXzcTz28cytCrHA2h
	Y1VvFzjkjpd6VOxYnC1IOW8zadT6JarzrCSjhzFH4ektZOO1S0IWQFJGim1Tg7E4oBw1G8f
	SKWGrggWBNNs9cBvF7Be+rzSiEWPSBkvKU82cG1/PCxOqTWqskQFollBzb3eZsXqS3+Wdqd
	GymwecOeRIzsLELni2fAHUyqPOAzNfADcCsqw4BO8u6/B74eFVS7h3xTlBh7xpFKDwktqHY
	cdvKHHxZ3nP6r6l/phPt6DTBtrYfUvH60ZlnPDNQttpD3wgCfR9W4jStZMQgyq9iH/sKz15
	+51juOmf3YHu6eHEKI5DtvIl0bFOEqa4OebUWYfbfJja8rmlHGsjFnW1XcA8ZecCDQXwrGq
	IioKv/xV1PY0gJHEF5OZnjjxwT0y5X/yDUC/EtaKHqGTZMXeyGw+a6Z7GNPACdenrwyi4pz
	X8UrXdiBhBTAYeBymXTe8X21F0wA61qOVOHCN77XKUuDB4ae4QTFXWzCpc8lsvYKgLTMRJ0
	7of+kZMM7h7HYdNvfk3Z5KF8qHhRJ8rTX6WNs4EZO7FaKUkNRHfVXHgG1FFZc=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_184723_272918_891FF890 
X-CRM114-Status: GOOD (  14.29  )
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

On Mon, Oct 27, 2025 at 07:55:02AM -0500, Alex Elder wrote:
> This patch introduces the driver for the SPI controller found in the
> SpacemiT K1 SoC.  Currently the driver supports master mode only.
> The SPI hardware implements RX and TX FIFOs, 32 entries each, and
> supports both PIO and DMA mode transfers.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/spi/Kconfig           |   9 +
>  drivers/spi/Makefile          |   1 +
>  drivers/spi/spi-spacemit-k1.c | 965 ++++++++++++++++++++++++++++++++++
>  3 files changed, 975 insertions(+)
>  create mode 100644 drivers/spi/spi-spacemit-k1.c
> 
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 4d8f00c850c14..2e933edab1718 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -1071,6 +1071,15 @@ config SPI_SG2044_NOR
>  	  also supporting 3Byte address devices and 4Byte address
>  	  devices.
>  
> +config SPI_SPACEMIT_K1
> +	tristate "K1 SPI Controller"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on OF
> +	imply MMP_PDMA if ARCH_SPACEMIT
> +	default ARCH_SPACEMIT
SPI needs to be a built-in feature?
if not, how about:
default m if ARCH_SPACEMIT

                  - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
