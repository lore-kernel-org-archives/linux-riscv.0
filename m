Return-Path: <SRS0=b61k=IA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F42C433E6
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 06:37:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 933C36148E
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 06:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 933C36148E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DaoMIq3E+mDs7MajyVTrLRvmvOCLHa4mpw7tLJQZdsQ=; b=RWOdRuJuTnfCBDl1i2/p/g1Pw5
	UxoqxPqsQ/lfJOW5IXQ18OBd16LDkfdqcOn7XW2ESJWRjNUB9eh3PXjNmo1S+/RxRTzsj9cUA8OcZ
	qCIqh8y+Kt+lMs1njrOyzBPLlW2zMWJmIAiVzq7b1N7I4NKl5cN1Wcl31OiJqoaEv3kv6E78vwnnU
	OI/sh6wt4s/JAswpm2gHTTlYpk4dRJ+T9sJOJGqIGe6A/8Ljw6+tZJ2Sf/Ztzg23xjAmXbbXgWjLF
	9lr7f5cFQwsKr148jSwr9ft4dfOSyY3htxRiBCsNwps0h70S8u1+nYOnnWGKmYHO3zTVEVjCLFaR5
	tSilEgyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGyea-0001Vr-9O; Tue, 02 Mar 2021 06:37:08 +0000
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGyeX-0001Uz-8i
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 06:37:06 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0UQ3dCZ5_1614667009; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UQ3dCZ5_1614667009) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 02 Mar 2021 14:36:53 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: ryabinin.a.a@gmail.com
Subject: [PATCH] riscv: kasan: remove unneeded semicolon
Date: Tue,  2 Mar 2021 14:36:48 +0800
Message-Id: <1614667008-22640-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_013705_558257_5B5735B7 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, glider@google.com, linux-riscv@lists.infradead.org,
 dvyukov@google.com, andreyknvl@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix the following coccicheck warnings:

./arch/riscv/mm/kasan_init.c:217:2-3: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/riscv/mm/kasan_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 3fc18f4..e202cdb 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -214,7 +214,7 @@ void __init kasan_init(void)
 			break;
 
 		kasan_populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
-	};
+	}
 
 	for (i = 0; i < PTRS_PER_PTE; i++)
 		set_pte(&kasan_early_shadow_pte[i],
-- 
1.8.3.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
