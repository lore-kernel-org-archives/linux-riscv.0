Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E900C4450B
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 00:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TmRcixpF1rbAbYv1Jd9r5jdDwsG4OTff/70/zEMJQAg=; b=sODTLF2fQrISol
	JGAgXnR0fQr9TjxBXUwNJvNDGqMCfwff+SqISNiKSVAJgBjVTn3OvSXljzGS989DTDJlosooY6LKj
	S4iFfQQgSiTf0kR4QhCX8LNn9rJRyTq28cel5foX/ECVKf78oGSwzfwbiKJ69GeZsuMXw9Kokn7HT
	3yJmh4NNNXNGtCuGYUljp7KxTUAe5dFIELnFOVuUvfMVz6JXzWCEXNY68TYYJojuX0WoLCFbqZXKm
	6aeNUf3IxWVoXBXSusbrcfPZNACzaMfXkknN6xqPClKOZ0/5Lq3Kw9nnNb1xm8Q0wffN+GdTCOzoe
	MG2TX0K89Jf5PebiXQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnPh-0000000DUf1-0YKm;
	Wed, 15 Jul 2026 00:23:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnPf-0000000DUeT-2kX1
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 00:23:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C01D2411CE;
	Wed, 15 Jul 2026 00:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFE11F00ACA;
	Wed, 15 Jul 2026 00:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784075026;
	bh=YDA0Kty7PQNT08Qk9i1E78Ah1lcxCYarON76a0LRZ+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iVE6HD3RFWcV/W8PADwEm6ZJVJoOB2cQii4UyA0zs+rpBSx7Wqb+fHFV/NVSKd+Qa
	 iFupWMYkZwrE/XRBjVypZz7QBnX7haRf+Bgb88540rU2wU1fgxkUs0Ge9u4G2Dh6Oz
	 7kZiHPlTtPafUHr51URy+WjpmLLh7JaQJnC/HqthkSDeofihvOnteB/vk7y+yjtHmz
	 IcCqrQNnNvF2BG+sFDb6haZy0DADu4hvy5yezCdZfAm8Ms6qg063gbCjYsXNaGeWtw
	 Qwrmj+zqZLSJ/gYl4jgY3YwzOmF2aoceoPHyxT12beK0tveZq/I0lxBRFseUGiK1mH
	 273QDOHTQj5YQ==
From: Drew Fustini <fustini@kernel.org>
Date: Tue, 14 Jul 2026 17:23:23 -0700
Subject: [PATCH v5 1/8] dt-bindings: riscv: Add Ssqosid extension
 description
MIME-Version: 1.0
Message-Id: <20260714-dfustini-atl-sc-cbqri-dt-v5-1-b0ae7e9c932e@kernel.org>
References: <20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org>
In-Reply-To: <20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=fustini@kernel.org;
 h=from:subject:message-id; bh=ebgjBWWGoiz8bFe8aM1k+b6Koj+oeRqpY3Kqeizgd4c=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWSFXRYo8a/yDzd+sO3LC/Yqo977K8tizzE+9rApYgnaJ
 nJ9wuELHaUsDGJcDLJiiiybPuRdWOIV+nXB/BfbYOawMoEMYeDiFICJHLNg+KdvdO3V7hkbnQ/s
 LzBTk+XpsihetcPLMSztbPhOhnPS+v8ZfjGlSWaFCf/WSGRf1L197fec7giZsw8vVs0Iejd/3qV
 fm/gB
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

Document the ratified Supervisor-mode Quality of Service ID (Ssqosid)
extension v1.0.

Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c0..c9dc5d80c0ea 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -232,6 +232,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: ssqosid
+          description: |
+            The standard Ssqosid extension for Quality of Service ID is
+            ratified as v1.0 in commit d9c616497fde ("Merge pull
+            request #7 from ved-rivos/Ratified") of riscv-ssqosid.
+
         - const: ssstateen
           description: |
             The standard Ssstateen extension for supervisor-mode view of the

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
