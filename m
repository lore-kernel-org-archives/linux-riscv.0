Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614D7CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 06:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6brtqIGMSpErEYzDZYJIz4qz04O3JeL47iShYbMMPEU=; b=VFRTct/eANFrMo
	Kct2OwyoQMBkBNQIrRJJbWWwFTOU9FURC+IQ4tZ7KR0oHxEfiiitN1nuN3vgarUd4kM4x74bm9Pjd
	ky9DiCDNeE4P2jF64nXZ2lb4+fB0g9Fo30kYEyZgkvQm/Qm+hcMCNgYUFhLiKzWknb5R7Lns0cxzI
	MJDHsJxfyeESynUvGUr5fDY5+RrXX5XFh2umzX34LZ4vos8ceKGliHCKg2gJa8YDD0eTQIErVkmPK
	K/w2y6MCawJN0TtaSAUfmjOMfj2PuJXW1mi3AtZpgWJn2P/QquCLf4M/u3hHsR9icIxsvs4B4o43G
	PaOtMBKVZMqwjjueYToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRVU-00000005OyW-27TK;
	Wed, 10 Apr 2024 06:32:28 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRVO-00000005OsQ-3fRA
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 06:32:26 +0000
X-QQ-mid: bizesmtp88t1712730689t01lhhz8
X-QQ-Originating-IP: DR2jmQRNoIooP2y4DSvc27GYUaEoyry4t3NtVCqNbKA=
Received: from HX01040082.powercore.com.cn ( [14.19.178.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Apr 2024 14:31:28 +0800 (CST)
X-QQ-SSF: 01400000000000B09000000A0000000
X-QQ-FEAT: BycE0arnt6RHytf6+hWz5URWjN+mlFrqYJZ7Wctl56D5JSUSbjoAAwPUFySvH
	/F2WWk8xOL9VAWvwPgGwIxwb1KNwNvw+ck9oRAQyWw7xTmv8nwZrKHCVpSsviHAdaT5ItK1
	x9HPuGbRcUcpfi2FAEYLBhJ8HUzduNIV1OxAz/h3ZdUxlXyKJQyjqRZnsmijX7Uc3HsB+iF
	YXiitiCFZozuR3kbMjZjxThs8Klpr3OuN++7rRgwl1FHh15pftH7Xh5kDK6yRM5RSYjXgdT
	FmWL7XYqSDqBAcuKXrdCXTPjIIka9ie/f7euWzxPRwejGaIRqp3WWor2K6q8AKispDZhFNI
	hdeSk9bPJlzgG4iYf8ZCLRyc3WMvg2Gi3bgiVYOGipEMq3o2+p817586rCGpwQ3ZaOkFcFY
	zZ+sULD3I7o=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 8989228139429590105
From: Jinglin Wen <jinglin.wen@shingroup.cn>
To: palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	atishp@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jinglin Wen <jinglin.wen@shingroup.cn>
Subject: [PATCH 0/3] Add early console functionality
Date: Wed, 10 Apr 2024 14:31:06 +0800
Message-Id: <20240410063109.20483-1-jinglin.wen@shingroup.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_233223_857415_E727D9B7 
X-CRM114-Status: UNSURE (   7.79  )
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

The following patch series implements support for the early console
on the RISC-V platform.

Jinglin Wen (3):
  riscv: Support for early console.
  riscv: Support SBI as the interface for the RISC-V early console
  riscv: Add information for MAINTAINERS

 MAINTAINERS                            |   6 ++
 arch/riscv/include/asm/early_console.h |  23 ++++++
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/early_console.c      | 108 +++++++++++++++++++++++++
 arch/riscv/kernel/setup.c              |   2 +
 drivers/tty/hvc/Kconfig                |  12 +++
 drivers/tty/hvc/hvc_riscv_sbi.c        |  29 +++++++
 7 files changed, 181 insertions(+)
 create mode 100644 arch/riscv/include/asm/early_console.h
 create mode 100644 arch/riscv/kernel/early_console.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
