Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CCFC4450A
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 03:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HbQI7MnthjmMl3F12P+Vs7zThQ03LThwAagaRMR1fBI=; b=TfJsaeitWh83i3
	yNvbJvpdM4jTyfdBf8M5zbXEO5H+8471K8IxUJ9KcM/aDrhumcf68To0Ko1d/+RKPa/PbxB5kYmnE
	c6Ea0m1eyqq1rcWtaJHu7azBFXd8OSc9xVxhOiRKSH6iLmc16TH7Gc557/Th6n1aPIhCBrjufV/qr
	zy7JZQFlAcxE4IVIlatZA4SGVr8C6Wkt5MLm1aHtMlgCj7Kl5yGjfCY8B0V9A9wcIJn7zJ7Clu+Py
	h7RJD/eixoc2ulTV5bUo1uxJTfD9JXvNcCk6Orv2xSVkvOdrwvwxVe3Xem9HN0cDbvwTvDAoOm6Wd
	Iv+3BhClyVVn/L14SbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjpzz-0000000Df3z-2h3d;
	Wed, 15 Jul 2026 03:09:27 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjpzv-0000000Df3K-3bpr;
	Wed, 15 Jul 2026 03:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=W1
	Yja4BcpkoEw5xyKbA+I2eOZwzX/z8TKRA8nCYLALs=; b=XsGo+DI/aqqyBjXE2V
	p4JGxAuPtYDmdot5HgXUKaZKBDIXc9zk2zuRFOAZ7Fz/9zwP1OAQIRkbfyRymvBv
	p2e4FUcRHTKhRz4mgPnULemelgsJifZTaNwmWm4cJco2SRC1+J5DjdeYFikaC4Yx
	4vjppZWtjshowhHcSWGArjSQ8=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCHAr6n+VZqFyOrJw--.59083S2;
	Wed, 15 Jul 2026 11:08:23 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] KVM: riscv: Fix Spectre-v1 in vector register access
Date: Wed, 15 Jul 2026 11:08:18 +0800
Message-Id: <20260715030818.75657-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wCHAr6n+VZqFyOrJw--.59083S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww43ZFWDWFW3tw48Kw1DAwb_yoW8Ar1kpF
	sFkrs5Xrs5X3WfCay3CFZFv3yUu3s3Ka1rArW29a1DAryfKFyvqanY9ryDWF15JrWrZr1a
	9a4UZFy5Can8A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URuWJUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC9AfXg2pW+afAfAAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_200924_617886_3FE844B4 
X-CRM114-Status: GOOD (  10.46  )
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

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

User-controlled register indices from the ONE_REG ioctl are used to
index into the vector register buffer (v0..v31). Sanitize the calculated
offset with array_index_nospec() to prevent speculative out-of-bounds
access.

Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/kvm/vcpu_vector.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 62d2fb77bb9b..3708616e2c32 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
+#include <linux/nospec.h>
 #include <linux/uaccess.h>
 #include <asm/cpufeature.h>
 #include <asm/kvm_isa.h>
@@ -129,11 +130,20 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 			return -ENOENT;
 		}
 	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
+		unsigned long reg_offset;
+
 		if (reg_size != vlenb)
 			return -EINVAL;
 		WARN_ON(!cntx->vector.datap);
-		*reg_addr = cntx->vector.datap +
-			    (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
+		/*
+		 * The reg_num is derived from the userspace-provided ONE_REG
+		 * id. Sanitize it with array_index_nospec() to prevent
+		 * speculative out-of-bounds access to the vector register
+		 * buffer (32 vector registers: v0..v31).
+		 */
+		reg_offset = array_index_nospec(
+				reg_num - KVM_REG_RISCV_VECTOR_REG(0), 32);
+		*reg_addr = cntx->vector.datap + reg_offset * vlenb;
 	} else {
 		return -ENOENT;
 	}
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
