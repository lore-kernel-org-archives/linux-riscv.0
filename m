Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86580D2ED11
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+LOKkVulrQpuqZhEEeKM2nG0Nqidh1zv8JXmfM6A4w=; b=ccg/InvkH9GRld
	sYGJ6tnJhLnQG37kDICyBrShVO5rcUJtbM+9LOGkjwiSN+VnBXWGpigTpCa2TDPQt03OEqMzlGwcz
	AG2x50NX61s2VuHtuzQ43M3n9wrWPPL0q68zRiqDO9k0o7sQAvu4CMDa+dVA7ir0TIKKhOnEdv3b5
	zR3zOEVhpqGMxY6cauq74ILTX22Lc2DtfijYg0sv+XqI46xWApGaYMbWBVCbx9VVrYpncFFmJEJ1+
	0LYqUksmLTLFIGGx99Pfp3XPHZnTqqOGgLGRQjP9D2504Ih1xoj9yaGrDo8JSLHHLZxBf+S+YDLcV
	HA8X6KMfM0+VoCLnxH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39i-000000039Si-3udH;
	Tue, 20 Jan 2026 04:15:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39J-000000039Mk-33S8
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C06C60160;
	Tue, 20 Jan 2026 04:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770D7C2BC86;
	Tue, 20 Jan 2026 04:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882524;
	bh=RN9LOBb2Q5aHVScQAnVGdCBA9dhEyBoY6qpcRx7/gOs=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=ibALnT31IaRWqMCGHNDwcHyS4zY3PSOEdYb8NpS5lFcY9V9AQeIfJA2MNUOWdVPtP
	 wyj4P9oSyvIXD/15cPtpJwSySspLscah8p/lnpuHvXZEI85EKPrXpjLk+zD33TxEsw
	 EHnQr6ea1HUSUyEiaNWdWHFBEMzPGqb7hEzz2cyMZnQXxYQOqA32mx0gxcMDD8ctGj
	 U50pAXE51MWcZQQtDzQF951X0vIB//j+f/InQulIwnKdQXW3yZgzaG9oArYLSXu2pz
	 Bpf4UF51bu52DKbecRmXPwjGMafftEKpEZa6YtZKZ/nCYIW5BinTsiwjTnFAmUHQCc
	 cQsndQKaXlmKQ==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:50 -0800
Subject: [PATCH RFC 13/19] dt-bindings: riscv: add riscv,cbqri bindings
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-13-aa2a75153832@kernel.org>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
In-Reply-To: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066; i=fustini@kernel.org;
 h=from:subject:message-id; bh=RN9LOBb2Q5aHVScQAnVGdCBA9dhEyBoY6qpcRx7/gOs=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwZvKFxgcutym03sq+CM7AXrjIVjpl3U/3o9LfXz/
 danM1VvdJSyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAm8rmO4X9BzN0toRZacQzf
 96rcrT4tKfnC6njW3ZzSqS/jBRbaS51hZGiMPee4Z+38us9bFs7YbRN6YIFugjWX0duHVdEvGlX
 i1vADAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

Document properties that can be used in the bindings for controllers
that implement the RISC-V CBQRI specification.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 .../devicetree/bindings/riscv/riscv,cbqri.yaml     | 28 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
new file mode 100644
index 000000000000..7d0482c31a46
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/riscv,cbqri.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Capacity and Bandwidth Register Interface (CBQRI) properties
+
+description: |
+  Common properties for cache and memory controllers that implement the
+  RISC-V CBQRI specification:
+  https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
+
+maintainers:
+  - Drew Fustini <fustini@kernel.org>
+
+properties:
+  riscv,cbqri-rcid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The maximum number of RCIDs the controller supports
+
+  riscv,cbqri-mcid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The maximum number of MCIDs the controller supports
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 96ead357a634..2c9151e34d2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22509,6 +22509,7 @@ RISC-V QOS RESCTRL SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
 F:	arch/riscv/include/asm/qos.h
 F:	arch/riscv/include/asm/resctrl.h
 F:	arch/riscv/kernel/qos/

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
