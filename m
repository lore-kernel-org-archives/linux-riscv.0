Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2CBC43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 23:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1Fvo2pGy5tORxdkKFkNXjtXz0PHk/N+YIMU0x+RxL0=; b=HVKE9k33Gvl7Ak
	lhj1AcOsQ5lxZl5Ytd3dmuAOxkABBl1GzMqUF6lIXIDfxkPtyKlvi1PpQvQg070qYG5zhVTMP6SGA
	Ounh5m728SDa67sluOFnMoZEGFXWeGCLkb1P7vuX0HDpdkvx7Bm/+gGFnwrvj4SDfzCw/KfgmL7Si
	KwFqc3S+pLswmNPoZ8dUxxgnL1c7EQV3bSM+i2wr+ZrgZWa+tdSEELOs+0PhLNB9ytNP2ZQdL8wwP
	kzE9OmTDOKkngXZPVAKB1wcqO6aUpH3FsPTWbLjK/9IBkD0EWh2tsIJheF6LT185L0gTBKzsUT2VZ
	pm72/2CGHJYDtIqWM8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgsOR-0000000Dl7H-21V0;
	Mon, 06 Jul 2026 23:06:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgsOQ-0000000Dl74-2wSL
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 23:06:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C91C043ED2;
	Mon,  6 Jul 2026 23:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399001F00AC4;
	Mon,  6 Jul 2026 23:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783379185;
	bh=srvdFyNcKWrG6UhIb2zhEmit0iT5/TwfHnN+QzKDIL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EN50UGgDDiP+s4pwKbsgr7tDnGCh+xcmJV56oysUkM9sEl7ZZD4ZBhHbZcO+XNfdt
	 ONxoUbSf5c7VkktfnFSKH+fS80IZ5Upf6pkelvzZKtyTfUWS+urhaJvEH5ibvNZKo2
	 T3583WingNd5GnB/+wo2QNw61uWUZtZ+w9/cqwLZGjytKo23zkFSL2ZiGgU7pyhvEz
	 Kk+/f/gWYaXjjP8VFQ77QqTvpIEMkrq7NlV6gb18kDS79dh3Q0R0taF/CRZIIIO4P6
	 SE5XBuCq7/WZbo+oiUh8bFrTNA3qREcIY7TOScXgJbADOjyIDldR7O9Fw6/JVpEl23
	 lbwVYpbrdwucQ==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 06 Jul 2026 16:06:11 -0700
Subject: [PATCH v4 1/8] dt-bindings: riscv: Add Ssqosid extension
 description
MIME-Version: 1.0
Message-Id: <20260706-dfustini-atl-sc-cbqri-dt-v4-1-e75c20201d64@kernel.org>
References: <20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org>
In-Reply-To: <20260706-dfustini-atl-sc-cbqri-dt-v4-0-e75c20201d64@kernel.org>
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
 yunhui cui <cuiyunhui@bytedance.com>, Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=fustini@kernel.org;
 h=from:subject:message-id; bh=oVWQwUJrVLgt2ds0hOtdw/u3HLWC21FLWSsgjsdIJHo=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWT5mLzP/Oo7yV3MvkvpatbJv6kmVimibsxfhNOkZG6I7
 mXcdt+wo5SFQYyLQVZMkWXTh7wLS7xCvy6Y/2IbzBxWJpAhDFycAjCREglGhpu/KlfNUtgUYsaS
 puS/2ErXRGq1rVtj8uYfXo3Pf8cFcjP8Zil+cv/1Y0abVdwRV08nusnMb8iXvKOc+jW7jVVqZ3Y
 hBwA=
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
index 2b0a8a93bb21..1c6f091518d4 100644
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
