Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDC5C77B75
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=V+ul1X7PZjHrjW8V+2yB0QOIrlH9P61ZEzsN9eVsTkU=; b=zy6
	uOxKRAxtoUbCO1SFqoMp1pWePJpXUvpzmkLPN4TK+xQEVA6u5HkUFPZH0xM4BtXLKQKYfqCbeJU5q
	OBu8NuTrIu99fvsgY7yM+X3zHwx9EJTbQZrRGSuu0omn7ek+hl1+8RMaTvQ0NxxtPaYTbUZ5Mwdut
	wD8XCJFQNw9tkxWCyHDeKCa+rs2B5rBHDqGTuog2dDquTciMsfQ/61i0vhlX+gGpZTVvfwZSJZB31
	3HJTgfrXiJpHoxn2ucOhabhD7nq6maA6BKIOPUtLjxzRPoKtVnhsbrCKv9vJd19WMjud1PNTcSXHy
	lwcYMqDunZ9UgSSjRSXAMaz6GeT0y7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvDwD-00CxTE-19;
	Sat, 06 May 2023 09:10:45 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvDw9-00CxRX-1y;
	Sat, 06 May 2023 09:10:42 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4QD1x76cmcz4xyCV;
	Sat,  6 May 2023 17:10:35 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 3469ARoV041844;
	Sat, 6 May 2023 17:10:27 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Sat, 6 May 2023 17:10:30 +0800 (CST)
Date: Sat, 6 May 2023 17:10:30 +0800 (CST)
X-Zmail-TransId: 2afa64561986ffffffff80c-e80ee
X-Mailer: Zmail v1.0
Message-ID: <202305061710302032748@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <anup@brainfault.org>
Cc: <atishp@atishpatra.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBSSVNDLVY6IEtWTTogdXNlIGJpdG1hcF96ZXJvKCkgQVBJ?=
X-MAIL: mse-fl1.zte.com.cn 3469ARoV041844
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6456198B.001/4QD1x76cmcz4xyCV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_021041_820879_C263F75C 
X-CRM114-Status: UNSURE (   8.89  )
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

From: Ye Xingchen <ye.xingchen@zte.com.cn>

bitmap_zero() is faster than bitmap_clear(), so use bitmap_zero()
instead of bitmap_clear().

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 arch/riscv/kvm/tlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 0e5479600695..44bc324aeeb0 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -296,7 +296,7 @@ static void make_xfence_request(struct kvm *kvm,
 	unsigned int actual_req = req;
 	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);

-	bitmap_clear(vcpu_mask, 0, KVM_MAX_VCPUS);
+	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (hbase != -1UL) {
 			if (vcpu->vcpu_id < hbase)
-- 
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
