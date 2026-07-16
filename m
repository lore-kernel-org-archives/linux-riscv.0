Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A757C44501
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 06:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r6hjpsHcWAIDNG9I+m6xqDBkuE7oW2BYY94QN0Pj+Co=; b=016GjX9uVCzHxD
	1Tm3Lrf2l5lEwzx+VOTvtJPEHDiv0nw0dBSI62XsazJ7OvmQ/5omaBNOap41qMp+W3J7k5n/AkGV2
	TvyjRVdToJMV33UOXkWW1nwiw0Hxi1TeQTl88f1q2YdBC4b78wU4q/iaq/D8DRyEOs38amNCF73Iu
	emj/gY5dqDdmHAxzTeVNEPDi9LkazRNNfbxc1ykEPWXRWpbmg0LEwYPhqpo/eDkrYCkR2Y3tyChUI
	UrYUPxjS2H3XW4qEQ3hCwM41oyx/Qe4H5ah/v0dzPEeHNdoxI3uibwoClB9CpE+4+pPVrvZ7gETcl
	BFnmAUWULQ/LCAj9o4IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFmW-0000000GYO6-0SAk;
	Thu, 16 Jul 2026 06:41:16 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFmT-0000000GYNK-2jEa
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 06:41:14 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so2842328a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 23:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784184072; x=1784788872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8J2PB70MWAXXQG95F609SxeXRC3aZLcryE0e4szEh2g=;
        b=IAgshyo49FYaU59XoV3zgs0EBYtWcwhgQcndT92zxNjfKX5drkGYhKe24VDfAaaI5B
         WVKfTNjnb4vkAKfDU5mUx/WQ2t/+MSbhmWv+60TL6Q5oCmD1ycuGoE4QacYy9+J15TuC
         /d5WIBri2XhSNk5nFZhPYLXmPcCAF9sdpq0SIw0ATEVVPHkADXK7mH4MhBYsAF0pQYCF
         z8BiOodNJ4AG/cPsHRToayW3+JkPKzzF8TwtlEt3B6rXnwvX9SDZ8NU+4/5GX1ey7MXa
         wj+sue7bUX6eVhDA0puz0zdvsVUcFJHmSc1f0HNneYWudl2DaYYAbx4s6aEN//jcj5L4
         rojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784184072; x=1784788872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8J2PB70MWAXXQG95F609SxeXRC3aZLcryE0e4szEh2g=;
        b=qalCpczwK/4X+EZnnBr52QDIpGii8vDa/ldb2blE5uhB1SJ94zbUCUBfV3FL+AJfm1
         mUHQ4tkDGVTJS758VnsaX1jbuQ4iDpIZXZQsBvLXn5Hbm+BTBeOvOq7Sagdd28truro5
         FyUuxOnpJVtMtDkcY+s5Hpz1KkjFYE6wzC8ad7+xMivltdaeVaUVryCcWYVlBI2lD3/7
         FuVJLFozUE8Dzf0Z4rtXSNy6qNwcW70kBscBeiKRWNijbp8ETBUxkGfXvofPQee0N9XG
         QYLv0+wbOnTswgsJ1GCP01Sp6cvQ7sCHbwaD0z4gfqfOEePCuw8ymZBiLZzSA9xr8IWT
         6zzw==
X-Forwarded-Encrypted: i=1; AHgh+RoH/aRlV47vCULJEAi+/tlFfHq4uhDOYNOfpJV+jXsDyMh4CbrmdyKRG6n0fo8ujXh6NIonxiPd9qlX9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuA1Sd0T1qMr5ME4UGo2gXV4kdd5j53ikA25eVdv/LED29CZk5
	2t8NlwDEBHux3X+Suo9aIYAOzxvcOUYLwpplh1++p/IqFqBy+AxHM8wH
X-Gm-Gg: AfdE7cmfqbrOfW1oLXuM31uA5CucMbizYWOqvYa+aoeYmihoq/V1gKespaJ1g1YkoQj
	h9+8qO+11F4ZFIO3q+xD6Y3WbrJmporJK/1xOttvbCQPjKP96zha/FKIfzAlbVlMYsvuGBYzXR+
	aaggCJeH4jC2wdxghWDNplJ3ruygX5nsXOSV6yyB7fKSLLAJbu7mQMFBJSFh/mOg2cVGEbkGg/D
	zPJ/lSeVM1uyN/ae5OgncsQNbipnR03Qb0K3hiBgFXfs57V9l/xTu+QXKEkYtLVTQpueG2AVNCv
	twteRBw9PaVfeZ6eeTZKu+93jKddysfHsGYnzPxbGl8wJwhaW6F+VvE3HS/TpFuK3EbuZ7qMNrJ
	ed6chxaRGxNAf1WddiOZHbwrIclOY3+5KbbLr57sEer8QlgxyblNaOCArtl6REwqgO+h3+b/rLA
	RbRi5EZY1smtfin2cg2/4d
X-Received: by 2002:a05:6a21:495:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c1109f44ebmr22579230637.64.1784184072215;
        Wed, 15 Jul 2026 23:41:12 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eb856dsm1412425a12.6.2026.07.15.23.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 23:41:11 -0700 (PDT)
From: yhchen312@gmail.com
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	"Yuhang.chen" <yhchen312@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH] RISC-V: KVM: Use raw_spinlock for VMID update critical section
Date: Thu, 16 Jul 2026 14:40:11 +0800
Message-Id: <20260716064011.2387501-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_234113_698828_D565DCED 
X-CRM114-Status: GOOD (  10.89  )
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

From: "Yuhang.chen" <yhchen312@gmail.com>

The VMID update critical section performs an IPI broadcast via
on_each_cpu_mask() on VMID version rollover, which must not be preempted
under PREEMPT_RT. Convert vmid_lock to raw_spinlock_t and use plain
raw_spin_lock()/raw_spin_unlock() (interrupts stay enabled, since
on_each_cpu_mask() requires it).

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.chen <yhchen312@gmail.com>
---
 arch/riscv/kvm/vmid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index c15bdb1dd8be..21c2b276b55d 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -21,7 +21,7 @@
 static unsigned long vmid_version = 1;
 static unsigned long vmid_next;
 static unsigned long vmid_bits __ro_after_init;
-static DEFINE_SPINLOCK(vmid_lock);
+static DEFINE_RAW_SPINLOCK(vmid_lock);
 
 void __init kvm_riscv_gstage_vmid_detect(void)
 {
@@ -78,14 +78,14 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 	if (!kvm_riscv_gstage_vmid_ver_changed(vmid))
 		return;
 
-	spin_lock(&vmid_lock);
+	raw_spin_lock(&vmid_lock);
 
 	/*
 	 * We need to re-check the vmid_version here to ensure that if
 	 * another vcpu already allocated a valid vmid for this vm.
 	 */
 	if (!kvm_riscv_gstage_vmid_ver_changed(vmid)) {
-		spin_unlock(&vmid_lock);
+		raw_spin_unlock(&vmid_lock);
 		return;
 	}
 
@@ -117,7 +117,7 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 
 	WRITE_ONCE(vmid->vmid_version, READ_ONCE(vmid_version));
 
-	spin_unlock(&vmid_lock);
+	raw_spin_unlock(&vmid_lock);
 
 	/* Request G-stage page table update for all VCPUs */
 	kvm_for_each_vcpu(i, v, vcpu->kvm)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
