Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE01CD0408
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 21:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T6uCSreaXpoUa0+TfLXrGCW3nk3X/ZPlkSvc7ePw3Ho=; b=ziNgw6KJlJyCXt
	sJsLu44j1Nw9PbJm0MU8C/lTjX0p/8MijBgQVzMmA0L9w4OK6lRdRUICyQ3+UWRQ7QWLrRGhnaNUo
	Q1pn5xFo6q8eg/hKaAfyrbzPcv71CFd+S2XlHUhGgVdCM9bsoHvjJGvXFwdBRhT7Nl4zxaCsYtOkg
	EJpxm8fG7hqZ5s6wJzx+7evBCVniaZAbB6bGrB5/KXaG2MKHrrItQkHOHGE56tJlxQTRKuH/LfLT0
	M9nKHNaslSZm7ZOUnn6nVkLF6FnCeYGtAatwjRITJAvfkEg+1LnTFpmlKTLhQNYWbr9EDDuWG8IpY
	JjgE4gjqlLUt3DxRNHzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcs8a-0000000C7kn-2e16;
	Mon, 05 Jan 2026 21:29:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcs8Y-0000000C7kJ-3925
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 21:29:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11CFE42DC1;
	Mon,  5 Jan 2026 21:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47D6C116D0;
	Mon,  5 Jan 2026 21:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767648553;
	bh=v0iLNjXRbKOhcLt6AHcmqsxeTt/bDlNtovVlwPMyNOk=;
	h=From:To:Cc:Subject:Date:From;
	b=N5IZreI6Z4MpkjQ53rDYo9dksHuvPSP0yTqnQ8vndIM2K7uXp/FpMyIF3CCcGJLkx
	 84+RNEHWxPjKpbAJAZ7R3S6EDVjY1ROlqhCMV9X0loGh6iNV3gOKZCqH6MHxdmsQ1W
	 Zw7CId0kE82hahW+rDp62SyUBSAEx9fgA7T4fEISZPHUODg7Sxv8K9rqS0U4OqXjZZ
	 TOFO+yc/kmlsqk4x61aPmE/GAU2sS06Sq7wszMlk5A8c9yl9IXopZXbsl6n0cb1AC+
	 LkIjuUGTehI955/catKrmq5K2G9Mh2AmeveU9Gqyi0hqWw9cKg3SG4Myy5l2isfVzF
	 DD4XZuuZnOr3A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: riscv: extensions: Drop unnecessary select schema
Date: Mon,  5 Jan 2026 15:29:09 -0600
Message-ID: <20260105212910.3454517-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_132914_809429_4D5D42AC 
X-CRM114-Status: UNSURE (   6.29  )
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

The "select" schema is not necessary because this schema is referenced by
riscv/cpus.yaml schema.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 565cb2cbb49b..29e8b50851ed 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -24,12 +24,6 @@ description: |
   ratified states, with the exception of the I, Zicntr & Zihpm extensions.
   See the "i" property for more information.
 
-select:
-  properties:
-    compatible:
-      contains:
-        const: riscv
-
 properties:
   riscv,isa:
     description:
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
