Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB326C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 10:02:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D97C61026
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 10:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D97C61026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MZVf/lHzfkcT8yXAaKcZWmj5O0xjt5bX9sCT7mLL6SE=; b=Owno9X/YaoiXXg
	Y4oWK7Xx/8iBVL/lYb0DjOqhfvGKnwSJiWh1+8m57/dyaMKnuju3RtmJ4qrE+jl5rH1EvTfvq0gM0
	mPSIqEWH/WcJvoAHcOx6Vcdl+//sstBeS52KcL5is6ineb01UOzVzmzbOO0JNsqwT/OsIN63fnYbU
	3eOSYUezZ14cclwQs1E07LoyQlwyxbFEg3R1rPsh9p2waKaZ/UasD2zQjtEiWGz5ajV091gLUWknp
	OTd6vEnx3uwAIbBNfy94GWiWpx+Xk2FViQ/P3pv5HarJkov1y9w5rZmKHicvmKomLWvfdl5aky/Zw
	e3P+bPiXEx0jUEukskyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbh1b-003FOb-9F; Wed, 28 Apr 2021 10:02:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbh1Y-003FOU-18
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 10:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=FhjFqrmX6Z4m5rwG+KnoiIC7rL99vsd++HssJueXv/I=; b=Yesi4G9x0KeYrrPetLurKDLgE8
 enoJOwfdDQX+5tfDKEzPeOzqEclbHwT0w6hIGvONmktTtG/zkSEMfYmY/BXdlDxJZgwdypNup6J2a
 tZGXMzLV2nUjCZq2o4/J0F/BWEkvLlIlScjPSx5ohRmxpOFBVLRiu/UH/WVB9f4kL3JSsip7Y29gN
 nGqWpLUIKTmHt1iZere4OZprPECyRABJy3gdJ5fmRHm12rE2Ow8CgoSQYl3FVyOYbZBrwSsBqVs6c
 yk+8NR4/ZTXXyrxWOPHKyItW0e7L866G4IB+Daori27dLt4zYIPi2/PfJn8sXzWvHb8RX9n/a/Lnw
 XiBchlHg==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbh1V-00HLAL-7X
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 10:02:26 +0000
Received: from debian.home (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 07E77240008;
 Wed, 28 Apr 2021 10:02:20 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Fix 32b kernel build with CONFIG_DEBUG_VIRTUAL=y
Date: Wed, 28 Apr 2021 06:02:17 -0400
Message-Id: <20210428100217.15964-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_030225_430146_B5E1D11D 
X-CRM114-Status: UNSURE (   9.26  )
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

Declare kernel_virt_addr for 32b kernel since it is used in
__phys_addr_symbol defined when CONFIG_DEBUG_VIRTUAL is set.

Fixes: 2bfc6cd81bd17 ("riscv: Move kernel mapping outside of linear
mapping")
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index e280ba60cb34..6a7761c86ec2 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -106,9 +106,9 @@ extern unsigned long pfn_base;
 #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
 #endif /* CONFIG_MMU */
 
-#ifdef CONFIG_64BIT
 extern unsigned long kernel_virt_addr;
 
+#ifdef CONFIG_64BIT
 #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + va_pa_offset))
 #ifdef CONFIG_XIP_KERNEL
 #define kernel_mapping_pa_to_va(y)	({						\
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
