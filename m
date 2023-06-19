Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33994EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qbq8kJOYR33nJVCWW7SsMX0HzcRyLU9EubdgdUxO5ak=; b=hrnLI4kJhv/Kjh
	t+Sou8GsytSwQs6amyv64ay/CLP3cvNl2pmSn3SupSey0g75y5g5G4KjKWdLg1oqEYxkZOEDmY0h2
	4QopqaTbTDLvRAhByZYZPn0aMUgST7QK6G86rYoIKbeh4blTP288lnrP8ekDYUyOiVRyA+1pWazqT
	SxrhT7/eQ7NTlzyF3tAPjH+I7nbw8ibl1qhdqFKt3vIiC1JnXCB/z6CnkXtE/2U44X0rMm2zAOycp
	1YQa28QTmju6FUuXhr2iaBteoCEWFfwf1A6r95StkuM1yIeD9lD/uY7ZD3cTOnCnEgNkQJVTiwD6w
	lG28C1Ce25xGFy3oTPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDz9-008TkH-0P;
	Mon, 19 Jun 2023 12:27:55 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBDz6-008Tj0-0G
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 12:27:53 +0000
X-QQ-mid: bizesmtp66t1687177631teie4acy
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jun 2023 20:27:10 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: FVl8EHhfVR4G8njjimH22Yic6dkZ/h69DI80pcJOhgqYGvZ/p2pAaliIhKcCV
	E2+RX78p2BQadDdb1HY3kl9GzWyCiyTmwr4LHv+OGA+S9WNC/ll+g68ESp594/X4kMaOphE
	vh2WS3CuISBsyl3Zz8fGxxQiLLuoLKlSt3i1DJBxrhCqNFbafjCsK6PiFPlBhiVnO9zrTPp
	DlMsNAixfnzM4wnTPRdMU6LO1myVXaj+DDdtE8KSdsUz6rj7JsIww6pmS9w0DjbVzGUVl6x
	j0Mu6TJlhXjREv5DVU2tF5ejBOyvD+jjmeyLM9yjpUbPyP4VlLiP+tJPQwZ7dEzhYI7ng/4
	zAQBbLmoodaPmW2bY7PuhOtE17nv67t3cNSXEPjaZPp+bYdRNCYfbInGOOuiaTx6rlcgFDz
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9699929361938748553
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v5 3/5] selftests/nolibc: allow customize kernel specific ARCH variable
Date: Mon, 19 Jun 2023 20:27:06 +0800
Message-Id: <0deeb36e44db5abb936a99d855b86a3c76d2a102.1687176996.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687176996.git.falcon@tinylab.org>
References: <cover.1687176996.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_052752_411026_F4AAAFB2 
X-CRM114-Status: UNSURE (   8.13  )
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

Some architectures (e.g. riscv, mips) share the same ARCH variable (the
one supported by top-level kernel Makefile) between 32bit and 64bit
architecture variants and even more, some of them have little endian and
big endian variants.

Let's add KARCH to allow architectures customize their own kernel
specific ARCH variable, so, ARCH=$(KARCH) is required by all of the
top-level kernel Makefile targets.

Suggested-by: Willy Tarreau <w@1wt.eu>
Link: https://lore.kernel.org/lkml/ZIAywHvr6UB1J4of@1wt.eu/
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 000621f21adc..ebecb8cfd947 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -14,6 +14,9 @@ include $(srctree)/scripts/subarch.include
 ARCH = $(SUBARCH)
 endif
 
+# kernel supported ARCH names by architecture
+KARCH            = $(or $(KARCH_$(ARCH)),$(ARCH))
+
 # kernel image names by architecture
 IMAGE_i386       = arch/x86/boot/bzImage
 IMAGE_x86_64     = arch/x86/boot/bzImage
@@ -143,10 +146,10 @@ initramfs: nolibc-test
 	$(Q)cp nolibc-test initramfs/init
 
 defconfig:
-	$(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare
+	$(Q)$(MAKE) -C $(srctree) ARCH=$(KARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) mrproper $(DEFCONFIG) prepare
 
 kernel: initramfs
-	$(Q)$(MAKE) -C $(srctree) ARCH=$(ARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs
+	$(Q)$(MAKE) -C $(srctree) ARCH=$(KARCH) CC=$(CC) CROSS_COMPILE=$(CROSS_COMPILE) $(IMAGE_NAME) CONFIG_INITRAMFS_SOURCE=$(CURDIR)/initramfs
 
 # run the tests after building the kernel
 run: kernel
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
