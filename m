Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6641BC6FA8B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 03:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IvGXFTVANWGpLHMWcewu1a3XQosDu+bZCdZCbAM+YE=; b=VonjXpszqLLJ75
	zIT1n5035RTzq+lIy63CeIhki5BeUpEfniCkvabVQplk1tauhcfp5mOxH7WhcjiUUltyhZz6qWkS3
	xEhe0kGdynncA4zfLF/pohptG8KW+uP0k5cTA61xbnHn1g9rrMFvbB3gzqdmoYv5xVTOc3X85aaUS
	yuOk8kLjgCfv0Gpa+iI6j138ZQNYKgIKJ8vTph7JmB1ObacD0qSHNKmFaTnBlp9ABSDUN6wcMuWir
	iyGvl3rCw8AceWiL9uBlaLdtrGCzV+W6sn6rF5+1KxXyQq2k6q9gxZY2xqFeRLDNpadVUJ+dxscXU
	dbfzNi28a2fNSd5SF3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaqjs-008ehc-Bk; Wed, 21 Sep 2022 03:49:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaqjq-008egv-CP
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 03:49:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9CAF162F33;
	Wed, 21 Sep 2022 03:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE07BC43470;
	Wed, 21 Sep 2022 03:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663732169;
	bh=XwVzwKWzSSnE5M8iQ5zKiH/uEZOA/qYNZrttzn2FPsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=evMc6D5WdMFtNWHCWKTz6YKkVvfMfxzJr5PLOr8HVtcfVLSVGBMF+MZOilQrDAp/F
	 QiEtDFUB4A10NFY/1eUChpXaNrY02KAuSHEkhfC5uJzyLQ5zIDgHMwJT3tRTXZHsxo
	 oxCVrESLGPkfr+P55gY+71+ILubAtjpYbcgih0Srn3l8tJfz6W0gorxsxzdqUvNwZW
	 mS208jHLqw3na33EBCEOnYAR904QYqH1QAzaJdJaygb2h05Lg/ZPHFLfR9uLpnZ/m7
	 PBYzptMQt1k3Ketlv9IgpPn6HuPpX+KCQ6Nj+L2D/0LCRY41piSM+0/8PcDzW9iy+c
	 8dMibz1MwLlng==
From: guoren@kernel.org
To: arnd@arndb.de,
	palmer@rivosinc.com,
	rostedt@goodmis.org,
	andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	zong.li@sifive.com,
	jrtc27@jrtc27.com,
	mingo@redhat.com,
	palmer@dabbelt.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	guoren@kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 2/3] riscv: ftrace: Remove wasted nops for !RISCV_ISA_C
Date: Tue, 20 Sep 2022 23:49:09 -0400
Message-Id: <20220921034910.3142465-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220921034910.3142465-1-guoren@kernel.org>
References: <20220921034910.3142465-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_204930_477434_302C7141 
X-CRM114-Status: UNSURE (   8.53  )
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
index 3fa8ef336822..f32844f545d6 100644
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
