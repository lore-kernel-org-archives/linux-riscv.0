Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB68108B8E4
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9PuvDFXv0OS+Sa/36mJIcFBvy9UBAXFSv2qDHmEzmSY=; b=k/paIPdqath6wF
	bhThA6+p4ojW6cTZ8nKgHCNRmZDJcP46URM0CDR51janawwrKCYNE9qsd5TBwXbcTlt/n7EqXnvVM
	aOE4e+M9R2vNXHGTkq+JDCl+JnVWx+quTb8NUY5LhKshKKXpG7BKyerQXj0jhh4nFrfruQ9ijZiAX
	4WksMMXsWAaA6zqD6KEnngCSWT2W1pCU9XxIRdb1a2eZ/2tKVgFOok6SLMRvo54u7/Wn8RHHW8BzG
	pqaRbXhzIqCJaP3U09tlfRXnILjc8N+4fIY0mOmqR1TyeVM3rM5tHZ8Y2CYiLuKzexxhpiFCb2j8M
	0ZjIZzLi+wXWG7f0aEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Wfo-0000000CXTx-278n;
	Fri, 20 Mar 2026 10:01:46 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Wfk-0000000CXTd-2bpz
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 10:01:42 +0000
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37b2f4e33;
	Fri, 20 Mar 2026 18:01:35 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Yixun Lan <dlan@kernel.org>,
	Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 0/1] usb: dwc3: Add optional VBUS regulator support to SpacemiT K1
Date: Fri, 20 Mar 2026 18:01:19 +0800
Message-Id: <20260320100120.1343629-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9d0ab1744c03a2kunm090bbcfb1f2c00
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDT09DVhhOQh5ISx8dHxhPHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_030140_850585_0C3DC707 
X-CRM114-Status: UNSURE (   4.33  )
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

The vbus-supply property has been declared in spacemit,k1-dwc3.yaml
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/usb/spacemit%2Ck1-dwc3.yaml#L71

Changes in v2:
- Improve commit title and messages
- Enable regulator only in host mode
- Enable regulator when matching compatible "spacemit,k1-dwc3"
- Link to v1: https://lore.kernel.org/lkml/20260316080000.3130372-1-amadeus@jmu.edu.cn/

Chukun Pan (1):
  usb: dwc3: Add optional VBUS regulator support to SpacemiT K1

 drivers/usb/dwc3/dwc3-generic-plat.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
