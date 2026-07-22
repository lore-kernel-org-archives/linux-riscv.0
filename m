Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179DAC44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 14:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERk+/lj9WT3BkeDvO28c6fVvFpYRCiDvZsTzx96W27w=; b=P6+iCfsCY9MFUC
	A79uB/QZrFQsYJNfTqH9FdHpcLnmSq/d4u7uZKOFf4/nYCuCnncF5NsBzm08P2Q6Eb7Y1X8tWIftd
	uI+sCIiE32f/oulzlEWJgJOgmLsA1VqHC5DQ959QjnLTl1cWB/lxsjWUEMvae+ct/C2L+C3iqxvAJ
	UxN+Hp2cXz+L3V7bTUS7zdTN9xqtG5xNqaLR2XHXQ99RPOaxzjyvzhiZTCCJ2SAarIpRVHk1ZR509
	AVZo2EKQP+9cADIte7O7as0HmaGTQDv9V2Q6hJGpVEzWkdlx/PJNeJ3DnyA6jhMjGd1Lwhh25LlVv
	gnA897F/jYvEJM4bZpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXVe-0000000ByA3-2DIg;
	Wed, 22 Jul 2026 14:01:18 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXVb-0000000By7d-1bZA
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 14:01:16 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-848743155bcso3613662b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 07:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784728874; x=1785333674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEjjn0vc5h6Klfz50Xi3OPenrjoSwnSYbs/Qn95SwQM=;
        b=SjbHAin0nzEFxR6KWS5KyL5suI/n1hu8dVnDZH2KgWJ4ltOJ36sQ45k/zmV+HxMq0c
         /yrqEDaxQ1Fe+x99PWX+iiB8FiXClPspBqO16yjLbMVxwyQhIa0JGGGlRspyC6hXJcgs
         JjlHW2lKTfEXmP71kDJRFmFTTSBSdbSIxEAP7OH62mXf2z4si8WIgNpGpGyNo1aba63f
         Gfeo7tPx991W7CCtyXgNyxWD6NJxfx8RodRe0JQAUaz43n7EYO/bxY3aRGBVKN2DHxkc
         Pmn+JSo++TpvXFqrUN7JALZGYO6pcLosYnYWalgGfCQMCYR0+FH4fr0PTkHMKlrb4bn7
         saIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728874; x=1785333674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZEjjn0vc5h6Klfz50Xi3OPenrjoSwnSYbs/Qn95SwQM=;
        b=AaSVzLoe6GfXCLolk9EWHS+XpHqs+AVRBnIVCPuvQLdT98eOU5JnBbn4slymfgGA36
         kL0sdQtyWjN04veqxo51Fgj4sm+9cnLRSP+wrYDPBNOZNSOCbgwjY2uoMdz6GryT7txc
         i+sXh4+LS7ddQewBqqltCdAyL1zTHHRW/uCLm+seaOyvZconlcD/qbvJgDm0Ohdlg7C1
         FeBiNl+DY9AGBmvzGEmiEsv5juFnij223gERH92CERGeeOaBvfoDQLHoFJn6lRSQbIIn
         jjR6Nye/del9sfvqfqBA+lHbvldwc1uSGSDc6K86Van5l4pkKRjiW9rGLsjwV52TsJse
         anyA==
X-Forwarded-Encrypted: i=1; AHgh+RotnvbwyGhoFdnpSkAK+81vMBy2mLuoVTkXISyhLF+CZRVKCU+976UZlKF7a/vOKfl98ShHC9/dePTeiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVMDMQDtl7IqrPC3M8knoHTfNpa1exTxuLsVq66T2mjQ37mi0r
	0/+lnPgP2Mc9DTXAx/4rqGqHd/TNs/cPkmakHJzulTCQhAbzbTrAObLd
X-Gm-Gg: AR+sD1333B3xc0LZU5aVELf65/Up85+bWght13fIBg+eVha2u65GSQzrqR/Eyh2ub+A
	HrE9D/E+JKYMKYzNr0y0o7DzZBPqgv0zaqsoosrmJJGYWW7azNknCDqtFidAw87fFogZglFGRRB
	QFa2ym2YiwhqbYDPDTQwQc74+UMAL/CiqrDAKVMhVII6nLcCHkiAGpyFAaYw4uyL1ErLmg6yEoJ
	+BjfJmlc83GmlZahu0i+BVFrW7aAylEcjstcshvCtyCdhVS7nVh9jYDtQAp72UAsu9f8uU6uJe7
	FVL1eBImnfWKXtoAIK019NsHgHHGGIYNTTIQwdHZqUhro99NEE8qNrut6HHc/nK9Vk36JH3eLnH
	cpnr4LpW512ggr1gk2v0QJTDFUKOHHiLwdYvCkZ/HZMKzWre1skrH2nkd8VVUBBb4/z8m62OsrR
	sw9g7QvBteeCvzN2cFfNLi1C/2BhPocxm+EdKDFhnf9PrXGlA=
X-Received: by 2002:a05:6a20:3ca3:b0:3c3:7ecd:72df with SMTP id adf61e73a8af0-3c3ad86ab89mr26184446637.30.1784728873939;
        Wed, 22 Jul 2026 07:01:13 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:40b2:277d::3ef:c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm1242281a12.26.2026.07.22.07.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:01:13 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v3 3/6] riscv, stacktrace: Implement arch_bpf_stack_walk() for BPF
Date: Wed, 22 Jul 2026 19:30:10 +0530
Message-ID: <20260722140015.1982158-4-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722140015.1982158-1-varunrmallya@gmail.com>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_070115_425725_33A1C8F7 
X-CRM114-Status: GOOD (  10.69  )
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

This will be used by bpf_throw() to unwind till the program marked as
exception boundary and run the exception callback with the stack of the
main program.
This is a wrapper around walk_stackframe(), which now passes (pc, sp and
fp) to it's consume callback.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/kernel/stacktrace.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 30b369dd2815..c0f2393e5163 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/filter.h>
 #include <linux/kallsyms.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
@@ -104,6 +105,30 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	}
 }
 
+struct bpf_unwind_consume_entry_data {
+	bool (*consume_entry)(void *cookie, u64 ip, u64 sp, u64 fp);
+	void *cookie;
+};
+
+static bool bpf_unwind_consume_entry(void *arg, unsigned long pc,
+				     unsigned long sp, unsigned long fp)
+{
+	struct bpf_unwind_consume_entry_data *data = arg;
+
+	return data->consume_entry(data->cookie, pc, sp, fp);
+}
+
+void notrace arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp),
+				 void *cookie)
+{
+	struct bpf_unwind_consume_entry_data data = {
+		.consume_entry = consume_fn,
+		.cookie = cookie,
+	};
+
+	walk_stackframe(current, NULL, bpf_unwind_consume_entry, &data);
+}
+
 #else /* !CONFIG_FRAME_POINTER */
 
 void notrace walk_stackframe(struct task_struct *task,
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
