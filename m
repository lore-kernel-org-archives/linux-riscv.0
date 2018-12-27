Return-Path: <SRS0=Nd4X=PE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE1EC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:19:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCF62214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q3u+1tFu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="RPLOhyn/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCF62214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8ytRvaArCk5GjPXTtmt3DJ/GWYIHScqt6rlm/9ARlQA=; b=q3u+1tFuQISdepLgC3idVhsNFl
	bHUcK/j9PBYizkS3587rYc7LV5XPD866TtdUkev8lTs5G7oZY4qEaEMMlcAD0vNOCTUv/EOTyB8YV
	JQEQZOfFp1oO699GiqwKdvIuy7+wubgqCekgYEYy3aaPPygFh8VHbTPX/XIFWJNwswHsPX8aBfaA9
	CqeOyTGuSns3aXL5SVlruxFKfcVfEKfZXmqbubqh4gnuXHrHmwr6MHqFsZpGmKhwpQnecsXisfbdE
	erClfIeP68S6Y5e7i8z44RkFS0ROZjYy2baSPkVRuLFeMfgT38o3LMeZtbrdr90qej7dC+FPwVtt/
	dFqlBmDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcTgp-0001rW-TR; Thu, 27 Dec 2018 11:18:59 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcTgm-0001lb-VR
 for linux-riscv@lists.infradead.org; Thu, 27 Dec 2018 11:18:58 +0000
Received: by mail-pl1-x642.google.com with SMTP id t13so8654853ply.13
 for <linux-riscv@lists.infradead.org>; Thu, 27 Dec 2018 03:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+5uWZcZTnUMYkzU8RtvAyOycmBx9913OmwDsy9awI1U=;
 b=RPLOhyn/ZPA2uv/yy5Ps3MLS8pYzhJpuRGoYpUltMvA6vmE58mz/LR/r1hDTPVthSj
 wHGROTGJdjpsCWsgskJLyojRNfU7ydpY0jwwlthiqaeA7ryGWUZQ0+ahPQxH01AuRTK+
 3Hx+FRHvO17LmtAdp0rtTqkTHKt3Pp98ijHkvLgwjjcQhEzIhcsmc8gtkuyDxHWBxbcg
 pHPML8c+qjRlbe3ieZ3HzN4Do+e99/MEaL56gUPQZ0f96tG7hwfGNV6fljrIzREvrIAx
 AReHwez1qL0cACgKMP3B4o2k9mBXWfPPsTJh09+CSLvuZTfs5lvmclBE9fHNhj4PclHC
 9ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+5uWZcZTnUMYkzU8RtvAyOycmBx9913OmwDsy9awI1U=;
 b=RNJ6hMFoV+evAetSUc5fPfIK1b/zrzdWaBwazAcSYMe/jFmqw2yuSWp4dxfHLhhoSl
 eMqLQrFiYaU3Ep/tv3Ko+EV0ncdz/YIbx15IuPZpXQs6cZGO/4m+pDLGJD16Hty00s3b
 QoT6mZCoU2EcD3kGworCUi87Lsc7RSYOHZlQYRSzT3EGU0YsQKUckA8zVuSPnoWExWEQ
 UKtnQggmGpPk271/EYKDB/+QoK6VhOkHBS/3UVDd025fV6goMVRwUwgeoNmZdfSnnv83
 V73RflehnbvKPYh8ILqka9RpZkxUz09F0CLRhEcU9iPxdnKlI6N0iYlS+dx/Pyt+gNpa
 bHRQ==
X-Gm-Message-State: AJcUukc8dXyVBhelI+Z9M7kw+1ccYWgf5W9KAXhTzY6908Rfr41aF8Qr
 sCk4Lwq/q+qUzdIXHy5N6V6UEA==
X-Google-Smtp-Source: ALg8bN4uDjWy44begQ0XzSRbv3KTSIhfATFvV2tBrQMSIeY9rDgNimTI//oKqEcn50oITn7TDtNGQg==
X-Received: by 2002:a17:902:8541:: with SMTP id
 d1mr23693793plo.205.1545909525948; 
 Thu, 27 Dec 2018 03:18:45 -0800 (PST)
Received: from localhost.localdomain ([106.51.18.57])
 by smtp.gmail.com with ESMTPSA id u137sm66830105pfc.140.2018.12.27.03.18.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Dec 2018 03:18:45 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v4 2/5] irqchip: sifive-plic: Don't inline plic_toggle() and
 plic_irq_toggle()
Date: Thu, 27 Dec 2018 16:48:18 +0530
Message-Id: <20181227111821.80908-3-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181227111821.80908-1-anup@brainfault.org>
References: <20181227111821.80908-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181227_031857_006914_2AE1AC8A 
X-CRM114-Status: GOOD (  12.25  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The plic_toggle() uses raw_spin_lock() and plic_irq_toggle has a
for loop so both these functions are not suitable for being inline
hence this patch removes the inline keyword.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index c23a293a2aae..01bbbbffbcae 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -69,8 +69,8 @@ struct plic_handler {
 };
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
-static inline void plic_toggle(struct plic_handler *handler,
-				int hwirq, int enable)
+static void plic_toggle(struct plic_handler *handler,
+			int hwirq, int enable)
 {
 	u32 __iomem *reg = handler->enable_base + (hwirq / 32) * sizeof(u32);
 	u32 hwirq_mask = 1 << (hwirq % 32);
@@ -83,7 +83,7 @@ static inline void plic_toggle(struct plic_handler *handler,
 	raw_spin_unlock(&handler->enable_lock);
 }
 
-static inline void plic_irq_toggle(struct irq_data *d, int enable)
+static void plic_irq_toggle(struct irq_data *d, int enable)
 {
 	int cpu;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
