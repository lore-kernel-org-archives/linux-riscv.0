Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E7CC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Oct 2022 11:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPA/y4jUj55v07o/TjkRuPKLMc/iqf9v1QciqCU6mKk=; b=YAd0XXvQ2gnuzC
	DPr2ZlG+8Z/IZyTOcqXMR5jtE3D6HH5t0IIONzGqflD1DBbXje9lHqUO+/GRwspVhlwLCAK4lyObc
	ouOcb/USR2sL3Zu/4LLdJzCgUnnSvH1ClnDF1zU5Jvmn9o6uIZrqep2Vqqumq1QQB+da9PibLk9S1
	lF2OJpF6wee0am2ZOfYyA0KouqIxZEQ21QdJAGWvCQU+sNBaMReBtl56J7rrGiEmtNWbS9QlZwyyR
	BnfFTvunQh5TU+D/CzCelbJ5sePA5i2ic9YBmw/HM348jkRQPNCKgSCkUUaS3ILGEsrG2nmNDR+t4
	CbZXObQ3KTsYSUFaHm9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojfgX-00GqLO-7v; Sat, 15 Oct 2022 11:50:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojfgU-00GqId-DG
	for linux-riscv@lists.infradead.org; Sat, 15 Oct 2022 11:50:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 45EF5B801BB;
	Sat, 15 Oct 2022 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0FBC433D6;
	Sat, 15 Oct 2022 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665834627;
	bh=+RHLFV5pzLwomxBWNfwElTQCJrr1T7IUJgGRxuyfbig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bFDk/wKL8L2heHLUL+JFQdLtovwC9yEN0lZn8EGMy9/otFEGsIiBALQeSDD5H0uE/
	 3+y7t7yVe4qhEvCp0UugE1uJSYvaVJg3HJLC2Tk7cMBywJw74RH32RsBnHSXk3csvE
	 95k+JsoE2+iG/WRjAA0Kgoyv5O6sJ7NjvhKTELr9lKgqCSIisSPcqHwWp221kFj5ad
	 8uiX3WSSYs0obeZi9vDEozxWgv+77BAhhcj1s9hfepa64V/eOzl5t2mhDAS2VHhwB/
	 fj7xb20+tAs12T3G6g5TLOA7zbsuVb8Bo4veLjzFKwbyCRtewNhG5bTOH+mO71B3Fe
	 rUtj2bAv4acfA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Borislav Petkov <bp@alien8.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH V7 04/12] compiler_types.h: Add __noinstr_section() for noinstr
Date: Sat, 15 Oct 2022 07:46:54 -0400
Message-Id: <20221015114702.3489989-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221015114702.3489989-1-guoren@kernel.org>
References: <20221015114702.3489989-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221015_045030_615566_0B54076F 
X-CRM114-Status: GOOD (  11.04  )
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

From: Lai Jiangshan <laijs@linux.alibaba.com>

And it will be extended for C entry code.

Cc: Borislav Petkov <bp@alien8.de>
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 include/linux/compiler_types.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index eb0466236661..4cf5c90c51d2 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -231,11 +231,13 @@ struct ftrace_likely_data {
 #endif
 
 /* Section for code which can't be instrumented at all */
-#define noinstr								\
-	noinline notrace __attribute((__section__(".noinstr.text")))	\
-	__no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage \
+#define __noinstr_section(section)				\
+	noinline notrace __section(section) __no_profile	\
+	__no_kcsan __no_sanitize_address __no_sanitize_coverage	\
 	__no_sanitize_memory
 
+#define noinstr __noinstr_section(".noinstr.text")
+
 #endif /* __KERNEL__ */
 
 #endif /* __ASSEMBLY__ */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
