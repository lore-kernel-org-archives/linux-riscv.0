Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D40EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyfTxdVfDkfsrV7NLV1618dqOByaE8LjpA8EF/EwMu0=; b=i9/aatfuqwVI2S
	4xj6VZIqakdAeNe8LIoqT79uMFQ9Ju8v+7/cGC0o9gFgf5aQ3sGN0ejPMJpJ5Rid4EKgGS3Z12A3B
	Y+VHAoRlsQt/AUvwqXcEjY+AHsdtjWB1gKFRBNb1EZdHBnhUCv1fMeTL3akDOLLFjYBaP1OOmA9cY
	njmakBuRyFMxvIsHP7Ol4aR/ooEpprcqFfJprgLRdLHdvbu+o7sgjLN/B5qxugar7ck33qBcnUna+
	oYsO3nyfWgRbdqa0ZeTOBjdp2Z52a5nsSqDa3FRTt6nPSGpVDGjlweXddUq9fwZjUXHKtSkqkimnW
	bISNwBIJw5HwTDehu6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDzx-008Tqk-0e;
	Mon, 19 Jun 2023 12:28:45 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDzu-008TpT-1x
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 12:28:44 +0000
X-QQ-mid: bizesmtp81t1687177707tmneyvcl
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jun 2023 20:28:26 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 5q30pvLz2ic279cw/a00XjnqZBNnxTgxLNGC6G7VMExOCnBfI7C0htyxxzWKY
	LA5v3ik8/oYs8zCaHGKjtZ/1V4+e1Iwh4i0Rpn+oiq9SYoh6jr/S99wvl/1vEr8p0R4z3ms
	lgaKQkeqhhNBuB42rTLW0FAGdmmwyykpGkXnchmNDkOAZZ2ilQ+0MpMlTmlCIa9kQYeOtlY
	BEZOrE68ogo7OmquvaAJweTQn7BQflcMhTRoZ62o4IY59iZqqBLjqz9z2aUByaD/FfITuvj
	6WkOZamXc1txAV3HCZJMNwX/kUVydRmuN1Ep+b7mcNTrFyElbsr7yRiHP3vb4XQ/d423peo
	hKWy5deLwn5KsqDutzogRy0HI4veS/4vusbw+UVoxz58OxqseAmqa5ffwrsFA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4499761798430525214
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v5 4/5] tools/nolibc: add kernel and nolibc specific ARCH variables
Date: Mon, 19 Jun 2023 20:28:23 +0800
Message-Id: <be68f6023139b94152ae13f101caef8b4d671a3a.1687176996.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687176996.git.falcon@tinylab.org>
References: <cover.1687176996.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_052842_940168_415C9547 
X-CRM114-Status: UNSURE (   7.20  )
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

Like the KARCH added for tools/testing/selftests/nolibc/Makefile, adds
KARCH for tools/include/nolibc/Makefile too, at the same time, adds
NARCH for the ARCH supported by nolibc (arch-<NARCH>.h).

It allows users to customize both kernel and nolibc specific ARCH
variables for different architectures and their variants easily.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/Makefile | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 64d67b080744..14a6416fa57f 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -23,8 +23,14 @@ else
 Q=@
 endif
 
-nolibc_arch := $(patsubst arm64,aarch64,$(ARCH))
-arch_file := arch-$(nolibc_arch).h
+# kernel supported ARCH names by architecture
+KARCH            = $(or $(KARCH_$(ARCH)),$(ARCH))
+
+# nolibc supported ARCH names by architecture
+NARCH_arm64      = aarch64
+NARCH            = $(or $(NARCH_$(ARCH)),$(ARCH))
+
+arch_file := arch-$(NARCH).h
 all_files := \
 		compiler.h \
 		ctype.h \
@@ -83,8 +89,8 @@ headers:
 	fi > $(OUTPUT)sysroot/include/arch.h
 
 headers_standalone: headers
-	$(Q)$(MAKE) -C $(srctree) headers
-	$(Q)$(MAKE) -C $(srctree) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
+	$(Q)$(MAKE) -C $(srctree) ARCH=$(KARCH) headers
+	$(Q)$(MAKE) -C $(srctree) ARCH=$(KARCH) headers_install INSTALL_HDR_PATH=$(OUTPUT)sysroot
 
 clean:
 	$(call QUIET_CLEAN, nolibc) rm -rf "$(OUTPUT)sysroot"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
