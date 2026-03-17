Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33543FD8740
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 11:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gtn7Hmumlo16PTA4cvif+H32cbmftp9fxUILzauS3fc=; b=VYFjMv7foTWPD5
	ZIG3rTc1GOd0bLxjbyykpSq+tKD6jaa8aPLgEkUwu2ZorsslxypYZfK160UCgr/wvuS/tmxkPlmti
	fmJN2Ie/mYGb4oxuSmGfJjerutpDyaFhv9Ih2kD2YaVBl2vcyHoUX1//6DIn1W7wDgJ5bQVKz3xe6
	Ux0BA282tR1qHjV8VvBJUIcwK0BXNGwHplC0fO3Y8wa2WSMRXyrKnKsjAwiX1Nwrqm6xt6iMaVpBY
	f3x4NrSqz3UjY0XH8XhO4bJppf+kQ6q5SEZX5wQz8HW8aC6pbUMZUM1XmoRYNwD9qN/G14jYicVvA
	XMdjhQxC/2y8S5OPYGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Seh-0000000692E-3NUx;
	Tue, 17 Mar 2026 11:32:11 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2See-0000000690u-1x9N
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 11:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0N
	O6LHtWoKw6c5g0/JpGzsWNm0oOV76zhCk+domeHa4=; b=gO3ff97chxZrhkzoUZ
	Cw+0eN7cYQm3jrS5X17KspFaWqgonjyrQiuNyhrxG1n+GaK8af0vP75ZTZTAf4yv
	RCKO6Ulm617Jmr4dlEObCBZIABuP42izf9A/HPo68WEt/aP6qm+YfQMpXIm8o0Er
	F3tJEXE7w347k3FM3YWZh+vPM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCX2MB+O7lpgpQ0Rw--.24067S2;
	Tue, 17 Mar 2026 19:31:13 +0800 (CST)
From: "rom.wang" <r4o5m6e8o@163.com>
To: Anup Patel <anup@brainfault.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yufeng Wang <wangyufeng@kylinos.cn>
Subject: [PATCH] riscv: kvm: fix memory leak in vector context allocation
Date: Tue, 17 Mar 2026 19:31:08 +0800
Message-Id: <20260317113108.52177-1-r4o5m6e8o@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgCX2MB+O7lpgpQ0Rw--.24067S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtw1xur1UXr4fur4DZFyrZwb_yoWfKFb_C3
	WxJrWxW3y8ZF1xtas8K3Z5Gr9a9w4kKrW8Xr9avr1xXrWku3s3Cw4Igrn8Z3W3JrW3J3ZF
	kw1vvr4IywnxtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8nXo7UUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: 3uurkzkwhy0qqrwthudrp/xtbCzgG3LWm5O4GfYAAA3A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_043209_029002_5BFFA666 
X-CRM114-Status: UNSURE (   9.16  )
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

Fix a memory leak in kvm_riscv_vcpu_alloc_vector_context() where the
guest vector context allocation is not freed if the host vector context
allocation fails.

Signed-off-by: Yufeng Wang <wangyufeng@kylinos.cn>
---
 arch/riscv/kvm/vcpu_vector.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 05f3cc2d8e31..46fbf48f2503 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -80,8 +80,10 @@ int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
 		return -ENOMEM;
 
 	vcpu->arch.host_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
-	if (!vcpu->arch.host_context.vector.datap)
+	if (!vcpu->arch.host_context.vector.datap) {
+		kfree(vcpu->arch.guest_context.vector.datap);
 		return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
