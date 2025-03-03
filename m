Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00582C282D1
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 14:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+SBGxLO/KYrDV7NdogHXD+H37za5Va53lty5BY/XoJY=; b=Tt9Sj6jQxi6zvv
	BbIlOcWKqXgdAnYqaTp/xz5NYYoRhE90S1eE6+lssEgG26+/0ZxOpQfIlZ5/rB2wYgBSM1rhJhx6t
	9BrCwImKzt1O/tkAKnO5gqnpI3ETQERvJj4w8VQHqbc+2hsPjO7mHJ731BmsIY0cEqQi7BGsCuazF
	qdn+ijtS7hZLeGniOWxLp9lpnioHdXumeh9KnIwggxzsMFll4wEOiQdRVXv/FvHzxcT4ooCtubbeJ
	383Ls0G1Zrn699ywwZ+bEU8LtB7K6RGVVSFuXSmbMkIEZbXL426XAGwOag+w/ulOPENGUk4/xuKSp
	ZySwPGsUKK3KEb6q5m7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7GQ-00000001C5J-10Kz;
	Mon, 03 Mar 2025 14:59:26 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7GM-00000001C0y-39vI
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 14:59:24 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250303145921euoutp02f8b66a5f10b4fc873d96699bb2508d60~pUvkuDHNR2011320113euoutp02J
	for <linux-riscv@lists.infradead.org>; Mon,  3 Mar 2025 14:59:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250303145921euoutp02f8b66a5f10b4fc873d96699bb2508d60~pUvkuDHNR2011320113euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741013961;
	bh=e0mrS+t1jNt48bXDjn9oI0LYn+AcD0Q8hmV1Xyzzg7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gOh/UZEUw9kg0Z/sniBTyxAJ2wDpoCbpWCPCdhpOUnzU4dQFI+sPGMbiSEU5r9DYK
	 ZBJ/r/7EJBFYOTLRsS1obRgckwQie2oGrDDWlsaNYoEB9Qq0Eko665YmeQyD16ZOLw
	 azJnzXIg84MS0OFym3k1ldWQk4/6aQ4bP+WKQUOQ=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250303145920eucas1p1b13e4826ea784c814fd8ea6a0d3c4d4c~pUvkbK-WI1309713097eucas1p1B;
	Mon,  3 Mar 2025 14:59:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 58.50.20821.8C3C5C76; Mon,  3
	Mar 2025 14:59:20 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250303145920eucas1p1aff0c4204bc716ef8dc683c11a4b26b4~pUvj_j3f01310113101eucas1p1E;
	Mon,  3 Mar 2025 14:59:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250303145920eusmtrp16253f574e7cdc0974455c751817db909~pUvj92mBz2312323123eusmtrp1d;
	Mon,  3 Mar 2025 14:59:20 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-8a-67c5c3c8cf8e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 14.2D.19654.8C3C5C76; Mon,  3
	Mar 2025 14:59:20 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250303145919eusmtip2095bc55713009acd89a9d1b9a11988b0~pUvjFJmGb0240902409eusmtip2G;
	Mon,  3 Mar 2025 14:59:19 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, ulf.hansson@linaro.org, m.szyprowski@samsung.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal
	Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v1 3/5] dt-bindings: power: Add TH1520 SoC power domains
Date: Mon,  3 Mar 2025 15:58:59 +0100
Message-Id: <20250303145901.446791-4-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303145901.446791-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOKsWRmVeSWpSXmKPExsWy7djP87onDh9NN7i4QM/i2Z2vrBZbf89i
	t1iz9xyTxfwj51gt7l3awmTxYm8ji0XzsfVsFi9n3WOz2Pt6K7vF5V1z2Cw+9x5htNj2uYXN
	Yu2Ru+wW67/OZ7J4ebmH2aJtFr/F/z072C2Orw23aNk/hcVB2OPNy5csHoc7vrB73DsxjdVj
	06pONo871/aweWxeUu/RsvYYk8f7fVfZPPq2rGL0uNR8nd3j8ya5AO4oLpuU1JzMstQifbsE
	roz3r66zFfTzVhxeso25gbGXu4uRk0NCwETizr+dzF2MXBxCAisYJfbcaWeFcL4wSnw5/JAV
	pEpI4DOjxNqbPDAd5/bPZYEoWs4o8WnpaTYI5w2jxMFns8E62ASMJB4snw82SkSgn0mi78h/
	MIdZ4CGjxOuXTWBVwgIeEvcatzOC2CwCqhJ/v39iA7F5Bewk9rU/YoLYJy+x/+BZoAs5ODgF
	7CU+NWhClAhKnJz5hAXEZgYqad46mxmifDenxJr1VhC2i8SSllZ2CFtY4tXxLVC2jMTpyT0s
	EHa+xIOtn6B6ayR29hyHsq0l7pz7xQaylllAU2L9Ln2IsKNE3/kLTCBhCQE+iRtvBSEu4JOY
	tG06M0SYV6KjTQiiWk1iak8v3NJzK7ZB/eQhMevtI7YJjIqzkPwyC8kvsxD2LmBkXsUonlpa
	nJueWmyYl1quV5yYW1yal66XnJ+7iRGYFk//O/5pB+PcVx/1DjEycTAeYpTgYFYS4b3VfjRd
	iDclsbIqtSg/vqg0J7X4EKM0B4uSOO+i/a3pQgLpiSWp2ampBalFMFkmDk6pBibbNe4pkSIH
	F/e5FP+d63fvzIp7j/dcjHfRj2Se5CQt+FD8u5RcZnj+4z7beWGpPtZ6Af4uqjfZ91UwXti6
	hf+7No/Kn7MukV/9jpSciijnO/dkpvPhtUHFXHlm2xfPYEl5am/5mdsmXex1aoEH9+vO6fti
	jx/IitcOk+T45CNfk5MbNH3xqjcTQqd9KVwjVb8sNenr3KjppyS2Hypff6jofm5mhMgB3oLl
	bYlT52ze+WhVF7fjjaI6H5vdd31XMf8+r3f02uIrLgUu/7si+68G3pPyaDjgVxFgLSE7ja2/
	+O4tdr6qm8bCVzsFv6qkzH9rO4nb+VlCjMo7ox0pYizfZ9c/kLq+aHXs/2Vbm5RYijMSDbWY
	i4oTAc/qWpv6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xe7onDh9NN/h7nsfi2Z2vrBZbf89i
	t1iz9xyTxfwj51gt7l3awmTxYm8ji0XzsfVsFi9n3WOz2Pt6K7vF5V1z2Cw+9x5htNj2uYXN
	Yu2Ru+wW67/OZ7J4ebmH2aJtFr/F/z072C2Orw23aNk/hcVB2OPNy5csHoc7vrB73DsxjdVj
	06pONo871/aweWxeUu/RsvYYk8f7fVfZPPq2rGL0uNR8nd3j8ya5AO4oPZui/NKSVIWM/OIS
	W6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYz3r66zFfTzVhxeso25gbGX
	u4uRk0NCwETi3P65LF2MXBxCAksZJRrn/mGHSMhIXOt+yQJhC0v8udbFBlH0ilFi/ao9jCAJ
	NgEjiQfL57OCJEQEFjJJXJ2ygRkkwSzwlFFi2w1xEFtYwEPiXuN2sAYWAVWJv98/sYHYvAJ2
	EvvaHzFBbJCX2H/wLFAvBwengL3EpwZNEFMIqOTVJw6IakGJkzOfsEBMl5do3jqbeQKjwCwk
	qVlIUgsYmVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIERvC2Yz+37GBc+eqj3iFGJg7GQ4wS
	HMxKIry32o+mC/GmJFZWpRblxxeV5qQWH2I0Bbp6IrOUaHI+MIXklcQbmhmYGpqYWRqYWpoZ
	K4nzsl05nyYkkJ5YkpqdmlqQWgTTx8TBKdXAJG7CdV4pUFGJo+7P8s4N53hifG6Xpz97oW+9
	MEJp7Y14v3vur+bcc+q43+wUZNicsDs0rPp6iXfdRusIT/2ZignB+c7en6f3tJ1JsWn/wbhr
	1b3Q+dZ37j6NlBX6uSeq9pj3POFj18+dnsw9PUyB2XbvLY4Z23Kvn6g/Y3Wwp7Vyw+ILii+/
	nI0WlrSQ0LfJuLdx1upZHzpn7S5MbJ0tGK6aZ1Lo59jloXjz//WUY1fLCgIdSj9/YHOLOqAp
	rhXxf2oW77YOl8rFvlv/V5+9osj2q0z1nUPlxWmtKevslvMtXlNU0Ja8ze+q1JmZ+6yiZ3/z
	/2t9o3CKFI9s6vyHc7bIhWp/blN9fe2efOMbJZbijERDLeai4kQA+QgBlmkDAAA=
X-CMS-MailID: 20250303145920eucas1p1aff0c4204bc716ef8dc683c11a4b26b4
X-Msg-Generator: CA
X-RootMTR: 20250303145920eucas1p1aff0c4204bc716ef8dc683c11a4b26b4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250303145920eucas1p1aff0c4204bc716ef8dc683c11a4b26b4
References: <20250303145901.446791-1-m.wilczynski@samsung.com>
	<CGME20250303145920eucas1p1aff0c4204bc716ef8dc683c11a4b26b4@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_065923_155844_61CC7DB2 
X-CRM114-Status: GOOD (  13.53  )
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
index c446fed8ff96..b2b32e431f35 100644
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
