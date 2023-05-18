Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CB8C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PArvS/9ZG6ZVu4SApY+nVWwFnvyaC1YekpiNepT8r0A=; b=mqLgZRvqyaurjz
	XjQP3vcGxUWwN+FwmtFO18uNNsgeA11nlS+vjlJWoWpAAwzA//NPfrPHu7ZUTn68t5mecB9zJwPLV
	4SGcb1NYPWSQ3NtFYCpBLDBKTUnYWt8GYQMCMBjx7Ced/sGvOIB187U3QqyEUlk8qEuzFurGFhFsX
	hoXaGz/pyet55e5fNY5zEyyCgiaHMmqow0T2J0vEjPqGTHsW1+gyjdLGu5nng2h8IT1Shb3odR4Sb
	TgOKuBqcLBNC2ghr0rXI/F52rh/tKNFq0i2GXpRM9C7BTU+PSwgS1LpoXyyzQ6EpZ1Ca8UvUQr5k8
	igRS3MlUsybs1liw2OAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdSn-00D3P6-2f;
	Thu, 18 May 2023 13:14:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzdSl-00D3NZ-16
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 13:14:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3DDE64F4D;
	Thu, 18 May 2023 13:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591ACC4339B;
	Thu, 18 May 2023 13:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684415674;
	bh=qCpMPb52tthAzWjTWrS3Ez2Gh56jo5/cV/qoXhNQ0vM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SLWWWIPvdfekKIZ2DxDQt3ndwgs9Elm0COQLac0Rt9k1JespW6tf+PvRnJOQVd7tg
	 lncnDcGrZbv7tZRJqImpTAd0dGU0mlf7gW2HmKzWHk7/voeo3Nx55OuPWH0mxjAwA/
	 0CvUsOr48QIsVUrcLiY/Jk04fBahXRUnwHGUVhNQ65P3p0QVW0MtMu6d3JzqbdeIJU
	 TSx0eo63ZrKxmVnbIQOB33Vzs0D4X9Ds0UGZMS+i6RB9lblXdE1VEcvKNoPp0puZ1s
	 8wiPjcn2n+bAjfX4rTVMn3OGCVhwhS8MWg0zREQSOha7VukOMSvbaIuFNO9QMhzLvn
	 5DvA0X36Fyv2w==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	mark.rutland@arm.com,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	rppt@kernel.org,
	anup@brainfault.org,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	luxufan@iscas.ac.cn,
	chunyu@iscas.ac.cn,
	tsu.yubo@gmail.com,
	wefu@redhat.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	corbet@lwn.net,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH 20/22] riscv: s64ilp32: Add rv64ilp32_defconfig
Date: Thu, 18 May 2023 09:10:11 -0400
Message-Id: <20230518131013.3366406-21-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230518131013.3366406-1-guoren@kernel.org>
References: <20230518131013.3366406-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_061435_420470_B7ED4AD0 
X-CRM114-Status: GOOD (  12.28  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Follow the rv32_defconfig rule to add rv64ilp32_defconfig; the only
difference is:
-CONFIG_ARCH_RV32I=y
+CONFIG_ARCH_RV64ILP32=y

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Makefile               | 4 ++++
 arch/riscv/configs/64ilp32.config | 2 ++
 2 files changed, 6 insertions(+)
 create mode 100644 arch/riscv/configs/64ilp32.config

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index d47ba6b09b41..22b62de62192 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -187,3 +187,7 @@ rv32_defconfig:
 PHONY += rv32_nommu_virt_defconfig
 rv32_nommu_virt_defconfig:
 	$(Q)$(MAKE) -f $(srctree)/Makefile nommu_virt_defconfig 32-bit.config
+
+PHONY += rv64ilp32_defconfig
+rv64ilp32_defconfig:
+	$(Q)$(MAKE) -f $(srctree)/Makefile defconfig 64ilp32.config
diff --git a/arch/riscv/configs/64ilp32.config b/arch/riscv/configs/64ilp32.config
new file mode 100644
index 000000000000..7d836aa2fae7
--- /dev/null
+++ b/arch/riscv/configs/64ilp32.config
@@ -0,0 +1,2 @@
+CONFIG_ARCH_RV64ILP32=y
+CONFIG_NONPORTABLE=y
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
