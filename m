Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECEEEDF145
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 10:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osJNHuhgbY9D1OVmPUD9t0InH+DxjPOe3BhBiVbcEME=; b=qbOtY0UiSIViih
	hm8BNC+rHrby89jpPuPXcnCShPSi7nt9nmW2EPmSeBWT/TrFdWWCCiim+kEalu2ppEZKVN/24hGNS
	T6OMj5mMfANMY9Gb18X2VzH+ltzzCX5KeCLhKO5HwloDTyDr/yRqyunqch0+zzYT7B3fGYE+t1Hdg
	6gxFdmwjtpaBuJU8HN2Hi0R2AKCm3GCJP7mI0NfIv5lZ3XezKNS7g10h5HS4J9aj0hR08U3pGHiDc
	Ug9o5HHywkuHU3HNi8c9+x/Gm7uklYM567v5GeMCoBSdV4fKpn7YU9BbVwhfkviadfpsYb1Ig5zx2
	jiHbDMqbAKzdaDjU5s8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqq0y-00000003HuP-02O3;
	Fri, 13 Feb 2026 10:03:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqq0v-00000003Htu-1qaD
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 10:03:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6BDF43CBD;
	Fri, 13 Feb 2026 10:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD2AC16AAE;
	Fri, 13 Feb 2026 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770976984;
	bh=3aEbedt9KqMlW+VjNiPv5T8wSDV+Ls+DMvJhNjjdjxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JP6s900sXDn7dvVOnrhRAvNNM8Qzlm52t6tSiJTkKeJxviMsDefAX3aVb6cyMK+/I
	 UiM2BsC/nHzPraX86v5IeecNbEPVEL0rChKTuZxeVjb80hNOM68LcsboXaRXZsCuxY
	 gY7TFeYfU9tDaQfTOAZ8lSvdyxM075NfpmJsZbpfCYYlOWu7Li8GoJDsLIs9gnuIdJ
	 yxsOABTs6B1Pte1OAObEUJLeMNJ9MB+r94Tb350YUPowbGy6+rGVujgStrah/88GqT
	 RaXKgo0xJSKk+XipkYeP9OvRbZoqD4ui+L2sAvfC6jI901g17GUWNHXq0eaeTHSSFY
	 ep7iuRxmiGTiA==
Message-ID: <3387b1bd-c945-4b9d-915a-baf9412f656f@kernel.org>
Date: Fri, 13 Feb 2026 11:02:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] LRW UART: serial: add driver for the LRW UART
To: LiuQingtao <qtliu@mail.ustc.edu.cn>, gregkh@linuxfoundation.org
Cc: jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 bjorn.andersson@oss.qualcomm.com, marex@nabladev.com, dev@kael-k.io,
 mani@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
 liu.wenhong35@zte.com.cn, liu.qingtao2@zte.com.cn, hu.yuye@zte.com.cn,
 dai.hualiang@zte.com.cn, deng.weixian@zte.com.cn, jia.yunxiang@zte.com.cn,
 bai.lu5@zte.com.cn, yang.susheng@zte.com.cn, shen.lin1@zte.com.cn,
 tan.hu@zte.com.cn, zuo.jiang@zte.com.cn
References: <20260213093334.9217-1-qtliu@mail.ustc.edu.cn>
 <20260213093334.9217-3-qtliu@mail.ustc.edu.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260213093334.9217-3-qtliu@mail.ustc.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_020305_527616_69FDA211 
X-CRM114-Status: GOOD (  18.65  )
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

On 13/02/2026 10:33, LiuQingtao wrote:
> From: Wenhong Liu <liu.wenhong35@zte.com.cn>
> 
> This commit introduces a serial driver for the LRW UART controller


Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> 
> Key features implemented:
> - Support for FIFO mode (16-byte depth)
> - Baud rate configuration
> - Standard asynchronous communication formats:
>   * Data bits: 5, 6, 7, 8, 9 bits
>   * Parity: odd, even, fixed, none
>   * Stop bits: 1 or 2 bits
> - Hardware flow control (RTS/CTS)
> - Multiple interrupt reporting mechanisms
> 
> Signed-off-by: Wenhong Liu <liu.wenhong35@zte.com.cn>
> Signed-off-by: Qingtao Liu <liu.qingtao2@zte.com.cn>

Mismatched DCO/SoB.

Run checkpatch on your code.

> ---
>  MAINTAINERS                      |    3 +
>  drivers/tty/serial/Kconfig       |   33 +
>  drivers/tty/serial/Makefile      |    1 +
>  drivers/tty/serial/lrw_uart.c    | 2822 ++++++++++++++++++++++++++++++
>  include/uapi/linux/serial_core.h |    3 +
>  5 files changed, 2862 insertions(+)
>  create mode 100644 drivers/tty/serial/lrw_uart.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ad6acbe24544..a97fbd205f75 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15041,6 +15041,9 @@ R:	Qingtao Liu <liu.qingtao2@zte.com.cn>
>  L:	linux-serial@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/serial/lrw,lrw-uart.yaml
> +F:	drivers/tty/serial/Kconfig
> +F:	drivers/tty/serial/Makefile

Why do you claim you maintain these files?

> +F:	drivers/tty/serial/lrw_uart.c
>  


...


> +
> +static int lrw_uart_probe(struct platform_device *pdev)
> +{
> +	struct lrw_uart_port *sup;
> +	struct resource *r;
> +	int portnr, ret;
> +	unsigned int clk;
> +	unsigned int baudrate;
> +
> +	/*
> +	 * Check the mandatory baud rate parameter in the DT node early
> +	 * so that we can easily exit with the error.
> +	 */
> +	if (pdev->dev.of_node) {
> +		struct device_node *np = pdev->dev.of_node;
> +
> +		ret = of_property_read_u32(np, "current-speed", &baudrate);

Test your code/DTS - there is no such property allowed and you would see
warnings on DTS.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
