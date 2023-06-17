Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18722EB64D9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 16:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GukcrDy7fMD2woMp22gSmklMmtYVk3NwFMWHJTLS0Z8=; b=RY5+n4ikXzPMzH
	DaDMNDF4cbevZ8PCK3wtAZI47ig300m90e9RzHpBy5N7GUQPRuPN1M4sptAvMlhOj6th8XFmim6Br
	RgOQABajXRPQdKBiVFIQ2QVXfLny8OqNITr+RGvKYCJY0tqKUNi7rB/vGGk6RnChLXWzGddpmn8aI
	Gy5vmWKzhzKzZi+f3RKs44/VteqgiueT1d91FExl+4ZcS5tOGCU2sTSrtqwar6nAJIh2gg0uZSVUm
	x3su7sWFgt5mG5yoqHRj7/EDit5++sXv7Now8ZPT0Zo5QBamaVUyjF4+o/pCmYlF9gatbAUZ7xAcH
	HROJc7gRyO15Aeu7f70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYls-003teq-0T;
	Sat, 17 Jun 2023 16:27:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlp-003tdD-2G
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 16:27:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 461D760BA8;
	Sat, 17 Jun 2023 16:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334E4C433C0;
	Sat, 17 Jun 2023 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687019244;
	bh=15h31Gq485ARLyon5H9bm78eqGG5GpNtnkp3TJY8+4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bUcCSHlXWz8OFVrESwROBhwI5K2nR0kk3xQ1Y0ggV+4bN2ztD8fjNnx+lOC9QoLja
	 2EcFpI6AFbr8WK290wnO6rYD+tNSbFhScpf39CJQGF1J9X5ZScD/wVutAcsFtIq1bg
	 GDIxqZ4cKpbgNQVFI0mkTXZUZKWi1gIO9Ih2YTI4IY+052KxIN5gr+6FJdz06DUkt7
	 o3oVmfhkIXPpBYp9jlc6PWHIGqZkx4Pu7dlrRg0lQxKEK094ViP98LUeeM888vAlnQ
	 r0x3Gw/XwFtfMQs2YwjH6voAy9g/mTY999c+5mUScETLEt5jVm9c+uYQGr4uosMr9a
	 WJSPTCjEMg4IQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 8/8] riscv: defconfig: enable T-HEAD SoC
Date: Sun, 18 Jun 2023 00:15:29 +0800
Message-Id: <20230617161529.2092-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230617161529.2092-1-jszhang@kernel.org>
References: <20230617161529.2092-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_092725_812965_D6CA6D52 
X-CRM114-Status: UNSURE (   8.55  )
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

Enable T-HEAD SoC config in defconfig to allow the default
upstream kernel to boot on Sipeed Lichee Pi 4A board.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d98d6e90b2b8..109e4b5b003c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -27,6 +27,7 @@ CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_ARCH_RENESAS=y
+CONFIG_ARCH_THEAD=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
