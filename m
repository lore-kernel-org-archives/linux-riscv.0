Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB21DCAC587
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QsUh5Lru+bojJ9TKcwjGWb0F4Z2wdkWKzvz7swa/1PM=; b=DlrJxpP1Z9JgDK
	l2A8k442OzQdXZzzfqcd21x82SoQOI87ZBWMFjdzLOY2htA1AOkZKEDcrpdo5vCapnW35Ttf1RSYQ
	xUDaq8FA+po6dfMswYP0BCKxVa+Lwnb2iRsQhIePEZ83YBKLhdEWeSUGyb8DqltYMt+ag6v0fuZXc
	R8R2IhQSZzatHUonCLHebQgyrmBRRq185v+AwojabovxrGXxPZRRxzKxpPYeFP0cjSVjfJ30ZWr2R
	CrBFGHsDMCbS8VRhu3Il3XuDmpmBBcQk/v8f956NjKnOVfpTSgsU/2T5p7C39idJk7INjIq01gU7f
	43hHPqMPe1i6ND6rKZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXqL-0000000GMR6-3xM3;
	Sat, 13 Sep 2025 21:31:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXqL-0000000GMQb-2FDO
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 21:31:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D637C601F9;
	Sat, 13 Sep 2025 21:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF399C4CEEB;
	Sat, 13 Sep 2025 21:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757799066;
	bh=thVTGezMo0pAosaN7Dx0/XK1CsqI2+np60A2VazYJJg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=djWMGv+M7mlviDGoufdu4MGlzmMWmRrGGGyR55AJrlkvEv1MWmLg03bSuJIEI6Wqv
	 d4k4EPkva7rPS9LfuviUDr2kMFhX5VwkyLG7HJuMws+/ZW5/HEggW4TTl+tnCd5Onm
	 grrHOiDMenDr2P+8ODtU+9Hrhe92NQpdY2H7vrS/tS5xMb7azBGzo5TcvoGXuujSmb
	 FdeKIvJddwzRPXZQni7O/ITseuVTLaaeETpBAubXh5ccMDETuzW0Y/MNS3L7WkU2pH
	 g0OAIp6GWdnGFkQxhLQcinBPjmu3DLz0GQfPKJPJ/uKgamqEJNXjFOioTRQ5h5968o
	 Lh2gpnkmjShpw==
From: Drew Fustini <fustini@kernel.org>
Date: Sat, 13 Sep 2025 14:31:04 -0700
Subject: [PATCH 5/7] dt-bindings: interrupt-controller: Add Tenstorrent
 Blackhole compatible
MIME-Version: 1.0
Message-Id: <20250913-tt-bh-dts-v1-5-ddb0d6860fe5@tenstorrent.com>
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

Document compatible for the PLIC in the Tenstorrent Blackhole A0 SoC.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 5b827bc243011cda1fd45d739d34eca95c6e1ee2..c960a9ec17e9fceb0b754c21162e8730b12120fb 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -63,6 +63,7 @@ properties:
               - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
+              - tenstorrent,blackhole-a0-plic
           - const: sifive,plic-1.0.0
       - items:
           - enum:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
