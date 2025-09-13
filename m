Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80557CAC593
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 21:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zG9N3fwjFxNu183yKMEwPh9Zd7DkzsZiY/yLtWtbQR8=; b=Obdqf2AhY4LTIc
	OS/4AapXQZGwPXEMB70MUrFqBWOvA3xFXEPY3eMHEzH1RvsXhdimyVOr12gxk0Tlnr085OB3jjZr2
	c6s/met1S6uUG28IvaeIhtNM3B8WUphD8ZjoDaLjrwvSNCiMuL2Ap2EKN9Qf2yIa/yXUXfkCmhKwf
	jJaU1h0DugfqzRxx6yqHlOin0WDAMX9WCsqO7/8OKFKtmquslSR0Q31Ur991t2mxUBoGySuN65KeP
	H+IBm4lTYXgPUwbXuEhMNX0u5qdUUSRL776Vr2g8DXLF4lqBdfMSEc5FpIcoRkgsgJ7g+bGS4zD7c
	5VjbENeLk8vVjmm9oICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXpr-0000000GM7l-45P5;
	Sat, 13 Sep 2025 21:31:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXpp-0000000GM6M-2gkL
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 21:31:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4657644E2F;
	Sat, 13 Sep 2025 21:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99128C4CEEB;
	Sat, 13 Sep 2025 21:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757799065;
	bh=dAjXCByJWDvW78TjUkKWkwaKt8o8TeBgyz4QQntn2Hs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MX80AmckTrH9jVOS/tTJYepLYhpVtMhI/Gf5RCGFOJ/36AZKs67cAps5S+FcuzYAH
	 FIKllea9sQ513gaY40lqu58t42iRrA4k35ObCHMGHcgSFfI4xfqI//X/KicBKk6mGj
	 EGEKWKOj4njLkqMm4rGdqiH6/1D6GFgYU9H/Av+O3vWz10+qu1MV4k557hs8mm/+/i
	 Z4owwXlFMl+smrrfSOP9wVbfI9dVqB25cxyf7vvxOkIYOEpnWFKLeMIyZiCHdLvQtI
	 Wd4JqwqZqS1cnG+DpBCUHax8SSMSPRN16ESfRLhbXehZQnQInOW4HSUwkVDHToj/RN
	 jhaHP2GdLjYAQ==
From: Drew Fustini <fustini@kernel.org>
Date: Sat, 13 Sep 2025 14:31:02 -0700
Subject: [PATCH 3/7] dt-bindings: riscv: cpus: Add SiFive X280 compatible
MIME-Version: 1.0
Message-Id: <20250913-tt-bh-dts-v1-3-ddb0d6860fe5@tenstorrent.com>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
In-Reply-To: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_143105_707395_121C55BD 
X-CRM114-Status: UNSURE (   6.89  )
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

From: Drew Fustini <dfustini@tenstorrent.com>

Document compatible for the SiFive X280 RISC-V core.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
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
