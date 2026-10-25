Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5318606A320
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Oct 2026 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hJiICk5E;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjzqbHqI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QE9HK68rxauZp1MrlkVHet2rSy49lJrOrg97fO43+mI=; b=hJiICk5EvtV8uTc5xM5BX3VUP+
	fq7ZnH/UTCTe03cLfWZanPBZlqNbOQBpgl/3iHl/aKQRy5ZQINgUMDMB3lzGoDR/jnZOaX+T1cXLq
	GqpoQvIZK2pDp+SXmNFR17CGjFAEEI+lV8DYqX1pguHHllYJ/LVh2UMIy4FHVCgNtdBepoSQ90iub
	tjsjybQvZ+kcFJX428y9Oyd+cyVgFlnoTraDQn2UD7lHWS8YvgP/Lc2NsyAu7xcy3hBima3eH1Np1
	YQwO9e3m8HSDr8kpcPtHEOapmUaiF/0u7t8dYGbyNOw37575u9JLsFwCut+xqz+k7z2EiabuYYsG/
	KbBPu58Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKxGm-000000011zf-0Ols;
	Sun, 25 Oct 2026 12:24:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKxGk-000000011yh-13xn
	for linux-riscv@lists.infradead.org;
	Sun, 25 Oct 2026 12:24:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29B216022B;
	Sun, 25 Oct 2026 12:24:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792931048;
	b=rnmr/2diCnaJERe2jpE6rpRBhIMBQ4ftwNKLisghfjZxyxw5VBmwK9f42JOO2m4VgmCJ
	 YJu15Z4GiMsdnKUtHnyBzT3uO0fcRo/UuCex2Se9CEfCy/Jw9B+B8UScO2BcqkJGDghgR
	 YWIvPuaoZJtoj+uUDbjs/5QRZG2ulhRcGj9yZeuDcDVuybaFPT9W+u5EI8ytp77so4VsI
	 973JiK8156Tj5AMbf5bSTAIbG4ZeVAnDkIRDibnBGpyqo+sIXfD/+Eq9wStArLRE/LAkp
	 XowM1viA4MQaTQCbUBbeHmjG6l3aNcfz5g/O+mGW2xkM0sfGK1HN/kbqiic7VYsJUNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792931048;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	b=vFiPlJJ/DdTAajNvkIXODLQzhzA9BRTj46Q+TBobUCF0jpId3jObqNIMNfvZWKhn743a
	 5KqZxNBxmDtRdX9Vyl1B/sCU1oLPuvA9AZPJMwH5XLPGvMu2MIOYAV6Gfh9l43mo9JRz6
	 JSIxCkI3zYng4owf2alHzBdNJPzACa9MR7zGDcDo7A0bP2xFeBEPyFv7Lu8SyMYHH+7GB
	 jeFLBlmuurU95zuzf07+0n9UEDWTgcvEKqwft98JCwKei3f3tpgrU+GRbuJvpeCtX+nba
	 YIUk0J5tQhWHLqChrTH72MWyPx15GOtkzEpsadW+nGBrXco70KVVXGVQunPz5u5Wq/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B240E1F01829;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792931048;
	bh=ED5DRsIqnMgHvn/xcDYBb4fi+k93STwRusfKqXDCoZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YjzqbHqIopwwRiird3IIEb9lP4Ac0sM1vhy2LXGcblqn6iYlfy7Mtp/FqezuHIy2S
	 5lo845hfe5DPSpIuvI/wxxPQpyWkfw0UskLumpyg0ctYDHReN4iDodF52qQcgEE7YK
	 ya+wzzRJRSbolO8cMsOG/BmBdU8sngrbxxiTShCrtulPtvmhcV7Z/YS/HK/wHcCR0c
	 mwCMI5STg77Ez30vpWxM8rfudm5PhkXi3XauUIbtu9tpaC3BL+Ey86F4f45DgfypGX
	 rzyBOq1L4XQ/rNkA3AQ4sdruvf+AXgwxjqRYGKYjno4YwN9BoTcfJLLeE5k0Put6rD
	 /3LtTRNLZrcgQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2CE3A44A0C;
	Sun, 25 Oct 2026 12:24:07 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sun, 25 Oct 2026 20:24:03 +0800
Subject: [PATCH v7 3/7] dt-bindings: riscv: Add UltraRISC DP1000 board
 compatibles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261025-ultrarisc-dts-v7-3-621eca2b8790@ultrarisc.com>
References: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
In-Reply-To: <20261025-ultrarisc-dts-v7-0-621eca2b8790@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792931045; l=1942;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=F931PJB7CYQDP8Qv71XY2lbmZu4qGdN+Fjh5HxV88EU=;
 b=x3sj9cxqwwazyJiIe4+NtnKNCGysuZOXG1R0BLXwU5KXu6hkTBBllk8Oy86Zfw2Fl1kSAMCJb
 LLbH1Ym9K+cAzPWShVDg6Rt2plj5D3BapNtGSyg77KXs7zoXmMJTCYt
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: jixincheng@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jia Wang <wangjia@ultrarisc.com>

Document the compatibles for the Shenzhen Rongda M0 and Milk-V Titan
boards, both based on the UltraRISC DP1000 SoC.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/ultrarisc.yaml       | 27 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/ultrarisc.yaml b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
new file mode 100644
index 000000000000..a51e63dbeca3
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/ultrarisc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UltraRISC SoC-based boards
+
+maintainers:
+  - Jia Wang <wangjia@ultrarisc.com>
+
+description:
+  UltraRISC DP1000 SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - shenrongda,m0
+              - milkv,titan
+          - const: ultrarisc,dp1000
+
+additionalProperties: true
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ff1c1aea9a98..7eb1b2971bea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23639,6 +23639,13 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+RISC-V ULTRARISC SoC SUPPORT
+M:	Jia Wang <wangjia@ultrarisc.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+T:	git https://github.com/ultrarisc/linux.git
+F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
