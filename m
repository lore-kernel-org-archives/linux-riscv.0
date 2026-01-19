Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8931D29C28
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjXwVcht9I4gGX1FmsE2/MF0+GlT/gk19rzPAJxJ6i0=; b=AZQ1r2uUVEwZzr
	uKk1c/hjnVY4SsXAq5KBA4emPmQZSky7DNInLNU5UD1fMJgpqcz1CXHQZZ1lXvmoj07jJb/wfhXGo
	wtzmhUq1VX2TjRlMslD2pIIsn9/r7xQtqGAWAji7WVRxJ4hinxCWg64fCsfJVa5oAc7WHGMZTBQvj
	4bRDYMaA3cVuYVElyYMQ/59t4xN7hxwN5e+WuUis+PodOL1UoPTMMVEB12mef6aXqntlWlEUVc/jr
	T5pMeOgIY9lRPSV8lC+jkMUOhbXQAp1KQEx+Rsu8BszvKMrn/XuEyem8qN1b3KQFCRageqxMyI7kz
	YE+dnsjwUSlCjAmPzXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq3h-00000002EF9-1L7D;
	Mon, 19 Jan 2026 14:16:45 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq3e-00000002EEp-2x3R
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 14:16:44 +0000
Received: from localhost.localdomain (unknown [116.25.94.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 312c49402;
	Mon, 19 Jan 2026 22:16:28 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: wangruikang@iscas.ac.cn
Cc: amadeus@jmu.edu.cn,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dlan@gentoo.org,
	edumazet@google.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] net: spacemit: Check netif_carrier_ok when reading stats
Date: Mon, 19 Jan 2026 22:16:20 +0800
Message-Id: <20260119141620.1318102-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e3890633-351d-401d-abb1-5b2625c2213b@iscas.ac.cn>
References: <e3890633-351d-401d-abb1-5b2625c2213b@iscas.ac.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9bd69d3e8a03a2kunm0c2bdb8b3281c6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHx0aVh9OSBgeHUoeQktIGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_061642_904294_CC1B913E 
X-CRM114-Status: UNSURE (   9.49  )
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

Hi Andrew, Vivian,

> I am unable to reproduce this problem.
>
> Can you elaborate on what you mean by "not linked up"? I couldn't
> reproduce this on an unconnected interface.
>
> I would also appreciate more information on this in general - full
> kernel logs, hardware information (which board, what you were doing
> with cables, etc...)

I apologize for not expressing this question clearly.

I'm trying to run OpenWrt on OrangePi R2S and OrangePi RV2.
Unlike other Spacemit K1 boards, OrangePi uses the YT8531C PHY.

Read stats when the interface is not connected to a network cable:

root@OpenWrt:~# ethtool -S eth1
[   71.725539] k1_emac cac81000.ethernet eth1: Read stat timeout
NIC statistics:
     rx_drp_fifo_full_pkts: 0
     rx_truncate_fifo_full_pkts: 0

I just discovered that adding "motorcomm,auto-sleep-disabled" to disable
the sleep mode of the MotorComm PHY prevents the problem from occurring.

I will send a DT patch instead. Sorry for the noise.

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
