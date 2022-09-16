Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D197ECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 10:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IvGXFTVANWGpLHMWcewu1a3XQosDu+bZCdZCbAM+YE=; b=cIsjFKEDP3dOmq
	lDJ0IDWFa/Aka0iezuRH2sJ9rVnAZ2BSG/2keDNYKRnYmJVnCXuIy1tK2IBgmVx2WLqczg9H/6CIR
	fly+9DR0GzzVXgmUvtAJCXo5UWJLoSParB2hyPs/MQeJ2MMLhX1IVlA7hLljVhRP1416VZyGd5vXs
	zucXqj3W90NDyNYxoWbCwZMBNE9daAxyaBwcfpBJZBTeHlm6tT7Q/mVsEz9e7ZKyWwjLxpC+kZNEi
	4twk3cr0Xi1mjhWZQgmaL3PQD1bUb/SLgThgMcib5zrR+yPW/bVeCdUPWpAmuipNv+KN9+JgxKHoX
	0g2CBdxVdIbPs6x1NvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8lV-00CGof-6J; Fri, 16 Sep 2022 10:40:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8kA-00CGEo-22
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 10:38:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3E0662AC7;
	Fri, 16 Sep 2022 10:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF95C433D7;
	Fri, 16 Sep 2022 10:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663324724;
	bh=XwVzwKWzSSnE5M8iQ5zKiH/uEZOA/qYNZrttzn2FPsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aTADtsZQRqUgZ8Fu8jhyGQlwDX+YFuhK7dKHvbytFm1kbh7Bz5o0AYIRQ1CKHpLaD
	 dL+k/Zc4OXvMjhj3lrcRpHsA8JgicJFnT+sr/Z23qpp+sQgb9hbS3zcVk/AoFIT1RA
	 scCeGOk6tHEeRUmM72HNnP7IZJscZ7b2CQyBxXGZsffoIHv/EOZExfNHRJFOcp0pVs
	 EFr61FAgMYwXPS4pfEwiZoK8yuUpunq3JbepWzlKJi0RIDBWDIW4R1NLqO28p3vff2
	 x0/jz9yfNRaW6gOQd60rLeUXWGqFPbnrDUJ7DGGwJNfL/8iglchb7FccXYNG07aox9
	 FTAtQQ/lhxQBg==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	rostedt@goodmis.org,
	andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	zong.li@sifive.com,
	jrtc27@jrtc27.com,
	mingo@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/3] riscv: ftrace: Remove wasted nops for !RISCV_ISA_C
Date: Fri, 16 Sep 2022 06:38:16 -0400
Message-Id: <20220916103817.9490-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220916103817.9490-1-guoren@kernel.org>
References: <20220916103817.9490-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_033846_208603_44B612EA 
X-CRM114-Status: UNSURE (   8.26  )
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
