Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DD8C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Oct 2022 01:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckWnyZvALje7WOjXfdgboxPpmLtpOF7Ee4zhps0vv+s=; b=3PiUhliTiz2JGf
	6cZA+PtoXBsLbgxWVn7wuPPSphJbL/j+cy0yW5sUc5aWMeXnQ4LeSpzU7tqMUmWWHqeePPsLvQRxX
	F1BvAZkJeSoHl6ixQoNoWdeastQX5dTsSORMVBomFZ+ZDOMTWbHGTqMMXwi2BkmSobYgaNZ2HZV4U
	VpcvDnyCwo2ipDOORjwvhbsWVnSIz/K16JDMN7/YagB3Vtkbp8p63yqocjXIBNngvtJ6sab5ACGHa
	AKrLwQAk2prwTj/b1AmgYCSAEYE0wLA3kDoU2NjVyT0Y5vvYycZNTNL3S26SIb8vAiQ0mjzh5Oe/r
	5cM/zP8dlJwh8aFgYtig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenjt-00GrSD-Ac; Sun, 02 Oct 2022 01:25:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenjq-00GrR1-Sm
	for linux-riscv@lists.infradead.org; Sun, 02 Oct 2022 01:25:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 60E4860DD6;
	Sun,  2 Oct 2022 01:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030A8C43152;
	Sun,  2 Oct 2022 01:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664673949;
	bh=DEvoceoa51GjIrkhPQ7BHRzc0Y6qi+1P763yh9ux/40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ppz+xqzeSXFhbPI6utaYdIThP3K6Nz8Mr271TNX2vXYINZ5QJZo6BF5NBGhryyY//
	 32/rxcGNPdnz82SjbfOLoletGSxVjHWJm+UXkXtvYnuLRfi8aha5E/XrBlNoJyxQEn
	 4BfWP3j+ClveyZ0INP29NCLToUiURl5VlA2Eo9ykYnyvFLheWCz/N6vBOyfgnvKYR4
	 reDPriwbXSQAk3E1v88ZXj6Fyj2W6ps3ui326CZj6oN9RkQyAGXfPDHKToIatTk0QU
	 IUHrnY5VEjZ5YjyEFmHUfHlgoOz9nbPV3mnF6ntwWItFQQnZMrAVDTsSOhNDcM9vbf
	 ruTfMtEzHbfIg==
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
	chenzhongjin@huawei.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Borislav Petkov <bp@alien8.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH V6 04/11] compiler_types.h: Add __noinstr_section() for noinstr
Date: Sat,  1 Oct 2022 21:24:44 -0400
Message-Id: <20221002012451.2351127-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221002012451.2351127-1-guoren@kernel.org>
References: <20221002012451.2351127-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_182550_973795_C576EB11 
X-CRM114-Status: GOOD (  10.77  )
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
index 4f2a819fd60a..e9ce11ea4d8b 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -227,9 +227,11 @@ struct ftrace_likely_data {
 #endif
 
 /* Section for code which can't be instrumented at all */
-#define noinstr								\
-	noinline notrace __attribute((__section__(".noinstr.text")))	\
-	__no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage
+#define __noinstr_section(section)				\
+	noinline notrace __section(section) __no_profile	\
+	__no_kcsan __no_sanitize_address __no_sanitize_coverage
+
+#define noinstr __noinstr_section(".noinstr.text")
 
 #endif /* __KERNEL__ */
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
