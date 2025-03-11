Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFCEC28B2F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uP+dVQN9Loq4ZSRst/hPA7qfjJOCH1HAB1e7GXO8cYo=; b=pV2q1Fw35CUYxI
	6yglc2h8HPEwrW7UECLfJYSFi8zfQJOPXd/Vvy7ixoIeG9nI/Gp4LXhlCnGuxOiK04PxHnaH5XmQl
	RiUBJWd/270iVOgQqZySUvsOcHcvAA3Hv2czymjbr6XwUa8UC5eck8lXjigKemo/lTNwyWAxkDyOb
	Dmvdh62hKF2WPauZ50terItlB28NDQ+SmwhaPcIFR8VDlJvqxGzTgd/LubsRPiy45PZ1XIwPi54kA
	+eNX6HepmylkuI0yG7d1kPVKGY3ndKSW3edGgcjhV1lMECPBRdO4KLthhZKVXzw6a7xesxMDgO6oy
	pyViYRafuJebrtPqJdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3R9-00000006SvU-32vB;
	Tue, 11 Mar 2025 17:30:39 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3HR-00000006RHX-22oV
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 17:20:41 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250311172034euoutp02bc93ac07eaafb6285a880c1714383957~rz1KrCu2G2934229342euoutp02e
	for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 17:20:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250311172034euoutp02bc93ac07eaafb6285a880c1714383957~rz1KrCu2G2934229342euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741713634;
	bh=K2KBwS7B77Ev1bGYtdC2d+pddTbj6i1oKKCPxQ8uO3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=We2ou8T17xV/+FtAE6IRyZFUQmH9nWBq10eOhig4XBHrDNcBtEfS1L0DxNohEWUWe
	 sYeQ347TG+krwgi+mlRRyeVh0Bmeo/H+1sSFmf91LQZkry5AmErQhkCoRzoikWDuJV
	 AiGTJK6EZP6oH4mwOAkrctkcw66fN/Pmy+a5UyQ8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250311172034eucas1p2a0646d9e825e345bdd36fbb3d7be47bd~rz1KAU9XC1827018270eucas1p2B;
	Tue, 11 Mar 2025 17:20:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 2C.A9.20397.2E070D76; Tue, 11
	Mar 2025 17:20:34 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250311172033eucas1p2bb8179b16b02a93a9ed9ba5cc37efd3e~rz1JYho411827018270eucas1p2A;
	Tue, 11 Mar 2025 17:20:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250311172033eusmtrp1f6b8c2a883ca18a1aaca3d1346a6bae5~rz1JXwVUX1350113501eusmtrp1b;
	Tue, 11 Mar 2025 17:20:33 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-98-67d070e22848
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 04.BD.19654.1E070D76; Tue, 11
	Mar 2025 17:20:33 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250311172032eusmtip2cb026fbb0df08547d05dc9500a1f6ebb~rz1Icy0vk1259312593eusmtip28;
	Tue, 11 Mar 2025 17:20:32 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, ulf.hansson@linaro.org, m.szyprowski@samsung.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal
	Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 3/5] dt-bindings: power: Add TH1520 SoC power domains
Date: Tue, 11 Mar 2025 18:18:58 +0100
Message-Id: <20250311171900.1549916-4-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311171900.1549916-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGKsWRmVeSWpSXmKPExsWy7djPc7qPCi6kG8zdyWrx7M5XVoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbJ4sbeRxaL52Ho2i5ez7rFZ7H29ld3i8q45bBafe48wWmz73MJm
	sfbIXXaL9V/nM1m8vNzDbNE2i9/i/54d7BbH14ZbtOyfwuIg7PHm5UsWj8MdX9g97p2Yxuqx
	aVUnm8eda3vYPDYvqfdoWXuMyeP9vqtsHn1bVjF6XGq+zu7xeZNcAHcUl01Kak5mWWqRvl0C
	V8b3vYoF/bwVf9b/YGxg7OXuYuTgkBAwkfjTxdTFyMUhJLCCUeLj2QPMEM4XRomjU3ewQTif
	GSXur7vIDtOxeIobRHw5o8SvZ5cZIZw3jBIHG6exdDFycrAJGEk8WD6fFSQhItDPJNF35D+Y
	wyzwkFHi9csmVpAqYQEPiU0Xn7KB2CwCqhJXJm5kB7F5BewlDu+5CmZLCMhL7D94lhnE5hRw
	kPi8bQUjRI2gxMmZT8C2MQPVNG+dDXa4hMB+TonZd5cxQdzqIvHvZirEHGGJV8e3QM2UkTg9
	uYcFws6XeLD1EzOEXSOxs+c4lG0tcefcLzaQMcwCmhLrd+lDhB0ljnStZoaYzidx460gxAV8
	EpO2TYcK80p0tAlBVKtJTO3phVt6bsU2JgjbQ+Lqye3MExgVZyH5ZRaSX2Yh7F3AyLyKUTy1
	tDg3PbXYOC+1XK84Mbe4NC9dLzk/dxMjMCme/nf86w7GFa8+6h1iZOJgPMQowcGsJMK72vZC
	uhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeRftb04UE0hNLUrNTUwtSi2CyTBycUg1MtiGrf85f
	ynWu+ZaGmbVEwpRuX59LE4QcM97VtMbmmnzqnBV3enp88TzpgwtavMInhdifPrZBeY/VDZNu
	qcpw03qtkOO54UsfLU9Z2S09MyrkoejXae/XL+NNv1Z64EVhugq/oJ1XumkFZy5buVXu+YIV
	r/+4ZH7Zza7LUxVuLZJ+sqL3cMW8VfaSHHy5zw+ulJywluvYIV8v06PbpNKO7z2890LC6dR1
	udfXiOmx/X3y5vrC3WaJ63z3nYgONFyzM6jb4cO7/g7OXd/nTLZaI/aW+UDImSPlD/p5d07b
	J2Xu0K1ze+GC1X/mf5HSzC/Rfb28rHhl2by+1IcfA3f86mU7JfjeJ4DlY1bXdOl5SizFGYmG
	WsxFxYkAOLI/JfkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xe7oPCy6kG8xfJ2rx7M5XVoutv2ex
	W6zZe47JYv6Rc6wW9y5tYbJ4sbeRxaL52Ho2i5ez7rFZ7H29ld3i8q45bBafe48wWmz73MJm
	sfbIXXaL9V/nM1m8vNzDbNE2i9/i/54d7BbH14ZbtOyfwuIg7PHm5UsWj8MdX9g97p2Yxuqx
	aVUnm8eda3vYPDYvqfdoWXuMyeP9vqtsHn1bVjF6XGq+zu7xeZNcAHeUnk1RfmlJqkJGfnGJ
	rVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsb3vYoF/bwVf9b/YGxg7OXu
	YuTgkBAwkVg8xa2LkYtDSGApo8Sarc+Yuhg5geIyEte6X7JA2MISf651sUEUvWKU+LzqHRtI
	gk3ASOLB8vmsIAkRgYVMElenbGAGSTALPGWU2HZDHMQWFvCQ2HTxKVgDi4CqxJWJG9lBbF4B
	e4nDe66yQ2yQl9h/8CxYL6eAg8TnbSsYQWwhoJptk7uYIeoFJU7OfMICMV9eonnrbOYJjAKz
	kKRmIUktYGRaxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERjB24793LKDceWrj3qHGJk4GA8x
	SnAwK4nwrra9kC7Em5JYWZValB9fVJqTWnyI0RTo7onMUqLJ+cAUklcSb2hmYGpoYmZpYGpp
	Zqwkzst25XyakEB6YklqdmpqQWoRTB8TB6dUA5OD74dLEhpCE+on/ItNnn87KnDKwn6XFDsG
	JkMn19i0tbLu/7du1KoNn1R2yWbxFu4JXUcsFM98NDllK/POJVws8PXn7+43tuoFHXcsrM9o
	9zyx58LTumN3VVMS/2txf3rbURrzcVW/0g/jwJDVKl8PTVg5W8zuwbMn/8RqH5ya9ed3bZdZ
	7tNbp9rahVo+7N5w4cf+lVrsezMXmpUutLlp3+6f7W4XzHkzXF6x/fC7q3M5n249Pvn983KW
	8ze+1UgHhpiH9d+yPFHOs/lflF7iOYf40tOTU/0YTcrWOD4PvGC6r+bt/8lnM248v/gyRe1q
	/Xp53x8nZqd3damyrzCfOoN3mlRfp8SPu5/+XfqgxFKckWioxVxUnAgAzRtXK2kDAAA=
X-CMS-MailID: 20250311172033eucas1p2bb8179b16b02a93a9ed9ba5cc37efd3e
X-Msg-Generator: CA
X-RootMTR: 20250311172033eucas1p2bb8179b16b02a93a9ed9ba5cc37efd3e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250311172033eucas1p2bb8179b16b02a93a9ed9ba5cc37efd3e
References: <20250311171900.1549916-1-m.wilczynski@samsung.com>
	<CGME20250311172033eucas1p2bb8179b16b02a93a9ed9ba5cc37efd3e@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_102037_864276_07F69512 
X-CRM114-Status: GOOD (  13.01  )
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

Add power domain ID's for the TH1520 SoC power domains.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                                   |  1 +
 .../dt-bindings/power/thead,th1520-power.h    | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/power/thead,th1520-power.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 27fdf3d6a5c7..efef657ee528 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20438,6 +20438,7 @@ F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
+F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
 RNBD BLOCK DRIVERS
diff --git a/include/dt-bindings/power/thead,th1520-power.h b/include/dt-bindings/power/thead,th1520-power.h
new file mode 100644
index 000000000000..8395bd1459f3
--- /dev/null
+++ b/include/dt-bindings/power/thead,th1520-power.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2022 Alibaba Group Holding Limited.
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#ifndef __DT_BINDINGS_POWER_TH1520_H
+#define __DT_BINDINGS_POWER_TH1520_H
+
+#define TH1520_AUDIO_PD		0
+#define TH1520_VDEC_PD		1
+#define TH1520_NPU_PD		2
+#define TH1520_VENC_PD		3
+#define TH1520_GPU_PD		4
+#define TH1520_DSP0_PD		5
+#define TH1520_DSP1_PD		6
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
