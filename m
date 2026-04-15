Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62E7F9D0FD
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 01:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MiRYr/spc5LwgENSuOmj/47SFCFJAi1OpgPzJkaW+MQ=; b=CLWeeGrifScOpp
	xVD3W/2HtONYDNrLtvCscSGACKloUm1sbRct/oghr7TM19BxHOA4OFBTfSb4aQvaMiPsmIHmEMN1y
	aQOYc7uOFNhmuJq+E4UrNfxOuZEpF50paO3jQRuxmc0Cizsbr1mYiYsYVXNk+pK9X9/4eAhXujOAt
	Q5c+sVk8MsMQyyIFHcWVP1g2po1isnLnWbwsC/MbnlOpR2zVWbYut7sg3QZFwTbIoIeg9+h62ThcA
	1fe7ink6WSKRfpWdtatn6rxBPgex+ZJ7sbxVQxJDckF0TN9L3rl3HS6HeDMTRfXNfn3LkNzdXzVNQ
	MgGdQpxyVcq8e1u2TOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpUu-00000000RmU-337w;
	Wed, 15 Apr 2026 01:56:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpUs-00000000RkV-12Qe
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 01:56:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C70494453E;
	Wed, 15 Apr 2026 01:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2099CC2BCB6;
	Wed, 15 Apr 2026 01:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776218212;
	bh=OH+E1Lq9K6nERDXX094GRUFNVA/21b6qouU/nKLS0D0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H8DUR98kYpt3WarxzAOT92vqW3+CYh7DUM/Q/UPulhWfbdhzkkq3vdtqrqe25wdSx
	 Zj8FhFYAu8fPTb0HtWJKAJTlmiY4vhpXiUgeV8prXpQJcXizqco8e1dOEn5hSHpXfu
	 aPYo5pz/cAZQuow18VjKwKxbf/rdLLvA4jmobglo6V6c53hfFgW16zmc4v7+aoNrM/
	 kbwAKxTbCe8nF0wKDutXeHrpdycKS9IWv25vuPQ7DYW9P/HcF0j3RIinZerUXZ/OYa
	 X4rW1fqE5KJqllFNofFMWkXdiGA5tv13WcVJYE+LIQqEKHywNOxwglr2F+f7Q7Ngws
	 W55cJm6rc/P1w==
From: Drew Fustini <fustini@kernel.org>
Date: Tue, 14 Apr 2026 18:53:55 -0700
Subject: [PATCH RFC v3 01/11] dt-bindings: riscv: Add Ssqosid extension
 description
MIME-Version: 1.0
Message-Id: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-1-b3b2e7e9847a@kernel.org>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
In-Reply-To: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, Gong Shuai <gong.shuai@sanechips.com.cn>, 
 Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=fustini@kernel.org;
 h=from:subject:message-id; bh=OH+E1Lq9K6nERDXX094GRUFNVA/21b6qouU/nKLS0D0=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTe+5AUvrq0da5gh5fy1/YjExqlm82UF1+LuiOhzKp+P
 i3gcF1oRykLgxgXg6yYIsumD3kXlniFfl0w/8U2mDmsTCBDGLg4BWAiE/4zMnxN2rOB12PH3eOr
 H61OSg5Y6B5zJux68InlmTscujpZOtYy/K/uV3m//GZH4GKN9i51r8Brduu+LHaO29h9uqf21KP
 TjzkA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_185654_337109_3FD95CD8 
X-CRM114-Status: UNSURE (   6.82  )
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
index c6ec9290fe07..1f3853a68760 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -232,6 +232,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: ssqosid
+          description: |
+            The Ssqosid extension for Quality of Service ID is ratified
+            as v1.0 in commit 5059e0ca641c ("Merge pull request #7 from
+            ved-rivos/Ratified") of riscv-ssqosid.
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
