Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4973C25B78
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 02:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1TSFhTFqIdcZ5U3zzGciolN0BPDTMB1W8z79lay502M=; b=eW7vX7RFJnfD7m
	KuXuffemiHm0CzDycBhsD5APKZv2zU99ikNW7HhWb6TrjhqVurRSCaIvhGyV7H+BucArItXDFZo8p
	hl2XykVwSUOb8/gNfOahqYo6iD/yExV+G+pY4XrVjQT6G4/wC/dv5eNgHgbIR+TSXid4AKk92WU00
	zqTwssHCZhpPnJPutY16JYQlOBI6ZMEO4l4QQxe7sU3TWBnz0lzo+RRyKJWGBv+OYJlv76ETApX0z
	nmTkCtpM7o3/u9GiRtTojt+q+NPEq9NyAR7Y0YkGTWvvTUNQi6iI54Mw1G74ktlR+Fh1sRk1UCsi5
	1JNf4Amc66Zq5KWjQ4Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9xxy-00000004k3t-0x82;
	Thu, 23 May 2024 02:14:02 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9xxr-00000004k2C-2qQv;
	Thu, 23 May 2024 02:13:58 +0000
Received: from localhost.localdomain (unknown [121.237.92.18])
	by APP-05 (Coremail) with SMTP id zQCowAA3PeVQpk5msp_mDA--.32642S2;
	Thu, 23 May 2024 10:13:37 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	atishp@atishpatra.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH] RISC-V: KVM: Fix incorrect reg_subtype labels in kvm_riscv_vcpu_set_reg_isa_ext function
Date: Thu, 23 May 2024 10:13:34 +0800
Message-Id: <ff1c6771a67d660db94372ac9aaa40f51e5e0090.1716429371.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3PeVQpk5msp_mDA--.32642S2
X-Coremail-Antispam: 1UD129KBjvJXoW7try8WrykGryrtr15CrWkCrg_yoW8GF48pr
	4DCrsYyrs5CFZ7Ca97ZrZ5Wr4Y9rs0gws5C3yI93yrJr45trWrXF1rtay7WF98GFyxXrWS
	9FW8tF1FvF4Yva7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU9Z2fUUUUU
	=
X-Originating-IP: [121.237.92.18]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBg0GBmZOWhzPuQABsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_191356_136944_B9BC1697 
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

In the function kvm_riscv_vcpu_set_reg_isa_ext, the original code
used incorrect reg_subtype labels KVM_REG_RISCV_SBI_MULTI_EN/DIS.
These have been corrected to KVM_REG_RISCV_ISA_MULTI_EN/DIS respectively.
Although they are numerically equivalent, the actual processing
will not result in errors, but it may lead to ambiguous code semantics.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/kvm/vcpu_onereg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index c676275ea0a0..62874fbca29f 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -724,9 +724,9 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
 	switch (reg_subtype) {
 	case KVM_REG_RISCV_ISA_SINGLE:
 		return riscv_vcpu_set_isa_ext_single(vcpu, reg_num, reg_val);
-	case KVM_REG_RISCV_SBI_MULTI_EN:
+	case KVM_REG_RISCV_ISA_MULTI_EN:
 		return riscv_vcpu_set_isa_ext_multi(vcpu, reg_num, reg_val, true);
-	case KVM_REG_RISCV_SBI_MULTI_DIS:
+	case KVM_REG_RISCV_ISA_MULTI_DIS:
 		return riscv_vcpu_set_isa_ext_multi(vcpu, reg_num, reg_val, false);
 	default:
 		return -ENOENT;

base-commit: 29c73fc794c83505066ee6db893b2a83ac5fac63
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
