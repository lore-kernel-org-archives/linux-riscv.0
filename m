Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E99CCD185
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBg9ox+ZdhvUDeAizTAfv0eTWS/xrVEuoug6ykmoVlk=; b=WVwh0mOkQkYE2X
	jhSXzO/vP1Plb31uKALohbRwItNgH30FBv3+6U4SqtEz/p7UheSqarvcyyT2O6jusNnDeAZcKYaeC
	wNdZKuMCSYVqQJLrhg3/wMius2J+D4IE7mNUmfwY0iWi7bA6+bDPpGYIsgnYuW29x164xLIY4Klci
	onEWVkM7PhJHX6+nxBgJOzi3nLUQkEk/5aDii6V3UFamiCroUv4eoN/Ck2TMI83ccca33jJt4w6Xu
	AeslHih0XZv+FPb8pNLqO3CTKGEJ7E9ajKyHXofVepWq/L7SWB2aGL1g7JdTku2l5ity+l6ErBou7
	3+yrw6Xdl2HDBKqVyuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5sec-00000000pix-2ByQ;
	Mon, 06 Oct 2025 21:21:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5seZ-00000000pdz-1GTO
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 21:21:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C15E44162;
	Mon,  6 Oct 2025 21:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581C1C4CEF5;
	Mon,  6 Oct 2025 21:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759785715;
	bh=VVc1pawzmxk/CiU4x01IQ8kCJVDTfOVXRKwQpCmltm0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PsiCNB8P0AYTWQoh6lYN/mHpLXEu9+Lq6cqw74glTtAngNeIQXQI7jqW97XnQP689
	 ySBq9eHqxs6mJDGrrbSR7SbXpU9U9syA+ZqkiZOvEE+WcFyCBRvJ92IFfl5/php2bO
	 9CEjSIgwIC5YoVb6+0SyTlQj9SjGHpYql2hSy5eOXVtJqNTIn25H7wsaWgefxmgn4z
	 lupUtZt7IO88RXFT9xN+XsCzxVVN9KQBxbMOFepBA3KxLbkL/e05zT9bEJXj1/hAV8
	 OSdW0g34dnMHKOBjwSvqOMroeTsKRCVeP9GUAReoZ3uBnlSaZQ8btd8H70xGiCQtbm
	 btHipG4lJx5Hg==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 06 Oct 2025 14:21:45 -0700
Subject: [PATCH v2 5/8] dt-bindings: interrupt-controller: Add Tenstorrent
 Blackhole compatible
MIME-Version: 1.0
Message-Id: <20251006-tt-bh-dts-v2-5-ed90dc4b3e22@oss.tenstorrent.com>
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
X-CRM114-CacheID: sfid-20251006_142155_412927_3EACEB05 
X-CRM114-Status: UNSURE (   7.69  )
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

Document compatible for the PLIC in the Tenstorrent Blackhole SoC.

Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 5b827bc243011cda1fd45d739d34eca95c6e1ee2..61bb9a98b1f5544efdf1460ee3873aad1433ac41 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -63,6 +63,7 @@ properties:
               - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
+              - tenstorrent,blackhole-plic
           - const: sifive,plic-1.0.0
       - items:
           - enum:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
