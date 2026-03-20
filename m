Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14823108B8E9
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/B4ul+5OGC14lPTRzJ0B+nEik0Ea/sl5AB0QdCWUfc=; b=dRRSmyKy9Z7b8+
	G4I3tnepyfpy1LpDuGqexDRCDH33u1q42InUMfrJeolUVjF4QZnRYgG6gr2fEAvKr8XHm5gqodvFB
	icjhK5iBkzRYJAJnIPpbfWCkPAd2gfMSGBfxOaIoVIYzr1MOiY20cdboaHk8WD8cZFM68mXPPUjCC
	/gPGJiukNi5opP2SVBupR1x6MACrHhFwdyRFmYNtltQOLtZDSmKgYdRwK7Ec9J6lGKVZi0vC+5vYG
	gvDHmA5neZzRLZVNjsIM2oamxa7mU7JKYz8nB3Dw07+bZ4Pe4OTv7Px0Tzkoa3JGg09Ud41gOYj5B
	XO7JaV0BYg5m3Bvc9SDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XHS-0000000CdFx-3Evp;
	Fri, 20 Mar 2026 10:40:38 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XHP-0000000CdEx-0vPC
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 10:40:37 +0000
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37b41ebdf;
	Fri, 20 Mar 2026 18:40:31 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: huang.ze@linux.dev
Cc: amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev,
	thinh.nguyen@synopsys.com
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS regulator support
Date: Fri, 20 Mar 2026 18:40:26 +0800
Message-Id: <20260320104026.1350571-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DH7ILSL8DXBO.ZR74CL1QEUBU@linux.dev>
References: <DH7ILSL8DXBO.ZR74CL1QEUBU@linux.dev>
MIME-Version: 1.0
X-HM-Tid: 0a9d0ad51abb03a2kunm01e649021f45a3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGh9JVkpDT0JJHUlLGUxMHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_034035_446169_F8F66645 
X-CRM114-Status: GOOD (  11.67  )
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

> I think it's better to align the driver with the actual hardware. I'm not
> opposed to managing any regulators in usb host/device drivers. But if we
> do have an onboard hub, and regulator belongs to the downstream ports of
> the hub, then it's hub's job, right?

> Many boards leave gpio controlled regulators always on, that's what we
> want to solve. If we have to choose the parent of these regulators, why
> not put them in the correct hierarchy?

I think we can manage the regulator in the USB host driver first,
and then use it after the onboard_usb_dev driver has been merged.
This is better than keeping the regulator always on.

> If such a board really need the regulator, IMO, your patch is the way to go.
>
> OrangePi haven't released the schematic yet.
>
> That's what I could find [1], which seems similar to RV2.

There is no onboard USB hub. Just check the image:

http://www.orangepi.org/img/r2s/details/17.png
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
