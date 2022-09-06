Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38695ECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JsAzNvyxiY7bQ1JT6WdNSZnRLtSFya37y/NDun/pjSg=; b=CVO7v1Hfmunyp1
	jo63jfL+GP+Di/ntHoePDXQG5UOR3D68MPMBYanyO77yfjeSwK3w0jcFR+6EDXHqzcQgcFQJGAWJO
	cw7Lmy17ThuV/RDiCy3JYH4T6QiCBv7zZny49vRXTuGHgb+9zA9Q32XkG1vSUKv8orpzrVSgv2TIY
	6Y8UxmVSw0YLD3EHBYiqskDlHNS7z4IP1q3UMW6pEn2V/+jyvF+2BVb+XpSJHsLWgCSyvfObUPHW5
	iMJ2oUOQzzWQLCtxzfp+NtALRnF/kGSVhvz120gFZXx0jcJA9+MBlaSEV5tcz1LpyPI6mb0NHhucG
	seYDMOR72BFqhy5EXZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVWnB-00Cu8M-PR; Tue, 06 Sep 2022 11:30:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVWn8-00Cu5K-7b
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 11:30:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC64B60EDF;
	Tue,  6 Sep 2022 11:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FC2C433D6;
	Tue,  6 Sep 2022 11:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662463851;
	bh=bm9uW+36QU1xAHJ+oVynEAhF11CfOTIcYyIVCyIxWQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuWAOZpABzQWjhRFEGlEzovAMjqYP5gbx2CfPPN4+oWWFfy/3GWDEANvJUy53gZkq
	 VWJVDLrAxbVlvcJZu3UwkmlK8PraTgk99sLgZfP+p27zMLLBLQ6/fEH6sFM8hFK2sH
	 bUpyrIumm8r+LCVMCjEFEgQHOC3MxsYb1cgL9cjZLg8IVjnnqkxPPoTaUzoS4itTQJ
	 AOZQpg7aJK2Gp1UyXQS7aGuZafIND20w87iIoGU1OEMTSR+KE65l/32oDQUpr0yT+a
	 s525IDq+7dqQ/gbrXrGJA8wonnoHLr7bNBRSSpbXpcOxpvqjz9P64BmKzTpJVzkA/y
	 XXjMl/V2ztJWw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1oVWn8-0001e0-0d; Tue, 06 Sep 2022 13:30:54 +0200
Date: Tue, 6 Sep 2022 13:30:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Jiri Slaby <jslaby@suse.cz>
Cc: gregkh@linuxfoundation.org,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tobias Klauser <tklauser@distanz.ch>,
	Richard Genoud <richard.genoud@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <f.fainelli@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Kevin Cernekee <cernekee@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] tty: TX helpers
Message-ID: <Yxcvbk281f/vy4vb@hovoldconsulting.com>
References: <20220906104805.23211-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906104805.23211-1-jslaby@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_043054_523070_2D395A4D 
X-CRM114-Status: GOOD (  14.00  )
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

On Tue, Sep 06, 2022 at 12:48:01PM +0200, Jiri Slaby wrote:
> This series introduces DEFINE_UART_PORT_TX_HELPER +
> DEFINE_UART_PORT_TX_HELPER_LIMITED TX helpers. See PATCH 2/4 for the
> details. Comments welcome.
> 
> Then it switches drivers to use them. First, to
> DEFINE_UART_PORT_TX_HELPER() in 3/4 and then
> DEFINE_UART_PORT_TX_HELPER_LIMITED() in 4/4.
> 
> The diffstat of patches 3+4 is as follows:
>  26 files changed, 191 insertions(+), 823 deletions(-)
> which appears to be nice.

Not really. This is horrid. Quality can't be measured in LoC (only).

The resulting code is unreadable. And for no good reason.

[ And note that you're "saving" something like 20 lines per driver:

	 12 files changed, 84 insertions(+), 349 deletions(-)
]

NAK

Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
