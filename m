Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6184C43327
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 00:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PnaTlepbeWafOYgadDWvN4SRW9ewV0iFTcM+ReBVkLM=; b=Pi75MmYb5aouhb
	xPqOvJYxxV7JCPm06CPwe70QD/579tqyEZ3LOXIDZMw47y8Q0NLy278BWg2/SQ+VCRoZFk3KPIcJt
	YLaM0gtaEyKSGIsIxaw5eeWJQHt4sJUXd/XXkEFhuxZj45HqGTyHOxyJjKe/j+dzyBMm7hiQujc6e
	geikonTb3VXb3XXRNNpWpWC8mPIPMFRGEdXPOMJjvmaovlQtrOuT1iGY+1oqGS185pCkCkLkN8vkm
	8lA6ZGRxzNZRygustZGJ1DaeY+ggJjTDhpxaEOZtRMIp+PdhUkwQU4P26tGd+Wm/4Cp90Dxpewn6H
	FuTzFlb+7u0vKSm288Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRaU-00000005mtS-2NLR;
	Fri, 03 Jul 2026 00:16:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRaS-00000005mtM-38W3
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 00:16:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27D1741638;
	Fri,  3 Jul 2026 00:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801741F000E9;
	Fri,  3 Jul 2026 00:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783037816;
	bh=/LVC6Hmw6zMzHK5fUXwnxznVg9uaG7qwXcwGvD26sKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DuxZiwoVDzLb+2WqWHJo4iFuN5oSe2E+SNo5krcuygPlnGgdmVQ/Mc5Fe2zJiBadm
	 DW2np4Cl9iUluvG/cJYBiDs6+KPeX0GKHNrtm8S75QlOdOZEvreSnuqQuRi3dBU2Fk
	 EcGvPn1j+kOFTBbEnfChUNLvj60buJ7PAcfNdLIALjFVQKStya+VO10YCUb7GQNgAI
	 r8GnFzlevfDRZ3O6FwHyJND1Yeo8sRjGGbApD6QAS1Xy8TcWft+JODRLkw+dmp8vbs
	 kasKyK7y/2Hk4cyFjH7HWPFw6AI7YwIgSiBdRE0JXje8qc+VdSLzbynUxxziUeU+R1
	 FjAIuyOex/Hwg==
Date: Fri, 3 Jul 2026 00:16:53 +0000
From: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
Message-ID: <20260703001653-GKB35811@kernel.org>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
 <c49d9bea7f9a172a97d0acfaa9680bdac80f75e1.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c49d9bea7f9a172a97d0acfaa9680bdac80f75e1.camel@pengutronix.de>
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

Hi Philipp,
 Thanks for your review

On 09:53 Thu 02 Jul     , Philipp Zabel wrote:
> On Do, 2026-07-02 at 02:31 +0000, Yixun Lan wrote:
> > SpacemiT K3 SoC consist of UFS (Universal Flash Storage) Host Controller
> > which has features compatible with JEDEC UFS 2.2, MIPI UniPro v1.61 and
> > M-PHY v3.0 standard.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  drivers/ufs/host/Kconfig        |  12 +
> >  drivers/ufs/host/Makefile       |   1 +
> >  drivers/ufs/host/ufs-spacemit.c | 931 ++++++++++++++++++++++++++++++++++++++++
> >  drivers/ufs/host/ufs-spacemit.h |  90 ++++
> >  4 files changed, 1034 insertions(+)
> > 
> [...]
> > --- /dev/null
> > +++ b/drivers/ufs/host/ufs-spacemit.c
> > @@ -0,0 +1,931 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> 
> Missing #include <linux/reset.h> for
> devm_reset_control_get_optional_exclusive_deasserted() below.
> Don't rely on indirect includes.
> 
Will add in next version

> [...]
> > +/**
> > + * ufs_spacemit_init - init phy and prepare clk
> > + * @hba: host controller instance
> > + */
> > +static int ufs_spacemit_init(struct ufs_hba *hba)
> > +{
> > +	int err = 0;
> > +	struct device *dev = hba->dev;
> > +	struct ufs_spacemit_host *host;
> > +
> > +	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> > +	if (!host)
> > +		return -ENOMEM;
> > +
> > +	host->rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> 
> Why is this stored in struct ufs_spacemit_host at all? As far as I can
> see it is never used again, so this could be a local variable.
> 
Ok, will make it a local variable

> [...]
> > diff --git a/drivers/ufs/host/ufs-spacemit.h b/drivers/ufs/host/ufs-spacemit.h
> > new file mode 100644
> > index 000000000000..6ae3c263a360
> > --- /dev/null
> > +++ b/drivers/ufs/host/ufs-spacemit.h
> > @@ -0,0 +1,90 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * SpacemiT UFS Host Controller driver
> > + *
> > + * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
> > + */
> > +
> > +#ifndef _UFS_SPACEMIT_H_
> > +#define _UFS_SPACEMIT_H_
> > +
> > +#include <linux/reset-controller.h>
> 
> Drop this, we are not implementing a reset controller driver here.
> 
Ok

> > +#include <linux/reset.h>
> 
> You could replace this with a struct reset_control forward declaration.
> Or drop it ...
> 
Will drop it

> [...]
> > +struct ufs_spacemit_host {
> > +	struct ufs_hba *hba;
> > +	struct ufs_pa_layer_attr dev_req_params;
> > +	struct reset_control *rst;
> 
> ... if you end up removing the rst field entirely.
> 
Yes, I will remove it

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
