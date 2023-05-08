Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1769C7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 18:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnQ+AE+ABplMGKe/RRx4AMXFLjZvFTnSTJgowSK1Nz0=; b=gDPUU1Sj4UcB4u
	StAUsek4HNjDxsfwdj5nNnqvmczJMoBtcnrPzan4bRvkZg38VbkEG7DbBYBnn8o9eT6VLdAxri6mo
	7GaF2IVCOB6n3NLAOBiAjH1G+TfMx1JNW1hVJLSMxg5MAtlaHolqmVZznhX2WLdKhyLf8I68WsuOe
	pXu2Eq95o9KzkK415o+JrbygXZ8cZ3pXzVP28afqtV7vdr1EW+hYLpW07RGK6ZbreaqxWMzBmk5kI
	lYfH6Mbb5x3Q/lglXPD2BX54GWvriH3HOGtQWT7WiaREBnAPVDoiBetPA1K9EFp8QO3DGUApx2e1F
	rR8dKbJRDLhNNxxYVAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5Q3-0016dQ-2w;
	Mon, 08 May 2023 18:17:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5Pw-0016c8-0z
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 18:17:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98CA461EB2;
	Mon,  8 May 2023 18:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6522DC433A0;
	Mon,  8 May 2023 18:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683569819;
	bh=05ZEnpDryaZ3pWwm2uM1BaK+nfW//+toX2uQFMeA9T4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HJGrfWGsDd1s7R5AE+0X9NTaSLnSiTl1CDjI2qlfcq8hhAqOCmAzMcydtEFIvBxYf
	 kEQuQgx6k6zACnTIy2DQIAThvlziT4MzdAtavBoIJ+AoY6AMxPuJU2dXPxW+YKuNqX
	 ZcWyVTekYnD9VAlWfQ/qEk0odrHvs1Z4RfkKOJ84kpsCTlZja+VwTzuSkmWSxSUY65
	 cAt7YdetUsJq7H6vdJPHzQtJoEEzngINLFx80lTw1eJvepAaziMwmcfh8NXI2fXban
	 nScP2fYPcgIYUuIXBjKAceSEWgoe4x2zOVy7EpGAFoQeSPnkxqFwFQpSmiPXRRgqHR
	 h0Yt4/U4EPHrg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [RFC 1/6] dt-bindings: riscv: clarify what an unversioned extension means
Date: Mon,  8 May 2023 19:16:21 +0100
Message-Id: <20230508-decibel-fender-532248c8f8ed@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508-hypnotic-phobia-99598439d828@spud>
References: <20230508-hypnotic-phobia-99598439d828@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=pGmr6rcDfQk2g8LcKq7L3T1Gg5LY7Zpc7WjhfhPcmv8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmRNqXs1UuN814vn8Sa0ftPPlY/qv0kw/MDHrvlzNnmL fZ+EqTUUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIkYqjAy9C6zY3LI67n333be fu4JGzQVn7mGCx7aetLUcHrggz8Z6gz/E/Ncdueu3ZM/WX156Ko9SwoPMs54b6hXwKaUckDT+Fw 3NwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_111700_409074_06A3F249 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

C'est la vie, the spec folks reserve the ability to make incompatible
changes between major versions of an extension. Their idea of backwards
compatibility appears driven by the hardware perspective - it's
backwards compatible if a later version is a subset of the existing
extension. IOW, if you supported `x` in vN, you still support `x` in
vN+1.
However in software terms, code that was built for the vN's `x`
extension may not work with the new definition.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index db5253a2a74a..405915b04d69 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -91,6 +91,9 @@ properties:
       Notably, riscv,isa was defined prior to the creation of the
       Zicsr and Zifencei extensions and thus "i" implies
       "zicsr_zifencei".
+      For the sake of backwards compatibility, an unversioned
+      extension means that the hart/platform is capable of
+      supporting version 1.0.0 of the extension.
 
       While the isa strings in ISA specification are case
       insensitive, letters in the riscv,isa string must be all
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
