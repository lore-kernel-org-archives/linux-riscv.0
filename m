Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF835C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 07:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZbkrTmbADUdlFl/xgm4N+Y9A+CibWUwrFVBhQuyR524=; b=AcO+OPOXRziFVS
	P8MklInW1s+D6zy7qgl3yZs7rsckgP5LB4rrIv1V6uG6gr/829/zt5VDmkwhXbOMOmGbfktRLyxAm
	F3sXfRVqu4XNLUJ48a/zAII19Tw7UaE5lItKaMMtrbiMy5Qx/uWqzG8Mmblf23dKn4FDEZG7/2tXc
	ssK0YpkO+nYmUbOBMnKyXOfn+NYMX/k03hRV2ExVRQoLK5z+s6ymvhLK51mdn0jUNNi5glg0DjoQo
	yvVOuduM3rfvavcXFBPBBUwfI/bTibe61J2VwwR22YJzoeOYxi8obyKQusQByEx7ugkVCk8GJZiDz
	o9bc6Rsc+ulFu9Gx04ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9iTA-002F9O-7s; Fri, 08 Jul 2022 07:32:08 +0000
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9iT4-002F5D-GK
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 07:32:05 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VIij5CL_1657265513;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VIij5CL_1657265513)
          by smtp.aliyun-inc.com;
          Fri, 08 Jul 2022 15:31:53 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	guoren@kernel.org,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [RESEND PATCH V5 0/2] Two fixups for 5.19-rcx
Date: Fri,  8 Jul 2022 15:31:48 +0800
Message-Id: <20220708073150.352830-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_003202_760478_D876B474 
X-CRM114-Status: UNSURE (   5.76  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,
The 2 patches are some obviously fixups, could you please have a look?
Recently, I finished the development of Crash-utility for RISCV64,
I will submit the patches soon.
We expect we can normally use Kdump & Crash for 5.19-rcx.
thanks.

Xianting Tian (2):
  RISC-V: Fixup fast call of crash_kexec()
  RISC-V: use __smp_processor_id() instead of smp_processor_id()

 arch/riscv/kernel/machine_kexec.c | 2 +-
 arch/riscv/kernel/traps.c         | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
