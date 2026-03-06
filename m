Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61339F01828
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a14B8RAFpN6+DYFWwljTT4J39h141uHbp3fx6LN39tU=; b=j7bb7ow6a2a5ZQ
	7KJBbBcpiUcwfZLDbx+IdiyApK6dmHjKaSpCf2GUJWradyJaKhWMEQaQC1WpwIS7FDU8uTSN6Rke8
	yP6m1BKqYhfNtdhSnIuO/GpXubJyz2oKuO0/spacwX7ACXXUI1jp6nmGeZPQHr4J6tThMo62Hy3FH
	+IMjzn+C+aYwSIFl5HtLYL/f29nkwJdXXM8Uls/4YdAS9PPiAYfyATOUny4XDL+FFvfJ7ydMwnvMg
	4EAfYIL1Z2DJ1sbGhFa4cE7jueFV9BiuLvXBf2MEFRxjVxA16yW2bwfA50VLp0GpQAUGSMn95/FGR
	F/5M9TpW8ycXFaxejvcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTM7-00000003ZDC-0jHZ;
	Fri, 06 Mar 2026 11:28:31 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTM4-00000003ZCP-14sn
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 11:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4J
	BTRCBGa5ROeLIwLaPxKksydAUTfA05obJQkDOCbsg=; b=LnWQQVNyi5y/GIBzfF
	WpnpUoHBcvX+HseGqzedTjEz2pujuDzn2o91dScKHgmrJyfuDbJK893UJwa7I2Eo
	ky/pESt80mxw+7NzWPqPyG4ASUfgSf84fPzMGhe3HFg+8Ij+0cu+Vn1M7fbZx1Bg
	PULJUQyIjRsMvSyoMRYO4Du6w=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAnZc8ouqppZ42WOA--.54025S2;
	Fri, 06 Mar 2026 19:27:38 +0800 (CST)
From: "rom.wang" <r4o5m6e8o@163.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundatio.org>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yufeng Wang <wangyufeng@kylinos.cn>
Subject: [PATCH] riscv: enable HAVE_IOREMAP_PROT
Date: Fri,  6 Mar 2026 19:27:34 +0800
Message-Id: <20260306112734.108186-1-r4o5m6e8o@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wAnZc8ouqppZ42WOA--.54025S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW8Jry3AF1fCFW7tr45GFg_yoW8XFW3pa
	y3ur9a9rnxZrn8CFWqgry7WrWUJas3G39Fgw10kay8Wr1DAFy8Z3sayFnxJFyUXFZ5WFW8
	WF9ag34Fya1jyrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6OJrUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: 3uurkzkwhy0qqrwthudrp/xtbCzgq9M2mquir+agAA3N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_032828_707137_5336C8C6 
X-CRM114-Status: UNSURE (   9.06  )
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

From: Yufeng Wang <wangyufeng@kylinos.cn>

RISC-V has implemented pte_pgprot() and selects GENERIC_IOREMAP,
which provides a generic ioremap_prot() implementation. Enable
HAVE_IOREMAP_PROT to activate generic_access_phys() support, which
is useful for debugging (e.g., accessing /dev/mem via gdb).

Also update the architecture support documentation accordingly.

Signed-off-by: Yufeng Wang <wangyufeng@kylinos.cn>
---
 Documentation/features/vm/ioremap_prot/arch-support.txt | 2 +-
 arch/riscv/Kconfig                                      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/vm/ioremap_prot/arch-support.txt b/Documentation/features/vm/ioremap_prot/arch-support.txt
index 1638c2cb17f1..c0a2d8f56046 100644
--- a/Documentation/features/vm/ioremap_prot/arch-support.txt
+++ b/Documentation/features/vm/ioremap_prot/arch-support.txt
@@ -20,7 +20,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: | TODO |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..32b6aa8dece7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -113,6 +113,7 @@ config RISCV
 	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO && 64BIT
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP if MMU
+	select HAVE_IOREMAP_PROT if MMU
 	select GENERIC_IRQ_IPI if SMP
 	select GENERIC_IRQ_IPI_MUX if SMP
 	select GENERIC_IRQ_MULTI_HANDLER
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
