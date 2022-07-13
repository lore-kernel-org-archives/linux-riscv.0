Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B440C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QdkcTQkEP2rsJZrIvqwtvhGec9SI22hRDwXt5lUfnVk=; b=4aOi+bP/Cqt/7m
	FM4QFCg/xJk+eJFVEAx5NpXmbmsxejde3BimQrOfYEE+/jFqpFx6tzbFTbCZmp0ubKDkLM6CzsrgD
	EBnI3yO97MepN5oSy7KiRyr7Tt+UnqCFn8bKLFkGb59iVgGYC+Kt9eMtTrUGEWB/6cBYAFAhuPA68
	4AFQ5rsSq0JmvBWIbSVLrV4ghibUhbzkFUWKWEe6DgAhccEqFdcdSqv4CrXBWZhan+gTSurla61+8
	704nGJ3Yx+tLWzQwiL8LklQ2FQZJ9LhOEgtinHAIPW8WcEumRDSvfm6hWh6EUA9s24CjCu7rAVbDc
	wEOF9C3rKThHwEvn67BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBaxr-003JJg-IV; Wed, 13 Jul 2022 11:55:35 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBaxo-003JG9-Uq
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 11:55:34 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0VJDr3B3_1657713325;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VJDr3B3_1657713325)
          by smtp.aliyun-inc.com;
          Wed, 13 Jul 2022 19:55:26 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexandre.ghiti@canonical.com,
	guoren@kernel.org,
	anup@brainfault.org,
	mick@ics.forth.gr,
	rppt@kernel.org,
	heiko@sntech.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huanyi.xj@alibaba-inc.com,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH 0/2] Improve vmcoreinfo and memory layout dump 
Date: Wed, 13 Jul 2022 19:55:21 +0800
Message-Id: <20220713115523.357817-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_045533_198158_501972D1 
X-CRM114-Status: UNSURE (   3.79  )
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

Xianting Tian (2):
  RISC-V: Add arch_crash_save_vmcoreinfo support
  riscv: Add modules to virtual kernel memory layout dump

 arch/riscv/kernel/Makefile     |  1 +
 arch/riscv/kernel/crash_core.c | 28 ++++++++++++++++++++++++++++
 arch/riscv/mm/init.c           |  2 ++
 3 files changed, 31 insertions(+)
 create mode 100644 arch/riscv/kernel/crash_core.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
