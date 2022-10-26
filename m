Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416B4C38A2D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 14:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U3nRIRJjo4wFkiyzidXWaKgDClOZdXGpI6ghts3HWnc=; b=zU1ijzytLYooSJ
	VJ7RZFBhv/spkImB87NpDyExrdSZJDUAJt/zYq7Qgiyvykd3mo2WdImN2zXUKPKNAHNEcD2qCGZJ1
	T689xIZM6z1lwHhreuzb6Egw3/y5bqwhChcZYaD+k4ig1MFejwudaTskOrulXCHhrGJBWdinxL17S
	+/dAEK2h4rY+geItutAFzB5TkuxMgHUE/WPSc6wVADLAfwo6oU3LW2RknX4NeG4wqlWqD6wbl6Zia
	xBEV0i2IbYLGSWN0STgI769ENPaGa2n+UIFWdBfqyrZEaHY95ELKisR/eY6cCBUh8hpjD58q1K2yt
	UjXiv6FiT5/6IkuNaIgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onhc6-009i6n-D7; Wed, 26 Oct 2022 14:42:38 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onhbz-009i51-AC; Wed, 26 Oct 2022 14:42:33 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0VT7dcjL_1666795330;
Received: from localhost.localdomain(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VT7dcjL_1666795330)
          by smtp.aliyun-inc.com;
          Wed, 26 Oct 2022 22:42:23 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	heiko@sntech.de,
	guoren@kernel.org,
	mick@ics.forth.gr,
	alexandre.ghiti@canonical.com,
	bhe@redhat.com,
	vgoyal@redhat.com,
	dyoung@redhat.com,
	corbet@lwn.net,
	Conor.Dooley@microchip.com,
	bagasdotme@gmail.com
Cc: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	crash-utility@redhat.com,
	heinrich.schuchardt@canonical.com,
	k-hagio-ab@nec.com,
	hschauhan@nulltrace.org,
	yixun.lan@gmail.com,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH V5 0/2] Support VMCOREINFO export for RISCV64
Date: Wed, 26 Oct 2022 22:42:06 +0800
Message-Id: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_074231_968678_877D41F7 
X-CRM114-Status: UNSURE (   5.92  )
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

As disscussed in below patch set, the patch of 'describe VMCOREINFO export in Documentation'
need to update according to Bagas's comments. 
https://lore.kernel.org/linux-riscv/22AAF52E-8CC8-4D11-99CB-88DE4D113444@kernel.org/

As others patches in above patch set already applied, so this patch set only contains below two
patches.

------
Changes:
   Fix commit message in patch 2: use "Document these RISCV64 exports above" instead of
   "This patch just add the description of VMCOREINFO export for RISCV64."
V1 -> V2:
   Remove unnecessary overline above header text in patch 2.
V2 -> V3:
   Fix commit message in patch 1,2; 
   Use 'space' instead of 'region' for vmemmap description in patch 2.
V3 -> V4:
   Remove unnecessary kernel space export:
   KASAN_SHADOW_START ~ KASAN_SHADOW_END,
   ADDRESS_SPACE_END
V4 -> V5:
   Remove IS_ENABLED() judgement for KERNEL_LINK_ADDR in patch 1.

Xianting Tian (2):
  RISC-V: Add arch_crash_save_vmcoreinfo support
  Documentation: kdump: describe VMCOREINFO export for RISCV64

 .../admin-guide/kdump/vmcoreinfo.rst          | 29 +++++++++++++++++++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/crash_core.c                | 21 ++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 arch/riscv/kernel/crash_core.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
