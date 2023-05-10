Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A2FC7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 03:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIKlgkNZVKJxSCRwAkHF11KoPHZrX9YgHSyPiggRmPk=; b=dnIbXpqSaqfQ+x
	O1K6iBih1V44FpUY5CJQkNuXKcNYSIXSvy34ZmHxLoTOtpX2TeyAyrOUY5pB6O52f09lzR6d1upFQ
	bUel+jgJKF0DqF24espCNKizSeCR0O9gbRunVMjUtj5hvBh7s+xl0Sc5qZop7Im8Xs7NmQms2cuA3
	fjRIq2XzZ33jvwkctv44RWI7bnUQOJUNT1ud13slHUSwMmt60/nFd3UvNjhQVtKzlGCP8ekrjY7Ul
	i4iIEFsUYNYE2n9khpyEAMYwmZZINdFG9FkxxXJAIfe0ClLpKYBokZKgz0MMOJrG8IwaTF7Xn2XOE
	YubAtl6+O/qicplVmHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwat3-004wu6-08;
	Wed, 10 May 2023 03:53:09 +0000
Received: from m12.mail.163.com ([220.181.12.199])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwasx-004wst-2r
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 03:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=iEiFU
	y1jQsRM6aIe5Ug6C6I5S7K8RRjm4135kykYFHY=; b=kauZQLk2XXLBOu4xJE3XR
	4fl5u+T5bRybY2yydZfvCRtnVIU1brx6hI4krs+8NYWr8KCZr8RnRUx6IM2ToyCw
	WGvfxfyHK3trkzUq+mZJdVrTOxikBJMNxLlvGci0/xdttQF3TOjh6bXljEFv+712
	3TdLFvcSz+cZzw1PaQipCQ=
Received: from zhangf-virtual-machine.localdomain (unknown [180.111.102.183])
	by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wBHlVQOFVtk+zPWBQ--.60792S4;
	Wed, 10 May 2023 11:52:56 +0800 (CST)
From: zhangfei <zhang_fei_0403@163.com>
To: ajones@ventanamicro.com
Cc: aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	zhang_fei_0403@163.com,
	zhangfei@nj.iscas.ac.cn
Subject: [PATCH 2/2] riscv: Optimize memset
Date: Wed, 10 May 2023 11:52:42 +0800
Message-Id: <20230510035243.8586-3-zhang_fei_0403@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510035243.8586-1-zhang_fei_0403@163.com>
References: <20230509-b0dc346928ddc8d2b5690f67@orel>
 <20230510035243.8586-1-zhang_fei_0403@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wBHlVQOFVtk+zPWBQ--.60792S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GryxZw13AFWrKrWxtrW8JFb_yoWkAFc_Gr
	WxCa97JFyDJFZ3Xa9rtw13Kry8uFZ8KrykG3WDtw1UG3WFkwnxtrWYqry5AF18XwsrGay3
	G3ZrJr4rXr1UGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUWlkPUUUUU==
X-Originating-IP: [180.111.102.183]
X-CM-SenderInfo: x2kd0w5bihxsiquqjqqrwthudrp/xtbCfAlrl2DcJd-5aAAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_205304_247762_9A2AEA7E 
X-CRM114-Status: UNSURE (   6.33  )
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
It allows storage instructions to be executed in parallel and reduces the number of jumps.

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
