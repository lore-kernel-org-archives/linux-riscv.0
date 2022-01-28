Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F247C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 05:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AHa5d9FnZS/NS08lZcmylJckA6+/umy6crPdll/17w=; b=MnLqyEk1ZtAfza
	HTLXkJlqptTvBgagooZadddHjsoR62tEfi8ubUXHDIWS3Kf4uVxKG2jDuDWjeOspIVoAR2vrZ0OGz
	PLkTqIydiWkyF8pGmKWHPwN5RvoXoaSvO+dRDFHbqGGTr72PVqsbZNgLrLXd6wGUcFYMuQYYSu9fY
	Qt8OKnbMucuaKBcg+K0oOhnjtWOKMQrf9Aa/uTQ86M0/P8gz3GGOZnZC33tGW1q5Wfw5KUBe52kmR
	PRrYQjjy1h7UCT0olyl6pL2qB+PwAoSAPZTGuly7+Z7l/oX/OwzsdbcoR2kE5Yy3Fcs1SfLjhFmh1
	Rb93ZiHJhrXAPOr8jhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDJm9-000Rk5-An; Fri, 28 Jan 2022 05:26:21 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDJm6-000Rhp-6B
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 05:26:19 +0000
Received: by mail-pg1-x531.google.com with SMTP id g20so4251724pgn.10
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 21:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64Kf1jBnaPXE7HWaq/CWbgAlm0Fq5kx6l/oMdBTVwE8=;
 b=nPYUl33j0ee7Kq5gbqwe83BWemErmLc/3Kq+aDr+MRD5LbbPVMAzBY/NHW5wRgjVJI
 WulApXD8BzDsYVrTw+k5T96ICTVuoQnan3bNtcvoI6BB3WQaHwvWXXZ0Q6ZOX+/gkuiy
 Hg/qgQ2ehjY8Tukmd6Mh8kIQJpUHPIS2XGhfvU4jDLxtM1mQbZtncVaM0aCl0pg63may
 B4lbQ4S+h7PiQ0zviIVuhJ89N6uRHTvhnWqdaS6xCPEe8rUIJLacExjphyZGFutPKIE9
 Tcyj2FAgjHdyF61Xz+TxcgRcguT4xkRekO6N0alV51K5RQiVjXXWIhmQO+GQ4E/wP7ae
 w8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64Kf1jBnaPXE7HWaq/CWbgAlm0Fq5kx6l/oMdBTVwE8=;
 b=3j/+Zs8d3EEdwTm4KPbeMEB/rl+ZJMTHIPPxNCgsaX3AcoOabH2izOk6OpQ82WGLLu
 7In/7UkVnQZtFkxCzCL61fg4FJsfithjoxwchARVQhkfEBQpOzVmYM0Enk2Nkpg21uUz
 kZHr+LlCGiILa3xrvZCO3Okmgl2yzHqeZf8BODIYNamFZhzbB9szr+xr+J7ahNXDVMmr
 vszL82x3X8RyxGyBG7htqOmNUWHIYCX7at4is6Ctd1JUFomWQTIiMxlC/Bg9bQzK5ZP2
 +0AlViLaWOYDRunyjLdhyABO3Rk4hjtp6L/HhWxkblaA+0FsPXZogkFr/3sL5Snz2vI+
 diYw==
X-Gm-Message-State: AOAM530+7TduTs8noRU26HfPDJEBS3PK+gHHsgUP+QBj7BpjX9J19CFN
 fd0XdDIXnUVvn0rjEm0S5d33kQ==
X-Google-Smtp-Source: ABdhPJzYX/E/+1Ii5C7/P/RfG4Wu+dw2puTY0ls2sj7WmEvNYlOE5J6ASYDVweN8TpwIu3F89ogstw==
X-Received: by 2002:a05:6a00:1952:: with SMTP id
 s18mr6683685pfk.54.1643347577383; 
 Thu, 27 Jan 2022 21:26:17 -0800 (PST)
Received: from localhost.localdomain ([122.171.184.231])
 by smtp.gmail.com with ESMTPSA id b20sm7731744pfv.134.2022.01.27.21.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 21:26:16 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 6/6] RISC-V: Use IPIs for remote icache flush when possible
Date: Fri, 28 Jan 2022 10:55:05 +0530
Message-Id: <20220128052505.859518-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128052505.859518-1-apatel@ventanamicro.com>
References: <20220128052505.859518-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_212618_267168_E2D9D14D 
X-CRM114-Status: GOOD (  12.82  )
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

If IPI calls are injected using SBI IPI calls then remote icache flush
using SBI RFENCE calls is much faster because using IPIs for remote
icache flush would still endup as SBI IPI calls with extra processing
on the kernel side.

It is now possible to have specialized hardware (such as RISC-V AIA
and RISC-V ACLINT) which allows S-mode software to directly inject
IPIs without any assistance from M-mode runtime firmware.

This patch extends remote icache flush functions to use IPIs whenever
underlying IPI operations are suitable for remote FENCEs.

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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
