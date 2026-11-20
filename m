Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD54460A261B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 19:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y7hfzx9O;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WNpOCbH5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G1G7qdPqDTUv8tSsJckpYDVJx8UFiRERZvZ78iovXRE=; b=Y7hfzx9ORJxad8TNx8Aa2tD5Xe
	FWWBjQvxcwFwskXMubyN74e162et/UuT3z+O283vnl0PRpwkeVh10U8m6WWx9oOwbY+1iANyRPBZq
	yAw92V/x6G+4Qfm/6fbJNMvY25HU+j6L9mnX2fcdpeJF1v/A6Q7gvSGsjYQdJRz3u5dZC5f2fZeXF
	yHm2bZZKB40xhFAWxm46nNB6KpB64qhOe1O8zdg5FbtriqasPGG5pc/w41x63EW0hziEsM+XOfv1s
	/Dv1AUFpA9hR8j7KTMlOdGVP5oZVB1m4lP5RZ5ppQkbnbLEOa7wJ+PiIycg2XHuUSsHlf0Kw2xkxk
	zburH1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6N-0000000G2HO-0K6V;
	Fri, 20 Nov 2026 19:16:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6F-0000000G2Cu-3OFZ
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 19:16:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D6EE43AAB;
	Fri, 20 Nov 2026 19:16:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795202203;
	b=sdH2sNFagpKz3+yCeGJvMaRdwm5E0hAVFgltqji8tCSJsc4oB1p1/M9/uSdrwU1PPUOh
	 khVgYMICNFapfskfAgM5+LM3U0Bnf+3ECJbeL+OH/rLglQybRdW/WOZhHajAHT4R9nPnT
	 RbX/kpJwSU/WdU4cPGKpkt1GhH2JqT58r+g596IMXZ/qT5x/TjMd+uXHCr0Z3MLpTKQ+u
	 fiCsJxAIZscyx7TfYZFnLpajp1eIkEaNksugds64NI5ITB6itq9MH4riWFV1yAxS7P4Br
	 ayrp3qPqfuNNfTfjdqfYvuSiTvt2IHhiovZdkK+1xsV9jLITNva8aJF9Ht1/f7lndmg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795202203;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=O3an+/q3JaFkFvnjOlTdpdXG9frcgBLFrKEyJdxf5OE=;
	b=Zjp93Gv44i69Uvz8LkuFgnKO3ZJI0iPDYoqgP+1rFhLPcCE6gUEjUQY/K8DV5/kCmSnp
	 wfGrU9VTim9ZnMAItEh9nBabypfMBcgpbbudU6lU5ipcKxlpz3/b/RhUpuf+TnO3t3/Nu
	 huO76xT0+VC/E9wBt52hHFOHAQ8LXCglL1kCAt0fbUUfKdLIxSrDhhPHmEnFu/ZP6z9UH
	 vEo6Fky3XHR5cB0J59wPhfHPXhfEWsmavUyEMbEqCJeFwsoGfNDJMBfGYh/LZxFl4Xu4x
	 rQHzQkf/IdLoGMTuyx6g81ErEpzUy/dqTvlPL64en056VzdYcOa8khidzWm4yDiFmLA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF3791F000D8;
	Fri, 20 Nov 2026 19:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202203;
	bh=O3an+/q3JaFkFvnjOlTdpdXG9frcgBLFrKEyJdxf5OE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WNpOCbH5XqOdMbARcU85bkWY1aIGtmjgIBB16zB4arMwB02QV+D327gJcVusOLpu5
	 zAJSw52r6jdc+oAghgJokaOlwjDj2Cq9VNnU3O+cI0FgSyA0KLLROYWVjzuX9e80ja
	 kgqT4Py0akeZ4tZmMqSl1cWB3ePcCMI/VS+cClkXRqMjjBonoffXuOPHV82/ClFZh5
	 FhtbsYtkpzhMeCyBm1Y0pbaSXh9zFW/Jx+k7HaOEUtc/0IXLjXNaCKTLYZ9KjPFUEV
	 YkHG34zcZqf4O+2SFFaoC360sEhqRE/9QZKoFF3a3u6dzumG/2QaG3pACdl6Iaaj/D
	 4+5aeQ3mebkhA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 87AED4B9CA;
	Fri, 20 Nov 2026 19:16:24 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 21 Nov 2026 03:15:51 +0800
Subject: [PATCH v4 05/13] dt-bindings: riscv: add Melon Pi V1 and V2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-a210-scmi-v4-5-4a795a0a9fc9@iscas.ac.cn>
References: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
In-Reply-To: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-serial@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795202181; l=1374;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=on0k3/ROjA851j7Dksi+n9Xdm06/pOAfayb1Q0RsTuY=;
 b=PP5nWJ3gOvrjZtkB+LPtY0eHwTGyaaIIuDAiwuVFqZwdxmCsWEqEHb149VJc/Tad1Cfi/BiST
 JdzHQ2HJ789BkuWUYUrUI8UGhtzk8gecqy3H3RKS0flrCKxQC/n07TJ
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add bindings for Melon Pi V1 and V2 with the A210 module. V3 uses the
same board compatible as V2.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/zhihe.yaml | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/zhihe.yaml b/Documentation/devicetree/bindings/riscv/zhihe.yaml
new file mode 100644
index 000000000000..aa778275ab5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/zhihe.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/zhihe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zhihe SoC-based boards
+
+maintainers:
+  - Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Melon Pi V1 and V2 with the A210 SODIMM module
+        items:
+          - enum:
+              - zhihe,a210-melonpi-v1
+              - zhihe,a210-melonpi-v2
+          - const: zhihe,a210-som
+          - const: zhihe,a210
+
+additionalProperties: true
+
+...

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
