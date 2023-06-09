Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A97DC7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=neDsHFm+JQ/5m/weXyHSrynGvI/AllbM9pcZcrD2cUU=; b=tsFiutvxItTcYm
	Xy0WXh97ZrtFiAOFsB/3ZaSjRwFOr6CErFzbkwHNRjih6s0MiWBnHsDFMDtBR9Azbele1upIfaXHM
	aiWukjm3vUFqm+C3UWAYj9olkR4t6VOesTuSu/pJ/YjZGDKEv9pgGmBZatF3XMnh6hpbCWFQUYQQp
	1jWjnK1cuEGZsKaVE1QGWTd3CPEMZRtTEuE2GLZ7Sygmwj1GXY1uTHSvZG5gHVDmpjqJxYMSMlHMz
	xjTr2XfnzSIkkhlYFlczlPRlfLE9gtgQtnswnZiKFecxX8RLN4kKIv+JYVlL5NHIdcLUqSJVSXW6u
	Is0P7FHfRYZCGB9unsGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Wxt-00C851-1B;
	Fri, 09 Jun 2023 07:55:21 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Wxq-00C82J-17
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 07:55:19 +0000
X-QQ-mid: bizesmtp75t1686297188t6m0bx24
Received: from localhost.localdomain ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Jun 2023 15:53:05 +0800 (CST)
X-QQ-SSF: 01200000000000908000000A0000000
X-QQ-FEAT: UMQM+3VOEYsTPC6jMH0yzyXH1849klDsTAUlAptToZKS6J3/4lSimAAJC/4Gj
	WEUddFwIUU/2iF8bNZxbaQuHxqLUg5SxFyhEmhcPQC534imMFNhOcwHDyehWwvHQii490Zr
	cnCZorPfAhuqS4hv4C3m/udby3n0mIAvc5zXEG/oeEmxLYGywlgqwxeD0xRGvWfw77lbRKV
	Vu1L/Fe5f+BRDZPeTPFPWK33uLeuc9WQHaUcuJn8VUUGtDiWWO/JbsTAnVsRta3kqtiGwqe
	jA1gbcit/YVp+S79o12TSH6qmlBAnmXWtCrNSplYOBBWlUdNVfYES64zkcDROxPzNplA+zD
	d7eptdHA752wVCXgT2bSBhpDPTXeAiPDt448w1sOQRbijVWdOpLDcg/G0wjKQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18318848536038158331
From: Song Shuai <songshuaishuai@tinylab.org>
To: catalin.marinas@arm.com,
	will@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	songshuaishuai@tinylab.org,
	steven.price@arm.com,
	vincenzo.frascino@arm.com,
	leyfoon.tan@starfivetech.com,
	mason.huo@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com
Cc: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH V2 2/4] arm64: hibernate: remove WARN_ON in save_processor_state
Date: Fri,  9 Jun 2023 15:50:47 +0800
Message-Id: <20230609075049.2651723-3-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
References: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_005518_705291_A5F9BAD6 
X-CRM114-Status: UNSURE (   7.45  )
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

During hibernation or restoration, freeze_secondary_cpus
checks num_online_cpus via BUG_ON, and the subsequent
save_processor_state also does the checking with WARN_ON.

In the case of CONFIG_PM_SLEEP_SMP=n, freeze_secondary_cpus
is not defined, but the sole possible condition to disable
CONFIG_PM_SLEEP_SMP is !SMP where num_online_cpus is always 1.
We also don't have to check it in save_processor_state.

So remove the unnecessary checking in save_processor_state.

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/arm64/kernel/hibernate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 788597a6b6a2..02870beb271e 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -99,7 +99,6 @@ int pfn_is_nosave(unsigned long pfn)
 
 void notrace save_processor_state(void)
 {
-	WARN_ON(num_online_cpus() != 1);
 }
 
 void notrace restore_processor_state(void)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
