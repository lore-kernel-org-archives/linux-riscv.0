Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D48C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 17:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RvOaGu8UseguvMGXO8krr5oanDq9AE64C7x9i0GtLlw=; b=QhPCnav1wy0KPz
	d2bs+rKlhsfWqeoh38vmpPPte/4Jv/BYOR8tpLUFIW7t8b2tn61NbyEQQV9I4yczU8msnPr6HWqdK
	8ePqANWbiANLFwr+QgQOhY2z4gO4/bHZYNSZgzlpKyYi/wVAzldklhnWdXYMiKhKDAN0plRByHCK3
	CfHG3h5HvKe2KOUiwnlJpsmoyjsBt2ZdMDZgKsKM2Niqzi7F4DHK9sPVQMoa0ni0BBPLrR5oQMet3
	EjpFUkUCot9i9VGieLqphdHQUmSo6HbMUkodhvuPEwsizl6RtGUdSksg38fXIoxhEMBHjTD0CEsuV
	ICSl46Dbwfpw7v+0YmTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqzdv-00GsIu-1L;
	Mon, 24 Apr 2023 17:06:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqzds-00GsIT-2L
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 17:06:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E922462209;
	Mon, 24 Apr 2023 17:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0638C433D2;
	Mon, 24 Apr 2023 17:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682355978;
	bh=K3s5b8PcCEuf/EPN1XvvXhk/V3+22vKCJfwaVGjbx64=;
	h=From:To:Cc:Subject:Date:From;
	b=V889VIF09tNiMvUgztLiGZzJT6ls2KeG4pnNN6+bvYgZj9FBhXcGtQW0EZspDEON1
	 w7MaLro1giG+2Jc/1h5PbcSwPbG3PsPg5/tVOXgVJLXj1JZYTyKE1+a1vwpLLZFkIQ
	 +BhAIPp/ceSQ+UTrXfvmEnaogzG9kEJfxddHL7F/mtXsMVlP9aP2NC7Gs04tRv5R3Z
	 oISQo4vyQPf7CH0g1CgSoP+Fg/Pt9N1LcvfHlNFGTac3/bVAQRYoRvnzMF7kNNUJhH
	 D9Zv1+TFxqSKyTASKg4c/WkyFXegft8+yDsZM2lAIEhRhscNl8FQWL3tJd9CxZdqjw
	 w/Rmlk8hxqM+Q==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND] dt-bindings: riscv: add sv57 mmu-type
Date: Mon, 24 Apr 2023 18:05:43 +0100
Message-Id: <20230424-rival-habitual-478567c516f0@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=8JZJ6HmnuSAkNfOWr+4ZL5dzb89sjxCC25kT1YWF1Gw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClu257mzXFIUOI9JPvDYF+AXj/v69wPMswaIUUbksyvv +KvjNfrKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwES6HzAyHFjLGSS8tTFm3qvd TW4t16tqQ+rcNI9uC//cV/P2qLvYQobf7PqpstlxgobiM3rMyx9sb2r7wyzM/0fht1DNQV+jecy cAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_100620_826090_B0A5D0EE 
X-CRM114-Status: UNSURE (   9.60  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Dumping the dtb from new versions of QEMU warns that sv57 is an
undocumented mmu-type. The kernel has supported sv57 for about a year,
so bring it into the fold.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Resending with the missing CCs.
Palmer, you can take this for 6.4 if you want, otherwise I'll grab it
after the merge window. I doubt there's a rush when it's been missing
for a year or so.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 4c7ce4a37052..25d6e8dbffb8 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -66,6 +66,7 @@ properties:
       - riscv,sv32
       - riscv,sv39
       - riscv,sv48
+      - riscv,sv57
       - riscv,none
 
   riscv,cbom-block-size:
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
