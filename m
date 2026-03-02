Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3887BD58E6E
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35lIdamgkiOMPxI0n7HUFebh7aYU4xsr9R3awvXNB4s=; b=zUns4HgIWW978J
	Qq4l/8ZwBcTRBcYhWUO1RRXWPHmi06Wv2EJhELv3qMLh6xCnvPrqEmtSjUYgmspnGRbo/D43tHX0A
	ggnkWbm+oO0RhoC1C/LPuWqH12XNI1iaRr9RLhiY2oP4D54emmcCRuivS33zDr3ZhmQw99iz8fr81
	GOkb2+dVy//YzZ9kH/33Wp/aqJ49Dzbxh/D8vWIOXcb0o7vBZZuPBrRkZgWE//eE0q0jhISAxhAxi
	1bEku4q03xEyJIW+W5/odA/f1VK7cy/naUE4OCHov2faYUY3dZ1q+vChDMOsCpvXaWNEsH6JyX06+
	w9N+OXdFpWbN5LzmX/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxUz-0000000COV2-3k3y;
	Mon, 02 Mar 2026 07:15:25 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwxUw-0000000COUI-2cBU
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 07:15:24 +0000
Received: from localhost.localdomain (unknown [58.61.141.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35677d096;
	Mon, 2 Mar 2026 15:15:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: amadeus@jmu.edu.cn
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe nodes for K1
Date: Mon,  2 Mar 2026 15:15:02 +0800
Message-Id: <20260302071502.63672-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202100000.19176-1-amadeus@jmu.edu.cn>
References: <20260202100000.19176-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9cad66b20703a2kunmba4e2f7b7409ce
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSh4fVhpLTUoZHk4aGUkYT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1
	kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_231522_826957_7C9AFF48 
X-CRM114-Status: UNSURE (   5.13  )
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

> The SpacemiT K1 SoC has 3 PCIe EP controller nodes. Add the
> 'linux,pci-domain' property to assign a PCI domain number to
> each of the controllers instead of assigning it randomly.

Does anyone have any thoughts on this?
Without this patch, the PCI domain number is random.

```
/# find /sys/devices -name net
/sys/devices/platform/soc/soc:pcie-bus/ca800000.pcie/pci0001:00/0001:00:00.0/0001:01:00.0/net
/sys/devices/platform/soc/soc:pcie-bus/ca400000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/net

/# find /sys/devices -name net
/sys/devices/platform/soc/soc:pcie-bus/ca800000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/net
/sys/devices/platform/soc/soc:pcie-bus/ca400000.pcie/pci0001:00/0001:00:00.0/0001:01:00.0/net
```

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
