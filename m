Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E85C6FD1F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTeSpB+Kz8PP9VpJq2j1d6TbTHKuyRMgD+ed3CjMCwc=; b=MwghEELLoPygBG
	aPTWcga9GhpiFbBu9PmSve+E9YUFKsZpE0FX0HDbNIaKFLcpq1OBr5XzLrssCEr9PK23y1tdI4V6m
	dtXWvfVsGy+3PuopFnfh5AwYGA80Zf6L2Ri53lBzXTR1p+vZmhKxRKP0z1sJVU1wG5G2A2ratnGzi
	f2yYQk9shReUntVsigfjhQL0lCwTynadHaCnBzxljEtQynH6HcCkPnD2OHJ0I6Et+26UsXqMkoykF
	GJJ7B3e838keJHzM/MK0wB5L1l4RbekPYN2bm7yK2tsrPwjSpPk+NPfuNYhQ+4E4wRFN2pYWKShnT
	hJzsFU6hLVGWVyRF5UTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronZv-00000000skM-09zj;
	Mon, 25 Mar 2024 16:53:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronZr-00000000shq-3E0O
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 16:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0200C6118C;
	Mon, 25 Mar 2024 16:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A506C43390;
	Mon, 25 Mar 2024 16:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711385618;
	bh=vNJUUGgBYsqzd1U+c0XNtNNwoWAwHgq0i6v5JcQYy7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D1xjklQ9T3CUCWED7yfG2ZMg+v7PSjM3W4B+DkuMr25oQbcUGTDaIrKYJdh3ggagm
	 /xhQgXW0roNkItDioF6LE49k7MEfmjwU+knmOqmuoh4VKTFM5T68nKzKidhNR1oxNK
	 Jy340vIkQYcantibiT87kBrAZhlsSq6dI/Ch8NywMF5SUtB2Ywz8P/SliUSjpNz9TM
	 JYuvx7BYR1UikX4XBeXLuMArHIgUOs+WzYLygvAYlpjBZz/lPo9L0efBqBHh3IFWr4
	 WmFIC4zK/kEZ/KsIUTbtFcWrBTKU9t+/V8KG0BJ73eoKMPnAh1LqWL0nKfZtKujtxN
	 oQUreGyV/GmxQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] riscv: nommu: remove PAGE_OFFSET hardcoding
Date: Tue, 26 Mar 2024 00:40:17 +0800
Message-ID: <20240325164021.3229-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325164021.3229-1-jszhang@kernel.org>
References: <20240325164021.3229-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_095339_917715_CBD84A3D 
X-CRM114-Status: UNSURE (   9.63  )
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

Currently, PAGE_OFFSET is hardcoded as 0x8000_0000, it works fine since
there's only one nommu platform in the mainline. However, there are
many cases where the (S)DRAM base address isn't 0x8000_0000, so remove
the hardcoding value, and introduce DRAM_BASE which will be set by
users during configuring. DRAM_BASE is 0x8000_0000 by default.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7895c77545f1..afd51dbdc253 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -247,10 +247,16 @@ config MMU
 	  Select if you want MMU-based virtualised addressing space
 	  support by paged memory management. If unsure, say 'Y'.
 
+if !MMU
+config DRAM_BASE
+	hex '(S)DRAM Base Address'
+	default 0x80000000
+endif
+
 config PAGE_OFFSET
 	hex
 	default 0xC0000000 if 32BIT && MMU
-	default 0x80000000 if !MMU
+	default DRAM_BASE if !MMU
 	default 0xff60000000000000 if 64BIT
 
 config KASAN_SHADOW_OFFSET
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
