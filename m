Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050D3C282D3
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=Qi/EFlDsGC0u9kAai/07eWXQmXNw95x3lztXNAinglk=; b=vtBa1uGTKkOK0n
	yQ27P9zr7wRKK+Xo8DIKvo9/0LAb7b0Dm6exZF7tRu8jZ4S2Vf4UpoClUM6PJxcRX7ucJZxIs/h9p
	eL2+H+LaVzSarl5p6q4bEAy/50l5+sHRMiqzFXhHG+0yrh3i6be0fAGQopOWQwcbMoWCTXr9rrCa7
	gAruxCRQIMGS3Xw3LsIIaYFDmBzjmc8NVbVAdfdniEaX4GkoqVwxmdgivwgbHL7SH1tGC6V65nScb
	0p1Vp3kL6sXfuvecH9wAEjsowxXSSsrgAMjhRU5mPpOXKFX/E41rrTWHqe2Vjct3bYLCe8sbM/Rfq
	84nTGZh2z5DB5Ikea34w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7GR-00000001C63-2CWW;
	Mon, 03 Mar 2025 14:59:27 +0000
Received: from [210.118.77.11] (helo=mailout1.w1.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7GM-00000001C0t-1z7o
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 14:59:25 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250303145918euoutp01b6a6d9faf6eb397ad64d8c2c0baa0f63~pUvihZv260408604086euoutp01O
	for <linux-riscv@lists.infradead.org>; Mon,  3 Mar 2025 14:59:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250303145918euoutp01b6a6d9faf6eb397ad64d8c2c0baa0f63~pUvihZv260408604086euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741013958;
	bh=XEcDJFcbja1D97z3Z+kckgPRPhSOypNgkh6K3+gjOSY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=oGuLpio1RvbmIWbCeeU102zVslrnwLXWdDBNwgQjlFOkuV33T9clMejFReui6+dEz
	 I7WqrUVHF0g6F+cYHbHw1DBS1BU8UZgUNKBhFqeZHxRunsMK2L/WtW4DTgs4G846Ei
	 H+RdvqhmaOEuQhwkj87mqlfvYDemcc65qaT7JrJs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250303145918eucas1p126c2cb0be2a456e62b4654a1552c7da3~pUviLu-6Z0745207452eucas1p16;
	Mon,  3 Mar 2025 14:59:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id D4.50.20821.6C3C5C76; Mon,  3
	Mar 2025 14:59:18 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250303145917eucas1p171f8fcccadddc035f5773f7026a281e3~pUvhin3Eu1309713097eucas1p18;
	Mon,  3 Mar 2025 14:59:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250303145917eusmtrp16eca5e99ae115c6c12ddf406c8523d16~pUvhhy2g52312323123eusmtrp1W;
	Mon,  3 Mar 2025 14:59:17 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-7f-67c5c3c62dd0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id CE.1D.19654.5C3C5C76; Mon,  3
	Mar 2025 14:59:17 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250303145916eusmtip23651f23fd9a7ab0b85511596a1b416c3~pUvgq0rQa0239102391eusmtip2G;
	Mon,  3 Mar 2025 14:59:16 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, ulf.hansson@linaro.org, m.szyprowski@samsung.com
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal
	Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v1 0/5] TH1520 SoC: Add AON firmware & power-domain support
Date: Mon,  3 Mar 2025 15:58:56 +0100
Message-Id: <20250303145901.446791-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7djPc7rHDh9NN9i4SNji2Z2vrBZbf89i
	t1iz9xyTxfwj51gt7l3awmTxYm8ji0XzsfVsFi9n3WOzuLxrDpvF594jjBbbPrewWaw9cpfd
	Yv3X+UwWLy/3MFu0zeK3+L9nB7vF8bXhFi37p7A4CHm8efmSxeNwxxd2j3snprF6bFrVyeZx
	59oeNo/NS+o9WtYeY/J4v+8qm0ffllWMHpear7N7fN4kF8AdxWWTkpqTWZZapG+XwJWx89ZF
	5oKD/BUbGg+wNzD+5O5i5OSQEDCRePryAHMXIxeHkMAKRolPrz4zQThfGCW2HbjACuF8ZpRY
	cfwpO0zLvO/TWEBsIYHljBJXD7JAFL1hlDh88wwzSIJNwEjiwfL5YN0iAv1MEn1H/oM5zAIr
	GSXuXzgLViUs4C1xdNtzoAQHB4uAqsSDqQEgYV4BO4l120+yQGyTl9h/EKKcV0BQ4uTMJ2Bx
	ZqB489bZYIdLCMzmlNh0q5cdZI6EgItE9+FCiF5hiVfHt0BdLSNxenIP1Mx8iQdbPzFD2DUS
	O3uOQ9nWEnfO/WIDGcMsoCmxfpc+RNhRYtG1F6wQ0/kkbrwVhLiAT2LStunMEGFeiY42IYhq
	NYmpPb1wS8+t2MYEYXtIdMxqZ4UEW6zE5uu7WScwKsxC8tcsJH/NQrhhASPzKkbx1NLi3PTU
	YsO81HK94sTc4tK8dL3k/NxNjMBkePrf8U87GOe++qh3iJGJg/EQowQHs5II7632o+lCvCmJ
	lVWpRfnxRaU5qcWHGKU5WJTEeRftb00XEkhPLEnNTk0tSC2CyTJxcEo1MKmqFy64I35ve2De
	os9nhJ9+YnFecD5t1galRUvE7k6cMrsz91l6Gn/c84kmFQemrjaIv2JxX5y1TcRn9p8KSR5j
	iUeiK/l3K4RuedR/w3SxKMsz54Ta75YXkuruur81zFzustjrk9Am6e1OXmWzK0TyDGSvnzA+
	pfWk2DPnqsQMrpehl0t0Y7nqz60++vCervKEJPfYW4HfjNIDlfy5NQ9f+5n98x+z+5xWo8bF
	mr9TVq34pHRJbmpLlLUT70Lm3HcO/1OWfzNVrxf57bDYMbxFumfL1WTxI6kHDbZlN3NM/Ga8
	cafWX+fsTUFbXcQnXAx/IxZ2W+yv095dBY+Dfr1ZyfMr5UAm78H0rXtb3iuxFGckGmoxFxUn
	AgDxV4fw9QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xe7pHDx9NN1jwT83i2Z2vrBZbf89i
	t1iz9xyTxfwj51gt7l3awmTxYm8ji0XzsfVsFi9n3WOzuLxrDpvF594jjBbbPrewWaw9cpfd
	Yv3X+UwWLy/3MFu0zeK3+L9nB7vF8bXhFi37p7A4CHm8efmSxeNwxxd2j3snprF6bFrVyeZx
	59oeNo/NS+o9WtYeY/J4v+8qm0ffllWMHpear7N7fN4kF8AdpWdTlF9akqqQkV9cYqsUbWhh
	pGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJex89ZF5oKD/BUbGg+wNzD+5O5i5OSQ
	EDCRmPd9GksXIxeHkMBSRon7Xc3MEAkZiWvdL1kgbGGJP9e62CCKXjFKzL27H6yITcBI4sHy
	+awgCRGBhUwSV6dsYAZxmAXWMkocvnqJHaRKWMBb4ui250BVHBwsAqoSD6YGgIR5Bewk1m0/
	CbVBXmL/wbPMEHFBiZMzn4DFmYHizVtnM09g5JuFJDULSWoBI9MqRpHU0uLc9NxiI73ixNzi
	0rx0veT83E2MwFjcduznlh2MK1991DvEyMTBeIhRgoNZSYT3VvvRdCHelMTKqtSi/Pii0pzU
	4kOMpkDnTWSWEk3OByaDvJJ4QzMDU0MTM0sDU0szYyVxXrYr59OEBNITS1KzU1MLUotg+pg4
	OKUamGQPJ/ieYS9QNuN/ekAqJVXng/VKQ4W379KUbhWbsO96wOKcwvjsyLEVjyxYDhYFz6i4
	ocn2oL7XSarjG/O2hvDXDxoLah/tEDss+EbxANOCzlWhx/YWJZuJMWWZ//v8uEzi+envsaz7
	H5Z7/+c/8O9g9e06tari07F3xDZkzlltu/9k79/6rQsXSDQv3P/8YsHuiZvT5dYGW+Zd3Rj6
	Z6P3L9aN64PbMgzDNWWK+nnrXA1OrVDlmjR90uJCIX6rrydnr1e9uZEjTO1i3MwCnUdHBYzN
	Y0yrbYPTtmpoX9/4xWeXx03urev3XJn0rVZXJUpmdV5BT/lumQb7azLqzDuX2ZwLY/NgUTth
	er3mthJLcUaioRZzUXEiAIi+4D1OAwAA
X-CMS-MailID: 20250303145917eucas1p171f8fcccadddc035f5773f7026a281e3
X-Msg-Generator: CA
X-RootMTR: 20250303145917eucas1p171f8fcccadddc035f5773f7026a281e3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250303145917eucas1p171f8fcccadddc035f5773f7026a281e3
References: <CGME20250303145917eucas1p171f8fcccadddc035f5773f7026a281e3@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_065923_245014_5C24B616 
X-CRM114-Status: GOOD (  10.89  )
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

This patch series introduces and documents power management (PM) support and
the AON firmware driver for the T-Head TH1520 SoC, as used on the LicheePi 4A
board. While part of a larger effort to enable the Imagination BXM-4-64 GPU
upstream, these patches can merge independently.

Bigger series cover letter:
https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/

Michal Wilczynski (5):
  dt-bindings: firmware: thead,th1520: Add support for firmware node
  firmware: thead: Add AON firmware protocol driver
  dt-bindings: power: Add TH1520 SoC power domains
  pmdomain: thead: Add power-domain driver for TH1520
  riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs

 .../bindings/firmware/thead,th1520-aon.yaml   |  53 ++++
 MAINTAINERS                                   |   5 +
 arch/riscv/Kconfig.socs                       |   1 +
 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/thead,th1520-aon.c           | 247 ++++++++++++++++++
 drivers/pmdomain/Kconfig                      |   1 +
 drivers/pmdomain/Makefile                     |   1 +
 drivers/pmdomain/thead/Kconfig                |  12 +
 drivers/pmdomain/thead/Makefile               |   2 +
 drivers/pmdomain/thead/th1520-pm-domains.c    | 209 +++++++++++++++
 .../dt-bindings/power/thead,th1520-power.h    |  19 ++
 .../linux/firmware/thead/thead,th1520-aon.h   | 200 ++++++++++++++
 13 files changed, 760 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 create mode 100644 drivers/firmware/thead,th1520-aon.c
 create mode 100644 drivers/pmdomain/thead/Kconfig
 create mode 100644 drivers/pmdomain/thead/Makefile
 create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
 create mode 100644 include/dt-bindings/power/thead,th1520-power.h
 create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
