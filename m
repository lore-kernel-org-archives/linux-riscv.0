Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8590CE8D6B
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pf4HN5sRULxxjW8PgGDtpg0k636oy4sWvnZVXzeiMYE=; b=PphK6oXd+tS/w2
	tAJQyvQ2azlJ/tg+4NeXVctW6TL5kNGPBLr5UIHvMtGeq/prelsJcSNtEY2ZrN9L2ukDwcC8G7Zg9
	nJtuKuN17n3wr8qWyBGCbUGk4984bc9hUAcwiW4RjArKCPq8X5DOvHJiQ11RnU6v++hkZmnw/9YxM
	o43gv4Jl2jzRhmYKKa91d0u1IIAGiGwBr2U5LIM4LD0LY4mgbb7AUI9o0zTs5nWwLgFzbsvrVP8A+
	ndmPqQBre6yrc+Zy0lsFdik5ofq7puTehZ9UB6gcov3L2+gmEnwePBOq9RAUEUIxuJDvxuCiBvcCZ
	Y/DX+hbPUEnTYB0BeR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Rr-0000000GLn1-0ctq;
	Mon, 17 Nov 2025 15:47:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Rp-0000000GLmg-0BF3
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 15:47:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6404A40B66;
	Mon, 17 Nov 2025 15:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FE0C4CEF1;
	Mon, 17 Nov 2025 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763394440;
	bh=tg9gK0lxKB9H8zuTyFMlLoS/1uKEOkcWEEEZpR43asw=;
	h=From:To:Cc:Subject:Date:From;
	b=kJ6C5GbnlPG5N4NUZ/BfBUiqxWdE6XButEywu1tdMISog6CK30g5tlLe9HwgYQp1j
	 X8DiQ9QA3hDGr2+YZWIBfkka2Pd0fymLI0Lgoq0jvSojNIBAwfKTP8QmLXgMQXcxpv
	 vB6Vx7LoCDEr0r0G077Nndq3LXP+breQI0+YTZP5/Yyg8kbQ5QGaaKMgriX9p4Sqco
	 WudSFLH6wV646Gbe06nsyhRdYL+P5h1iV7Ce/wv78pyqIkuIoyCs3A/bREpLcTnvEI
	 sBBjSIRuMvuuGyv0sHTIKDBk1KkEUpFd7vhgbFOlm1vUZ3HioMvIiGtUIYMlPFxDqr
	 Tli/MuSt4q9Eg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: mbox: add pic64gx mailbox compatibility to mpfs mailbox
Date: Mon, 17 Nov 2025 15:46:54 +0000
Message-ID: <20251117-screen-appointee-837a7296ca91@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wkK3E7wkvLo+bKj8aySkKKfGGzrtQFTsPr86ROV7cyk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSzrn3amfOU1p392l/vat25h0Rvm0nnl1cyxLZ2bo0V PDQ6gMHO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARtcuMDOuYo5asvuTNuPpd q4XZw2iTr4f4t5ScOOhVKLX+S2P9z1qGf7rMBvGNN86H3DdRmc4aziFbONHJ61i+TgjvssRFvPO 3swEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_074721_124440_7268D451 
X-CRM114-Status: UNSURE (   8.01  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

pic64gx mailbox is compatible with mpfs mailbox, even if the mailbox
consumer is not - the underlying communication mechanism is the same.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org

 .../devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
index 1332aab9a888..5f2ec74c1b29 100644
--- a/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: microchip,mpfs-mailbox
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-mailbox
+          - const: microchip,mpfs-mailbox
+      - const: microchip,mpfs-mailbox
 
   reg:
     oneOf:
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
