Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40168C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 23:22:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EFEC21479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 23:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YmLXjmVY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="evhYXQ5f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EFEC21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsMYfqy0AdIBto/JFNmsuxVv/zyBNFYMqY2zbnBPzYE=; b=YmLXjmVYRyDMf5
	PLa/y8krepTG4xha21pcwpNA2seC8V7sn9Ej8v9bYQ27Vf8RSAe+/b3W8gTODdLrNsX8lAjE1uu88
	qR4yN2iQP9l36hNLL+idBY6nwhBSMsX47Niop41LPfv64QlZm3F2eObk5pUsPeF/7XLvjkaLHsosE
	sy8rw1tejuxMTt6M+tecmhJZSAOJ+8zNNA6sqZV+uh5CGRFbitxOVPexuz8H0an1kvfKtLv6xcFjU
	vPulPOcp6dW2OFGYBWdt5Z8aLWYApVRx4cpfKGvVDSDe0MoBmeA+JByJBxpEGjtYykVc5RZvjH33H
	AzmRsCPXz79WsGbA+Pow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHGMZ-0003eD-1B; Thu, 18 Apr 2019 23:22:39 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHGMV-0003di-N9
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 23:22:38 +0000
Received: by mail-pf1-x444.google.com with SMTP id e24so1757428pfi.12
 for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2019 16:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=FVLlsVBKPfRjq0jz3LI4f04+gYbfn8cXwIMogPX32xQ=;
 b=evhYXQ5fBqxSR4sehMjQd7L5X9P3J7KRJIuRUk5gxs8gUehY7LtsDSRdSg5eP/qF4A
 HPGhSefwEF6AiA6g5y+nZ2LgwxbPS28plivV+DfnvKqfjU1ysjurFK0+B/fD75dwYsrr
 hyLP9secffcdXrJNb/ON43yVUHnIRVttxsMBE3qd/dKLYPoMaVaxSesO0perhH9CyMHJ
 8K8caq6gwG9vK7t8x8ZPisWMd8h+eXJHPyl+76ssye8LpqnlVeNZHvZFjq1Tw5VD5O/F
 8mmwaXLho70RQZqwyJXOCHUjD2nLRPxAhJ/kjn71kbOkXipjw5g8bLHkKPLc/6KMtR66
 uI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=FVLlsVBKPfRjq0jz3LI4f04+gYbfn8cXwIMogPX32xQ=;
 b=ScW7u3+o81oKEiDZRYrZ1gaNWLK49eXcobUaEtVHXjGY6d1H5kMi+ExAjeZaaRaiXN
 MsPoHXCpXhGz+V2/zP+ohCqRMa8jKxX1A9ATQSKdow+iXlJZoMwJCt0wqwVsRkotRMW+
 74qqpa+ls3X5fYmQzkJqoct5K1qGBiIzLAo8VbTC5Nn7xLMVk09tJlub1aSyS7V0MU4T
 1WSE4a5BcDf7FDf12zSbM+hqutHwRhRr7XOqRcL/8M9zVCaSleWOnSvxd1PG2K/fl+an
 4ZslS4B7e6xhDbVLuusW3TitR40goBzV7kcU0xP6cEFPxVzG33Pz7a+hKpSMX3XOStU+
 K9TA==
X-Gm-Message-State: APjAAAUNYSDwqHwn39bxKF2o1IAIsf1VCEzZr+vleBM6Ahql1qCojmOr
 2U0ylH5CrzSw2Fq3X0s8jEgxzlwlmk8=
X-Google-Smtp-Source: APXvYqwSc0ZjKg1lhYfbFqOHu7X2yRH9Qj7zgZy8PMqw8Y0aNFP9SQGDlwEy4sOf3BTTbxu7BaHwjg==
X-Received: by 2002:a63:4644:: with SMTP id v4mr657735pgk.422.1555629754415;
 Thu, 18 Apr 2019 16:22:34 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:9c06:6f96:9c41:be05])
 by smtp.googlemail.com with ESMTPSA id h4sm3112858pgv.61.2019.04.18.16.22.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 16:22:33 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH v5 0/2] tty: serial: add DT bindings and serial driver for
 the SiFive FU540 UART
In-Reply-To: <20190413020111.23400-1-paul.walmsley@sifive.com>
References: <20190413020111.23400-1-paul.walmsley@sifive.com>
Date: Thu, 18 Apr 2019 16:22:32 -0700
Message-ID: <7hmukmew5j.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_162235_895402_3D589945 
X-CRM114-Status: GOOD (  13.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paul,

Paul Walmsley <paul.walmsley@sifive.com> writes:

> This series adds a serial driver, with console support, for the
> UART IP block present on the SiFive FU540 SoC.  The programming
> model is straightforward, but unique.
>
> Boot-tested on a SiFive FU540 HiFive-U board, using BBL and the
> open-source FSBL (with appropriate patches to the DT data).
>
> This fifth version fixes a bug in the set_termios handler,
> found by Andreas Schwab <schwab@suse.de>.
>
> The patches in this series can also be found, with the PRCI patches,
> DT patches, and DT prerequisite patch, at:
>
> https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v5.1-rc4

I tried this branch, and it doesn't boot on my unleashed board.

Here's the boot log when I pass the DT built from your branch via
u-boot: https://termbin.com/rfp3.

I also tried the same thing, but using the DT that's hard-coded into
SBI/u-boot.  That doesn't boot fully either[1], but one thing I noted is
that with the DT from the kernel tree, the printk timestamps aren't
moving.  Maybe I'm still missing some kconfig options to enable the
right clock and/or IRQ controllers? I'm using this fragment[2] on top of
the default defconfig (arch/riscv/configs/defconfig).

Could you share the defconfig you're using when testing your branch?

Also for reference, I'm able to successfully build/boot the
5.1-rc1-unleashed branch from Atish's tree[3] using that kconfig
fragment[2] (and the hard-coded DT from u-boot/SBI).  Full log here[4].

Thanks,

Kevin

[1] https://termbin.com/wuc9
[2]
CONFIG_CLK_SIFIVE=y
CONFIG_CLK_SIFIVE_FU540_PRCI=y

CONFIG_SERIAL_SIFIVE=y
CONFIG_SERIAL_SIFIVE_CONSOLE=y

CONFIG_SIFIVE_PLIC=y
CONFIG_SPI=y
CONFIG_SPI_SIFIVE=y
CONFIG_GPIOLIB=y
CONFIG_GPIO_SIFIVE=y
CONFIG_PWM_SIFIVE=y

CONFIG_CLK_U54_PRCI=y
CONFIG_CLK_GEMGXL_MGMT=y

[3] https://github.com/atishp04/linux/tree/5.1-rc1-unleashed
[4] https://termbin.com/12bg

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
