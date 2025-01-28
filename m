Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F35C0218A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 19:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZfvzCPb5mmCyBgIvtkQamSEWmNjGMFy+xDkelQjbEk=; b=1JTLXhV8zIeXxR
	1o5Nh2TjU4GJcAvDbAyp72ORH65xuAYYzlkOcITTyR8reQH/nia+uAGkYv1U7TRdnQmDsIkt4uST3
	AqoeiGA3nWZ1BYAP40WGPjXc8OevvljvH6o5JaUmiy2sVa+vLr4a2Q2HOBsKgjXLN0sm2G00vOvaF
	4o5mm5hgmYrCaW7sPiqp+0FSFU1gpAJSJKH2pzd2HuoUCzj+uNgNsmbJ1SYu6aDcfUwuZ8sZ8O416
	RU5OdVWjfo6ZMGG3oyx66Bh8LWmxd1joP9WF+Ht1i6mnj19RxkYA4ENvaWBNclPWCrXLB0qPNJBK0
	NS3qL2aOeAjQllbl3osw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrZh-00000005jOB-2m0i;
	Tue, 28 Jan 2025 19:48:41 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcrZe-00000005jKG-07tn
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 19:48:40 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250128194830euoutp015e725e61897697e1ba66d178208c54a0~e8wVhmOy01348913489euoutp01b
	for <linux-riscv@lists.infradead.org>; Tue, 28 Jan 2025 19:48:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250128194830euoutp015e725e61897697e1ba66d178208c54a0~e8wVhmOy01348913489euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738093710;
	bh=UZmLNHwkp5An2gfrKXyP2UO7KRHVPMtn3l7qtY0FnQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qS5DRe38FnTZgOWJ9m/8ctj23/2TNqDeX74zn9iGGmmEsp9DOSbQQjV9iOXqR0UlG
	 RQsiN6NLdDPC1/N0P2MdXfLdWxcXuuJbxug0xCcpXJkyq6UN8ceI9kp8MpwGHwqO6o
	 HW0lidiTgmPcZeKj6qGRy93zCQLTaAGLVhpJiqC0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250128194830eucas1p19e60d5d1c749080edcc60c746d65ca25~e8wU9agvz1989019890eucas1p1n;
	Tue, 28 Jan 2025 19:48:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id F5.A2.20397.D8439976; Tue, 28
	Jan 2025 19:48:29 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250128194829eucas1p279fb146417854b28366378793087694a~e8wUHvrau2286822868eucas1p2E;
	Tue, 28 Jan 2025 19:48:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250128194829eusmtrp23ababadc0aa08aba01aa8daedab8f098~e8wUG9bs_3008430084eusmtrp2W;
	Tue, 28 Jan 2025 19:48:29 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-cb-6799348d6ff9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 52.E0.19920.C8439976; Tue, 28
	Jan 2025 19:48:28 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250128194827eusmtip138f2cc589f7df90985241c3815b21534~e8wSu4kgR0819608196eusmtip1J;
	Tue, 28 Jan 2025 19:48:27 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
	<m.wilczynski@samsung.com>
Subject: [PATCH v4 03/18] dt-bindings: firmware: thead,th1520: Add support
 for firmware node
Date: Tue, 28 Jan 2025 20:48:01 +0100
Message-Id: <20250128194816.2185326-4-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxjGd+69vffSrXotRM/YdIGBKTMUcARPsgUlaLwuS9T9s2xGoNFr
	ISsfa2HI3IYMyhCBuUYUykdZ12nDBFIolRKxsTJAlPLhQBalYARKCeNDrJsoMErr5n+/53nf
	c573PTk0LrxK+tNJKemcPEUiCyT5hKnjmS20OLJcGr6yGoW67mkx1PxcTaErbTYMadptPGQf
	MGLoD9ccieon+ig01ZZDoCF9FYVyOxpI5FTbSbRQZOehu62VJFosbgfItJhHorr2EQo1uDQY
	+nmhmUC6llaA8s9c4qH+7n1oxN5FIOfdIhzlqzei1WstFFoZMhCoYtZCIePMTzzUWfcpyrOc
	J/ZsY+eGlRQ743QS7M2CJxTb9rSGYM3qEYotMt8BbGPtGZJ9MHSNZKtvHWZHz3ZibJMum82r
	68DYH5fD2bnrgyRbYqwF7EDuPeqQ8HP+h8c5WdJXnDwsOoGfWOPqINMcm09OWFvAaTApLAQ+
	NGQiYYFjEi8EfFrI6AE0WQu94gmA1Sol5RGLADZcMJAvj/SaR7yFywD+M16GecQMgBX1Ksrd
	RTI74dhlDc9d8GOUBFT+ngPcAmccaynjlet3+TJx0KFrwNxMMMHQaleu+TQtYHbD0amtnrh3
	oOVGD+5mH2YPbFzWE24WMJvgrfLxdcbXenKbK9YHh4yBD00TS5jn8F5Y3dTlZV843WmkPPw2
	XDVrvH4qHGt+jHv4G2gu6vTyB/CBbWl9HpwJgQ2tYR47Bqp671NuGzIb4PBfmzwjbIAq00Xc
	YwtgQb73fbfD0qLi/0JtepM3lIUFTcW8cyBA/coy6leWUf+fWwPwWrCFy1AkSznF+ylcplgh
	SVZkpEjFx1KTG8Ha37690ulqAfrpBbEVYDSwAkjjgX6Co7YyqVBwXJL1NSdPjZdnyDiFFbxF
	E4FbBFqLUipkpJJ07guOS+PkL6sY7eN/Gruk+4Q29517HlFQefPU0n1UFjJ/1H5qav5G1Yni
	0vnEN198tPrL/je2kYLY2Jhs/8K/H+2IjhIuZsrlIKn5qvNjlTCoJvS1XZs3Pi7UH0m1zB6O
	qRLZStO+z37YO3ww+E8jr/v2Z1fKmF8jOBCp1QSMXeftp7VqR2RYvL6Jl1kTGRwkmwuaFpUd
	ELUdTNv7ZdS+Y/p3e7Jazhqe1gu+dQaUhN05eTFCNuv7g9EgW46eKc+LS48fDH496/xgd+hv
	hx7tyhlcGEo4sDNjJee7Ha7dowM9D1+E+NTPzGeLSjIsz8LjJhsFfQn9tdpV2ag+S6TsES+K
	lQid6PXzc8Ru36o70h9IKBIlEe/hcoXkXx5ox0RKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xu7o9JjPTDS6/tLY4cX0Rk8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
	cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
	5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
	F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
	vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
	k5Kak1mWWqRvl6CXseDrMbaC52IVTw/tYGxgfCbUxcjJISFgInF+5132LkYuDiGBpYwSpxbN
	YYNIyEhc637JAmELS/y51sUGUfSKUeLH/oOMIAk2ASOJB8vns4LYIgKLWST27qsEKWIWeMso
	cX3mRrBuYYEYid/7X4FNZRFQlTh0rxXI5uDgFbCXuP9CFmKBvMT+g2eZQWxOAQeJTX9XgLUK
	AZU8ejsDrJVXQFDi5MwnYHFmoPrmrbOZJzAKzEKSmoUktYCRaRWjSGppcW56brGhXnFibnFp
	Xrpecn7uJkZgetl27OfmHYzzXn3UO8TIxMF4iFGCg1lJhDf23Ix0Id6UxMqq1KL8+KLSnNTi
	Q4ymQGdPZJYSTc4HJri8knhDMwNTQxMzSwNTSzNjJXFet8vn04QE0hNLUrNTUwtSi2D6mDg4
	pRqYhAwn61f6dzW4qqp8k7cqXyPwZ/uuJVdubfyw2MZMS53717R9Wy5xdF+vynp8aZrQFBU/
	U3YrA0PbY8veGs057S1ndcQ7ISWLW2rel8Vy0bXHGW50Zu4+E/xd48fZFONjyr0r/9vU8923
	+R07daX9n8XW4h3hDCyiUadrHJdOn5q+dFq/ZaKmsmwgm1SS2UZGT/Hb11gz71yOFL0jdWiT
	ZaKZ/rk66T1POnMZPviGR946sHyCnr0X84LkAlOHKaLxv8+zfHkQ8ue01onSZxwGTGqRUdyt
	6iURd10nNvH1dYutPWdeeffExT023m2aO15taVple/fk+qWTevzlrDprA5bfWd56ctv27Vo9
	nyYpsRRnJBpqMRcVJwIAC3U0PbgDAAA=
X-CMS-MailID: 20250128194829eucas1p279fb146417854b28366378793087694a
X-Msg-Generator: CA
X-RootMTR: 20250128194829eucas1p279fb146417854b28366378793087694a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194829eucas1p279fb146417854b28366378793087694a
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
	<CGME20250128194829eucas1p279fb146417854b28366378793087694a@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_114838_333261_2AC2BC3C 
X-CRM114-Status: GOOD (  16.55  )
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

The kernel communicates with the E902 core through the mailbox
transport using AON firmware protocol. Add dt-bindings to document it
the dt node.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/firmware/thead,th1520-aon.yaml   | 53 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml

diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
new file mode 100644
index 000000000000..bbc183200400
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/thead,th1520-aon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 AON (Always-On) Firmware
+
+description: |
+  The Always-On (AON) subsystem in the TH1520 SoC is responsible for managing
+  low-power states, system wakeup events, and power management tasks. It is
+  designed to operate independently in a dedicated power domain, allowing it to
+  remain functional even during the SoC's deep sleep states.
+
+  At the heart of the AON subsystem is the E902, a low-power core that executes
+  firmware responsible for coordinating tasks such as power domain control,
+  clock management, and system wakeup signaling. Communication between the main
+  SoC and the AON subsystem is handled through a mailbox interface, which
+  enables message-based interactions with the AON firmware.
+
+maintainers:
+  - Michal Wilczynski <m.wilczynski@samsung.com>
+
+properties:
+  compatible:
+    const: thead,th1520-aon
+
+  mboxes:
+    maxItems: 1
+
+  mbox-names:
+    items:
+      - const: aon
+
+  "#power-domain-cells":
+    const: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+  - "#power-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    aon: aon {
+        compatible = "thead,th1520-aon";
+        mboxes = <&mbox_910t 1>;
+        mbox-names = "aon";
+        #power-domain-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d49306cc17e3..002eaae363aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20340,6 +20340,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
 F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
