Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0954F105A576
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YeuLIuD5f+oNNUnpfPQ5kgubq4pky40ISkIw1Dssfs=; b=Sdxd9yJY4OqWYA
	x8uhKhJh9tpwg2rLckSvCAJcMwxu8yCNvXkvA+g9+w0p7ALIS9m0+hiXmuxLjPMkmkIGOzCLW16cw
	jpRJr6fZhfECGawBw1h23lJaM06pIFMaKTltXNJgrzGLx6ssokrynDVuRxicDGSFFYcxX3e1ff3fP
	4qnHGLmvTmBGPXlRsfLKEIGsh4pP/xjXXBeBQb32lHdwJNLcDJd4G/n5CE+7nBI2hLNOZLeTxJlau
	6g1xYXiyXKf8D/MvJcdXLwKI5chJqfnwQJqjduBUZmg1eaJui+q5l5qkvhhaPCX7zwUoAIUnTIp62
	tmeUVntpO6zfpy8VVFJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0e71-0000000Dw5g-0ftg;
	Thu, 12 Mar 2026 11:21:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0e6y-0000000Dw5J-3jQF
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 11:21:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38725404B1;
	Thu, 12 Mar 2026 11:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C24C4CEF7;
	Thu, 12 Mar 2026 11:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773314512;
	bh=ka1+40NCf1V8bKWsuV29BMn3rQttD0Wiz0TTE+RnufY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tiQdmWnWhE5sHW3j9Rurh0Srzd7t3zPDVmlikV8bdHLF76o/B6SHwD5wMnpnIrbKm
	 XbrgqSscDiCC22hLhXR1EHpF0JBC1MTpa+Ql2kNOxO7FGCCAYM0IgPCOaTEMaaATFA
	 eJb1cyO8ny6vmvYe+nEcnQalde1FvD2Hp6Ijz+jOR1rk/lDXG5ac7jv3DMq1z26eW0
	 JO1oSccXjF1Ssr5ulQVc+Q0Mz1ngfOgbOqv1yE/c7vw/5zJlenNWI4IYq04rN77Zml
	 aedgEwlDi4+jHqEQXo02g4am9nr3Bijy/ZHxEQJ/QqDJqGp2Jmw4gE6jorH+kwqI/w
	 qOHzvuJ4no4Ww==
Date: Thu, 12 Mar 2026 19:21:49 +0800
From: Yixun Lan <dlan@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio/pinctrl: spacemit: Add GPIO pin configuration
 support for K1
Message-ID: <20260312112149-GKG302167@kernel.org>
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_042152_974048_B7A75DE2 
X-CRM114-Status: GOOD (  14.20  )
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

Hi Junhui, 

On 16:42 Thu 12 Mar     , Junhui Liu wrote:
> This add GPIO pin configuration support for the Spacemit K1 SoC. Some
> use cases require configuring pin attributes like pull-up/down when using
> GPIO lines.
> 
> A practical example is the SD card detection pin on the Banana Pi BPI-F3
> board. Since it lacks an external pull-up circuit, the pin must be
> configured with an internal pull-up to function correctly. Such
> configurations can be specified directly in the devicetree:
> 
>     cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> 
> To address this, add the set_config() callback to the gpio-spacemit-k1
> driver to enable pin configuration through pinctrl, and modify the
> pinctrl driver to return -ENOTSUPP instead of -EINVAL for unsupported
> parameters, allowing the GPIO subsystem to gracefully handle them.
> 
Thanks for working on this, for the series

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
> Junhui Liu (2):
>       pinctrl: spacemit: return -ENOTSUPP for unsupported pin configurations
>       gpio: spacemit-k1: Add set_config callback support
> 
>  drivers/gpio/gpio-spacemit-k1.c       |  1 +
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 21 ++++++++++++---------
>  2 files changed, 13 insertions(+), 9 deletions(-)
> ---
> base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
> change-id: 20260312-k1-gpio-set-config-f0873e92ebac
> 
> Best regards,
> -- 
> Junhui Liu <junhui.liu@pigmoral.tech>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
