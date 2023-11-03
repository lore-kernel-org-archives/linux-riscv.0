Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5F1C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3O1iBlrnK1DLtDN9FVgiEtyFNbq5fertkfHPLrRbN4g=; b=EdPtfItTTyPzkC
	wMEJgjDWqD5F1K6AC4Zj6c6JfKYHgW2u7GYB4m+EpUx/jAF4VLe1uS0hTfU3kmSaqZo03EuzqVAhH
	Ybw824NMom9AfLXEYuVorZOq4Ke7uJ80D4rsnABdAkwsVPNaDt5wcR3pP729MJegI6zYZKA9PdHqU
	LjrsqGvRkMrGZBqNQy28k3Bq+m+0cKvFC+3mUh3pPTMj3Vd0LhwCOJ9gAdguCj1fmsTC6Zey2o0SV
	Gfn4IuiE0PlvJfQxgYwLv0K2pcPi1Gq+J5JAXWPhf5tyvhhkOJGErCf9ihhPEjMhNqFOUd9Dh8JlL
	ddD9Fi7xLYEhUJ90oY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywf2-00BlGg-0J;
	Fri, 03 Nov 2023 16:04:40 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywey-00BlEa-0Z
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 16:04:37 +0000
X-QQ-mid: bizesmtp78t1699027456tnrc347s
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Nov 2023 00:04:13 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: mot7IUESEd/O3Ye3RvUm0u0JfDP8ilGw6DJ+bg2ku9yW02xqru4czyWnDR4JC
	EQdnw8q1TsviTHclgFaJRSxxEJSFDKoZfMUzfWIOoWQW5FI9+0rOhbgL2xFjAIQLOk/WiNb
	Ze0d8K6zH/AYLaKpQIAtAZG4jS7M72shuT9euUEJaCCA/CcImxoiQrXkdoAg+grDS7lI/xU
	DnpaZjUvJet9LH1I1tXUT2k+8t0nGwPGjmBS7XYMcEABQ3GlVXZx8/iDCsrMmgIy1Mf4YxT
	25ig0IbUsLLwVXn/38HbQVCzou/49TJyeRhZOCpzf0rKiNfEg1KrsIRdd33Cz5XTnn7Ws/O
	zQ60yzEUchZNK3VB1+XcP3Ha7KKHjs9ib0py4O2
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6096022325544553150
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
Subject: [PATCH v1 13/14] DCE/DSE: add SECTION_NO_KEEP_SUPPORT option
Date: Sat,  4 Nov 2023 00:04:10 +0800
Message-Id: <4ad1b8cb7cd54c57e74e877235f64b5be5bbbe8f.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_090436_525453_F944DBF1 
X-CRM114-Status: UNSURE (   8.41  )
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

It is able to drop the brute KEEP() keyword for some sections, when the
sections are able to link or group together with one of the used
sections.

Some syscalls are actually orphan sections.
SECTION_SHF_LINK_ORDER_SUPPORT or SECTION_SHF_GROUP_SUPPORT creates
references for these sections, eliminating the need for the KEEP()
directive.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 include/asm-generic/vmlinux.lds.h | 24 ++++++++++++++++++------
 init/Kconfig                      |  9 +++++++++
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ea8170e11ab1..f10afc42a1ac 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -201,18 +201,30 @@
 # endif
 #endif
 
-#define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+#ifdef CONFIG_SECTION_NO_KEEP_SUPPORT
+#define NO_KEEP(sec) sec
+#else
+#define NO_KEEP(sec) KEEP(sec)
+#endif
+
+#define _BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, _KEEP_, ...)	\
 	_BEGIN_##_label_ = .;						\
-	KEEP(*(BSEC_MAIN(_sec_)))					\
+	_KEEP_(*(BSEC_MAIN(_sec_)))					\
 	_END_##_label_ = .;
 
-#define BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+#define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, ...)		\
+	_BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, ##__VA_ARGS__, KEEP)
+
+#define _BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, _KEEP_, ...)\
 	_label_##_BEGIN_ = .;						\
-	KEEP(*(BSEC_MAIN(_sec_)))					\
+	_KEEP_(*(BSEC_MAIN(_sec_)))					\
 	_label_##_END_ = .;
 
-#define BOUNDED_SECTION_BY(_sec_, _label_)				\
-	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
+#define BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, ...)		\
+	_BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, ##__VA_ARGS__, KEEP)
+
+#define BOUNDED_SECTION_BY(_sec_, _label_, ...)				\
+	_BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop, ##__VA_ARGS__, KEEP)
 
 #define BOUNDED_SECTION(_sec)	 BOUNDED_SECTION_BY(_sec, _sec)
 
diff --git a/init/Kconfig b/init/Kconfig
index 9599d2de44e8..aeb859e410b2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1467,6 +1467,13 @@ config HAVE_SECTION_NO_KEEP_SUPPORT
 	depends on HAVE_SECTION_SHF_LINK_ORDER_SUPPORT || HAVE_SECTION_SHF_GROUP_SUPPORT
 	default y
 
+config SECTION_NO_KEEP_SUPPORT
+	bool
+	depends on SECTION_SHF_LINK_ORDER_SUPPORT || SECTION_SHF_GROUP_SUPPORT
+	default y
+	help
+	  This option allows some sections unkept so they can be GC
+
 config HAVE_SECTION_SHF_LINK_ORDER_SUPPORT
 	bool
 	depends on AS_IS_GNU && AS_VERSION >= 23500
@@ -1765,6 +1772,7 @@ config RESTRICTED_TRIM_UNUSED_SYSCALLS
 config SECTION_SHF_LINK_ORDER_SUPPORT
 	bool "Using SHF_LINK_ORDER attribute (EXPERIMENTAL)" if EXPERT
 	depends on HAVE_SECTION_SHF_LINK_ORDER_SUPPORT
+	select SECTION_NO_KEEP_SUPPORT
 	help
 	  Say Y here to trim more 'unused' syscalls wrongly kept by __ex_table
 	  like sections in kernel space.
@@ -1778,6 +1786,7 @@ config SECTION_SHF_LINK_ORDER_SUPPORT
 config SECTION_SHF_GROUP_SUPPORT
 	bool "Using SHF_GROUP attribute (EXPERIMENTAL)" if EXPERT
 	depends on HAVE_SECTION_SHF_GROUP_SUPPORT
+	select SECTION_NO_KEEP_SUPPORT
 	help
 	  Say Y here to trim more 'unused' syscalls wrongly kept by __ex_table
 	  like sections in kernel space.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
