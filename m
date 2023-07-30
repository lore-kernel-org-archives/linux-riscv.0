Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7E8EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jul 2023 08:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLLxFYxD/wm4PmHRItnDyVHbL1RYZxWkos2rS+P4dpo=; b=iiDj+UD01DqD9M
	rnviVRIy2qZvIfDOUpJcim1Ggn7PXCS+N5+2tuCOH9OtcgQQsCFyuTt88leTzBVeMdImsA7NYq5fp
	T4zRbARb/PtygvJkkxA+GB1u0p1zlgHUJjlGpBngmB8iX1ZHEbbgWtRsLbP1ySsA2zksJ13zPsH9I
	rRAaLiHjP/bzSJ1n4fRPm6gquMwp4VNqWZ66zJl75cC72EOlYMNbmF2sfURmxwIHgKaU0e6r2lAQ+
	zr3K+OGeB52zT1R/zRqAYnmA7FnR2POtWB43HXcQRq4ixodkjsPxbo16kR5e4Siyj3jz19OuoOV41
	PFWrkV0yZHac+57WNUpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ1ly-00AXeT-1r;
	Sun, 30 Jul 2023 08:27:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ1lv-00AXcF-0R
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jul 2023 08:27:29 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52227884855so5470298a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jul 2023 01:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690705645; x=1691310445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yd7KEXZAW7eX+hNRe4Tt2lcKQC5uzSvrHXquUEQC3kY=;
        b=X3jcZ16BOTMFY1dukAFIkwTfr2KyBV8n5ZDI4kbF3CoGafX/TJUBMJiQkBUoVTHwCC
         b8IbdVy80EB1kPNjI9N0wV79yQtYDCQJiwk6VBT1WAUI/EfqoShTTTiS5O7gaNRS+4/K
         DjwbRtSC4LU0oCIgJOF1+4Bq/UyRGGkCHLyqjVHbl7DP+2QjNhH5pODah/+gDw+XHE+o
         JyDkdCuHrggD0nya2sRBTFG8DJowgGuDrJx61PppyEhkpjC97zmWAscuUlBWG5Ab6aRK
         W3Em69f9YrzcZO2DDzgI/BftShxtZqIpBMxxN3E5shez7j3lMQHglhwUQPTKAydC76R8
         r9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690705645; x=1691310445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yd7KEXZAW7eX+hNRe4Tt2lcKQC5uzSvrHXquUEQC3kY=;
        b=P0GBcHL1YC77sLP0AZSWsiJcaqV4z7oB8GZFdDVIBMMpeV4zvc2jgR+79wBhU7WI8j
         qFEOnm8DOIog9Vn0CknT7iGzPVj/WYdtWIdiLVi9t8KWLHMjmHk3bCusvAniYIPVikNY
         C+GI8JQHgnJnrv57S7XffqDwuSCqOnBWIq7eo/Pw2H9oifKRdQrXwxd2w27GVx1Mwdgc
         NYhv5HufA4iSY2SWs7vNiasgOKyqk58o4aly1TOq4T6UGNrYDWgo8R7ORNUEnZzRKIPR
         0x3vWFwjrgA46JQXpOn74iW/Xxu6Xz/2yajwvosqGYJmqtiswr1bxf+YxeLXzPWuyUtj
         y7sA==
X-Gm-Message-State: ABy/qLbDso6U3SiBVYgLcZ+MLIdv6r0G4wQ/JRo7D4ZgUXSoAhCC+e/a
	FtitPyounRONuFPw/lCHNi8=
X-Google-Smtp-Source: APBJJlG4Fd0Z04vIN8O51EYm+AoZ1UaXmlDkenzktyyD+nL0+Zu6mVBfLEg9aEJRCFHUIoyhA4DvwQ==
X-Received: by 2002:a05:6402:b0e:b0:521:7a5e:ab1e with SMTP id bm14-20020a0564020b0e00b005217a5eab1emr7141332edb.21.1690705644988;
        Sun, 30 Jul 2023 01:27:24 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id m17-20020aa7d351000000b005224c6b2183sm3790791edr.39.2023.07.30.01.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 01:27:24 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: test code for kprobe
Date: Sun, 30 Jul 2023 10:27:10 +0200
Message-Id: <fc71730b9350026427fe1c2bdbce9b993d8bc6f5.1690704360.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690704360.git.namcaov@gmail.com>
References: <cover.1690704360.git.namcaov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_012727_176603_73E010B9 
X-CRM114-Status: GOOD (  14.64  )
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

---
 drivers/test_kprobe/Makefile      |   3 +
 drivers/test_kprobe/test_kprobe.c | 265 ++++++++++++++++++++++++++++++
 2 files changed, 268 insertions(+)
 create mode 100644 drivers/test_kprobe/Makefile
 create mode 100644 drivers/test_kprobe/test_kprobe.c

diff --git a/drivers/test_kprobe/Makefile b/drivers/test_kprobe/Makefile
new file mode 100644
index 000000000000..c3c39bd0f8b5
--- /dev/null
+++ b/drivers/test_kprobe/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+obj-m += test_kprobe.o
diff --git a/drivers/test_kprobe/test_kprobe.c b/drivers/test_kprobe/test_kprobe.c
new file mode 100644
index 000000000000..543108c5fc8a
--- /dev/null
+++ b/drivers/test_kprobe/test_kprobe.c
@@ -0,0 +1,265 @@
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kprobes.h>
+#include <linux/string.h>
+MODULE_LICENSE("Dual BSD/GPL");
+
+__attribute__ ((naked))
+int sample_c_j(void) {
+	__asm__(
+		"c.j label_cj\n"
+		"li a0, 0\n ret\n"
+		"li a0, 1\n ret\n"
+		"li a0, 2\n ret\n"
+		"li a0, 3\n ret\n"
+		"label_cj:\n"
+		"li a0, 4\n ret\n"
+		"li a0, 5\n ret\n"
+		"li a0, 6\n ret\n"
+	);
+}
+
+__attribute__ ((naked))
+int sample_c_jr(void) {
+	__asm__(
+		"la a0, label_c_jr\n"
+		"c_jr_location:\n"
+		"c.jr a0\n"
+		"li a0, 0\n ret\n"
+		"li a0, 1\n ret\n"
+		"li a0, 2\n ret\n"
+		"li a0, 3\n ret\n"
+		"label_c_jr:\n"
+		"li a0, 4\n ret\n"
+		"li a0, 5\n ret\n"
+		"li a0, 6\n ret\n"
+	);
+}
+
+__attribute__ ((naked))
+int sample_c_jalr(void) {
+	__asm__(
+		"mv a1, x1\n"
+		"la a0, label_c_jalr\n"
+		"c_jalr_location:\n"
+		"c.jalr a0\n"
+
+		"addi a0, a0, -5\n"
+		"jr a1\n"
+
+		"label_c_jalr:\n"
+		"li a0, 9\n ret\n"
+	);
+}
+
+__attribute__ ((naked))
+int sample_c_beqz(int a0) {
+	__asm__(
+		"c.beqz a0, beqz_label\n"
+		"li a0, 10\n ret\n"
+		"beqz_label:\n"
+		"li a0, 4\n ret\n"
+	);
+}
+
+__attribute__ ((naked))
+int sample_c_bnez(int a0) {
+	__asm__(
+		"c.bnez a0, bnez_label\n"
+		"li a0, 10\n ret\n"
+		"bnez_label:\n"
+		"li a0, 4\n ret\n"
+	);
+}
+
+static int pre_handler(struct kprobe *p, struct pt_regs *regs) {
+	printk("pre_handler() called\n");
+
+	return 0;
+}
+
+static int test_c_j(void) {
+	static struct kprobe kp;
+
+	int ret;
+
+	/* Test C.J */
+	kp.symbol_name = "sample_c_j";
+	kp.pre_handler = pre_handler;
+
+	ret = register_kprobe(&kp);
+	if (ret) {
+		printk("Couldn't register kprobe, err=%d\n", ret);
+		return -1;
+	}
+
+	ret = sample_c_j();
+	if (ret != 4) {
+		printk("ERROR: expect value 4, got %d\n", ret);
+		return -1;
+	}
+	else {
+		printk("Got value 4, all good!\n");
+		return 0;
+	}
+}
+
+static int test_c_jr(void) {
+	static struct kprobe kp;
+	int ret;
+
+	/* Test C.JR */
+	kp.symbol_name = "c_jr_location";
+	kp.pre_handler = pre_handler;
+
+	ret = register_kprobe(&kp);
+	if (ret) {
+		printk("Couldn't register kprobe, err=%d\n", ret);
+		return -1;
+	}
+
+	ret = sample_c_jr();
+	if (ret != 4) {
+		printk("Expect value 4, got %d\n", ret);
+		return -1;
+	}
+	else {
+		printk("Got value 4, all good!\n");
+		return 0;
+	}
+}
+
+static int test_c_jalr(void) {
+	struct kprobe kp;
+	int ret;
+
+	memset(&kp, 0, sizeof(kp));
+
+	/* Test C.JR */
+	kp.symbol_name = "c_jalr_location";
+	kp.pre_handler = pre_handler;
+
+	ret = register_kprobe(&kp);
+	if (ret) {
+		printk("Couldn't register kprobe, err=%d\n", ret);
+		return -1;
+	}
+
+	ret = sample_c_jalr();
+	if (ret != 4) {
+		printk("Expect value 4, got %d\n", ret);
+		return -1;
+	}
+	else {
+		printk("Got value 4, all good!\n");
+	}
+
+	unregister_kprobe(&kp);
+
+	return 0;
+}
+
+static int test_c_bnez(void) {
+	static struct kprobe kp;
+
+	int ret;
+
+	/* Test C.JR */
+	kp.symbol_name = "sample_c_bnez";
+	kp.pre_handler = pre_handler;
+
+	ret = register_kprobe(&kp);
+	if (ret) {
+		printk("Couldn't register kprobe, err=%d\n", ret);
+		return -1;
+	}
+
+	ret = sample_c_bnez(1);
+	if (ret != 4) {
+		printk("Expect value 4, got %d\n", ret);
+		return -1;
+	} else {
+		printk("Got value 4, all good!\n");
+	}
+
+	ret = sample_c_bnez(0);
+	if (ret != 10) {
+		printk("Expect value 10, got %d\n", ret);
+		return -1;
+	} else {
+		printk("Got value 4, all good!\n");
+	}
+
+	return 0;
+}
+
+static int test_c_beqz(void) {
+	static struct kprobe kp;
+
+	int ret;
+
+	/* Test C.JR */
+	kp.symbol_name = "sample_c_beqz";
+	kp.pre_handler = pre_handler;
+
+	ret = register_kprobe(&kp);
+	if (ret) {
+		printk("Couldn't register kprobe, err=%d\n", ret);
+		return -1;
+	}
+
+	ret = sample_c_beqz(0);
+	if (ret != 4) {
+		printk("Expect value 4, got %d\n", ret);
+		return -1;
+	}
+	else {
+		printk("Got value 4, all good!\n");
+		return 0;
+	}
+
+	ret = sample_c_beqz(1);
+	if (ret != 10) {
+		printk("Expect value 10, got %d\n", ret);
+		return -1;
+	}
+	else {
+		printk("Got value 4, all good!\n");
+		return 0;
+	}
+}
+
+static int hello_init(void)
+{
+	printk("Hello\n");
+
+	printk("Testing C.J...\n");
+	if (test_c_j())
+		return -1;
+
+	printk("Testing C.JR...\n");
+	if (test_c_jr())
+		return -1;
+
+	printk("Testing C.JALR...\n");
+	if (test_c_jalr())
+		return -1;
+
+	printk("Testing C.BNEZ...\n");
+	if (test_c_bnez())
+		return -1;
+
+	printk("Testing C.BEQZ...\n");
+	if (test_c_beqz())
+		return -1;
+
+	return 0;
+}
+
+static void hello_exit(void)
+{
+	printk("Goodbye\n");
+}
+
+module_init(hello_init);
+module_exit(hello_exit);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
