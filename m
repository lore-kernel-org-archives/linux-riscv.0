Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075B9106F30F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 10:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z4r1h8LxiPyeQZfk0jO0j6S9vMQ2Gz8+GZHrBOOgQC4=; b=SckUfYoqAaWtCe
	ZDJhZ7RQCug2nObckQgdZqMzCJOG7hm7y88aoY1LUUXC0xWS3XWlIXVoAweqYQCCL9t+r95OM1PSz
	VxJaKILOlL/OXRAc/eAQfX2LzeZxZNpVipfB9QtVVP2lzC4uXJCcToo7QRtvxRT93BDpJ9vtivSsS
	b0Y/yset8JDOWYBJ2m4xVJOXs2KwKOhSPFnekCikhylKhlFgS7xHHMWBhLkbcRvZgKR9xdhE01qXE
	K0sPMd+DYdApe6Yv+0HcG8ZvNnmh13pMNzfAkEOB/yOi1p5mNxWnTONFR0GO1GV0CLQRInqIcgviz
	yuH5T9CTsryL+vAyIOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hVy-00000005Cgl-1gni;
	Thu, 26 Mar 2026 10:00:34 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hVp-00000005Cem-3T7k
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 10:00:30 +0000
Received: from Vostro-3710.lan (unknown [116.25.95.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38672f74f;
	Thu, 26 Mar 2026 18:00:17 +0800 (GMT+08:00)
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
Subject: [PATCH v3 0/1] usb: dwc3: Add optional VBUS regulator support to SpacemiT K1
Date: Thu, 26 Mar 2026 18:00:09 +0800
Message-Id: <20260326100010.3588454-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9d29966bbf03a2kunm60643231383e9c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUgZVkJLTUMfQ0NNGUMfTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSktKWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030026_055885_5D5D464E 
X-CRM114-Status: UNSURE (   4.77  )
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

Changes in v3:
- Add missing properties and adjust position
- Link to v2: https://lore.kernel.org/lkml/20260320100120.1343629-1-amadeus@jmu.edu.cn/

Chukun Pan (1):
  usb: dwc3: Add optional VBUS regulator support to SpacemiT K1

 drivers/usb/dwc3/dwc3-generic-plat.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
