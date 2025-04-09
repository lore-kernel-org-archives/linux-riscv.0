Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6A3C369A1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 09:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=G/wJudNFM+Hc3Wu4fOuGSN3e0LoLeLBJV1EG3f7H9MU=; b=Gc/6r3Ll8oMBie
	0NUiTYuK4QiObJ0FZoYf9veZIwasLVqqYSxK/cAwI8/9Fn5ZY60N9WbgXSaOmr3zgPoCQXje753JR
	i/RQQJmpXwdm3WtrSv5eR1H8ZFn0k5nXNrOwTc8kBJRT24XpgSbJz3x5RFZ7q1UfuJUy04MLSiu/q
	HyhFq87/KGDa0cGWNegvBEAmMwbTOGRGRb/Vqp8kgUifSs7jTWnsUCpfJVPQLnLnfcJ9PbOg5LErJ
	l/KBUb3r6q+mUljiRBJTsmWhj4//ir2VvilOBfsfxBHFFkI08Z3sgV/CQ3Mx1gcUgKCT5TuIL5RJb
	QsQAdCybFnycXLwpU01Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Rli-00000006iF8-1Wcn;
	Wed, 09 Apr 2025 09:30:52 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RlU-00000006iAx-2eI5
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 09:30:38 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250409093031euoutp0167ea1d3f12d06f3d5abb8f001e9e1189~0nICH4Sdy0307603076euoutp01-
	for <linux-riscv@lists.infradead.org>; Wed,  9 Apr 2025 09:30:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250409093031euoutp0167ea1d3f12d06f3d5abb8f001e9e1189~0nICH4Sdy0307603076euoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744191031;
	bh=Y0arb6a2cUUbDBbem7ZVwaSlN4egRmPACY0ozOv7H2w=;
	h=From:To:Cc:Subject:Date:References:From;
	b=UnBUVMvPJQCsyrgqpMkYrX0AQwrOn875k7k+BfYO8WChGmr7KT8nknhUEO96uQlSc
	 305ZPEV3zK/BYoStBjNyTnPBL4Q5HzJ2bjXWPcST1bymHufWk3DMx61PMBr1G3JKYX
	 y5cxxyMqH8fNGL7LaPpBiQT43JH4pMnwPDzp1/fo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250409093031eucas1p18aeaff17a1a24ce28a96f976ab1644d1~0nIBv9TF62724127241eucas1p1S;
	Wed,  9 Apr 2025 09:30:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 2E.6D.20409.73E36F76; Wed,  9
	Apr 2025 10:30:31 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250409093030eucas1p174de911d268d13d4aef336117d3c326f~0nIBLCLzq2501725017eucas1p1a;
	Wed,  9 Apr 2025 09:30:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250409093030eusmtrp22036d8199d64ed5d39d4e9bd4a972ba7~0nIBKMh3h2888728887eusmtrp2T;
	Wed,  9 Apr 2025 09:30:30 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-45-67f63e3775b4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 72.2D.19654.63E36F76; Wed,  9
	Apr 2025 10:30:30 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250409093029eusmtip28b871a7be9c1416042d89926617617a7~0nIAh6GCJ0408304083eusmtip2l;
	Wed,  9 Apr 2025 09:30:29 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com,
	guoren@kernel.org, wefu@redhat.com, ulf.hansson@linaro.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v1 0/2] Add GPU clock/reset management for TH1520 in genpd
Date: Wed,  9 Apr 2025 11:30:23 +0200
Message-Id: <20250409093025.2917087-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRmVeSWpSXmKPExsWy7djPc7rmdt/SDT5/YLFYs/cck8W9S1uY
	LF7sbWSxeDnrHpvF5V1z2Cw+9x5htNj2uYXNYu2Ru+wW67/OZ7K4e+8Ei8X/PTvYLY6vDbdo
	2T+FxYHXY9OqTjaPO9f2sHlsXlLv0bL2GJNH/18Dj/f7rrJ59G1ZxejxeZNcAEcUl01Kak5m
	WWqRvl0CV8ahq2eYC77xVRw+9oexgfEUTxcjJ4eEgInEhOnPWboYuTiEBFYwSqy58okNwvnC
	KPHz9gYmCOczo8TLO5MZYVq6f+6EalnOKHF81xNGCOcNo8TU37vYQKrYBIwkHiyfzwqSEBHY
	yyjReeoDM4jDLNDNKLF22w1WkCphAS+JJ103wOayCKhKXJ90HqybV8Be4uKnVmaIffIS+w+e
	ZYaIC0qcnPmEBcRmBoo3b50NNlRC4AGHREtnGztEg4tEx90eVghbWOLV8S1QcRmJ/zvnM0HY
	+RIPtn6CWlAjsbPnOJRtLXHn3C+gIziAFmhKrN+lDxF2lHjy6Cg7SFhCgE/ixltBiBP4JCZt
	m84MEeaV6GgTgqhWk5ja0wu39NyKbVBLPSQuHu4Fs4UEYiXeH3rPMoFRYRaSx2YheWwWwg0L
	GJlXMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBKaw0/+Of9nBuPzVR71DjEwcjIcYJTiY
	lUR43078ki7Em5JYWZValB9fVJqTWnyIUZqDRUmcd9H+1nQhgfTEktTs1NSC1CKYLBMHp1QD
	k5b2+8kfraW1rXsa7k/ebMdeyc08vTBmZoCgvt7sw1XbhJ7Obs7cJX9Gcbukn/UzQV2pFYeE
	ivf8LF2WPPdGlKBY7zX2/p7DcuKFMTd3bsvs3bR/Qc/Bs35b9QPN7ictXVu1kz/BZNdak/DH
	oRkZh61zOe6mpX9kt7aU8NPg9ElZzB6YY7Dn002pPTtyj/t0fLZkyhaaWt9lVnjwbfeRjXze
	t0+5H793M0z20J36cEbTiVk1zRrsh4ujbbY+bevUfFA3e4vBwn3M55l6ba6wesxt3udbv69w
	23z33Ju9O4+Z1AWevlQx5+3L1/Y5WTf3clbZpGrrRl90sWW7y+afUtvEN/nX+Y33n2aoCvoo
	sRRnJBpqMRcVJwIAGULQDtADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsVy+t/xe7pmdt/SDfoPS1us2XuOyeLepS1M
	Fi/2NrJYvJx1j83i8q45bBafe48wWmz73MJmsfbIXXaL9V/nM1ncvXeCxeL/nh3sFsfXhlu0
	7J/C4sDrsWlVJ5vHnWt72Dw2L6n3aFl7jMmj/6+Bx/t9V9k8+rasYvT4vEkugCNKz6Yov7Qk
	VSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+PQ1TPMBd/4Kg4f
	+8PYwHiKp4uRk0NCwESi++dOli5GLg4hgaWMEttWzWGDSMhIXOt+yQJhC0v8udbFBlH0ilHi
	1uYbrCAJNgEjiQfL54PZIgInGSXuvqoDKWIW6GeUmPrxClhCWMBL4knXDUYQm0VAVeL6pPNg
	G3gF7CUufmplhtggL7H/4FlmiLigxMmZT8A2MwPFm7fOZp7AyDcLSWoWktQCRqZVjCKppcW5
	6bnFRnrFibnFpXnpesn5uZsYgbGz7djPLTsYV776qHeIkYmD8RCjBAezkgjv24lf0oV4UxIr
	q1KL8uOLSnNSiw8xmgLdN5FZSjQ5Hxi9eSXxhmYGpoYmZpYGppZmxkrivGxXzqcJCaQnlqRm
	p6YWpBbB9DFxcEo1MEkvCg1R6U8O8VWo+mLpnVPXvq6n68i7V5M0mVtVfpc++/jcSK1qzh2X
	VJaJm+wXHDQImfTTRG/6W5fQWs7KigMHzshERrxxE9pQUi3kdOQV2/7kvqQ+F22hUxF72Pc/
	yXQMTOuYx7RLTPvXz5rTlzhraqW3iE79IT3x1+QNOlcqQ9+EXbRWe9B7fevrLLE/q4xdt3ra
	LVGLjTv9rSztZIUDQ9bS/9knpZSeCM3hWvnmwsofBcUptS7zQ9d+F5O9uTjR4OBJe4mUNa8i
	pp5YoeJ05bugiILL5Oqke1Vnep+fnN15derOg8vPcPydoHz56U8//k0r1M6/arevET6qLNHz
	KFTJ/+PRrXdvZO+xyFBiKc5INNRiLipOBACHESraJgMAAA==
X-CMS-MailID: 20250409093030eucas1p174de911d268d13d4aef336117d3c326f
X-Msg-Generator: CA
X-RootMTR: 20250409093030eucas1p174de911d268d13d4aef336117d3c326f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250409093030eucas1p174de911d268d13d4aef336117d3c326f
References: <CGME20250409093030eucas1p174de911d268d13d4aef336117d3c326f@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_023037_245482_EF7D3BD4 
X-CRM114-Status: GOOD (  11.35  )
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

This small patch series adds clock and reset support for the GPU in the
T-HEAD TH1520 SoC through the generic power domain (genpd) framework.

The TH1520 GPU requires a special sequence involving multiple clocks and resets
to safely bring it out of reset. Coordinating this sequence properly is
necessary for correct GPU operation. Following discussions on the mailing list
with kernel maintainers [1], the recommended approach is to model this
complexity inside a power domain driver, keeping SoC-specific details out of
the GPU driver, clock framework, and reset framework.

The first patch updates the AON firmware bindings to describe the clocks
and resets that the PM domain needs to control.

The second patch implements GPU-specific handling inside the TH1520 PM domain
driver, using the genpd start/stop callbacks to sequence the clocks and resets
at runtime.

This approach aligns with recent efforts to treat PM domains as SoC-specific
power management drivers, as presented at OSSEU 2024 [2].

This patchset continues the work started in bigger series [3] by moving the GPU
initialization sequence for the TH1520 SoC into a generic PM domain driver,
specifically handling clock and reset management as part of GPU bring-up.

[1] - https://lore.kernel.org/all/CAPDyKFqsJaTrF0tBSY-TjpqdVt5=6aPQHYfnDebtphfRZSU=-Q@mail.gmail.com/
[2] - https://osseu2024.sched.com/event/1ej38/the-case-for-an-soc-power-management-driver-stephen-boyd-google
[3] - https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/

Michal Wilczynski (2):
  dt-bindings: firmware: thead,th1520: Add clocks and resets
  pmdomain: thead: Add GPU-specific clock and reset handling for TH1520

 .../bindings/firmware/thead,th1520-aon.yaml   |  28 +++++
 drivers/pmdomain/thead/th1520-pm-domains.c    | 119 ++++++++++++++++++
 2 files changed, 147 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
