Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C722C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 15:04:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D560F205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 15:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kyzRvP3P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D560F205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLNcxPVqFb24/5gi5yaWMvuLr2tEWCaas2MpgP8vdjg=; b=kyzRvP3PbKA7Bm
	K7zt+88m6nqYHDeppUC7c22doKExW9USGN20uspPSjOjmEHMDW6GBK49EVx18jio3zn5kpdbqJLrr
	GkYSN8U33Kba1A8V0e9aQ9EOSdrXtFWVUy5fmr5xmzXFfQ/piItkNmzgL3zzhQU/Uw1YpJNJLE1t8
	P9hBHUrAxF+rolfuOvNZeUH72PAtv3N3mF3H8BcESBhNfGcVUecDnYyBpC8sma7t/RSOCWOKyjMmR
	XDFRx39AXxhoJ60ybJg9PieFxFffxVqg/W0RhmQJ4wGyObHQvkaqDhZtE/+7YJIMeH3RzGnxe18Bs
	e+oMtgIKzPj0oBoOgioQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH8ah-0003mR-C8; Thu, 18 Apr 2019 15:04:43 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH8aZ-0003eI-9M; Thu, 18 Apr 2019 15:04:36 +0000
Received: by mail-oi1-f195.google.com with SMTP id l203so1859820oia.3;
 Thu, 18 Apr 2019 08:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8yYHZR9XsTRngB6MgERHQ/m026i3HmmJTeQkFP57/Vk=;
 b=VVhmrZP+Fmqaos5c3WO5TPKPl2aAg0qoUQ3cYeGgJ4BtxSk2YKImbD2Br5l7vrI11y
 C7PcFvxhxYwg64zkGi4mCSeXGqju9ECqEODMse+jlODjuqr38sPFLRMOJAqN8rzcC+zl
 5wAp8oax0DmMkVsFbkYA89xVn4zQugG+5eKVgtfmPZInas/2nFFFGAzVgGGhyuRzViBo
 ufNy6QMBd1EqUhQvH1pV6d8dZjlhexHt5QSGcNottuPrF0HVNDvyh+dADdKz/9heu6b9
 IQi2ATAhcB3EqcqI2eqMwQkJwBACa3L+Mo1kBMMchdROqCbsAxvovDEb29mG6feEG9X4
 LeDw==
X-Gm-Message-State: APjAAAXWcASZ8Kr6TuX1vdUwQeYdTOtV16f6Bm/6Laa2TpOf180ONQSh
 NgenCFimLW2vI+DoqzEPRw==
X-Google-Smtp-Source: APXvYqwhqCO/+ZmlCFLaLOnozBaaltgv6HFqhBwn22K0cMBcZb0P5sYLb/X62uMUaA2jwW3Xk+hkvA==
X-Received: by 2002:aca:cc8c:: with SMTP id c134mr2376193oig.172.1555599872743; 
 Thu, 18 Apr 2019 08:04:32 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l5sm848892otr.53.2019.04.18.08.04.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 08:04:32 -0700 (PDT)
Date: Thu, 18 Apr 2019 10:04:31 -0500
From: Rob Herring <robh@kernel.org>
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: Re: [PATCH v5 3/3] dt-bindings: arm: fsl: Add the imx8mq boards
Message-ID: <20190418150431.GA32345@bogus>
References: <20190417165514.18689-1-angus@akkea.ca>
 <20190417165514.18689-4-angus@akkea.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190417165514.18689-4-angus@akkea.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_080435_322307_725154E2 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>,
 Palmer Dabbelt <palmer@sifive.com>, Bruno Thomsen <bruno.thomsen@gmail.com>,
 m.felsch@pengutronix.de, Guo Ren <guoren@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Aisheng Dong <aisheng.dong@nxp.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 angus.ainslie@puri.sm, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 17, 2019 at 09:55:14AM -0700, Angus Ainslie (Purism) wrote:
> Add an entry for imx8mq based boards
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
