Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81954C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 17:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58uYnt++nzdHS0Z/4mjEs5fquwDLKg2cJ5mqEg84VyY=; b=vjDQHpYz/HHDsG
	vpjPG+DSZ2nLiDSHEKhQGJDtREVZAgwBpSsANTkS+BCFslEXMTL9tsWqyOMwkIk70I12w5IMmuGo/
	n8vD09UHQ74olOhYB1/WTEiVJZRDGqWtuhtBhm1mpauZLqFAsMUjAuM0uHcxpHoSEdDrPIpZwEkZO
	4BdPdt6tN1XSCKnuCsExsyR09m15jnKeTO5S6Ya8fFWoDjYClVll4y/6DR3kewg0e0uM/cq5HgTOa
	VdL5oqtNAJOMyeL92McZW8xtHhAMK+Rbfez7aOBVS5jme9mJHdRT5Fwk2zgrOlkSOaypqy5I8ioHh
	tfrcD3hFLIjWKevnAhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sfr-00EH0U-0w;
	Wed, 24 May 2023 17:53:23 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1sfo-00EGxq-1C
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 17:53:21 +0000
X-QQ-mid: bizesmtp71t1684950791tp8m1e4l
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 May 2023 01:53:10 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 7jw2iSiCazqOcSM2MVgG4xMJ96kdb0v9csKqpcqqtj1u7+0ZkGV3bSXiAUJcM
	aPAdZ6wZXqVvTeOt/M4goYfpVARuW8z6EguvDuAJLX/NMvw9T9A3DVvTtgOUPKl1YALRxBS
	TdLGLYANVLa841J7A+shvQ0d56mm3F+wZ2zfuMB4lB4eq2tK9eIeOca6d4tS+HIqWRd4Lr0
	0CL0rD9Hk+708Xu1EYn2Ak3UMQlVPaHi14GgDDo8Tzi8zkdMP4S8OGl/mV4JGQvjMcYYFzY
	5U0oHA1KcUDOfkfEGRI0VTMWnd1DPmcYH2nY7flo325+orDVrm0s9NfMyRhzR4T84rIEw17
	27UMTVpM1ghVZtFwUpljIeOYNo9xmcTklQXF3dzYwF1eVQVUSdDO0Xd9JD7qA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2012140808971303429
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	thomas@t-8ch.de
Subject: [PATCH 06/13] selftests/nolibc: allow specify a bios for qemu
Date: Thu, 25 May 2023 01:52:29 +0800
Message-Id: <63bee74a7b3754a1b0e82bc57de52c18d2de003d.1684949268.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1684949267.git.falcon@tinylab.org>
References: <cover.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_105320_720270_FF7DA678 
X-CRM114-Status: GOOD (  10.05  )
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

riscv qemu has a builtin bios (opensbi), but it may not match the latest
kernel and some old versions may hang during boot, let's allow user pass
a newer version to qemu via the -bios option.

we can use it like this:

    $ make run BIOS=/path/to/new-bios ...

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 9adc8944dd80..9213763ab3b6 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -70,7 +70,8 @@ QEMU_ARGS_mips       = -M malta -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_riscv      = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_s390       = -M s390-ccw-virtio -m 1G -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
 QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
-QEMU_ARGS            = $(QEMU_ARGS_$(ARCH))
+QEMU_ARGS_BIOS       = $(if $(BIOS),-bios $(BIOS))
+QEMU_ARGS            = $(QEMU_ARGS_$(ARCH)) $(QEMU_ARGS_BIOS)
 
 # OUTPUT is only set when run from the main makefile, otherwise
 # it defaults to this nolibc directory.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
