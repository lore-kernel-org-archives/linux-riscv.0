Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE71CCD192
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8WAEqDj/1qD2X9PwTvnXwXREjze10ULLLyL/f6KdXw=; b=qluEbmgMrTyWRO
	lIl1pOhoRxYBN8OQGh3MRN2SPvV5nErN3SQ4MhGmo0lRCu6g/p9kGAg03LRDLf8uNwqKHIo4XRJSc
	K9jxtMm1fcIXmBRRbGDT2JQkvcAlxh/bErFkHumaaobbwjSZAmXnG35aB2SdMP5aZq+Poxl7rUW35
	o09TJsLnbFl7xd2p8qWkOk5BV/ONwBT8F3GXN5XK8bigfWfr7/l13eJWQzfRUSJlCy1AdZAZ7nFV8
	2oLxU8saqDy6rSj4UopBziIyYi0GSTwsfMnZOZx/tPqNySKYHzAD4Fhx0I8EQJ0nRN418ZfaSngjY
	FFsKC48kSAKo24dr8dBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8enz-0000000GPx7-16Oj;
	Tue, 14 Oct 2025 13:11:07 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8enw-0000000GPuK-0uTr
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:11:05 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B681B22BF5;
	Tue, 14 Oct 2025 15:11:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaOwcABROvMi; Tue, 14 Oct 2025 15:11:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1760447462; bh=B0Vu5yBNwZ1Dnc8v+auSUV1b6zIitcuBDQLkvOkJmCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jl3XBTJJHPNUhRl8/FXUpmR2GJ0iVygeIxQBrOM8e8gkDPzpX9N/74Ds2f76X+HeS
	 KB3EHPCl3goblOoZJEMx2mE8W4GLU3Ucl5CxgRWKwZPvq8dkHy77fnebenzGtrysV2
	 PdHEiz6LFC8ykADfH2n0VYXd8zMCv8RZz2lbY5o8QeeEQM9vclb8d7prgFiw40V1T0
	 6oTjHP9rPZMAN+5JgojEsICN34FwVtCT2XMQsiEIOGTBb1MksC7JFDu64pb5/uI4jI
	 tOBIMkNYjoltz3dKznJmuWC5nO2mwctlFTa2sQogXlOZTjvlltynr+g/wibrQg4dTG
	 q0HjqboZo5YZQ==
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
Subject: [PATCH v3 1/5] dt-bindings: reset: thead,th1520-reset: Remove non-VO-subsystem resets
Date: Tue, 14 Oct 2025 13:10:28 +0000
Message-ID: <20251014131032.49616-2-ziyao@disroot.org>
In-Reply-To: <20251014131032.49616-1-ziyao@disroot.org>
References: <20251014131032.49616-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_061104_387612_9420E325 
X-CRM114-Status: UNSURE (   5.98  )
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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
