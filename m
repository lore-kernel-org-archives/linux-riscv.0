Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B7AC7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 03:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WWO5tfwfEGs+Uji8rbnOiZ+sE3K2NA+07SjjqEX2MEg=; b=0BswhZ/tk4d8xz
	epDgcFODvRzm0mJmieiDLFzHp2NM0wqkrfhigJ7n2AgXefhQolf5CW5EOxsfSjLg3r3cCc/v/Z6ZP
	QDEb4GX6RxZkiQ9OFXkqgN5+trtSmSsBqeZQR00zxhMME+cwicteERulBUXBFeJKit1f3sGib6Vr8
	pIBYui8yJI/yDsZT+a10fuWVYRfO08XwjtpBBen8ux34x/Kds4+UoxXiNki9aFiLhDYgDuTWnc5zt
	3ctzlcTTkRub/bNvOT9E378IOY6hpRMnn1ybkJ6WAaF2sZu2K7Be2ebB+bdGFJ5zpkIRVYxGl81LB
	RrENlX+XStOVLcn1zMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q61DU-00DyN2-28;
	Mon, 05 Jun 2023 03:49:12 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q61DS-00DyME-1i
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 03:49:12 +0000
X-QQ-mid: bizesmtp81t1685936936tm3qiisk
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Jun 2023 11:48:55 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: PS/N6jJLnDbUhcG1tckp2UkFkb6Y4PEy7Kf4nOh/3d2cGqfkeUq0q6+sKvs5r
	4d/2AhXp1+1Ke3XxAEpTe4xrbrIDxn6kk4nhbiHJNnZVr+RNd9/wfD9i5Gg/NvF44ptXKAf
	M7/nom8UB9c7Sel4L85G5RjmPuXwka10IPIQeZ37y7u2Hfk3Fk8yZIkoCkz89r30XOFk/fQ
	CboWKF/ON91qEsDHmEaJpy/YHJKw9vefCoivanIsUcYrZLxS/VnW/4VO3ap36W8i7vIuPGu
	FB4ZLSuv3PsjBuf8cs71QZ8o+IgsJDPqeRbQcHEy7NqFxHl7oEiwZosr8XuNoHHE3ODeXFC
	p/s1Jq3A6+bNSgZAzUcm+k/W2k64vxSIgijB2BtMEaXGClTr/tVw2Vy2qGk5A==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17656311057048569074
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 1/4] selftests/nolibc: add a test-report target
Date: Mon,  5 Jun 2023 11:48:52 +0800
Message-Id: <291c5437db94057a3b045a6f036b02658380b05b.1685936428.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685936428.git.falcon@tinylab.org>
References: <cover.1685936428.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_204910_871915_8A0CB8D1 
X-CRM114-Status: UNSURE (   7.27  )
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

A standalone test-report target is added to let the run, run-user and
rerun targets share them.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/Makefile | 26 ++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index be4159837494..8149ace2938a 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -127,14 +127,18 @@ nolibc-test: nolibc-test.c sysroot/$(ARCH)/include
 libc-test: nolibc-test.c
 	$(QUIET_CC)$(CC) -o $@ $<
 
-# qemu user-land test
-run-user: nolibc-test
-	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
+test-report:
 	$(Q)awk '/\[OK\]$$/{p++} /\[FAIL\]$$/{f++} /\[SKIPPED\]$$/{s++} \
 	         END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
 	         if (s+f > 0) printf(" See all results in %s\n", ARGV[1]); else print; }' \
 	         $(CURDIR)/run.out
 
+# qemu user-land test
+_run-user: nolibc-test
+	$(Q)qemu-$(QEMU_ARCH) ./nolibc-test > "$(CURDIR)/run.out" || :
+
+run-user: _run-user test-report
+
 initramfs: nolibc-test
 	$(QUIET_MKDIR)mkdir -p initramfs
 	$(call QUIET_INSTALL, initramfs/init)
@@ -147,20 +151,16 @@ kernel: initramfs
 	$(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs
 
 # run the tests after building the kernel
-run: kernel
+_run: kernel
 	$(Q)qemu-system-$(QEMU_ARCH) -display none -no-reboot -kernel "$(srctree)/$(IMAGE)" -serial stdio $(QEMU_ARGS) > "$(CURDIR)/run.out"
-	$(Q)awk '/\[OK\]$$/{p++} /\[FAIL\]$$/{f++} /\[SKIPPED\]$$/{s++} \
-	         END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
-	         if (s+f > 0) printf(" See all results in %s\n", ARGV[1]); else print; }' \
-	         $(CURDIR)/run.out
+
+run: _run test-report
 
 # re-run the tests from an existing kernel
-rerun:
+_rerun:
 	$(Q)qemu-system-$(QEMU_ARCH) -display none -no-reboot -kernel "$(srctree)/$(IMAGE)" -serial stdio $(QEMU_ARGS) > "$(CURDIR)/run.out"
-	$(Q)awk '/\[OK\]$$/{p++} /\[FAIL\]$$/{f++} /\[SKIPPED\]$$/{s++} \
-	         END{ printf("%d test(s) passed, %d skipped, %d failed.", p, s, f); \
-	         if (s+f > 0) printf(" See all results in %s\n", ARGV[1]); else print; }' \
-	         $(CURDIR)/run.out
+
+rerun: _rerun test-report
 
 clean:
 	$(call QUIET_CLEAN, sysroot)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
