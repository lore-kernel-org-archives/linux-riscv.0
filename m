Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DB3CCA470
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 06:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=711VDfYTl7AxJLRIVKKHbIVv7oYo91u/kiFkRwJd2BQ=; b=M3nOtYLWYze0Ae
	X8nTY1U0hB8kpF79H5RvgJ6jJMmwgMvopbJ/tbN5RmUVL6hr0xhxQc9f+QA/cuZkuV4CpGFJJ+y6G
	79OZjv/pb1tgOF4roOryT8DwuuV/VMfHXZuuYzPcI3PH6toNJwtp0GMYQg+2y/Iqfn5c/OP5C1CKd
	0ocb2BFXpYUDAf5kdM+O6DotwIZht5Wz2lTGQrflRluCcoE1n/Qp03nHodw8bWFE4lYYs/zwDsS/C
	/Znjrfg3M4IqDZg9JHILdLMj2YBvsVxD4qQ+jZQKKIoiTiHnBlXY/lkXUriEpG/+Nq1cGL11bGcf1
	rthJ+iaVtnzn1Xg4bftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NYF-00000003HPI-3kra;
	Wed, 08 Oct 2025 06:21:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NYC-00000003HNm-3rKK
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 06:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74AE044755;
	Wed,  8 Oct 2025 06:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF1BC4AF09;
	Wed,  8 Oct 2025 06:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759904484;
	bh=8rVARVTAwnQ6NUnob2aCJQPizeqIDcIbjWNLbok4w6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CmTd1OB4Y0OTcrLx7J6hk2Dqhhj7WN7/OUNWbCHXsDXDLlEEtSqwSwxBfbwYKdv9L
	 +PELnMI3M5MkTgIcpevsi9Vm9XDSwY2aZ/wtRZb4ErLo3bVTOTCJIkfUq2Ci1Rzjo7
	 5rvlqS+js8vp10tWPM6EkCAjGhZ8BLyL9t3dB4MwITOIu2DzFpt/xR3TCfLrDfaDkb
	 DiHKKLTx74df4d9l2jO6+iYIcvwePvZMc7f2OSF4OzSJhKX8JM/HqZ+BNEtGRS3mm7
	 y1eylRx2GasqRdlWh/H2DhINxHR61YqDEdwfY9qpBiZZ8l/snYV/dDspwRTfdn/4bl
	 J9ZdKmjGlhIpA==
From: Drew Fustini <fustini@kernel.org>
Date: Tue, 07 Oct 2025 23:21:10 -0700
Subject: [PATCH v4 1/3] dt-bindings: riscv: Add Ssqosid extension
 description
MIME-Version: 1.0
Message-Id: <20251007-ssqosid-v4-1-e8b57e59d812@kernel.org>
References: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
In-Reply-To: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 James Morse <james.morse@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, guo.wenjia23@zte.com.cn, 
 liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Drew Fustini <fustini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=fustini@kernel.org;
 h=from:subject:message-id; bh=8rVARVTAwnQ6NUnob2aCJQPizeqIDcIbjWNLbok4w6Q=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMWQ8Y3r8Qc5S0Dgx+l3IV85ZJuln1x2cKfXrTv3X2WeNt
 p997LP1c0cpC4MYB4OsmCLLpg95F5Z4hX5dMP/FNpg5rEwgQxi4OAVgIn0ujAxHj/9NzWtT/jDB
 /YfojCrP8zMcMk5dUHZXr+XOTb68clkhI8NBhS0xv1IyQ1dVR70+ON9mbRMf209Jj75phzQVlN9
 PkWYEAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_232124_989509_A2AF3B75 
X-CRM114-Status: UNSURE (   7.54  )
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

Document the ratified Supervisor-mode Quality of Service ID (Ssqosid)
extension v1.0.

Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index de41a6f074d3af2ceaf5293dfe75d16f43d416d6..27d0efe72e0fa436c0796550ef126f1f17c36541 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -165,6 +165,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: ssqosid
+          description: |
+            The Ssqosid extension for Quality of Service ID is ratified
+            as v1.0 in commit 5059e0ca641c  ("Merge pull request #7 from
+            ved-rivos/Ratified") of riscv-ssqosid.
+
         - const: sstc
           description: |
             The standard Sstc supervisor-level extension for time compare as

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
