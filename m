Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06675C87FDC
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PURhvgcnGGuBjKdIv2BICPgaQQ59T4Q086wo68huqyE=; b=H7J9s3ne7uc5Zn
	8PiRLRm1PKsmQYtFJR1XgBA957zI4XnoAbHvPD1Eh+q5VIKCQi7w9b1wkUBL0B2M32eyF/lSwjH6I
	xiWGUgFMkj8oEwlMk+nwlMppNyq5UPGLIgZNbq2Ql6Dbe58s+pnsrJKv0nVDP0wlAa1fnQ1f/bfkf
	CFHaCazijE3EraJJwgwV7Af7bIS6TyyiV7knjNToIcU5qxVvXW7K80uSjsgZKdbkInvvT91haykB8
	T+ddit5IlRg2C/mMal79s+2wnMkOfYrCm7S61/EAFPCGYRz8l2f4i4yyWpoMxaXK5l43id1iWg1s1
	UlaV8i/wjeN1mRfPINhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q82L1-00GesA-0w;
	Sat, 10 Jun 2023 17:25:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q82Kw-00Geqe-3A
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 17:25:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C76A615D9;
	Sat, 10 Jun 2023 17:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A51C4339C;
	Sat, 10 Jun 2023 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686417914;
	bh=3wpZ8o+35iL6424lyV2DUmQ6SjU6/eZ7YzznRGiRZCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ErJlmji9Custi1BOYzOMGjAI58K4rcxusnBFYJ+9i875fwP/pg5q/9okCyYp3egqx
	 gq68ML+QfH7Uw96mEvB+u6912njCHEy9yoOJNy6CVS1jqX+v+I11NWJGvR+A+yWYZa
	 arMCDeystOsRagfgbuiItdVZN/1vOeCLipkxlnHuoqjporSl+XhHNC44iFOo+ctUMz
	 YrnrLsRkGQgDP4K/rI4A+X1voa2jTnWZGccQwIltHa+P068e19sZR8tz3Ts8GSGXGQ
	 4urtmB0yAqCIVmzZ6lIXDz3U+x/Zr2WzQuNXo50NWtgaJxIF1gFCSeafLdOxBMM/NH
	 ulIy63uO1MWiQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/6] dt-bindings: riscv: cpus: allow clocks property
Date: Sat, 10 Jun 2023 18:24:49 +0100
Message-Id: <20230610-purge-pretended-a0815886d300@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610-snaking-version-81ae5abb7573@spud>
References: <20230610-snaking-version-81ae5abb7573@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=56khd3m28bySZd+RhG9G5vkREjzLjNJIdu3gjjupwM4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCktGx9UJhbyHuKe7mvttKJwMtO1NM4DDMaCBrsTq4rsu BZkdod3lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCIpuYwMHfcmPzA7naHwdvrP VT/POu8sjSs2PHN/4pKvjM9zL1RM3sXwv0Rr7mbOu2X+rrYHTy15/l027OB+w4VBHb8YnbxEDnz RZgIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_102515_058875_B0AD59CF 
X-CRM114-Status: UNSURE (   9.63  )
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

Having disallowed additionalProperties, dtbs_check complains about
unevaluated clocks properties. Permit a single clock, as that's all any
current dts uses.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index e89a10d9c06b..3808a6703b2d 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -58,6 +58,9 @@ properties:
       Identifies that the hart uses the RISC-V instruction set
       and identifies the type of the hart.
 
+  clocks:
+    maxItems: 1
+
   mmu-type:
     description:
       Identifies the MMU address translation mode used on this
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
