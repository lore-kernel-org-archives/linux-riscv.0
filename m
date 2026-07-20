Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0031C4451B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 03:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bCnSmsbevGJyoj01c8n/B0dQa+hbe7+aoEy4uNCPW9Y=; b=gg8Q0Ecls0I25I
	BYM4OoDebJM31V1LbRPbQ2sAS8+XnVLL6KP0AfREECQdVwsamXT7TfDRAcMENId446xNAl6iiF8v/
	k7paMhNiG+MCW6D3BVbMOmNxDCZmWXb7qVpmrsBf91xHylR8V3bGpxwhnZr5VFPbWQ4gE9y0yRTbU
	2tQ0/Qyg+x1S4VIPWGq41I/hfhO6xvAvocw9XeFH4nVm2hCLAxr1u0k/vxIhMzsBM0u1Mu0PEksWz
	w2St3Ku1nc15ZHgm/9giGX+H16HWG+mQOQw/eB6wR+GOmStFhjrAkS6AMoGgKxIpoW4zcyid66lSN
	0P2lJJdIZXbKPCzovLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlebT-00000005kwL-38Gp;
	Mon, 20 Jul 2026 03:23:39 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlebP-00000005kvG-1iEf
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 03:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=+X
	Mn/HERRhRRdCWQyLmAD3zDxrzoE0ajebjYk7PWN9c=; b=SJAj9QxPGPtl/ULag3
	wjlHyp7gnhGEdbqCSwYB8Qu6RsfjhvINBHreW06FjD4QYCZSd6BgtdJELsYtguyt
	r827Vq5wNHcpXJk4AKio9dIODgqcHarbjsXlCblAFkhVW49nBoeh9plVme9TAEgt
	NDCh77mQEHTW/zfXNbOR5DKAs=
Received: from Ubuntu.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBH+wKTlF1qrd2XIg--.2654S2;
	Mon, 20 Jul 2026 11:23:00 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH v4 0/2] riscv: fix kprobes on minimal kernel configs
Date: Mon, 20 Jul 2026 03:22:55 +0000
Message-ID: <20260720032258.5188-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: PigvCgBH+wKTlF1qrd2XIg--.2654S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XryDJFy8ur18KFyxKF13twb_yoW3KFX_Gw
	1xtry3K3y8XayakFn7Kw4fWryjkayqgay8Cr1UAFy2gwnI9r9xCas5tF98Aw47Ar4fKrn3
	Zas3uFy3Ar1IqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRZJ5otUUUUU==
X-Originating-IP: [223.104.164.77]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAhQ8P2pdlJRRCQAA36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_202335_920412_7C3A725A 
X-CRM114-Status: UNSURE (   6.36  )
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

When building with an allnoconfig-derived minimal configuration
(without CONFIG_STRICT_MODULE_RWX), kprobes fails because
instruction slot pages from EXECMEM_KPROBES are read-only and
patch_map() bypasses the fixmap writable alias.

These two patches fix the infrastructure.

PATCH 1/2 changelog:
  v2: use CONFIG_STRICT_MODULE_RWX instead of ARCH_HAS_EXECMEM_ROX
  v3: add commit description
  v4: fix indent alignment

PATCH 2/2 changelog:
  v2: add commit description
  v3: early return when !CONFIG_STRICT_MODULE_RWX

Xiaofeng Yuan (2):
  riscv: mm: make EXECMEM_KPROBES writable without
    CONFIG_STRICT_MODULE_RWX
  riscv: patch: skip fixmap mapping when kernel text is already
    writable

 arch/riscv/kernel/patch.c | 4 ++--
 arch/riscv/mm/init.c      | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

--
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
