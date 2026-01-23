Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CC1D74ED3
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mk91sCuzO9XYSub8qE4oDGmCJWKGy+rHQoXQ1fu8rPI=; b=HY2f19hoK5xff3
	7FJSG4gbiLRA2oGhEk23uxb3AuzZ+HOT5yI05YBLxAlmRpnwM1M3U0CODT3lG8gBKeNWFMUfLo8uA
	mVaUyGQUqngk+mOoUSFuoGGJNuZa6D9efF4tvQDTSM2wHFAvZKlxI0/TPooehONkCw2SzNnWD3ZHF
	dKX9X1q9h9s6DJk1VOEieEAc3Sypa2fb/C11TkI1Mvkl5HrISg6Y6IWbK9GIlBlmza4uufjsOuhu1
	r9yL47aCHIkZB9LGpU4uD2DKrvliVQWyjt7DbLhvZlXekEnvr5ZkWntlCjRsJgZx2z7gEEDEgR3kp
	OtNrw9N4fTAffVhdDiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHoK-000000090er-3EDR;
	Fri, 23 Jan 2026 14:06:52 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHoG-000000090dp-15yn
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 14:06:51 +0000
Received: from localhost.localdomain (unknown [116.25.94.62])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31c2ab110;
	Fri, 23 Jan 2026 22:06:36 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@gentoo.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add common board dtsi for OrangePi
Date: Fri, 23 Jan 2026 22:06:25 +0800
Message-Id: <20260123140625.1918171-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260119024255-GYC47382@gentoo.org>
References: <20260119024255-GYC47382@gentoo.org>
MIME-Version: 1.0
X-HM-Tid: 0a9beb2da69d03a2kunm5c2622f7d671e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTxlNVkhDHkMeHh1DTkMaGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VTUlZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVUtZBg
	++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_060648_467184_DD015BD3 
X-CRM114-Status: UNSURE (   5.00  )
X-CRM114-Notice: Please train this message.
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

Hi,

> no, as I checked these two boards having too many differences that
> I don't think it's worth trying to create a shared dtsi file

I think some of them can be shared? If you think this is inappropriate,
I will abandon this. By the way, it seems that the OrangePi R2S lacks
publicly available schematics.

Some parts are the same:
- emmc
- eeprom
- ethernet
- p1 pmic
- combo phy
- pdma / uart0
- always-on regulator
- pcie (excluding supply)
- usb2/3 (excluding supply)

Some parts are different:
- hdmi
- qspi
- sdcard
- gpio led
- sdio wifi
- audio codec
- pcie supply
- usb2/3 supply
- gpio regulator

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
