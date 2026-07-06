Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E6BC43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPxLU5m2rxc3h4n66plArEMiAgrBBRm+LKI3STSa1KQ=; b=y3WQpzOiswIkbE
	x9KdrYAClg/YG+LRdTnKIA+5Gr1pLQGddqprkPznGhmew90aI/K4pF33pX52x1WaT10Md5v2aKwHY
	5So5gMVnduxgz/bDeNvLKQE/+fxidC5fO8mQsSl1INuvx4o38bKPxb8brz4QVQqdcRPJkeFtqV+sf
	y9Maq9S2zQWTmCyFINipegWv2Vu7LuDfKrs2mzKXkSSJD9GTkSIoR/Qq7lTJZvqhmGqRHMBeGAtTM
	LqYkUQOaehL9OEQJrLHGljfWjSgUunLsRr6bzb/ZvLp0KeqLks9TMNnpu13cx3OS7zZcTbBuSuS8H
	/EkKnoOHpl1Mn5Xf5C7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjtk-0000000CgDR-3OU5;
	Mon, 06 Jul 2026 14:02:12 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjti-0000000CgD6-175W
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 14:02:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4gv5dX75Wjz1XM6JQ;
	Mon,  6 Jul 2026 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1783346513; x=1785938514; bh=SWQu/Y+XC68Sm5MppnTOFQED
	FDkVGjBC+cLSsIsk2pc=; b=bwUzpgp1uLbCon5o1MbBED+9l+vJSXKRjS7vqFdB
	Vps58b90aV/5Ou/oe2HqwU2q4Ma1JAIs6aUZhpcYy5OFC4l65LqE16uatgXMUq4x
	aUf1Bp0H3eKAfT83gwjkLRkw5LRFFhKJgMBR3OCJz5IJ4C3REVjmhKacEn2waBoA
	s3oJ5IeqPMPA0GLcFiivmIak/rOaijZnKMDMyqy6S1YtXT4OA8sQOwshS/lpa2s1
	suR1jnCrq03rTk+rXVzz47LRnCum+0XMqoAraNR7AEPN5d6suH4Oyg9qXPifImOn
	HTB15MbC1+pAbedC3AbMx8LBi+zg5IHp3NGEUqRDbftAGQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 24qOXGkWAkgZ; Mon,  6 Jul 2026 14:01:53 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4gv5d473bZz1XM6J4;
	Mon,  6 Jul 2026 14:01:43 +0000 (UTC)
Message-ID: <f46d7520-bc2e-49f7-9049-ecdba2837b5d@acm.org>
Date: Mon, 6 Jul 2026 07:01:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
To: Yixun Lan <dlan@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@sandisk.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_070210_326671_B8427F2B 
X-CRM114-Status: GOOD (  17.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 7/1/26 7:31 PM, Yixun Lan wrote:
> +config SCSI_UFS_SPACEMIT
> +	tristate "SpacemiT UFS controller driver"
> +	depends on SCSI_UFSHCD_PLATFORM && ARCH_SPACEMIT

What would break if ARCH_SPACEMIT is left out?

Please make sure that this driver can be compile-tested easily.

> +	u32 host_reg[] = {
> +		(UFS_PHY_MNG_BASE + UFS_MPHY_RST_CTRL),
> +		(UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL),
> +		(UFS_PHY_MNG_BASE + UFS_DEVICE_IO_CTRL),
> +		0xFFF,
> +	};

Can this array be declared 'static const'?

The parentheses in the above array definition are superfluous.
Please remove these.

> +	buf = kzalloc(VENDOR_DUMP_BUF_SIZE, GFP_ATOMIC);

Why GFP_ATOMIC? ufs_spacemit_dump_host_regs() is never called from
atomic context, isn't it?

> +	len += scnprintf(buf + len, VENDOR_DUMP_BUF_SIZE - len, "vendor specific registers:");

This function will be much easier to review and to maintain if a struct
seq_buf instance is created for 'buf' and if seq_buf_printf() would be
used instead of scnprintf().

> +static bool is_fsm_state_valid(u32 state)
> +{
> +	return (state == FSM_STATE_ACTIVE || state == FSM_STATE_LS_BURST);
> +}

"return" is not a function. Please remove the superfluous parentheses.

> +static int ufs_spacemit_mphy_init(struct ufs_hba *hba)
> +{
> +	int ret;
> +
> +	/* reset all mphy logical */
> +	ufshcd_writel(hba, 0x003, UFS_PHY_MNG_BASE + 0x0);
> +	mdelay(1);

Why mdelay() instead of msleep()?

> +static int ufs_spacemit_uniprov1p6_init(struct ufs_hba *hba)
> +{
> +	/* PA_TXHSG1SYNCLENGTH */
> +	ufshcd_dme_set(hba, UIC_ARG_MIB(0x1552), 0x4f);
> +
> +	/* PA_TXHSG1PREPARELENGTH */
> +	ufshcd_dme_set(hba, UIC_ARG_MIB(0x1553), 0xf);

The code in this function is very repetitive. Please convert all the
ufshcd_dme_set() calls into a loop over an array.

> +	/*LCC_DISABLE*/

Here and everywhere else in this source file, please follow the
convention used elsewhere in the Linux kernel and change /*comment*/
into /* comment */.

> +/**
> + * ufs_spacemit_hibern8_notify - Handle hibernate enter/exit
> + * @hba: host controller instance
> + * @cmd: UIC command (HIBER_ENTER or HIBER_EXIT)
> + * @status: notification status
> + *
> + * Manages M-PHY power state during hibernate transitions.
> + */
> +static void ufs_spacemit_hibern8_notify(struct ufs_hba *hba, enum uic_cmd_dme cmd,
> +					enum ufs_notify_change_status status)
> +{
> +	int ret;
> +
> +	dev_dbg(hba->dev, "Hibern8 notify: cmd=%d, status=%d\n", cmd, status);
> +	if (status == PRE_CHANGE) {
> +		if (cmd == UIC_CMD_DME_HIBER_EXIT) {
> +			mdelay(1);
> +
> +			/* Enable reference clock */
> +			ufshcd_writel(hba, MPHY_DEVICE_RESET_DEASSERT,
> +				      UFS_PHY_MNG_BASE + UFS_DEVICE_IO_CTRL);
> +			mdelay(1);
> +
> +			/* Power up all */
> +			ufshcd_writel(hba, MPHY_PU_ALL, UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +			mdelay(1);
> +
> +			/* Assert ana_rx_hb8_reset */
> +			ufshcd_writel(hba, MPHY_PU_WITH_HB8_RESET,
> +				      UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +			mdelay(1);
> +
> +			/* Deassert ana_rx_hb8_reset */
> +			ufshcd_writel(hba, MPHY_PU_ALL, UFS_PHY_MNG_BASE + UFS_MPHY_PU_CTRL);
> +
> +			ret = ufs_spacemit_wait_mphy_pll_lock(hba);
> +			if (ret < 0)
> +				return;
> +
> +			mdelay(1);
> +			ufshcd_dme_set(hba, UIC_ARG_MIB(0xdd), 0x57);
> +			mdelay(1);
> +			ufshcd_dme_set(hba, UIC_ARG_MIB(0xe8), 0x57);
> +		}
> +	}

Please move all the code in this function that is indented by two tabs 
into new functions to improve code readability and to reduce
indentation. This advice comes from the Linux kernel coding style guide.

Thanks,

Bart.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
