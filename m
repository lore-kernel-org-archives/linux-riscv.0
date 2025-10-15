Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B442CCD185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 06:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPd0RtB8YLcJzdQ872Ap0S6WHMewOEWuRPDmsY1umaA=; b=lQLZsokSC67nMP
	LSGrsiDRVvVELVDb7HMTcAQ+cImFCl+Zvhio+uWi8PtlWYRBHe5WpyzIlHS+yqHYIhfDO8NgExq43
	PHqvQ93OzFuKLHbNBJoLParkcZSJVQQtFNe90yzksOvkEGKO8I4MCXtc26u9HiiDHp+8iPkQ2B8V1
	DUhCGcnfczCRDhL6yX2OifFBpkIxwOtRHZ6/z7hscHnjR1rKbQIB/Of/3cqeMiTGPJyB76wd956+Y
	nKTD/JVAD3nV3w3LuJOoajIO/vnwJiTgmgHKqghvAz2Lv9GTbgnZKPymr2WOHHq9/AIyiVZaZoSVG
	BIJvJbdm0+G5G12BpgQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8url-00000000ZoI-2VgT;
	Wed, 15 Oct 2025 06:20:05 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8urf-00000000Zal-3MZj
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 06:20:04 +0000
X-QQ-mid: esmtpgz10t1760509149tb52a1c72
X-QQ-Originating-IP: CKHnewHYWDo1Yrf4J42jLvNSa3NYNzjq2GE7A4/LC2k=
Received: from GPU-Server-A6000.. ( [202.201.1.132])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Oct 2025 14:19:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4224186876999705222
EX-QQ-RecipientCnt: 14
From: Yuan Tan <tanyuan@tinylab.org>
To: arnd@arndb.de,
	masahiroy@kernel.org,
	nathan@kernel.org,
	palmer@dabbelt.com,
	linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@maskray.me,
	tanyuan@tinylab.org,
	falcon@tinylab.org,
	ronbogo@outlook.com,
	z1652074432@gmail.com,
	lx24@stu.ynu.edu.cn
Subject: [PATCH v2 5/8] kconfig: add CONFIG_PUSHSECTION_WITH_RELOC for relocation support
Date: Wed, 15 Oct 2025 14:18:58 +0800
Message-ID: <31FE3D0D64425B42+b7172d7ef4e6fa3ee3ed543a44dbc5e467df4da4.1760463245.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760463245.git.tanyuan@tinylab.org>
References: <cover.1760463245.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: MkywfizRgtI7gl6IUHbV9gFmZd4DmX1fyKYw3bvZTZGFcLta7XLFnmuO
	luHsGcJmx4Rk4weyNjkWX32AFAjU8Mv+oRr5KuvhvRd4VjPuO9aJNDZVMXD/0FDoE7T9ieu
	ckqa/OlSFD2TzqCVgJw/SnD+5BLFzd1QbvApRWAOtAUEgsRNY+rK3ebyyj5Qj44fTObTcMg
	GVma8Rzyb3Dx2Y3feMtzAxDwyoPwY7dZWpr4CijAVQz1h3db6XkE2bF4gelqZ0vAR4QOkWW
	I3Yz03KEHq0NcqIrmr6rpVv5Iis0dZI3/pHwBtDpHe+n0FQd5yGNWshSHsTni5j+IRWOl6s
	kw88TMAp4kgW4oy0OcShTCnLCzxbVT+c4gWe7XT/9cviPBGr5vSe2tEY9YiZQvVKg9R8Z9S
	57IKuv9soTALxOMobxppWdTGz8d/fj+ixwWDLtcPgchOoyqFPp1IHW5EwDEaofoGsRIxX8X
	qJvCkXiiBImhukOr/cXk9aS7zR2C22BGzacPoQn5M3bGYOuwYmWrQqzKuGGz+ByYxxiF2j7
	LX3+4h3gEWyhpHlx36E0N4aJtgiXX3eUmf2IMdAeQQkobn5kBoN8DiC3Y7eQsE7FIcgrrJI
	VLMkfkGGV5xdlXYAh/B6ZAYnLjfGH58MR2JNC/tOI9WjMXNPeIFFmirMFDXIam/l0uyM7Qz
	OAQlOxcWCOoodiajGfGWu7uw1U1xkl1XDqlmnmkLMRdMt6N5ijoEUurHDCl4Eikr2zt/uG+
	db5Mk6l7/2+WKFge20r4xSZLeVxTJbEIbM2ch7vDBHF8JbGA/tLIFcETz6NoPDdU2l8TTwi
	cLVMzTg5mPtp4qM0JeiFRWLgTIUREHTqubySPmy+Ccavxdp43931halU6ne+Ri4fPyuG/A4
	jHR+tqw9EriRxrMcpzB9ey31nfMe18wpahEytpI/qSklrmUh0lyggtgiuHdSOTuQqO3Qvoc
	iylIE+xt06n1p7P/2N/foI36u5g++Ia1yjR8=
X-QQ-XMRINFO: OW8WShJdN8S2cMc/fs8JwkE=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_232000_318064_8E6D9612 
X-CRM114-Status: UNSURE (   8.58  )
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

If the assembler supports the '.reloc' directive with 'BFD_RELOC_NONE', we
can establish a reference between a section created by '.pushsection' and
its caller function by emitting a relocation in the caller.

Known toolchain minimums:
- GNU binutils (gas) >= 2.26
- LLVM integrated assembler (IAS) >= 13.0.0

All assemblers meeting the kernel's minimum toolchain requirements already
support it.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Peihan Liu <ronbogo@outlook.com>
---
 init/Kconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 2c6f86c44d96..3d1cf32d5407 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1631,6 +1631,10 @@ config HAVE_PCSPKR_PLATFORM
 config HAVE_TRIM_UNUSED_SYSCALLS
 	bool
 
+config AS_HAS_BFD_RELOC_NONE
+	bool
+	def_bool $(as-instr,.reloc .$(comma) BFD_RELOC_NONE$(comma))
+
 menuconfig EXPERT
 	bool "Configure standard kernel features (expert users)"
 	# Unhide debug options, to make the on-by-default options visible
@@ -1965,6 +1969,18 @@ config USED_SYSCALLS
 
 	  If unsure, please disable TRIM_UNUSED_SYSCALLS.
 
+config PUSHSECTION_WITH_RELOC
+	bool "Trim more syscalls"
+	depends on TRIM_UNUSED_SYSCALLS && AS_HAS_BFD_RELOC_NONE
+	default y
+	help
+	  Enable building relocation-based references between sections created
+	  by '.pushsection' and their caller functions when the assembler
+	  supports the '.reloc' directive.
+
+	  This allows the linker to establish proper dependencies, remove the
+	  need for KEEP().
+
 config KALLSYMS
 	bool "Load all symbols for debugging/ksymoops" if EXPERT
 	default y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
