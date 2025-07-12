Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BEEC83F10
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jul 2025 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ed0Yywy7M96cKY9MFAXSv+X/AtPJ5uTAG+pMGZbk5No=; b=Y/kuqMxJEtS0K9
	8hb0DGSQqefAYiPa/S83pypQHHs7Sx2c+H++IcEPUzeqG5yAo8ZCurTfT7xvzQhl5Q81Cu6x0oNHA
	4qSKODGmiO5AXsk7R0cvIFAYR+tEp6ydb+t/fLVRhI0Qz6blD9cjpYWPwtKsCmI/KOlqYWgqBpUJg
	AsEBL5UUE5eESvRdf2MptER1qZj5vwaFOYiFoSaAxF0Nc/odt4h0U0MpXN41BMc8de7T6tokXwYrH
	/xoidv+eQrra87S8Vw3o1N8WVTk4aStVf/fUNHsAa39xK08ru33bBz7Wd9zWPaJCBfwQLZjtpxeKx
	QcCOAxNrc4lkI/K2zB4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUhA-0000000GMMb-0GBD;
	Sat, 12 Jul 2025 07:30:52 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUh7-0000000GMLn-0Uz3
	for linux-riscv@lists.infradead.org;
	Sat, 12 Jul 2025 07:30:50 +0000
Date: Sat, 12 Jul 2025 15:30:27 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752305433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zaZkLh+Xqu7HMq+MNm0aFn7Fz9hf/atCoHwr5DO1YjQ=;
	b=h3lYZiROqjNNRodm3MHnwUWM/aYFfjbbTzhIMKhu/6NufohDMm5m8G+TgRRZXv+xoYMrZQ
	q2ABQVxzsmTduEh+uJg3bo1jo1BSUi+zjmJk7v3zlO9qM8A/8ckrHFNwmp2Fk1hpN5vjui
	mb6Ii/3eBv2sgZiyLLDkERDrv4ApbeE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ze Huang <huang.ze@linux.dev>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Ze Huang <huang.ze@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] usb: dwc3: add generic driver to support flattened
Message-ID: <aHIPEz_YsKejIP_6@monica.localdomain>
References: <20250705-dwc3_generic-v5-0-9dbc53ea53d2@linux.dev>
 <20250705-dwc3_generic-v5-2-9dbc53ea53d2@linux.dev>
 <20250711233728.cmkhbnmgzacwx7uk@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711233728.cmkhbnmgzacwx7uk@synopsys.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_003049_515847_A35A8B0C 
X-CRM114-Status: GOOD (  18.19  )
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

On Fri, Jul 11, 2025 at 11:37:32PM +0000, Thinh Nguyen wrote:
> On Sat, Jul 05, 2025, Ze Huang wrote:
> > To support flattened dwc3 dt model and drop the glue layer, introduce the
> > `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> > and offers an alternative to the existing glue driver `dwc3-of-simple`.
> > 
> > Signed-off-by: Ze Huang <huang.ze@linux.dev>
> > ---
> >  drivers/usb/dwc3/Kconfig             |  11 +++
> >  drivers/usb/dwc3/Makefile            |   1 +
> >  drivers/usb/dwc3/dwc3-generic-plat.c | 182 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 194 insertions(+)
> > 

[...]

> > +static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(dwc3_generic_suspend, dwc3_generic_resume)
> > +	SET_RUNTIME_PM_OPS(dwc3_generic_runtime_suspend, dwc3_generic_runtime_resume,
> > +			   dwc3_generic_runtime_idle)
> > +};
> > +
> > +static const struct of_device_id dwc3_generic_of_match[] = {
> > +	{ .compatible = "spacemit,k1-dwc3", },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
> > +
> > +static struct platform_driver dwc3_generic_driver = {
> > +	.probe		= dwc3_generic_probe,
> > +	.remove		= dwc3_generic_remove,
> > +	.driver		= {
> > +		.name	= "dwc3-generic-plat",
> > +		.of_match_table = dwc3_generic_of_match,
> > +		.pm	= &dwc3_generic_dev_pm_ops,
> 
> You're still not using the new pm_ptr()/pm_sleep_ptr. The kernel build
> bot will complain about the maybe unused functions.

Thanks for your patience.

I found they are caused by using SET_RUNTIME_PM_OPS and SET_SYSTEM_SLEEP_PM_OPS macros.

I'll replace them with new RUNTIME_PM_OPS/SYSTEM_SLEEP_PM_OPS and wrap the
dwc3_generic_dev_pm_ops with pm_ptr()

> 
> BR,
> Thinh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
