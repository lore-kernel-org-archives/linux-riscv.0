Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD75606EEA0
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qcX4whCR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FcxcNdrt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AmunYpTEChnsGC5aOY+TPDNN8crbKirphkriuK2FEF4=; b=qcX4whCRNE+BdwTENkJxKh2WHP
	i/pKG9tlUN8azdU2Y6II33Uq3//2/8BssOhCflyGc1BjMoVFOdxS4swbj4yS3QUB1d4f9s6xNkATy
	zVq2Xa+8uzQpDYmNBwAl5+lzpUMzc+67cpvczAPST736bD/P5g5D1QYvc6G1/CMzbR6RjG7DVL1j3
	4TYFlxEBsXMlBwfP0wmIWCVZU6qWvTnGUQYpyNizTyMrTiTPKBdRHPtej21JO4exsAvzv8l2UgmDm
	HjJsZc9ihAzW+r0o6ynp9CBXvjLblW2oaiHkSZ4qcUtFMBamaDNprYLnLQmNrB5qP5cc9R5QNCSpa
	0dk1N7qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAq-00000002s67-18SD;
	Tue, 03 Nov 2026 15:11:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGAn-00000002s3z-3dgj
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:11:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 94C8A43896;
	Tue,  3 Nov 2026 15:11:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718701;
	b=QLFkj55Vy+QLzLT+1BR3CwdKyA0Zq3upv76lJWDOxt6KQlAqAXAS8Ri9VSTwqWUWWUMq
	 CiF+2M35xyQvCiqoprZipj+FLMdlkrCNne72fE04YO/sXqZjZT4yjfZc0sz1bdcuZse66
	 LDYE/oEgzw8N2RmpZrOwBuE434Cln1zrs/V9pL56+bDXXLagTrnshJQgVzKrvHjrydMic
	 9Iw623lfhgZkFZdF/GsbloIr+8+g0ZChSR9YZLaGsQ2l1DLSbeg8OKVVrVaewzS7/ZSHy
	 iA0PZM3Ad6Evc7APZQKp3UuKaKyiErJ5G4wEOMnNfBfEa9b4MXLphZyDFSlAy8EsaEg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718701;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cUokIgOVgB+W2+hJDeKr5bzhJsdD+/kqwBmDbred9GM=;
	b=invTbMdS8Fqy0B+YWPhGpqVM/LH/3iaObNzAW+DdkWxJ/R4Emjy4NjD7Av4gIJFuEoSF
	 4yupHcVPw92MQ3qqJqpLrNwcr3HAXLmzBS+MqX8q+gqTWUAaAu5rVzH1gOS4WMMRdTeqd
	 ajFG5w/b4qa9B+lJldcjtikH4qI2NNNiRf8qH/8/KHIVruQRkEG7Oycpwvt9h4jaCH488
	 PgH6bIu/v8+eZJzf0ZaBECfskT3uo72KUNDzoDaRTSxzs9Gyl6jlIT4u72AC54UgwGumQ
	 2tcauGDZRXLLGcrSUciJH52+uxvdlggyil68WxLApWw+sZIyjYmiCK/wnoyBK5/NS3A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD9C01F00A1C;
	Tue,  3 Nov 2026 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718701;
	bh=cUokIgOVgB+W2+hJDeKr5bzhJsdD+/kqwBmDbred9GM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FcxcNdrtppGeprchmDfHxvK+yAM3gF9BMS6JkOmJi1KbfRKIA+2UImIhYSPaqA0M2
	 CZZKXTj3xDCTd8pPoInmfCVIHNNfz4GBy4teI2I14ZVbnqUu/3cqkEUZdMZhgBIFmJ
	 eC+E0G0GuZ5YfQNfaLOZA70h4zmHJSE5g5Q2fz8Y37RdI1Fazykkxh8O3kmj/Ej8jY
	 0jcDoHoYPBI0O5L3uxkHfp7myHX3mR0HTTzB8Nxg6e3hAj+Rze/7B3X8YoA10SdvVG
	 ZSP3yykcy67sgiz0eh+XGSiHVz/NouAYdh789/jDuCUpp8g0eutY90OH7vp0cH0smK
	 8iQC1NySfydWQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 25CF6469DA;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:30 +0100
Subject: [PATCH v2 6/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgroup.com>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
In-Reply-To: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=2203;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=9ojDRw2ccOR4cphS8nU4sj/Fkc2H8JQ/B4e1aNok+NM=;
 b=+9EZ5XPnPACGiVvPSVd/9z1er9OYivpwzQB8oRnzYBfVk/MC55Px36VDq1f0lqqSOL1uDh9gs
 kI4lOKs7JrIDOo2gVMfq4WMIKF4KDdmzJ5mPyXhHNpf6FvyOCSRpm2L
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS P8700 ACLINT MTIMER.
Extend support for both mtimecmp and mtime registers
within the ACLINT MTIMER, identified via reg-names.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index cf7c82e980f674afcf59fc726742dc4f49c1a820..40acb651c27b7eaa8a20caa8bbc225b350088810 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -21,14 +21,19 @@ properties:
           - enum:
               - anlogic,dr1v90-aclint-mtimer
           - const: nuclei,ux900-aclint-mtimer
+      - const: gf,mips-p8700-aclint-mtimer
 
   reg:
+    minItems: 1
     items:
       - description: MTIMECMP Registers
+      - description: MTIME Registers
 
   reg-names:
+    minItems: 1
     items:
       - const: mtimecmp
+      - const: mtime
 
   interrupts-extended:
     minItems: 1
@@ -42,6 +47,25 @@ required:
   - reg-names
   - interrupts-extended
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: gf,mips-p8700-aclint-mtimer
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+
 examples:
   - |
     timer@ac000000 {
@@ -53,4 +77,15 @@ examples:
       reg = <0xac000000 0x00010000>;
       reg-names = "mtimecmp";
     };
+
+  - |
+    timer@16154000 {
+        compatible = "gf,mips-p8700-aclint-mtimer";
+        reg = <0x16154000 0x7ff8>, <0x16108050 0x8>;
+        reg-names = "mtimecmp", "mtime";
+        interrupts-extended = <&cpu1intc 7>,
+                              <&cpu2intc 7>,
+                              <&cpu3intc 7>,
+                              <&cpu4intc 7>;
+    };
 ...

-- 
2.43.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
