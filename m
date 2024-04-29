Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70F7C10F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 00:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hf2wVXJT9E51xr+e0wkfmBrnwdfk5XUaglh9Jn0B5JI=; b=uJ7+nFCeDGFzVc
	jhp/at01mCoPoa+SR056wTarZp4YpetJpUMMOnD4vq6ZL3dI+VcegneCWc+8XdXmcjW3wIPO/5A9y
	G8qSydSFTM3ZhcxXowRTOHMYpAXxQEqKhRw+CcfrxvYkllgS4C+rqsvFD/ei06IICKQlGAOd/HqhB
	pfFa+UwmpA1uB6V3wD+sl8bVn3ddZ1kzgWhlXEjrL0cLulFk0q7bv8S/fDYW399OU4db4oyk8sKsd
	35jLFbPtmizJ9EYaKK5yBksYciKtC1cYb7Rgwk8Or85p50ScauV6ZQ8JLRIfXPQGz8FL9k26sIIQd
	urykGzvCyBe8lVxzIxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErR-000000012mO-1HSP;
	Mon, 29 Apr 2024 00:27:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErK-000000012fq-2DKZ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 00:27:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9867F60BA3;
	Mon, 29 Apr 2024 00:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCC1C4AF18;
	Mon, 29 Apr 2024 00:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714350418;
	bh=nmPdrX+XsSeX70KVtZRtkwwkkaIBq4Gq9LfwCK24YRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oT/Ar35aIU9cm3DjlkVKJdGkPm3jBBhYz3I9S8J/2yDZvKQNDAl4SnkFvdF1/1bMT
	 9CCMH8itbLIY8HlW0cWN14nq5Sh77uJliLgzTFFalORgYa1URbCXMSpCQJs6Su92X0
	 wukRp9CPI3MrK/juh1N6tBePsQNiGBgzuHD+I12KqFKmOl64nxMznxUI8SC9JYRLzV
	 cXJct7T+wUmTH4i9J+gZGGHbVszgg3+ftndiGf9U5xXOkyWe0VU+v0VqX6Cks4bnIc
	 LezJJXjGQ1XtRqe7Dvn+dyI1/aOODAybWtaUb85cd6bAvMYgq/aRymaMczgQw2M78Q
	 IMD706AOTXSFg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v4 4/8] riscv: dts: starfive: visionfive 2: use cpus label for timebase freq
Date: Mon, 29 Apr 2024 08:13:13 +0800
Message-ID: <20240429001317.432-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429001317.432-1-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_172706_661566_B91EF1B7 
X-CRM114-Status: UNSURE (   8.70  )
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

As pointed out by Krzysztof "Board should not bring new CPU nodes.
Override by label instead."

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 50955cc45658..910c07bd4af9 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -26,10 +26,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	cpus {
-		timebase-frequency = <4000000>;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x1 0x0>;
@@ -69,6 +65,10 @@ codec {
 	};
 };
 
+&cpus {
+	timebase-frequency = <4000000>;
+};
+
 &dvp_clk {
 	clock-frequency = <74250000>;
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
