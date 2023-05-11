Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCB7C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 01:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPldFfJP/ntctTl8cgl0YKFss0+E0YKTh2vaN90j9JY=; b=VhO9Ddz+vS1Vp7
	tdB7oFqB73nDyQXBOgaXYy6ptk6DuZhlxwT87Du0hDenQvGAakDIE6SDDYnfNPChsW1yfniyU8jDt
	FqTCTMfWAS/dCUELAi2BOt7m+OrPyh01OPJsoScHuedDKVRuA8f0MqlRtCEMr0+w5yh/Xb9l6F+jj
	MyHe0K2++b8Z+o7kYUHTIwsTFobskr0+GArB9xtWscbMj60lf6V0IGfnNdOZaTR2qy/3nhEghUo4W
	SiTBs4W88Gc39wKawwIQjfKrcFKubOhXzP/fYicyljTM77jS2bUZg6bBU+6B4qBOX4w6hgpjXceY3
	P3OxQOy1tib6a02sD21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwvD8-007SD7-35;
	Thu, 11 May 2023 01:35:14 +0000
Received: from m12.mail.163.com ([220.181.12.217])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwvD5-007SCj-1j
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 01:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=cR7+2
	t+0b0AcTv+1gS1SNzk+cirj2d8JCGOUBrY8OuU=; b=N6U+GLfJwnELRIvyHdX0i
	Ihhsnlk5QG0LKMS7AFckJNdKB2ihMBEcViphfplKRfJk1FcCo+YGyLG656lWdX8d
	4A0yhhEJruIqLzG+DLl4w75gtTvzgdZMjNEJm19CmMoaeU9+/Oq0h1K3/ptlrrKh
	wacwv/XM7B9VJ0d4wgkcDc=
Received: from zhangf-virtual-machine.localdomain (unknown [180.111.102.183])
	by zwqz-smtp-mta-g5-3 (Coremail) with SMTP id _____wAHa+BFRlxkpawlBg--.7119S2;
	Thu, 11 May 2023 09:35:01 +0800 (CST)
From: zhangfei <zhang_fei_0403@163.com>
To: zhang_fei_0403@163.com
Cc: ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	zhangfei@nj.iscas.ac.cn
Subject: [PATCH v2 2/2] RISC-V: lib: Optimize memset performance
Date: Thu, 11 May 2023 09:34:53 +0800
Message-Id: <20230511013453.3275-1-zhang_fei_0403@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511012604.3222-1-zhang_fei_0403@163.com>
References: <20230511012604.3222-1-zhang_fei_0403@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAHa+BFRlxkpawlBg--.7119S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar17ur4rJr1fuF1rArW8Zwb_yoW8GrW5pr
	4rCFs3Kr15trn3Wr9xtw1qqr45GayfKw15Grsrtw1kJrsrWa1jv34rX3y5WFy7Gryvyrs3
	Zr42yr18WF1UAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRVOJrUUUUU=
X-Originating-IP: [180.111.102.183]
X-CM-SenderInfo: x2kd0w5bihxsiquqjqqrwthudrp/xtbCfA9sl2DcJgt+CAAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_183511_925851_7C617E65 
X-CRM114-Status: UNSURE (   6.66  )
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

Optimized performance when the data size is less than 16 bytes.
Compared to byte by byte storage, significant performance improvement has been achieved.
It allows storage instructions to be executed in parallel and reduces the number of jumps.
Additional checks can avoid redundant stores.

Signed-off-by: Fei Zhang <zhangfei@nj.iscas.ac.cn>
---
 arch/riscv/lib/memset.S | 40 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index e613c5c27998..452764bc9900 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -106,9 +106,43 @@ WEAK(memset)
 	beqz	a2, 6f
 	add	a3, t0, a2
 5:
-	sb	a1, 0(t0)
-	addi	t0, t0, 1
-	bltu	t0, a3, 5b
+       /* fill head and tail with minimal branching */
+       sb      a1,  0(t0)
+       sb      a1, -1(a3)
+       li 	a4, 2
+       bgeu 	a4, a2, 6f
+
+       sb 	a1,  1(t0)
+       sb 	a1,  2(t0)
+       sb 	a1, -2(a3)
+       sb 	a1, -3(a3)
+       li 	a4, 6
+       bgeu 	a4, a2, 6f
+
+       /* 
+        * Adding additional detection to avoid 
+        * redundant stores can lead 
+        * to better performance
+        */
+       sb 	a1,  3(t0)
+       sb 	a1, -4(a3)
+       li 	a4, 8
+       bgeu 	a4, a2, 6f
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
+       /* store the last byte */
+       sb 	a1,  7(t0)
 6:
 	ret
 END(__memset)
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
