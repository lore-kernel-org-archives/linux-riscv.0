Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1288BC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ysgmKz7NW7KfdsMi08e3DToJPY10FwUPG3Jf0OoTCw=; b=yFzvtQBrdAImDS
	HxV2D7sOzzn6k1XEqhLppt/+z0m1ZKrn1YlO/pd2ST4p8dLFazOGGiEN120hEqlwSTHPvGpJAKNqZ
	HMo0RGralYMw/rrU965k37Yd+tpEXUP95hb/+h7TXHKJhaMYZslCumHdPMGrT6H5XJtwPQhVFLI1u
	quo4VTl6W/lXOWd1kfqA9cPZ40fDeSOIRfFF1UITy4qj+STkOlpD5N5gV3L1j1Qyyr0Wwe8JELmhd
	ZnBDPKsDiwpikqO6zHJNbMXjy5i7v3PvSiZKjgsaZ3ZYrfjoExB5Jy06PhxOUmJb3u456/M/7Hn7T
	PKapj7ECViPei9O9qkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jHy-007aNz-Hk; Thu, 01 Dec 2022 13:07:42 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jCm-007TE8-C5
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 13:02:21 +0000
Received: by mail-pj1-x1032.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so1969464pjm.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 05:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=S7g6waYjN+0+SwkKuvSnobOjtygf7FcxN5iSyU6NRY2OD2lh/w0ZVN9fupepMU0mjT
         Wq0Z/TU8p4Ts0c5qdkPX4OjEZuDR7A+Qxm92oZllmBCjlrjvXAX6NKnBIMox7bDHR431
         Vym09s61EigwqBmGzjklNXQ7wEEW/xdRouQ1nCGVW0N1N55i886OglkLNr07MrQYPAB7
         aRrEbiIe2Ls2J88KNodTfLhatlF2xIU6xZZ2FkZx0oMTPOKiTQBZ4E2a3kDxiY+Iib/O
         mhlC7+fLzvYlZBgYgx6+YIaYwQKDA/nq1ZIFvsKYNZAwPkm+HT6dluSLwS/ZAh04fQJX
         EbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=y28fYUJixzu23ksIZsoNl7IbfsAOiuTxGyKp6O79ha9C1H0Kbi/nxlVFcxcNN1dyX0
         aJx+ZCrB4xzW7LjbAP2ffEu4Z/cZAEo/0fWcx12P6zYDa2BwriNIJaNIWtGnwj+kPmeE
         1iuH8payXasaxhpJ1wiE48P8/XGQfHwIomIHtj9aGY0CC9kH5bBPhC+F2xB40LvGS917
         As4Pf8cTj0REbIgpgxLob59f36/su1YIUTUa415ISVydoefuT+rH7n7ZfqpnAydH85Bx
         bK+nBG1L15yJp0r0r2ByO97rdjoRdb+a2gQz5yWK1L8J0lGWogDcCtua561MNoTDLS83
         M59Q==
X-Gm-Message-State: ANoB5plei4CeBYRek4tTQzIi0acTCvV2CfP8lWmA1POJEapVI0skcaO8
	FQ3V+im1/31Ftbg5/4iUqefsaQ==
X-Google-Smtp-Source: AA0mqf7dIIJqC87dxBsH390GH5t6+SbzyL0AgdbTUxWbHGXDJSmxVhTmVwCmHQ35gQ1I7Zu0obTQdQ==
X-Received: by 2002:a17:90b:3944:b0:214:1df0:fe53 with SMTP id oe4-20020a17090b394400b002141df0fe53mr74908231pjb.214.1669899736990;
        Thu, 01 Dec 2022 05:02:16 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.81.69])
        by smtp.gmail.com with ESMTPSA id l4-20020a17090a384400b00212c27abcaesm4855856pjf.17.2022.12.01.05.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 05:02:16 -0800 (PST)
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
Subject: [PATCH v14 7/8] RISC-V: Use IPIs for remote icache flush when possible
Date: Thu,  1 Dec 2022 18:31:34 +0530
Message-Id: <20221201130135.1115380-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201130135.1115380-1-apatel@ventanamicro.com>
References: <20221201130135.1115380-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_050220_468321_59F29381 
X-CRM114-Status: GOOD (  10.60  )
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
