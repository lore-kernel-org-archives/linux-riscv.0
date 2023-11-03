Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB69AC0018A
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQu8Ca6ZzzKEcAslom85TEOQT4F4ao4rYYLhnInUrlQ=; b=wxSczEHKvBrvjY
	OrGwbSWaLEOG9yytx379FafBP5zeSjd333nLLDSx2ZfuspuVbiJo5Phfn/2AyGYyqZ3nv0BzBqwpZ
	xKSzMaIwdt14v82W/2rqC1cI8vPHRIGe+EGKclIFAyoY2BCgsVfX7za5HZNrDzYr+Ye+HUvnpzvVG
	NuvwNvQkrWph5Sin6W0XKmQQSlDPznc91QOV9q1roE9JQq37YjtEj/WwAv8N2ltC2GJckPX+LMqLF
	w7eYegK+NZsZjV63uzJHEUIzMbCdCQTSy3cnXPlOB1lH1IEsYYhyC2uH6LXZcUfcKVUhKDXNIP9vk
	yZHFOlHtE5fRf9NuY6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywZp-00BjRj-07;
	Fri, 03 Nov 2023 15:59:17 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywZl-00BjQZ-3B
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 15:59:15 +0000
X-QQ-mid: bizesmtp86t1699027134tyw2b1v4
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Nov 2023 23:58:50 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: eSZ1CZgv+JCVHfF1wGxh8nF1q0geFQVjdp7+4eC2s5jBRXYvF4MCh5LGR7B+E
	8+fmWyYidCbzrgu0MyIjfriJ59BganbsFbgX/5YcVpNzFbubzZ6dLiMjHahc457QS0HWkpM
	Fs+rI0pdcMyYCTK4SUwz0pMd3PBl01wPTUvQesEcQq+EJG/XuR2vXuTHrlODVWPty+yV/29
	2Vnc8zaKv9YE6DbotW/r8+csDUkR1pa5ZtDVaUUN5+YVN0eCeGjKznkQB0jsEaGSMDKdrln
	4vKFNLZIoLjH5UocAwhtcmVuhVONXyw1aSP1/0oQeB7WlrjtTw1rgFghaFSj/mHgl+ZkWO2
	yA9Fx5mYFZAXRB61jZpB7Sq3gDPes8pPxQZSZMLehfXO4a96th3jTtVgpf52ywStnBsM5Uq
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9783515542256517097
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
Subject: [PATCH v1 02/14] compiler: add a global __QUITE_UNIQUE_ID()
Date: Fri,  3 Nov 2023 23:58:49 +0800
Message-Id: <152d812cb6fa2c6018794ea7f05f487631542d6e.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_085914_338847_D72FD8C0 
X-CRM114-Status: GOOD (  10.88  )
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

From: Zhangjin Wu <falcon@tinylab.org>

Differs from __UNIQUE_ID(), __QUITE_UNIQUE_ID() also appends the
__COUNTER__ info to make it more unique.

Besides, seems assembly code also require such a unique id, let's make
it global, the same to the required __PASTE macro.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
I am not sure whether it is proper to put the __QUITE_UNIQUE_ID and
other stuff later in compiler.h. Welcome discussion as this is just
a preliminary approach.

 include/linux/compiler.h       | 5 +++++
 include/linux/compiler_types.h | 8 ++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index d7779a18b24f..405b19cf6cf3 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -227,6 +227,11 @@ static inline void *offset_to_ptr(const int *off)
 
 #endif /* __ASSEMBLY__ */
 
+/* Quite-unique ID. */
+#ifndef __QUITE_UNIQUE_ID
+# define __QUITE_UNIQUE_ID(prefix) __PASTE(__PASTE(prefix, __LINE__), __COUNTER__)
+#endif
+
 /* &a[0] degrades to a pointer: a different type from an array */
 #define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
 
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index c523c6683789..0b79e19d1017 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -70,10 +70,6 @@ static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
 # define __builtin_warning(x, y...) (1)
 #endif /* __CHECKER__ */
 
-/* Indirect macros required for expanded argument pasting, eg. __LINE__. */
-#define ___PASTE(a,b) a##b
-#define __PASTE(a,b) ___PASTE(a,b)
-
 #ifdef __KERNEL__
 
 /* Attributes */
@@ -308,6 +304,10 @@ struct ftrace_likely_data {
 
 #endif /* __ASSEMBLY__ */
 
+/* Indirect macros required for expanded argument pasting, eg. __LINE__. */
+#define ___PASTE(a, b) a##b
+#define __PASTE(a, b) ___PASTE(a, b)
+
 /*
  * The below symbols may be defined for one or more, but not ALL, of the above
  * compilers. We don't consider that to be an error, so set them to nothing.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
