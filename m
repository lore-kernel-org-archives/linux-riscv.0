Return-Path: <SRS0=FYRI=CF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A5DC433E3
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:24:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B45120738
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UxFvUxBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B45120738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PmG2KraGCIGLXVzB+zDrB4/rYXDm5sXgtaO1KAkxqvo=; b=UxFvUxBWfcfE46lm2BBQlgZOS
	c/YprWpqDSKJ7+VnZ/E0DFvo0UIbzYWBkAITGz5TybqUdNSFMEC4AweAtfy6qHyNuariOWHoiFoNc
	r5j4XTsxLSYhSjTRyazCwDRZCGB2qvh5QZRGUG5uCcKcbtzzS1mX/AcF7b3UG2x/RcXPmMelmUJPR
	ydj0YDDhuH87PSPQZv1I11v3JmnHv4HhWjREbT5IKMqk8JA3Ihd/5FATgwq37c2XJXD527NZLvxeI
	uMjDkk/3/zQAG3u7OVGP/De2jSg6LJMRPBRIwOOMQ0g/+9aE3Y/pfLnZFoEVgW65Moipest8XFv8v
	aMc6icNQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDCW-0001R9-67; Thu, 27 Aug 2020 08:24:04 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDCS-0001NG-Jy; Thu, 27 Aug 2020 08:24:02 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6322BE11D85A99240666;
 Thu, 27 Aug 2020 16:23:48 +0800 (CST)
Received: from huawei.com (10.174.187.31) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 16:23:42 +0800
From: Yifei Jiang <jiangyifei@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <anup.patel@wdc.com>, <alistair.francis@wdc.com>, <atish.patra@wdc.com>,
 <deepa.kernel@gmail.com>
Subject: [PATCH RFC 1/2] riscv/kvm: Fix use VSIP_VALID_MASK mask HIP register
Date: Thu, 27 Aug 2020 16:22:50 +0800
Message-ID: <20200827082251.1591-2-jiangyifei@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200827082251.1591-1-jiangyifei@huawei.com>
References: <20200827082251.1591-1-jiangyifei@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.187.31]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_042401_443064_E6CFE7F1 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: zhang.zhanghailiang@huawei.com, kvm@vger.kernel.org, yinyipeng1@huawei.com,
 victor.zhangxiaofeng@huawei.com, linux-kernel@vger.kernel.org,
 Yifei Jiang <jiangyifei@huawei.com>, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, wu.wubin@huawei.com, dengkai1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The correct sip/sie 0x222 could mask wrong 0x000 by VSIP_VALID_MASK,
This patch fix it.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 arch/riscv/kvm/vcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index adb0815951aa..2976666e921f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -419,8 +419,8 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip) ||
 	    reg_num == KVM_REG_RISCV_CSR_REG(sie)) {
-		reg_val = reg_val << VSIP_TO_HVIP_SHIFT;
 		reg_val = reg_val & VSIP_VALID_MASK;
+		reg_val = reg_val << VSIP_TO_HVIP_SHIFT;
 	}
 
 	((unsigned long *)csr)[reg_num] = reg_val;
-- 
2.19.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
