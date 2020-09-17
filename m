Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D00C43461
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 07:26:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFE3D2072E
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 07:26:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m9aY10Ma"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFE3D2072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JkHUJQ282F3PIgbtZSC3D1bL1Alrq+lSOvaN/MPHkz4=; b=m9aY10MaSaP+kZqEZji6FdH4YQ
	XRLgO92imCV/vKV9S5dz8IPNpAAxf1phmc6HDI4U6+FRwQmWNYPMF5O7/C5KIc0lxk2YDcHs4Kk0t
	tXDvVvHYmSJDi9QF4XHuGdyrshdgwhYyUgz58tBQzEgmw7PILfYHcjv6LrB0JbmggZnxQxKTMYYaq
	CqOG5MlaTrYga6txXkib1+cFIVBPW7UQ56uyFgICKNFtz7oOfoD+DWWTFPWc51TroZYYFeQa3fvv1
	cqJC31N/Up1UTTc3dlJ0ngN/rnuINjGCT4g9WiK3CrJvhGynp8wqp2HUlNica60Lf8CTUTAtwj99T
	Fa2zmsdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoJ4-0004ut-Si; Thu, 17 Sep 2020 07:26:14 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoJ1-0004re-DI
 for linux-riscv@lists.infradead.org; Thu, 17 Sep 2020 07:26:13 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2132557|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00687124-0.000952784-0.992176;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16378; MF=liush@allwinnertech.com; NM=1; PH=DS;
 RN=12; RT=12; SR=0; TI=SMTPD_---.IYFcKJ1_1600327552; 
Received: from localhost.localdomain(mailfrom:liush@allwinnertech.com
 fp:SMTPD_---.IYFcKJ1_1600327552)
 by smtp.aliyun-inc.com(10.147.41.199);
 Thu, 17 Sep 2020 15:25:59 +0800
From: liush <liush@allwinnertech.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, peterx@redhat.com, walken@google.com,
 daniel.m.jordan@oracle.com, vbabka@suse.cz, rppt@kernel.org
Subject: [PATCH] riscv: fix pfn_to_virt err in do_page_fault().
Date: Thu, 17 Sep 2020 15:25:49 +0800
Message-Id: <1600327549-3995-1-git-send-email-liush@allwinnertech.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_032611_727827_0685BA1E 
X-CRM114-Status: UNSURE (   8.32  )
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
Cc: liush <liush@allwinnertech.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The argument to pfn_to_virt() should be pfn not the value of CSR_SATP.

Signed-off-by: liush <liush@allwinnertech.com>
---
 arch/riscv/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 716d64e..9b4e088 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -212,7 +212,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		 * of a task switch.
 		 */
 		index = pgd_index(addr);
-		pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
+		pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP) & SATP_PPN) + index;
 		pgd_k = init_mm.pgd + index;
 
 		if (!pgd_present(*pgd_k))
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
