Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3755CC5B572
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 01:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THw52tbnwWagD7Ady0LJHrJhpdDVxLXnPL8EulPYjX4=; b=etKL/xQyCIdDkC
	0l52l/Vh6L/MBAuzmm1QlnT/SqJB0xqBRspUL37Jb7O16yf36gRruY/gYulpIG5FpvwFybkr3AYuS
	B2uE9afg0kXfrb/yY79ooJTLycds02zNKQrWi7SE95HosVVo/WZQKmYnLXnlvnmws7sbB8kgyTLJd
	0k/hGTRE/KRX+exoBCFqRG9l6tD0tgMCZ6wwe/+yeZ4AtxkKEGWsLiStlIFKbzagMPCUZK3YD0f9g
	Pb1lgFmmE99Ijj30r+ceWd7RsvWFzPvHW7KnSq7rQ4FcHEs5TIoA0fPiQJLWXR1QZOSNjyodrLvs9
	PmGvr5n0B7egsyWSH3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv3ew-00000003NpA-3yzu;
	Sat, 15 Aug 2026 01:58:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv3ev-00000003Noq-2QYv
	for linux-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 01:58:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59BD043F8D;
	Sat, 15 Aug 2026 01:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6481F000E9;
	Sat, 15 Aug 2026 01:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786759085;
	bh=dgce77xdNfitZfY0amw8Yvco94fWO4s0NDx9JQV8Lxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cSBHaE7eO5Vpz80IyRGuFkOmzCm3THDxQ9yyAEbzahHkpJh5wAEwedG2tlKXuZw15
	 bZPZTRG+Md+7sGN7zXW7sNRURkpjc6OnevHM2jZTicDuv/ereL5fBmQ3LJfUNCE8Af
	 rqiawTRg07V2uGyJnei3SqJR81yd8h5gPREeiaRFCyxpPsKy7drB+MC+bLtDyLt70t
	 aH3aQuA0TVnfp7IdEDDkbtndMqDeavhH4gY1gafp8xC3EZKFqxziCTJOFGhsDnghgg
	 pjMVAvAjYPWRgHXsDV8GXg9+9b7DLd4qYDAdi9fjrFTPLNtD4SB7+3q5g/mZ5iK9v/
	 9oTrWcTn78k2g==
From: Guo Ren <guoren@kernel.org>
To: robh@kernel.org
Cc: devicetree@vger.kernel.org,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	conor.dooley@microchip.com,
	krzk@kernel.org
Subject: [PATCH 2/2] dt-bindings: riscv: Add Xuantie C906/C908/C910/C920 compatibles
Date: Sat, 15 Aug 2026 01:57:22 +0000
Message-ID: <20260815015722.1736831-3-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815015722.1736831-1-guoren@kernel.org>
References: <20260815015722.1736831-1-guoren@kernel.org>
MIME-Version: 1.0
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

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

The RISC-V CPU bindings currently use the historical thead vendor
prefix for the XuanTie C906, C908, C910 and C920 processors.

Add equivalent compatibles using the newly defined xuantie vendor
prefix. Keep the existing thead compatibles to preserve compatibility
with existing device trees.

Cc: Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..5aba1e8ed195 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -67,6 +67,10 @@ properties:
               - thead,c908
               - thead,c910
               - thead,c920
+              - xuantie,c906
+              - xuantie,c908
+              - xuantie,c910
+              - xuantie,c920
           - const: riscv
       - items:
           - enum:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
