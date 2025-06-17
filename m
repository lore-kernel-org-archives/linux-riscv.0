Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE49C7115B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AL3i3vuvt3lCflfnMRVLv97tZ/OihxMsH0tgd893XZo=; b=G5gVk8lPWX7ncz
	0lwDaw07rB75/eX3HwwquWzMHPXZ/eqf6eEFXh7/sys+AZfMA8dwG2YHhjGBUAiWILiMV4jXngfAX
	6ivE0XL65ypNPI6QJcFO8jG0aTd8Ly9oihIdkFQsg102cTZdjcvmk/ID8PLpGvOzz2ImiWGA3wluX
	C78jxffl3VIpTYPDDT1LVhjvVeGvbSqzHPLQf/Ka5ViMxJzZTEXcqJ+jmmw4wykYsw1tbcllAlobc
	0aFHsJbpjc8tKAq1V40iN1rLqCJd20h0LhvrtPTtfCWoRK5cB85e9B+qKdMxZzr/zd2uumdVh1Ypw
	6tn/HQVP3fmeQl7AtQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWJN-00000007LRW-0sQZ;
	Tue, 17 Jun 2025 13:25:13 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWDX-00000007K2P-2IMs;
	Tue, 17 Jun 2025 13:19:12 +0000
Received: from zq-Legion-Y7000.. (unknown [180.110.114.155])
	by APP-05 (Coremail) with SMTP id zQCowADXXQxJa1FoFic9Bw--.11018S2;
	Tue, 17 Jun 2025 21:19:06 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH 1/5] RISC-V: KVM: Provide UAPI for Zicbop block size
Date: Tue, 17 Jun 2025 21:10:22 +0800
Message-Id: <553bacc4f66e815975bb8ee0e4696397407b0a82.1750164414.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1750164414.git.zhouquan@iscas.ac.cn>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXXQxJa1FoFic9Bw--.11018S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4UXr4DGF45WrW5GFW5trb_yoW8uF45pF
	sxCrs5ur48ur93W397Crykur4Yg34DGws8trWI93y5ZFy3trWrCrn5Kr9xZFWkXFW8ZFs2
	9F1rCryruFs8Jr7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbH5l5UUUUU==
X-Originating-IP: [180.110.114.155]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBg0QBmhRLE-QtgABsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_061911_952466_3A98567C 
X-CRM114-Status: UNSURE (   9.60  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

We're about to allow guests to use the Zicbop extension.
KVM userspace needs to know the cache block size in order to
properly advertise it to the guest. Provide a virtual config
register for userspace to get it with the GET_ONE_REG API, but
setting it cannot be supported, so disallow SET_ONE_REG.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu_onereg.c      | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 5f59fd226cc5..0863ca178066 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -55,6 +55,7 @@ struct kvm_riscv_config {
 	unsigned long mimpid;
 	unsigned long zicboz_block_size;
 	unsigned long satp_mode;
+	unsigned long zicbop_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 2e1b646f0d61..b08a22eaa7a7 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -256,6 +256,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 			return -ENOENT;
 		reg_val = riscv_cboz_block_size;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOP))
+			return -ENOENT;
+		reg_val = riscv_cbop_block_size;
+		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		reg_val = vcpu->arch.mvendorid;
 		break;
@@ -347,6 +352,12 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		if (reg_val != riscv_cboz_block_size)
 			return -EINVAL;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOP))
+			return -ENOENT;
+		if (reg_val != riscv_cbop_block_size)
+			return -EINVAL;
+		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		if (reg_val == vcpu->arch.mvendorid)
 			break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
