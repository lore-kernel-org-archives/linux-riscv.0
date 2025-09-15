Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4C1CAC599
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 09:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6weM8PsruOWFCBvXPokN8ia/sdONUhkJSwTweAZgdnk=; b=MjtAf6/TWm7vfR
	nkC3rxEUWTXOGuc62AmRfDTu8z/DTHhNcEiKijoBwhjnezfzkSU/u6x/pp5rqFVG9sSum6ZdOyQt6
	JbYWitnmVPnqnRgrAo5d4WeCQFXAoFJx1sGIzCYvSe5XGUMRem5emoB0pCDE+9w2DBjGRHsODh9hT
	5hDgTh4DkUcuBYnsrlosAqJSRdRnvcp6NEuK6Kgjmt7bcDxuLMUfTdSX+SgW2qe74fDAvSc/8QThS
	Ky7vObxomJxeq69NA26j6oOY4pO8/nKVbV553L1EHjpZlOzuF/maogu/qC/v/2IJYiwaDpyJtgAmx
	zH/qq9otn7jgYCldWRFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5vK-00000003XWD-1BWU;
	Mon, 15 Sep 2025 09:55:02 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5vI-00000003XVC-1HCQ
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 09:55:01 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D0F1425D67;
	Mon, 15 Sep 2025 11:54:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpN1W4pkx3Hi; Mon, 15 Sep 2025 11:54:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1757930098; bh=LFj7bnzkq3WxPO+5k0WLw98/60l6fANFhk/7P1BfH60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PCc++I4QorwxPNyBKGqEmE8t5o28618cLPXzvvTUvqTBd4y4feLjGmAU50+vgAvLt
	 gfRptiwz/MBEj0pbhAhNF69mmjNEcj7FmXl0jBn2CNHSsCS7gJpPMAFf3salfoJjLJ
	 BUh/XHb4Sne/NHsciRMD8M4cf1gUw6a5CdlnoY7QioHf1tRliUgsQ3cxx0oqJ90kfY
	 pz/5j8O1D1DwX72eKMUzEYNVEM99y6sw4Umi9spNNFThpttSv8E5PIQuauKOJQrzzR
	 9HbHALF5vPj9+qk8M5yNgL/aoZBjMndBDstfKHX8O9baIgtb2EF6gg07ZXCGgVNFJS
	 KqI5TAeZgvDdw==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v2 1/5] dt-bindings: reset: thead,th1520-reset: Remove non-VO-subsystem resets
Date: Mon, 15 Sep 2025 09:53:27 +0000
Message-ID: <20250915095331.53350-2-ziyao@disroot.org>
In-Reply-To: <20250915095331.53350-1-ziyao@disroot.org>
References: <20250915095331.53350-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_025500_479919_0DCDA674 
X-CRM114-Status: UNSURE (   6.31  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Registers in control of TH1520_RESET_ID_{NPU,WDT0,WDT1} belong to AP
reset controller, not the VO one which is documented as
"thead,th1520-reset" and is the only reset controller supported for
TH1520 for now.

Let's remove the IDs, leaving them to be implemented by AP-subsystem
reset controller in the future.

Fixes: 30e7573babdc ("dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 include/dt-bindings/reset/thead,th1520-reset.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/dt-bindings/reset/thead,th1520-reset.h b/include/dt-bindings/reset/thead,th1520-reset.h
index ee799286c175..e51d6314d131 100644
--- a/include/dt-bindings/reset/thead,th1520-reset.h
+++ b/include/dt-bindings/reset/thead,th1520-reset.h
@@ -9,9 +9,6 @@
 
 #define TH1520_RESET_ID_GPU		0
 #define TH1520_RESET_ID_GPU_CLKGEN	1
-#define TH1520_RESET_ID_NPU		2
-#define TH1520_RESET_ID_WDT0		3
-#define TH1520_RESET_ID_WDT1		4
 #define TH1520_RESET_ID_DPU_AHB		5
 #define TH1520_RESET_ID_DPU_AXI		6
 #define TH1520_RESET_ID_DPU_CORE	7
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
