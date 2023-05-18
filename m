Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F0BC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 18:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lya0LEWMy/IgfC4FEGE8nQvGBM/lZu3a6lEHQyHDws=; b=NwuL5r+MDV8Wcr
	8EmDMkR6AcZZ7Kax23r5cvSIFtpAh66jAlHP2tocTGZQFjPNeEJMu3SmW/OsgAVtATpwITGCLxJze
	L5GthEkycqYPcjZdBE9zMuRqOucA7idfW4LCG5ll2/NHHUVIU+9IKuW3DE8puKZXXV5trKl5GYCo2
	MNnkZ4Q+7IUfH7orzgCBl8c7bBjhuZQJ5aknh90X8/Tgkdd2BPGHsZZbx66b8iZfebbKZCrj70d+e
	UtaxHLFz6Fv3Qu92HbXIp3GSVCW/b4atfU3VBwTdGA4JEECb2PdlAt9X+pgZ/y0i5l8Yuhs64sxch
	XCwd4awu7VfSQXbFgetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzioS-00Dt51-1W;
	Thu, 18 May 2023 18:57:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzioQ-00Dt3A-1M
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 18:57:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0317E651AF;
	Thu, 18 May 2023 18:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC6AC433A0;
	Thu, 18 May 2023 18:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684436237;
	bh=vxBYR6LtHdTWo59agyMO2DjmnNEXIpF3f4ssS0Pr5DU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Km1I+KHyYtnUN0pmY1DDp07p0EmyV4uwgUlqNQjv0THFIX/Z+sDhlyrED7Snmr5wG
	 EBwNATQzc89st4HbSJmDYMmrm3w5yciXzJkyjUc+sHSRI2QyKKTCULLkts4umpWAPE
	 p4BxzkN2XkbTv1TzN86ZSgOUu6hTmJk3+/q4/QMDejKNDiIUzJYtXfm2+2RY0/bv0D
	 UkhQ4NdCtw5rhpLhGbdcsmSM9lmdgliu5oHuN4yitls/IWMiqrzlzN7B8GFzYRiIar
	 fvM366GxuOHSbd2dOom/rA2HjSkRZegJ5yQrRcbVnbJWK+qeAac5OuPgLLE5MR42l2
	 Uw2Bj7cE/XPlQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 8/9] MAINTAINERS: add entry for T-HEAD RISC-V SoC
Date: Fri, 19 May 2023 02:45:40 +0800
Message-Id: <20230518184541.2627-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518184541.2627-1-jszhang@kernel.org>
References: <20230518184541.2627-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_115718_498274_E2577D62 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: devicetree@vger.kernel.org, Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, I would like to maintain the T-HEAD RISC-V SoC support.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0ad886d3163..6df20c65798a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18162,6 +18162,12 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
+RISC-V THEAD SoC SUPPORT
+M:	Jisheng Zhang <jszhang@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/boot/dts/thead/
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
