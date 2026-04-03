Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCCCD730A2
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 07:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jM6Ef4tFbUQOG8nUXH+HRrhzT3IwPnW6PO3hJbIgGB4=; b=mrti887emL0bE0
	1ThZmz/OfAKk/QrjfVMjF5CLxkSo6NAmurh9UbYwfTqdLVcoupuFZ20LsCHm7xWB3t2SztbBOkkx1
	I5i3c6ghny3Jje9wVDKJpbe1PeQiXZgPukv/2g36ykKmDlQMNgnvu1C1ptSHWmw27ThpNH4FUqutD
	iqpkdFY9PgPbc82N3m0Rgv3BT+H6OMLgmtfbaHvpXQy56XE3Zol9bXTzuVBNW4aSxjki8pkAQpBaH
	lfp3SaL1s4XtkWFcwvTCBvX2ixxAUBQdrJ14rVn0op4lABb6aD58qyOPyEaLpLPZ7i8zqhQBce5rt
	BPVYSqpibE991L9bMOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YW1-00000001QdT-1EPM;
	Fri, 03 Apr 2026 07:00:25 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YVy-00000001QcZ-0l2a
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 07:00:24 +0000
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 396ceae87;
	Fri, 3 Apr 2026 15:00:13 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: michael.opdenacker@rootcommit.com
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
Subject: Re: [PATCH v2 2/3] riscv: dts: spacemit: enable USB3 on OrangePi R2S
Date: Fri,  3 Apr 2026 15:00:05 +0800
Message-Id: <20260403070005.213650-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <46e715a4-0fd7-4692-9a25-a44d469b17b0@rootcommit.com>
References: <46e715a4-0fd7-4692-9a25-a44d469b17b0@rootcommit.com>
MIME-Version: 1.0
X-HM-Tid: 0a9d522472bf03a2kunm6fbba61a591df7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSk9LVhgdS0sZHkhCQkNNGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_000022_451984_F017269A 
X-CRM114-Status: UNSURE (   6.48  )
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

> Thanks a lot for the patch!
> Would you mind sharing your configuration with me (in PM?).
>
> I can list the USB 3 hub, but I can't see the USB mass storage device 
> plugged in the USB3 port.

Are you running the latest linux-next? Otherwise, a patch is needed:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=764c2e6e60bf17910d84e7179fee14129e053b96

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
