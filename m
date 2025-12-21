Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29608D68BD5
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Dec 2025 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EXsipxFcgumnOuxUqldubMnbicLX/t83m2mUee+aOI=; b=C7jTqdFg6Z2lGY
	uoGEPqZ1r80x/KQeNKQpPRdxOo58eO4FWkeVFYXP0GrpoELHv8kwNykPVIkm/D+ZvUSvUwYFVMCTl
	sp7wG43AoIyfwubIJMuSIQ2UL0E0rR3b5asWtekX5VziURMxD2XUKG1Q9GDiE3zPptcn6ppgNC3my
	SRGlAohxKHrC/vvEL1VgpxSu9AMNzEo9MZ59S7Eufivlm8c4ba5r/svRSyEuQcXdRwVL9+swUUSRi
	7Po75+vi4HJhfhLestkVm2xQKygiAAFlKKrMr5L1tQwAJ9wPZIIkxWoK7pGcIUYYJhbMd5R2W0lK7
	+Mqt7rZmSM99kaKMp+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXEgn-0000000CFMM-2h2Q;
	Sun, 21 Dec 2025 08:21:17 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXEgl-0000000CFM0-2f3u
	for linux-riscv@lists.infradead.org;
	Sun, 21 Dec 2025 08:21:16 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 265E2340FEC;
	Sun, 21 Dec 2025 08:21:08 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 21 Dec 2025 16:20:28 +0800
Subject: [PATCH 3/3] riscv: dts: spacemit: sdhci: add reset support
MIME-Version: 1.0
Message-Id: <20251221-07-k1-sdhci-reset-v1-3-6780af7fa6e7@gentoo.org>
References: <20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org>
In-Reply-To: <20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=752; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=WfOYufxvp5VMhrnMCPsjsrXQPRkHTzjLxnD+Xz6ivlk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpR63dK1KxNfkTA25fu5p1T+xCzN4qwfXwAe4J7
 WMogOHwkvuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUet3RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3Zcg/+KvNt0xHyrpBNAUg57mCtQIGMt6rXzLXPjeoPurkxcNkzFOei4SoOs
 VnUaqbZD6CNGvuAFcJKYRd18DVFC6mUyXg7gc6m+QLKeBOvt/q/kpBBdKhb3l1JofDqdcQwGFNy
 q+FOmDfD6Jc9DVco5mQrDNZdrPqBbqbJVISXwY6PD0uFtZ1bn6krrQfyQ27pgq9SiYDmBDzfeIz
 VJIaQBFwu6D5ywPo0256sxC3ge2H+uc3LixzaiDCTR3qVWCkMVSF31Q62O4jvLWV5gjVn7ftf3c
 F/RCTxKkzXYbRW43laemjgTvYZSMYYQhrUabakrznVhGwpGVqeLyDxIRRJR+BaaA/6HEytccX9A
 4FXKC1Q4YL13uVtTupne6Mhm70WeR8xbf9Rh1h37MDZU75fTYwqRUZ33zVfH2VoM4ryhrMoTF2/
 WEl2Sg/+/DuSgElappnPcG5Zx+rrm3VqfOPlJaa6N6jg6lCx2G+ircMvpC/45GLgcnsnXqGcVtD
 MaNboQbYzc8J1KAzX3fpKjPxTzAXRESHiNzubrrjzk1MLTq/N8nMflikmt7lGGsy2VUuom6aK1R
 zhT403/ONYUY5PqnNbh2IK0RYV8PvCcI2WG+miBieWGhDv96Sc2a4a+N+/Q7qdP3pPqWendVxt6
 NNM4VuMeF7RxFp1x4TlK0+p60fvazg=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_002115_706039_0F2CC258 
X-CRM114-Status: UNSURE (   6.63  )
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

Request two reset line explicitly for SDHCI controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6..7dd41d6dcb85 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -984,6 +984,9 @@ emmc: mmc@d4281000 {
 				clocks = <&syscon_apmu CLK_SDH_AXI>,
 					 <&syscon_apmu CLK_SDH2>;
 				clock-names = "core", "io";
+				resets = <&syscon_apmu RESET_SDH_AXI>,
+					 <&syscon_apmu RESET_SDH2>;
+				reset-names = "axi", "sdh";
 				interrupts = <101>;
 				status = "disabled";
 			};

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
