Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6747C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 14:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usCHXQLpxBYsHULwQTsVXRMfRbJ8DHMx5y3EQc4+IRk=; b=L3IPbU4OnuJjoc
	8S+lhfFOoRZ/q1yVnll94AwGgIpkTePqEnFPzLA+fgDFO1oLVgawJVp7IAGiR3RVTQfwRtuuO+Y2F
	f1EJ5MVlgrH6FgcIc4MaQfAAETtZ6TNJWPfV/DxQcstMBqVbykcmJCQVBY4WU3CIj+Pqrdd7QtnSL
	qiips1ZN10Qt1bioTg2FAL5H8iH4MlPWzsT0REY61zgtE0bju3cu3OsiBn8XBw6p80h0LnGdyiRkl
	b3PNcDVmj8BSA2AyG4ROGnQXojggszR98OW9wvuM8InR8NAKH7qkjqA7cyC9ngy5TGLYkW5bH/g8x
	wRfoOneFARLgNt9nnTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0IM-00000000C49-0Sod;
	Thu, 25 Jan 2024 14:01:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0IK-00000000C3r-26Pd
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=76xjsmxmQbdBwchp0jfcWudwaTgPNpDqLsO2MPqIimM=; b=hZmweFtKURbtcul8wjVDei2Jmp
	joBW7Uc/5JyCBBIuItAoSPh9XMgC1ek3spTb5UDbaur39GilZWBeiNZmgRbhcUQ6+aG8tjut0K1M7
	xik3ZxiXLJFCMZRXW5DR1vpPyDQhmOc5N5UVINuo++MlZz6+hlLgtp2TIKKI92HRN/RBMiKjtbL4I
	oCKIXgvfEgYb2fCQM+CF9bkfK2MuSkBynvUdEI+1uYXzgFG09G9uFsOztxKCNaJEXyR6Fb+rlkBUz
	fHlZomjSQho5/fI7wKXmq99An+QOtwY9BEWojvot84HEAZXOAB9b462yRQPiaxpxvHdz605VLbAA8
	lrkRMF+A==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSxFI-000000054nC-0VTe
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 10:46:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSxD3-0006Mj-Pz; Thu, 25 Jan 2024 11:43:49 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSxCz-002GMP-RI; Thu, 25 Jan 2024 11:43:45 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSxCz-0005of-2V;
	Thu, 25 Jan 2024 11:43:45 +0100
Message-ID: <bf30a97b4c39e5c606583783058ea12520c1146b.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/4] reset: sophgo: add SG2042 reset generator driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com,  conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com,  paul.walmsley@sifive.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,  haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org,  jszhang@kernel.org,
 inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Date: Thu, 25 Jan 2024 11:43:45 +0100
In-Reply-To: <34650036ea5f1c500da54c67c3a67b91c4419399.1706161530.git.unicorn_wang@outlook.com>
References: <cover.1706161530.git.unicorn_wang@outlook.com>
	 <34650036ea5f1c500da54c67c3a67b91c4419399.1706161530.git.unicorn_wang@outlook.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_104608_242422_F4E1D83D 
X-CRM114-Status: GOOD (  14.06  )
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

On Do, 2024-01-25 at 14:11 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Reuse reset-simple driver for the Sophgo SG2042 reset generator.

Subject prefix should be "reset: simple: "

> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  drivers/reset/Kconfig        |  1 +
>  drivers/reset/reset-simple.c |  2 ++
>  drivers/reset/sophgo/Kconfig | 10 ++++++++++
>  3 files changed, 13 insertions(+)
>  create mode 100644 drivers/reset/sophgo/Kconfig
> 
[...]
> diff --git a/drivers/reset/sophgo/Kconfig b/drivers/reset/sophgo/Kconfig
> new file mode 100644
> index 000000000000..9ad96e49e1dd
> --- /dev/null
> +++ b/drivers/reset/sophgo/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config RESET_SOPHGO_SG2042
> +	bool "Sophgo SG2042 Reset Driver"
> +	depends on ARCH_SOPHGO || COMPILE_TEST
> +	select RESET_SIMPLE
> +	default ARCH_SOPHGO
> +	help
> +	  This enables the reset controller driver for the Sophgo SG2042 SoC.
> +

Drop the Kconfig, just add a default y if ARCH_SOPHGO to RESET_SIMPLE.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
