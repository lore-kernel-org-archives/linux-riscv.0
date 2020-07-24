Return-Path: <SRS0=jwAp=BD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AC4C433EB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 08:56:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E27CB2070B
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 08:56:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WvXeaxeu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E27CB2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XXdwntHt31Vl4vJl5hvMkaxzhstJmRF+ZmiETRGeQIg=; b=WvXeaxeuGnqQnRkKcjz0TUJD6
	1VsrYYDnXRwQKVZ8wtJKEF+rjj19DVYMVIF7vhZkhmbVXj1GLSA1307BspSDTOGmU7i4qWCrTb5Fn
	vHQTEvp3l8foqjA/EFfjeikdHDrvan+Fv+sUlSBI3BkORDEG38UTa49qT9U0RTGnz918u5MUomzVU
	plBzwbGswwNIMGDsoNNRJjpuSD/sc3bSCY7efNB/zPSGBac1iVxmazcRVM/ZVM41JuEvJNs41mTwt
	oHZXNje+vwpvHs4bNJGFtlmWxwJrMUEeuGU+j/PtDb6/nmjuJqtUtswdh0tBNYUBsKoEJH/ZDbjhW
	iSV7kAnWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jytUc-0003s6-3j; Fri, 24 Jul 2020 08:55:50 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jytUW-0003nA-6k; Fri, 24 Jul 2020 08:55:47 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DDC697F4DEC214F115C6;
 Fri, 24 Jul 2020 16:55:38 +0800 (CST)
Received: from huawei.com (10.174.187.31) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Fri, 24 Jul 2020
 16:55:28 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <pbonzini@redhat.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>
Subject: [RFC 1/2] RISC-V: KVM: enable ioeventfd capability and compile for
 risc-v
Date: Fri, 24 Jul 2020 16:54:40 +0800
Message-ID: <20200724085441.1514-2-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200724085441.1514-1-jiangyifei@huawei.com>
References: <20200724085441.1514-1-jiangyifei@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.187.31]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_045544_652433_2212514E 
X-CRM114-Status: UNSURE (   6.50  )
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
 arch/riscv/kvm/Kconfig  | 2 ++
 arch/riscv/kvm/Makefile | 2 +-
 arch/riscv/kvm/vm.c     | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 2356dc52ebb3..95d85d893ab6 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -4,6 +4,7 @@
 #
 
 source "virt/kvm/Kconfig"
+source "drivers/vhost/Kconfig"
 
 menuconfig VIRTUALIZATION
 	bool "Virtualization"
@@ -26,6 +27,7 @@ config KVM
 	select KVM_MMIO
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
 	select SRCU
+	select HAVE_KVM_EVENTFD
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index b56dc1650d2c..3ad46fe44900 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -2,7 +2,7 @@
 # Makefile for RISC-V KVM support
 #
 
-common-objs-y = $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o)
+common-objs-y = $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o eventfd.o)
 
 ccflags-y := -Ivirt/kvm -Iarch/riscv/kvm
 
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 4f2498198cb5..473299e71f68 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -52,6 +52,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	int r;
 
 	switch (ext) {
+	case KVM_CAP_IOEVENTFD:
 	case KVM_CAP_DEVICE_CTRL:
 	case KVM_CAP_USER_MEMORY:
 	case KVM_CAP_SYNC_MMU:
-- 
2.19.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
