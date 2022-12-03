Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ADCC352A1
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ysgmKz7NW7KfdsMi08e3DToJPY10FwUPG3Jf0OoTCw=; b=CTxFFkqBoNkVOd
	9I16hx8UEJRgEHEIguT9DmdbikRJ5UvXD3UJ5kRbEmWGO/CYjgZN49KvdnxCunUY7Em5eJHtJ9I/V
	4MGeenuy5dxjcH2K/vmWLW6gGrxxZg56NjRE3AtIHP7DvuENduHppa57tISHCwfkhzd0QlY560sXS
	t6w3K7t0S3DcjNLW/BjZulpe5X35Gfkjdg4kzn8xmm1yEFrm57oQyTLZ85yC6CA9CYqokjDXc4dGl
	5aKABHoVL9hkIrINUCzySo5QLuhYpgUV1KRcx6P9k6GIkaXPHUnwPgu6IH/xuonFDABYfX3QULhi6
	/IrEdJvZOeB7Zb/lek7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1MJF-002dz6-Et; Sat, 03 Dec 2022 06:47:37 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1MJ7-002dup-On
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 06:47:31 +0000
Received: by mail-pj1-x102b.google.com with SMTP id k5so6820333pjo.5
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 22:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=O1HUEM1kuxlKgxDRZksTgkWxBmPSc8Nvnep6Fo8qupSeofGZxZUQZdS8cTjKMT/FB/
         /6w/3YB0RPnYvp+juqh71xwtrmU59lnIqNM+yI9s8p4QBfPcTiyKSNtgFvehf3aSag3T
         B1tOvPMsZih20BjojFJO/eAZn1wsgQ05BiwtQk3ypqOv6ViBTAU+7OcD0/ndsTTcabYo
         heP4OgXUBec8BfIe/9OMRANYtA3Hckw989gW1Bt94m1AlPzNYWFIL2J3BlfLZIC6fE+O
         d36vn8TnQ448DpYT+ooFjEH/shzIJNtuqtbIB/ORunx8GrtpTbz+0l3suOxftXeq2V/S
         29xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+D6mfTqwfey0lLy9Lc3RpfTXi+1JUYYl3NRmY/n6Cg=;
        b=fOzpn7DQRkKm3zbeYQEGA9+z6rfWcs8cZwLWn7YM/dpsyTnijijcp9OouWWxDt82kM
         Kp6/hwZoUUwkhLi938T4s/0/nKcpcg1YZqQdXZra7EVXtvDvB6RclWpm/1BV2ISFER6C
         CXMlFv4ITT7hSudonNB99tLo+9kYvcwBb5hrK6tHZVYq9/pvLP0QwH/iwg2/RY0YHAXo
         QQzgJAsjdJeIOLYYNAahBE7mhhLa1K7ngULvPdxuDfOHUILkmLXiZUPjSlgdRCxUzhvz
         WvKUNfuVeQAlQ9S429spfkjxS++Vd2uk+dFQ1rFGiw4OOW7F9GWInKHBc/CrdDoFuyzd
         JIGQ==
X-Gm-Message-State: ANoB5pnerIIlugS+J+m0UoDyP2i3rqGxO9CA0DoMZNgW/TQi67gh1rzY
	0el4Daf1HhO3XpNMpoUI5J0uVw==
X-Google-Smtp-Source: AA0mqf5KzIZeHr4Df/4XED36JfSJMBY/dITpOcWof+TBmvy8B1PfZ/Aa0huOQwFFhzU8hz5N03WIlg==
X-Received: by 2002:a17:90b:2541:b0:213:30c4:e803 with SMTP id nw1-20020a17090b254100b0021330c4e803mr83420155pjb.209.1670050045998;
        Fri, 02 Dec 2022 22:47:25 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id t17-20020aa79471000000b00575c8242849sm6102091pfq.69.2022.12.02.22.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 22:47:25 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v15 7/9] RISC-V: Use IPIs for remote icache flush when possible
Date: Sat,  3 Dec 2022 12:16:27 +0530
Message-Id: <20221203064629.1601299-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221203064629.1601299-1-apatel@ventanamicro.com>
References: <20221203064629.1601299-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_224729_839829_FE0ADB92 
X-CRM114-Status: GOOD (  10.69  )
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
