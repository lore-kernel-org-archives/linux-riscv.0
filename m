Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D87EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 16:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMFnQjRcQBT9n5IC6URVrposcP6YRjLfq8c6xTooH1U=; b=1f4FNq4CwVqLfW
	jDX8dkC5PjgO7NSIRMcXo5yduUYoMIrllKx4x7YtEUo/cLzmUCgZ/auE0apbo+oPtqKIBl9JLBM6f
	m+FUc2qN2AYYeTgFa+V8ibUTK9OQYDKBjddQsL4jkBckThJap6JVGzRO8I/p7QkuUVAUmctfmj7bg
	d0nXAbs1AgmAjusU7Fgo/dhpAKVnC/ESQD06skUcLcDRctQ9bNrH1HVdiCCCNcN4h0w2h9KtQOt6n
	I3tmxt5wOka+Pqxg3sozxOZVGTRokwYfkPN3svm4WI8PaCouH/n+nN/IdVwNPaA+cAkYj/N0mzxXe
	RpxSLFG1KJM718FuhE9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlc-003tWf-1U;
	Sat, 17 Jun 2023 16:27:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlZ-003tVo-1Q
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 16:27:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E81AA60BA8;
	Sat, 17 Jun 2023 16:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AE5C433CD;
	Sat, 17 Jun 2023 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687019228;
	bh=9TcP0pheewMFNteE2MjQt4eyImwOKciOqR8+Aqc04aI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BPnAUsh93U3aeHBUKqzv4wIHLB3IOdV2/E6/coVGuZyPoQ34uckzFBlxTg2W2TApd
	 ElOmw92e7gpvrpqZCj0LR+ePdZPnWiSteQwpULo5lNfTQOo09E1ViF2YbdCqlblh/w
	 rzqy68lX5qbuPf2pI6lR8Y7gEFVwSOAqtFHoZ3wGgQ6jaHe+WzG98kZ4LEQE6z0fKW
	 pnWBbX5XYpiKkX1QOk5psdB1DfcRGUF/Upf+63t+59b5/xuyi7BoIfzBeMFFpNvY2/
	 weom9JS1O9tQqeAkZv0pDRso9V9TXdymiQr0zAHnAzWjSoMzWxbbgCoVnYl+E2ywLP
	 EphWZrBIzsKew==
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 4/8] riscv: Add the T-HEAD SoC family Kconfig option
Date: Sun, 18 Jun 2023 00:15:25 +0800
Message-Id: <20230617161529.2092-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230617161529.2092-1-jszhang@kernel.org>
References: <20230617161529.2092-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_092709_523769_A9154DE7 
X-CRM114-Status: UNSURE (   8.50  )
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

The first SoC in the T-HEAD series is TH1520, containing quad T-HEAD
C910 cores.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1cf69f958f10..ce10a38dff37 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -41,6 +41,12 @@ config ARCH_SUNXI
 	  This enables support for Allwinner sun20i platform hardware,
 	  including boards based on the D1 and D1s SoCs.
 
+config ARCH_THEAD
+	bool "T-HEAD RISC-V SoCs"
+	select ERRATA_THEAD
+	help
+	  This enables support for the RISC-V based T-HEAD SoCs.
+
 config ARCH_VIRT
 	def_bool SOC_VIRT
 
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
