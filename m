Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4317BC44512
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EPWhHVHOnEjQha+6tQgnpaxtOHziwKvaegBocRklQ1Q=; b=U/eKrmmMmn+Vgq
	op57j7XXhc3+U8ZJ/1Vu4QvbJ8qp/Uzrq91noZ0gaT5xl+odBORLZpmSDLMQgBV/bXeNXNPFdNncV
	4C3O+nxdPqjvemrb+DExhRcvY6loNelJew1NuowKUsQm+kpcJw4JrsaMYWukoBAculgHotlCnAIoo
	EareATQMm3h+iHUGyB0rj+CU+Fk5rttzO2pDIegN10Dsdmr/cYgUzFiXWYhbsgbxBpKcmwS3ccWJ9
	FU0HScssGOvjPWATNCQn7/Rj2BKAm/bPU39Texp5Ion9DFQeMj2iifYLEwZcVoePEpU2TEUYE6R2l
	u90O4yEHg8pJAfO/m8zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlNre-00000004soK-0KTL;
	Sun, 19 Jul 2026 09:31:14 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlNra-00000004sno-2MjM
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 09:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=62
	XoSo48bEdF6mCndS9Tdt19X98FGEVyGmooRFe2RUc=; b=jTbAzq+jaAkozG1gL6
	VW44x+N7GnEoCQMHqQkG3H0EAE6xeYVeJZFWOW1TfqSAa81afEmC8KTgAKtsKKvO
	af0mfQ3VbvDN4J1kUdi5nlaNKc2BPyYsY7TwxVCkgRnlWYM4Rhz8u5UaPVDeApu2
	lqQwebReoKUlECZbIGQ105SHc=
Received: from Ubuntu.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCnTyswmVxqbA0SIA--.60699S2;
	Sun, 19 Jul 2026 17:30:25 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: fix kprobes on minimal kernel configs
Date: Sun, 19 Jul 2026 09:30:22 +0000
Message-ID: <20260719093024.33351-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: PygvCgCnTyswmVxqbA0SIA--.60699S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XryDJFy8ur18KFyxKF13twb_yoW3urg_Wr
	1xtrySkw48Gayaka4xKw4rGryqkay7uay0kr4jvF9Fgw129wnIk3s5Kas8Aw4jyrWfKrs3
	Za93uay3Ar1IqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8BBT5UUUUU==
X-Originating-IP: [39.187.244.72]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAREkJ2pcmTH-CgAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_023110_982742_D0B2E3B6 
X-CRM114-Status: UNSURE (   7.18  )
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

v2:
  - use CONFIG_STRICT_MODULE_RWX instead of CONFIG_ARCH_HAS_EXECMEM_ROX
    in PATCH 1/2
  - add commit description to PATCH 2/2
v3:
  - simplify PATCH 2/2: early return when !CONFIG_STRICT_MODULE_RWX
    (suggested by Nam Cao)

Xiaofeng Yuan (2):
  riscv: mm: make EXECMEM_KPROBES writable without
    CONFIG_STRICT_MODULE_RWX
  riscv: patch: skip fixmap mapping when kernel text is already
    writable

 arch/riscv/kernel/patch.c | 4 ++--
 arch/riscv/mm/init.c      | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
