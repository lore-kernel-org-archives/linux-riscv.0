Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001F4EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OX0Dg+2NWcSFmm08fEQlRZ299c5rT/MtARwWsXkp/z8=; b=RVwYkJ8y94K6zN
	qE9xRx/oHUjad5RHAS1hMRJhWmcdG+J04RyfxYubwSaqeSyk9n08qkdUicSV6QPrTGHuniHmgV5ky
	c5eeIz31zKkTDhSWKeeMTSQQBc1sdVNYI0XVx/9gHIWsitX03SX8cgYibVnu5z8dS9SmRhHmBtObQ
	36fIVT0MYptRMGM6joCW1yDgObHTQC74LaN7txriFzbnCcQ81Ile2gZBAhcfmslNSMfxfmVSHyPOX
	6BY4wBVYA3mGbUC688PxB/2JED5aj/Ba1X6IjpAfbgfHywVqNab2fzIFZBRwc5eAYmG8BFRwwhama
	ozKQ3zsfIC83dpPoJ18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmrG-004w8Z-22;
	Fri, 07 Jul 2023 14:54:54 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmrD-004w7J-2V
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 14:54:53 +0000
X-QQ-mid: bizesmtp74t1688741672t4vg896o
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 22:54:31 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: Xz3VOcA7Mr3gnW13Mz7SkboIep4UxV/SucUK86192TK31+GR1/gFj4OOvj6fx
	+bH2BPikj/AX30RQHBZf3cNqBVb49OmRMvtvus7UF6BqrXLwg3xey2y9AhQKmAPFHVev69f
	ErK63Q3C9GNXsW+TbKtvYG0hKJt7oL6GhJxEHWf40w4lWMOFukWapJagciCTvd4/pYH0dxC
	Wqsqculf/+nBZkuztTci4N9bIlNAW/avjblu8lA7u9x7/RhXtc1btXTp+ayjqaWuQ0WOVqx
	kU7mioJpKsGBEFxYDurdJAHrZnDpDrUTGHGTwxcN9OSFLC7OxwYbgwXdezoymakZaCeP02Q
	Kj0T5ubFQuquSn4mPUVQ0t49LeHGYT4HETOnmh0nKKMen0bCqN1ugnDSRKjlg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4053769286691536026
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 04/15] tools/nolibc: arch-mips.h: shrink with _NOLIBC_SYSCALL_CLOBBERLIST
Date: Fri,  7 Jul 2023 22:54:26 +0800
Message-Id: <3ba25ebd88fcef91a6a411472684b4b30e6018ef.1688739492.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1688739492.git.falcon@tinylab.org>
References: <cover.1688739492.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_075452_136075_E92D3C97 
X-CRM114-Status: UNSURE (   7.83  )
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

my_syscall<N> share the same long clobber list, define a macro for them.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/arch-mips.h | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/tools/include/nolibc/arch-mips.h b/tools/include/nolibc/arch-mips.h
index 22aacc07b1fc..1848f57777c4 100644
--- a/tools/include/nolibc/arch-mips.h
+++ b/tools/include/nolibc/arch-mips.h
@@ -57,6 +57,10 @@ struct sys_stat_struct {
  *     don't have to experience issues with register constraints.
  */
 
+#define _NOLIBC_SYSCALL_CLOBBERLIST \
+	"memory", "cc", "at", "v1", "hi", "lo", \
+	"t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"
+
 #define my_syscall0(num)                                                      \
 ({                                                                            \
 	register long _num __asm__ ("v0") = (num);                            \
@@ -68,8 +72,7 @@ struct sys_stat_struct {
 		"addiu $sp, $sp, 32\n"                                        \
 		: "=r"(_num), "=r"(_arg4)                                     \
 		: "r"(_num)                                                   \
-		: "memory", "cc", "at", "v1", "hi", "lo",                     \
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg4 ? -_num : _num;                                                 \
 })
@@ -87,8 +90,7 @@ struct sys_stat_struct {
 		: "=r"(_num), "=r"(_arg4)                                     \
 		: "0"(_num),                                                  \
 		  "r"(_arg1)                                                  \
-		: "memory", "cc", "at", "v1", "hi", "lo",                     \
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg4 ? -_num : _num;                                                 \
 })
@@ -107,8 +109,7 @@ struct sys_stat_struct {
 		: "=r"(_num), "=r"(_arg4)                                     \
 		: "0"(_num),                                                  \
 		  "r"(_arg1), "r"(_arg2)                                      \
-		: "memory", "cc", "at", "v1", "hi", "lo",                     \
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg4 ? -_num : _num;                                                 \
 })
@@ -128,8 +129,7 @@ struct sys_stat_struct {
 		: "=r"(_num), "=r"(_arg4)                                     \
 		: "0"(_num),                                                  \
 		  "r"(_arg1), "r"(_arg2), "r"(_arg3)                          \
-		: "memory", "cc", "at", "v1", "hi", "lo",                     \
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg4 ? -_num : _num;                                                 \
 })
@@ -149,8 +149,7 @@ struct sys_stat_struct {
 		: "=r" (_num), "=r"(_arg4)                                    \
 		: "0"(_num),                                                  \
 		  "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4)              \
-		: "memory", "cc", "at", "v1", "hi", "lo",                     \
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg4 ? -_num : _num;                                                 \
 })
@@ -172,8 +171,7 @@ struct sys_stat_struct {
 		: "=r" (_num), "=r"(_arg4)                                    \
 		: "0"(_num),                                                  \
 		  "r"(_arg1), "r"(_arg2), "r"(_arg3), "r"(_arg4), "r"(_arg5)  \
-		: "memory", "cc", "at", "v1", "hi", "lo",                     \
-		  "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9"  \
+		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
 	);                                                                    \
 	_arg4 ? -_num : _num;                                                 \
 })
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
