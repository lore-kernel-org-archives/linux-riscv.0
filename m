Return-Path: <SRS0=F/sc=EY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BDCC56202
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 01:42:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C7D208CA
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 01:42:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="22U9cfrN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtqXQbqP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5C7D208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aFHSZ0UoAZim4Hntj+xnI/WSeDbXsUsCm4Iw0LyMlhU=; b=22U9cfrN1n1rZt9OR9A/JckOe
	WEIBy81FDo8GI31KE95U8kFCvFEVGLCnSsCRaetFYEBynAc5EKo3UR7UShA0Lv+f851buR42M5qTN
	YL6jwVr5Qm/Y6dbdR9l0yZKnox6kMQOz5ZXk+KeoyNYIEnFvYM9jHh3lRKMypQv/VOEJ6R7bNshRk
	QfPpSg5rOHl39DNw3NDictVtNNmHU0sFvpNHDBVOYUppGNEjSR7WsFLrAfZb95A5tpax3iP0UHzs8
	iVHmTGJ5vYyo+4B6bfGWUtulmnuNe5YJrjVXiHNhG19Pd1uHD2KF5nAVbn2Qe1QfWNnHZRpAduFvU
	owx6O2Wng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfCUI-0001vu-Fb; Wed, 18 Nov 2020 01:42:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfCUF-0001va-H6
 for linux-riscv@lists.infradead.org; Wed, 18 Nov 2020 01:42:20 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC857208CA;
 Wed, 18 Nov 2020 01:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605663737;
 bh=8vdUHJx6QdVqwIXSt3q/abygMXVBbcnI4fiQGK9hEdw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=GtqXQbqPMuvnbSVNd1sQInUwGh1w1X5+nzaxp6jpkMgvakpVNlyAW1EeyoYl0MNva
 HZtisoXZkTojQvVcb3Ysi9K8vU65WHUiosAPtKIOt5S+QCLUQMR4v0stApNpR28Dig
 obtwuV4SNepeHzLG05W4HkygKXD8NVmpZL+5dBRg=
MIME-Version: 1.0
In-Reply-To: <20201117160306.21760-1-info@metux.net>
References: <20201117160306.21760-1-info@metux.net>
Subject: Re: [PATCH] (v2) drivers: clk: make gpio-gated clock support optional
From: Stephen Boyd <sboyd@kernel.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2020 17:42:15 -0800
Message-ID: <160566373556.60232.14730664139007414312@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_204219_746022_6DC5F74C 
X-CRM114-Status: GOOD (  10.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: matthias.bgg@gmail.com, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Enrico Weigelt, metux IT consult (2020-11-17 08:03:06)
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c715d4681a0b..99e0188a15be 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -38,6 +38,14 @@ menuconfig COMMON_CLK
>  
>  if COMMON_CLK
>  
> +config COMMON_CLK_GPIO
> +       tristate "GPIO gated clock support"
> +       default y

Maybe 'default GPIOLIB'?

> +       select gpiolib

Does lowercase work here?

> +       help
> +         Supports gpio gated clocks, which can be enabled/disabled via
> +         gpio output.
> +
>  config COMMON_CLK_WM831X
>         tristate "Clock driver for WM831x/2x PMICs"
>         depends on MFD_WM831X

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
