Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FABC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ysgmKz7NW7KfdsMi08e3DToJPY10FwUPG3Jf0OoTCw=; b=it69dqA1nELkYa
	8O31tkpzk7EgyNvbEksrDQAOpwJ191xgkcOiry6Ba/F6EhoocH4KM4odnjjnvuqyb8BZV9aq6yiOI
	M5++xnpPfP8Ovnz/UfkH548HHF5MCF2BBE99/NoXnaGZCx2klwufJhIDPdjR1Y+dHehaynLfuSwyK
	nAp68SEov1ckmJIPruHLS+nKR5YvK0JBDPuF4bWnaJjK/K1kapMLOzw4wPw6xdgqv1/4V5BUsDoua
	aYGpDB+JY/qCOrtLJ2/xApN2VY2DZnFUB5TQEgp0UcPKPZ2vW/eg3QfoiXbkyY5Y5p9tbQsrxAane
	mLSG9HBehQZtQPjnufvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01YV-009EDQ-N2; Tue, 29 Nov 2022 14:25:51 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01YB-009Dui-02
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:25:32 +0000
Received: by mail-pj1-x1029.google.com with SMTP id b11so12830313pjp.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=lpZEuc7klowGPJ/NMiV/VZEhANaP3uvyFfM1FKPBQxBVQRqFNVVVW0YLyIrotuIPwD
         TZbDgPaGoELOTncKZP0eKmfV0T1IMaYzoqN5sRIcbOfMTORA3sEJOqmxJd8bsPsqCqER
         H5BYlsYBKxLJ5MRjN7FQfDrPTaM6ajsC2EVOaMT26IAs0cHiehd5WAU8RteLjaA6oKYG
         Gk2VAsz2Gg+8s2NkpgPnkRvrkGS4CxLjxmkmz9ezTVbga4EA7SxzHtF1zUQRJex1uOTg
         BFx4PmZnVcwm6d8ELHcqS9eqrUVlVjp0PZHhZgHy24AYdpPcOtUWCi4LUxcNQ1nwUYoE
         Uphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=P17TcG/8YuMWMTkEhuNai5hW5+KinyCR3mka84GJNskloQU2dC5QhS/LLONxPMslgd
         187cpteWP7DsHnLf7v4Lcc0HpCS3kFs9hYYsluBnM16ucD5Jd5DWr8k78ZjcgK7MvZeV
         Fq7SlzZ6bQu+W7i3ysPzIKv83cGGDafPcdpfVpy3OA9FizRs7maL4JQ9r58klIsoyMih
         9JjiBIlO/FvwiBl0SWCTtdR3Uqww9nMvjEDCYNC/CdgCckvV2DWDvwrwlQc6dZvTYQ41
         4hAskNhkNHxGMXs7WPe23+VT9W8ULPgiByq++/BCoqO97AuF7cBn59eZ4bMdeKb+QXSa
         54Uw==
X-Gm-Message-State: ANoB5pnLswKHNUkxRx1FV++Owm+mBUCZAeUK/v6v4e6t81OeV/NwYaJO
	OgGS3g3faSYlKK8jPArFq9zTfQ==
X-Google-Smtp-Source: AA0mqf67J/4IsI5+V9s2LsFzINvQREYJvabQuwxJTZs8OfX+ZXBF/hE5DZYijVrXwsPv+J7MW/IODA==
X-Received: by 2002:a17:902:aa07:b0:186:a97d:6bcc with SMTP id be7-20020a170902aa0700b00186a97d6bccmr37868667plb.121.1669731927646;
        Tue, 29 Nov 2022 06:25:27 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.98])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b00176a2d23d1asm11039076plh.56.2022.11.29.06.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:25:27 -0800 (PST)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v13 7/7] RISC-V: Use IPIs for remote icache flush when possible
Date: Tue, 29 Nov 2022 19:54:49 +0530
Message-Id: <20221129142449.886518-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129142449.886518-1-apatel@ventanamicro.com>
References: <20221129142449.886518-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_062531_095465_E0029DB3 
X-CRM114-Status: GOOD (  10.97  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 57b40a350420..f10cb47eac3a 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -19,7 +19,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -67,7 +67,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
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
