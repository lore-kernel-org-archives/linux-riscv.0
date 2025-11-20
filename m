Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEF4CF8855
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLjT1eLSMTEVXOWRAL9mN275TsQzVRkM4yoG31fDwN8=; b=rvXp3mjiRnq2dM
	s3B6YmB4IuUR7gWVwNSIdhYt/7ZaS5v4YShnT+rJh+UmQWPftSTthHBD2NDcXoWVZ2Sd32GSD6kn5
	BtQBSEV97wBkA1zuWhUhBfSMWlXEFkE4p0S4fAnwIl0Qf57lmQ41eOm0jIUsjoeLCFi++G1hx9gvV
	/lgjtt3EsrG0dZqHLEAmqYG2ON8+7/lzeAAwIuK9ToHapet65qvv01cpIia4tKH+BLAWIxpcun8x8
	ytBQ9CtJKwDW8Mvv12kYcB2OTZWK0tSrU359urY79UKmfsYTMrzJPi7T+Ub/5dpqHF0OEi+zbuu9H
	49KD5TSKUbBO4A3eoZ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4WG-00000006i2U-27uu;
	Thu, 20 Nov 2025 13:16:16 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4WE-00000006i0v-1VSj
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 13:16:15 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 93CFB20B50;
	Thu, 20 Nov 2025 14:16:06 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YS_O_oScmD3k; Thu, 20 Nov 2025 14:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644566; bh=K+u3wqp+9anVmEDTeLD4NstpSo/avmelycIC6VjG2V4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DXCzUbRxsucs7j/08kFZ02NPaYb5vj43V/IJ5XiH/SmhhZFsLSHAR42SBVsOTsU6h
	 BvAOep9lch7VTEiuw9EsB6ceARucg5vSQFzmW3oHNmUC28h7f+1b74VCfOcZIVkH9p
	 JHORoZQgsTp9Pu/9CJACbSUSRLSDpTTXjcorF6j7t8sVVPezZS8EERZ1ECCUSQuJW2
	 RJi5Z64FlrqTP450pIdOLTKJkxP3UWJ0iCxI7yzm4pGkm3cH5OprBWzATcCoV7Msuc
	 KSOff/Z063NpXIWE6HdRCTqxO+dvtd5EUIULALVeqvWP1EgA01sE9ZfVIjCA+m5IS9
	 p5+d3fIBq+QRQ==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 5/7] clk: thead: th1520-ap: Add macro to define multiplexers with flags
Date: Thu, 20 Nov 2025 13:14:14 +0000
Message-ID: <20251120131416.26236-6-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_051614_525691_99E8302D 
X-CRM114-Status: UNSURE (   8.66  )
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

The new macro, TH_CCU_MUX_FLAGS, extends TH_CCU_MUX macro by adding two
parameters to specify clock flags and multiplexer flags.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index bf8e80c39a9e..79f001a047b2 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -101,17 +101,22 @@ struct ccu_pll {
 		.flags	= _flags,					\
 	}
 
-#define TH_CCU_MUX(_name, _parents, _shift, _width)			\
+#define TH_CCU_MUX_FLAGS(_name, _parents, _shift, _width, _flags,	\
+			 _mux_flags)					\
 	{								\
 		.mask		= GENMASK(_width - 1, 0),		\
 		.shift		= _shift,				\
+		.flags		= _mux_flags,				\
 		.hw.init	= CLK_HW_INIT_PARENTS_DATA(		\
 					_name,				\
 					_parents,			\
 					&clk_mux_ops,			\
-					0),				\
+					_flags),			\
 	}
 
+#define TH_CCU_MUX(_name, _parents, _shift, _width)			\
+	TH_CCU_MUX_FLAGS(_name, _parents, _shift, _width, 0, 0)
+
 #define CCU_GATE(_clkid, _struct, _name, _parent, _reg, _bit, _flags)	\
 	struct ccu_gate _struct = {					\
 		.clkid	= _clkid,					\
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
