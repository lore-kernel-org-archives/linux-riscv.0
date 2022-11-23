Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AABC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyKHys7CJ+E/XNSeLqo7kUI5lVtm0y8opQTqTckBQcQ=; b=iR3znoKppvwRO/
	jFLaLsq9KUSGGl0DN08+xdQXks3pRdZt4V7OyUazpR3w03VJTNDHhjh9dfkns/omC38knxS1OOlTm
	bKtJKY4lmEd4nQ4byxSrEK3zzJSixYTV/wYofhpWxHNJ+/XWlP1XqsGsVGOwRfR3JXPgJr4SiW3Gp
	PM+r10qt8IapIT9VTtaw4du7Edr58SpfzqWd6/ORi2iJGZBxlGAYwR+qE9kwljjNnvpGHLuUvZApq
	3uSi2EC50qzpUZojj/SkjbJix021NE81+JMML5xdFuA8gbVlQJS9+w/HCh0JVXPw6vaGhzxkBv8Aq
	F9Kplg3iMaIJrljjERKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxssx-000xZa-FE; Wed, 23 Nov 2022 16:46:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrrF-000X1d-Q4
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 15:40:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4CF06B82141;
	Wed, 23 Nov 2022 15:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F281C433C1;
	Wed, 23 Nov 2022 15:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669218015;
	bh=K44IU5zSr+xRSYeCBFFHSvlbL/P6QS9pgaMT4XAkl6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vRSCEWckR+qyWbBwXdDb1HYy7iZFIr/KBzkURDpS8Px1CDdbR6wes8ltwnXbGCEm5
	 wy/VDWMU1S/B1GT1t8GP78yB1Blh8+svK3vMGbH96vKxRK5wBmRwl8KP9NuHQStdkx
	 OvVaDH/8Qv+VTG6Lm3PMgjurnElt7HTx+5SoV9+Axrxou5ocuOFQ7tJW62xGrHxrzr
	 8NhwJ6NFw/CgeJgzMJsviFaLo48Rv7Ild9yInafyfBP9gdvvU3ItR4L81D6fyhpHwY
	 zkcnpvfxvQK8QJeGDVtIhcDktiq31DSJ+8dlyukYet2l6DDuDOwMiDAucwyFQwZd2Q
	 b+242c6ae8lKA==
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
	andy.chiu@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V3 2/5] riscv: ftrace: Remove wasted nops for !RISCV_ISA_C
Date: Wed, 23 Nov 2022 10:39:47 -0500
Message-Id: <20221123153950.2911981-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221123153950.2911981-1-guoren@kernel.org>
References: <20221123153950.2911981-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_074018_099348_922CD378 
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
