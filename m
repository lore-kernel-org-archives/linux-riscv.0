Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB971093188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 08:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84QN+AuyaJ/Rfu/vtDE9aqWZlzKzKharHmRJDTx/LaE=; b=a0hr5DEl9OCF08
	wS8H90k7T1YuYh/gxuTIyzTq7uySfT0cxWbas+8dcpsms0A1AMh2H+G9mIUjO8A2C56/uUo9JsLZr
	0GTaR2h9DOdEDXcDCX0FDEY5x6Qp6WWytlRjYUPONBEpciNPUwS9aRaXBgf5QM5xhO2HsQuGfNwwz
	IUg1dasM2QC9o9Xc0dht5KR3iPm2w5/QrE3UHTTC3at0Yzk8z5REJLrPDCOSdbP22jIEhb9OVM/Qg
	zvs2I0rcHQHbq7uPqMJLNaMQNBRklbuhij5SxY0m1WXvS7SnreduyProTG1hSzrE4QRTb/XOronI6
	kzZsxESQeU/Ihubae50w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3V4E-0000000CKVO-3i6I;
	Fri, 20 Mar 2026 08:18:50 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3V4B-0000000CKUH-0rBN
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 08:18:48 +0000
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37af264a3;
	Fri, 20 Mar 2026 16:18:40 +0800 (GMT+08:00)
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
Date: Fri, 20 Mar 2026 16:18:26 +0800
Message-Id: <20260320081826.1331721-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DH7FXPBMB1K5.28IT6DZQ280ZV@linux.dev>
References: <DH7FXPBMB1K5.28IT6DZQ280ZV@linux.dev>
MIME-Version: 1.0
X-HM-Tid: 0a9d0a533c0c03a2kunm66181b331edc28
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUJPVkJOS09JSk1LTUsaGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_011847_452668_97ED0153 
X-CRM114-Status: GOOD (  10.87  )
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

> I don't think it's a good idea to tie this optional VBUS regulator
> implementation to the SpacemiT K1 platform.
>
> While the K1 SoC does have a DRD controller, current boards in the wild
> (like Jupiter[1], OrangePi RV2[2], and Banana Pi F3[3]) all route this
> port to an onboard hub[4][5]. IMHO, managing the downstream VBUS regulator
> via the onboard_usb_dev driver is the correct approach for us.

I'm sorry, but I don't quite understand why it's necessary to use
onboard_usb_dev driver instead.

The DRD controller is connected to the onboard USB hub, so it can
only operate in host mode. If all downstream ports of the USB hub
use the same VBUS supply, then what's the problem with using this?

> K1 platform currently does not need this feature here.
>
> Considering the role switch, I think it would be better to hold off on
> this until there is an actual board/user that relies on it.

There is a board without onboard USB hub, such as the OrangePi R2S.
So this is possible for boards that don't have onboard USB hub?

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
