Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CF4C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 11:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Date:To:From:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5wrE+JiaROu+kv1utix9bK7uKSKd60Dy+XNin5uc1hI=; b=ZWYlgyT8zBdxt4
	TTRkVl0e7gc7k+o1OTt4IukOm+xwvOUAg6MV8IwcQYq/7bzgZbdNX6fDalFviJtTAtgrGQNqdGomP
	VID7hhergfiv/q+zXVBt7pSJBbw3hafAnDYDeOivER8K5WkB4deNcjdJKV3g/y9DZuh9tJMh6wrdr
	4mnBZQl02FfSLRJcr6Sst+Nzq62c3+v3vuUaovQLwJsdPo5y8owE95bPBm0wZd2ksXYdpxSab0PVK
	Ss1UzHkq5/tc9QY6uFv9TybZgy7uYgdmHXx+fHFnO5CNml1W74OyabsYC9czGWF4/I9yXTqrfKb60
	hzeqLYDk3YB139GNvrNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQxf-00000005IO5-3qPP;
	Fri, 21 Feb 2025 11:12:51 +0000
Received: from va-2-15.ptr.blmpb.com ([209.127.231.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQYW-00000005ETN-1QTb
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 10:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1740134801;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=vHH1MiexyCpVMoStYJqjt/YqpBbbofWY30poFqJKr2w=;
 b=dDO50Faz4LNVssaZu9LoBhfIUHKix2gGvKa1mfTtYWxCfhXWmZvfqMOgrOBuDgpCOzxfPl
 OGEuq+ePtkiA8wDAj506bYcIX6Jo5RtEHNx46KlDTO2B3uIVJzA9daIduRHoFXUIRtUdKr
 I2TamSH/rFQmwQvxP79uHrxb/wvbdAbZzVCzriQDRk/2VjIJuAMupWr9GLwmJxHHeut9yF
 o1pDXbXWdH3ZM/ugNi5eNci2BXprvVstSxioqbRN5LJptRaguAvK6FFquahFPa+uASp2ci
 a5Q1x9khu1/zN5nuarrEHFvB8BVOFT5alXmXisNqlZGjY6d04Tt5yhuIO/WqBA==
Cc: <ajones@ventanamicro.com>, <xiangwencheng@lanxincomputing.com>, 
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<atishp@atishpatra.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<rkrcmar@ventanamicro.com>
Subject: [PATCH v2] riscv: KVM: Remove unnecessary vcpu kick
Received: from localhost.localdomain ([222.128.9.250]) by smtp.feishu.cn with ESMTP; Fri, 21 Feb 2025 18:46:39 +0800
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
X-Lms-Return-Path: <lba+267b85990+9cbe86+lists.infradead.org+xiangwencheng@lanxincomputing.com>
X-Mailer: git-send-email 2.46.2.windows.1
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
To: <anup@brainfault.org>
Date: Fri, 21 Feb 2025 18:45:38 +0800
Message-Id: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_024652_448755_66D09071 
X-CRM114-Status: UNSURE (   7.67  )
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

Remove the unnecessary kick to the vCPU after writing to the vs_file
of IMSIC in kvm_riscv_vcpu_aia_imsic_inject.

For vCPUs that are running, writing to the vs_file directly forwards
the interrupt as an MSI to them and does not need an extra kick.

For vCPUs that are descheduled after emulating WFI, KVM will enable
the guest external interrupt for that vCPU in
kvm_riscv_aia_wakeon_hgei. This means that writing to the vs_file
will cause a guest external interrupt, which will cause KVM to wake
up the vCPU in hgei_interrupt to handle the interrupt properly.

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
v2: Revise the commit message to ensure it meets the required 
    standards for acceptance

 arch/riscv/kvm/aia_imsic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index a8085cd8215e..29ef9c2133a9 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -974,7 +974,6 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 
 	if (imsic->vsfile_cpu >= 0) {
 		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
-		kvm_vcpu_kick(vcpu);
 	} else {
 		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
 		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
-- 
2.46.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
