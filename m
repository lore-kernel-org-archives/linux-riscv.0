Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A993CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 05:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nh5KJO7VC8ZS438IyV4Rek9JrPaHZViN1hKe/+9azEo=; b=w01Xi59QWKOXgy
	Ae6WwBaRMgnlzZoA7zR1tAY0O2FBU1l5D92OdWwOp5pJ+t4VNQZ+8MUzipqQV8dAvkMkDR5iJUnyz
	fIyr/uezRD/28s5/UJdWczX7RWmvd3pjDtKoOTb0h7D0zsnCs07tzgXe0Otw9/vZICTTLvLJenbPc
	0CfLkQ7weCJpOk3m9eQYU7VFeO77SuvU7JItf0R0uE8HvjXUoxgK8zyjWFD2xuxcvbHo+fGm+Oivt
	h9Jc2fwwE3o4mHlpA63zv8ASLTSK9h5NlQzwNR89oXXoz1kRsow7qkWqUl4NTM+FErDgaGsm1/1+9
	z+KZqU+dPP5kb+vQ5KeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyO3L-00000006n6c-3prk;
	Tue, 16 Sep 2025 05:16:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyO3I-00000006n4u-0YC0
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 05:16:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E130143E05;
	Tue, 16 Sep 2025 05:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A69C4AF09;
	Tue, 16 Sep 2025 05:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757999786;
	bh=Azo2XfPipP/QNg0jNi2mu2/SW3/aSQz1jPCKvUHMCJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VYAcEnnPHuGlqRJ2ZbkbyolzOLPvsS1RzQB/VwxL8LLNgzvItpykXT5WsVSYEjo2v
	 LN80vO9Og4CElbDtzyfZQwlITQqtRG3PG4xaRZGioFD3BK1jfIOsItyFkZLpaOHR1k
	 FG0O9d9mhva+WXCAULPHhX/55lzDlZqBTsvughnwy6my723HjKuUAKAPiuXHDdOAwm
	 T6ExgZNXypCyn5p6Yxo7LVDoZr3cUdrBDPx7AWnRLAfBrdJkF5k8exrRxmpKgWPRh7
	 o/WUODpWhSQHSQse6RbL59TVrF9pOj73EA2Ry9f1l93Y+PUfD41+l7VvEaWGtTi6jT
	 F45IcWc5AJ8EQ==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 15 Sep 2025 22:13:41 -0700
Subject: [PATCH v2 1/3] dt-bindings: riscv: Add Ssqosid extension
 description
MIME-Version: 1.0
Message-Id: <20250915-ssqosid-v6-17-rc5-v2-1-2d4b0254dfd6@kernel.org>
References: <20250915-ssqosid-v6-17-rc5-v2-0-2d4b0254dfd6@kernel.org>
In-Reply-To: <20250915-ssqosid-v6-17-rc5-v2-0-2d4b0254dfd6@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 James Morse <james.morse@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, guo.wenjia23@zte.com.cn, 
 liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Drew Fustini <fustini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=fustini@kernel.org;
 h=from:subject:message-id; bh=Azo2XfPipP/QNg0jNi2mu2/SW3/aSQz1jPCKvUHMCJc=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMWSc+LSy/HfvZuke4fPaPcaeh2dyvC1ZvMrnGY///KWna
 uueRz8o6yhlYRDjYJAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBMpKuR4Z+108oGVdnzuRcZ
 GWxn/uHjrZ6/fbfa95CsKXe5D3otz4ti+O+qpXZpnsSO3e3pnyT4hT4c/5LTUe+wX1mKl9+2euV
 bNk4A
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_221628_210829_D1E94A07 
X-CRM114-Status: UNSURE (   7.71  )
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
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf5347d92785dc085a011052c1aade14..38e3d8d38cce55022ea70eb52423b1163e3cb097 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -165,6 +165,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: ssqosid
+          description: |
+            The ratified Supervisor-mode Quality of Service ID (Ssqosid)
+            extension v1.0 which adds the Supervisor Resource Management
+            Configuration (srmcfg) CSR.
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
