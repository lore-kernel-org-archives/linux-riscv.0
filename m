Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469CFC982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 06:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mQE64he700nY6+kCQ2iBgfN7glx1uWUQjLul/4XEDI=; b=2cKetDabbltN2Z
	5xGq716rrQv7kuhZ35TDxohO1CY/VK5p41Ytj+USv7nXVcpuohV3eA37zoQbPvWAmamn3bbwcy/Vk
	UCybPMSoMHGTdRHqP3JMRyoPE9ACv5pPveNrGhJkHoRW1/d1ec7xTdjgaR5g35wgj+ZR+vLMrvrWD
	lIGlnbe/XgETuxmpF/xzEEwrjlOelJyOwf4mY12WPrwpgnPAaeHYU+NTvAPMZ/h71j7qEe85+rsRb
	0rJ03cgsUg5LRYNEiVnQFK4d2mHXjbWMlL171bgduTidG/P667c/gA+bjqV4UJQxByBGvAxbysDKF
	cINArhv8GIPt2VnqCmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Geh-00000007JH8-2aes;
	Wed, 23 Sep 2026 06:40:35 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Gec-00000007JGa-0EgA
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 06:40:34 +0000
Received: from Vostro-3710.. (unknown [14.220.232.127])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ed5b22fd;
	Wed, 23 Sep 2026 14:40:24 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@kernel.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
Date: Wed, 23 Sep 2026 14:40:20 +0800
Message-Id: <20260923064020.210794-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922072910-GKB353745@kernel.org>
References: <20260922072910-GKB353745@kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa0ccfe7abf03a2kunma5b305ac7f7e3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSh0eVhlISk5MSEwZGUNMQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpJTFlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_234030_259316_839D36B6 
X-CRM114-Status: UNSURE (   6.53  )
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

> So checked the code, it's not a direct problem of /alias, but due to the
> env variable provided to override the mac address, see

> In this case, I don't think it's necessary to drop the ethernet alias,
> I mean it's totally fine if there is uboot ethaddr env and it wins

Once U-Boot overwrites the MAC address in the DT, of_get_mac_address()
will return 0, and of_get_mac_address_nvmem() will not be called.
Then I think this patch is useless.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
