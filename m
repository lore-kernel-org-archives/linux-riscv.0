Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D39C43327
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 01:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JA3HblB8AKJuJioDjWFiHeqQs6Ug5z5PcnbLBUJ6OT0=; b=PX5/sN0KUjgi+O
	cj1Hft55jUthBdEisJ4Ee+Gpzmp/AMGmhxCwTc5zvrfZDYdDr0UZ6iDnNmZqAd98h1FH4jH7lO+Nn
	PkVfyRs8QQXpWAU29ZIIwHrfuz1L1SXEBJOcdKq6x1jOL5HDUMcllIEKAvc+dlYe8jX2OzUG300Ic
	48V3kaDfT53kCwuXtm+WswHs6Mp2ZHAt1oAs2f9K15tsORrZQ2TVQ3aS8H97Ueig0+7oKHDi4xo+z
	bX0QdxxK+kINc9+YuA4TiXjziPtgTXIkC7CJJogAzvPY5CvGw5hc2P7u8OLHbJ/JfEO+gVfFnYmz5
	+aEpnro0osgeH7WO/WTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfShK-00000005pKp-0wP5;
	Fri, 03 Jul 2026 01:28:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfShJ-00000005pKf-04CA
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 01:28:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EB656001A;
	Fri,  3 Jul 2026 01:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDDE1F000E9;
	Fri,  3 Jul 2026 01:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783042083;
	bh=0eXGKOcKQVdU/sbnJjxGRITWvo+67g14j4Em8TkDCvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TT0sywZD2HYWh3962wb2Zk7EFaRUAkSkh8KYupweqLXhoGcHxJC/ftAv+XD3uz/oL
	 yB6EGIyqj8DjKp9sgh6Sg7wD+CycIhRZtn/ZuFwTjj5osNGk6WXj0Yx0mTogfV7Py7
	 WOuL31iMTiW25Swp2w4nr8gW5ehQTCOr8lPmzv9pXDAyG/lVgLFrxLMLbpq6H6eDZF
	 M2s1yOH7D9PW5kZ6dOhr5mkwVVLvu8ks1acPWETCoKdLrDc+shDHScUms8ACZmrE8L
	 wZythJEl7kTS3xNOK1q4GVfYDGZsqSn6YmKNVYLwte5fS5UYIrKQBzlHyDy7SzZDK7
	 RVHk3MWL5Q/oA==
Date: Fri, 3 Jul 2026 01:28:00 +0000
From: Yixun Lan <dlan@kernel.org>
To: Yao Zi <me@ziyao.cc>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
Message-ID: <20260703012800-GKC35811@kernel.org>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
 <akaeBJv5T3YmlfpC@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <akaeBJv5T3YmlfpC@pie>
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

Hi Yao,

On 17:21 Thu 02 Jul     , Yao Zi wrote:
> On Thu, Jul 02, 2026 at 02:31:36AM +0000, Yixun Lan wrote:
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
> 
> ...
> 
> > +static int ufs_spacemit_wait_mphy_pll_lock(struct ufs_hba *hba)
> > +{
> > +	int timeout = MPHY_PLL_LOCK_TIMEOUT_US;
> > +	u32 val;
> > +
> > +	while (timeout-- > 0) {
> > +		val = ufshcd_readl(hba, UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> > +		if (val & MPHY_PLL_LOCK_BIT)
> > +			return 0;
> > +
> > +		udelay(1);
> > +	}
> > +
> > +	dev_err(hba->dev, "M-PHY PLL lock timeout\n");
> > +	return -ETIMEDOUT;
> > +}
> 
> Could this loop be replaced by read_poll_timeout() like
> 
> 	read_poll_timeout(ufshcd_readl, val, val & MPHY_PLL_LOCK_BIT,
> 			 1, MPHY_PLL_LOCK_TIMEOUT_US, false, hba,
> 			 UFS_PHY_MSG_BASE + UFS_MPHY_PU_CTRL);
> 
I think so, thanks for the suggestion

> 
> ...
> 
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
> "resets" property is marked as required in the binding, but the optional
> API is used here. Is this expected?
> 
Ok, I will switch to non-optional API and check return value

> ...
> 
> > +/**
> > + * ufs_spacemit_hce_enable_notify - Configure HCE enable sequence
> > + * @hba: host controller instance
> > + * @status: notification status (PRE_CHANGE or POST_CHANGE)
> > + *
> > + * Configures host controller enable with proper sequencing.
> > + * Handles crypto enable if supported.
> > + *
> > + * Returns: 0 on success
> > + */
> > +static int ufs_spacemit_hce_enable_notify(struct ufs_hba *hba,
> > +					  enum ufs_notify_change_status status)
> > +{
> > +	struct ufs_spacemit_host *host = ufshcd_get_variant(hba);
> > +	u32 enable_val, val;
> > +
> > +	if (status == PRE_CHANGE) {
> > +		enable_val = CONTROLLER_ENABLE;
> > +
> > +		if (hba->caps & UFSHCD_CAP_CRYPTO)
> > +			enable_val = CRYPTO_GENERAL_ENABLE | CONTROLLER_ENABLE;
> > +
> > +		if (!host->first_hce_done) {
> > +			host->first_hce_done = true;
> > +			dev_dbg(hba->dev, "First HCE enable\n");
> > +		} else {
> > +			val = ufshcd_readl(hba, REG_CONTROLLER_ENABLE);
> > +			if (val == enable_val) {
> > +				ufshcd_writel(hba, enable_val & (1 << CONTROLLER_ENABLE),
> > +					      REG_CONTROLLER_ENABLE);
> > +
> > +				while (ufshcd_readl(hba, REG_CONTROLLER_ENABLE) ==
> > +				       (enable_val & (1 << CONTROLLER_ENABLE)))
> > +					;
> 
> Shouldn't we set a timeout for the polling loop?
> 
Yes, good idea and will do in next version

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
