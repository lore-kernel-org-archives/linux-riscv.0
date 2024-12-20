Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479D3E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SI0kKSspk1+c+ipYSdjbX+ybb1qd5ESsgqt81UQBZUs=; b=jOrFAe9AJHO6gP
	Wn5CPSia9kjBhRMoizMKDIlauhmPLsfY27bbLrWB0n5DpBeAWp9JBTojBe1U3zcUPwSILFgwkiGYP
	AlDrYsLmaZKRwIA7JyLfOnRpXYp/mUgN2yQLmm5xM3exzmVXWSq4TVPguj0jK7ZJYi5hZmylmaYN6
	nbR1HFZkTylQPWeR9TeMiz+GX1u3lBfoPPTQKwLGCWAAfBanI6OYGxtUDjtK84WLKw25QOquUUcdI
	YVyRdXgoO2X4MhuPMvh6JkgQzqBR8/6FABt2m9BNB7UXTciXmPA51Ewv+ClvAWTeoQrXsZjQ8J4fc
	py5y1u7Pb1kDCsnbA0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOR-00000005O3L-3Aej;
	Fri, 20 Dec 2024 15:58:23 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOH-00000005NtQ-2jOD
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rHgLYuhxcz/DTJlLYQV+se4GUhr8DJUj10zY4CoFS08=; b=aa74y86bKv2+VdnSn0pEUID0t8
	HbQatCkUuJnIYff/XRnb/hzt3yUUGWrxUyz00C1zX8YGLcuCeJl2EXmmaQDYpfBuvxFVkEkAl4xfN
	NvhiKabCw4AJjIuzlA/iG1lXU/YsM4r/J9zxvFClr4VDqXu2XYa7YXuGgIE1vNsjqP46WSM4hHBGC
	WejOmv/VH1dinIwPWd4M6hXBrr3FP3nxzbHkhC47tlyoZd/ZAaGiifTcz51HbiffmXs+UVq0VlWtd
	3cpX0JYCOfiuEvrAhvzyY7+8VWASklu6dLl3wkCpsKD4SiG523toiccva0YCzLL1tea/R5zQPDW1a
	epX2el/g==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfOA-00ADAS-5Q; Fri, 20 Dec 2024 15:58:06 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LTO-3tIn;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 14/15] riscv: ftrace big endian updates
Date: Fri, 20 Dec 2024 15:58:00 +0000
Message-Id: <20241220155801.1988785-15-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075813_809174_01487C87 
X-CRM114-Status: UNSURE (   9.52  )
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

Make the ftrace code work with big endian by ensuring the
instruction stream is accessed little endian.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/ftrace.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 2cddd79ff21b..233428aeab1d 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -79,7 +79,7 @@ struct dyn_arch_ftrace {
 #define AUIPC_RA		(0x00000097)
 #define JALR_T0			(0x000282e7)
 #define AUIPC_T0		(0x00000297)
-#define NOP4			(0x00000013)
+#define NOP4			(le32_to_cpu(0x00000013))
 
 #define to_jalr_t0(offset)						\
 	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_T0)
@@ -93,8 +93,8 @@ struct dyn_arch_ftrace {
 do {									\
 	unsigned int offset =						\
 		(unsigned long) callee - (unsigned long) caller;	\
-	call[0] = to_auipc_t0(offset);					\
-	call[1] = to_jalr_t0(offset);					\
+	call[0] = cpu_to_le32(to_auipc_t0(offset));			\
+	call[1] = cpu_to_le32(to_jalr_t0(offset));			\
 } while (0)
 
 #define to_jalr_ra(offset)						\
@@ -109,8 +109,8 @@ do {									\
 do {									\
 	unsigned int offset =						\
 		(unsigned long) callee - (unsigned long) caller;	\
-	call[0] = to_auipc_ra(offset);					\
-	call[1] = to_jalr_ra(offset);					\
+	call[0] = cpu_to_le32(to_auipc_ra(offset));			\
+	call[1] = cpu_to_le32(to_jalr_ra(offset));			\
 } while (0)
 
 /*
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
