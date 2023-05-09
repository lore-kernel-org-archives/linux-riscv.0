Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907EAC77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 02:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gvow+86ShZINI4ddsb1RTBGf8t1/Yc9yxplz6FC15Y0=; b=UvDoxUmpWDlshz
	qQWIfJoQ9MXB8I6QKOL2cihofvfEp7RMNQ6CZE/2ymwplkXaibK+t5ECHBiaS3dBMQEmQKKVDl2Bv
	LxB2sd8ksP1iZnKRx0sypwMIqk+kL0SbfCarYTndz3NpQl2hcn+BF+U8jKa963AAyigjWvLDfTJzt
	XRoWP+z/lBz5cT2wu0yZphvG5zpWf3zEM4hZpK+SPidq2p+WsjX8f4epe9q7VhbG6q7RvfYFvPidg
	KjGk5oReBU5TZq7ShAAejQQZiwLb2WkGVs6Qiqrx7F1LREmG2SnI2k8Fu/ykcj+ZXyPnSu8bMdiGV
	sy/bJBaFdZxOq6v1tszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwD0M-0026ct-29;
	Tue, 09 May 2023 02:23:06 +0000
Received: from m12.mail.163.com ([220.181.12.214])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwD0K-0026bF-0J
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 02:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=B7r1H
	xceD8xEK8s87PGYO33d2ZP2EMjWFu6ZqdrIJYA=; b=ewLVubx1vuM7+F2HbEh6V
	RjjOdHi/nSWdQ/2WLQC1kQqlhrdBUjn+AS3iO1Cl3P/qjYbHFc1y3zO0hmmzArbF
	9Cgc7Vdcq6whuRQIhEFyDje45wz+lPNhG/xh+qV7TeztGbge+JIrrPhZ+2HwAu3b
	l6ArpdN92sy3RAwZeyJsIw=
Received: from zhangf-virtual-machine.localdomain (unknown [180.111.102.183])
	by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wBXf4dSrllkqHhsBQ--.30265S3;
	Tue, 09 May 2023 10:22:13 +0800 (CST)
From: zhangfei <zhang_fei_0403@163.com>
To: ajones@ventanamicro.com
Cc: aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	zhangfei@nj.iscas.ac.cn
Subject: [PATCH 2/2] riscv: Optimize memset
Date: Tue,  9 May 2023 10:22:06 +0800
Message-Id: <20230509022207.3700-2-zhang_fei_0403@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509022207.3700-1-zhang_fei_0403@163.com>
References: <20230505-9ec599a36801972451e8b17f@orel>
 <20230509022207.3700-1-zhang_fei_0403@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wBXf4dSrllkqHhsBQ--.30265S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7GryxZw13AF1kGw15JFW7twb_yoWDZwc_Jr
	WxCa97JFyDJFZ3Za9rtw15Kry8uFZ8KrykGF1Dtw1UG3WFkr13trWYqry5Ar18XwsrGay3
	G3ZrJrWrXr1UGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeYNt3UUUUU==
X-Originating-IP: [180.111.102.183]
X-CM-SenderInfo: x2kd0w5bihxsiquqjqqrwthudrp/1tbiWxZql2I0Z8wmqwAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_192304_464107_F6D0AA3E 
X-CRM114-Status: UNSURE (   6.48  )
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

From: zhangfei <zhangfei@nj.iscas.ac.cn>

This patch has been optimized for memset data sizes less than 16 bytes.
Compared to byte by byte storage, significant performance improvement has been achieved.

Signed-off-by: Fei Zhang <zhangfei@nj.iscas.ac.cn>
---
 arch/riscv/lib/memset.S | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index e613c5c27998..6113a2696e79 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -106,9 +106,36 @@ WEAK(memset)
 	beqz	a2, 6f
 	add	a3, t0, a2
 5:
-	sb	a1, 0(t0)
-	addi	t0, t0, 1
-	bltu	t0, a3, 5b
+       sb      a1,  0(t0)
+       sb      a1, -1(a3)
+       li      a4, 2
+       bgeu    a4, a2, 6f
+
+       sb 	a1,  1(t0)
+       sb 	a1,  2(t0)
+       sb 	a1, -2(a3)
+       sb 	a1, -3(a3)
+       li 	a4, 6
+       bgeu 	a4, a2, 6f
+
+       sb 	a1,  3(t0)
+       sb 	a1, -4(a3)
+       li 	a4, 8
+       bgeu    a4, a2, 6f
+
+       sb 	a1,  4(t0)
+       sb 	a1, -5(a3)
+       li 	a4, 10
+       bgeu 	a4, a2, 6f
+
+       sb 	a1,  5(t0)
+       sb 	a1,  6(t0)
+       sb 	a1, -6(a3)
+       sb 	a1, -7(a3)
+       li 	a4, 14
+       bgeu 	a4, a2, 6f
+
+       sb 	a1, 7(t0)
 6:
 	ret
 END(__memset)
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
