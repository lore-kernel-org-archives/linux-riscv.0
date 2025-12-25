Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6C9E7AD42
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/s1trNk/3UFz29XkotfRFEndBBnq7K6clM4Wcklr1PE=; b=LZQZeg8KaSP8Np
	Y+1riWBcS0jnaK9l0sZ2mVlP7WDKeagt5+zQjoxYhb+IBtK/35bmZ1KTXgdNIpAkWkWhKMAxblQ4P
	/UfmL623K69FnraMmlkfiAmyzBUHjlbf+B4L016puAQnSbrXEDjyMNF0u9LH50x/jsnUN+78mBpoy
	F8axHqA0I+VcZeq1ya3bxFEdIprgXhbhseGptL+bwuQOdBokHFQRsn9HFzpLXcxFu4OQM1yCKnfD9
	R4G7RR4P8jq2NEQ/QeDDlsohN/VTEg1GGTxj2yBGPcP75R3Vo9KdrEvGY7oUPV/Vp2B9Dpejo5l0Y
	sdWQkHlWRjmTyHIKLQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhOa-00000000GSk-0a5U;
	Thu, 25 Dec 2025 09:12:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhOY-00000000GSK-0Y0d;
	Thu, 25 Dec 2025 09:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E88160137;
	Thu, 25 Dec 2025 09:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA21C4CEF1;
	Thu, 25 Dec 2025 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653948;
	bh=SEQCeeP0cpyhofiDVSZjIFDJcEgZ0uLCgntShMSc7h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UPONcwIAAX5DIiKDnx2xaHE1tv86977WxFaZrBXShqnNlOTNclXbIxPRxv+IZEyj4
	 jDHVFu0t9yYvro2bqqLFCGf472FTKqI16bjChFRVQ6hOdWoOMmkDuBvvc/jL8ek9NZ
	 8GZNFha6WCaAg+F8KzoS1d1TaGjopUx8p0lSKF6Y+sdvHxv1xCJQOLGTBJF0r2rIY1
	 RVWReCgrdVSrMTEO2lnKwEF9N89PKRnjtKkTvpXJvlWa3WYlNIOGn02KH8fjqHMVdh
	 s1lbJKmo3+diV2yJq/iR94d96LFz5816/CNlXctpkJy30mxDNIoDxwrXpny8RgAACV
	 JvTXQSB8K8a/A==
Date: Thu, 25 Dec 2025 10:12:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com, 
	conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com, 
	davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io, 
	gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech, 
	kever.yang@rock-chips.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux@armlinux.org.uk, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org, neil.armstrong@linaro.org, 
	palmer@dabbelt.com, pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 4/5] virt: add Bao I/O dispatcher driver
Message-ID: <20251225-friendly-raptor-of-lightning-fbafc4@quoll>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-5-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251224135217.25350-5-joaopeixoto@osyx.tech>
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

On Wed, Dec 24, 2025 at 01:52:16PM +0000, joaopeixoto@osyx.tech wrote:
> +static const struct of_device_id bao_io_dispatcher_driver_dt_ids[] = {
> +	{ .compatible = "bao,io-dispatcher" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, bao_io_dispatcher_driver_dt_ids);
> +
> +static struct platform_driver bao_io_dispatcher_driver = {
> +	.probe = bao_io_dispatcher_driver_register,
> +	.remove = bao_io_dispatcher_driver_unregister,
> +	.driver = {
> +		   .name = "bao-io-dispatcher",
> +		   .of_match_table =
> +		   of_match_ptr(bao_io_dispatcher_driver_dt_ids),

You have warnings here. Do extensive building of your code before
sending.

> +		   .owner = THIS_MODULE,

NAK

Don't send us 12-year-old vendor code. Tools already report this,
so you just did not run them...

Nothing here is evn formatted correctly...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
