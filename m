Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A65FC9EC3
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Mar 2026 04:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZryXk2bPnE6++xOlH/ZxoLwWBH7xf/SHW7r27yK/tyM=; b=dvwERpz4V7DB+Q
	G5TAfgD5eRhkhyRq0DuBetpcPTqv2xH1WqSW09/I81sFgTEtiaREFR8Gw4K5qCaNEj0d1JHv5l3d6
	44YERfGKDvRB55gSDyoanKKawObh0WTeT/HliE7wuMvRjs6UFRSY9p0sspTSh/u9zfMHLNbk/gnSW
	K1DQxXeLfPkcwMX1B3ccs7CmJnrzDUBzxYz0qhJsHM64QbyLvCsCshf5CtkkQ0lUuJJQ2xuzHW8lu
	mo8YERYxyzDUhshCMgyflkLwjziUlCoxn/1hUmbxsOMogYxwRjWsfVNA91PGS0Ivqzk1sZLSt7caT
	kNT4LyXG14U3erREYm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyjVn-00000004tK0-0cpc;
	Sat, 07 Mar 2026 04:43:35 +0000
Received: from mail-m60236.netease.com ([210.79.60.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyjVk-00000004tJe-3xXz
	for linux-riscv@lists.infradead.org;
	Sat, 07 Mar 2026 04:43:34 +0000
Received: from localhost.localdomain (unknown [58.61.141.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36147d6ec;
	Sat, 7 Mar 2026 12:38:12 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dlan@gentoo.org
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
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
Date: Sat,  7 Mar 2026 12:38:06 +0800
Message-Id: <20260307043806.957175-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302074235-GYB288339@gentoo.org>
References: <20260302074235-GYB288339@gentoo.org>
MIME-Version: 1.0
X-HM-Tid: 0a9cc696b9c303a2kunmfc861db58871d2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGB0YVhpNSRlLSx9MSx4ZT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1
	kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_204333_246267_2678864B 
X-CRM114-Status: UNSURE (   6.06  )
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

> You describe what's has been done here, but no why?

Because the PCIe boot order is random, if there are two R8125
network cards, their interface names will not be fixed.

For example:
First boot:
pcie@ca400000 -> eth2
pcie@ca800000 -> eth3

Second boot:
pcie@ca400000 -> eth3
pcie@ca800000 -> eth2

If their PCI domain numbers are fixed, I can fix the interface
names by matching /sys/devices using a script.

> Can you add description about why problem with random domain,
> and the motivation of the change behind?

Should I improve the commit messages?

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
