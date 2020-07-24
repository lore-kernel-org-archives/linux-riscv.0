Return-Path: <SRS0=jwAp=BD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECC1C433F4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 08:56:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38F0C2070B
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 08:56:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XuILdsYX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38F0C2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2vdX9USKOvG7BynZCkDtrsuqZLMgWkfbTqvVu7hgvgA=; b=XuILdsYXfG/tlAo4hM/Y5l6Em
	kSF6PtCKwZ2FSuFdHGyuJNH/0lxrzZLLnblngldD0EOQADbqhxsAOHvr70lgyfoyB+nsQPxxRaz9q
	Ru1jaxSIeM1ainqWpmON4SjZqSm+qSipOlFYEHa/sZbsf9KibAD/4nvfOodcfm8lEbCQbQnLCRz8P
	G7Q6Hff+Gx7yiMsa9QJTjexFvditYkRt6JaosA3W0x/LOCD6e7GyuHbO4d7ifzrKhw2lVz40riIwE
	wV6G6zAEMc9/H6+x8FpFqBaxr05sZbI7vo/t8UxTTKXbSt3MzCz7PT3OvfDiI6LVWletw2vp/BRk1
	EUaCLYmEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jytUa-0003qi-50; Fri, 24 Jul 2020 08:55:48 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jytUW-0003nB-6k; Fri, 24 Jul 2020 08:55:46 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E57FCE0BEBBE4295DAF2;
 Fri, 24 Jul 2020 16:55:38 +0800 (CST)
Received: from huawei.com (10.174.187.31) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 24 Jul 2020
 16:55:29 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <pbonzini@redhat.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>
Subject: [RFC 2/2] RISC-V: KVM: read\write kernel mmio device support
Date: Fri, 24 Jul 2020 16:54:41 +0800
Message-ID: <20200724085441.1514-3-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200724085441.1514-1-jiangyifei@huawei.com>
References: <20200724085441.1514-1-jiangyifei@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.187.31]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_045544_629814_CD7FFF0A 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: victor.zhangxiaofeng@huawei.com, zhang.zhanghailiang@huawei.com,
 kvm@vger.kernel.org, anup.patel@wdc.com, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com, Yifei Jiang <jiangyifei@huawei.com>,
 kvm-riscv@lists.infradead.org, limingwang@huawei.com,
 linux-riscv@lists.infradead.org, wu.wubin@huawei.com, dengkai1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
---
 arch/riscv/kvm/vcpu_exit.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index e97ba96cb0ae..448f11179fa8 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -191,6 +191,8 @@ static int virtual_inst_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 static int emulate_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			unsigned long fault_addr, unsigned long htinst)
 {
+	int ret;
+	u8 data_buf[8];
 	unsigned long insn;
 	int shift = 0, len = 0;
 	struct kvm_cpu_trap utrap = { 0 };
@@ -272,19 +274,32 @@ static int emulate_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	vcpu->arch.mmio_decode.len = len;
 	vcpu->arch.mmio_decode.return_handled = 0;
 
-	/* Exit to userspace for MMIO emulation */
-	vcpu->stat.mmio_exit_user++;
-	run->exit_reason = KVM_EXIT_MMIO;
+	ret = kvm_io_bus_read(vcpu, KVM_MMIO_BUS, fault_addr, len,
+						  data_buf);
+
 	run->mmio.is_write = false;
 	run->mmio.phys_addr = fault_addr;
 	run->mmio.len = len;
 
+	if (!ret) {
+		/* We handled the access successfully in the kernel. */
+		memcpy(run->mmio.data, data_buf, len);
+		vcpu->stat.mmio_exit_kernel++;
+		kvm_riscv_vcpu_mmio_return(vcpu, run);
+		return 1;
+	}
+
+	/* Exit to userspace for MMIO emulation */
+	vcpu->stat.mmio_exit_user++;
+	run->exit_reason = KVM_EXIT_MMIO;
+
 	return 0;
 }
 
 static int emulate_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			 unsigned long fault_addr, unsigned long htinst)
 {
+	int ret;
 	u8 data8;
 	u16 data16;
 	u32 data32;
@@ -378,13 +393,24 @@ static int emulate_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		return -ENOTSUPP;
 	};
 
-	/* Exit to userspace for MMIO emulation */
-	vcpu->stat.mmio_exit_user++;
-	run->exit_reason = KVM_EXIT_MMIO;
+	ret = kvm_io_bus_write(vcpu, KVM_MMIO_BUS, fault_addr, len,
+						   run->mmio.data);
+
 	run->mmio.is_write = true;
 	run->mmio.phys_addr = fault_addr;
 	run->mmio.len = len;
 
+	if (!ret) {
+		/* We handled the access successfully in the kernel. */
+		vcpu->stat.mmio_exit_kernel++;
+		kvm_riscv_vcpu_mmio_return(vcpu, run);
+		return 1;
+	}
+
+	/* Exit to userspace for MMIO emulation */
+	vcpu->stat.mmio_exit_user++;
+	run->exit_reason = KVM_EXIT_MMIO;
+
 	return 0;
 }
 
-- 
2.19.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
