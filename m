Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1D6EB64DB
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 16:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKryX7BAoloF+FG/gdZ61/nnMLTmsySVf9gHbZqWnl8=; b=gz7WxeQES+jX+A
	mdXFRQiLH8e8b7aeB0/hcDD7GMv4b1rBRi52FJC8Nqu2mnkDX7kUmoqIV9wkQIjz7vRKGwOXDYyaf
	8HdQJ9S+xSVAgZek8e6lRLkOWCQ4KCaalkElJ/soz07GKMpN4CSCh6an0E5Ny6z0X6SjRb/Tr77hu
	A1LeevsxqPy8l6J/KAbMOpZa68hs3xhxp6Nm7LlICcEvQLqF/IHf27Cb02Zfvc4OYdMcsLK7sEWaF
	G61RKuzLqCkBxxm+AYMCirXlEzDDcvRU59rHYOToSCq4H043/BTMH7MdoZw73LZSiOov7KP55zCMj
	RzUCN51ZE4dlDzl4Tzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYln-003tc7-1S;
	Sat, 17 Jun 2023 16:27:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYlk-003taw-32
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 16:27:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8236361141;
	Sat, 17 Jun 2023 16:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFA5C433C8;
	Sat, 17 Jun 2023 16:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687019240;
	bh=tuyRjugUtNnv9NSvg0JKtT6JTySfG2QjgD5pYhGE3Oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLemWZcmp8D3z8QRkuuDf2liEEtC/neuEkSmoLSHnQgiOwulQ7eCL/KBpJl/rE7vD
	 JsSZ7N3EO5eX40xP6q9hxFDd+WPWvBpQNSbyo1UlzK7m6yoyfDzOEug7yDnSj9Fvzt
	 nKCg/BZZqu33EPlM0+umikiChGZTZREweHOfuARN/WVQ0TLKBBsX6Ceagyp7pAoTPd
	 mOC5vFCkJXkH33fDdscyRniDJTOsqMdatDrVeOLEry1ZzoDRoLeO3oQ0yu9YySZAZF
	 EKqUT7hzvN73HeXK1nCs/c8NEeZnncnkWCHCu/f8TxBQdKxKHIWISGi0u3n95wWZFw
	 3jJlEXSWOSoyQ==
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
Subject: [PATCH v3 7/8] MAINTAINERS: add entry for T-HEAD RISC-V SoC
Date: Sun, 18 Jun 2023 00:15:28 +0800
Message-Id: <20230617161529.2092-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230617161529.2092-1-jszhang@kernel.org>
References: <20230617161529.2092-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_092721_019618_EB28AF7A 
X-CRM114-Status: UNSURE (   8.67  )
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

Currently, I would like to maintain the T-HEAD RISC-V SoC support.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0ad886d3163..68805b09654f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18162,6 +18162,14 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
+RISC-V THEAD SoC SUPPORT
+M:	Jisheng Zhang <jszhang@kernel.org>
+M:	Guo Ren <guoren@kernel.org>
+M:	Fu Wei <wefu@redhat.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/boot/dts/thead/
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
