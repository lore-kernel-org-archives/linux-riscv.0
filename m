Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F25C25B08
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 06:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNqvFXXiOZbQLTGzOTZUtweliyZZPVmK99M2dhTl/eQ=; b=a5q4QXdwUBuLhM
	oZw/bc5GuopYXDWyAICH26EhlX0OVEE9IvV+FQ1SRrdbxJaV0Ebd5gjpX1f1vyPeSr27jfw6v3j7t
	P1XUogXf8FLTZ0onzwnfLOhz0tJb4/mqUXPpuvQ7wzGxBPJkfX/548GqM6SoDQ53LuXx3ZNwt71fJ
	0VZvsQQWctJUyWj/gUBDTrVEQZCv3hNTv1F8kAMf8+6mWoe7kSk+6t25OOGCbK4uqlLjODPjxVCje
	+SQRwp30cgDvpMUeJbM1Io0zSdVVd0jEvmPRQcrXaTLtif+Qm61ZyQ51TEb1MpKoHng6OvPF4aDoU
	BiZ6KMgezSRg6gR99y/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPIP8-003upV-1w; Sat, 20 Aug 2022 06:56:22 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPIP6-003uWP-18
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 06:56:21 +0000
Received: by mail-oi1-x22b.google.com with SMTP id j5so6977440oih.6
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 23:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=paOW2t9hSvLN0qsX4domrqdnSMll+/S/rhUQM1pkWRg=;
        b=NtxPW9Wr4McSKA91GxGeGJjkDktm/3QZ21ZNmP6uUQWklp9s9rzEpNYYZdruz79fDb
         am2bA0uDb2zVe4SXlgweKT3NlDH2dL4zgQV3KJtOdZRtoTnjusouB4y1TJTmrPqyfr/n
         y8VI4e5/HkOQHzrH0xqC8bvIyX12XlWJTXxPjVAAtEuLZTeLTfrpPfT1qGgl1Wi+J/FN
         k2vTJPJ4Va4f6PJAQKY4afDh0uJX7WEz0TG50Vfc/OiT0+owjwFKzCJKSPMacJ36UVIf
         RQ4t85x9+WBAI7mKoakonnRudaR41Mn/TplPY1y5Oo/h9v4MMowWruWTam/0zgKiHZeg
         JPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=paOW2t9hSvLN0qsX4domrqdnSMll+/S/rhUQM1pkWRg=;
        b=0rE0hkEKinvvEVqXe1LkiiXIaq5DDBW45ppl16FovM0R5hSbYjujb4c4VV853Gjk2o
         zoOMQ10cUKArroEmOj8NNWQtP1ZCoqW0al8I3TotN1HjE84hwKuo/Hk7dVfNuPk6ZRJ3
         HVkplpeA3dfxhQuQf5+g/lZWPM4LGGU0fbuiFSEIAA74QaeXDbbKK1fDrDTco5TBrebd
         ydm3MyotQbk+3i6uzGXyr/5+dj/uSBaZRRkwGVL7ixuJRi8dfr+sfPBOWbaFf+XXkUrB
         L+lpmLq7UUx6/j/2ioGtroipjfLsqp1dYpNW00Md+tq8DgOxVnbbpDr1qB/TBy2CzQEa
         OMXg==
X-Gm-Message-State: ACgBeo3B9i8zwDCtW9sCH3I3fpMqet2a3wZngtEJJwtar2hsmnl9JPo0
	uX0GgmQWVhrcZ6HSdvSi3Pu7bw==
X-Google-Smtp-Source: AA6agR6BCjsRj4KUVIIQs529gebqU/BqYdrbuHNDhsVIu5M8bp3JavBtD3Oq1UpccIIPAljlUqI1kA==
X-Received: by 2002:a05:6808:10d5:b0:342:f7d9:e8a8 with SMTP id s21-20020a05680810d500b00342f7d9e8a8mr7337081ois.164.1660978579661;
        Fri, 19 Aug 2022 23:56:19 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.68])
        by smtp.gmail.com with ESMTPSA id h26-20020a9d641a000000b00636faf5e2d9sm1661098otl.39.2022.08.19.23.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 23:56:18 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v8 7/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Sat, 20 Aug 2022 12:24:46 +0530
Message-Id: <20220820065446.389788-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220820065446.389788-1-apatel@ventanamicro.com>
References: <20220820065446.389788-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_235620_133291_C5CC65C4 
X-CRM114-Status: GOOD (  10.71  )
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

If we have specialized interrupt controller (such as AIA IMSIC) which
allows supervisor mode to directly inject IPIs without any assistance
from M-mode or HS-mode then using such specialized interrupt controller,
we can do remote icache flushe directly from supervisor mode instead of
using the SBI RFENCE calls.

This patch extends remote icache flush functions to use supervisor mode
IPIs whenever direct supervisor mode IPIs.are supported by interrupt
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..7c7e44aaf791 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -18,7 +18,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -66,7 +66,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
+		   !riscv_use_ipi_for_rfence()) {
 		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
