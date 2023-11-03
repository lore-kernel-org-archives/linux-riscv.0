Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA025C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvgEBd+z3R1hZafUgpe4MhHrx/LQn4g9NGBJy72yZgM=; b=MKuoIfXGTdNZ8J
	R+wOzlcqrcIrBhpyI253vKYiaOj2GKMpCG290waFZiUS3xeKC708N+cLqDANN+R7oX15LlDD44Owl
	qpuRF8l3zIKobkSbWci5TUzC7PVJT4wiHePiG+T+h9MQabnghIB4se4SxeMmXBR2V2kro5VhcE3Mx
	nts99XHndHu8DSsl/ChNfcdvvg05AnOydF9QwoG6Th7kx5CL3MadIHCy4U8bNGFL+5V7ZuBiXCo64
	XTek9k6RhZVy8grUmip5IMhH4Lin8t5pwcuN72IaMzUdBZrHUgiQVcGSNtWFSXsDIZoYEPyQl8Q+Q
	rpPE+hzJlaQFZ16XjmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywdi-00BkdN-02;
	Fri, 03 Nov 2023 16:03:18 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywde-00BkbT-1Q
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 16:03:16 +0000
X-QQ-mid: bizesmtp71t1699027375tdhm453g
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Nov 2023 00:02:52 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: NcwpCxVQ7UNhf+mNoYKTlmUzCKrTx3/uLfRK9iw8b01sSRqpsgDYV8WUoq0+F
	bEVqW3uxHwMcq7cQk2v9IJTcEH5r/B/VLMPT6wOIogDyXcUP+URvzaHAuu/LDdBPo2y2PfX
	7Mvj8Mqe2Ivk0sKa4LuqIN72w9m3gc5Lcqg/zqWO640FM0vG0kG9EircxCKhMl7uzB00yoH
	1GP93ZVIalqTmrPj4vUjf6sev/hgXIrNQSDbJHjlwx52aJ9EmGcU4IM89eMwaKIUIKHp/FG
	vghOQ3hDkGX/eU+m4e94hHqprk/L/vOU8YSOvFJylFesXI+PLvYCD4xzTz8P1EhFUlvtRb/
	xog9r+mNfQz65z8LEQVxAy/3lxXueH3B9eIMSnlsByWsQU4YjU=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14770929756585809619
From: Yuan Tan <tanyuan@tinylab.org>
To: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	luc.vanoostenryck@gmail.com,
	linux-sparse@vger.kernel.org
Cc: linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	tanyuan@tinylab.org,
	i@maskray.me
Subject: [PATCH v1 11/14] DCE/DSE: riscv: build reference for .pushsection in C functions
Date: Sat,  4 Nov 2023 00:02:50 +0800
Message-Id: <ab9af3f07b520c8679a586770e3d488cb4866e8e.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_090314_785938_35800031 
X-CRM114-Status: UNSURE (   6.84  )
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

Add the SECTION_SHF_LINK_ORDER method and the SECTION_SHF_GROUP method
to refactor __ASM_EXTABLE_RAW, so it won't produce orphan sections
anymore.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 arch/riscv/include/asm/asm-extable.h | 34 ++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
index d0be5a838242..7164d871e038 100644
--- a/arch/riscv/include/asm/asm-extable.h
+++ b/arch/riscv/include/asm/asm-extable.h
@@ -13,6 +13,21 @@
 
 #ifdef __ASSEMBLY__
 
+#if defined(CONFIG_SECTION_SHF_LINK_ORDER_SUPPORT)
+#define __ASM_EXTABLE_PUSH_SECTION			\
+	__LABEL_NAME(.L__ex_table) :			\
+	.pushsection __SECTION_NAME(__ex_table), "ao", __LABEL_NAME(.L__ex_table)
+
+#elif defined(CONFIG_SECTION_SHF_GROUP_SUPPORT)
+#define __ASM_EXTABLE_PUSH_SECTION			\
+	.attach_to_group __SECTION_NAME(__ex_table);	\
+	.pushsection __SECTION_NAME(__ex_table), "a?"
+
+#else
+#define __ASM_EXTABLE_PUSH_SECTION			\
+	.pushsection __SECTION_NAME(__ex_table), "a"
+#endif
+
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
 	.pushsection	__SECTION_NAME(__ex_table), "a";		\
 	.balign		4;				\
@@ -32,8 +47,23 @@
 #include <linux/stringify.h>
 #include <asm/gpr-num.h>
 
-#define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
-	".pushsection "	__SECTION_NAME(__ex_table) ", \"a\"\n"		\
+#ifdef CONFIG_SECTION_SHF_LINK_ORDER_SUPPORT
+#define __ASM_EXTABLE_PUSH_SECTION				\
+	__LABEL_NAME(.L__ex_table) ":"				\
+	".pushsection "	__SECTION_NAME(__ex_table) ", \"ao\"," __LABEL_NAME(.L__ex_table) "\n"
+
+#elif defined(CONFIG_SECTION_SHF_GROUP_SUPPORT)
+#define __ASM_EXTABLE_PUSH_SECTION				\
+	".attach_to_group " __SECTION_NAME(__ex_table) "\n"	\
+	".pushsection "	__SECTION_NAME(__ex_table) ", \"a?\"\n"
+
+#else
+#define __ASM_EXTABLE_PUSH_SECTION				\
+	".pushsection "	__SECTION_NAME(__ex_table) ", \"a\"\n"
+#endif
+
+#define __ASM_EXTABLE_RAW(insn, fixup, type, data)		\
+	__ASM_EXTABLE_PUSH_SECTION				\
 	".balign	4\n"				\
 	".long		((" insn ") - .)\n"		\
 	".long		((" fixup ") - .)\n"		\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
