Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3BACCA472
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5f0pNMk6kIGU2f/l1C4v9IAc0mQptXd5EeygjBwm1o=; b=a8PTXBb906e/ot
	GTPyudxgC+sEGms42fO2pCEW+JmxKGwGY0iZEB63frzUkmocd9AJ4mAy8Th52m7p605a8CxDx4FXJ
	YY5g6trIORMG2PoxbFy00Z+itxSJbNf+BX5SAMYIoWpr2mnqJdKvTFR0J0Vk/YXg9zapYDWIsqBZR
	phZp1UWHdc4OnOhzJwTk/0aRD/kE8blFj0hZWPpCot04oPFOypt2nAkQ9itJ3AuIQh+ZxAfDq+tD/
	1t0hanfICQByZcRDgcDWhPymC22p2U84NKiCORrea7s7UXLrgOhCCu0PiDjCQnUQfntkXnbUaFhIU
	vfGum9zImhn7W/onuuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5sea-00000000pgx-2aeB;
	Mon, 06 Oct 2025 21:21:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5seX-00000000pdz-3qgk
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 21:21:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6290B45EBA;
	Mon,  6 Oct 2025 21:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0EDC4CEF5;
	Mon,  6 Oct 2025 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759785713;
	bh=rNu0QItyK8D1qVeWfJOHhXOMoiDoQzrzmDZqy8+fBZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XinHgjrUiZT0GIS6aVa+Wx0unLVoBHiyNOX985q94IKfnr9vH4qt2jwZnRTSSH3Xs
	 xGTs6ngDbvCLj4zMMg0a1ZtCjl9X+YSgXI8oyn+jF7iR2OjghibKWrL7Bun5YC3q0U
	 wstq8DNbV4U3g4VysLtvmhxL73vm9umLg9nIKs6hoqD0VGG31QFz9BqUaM85bPt0HG
	 SBP5hItQm4kF51IkjoVHUBk75EmModrWXqRg4u3cOCA6qaXMv8mIqPQVYG8gZNoe/o
	 4Bf0A6VQlJX6JsMmoO3G8/OMkCBQR4n4jV4bZeVuKaYGp+4cm88oyLRQMCQa2j5Yju
	 cTuFzWs4leCrg==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 06 Oct 2025 14:21:43 -0700
Subject: [PATCH v2 3/8] dt-bindings: riscv: cpus: Add SiFive X280
 compatible
MIME-Version: 1.0
Message-Id: <20251006-tt-bh-dts-v2-3-ed90dc4b3e22@oss.tenstorrent.com>
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
In-Reply-To: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@oss.tenstorrent.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_142153_980873_16C0E6DE 
X-CRM114-Status: UNSURE (   7.30  )
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

From: Drew Fustini <dfustini@oss.tenstorrent.com>

Document compatible for the SiFive X280 RISC-V core.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 1a0cf0702a45d2df38c48f50d66b3d2ac3715da5..bbc3886282dc5e8c53e54c0acd91608b443f590f 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -69,6 +69,7 @@ properties:
           - enum:
               - sifive,e51
               - sifive,u54-mc
+              - sifive,x280
           - const: sifive,rocket0
           - const: riscv
       - const: riscv    # Simulator only

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
