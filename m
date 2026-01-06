Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EBEC47BDF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 10:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmZl1HwGa4BN/B76RdHLsuN30AWn3X7G8JL8nvgImeE=; b=SYSV+eWdW9ADHC
	g6tLCrOjcbWNw2FskSBzLipbDFvkNivxSC551ZTPgTWvEICKKiad971uDcuYLSt28hqnZh+B7B44/
	p8Qcz9QtTxDJtZbAIq2B+hvU5h4GwMArbhgiKCR11Ye8g0VQTFmvkWfj2PTb9BvlcKKBGh9VE2klP
	PLCbI3SDU3F1JtSjLEghnQVo/gcRPyqI+CPONDGJdvXJPtnPV7Fdv0lIUGDfO/fTExCYAohU+9VpT
	MkdkTxF3RZLWS2Gpdot8arZtns3umKotw+qEzfBg9vaUiJh17vi1GYHP4SjS2yWmrhtbeVDHRxWY8
	rGGcj0X75tqCdFYGtrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4KY-0000000CnhN-49ZL;
	Tue, 06 Jan 2026 10:30:26 +0000
Received: from mailer.gwdg.de ([134.76.10.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4KV-0000000Cngd-2jvG
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 10:30:25 +0000
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vd4KP-0008h6-2z;
	Tue, 06 Jan 2026 11:30:17 +0100
Received: from Mac (10.250.9.200) by MBX19-SUB-05.um.gwdg.de (10.108.142.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Tue, 6 Jan
 2026 11:30:16 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: <pjw@kernel.org>
CC: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <daniel.weber@cispa.de>,
	<jo.vanbulck@kuleuven.be>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <lukas.gerlach@cispa.de>,
	<marton.bognar@kuleuven.be>, <michael.schwarz@cispa.de>,
	<palmer@dabbelt.com>, <patchwork-bot+linux-riscv@kernel.org>
Subject: Re: [PATCH 1/2] riscv: Use pointer masking to limit uaccess speculation
Date: Tue, 6 Jan 2026 11:30:10 +0100
Message-ID: <20260106103010.5577-1-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <6f196be2-3d56-75f5-78d8-800138a8ba46@kernel.org>
References: <6f196be2-3d56-75f5-78d8-800138a8ba46@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: mbx19-sub-01.um.gwdg.de (10.108.142.54) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_023024_092558_2E7A774B 
X-CRM114-Status: UNSURE (   7.02  )
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

Thanks for the feedback.

> I would suggest to fix VA_BITS definition instead of defining a new macro here.

I can make VA_BITS branchfree at the cost of readability. Let me know
if that's preferred over a separate macro.

I agree that the guard page approach is more robust than clearing the sign
bit. Is Smnpm currently used or planned for the kernel? If not, clearing
the sign bit should be sufficient since it creates a non-canonical address
that always faults.

Thanks,
Lukas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
