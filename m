Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A976E1075262
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 06:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdflGL/GePV3fBTS5GCvme2k5ynII+qgyAv0IcjKlSA=; b=R8wRG5XBxkmHJY
	CL/AMKA5+CnmAUkvmhdA5W2td84p8iV+d5wSkcDC00JOAAtfRjLyLhC1KBQpsNW7Kbx1NIBUlmcmI
	wxPdbKrhuFaDcR1/yJtAHtTQq2XwWmPBfp8nJao3XS/74efEx5S4A+kmJwzWfcA0HWa/Qsg9B37Rk
	wCYbSpKm2UYosApZ7zFedbprRGuUZMxvnN8T0kfcwVN7eqeXEf/C6BwxKhXsOFq8NOEXywJTukjh+
	HYJgfLbuV8EJeJhfK38RBZ+Nr9hZRVnmxtQ8wC9sRKCZI7oK8jzmYa5/IOdnz8NqXyBDDx0nuX3dY
	Qm7fX9dwsDis8tGN20uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36um-0000000A3UY-1Kng;
	Thu, 19 Mar 2026 06:31:28 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36ug-0000000A3TX-2kgE
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 06:31:24 +0000
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 378652ffb;
	Thu, 19 Mar 2026 14:26:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: thinh.nguyen@synopsys.com
Cc: amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	huang.ze@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS regulator support
Date: Thu, 19 Mar 2026 14:26:01 +0800
Message-Id: <20260319062601.1042965-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318231542.mmbcrqy36oyw44xc@synopsys.com>
References: <20260318231542.mmbcrqy36oyw44xc@synopsys.com>
MIME-Version: 1.0
X-HM-Tid: 0a9d04c5e12303a2kunm33e6bd551ad55b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkkeVkxPHkMeSUxPSksdTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_233122_903280_7B3ABF04 
X-CRM114-Status: GOOD (  10.27  )
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

> I mean this is a generic glue driver and not specific to your spacemit
> k1. Some platforms use regulators to drive the vbus (e.g. dwc3 meson)
> while others for internal controller supplies (e.g. dwc3 exynos). Also,

So shouldn't the generic glue driver manage vbus, but rather the Spacemit
USB PHY driver? I don't have any good ideas about the current name.

> if the platform is operating in device mode, there should be no vbus.

Do I need to check if it's in host mode?

> Also do we want to disable the regulator on system suspend? If so, we
> may need a regulator handle.

I'll add it if you think it's necessary.

I'm not quite sure how to do it well, thank
you for taking the time to review.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
