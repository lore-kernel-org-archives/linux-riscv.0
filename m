Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B948C3DA78
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+r5KRSd7Wn4GNJf/Kk1pvm4PPdP9SX4wDizSQDikmUs=; b=1kF18V3K53Nhpm
	stctAYTnj/7MwJ6+jN7mxqpmMCFwt63Aa+w9yMqU0GW7LiNLbN6fqQ0M5fa1GVuuKf/0fOLphg3GW
	b0E3Am/qTTiRk11GY7QoiV4noYyz3NPnodEGrCESGl7PcQpFL++xtFpsHDzy/vzajT+jQJhyXYoUh
	lW0jXDEg6VgslVzv5MH3ack/uR/rgZJUswguIqsGaRYDeIA1+UbdXfvzH/MHzwTVXcwL8wR+XD8jE
	qjG8Jxs7KyM81XsB+rsYUJTyo3B0+ZO6cdcMQ17cnnPq6IQEtXsd6xXlYQvcFN5gt0TfGE9N1P6L3
	7a3RsbnuaIG/A23i7O0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5R0-007bss-9H; Sun, 15 Jan 2023 16:00:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5Qp-007bja-ME; Sun, 15 Jan 2023 16:00:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 19E7BCE0B82;
	Sun, 15 Jan 2023 16:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F7AC433EF;
	Sun, 15 Jan 2023 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673798421;
	bh=tkPW10BOmVwQ+xf9drtAfQkSUj0eKN05rtZPJxt7gQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XIRTBx0mtsJkAfSfFtiNpRCg91ubwV9z5K1d0x3hbV9QVR42yCOauFr/dot6B5n/5
	 F/qd1qvvkGSgWAtCcGOpt99tj1iGb/bT6q3SjktwDYGpJCzcr+4nS8qjwHcuLNS04b
	 Rm82cc6JA7L+Yzah+Waxbk7Gf1g6ds3KP4Lk0sR+Z4AzN3ItIGOdkdEEY2QOCegh2s
	 pY13oaVowNUcgkLyhsfxpiPrJ8wL5dFV9UPbUOxUYcRKpK7JnjCjkO45te6UGF5dbQ
	 u85uKCB+2AYGqGp9jCwbYg4BZefL5PCt8d2e3slKA7+qCKpcCaqn6ty+nC1ewAGW7N
	 fqfprqKQPeyxQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v4 03/13] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
Date: Sun, 15 Jan 2023 23:49:43 +0800
Message-Id: <20230115154953.831-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230115154953.831-1-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_080033_137337_3565CA33 
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

Currently riscv_cpufeature_patch_func() does nothing at the
RISCV_ALTERNATIVES_EARLY_BOOT stage. Add a check to detect whether we
are in this stage and exit early. This will allow us to use
riscv_cpufeature_patch_func() for scanning of all ISA extensions.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 421b3d9578cc..37e8c5e69754 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -328,6 +328,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	struct alt_entry *alt;
 	u32 tmp;
 
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return;
+
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != 0)
 			continue;
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
