Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914A8C43327
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 17:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ew6NOwwBtY7RtiDLfvFTXZ+ZgIwBavTxndfRG+8JuR8=; b=Z0ZLx0BRdESO7X
	1ryERXUQwb3QcHWQKwGRgFoz+E/eK69hqx31fqLj/lvCp+d0MGoLnoisibofQnxFy/nReOixATWTk
	3P9QMwQUDbBx4gPHQXTJS3nSojQrYfbquQwttZyuj+uZKkFOJhQZJWMfHmSCa8OIJS8V7L/MWDkro
	pV5pZUAeo2Z51NOc0YlapqwhonRnOvROQFCKpEuj73PDNXgZ4XX3CXgPiRQlQyJZtc2BLOBhfbtX6
	i7gw5rht3ga3qiDcVxEEoYUnsQ+Fpn7KUuNjf8YPVY1pHK92voYM4h5PeGeZFmBZIDMugQ//ykrnT
	Syb2oFvAM86TO1zZgolA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfL6s-000000057kL-444W;
	Thu, 02 Jul 2026 17:21:58 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfL6q-000000057jN-0foF
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 17:21:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783012899; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JHbhhu4+gy/a0FtQBodKmH8tfye9dtnI1bra6MNmLaCFkNqrb6FXQm+VYdeZBVT1XDPEzGR+7i/ylQHeq2Oa2tgpQ+uOuURs5SAAeZPLdm7RqW4j6QEIvUgCmCfb/emvoiH8kDK4XAD0liQ4DojFCNT1i018rJGIqegCfkqAk2g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783012899; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3pNo6VHmqaTxuE9Yer6GmVl/yimS+PJKHFrww1qNWgY=; 
	b=OFguuJ8cZm/Z2FXaJI8Xjy5LXQWg71bg1+t2pLK8ialmgDWF5vwlUBuZlJJpApz39jT27oiMKHfEFibUxg7grafkn3BmhAsgpuNMOFXAeyCuaVhJeqmUtYNJNYBZDhyc6AvIhXR4nuPA/KqLbEBvrkQjQZlHzxr6FbBgIpdpP7U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783012899;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=3pNo6VHmqaTxuE9Yer6GmVl/yimS+PJKHFrww1qNWgY=;
	b=GyeG/LbvT2GVo1Bb8LvkcalxaeCk2VKhcP9DZy7NKFE0TZ3C8Uokxn91yfyBo/RR
	aK45+fEeyVHJXFO2ePAQhUUZVr3s7ZCG8b+XbFNxhaVerhRczGNuJqZTER5j5zOWOUr
	+AG0Va499glfZqqM6lkE9WYO+Ab1ZBbhbqC/nNKQ=
Received: by mx.zohomail.com with SMTPS id 1783012895431464.9970225222668;
	Thu, 2 Jul 2026 10:21:35 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:21:08 +0000
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
Message-ID: <akaeBJv5T3YmlfpC@pie>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_102156_396599_0AF630B3 
X-CRM114-Status: GOOD (  20.16  )
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

On Thu, Jul 02, 2026 at 02:31:36AM +0000, Yixun Lan wrote:
> SpacemiT K3 SoC consist of UFS (Universal Flash Storage) Host Controller
> which has features compatible with JEDEC UFS 2.2, MIPI UniPro v1.61 and
> M-PHY v3.0 standard.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/ufs/host/Kconfig        |  12 +
>  drivers/ufs/host/Makefile       |   1 +
>  drivers/ufs/host/ufs-spacemit.c | 931 ++++++++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-spacemit.h |  90 ++++
>  4 files changed, 1034 insertions(+)

...

> +static int ufs_spacemit_wait_mphy_pll_lock(struct ufs_hba *hba)
> +{
> +	int timeout = MPHY_PLL_LOCK_TIMEOUT_US;
> +	u32 val;
> +
> +	while (timeout-- > 0) {
> +		val = ufshcd_readl(hba, UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +		if (val & MPHY_PLL_LOCK_BIT)
> +			return 0;
> +
> +		udelay(1);
> +	}
> +
> +	dev_err(hba->dev, "M-PHY PLL lock timeout\n");
> +	return -ETIMEDOUT;
> +}

Could this loop be replaced by read_poll_timeout() like

	read_poll_timeout(ufshcd_readl, val, val & MPHY_PLL_LOCK_BIT,
			 1, MPHY_PLL_LOCK_TIMEOUT_US, false, hba,
			 UFS_PHY_MSG_BASE + UFS_MPHY_PU_CTRL);


...

> +/**
> + * ufs_spacemit_init - init phy and prepare clk
> + * @hba: host controller instance
> + */
> +static int ufs_spacemit_init(struct ufs_hba *hba)
> +{
> +	int err = 0;
> +	struct device *dev = hba->dev;
> +	struct ufs_spacemit_host *host;
> +
> +	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +	if (!host)
> +		return -ENOMEM;
> +
> +	host->rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);

"resets" property is marked as required in the binding, but the optional
API is used here. Is this expected?

...

> +/**
> + * ufs_spacemit_hce_enable_notify - Configure HCE enable sequence
> + * @hba: host controller instance
> + * @status: notification status (PRE_CHANGE or POST_CHANGE)
> + *
> + * Configures host controller enable with proper sequencing.
> + * Handles crypto enable if supported.
> + *
> + * Returns: 0 on success
> + */
> +static int ufs_spacemit_hce_enable_notify(struct ufs_hba *hba,
> +					  enum ufs_notify_change_status status)
> +{
> +	struct ufs_spacemit_host *host = ufshcd_get_variant(hba);
> +	u32 enable_val, val;
> +
> +	if (status == PRE_CHANGE) {
> +		enable_val = CONTROLLER_ENABLE;
> +
> +		if (hba->caps & UFSHCD_CAP_CRYPTO)
> +			enable_val = CRYPTO_GENERAL_ENABLE | CONTROLLER_ENABLE;
> +
> +		if (!host->first_hce_done) {
> +			host->first_hce_done = true;
> +			dev_dbg(hba->dev, "First HCE enable\n");
> +		} else {
> +			val = ufshcd_readl(hba, REG_CONTROLLER_ENABLE);
> +			if (val == enable_val) {
> +				ufshcd_writel(hba, enable_val & (1 << CONTROLLER_ENABLE),
> +					      REG_CONTROLLER_ENABLE);
> +
> +				while (ufshcd_readl(hba, REG_CONTROLLER_ENABLE) ==
> +				       (enable_val & (1 << CONTROLLER_ENABLE)))
> +					;

Shouldn't we set a timeout for the polling loop?

> +			}
> +		}
> +	}
> +
> +	return 0;
> +}

Regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
