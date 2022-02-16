Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B16C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 05:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yxOBV+qbZD9cuuojstcxkUWTqYimZnHfilOHKyHDX0=; b=X7GYIZrIg2iKyh
	A7aprNKsTnLoWNIwi9+IJxU26lR0itVOwVqcmYHHpSfr5VQ1yPCOODvxN1EjFY++1VifLxUMLiyaM
	ORbTsPQx2SQutVZ9YVAbY7oLMAGxh7zr36rUDTT78IbArh2C3LI3mVdlI7RqJs8cOMI1VKZruzoZF
	kcRKch4ofZ/Ab1p8ILF1dClxQoogQZee5+HcKSI6BnEuxS51peirKE/EebH8cQJRrnTlfShZIf3kU
	Ne7Q0opOi86xfstnISD0X2i+WvbjHE/15Tc7DnEiuromulFIgnIiELybjDgRxHQ6vd57miMtQb2c9
	JgR1Bwo8bDZ31Z9XIRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKCUl-005YJC-Th; Wed, 16 Feb 2022 05:04:51 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154]
 helo=mail-sender-0.a4lg.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKCUg-005YFa-FW
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 05:04:48 +0000
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Authentication-Results: mail-sender-0.a4lg.com;
 dkim=permerror (bad message/signature format)
To: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>
Subject: [PATCH 2/2] RISC-V: Extract base ISA from device tree
Date: Wed, 16 Feb 2022 14:04:27 +0900
Message-Id: <8d7e1937f9476d14f64a53684b11bedd6f4ff88d.1644987761.git.research_trasio@irq.a4lg.com>
In-Reply-To: <cover.1644987761.git.research_trasio@irq.a4lg.com>
References: <20220216002911.1219593-1-atishp@rivosinc.com>
 <cover.1644987761.git.research_trasio@irq.a4lg.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_210446_685267_851E26D3 
X-CRM114-Status: GOOD (  12.39  )
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

This commit replaces print_isa function to extract base ISA from device
tree ("riscv,isa").  It uses a subset of Tsukasa's riscv_fill_hwcap ISA
parser.

Design choices (1):

It constructs base ISA string from the original string (does not cut
the original string like Atish's).  This is to strip version numbers
(too minor to represent as major ISA) but this behavior may be
debatable.

Design choices (2):

It skips when single-letter 'S' or 'U' is encountered.  It improves
familiarity with regular ISA string.

This commit is intended to be squashed into Atish's isa_framework_v4
PATCH 6/6.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
---
 arch/riscv/kernel/cpu.c | 83 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 6f9660c0a973..3f9607a66d95 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -101,17 +101,82 @@ static void print_isa_ext(struct seq_file *f)
 
 static void print_isa(struct seq_file *f, const char *isa)
 {
-	char *ext_start;
-	int isa_len = strlen(isa);
-	int base_isa_len = isa_len;
-
-	ext_start = strnchr(isa, isa_len, '_');
-	if (ext_start)
-		base_isa_len = isa_len - strlen(ext_start);
+	unsigned char parse_break = 0;
+	char base_isa[RISCV_ISA_EXT_BASE + 5];
+	char *base_isa_end = base_isa;
+	const char *isa_end = isa;
+#if IS_ENABLED(CONFIG_32BIT)
+	if (!strncmp(isa, "rv32", 4))
+		isa_end += 4;
+#elif IS_ENABLED(CONFIG_64BIT)
+	if (!strncmp(isa, "rv64", 4))
+		isa_end += 4;
+#endif
+	if (isa != isa_end) {
+		strncpy(base_isa, isa, isa_end - isa);
+		base_isa_end += isa_end - isa;
+		for (; *isa_end; ++isa_end) {
+			switch (*isa_end++) {
+			case 'x':
+			case 'z':
+				parse_break = 1;
+				break;
+			case 's':
+				if (*isa_end != 'u') {
+					parse_break = 1;
+					break;
+				}
+				/**
+				 * Workaround for invalid single-letter 's'
+				 * (QEMU).  Should break for valid ISA string.
+				 */
+				fallthrough;
+			default:
+				if (unlikely(!islower(isa_end[-1])
+				    || base_isa_end == base_isa + sizeof(base_isa))) {
+					parse_break = 2;
+					break;
+				}
+				switch (isa_end[-1]) {
+				case 's':
+				case 'u':
+					break;
+				default:
+					*base_isa_end++ = isa_end[-1];
+				}
+				/* Skip version number */
+				if (!isdigit(*isa_end))
+					break;
+				while (isdigit(*++isa_end))
+					;
+				if (*isa_end != 'p')
+					break;
+				if (!isdigit(*++isa_end)) {
+					--isa_end;
+					break;
+				}
+				while (isdigit(*++isa_end))
+					;
+				break;
+			}
+			if (*isa_end != '_')
+				--isa_end;
+			if (parse_break)
+				break;
+		}
+	}
 
-	/* Print only the base ISA as it is */
+	/**
+	 * Print only the base ISA
+	 * (original ISA string as is if an error is encountered)
+	 */
 	seq_puts(f, "isa\t\t: ");
-	seq_write(f, isa, base_isa_len);
+	if (parse_break < 2) {
+		seq_write(f, base_isa, base_isa_end - base_isa);
+	} else {
+		isa_end += strlen(isa_end);
+		seq_write(f, isa, isa_end - isa);
+	}
 	seq_puts(f, "\n");
 }
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
