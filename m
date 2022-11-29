Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAC5C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 03:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyKHys7CJ+E/XNSeLqo7kUI5lVtm0y8opQTqTckBQcQ=; b=HnmX1QUzGyEV5Z
	rv4Bp7edD9dxQ3tGHooVT5etV2VRQFM+yOP/AqBa9wDxj/4ac0jsuYeOZGFptNOfDokHVxx2AiCbB
	X1lV8Detmof9uDjMEYwmlPax3TsxsB4vd4ZeLZCKyKu4cQfXnz6X6bg4Zk7AgvJx/t8W8YXLaF6DX
	OCi6no7r+svTOEsuzsfF86gOGrBl4ySk9V9ebMzgREfHqywbgHe5I8uz0vT3aVCFvmx6TvzaFPdMW
	5v/aHI2IiSRt9YsxlYZIkGPT/IOQa63ZOGvXwJQSmPFySDDlLr9JVLG3gtc2VV5kN8/GB6wCrK+2E
	fypBAZyL8VcW5g6n3pBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozrMf-005jqU-C4; Tue, 29 Nov 2022 03:32:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozrMb-005jnt-UB
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 03:32:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 758D1609FA;
	Tue, 29 Nov 2022 03:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495BEC433C1;
	Tue, 29 Nov 2022 03:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669692772;
	bh=K44IU5zSr+xRSYeCBFFHSvlbL/P6QS9pgaMT4XAkl6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JfE3oA5mgIwqLGrffA4x/XQlpl+PMzc9gjYvnBjXyuTbiniCSQxD8ob+NUI/DItKL
	 4+nT8+0XM652AS1VRhoVtKrbHMc9hDpSKtPqzDbWAs2dQCjt6rVDG2cvF7aRXYlL9U
	 CpMmWLe6ojyuppm+G5mt9KY58hJ6m8L25Pxjf4c3x04OSV/+EdltM5R3aC0bbe/5Y2
	 9trkjq31gePrrBdZBp1yM7xqtb6+byICy40k/F1SmgopjOJ2D9Ql6etifZF4NHV9S0
	 Uk3o/IcOnOyrKrTO0OhuETVa9jTV/BJgI+YgK8IBrj1yJVqqlwFE3prSKcRXKxegsG
	 DOvKxUlXS3ZlQ==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	jolsa@redhat.com,
	bp@suse.de,
	jpoimboe@kernel.org,
	suagrfillet@gmail.com,
	andy.chiu@sifive.com,
	mark.rutland@arm.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V4 2/7] riscv: ftrace: Remove wasted nops for !RISCV_ISA_C
Date: Mon, 28 Nov 2022 22:32:25 -0500
Message-Id: <20221129033230.255947-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221129033230.255947-1-guoren@kernel.org>
References: <20221129033230.255947-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_193254_047533_3A1DDD6E 
X-CRM114-Status: UNSURE (   8.06  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When CONFIG_RISCV_ISA_C=n, -fpatchable-function-entry=8 would generate
more nops than we expect. Because it treat nop opcode as 0x00000013
instead of 0x0001.

Dump of assembler code for function dw_pcie_free_msi:
   0xffffffff806fce94 <+0>:     sd      ra,-8(sp)
   0xffffffff806fce98 <+4>:     auipc   ra,0xff90f
   0xffffffff806fce9c <+8>:     jalr    -684(ra) # 0xffffffff8000bbec
<ftrace_caller>
   0xffffffff806fcea0 <+12>:    ld      ra,-8(sp)
   0xffffffff806fcea4 <+16>:    nop /* wasted */
   0xffffffff806fcea8 <+20>:    nop /* wasted */
   0xffffffff806fceac <+24>:    nop /* wasted */
   0xffffffff806fceb0 <+28>:    nop /* wasted */
   0xffffffff806fceb4 <+0>:     addi    sp,sp,-48
   0xffffffff806fceb8 <+4>:     sd      s0,32(sp)
   0xffffffff806fcebc <+8>:     sd      s1,24(sp)
   0xffffffff806fcec0 <+12>:    sd      s2,16(sp)
   0xffffffff806fcec4 <+16>:    sd      s3,8(sp)
   0xffffffff806fcec8 <+20>:    sd      ra,40(sp)
   0xffffffff806fcecc <+24>:    addi    s0,sp,48

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 1c8ec656e916..36cc609c5d03 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -11,7 +11,11 @@ LDFLAGS_vmlinux :=
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux := --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
+ifeq ($(CONFIG_RISCV_ISA_C),y)
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=8
+else
+	CC_FLAGS_FTRACE := -fpatchable-function-entry=4
+endif
 endif
 
 ifeq ($(CONFIG_CMODEL_MEDLOW),y)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
