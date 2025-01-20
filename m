Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD89C0218B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 17:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvE71Y3jKcMe03uc7EDUEXxA36BsLQ/9YRF1vuPtaks=; b=nV3zQsYTARvn5x
	UIt9pwsRZ8zApljf9IJ3d1GH556A+bN4ZpyBunqew0b5JLYeSVDKensQkq5KFx4xFkWVSOIxqUzAD
	B1a1OmFh63A1QhJlrWbKOm7+9gu9wqKSWARjVI/+87sbtbjDky4AhuP8BZkcGctZppSCGeU3jiWuf
	72QS7WbT7TQaX9LCFDCs91jSvwrKBO3m7jUMbEYSrtjoMoRlC4XKm6Fit5Q3AM1egr4c3NJmG4P8z
	T26P4eH22iw+3uphR1Hs0fMvUnq1JK7xd+MWIxZWL2AW+cZCfhUkS3IDzt3npsG14VK7tSEs6Vi2K
	gdmkCGDFzBZ1xjKEIyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvUj-000000067rW-1UPc;
	Mon, 20 Jan 2025 17:23:25 +0000
Received: from [210.118.77.11] (helo=mailout1.w1.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvSr-000000066wP-0mD7
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 17:21:32 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250120172127euoutp01422e8f3c6edd6736d871f661f6a5d248~cdlqoBGDh2431924319euoutp01N
	for <linux-riscv@lists.infradead.org>; Mon, 20 Jan 2025 17:21:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250120172127euoutp01422e8f3c6edd6736d871f661f6a5d248~cdlqoBGDh2431924319euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1737393688;
	bh=db70OtbkcGzgNDsJliSTwbkZ7rSF5HHS/kqbDimn6GA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tc6oaKvxUM8VmmoOwdqLWXB/Nxt2YUc3F9U8IX3Qa1XgJyfj5s9ZXVYpFcea16xgB
	 i7SJImv+DoWjnazJt/4exa9NJe64vjpfZUtFXk/86DcvPFvTADb4tF/nQxOwQmngTL
	 L34cs1V+5gwUeOyg8QETmGtzkO2gGQ9oersA5dOI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250120172127eucas1p207cd89c4b65cdb8de8b1725b9e3834ac~cdlqLnMqp3181531815eucas1p2a;
	Mon, 20 Jan 2025 17:21:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 62.66.20397.7168E876; Mon, 20
	Jan 2025 17:21:27 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250120172127eucas1p18a33aa80018ff77317c7f02cf94f8e79~cdlp1Qg_K1576715767eucas1p1H;
	Mon, 20 Jan 2025 17:21:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250120172127eusmtrp24036d9495c53f1feafd0cf551e10e9a5~cdlp0fyOP0490804908eusmtrp2p;
	Mon, 20 Jan 2025 17:21:27 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-4c-678e86178917
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id ED.C8.19920.6168E876; Mon, 20
	Jan 2025 17:21:27 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250120172125eusmtip1758d65ab598a3e22c766c4e95e43e656~cdlohfgLz0708407084eusmtip1n;
	Mon, 20 Jan 2025 17:21:25 +0000 (GMT)
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
Subject: [RFC v3 06/18] riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
Date: Mon, 20 Jan 2025 18:20:59 +0100
Message-Id: <20250120172111.3492708-7-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTVxiHOffe3tt2q14LrmcgUzEzEyeoY/HMyVYNy27C/gBZtqBboMhN
	raPAWmCbMQoBqmJxihSyFgWbCpXByLCtwMQqYguo1fFVFmxHDGarQRnyJRJw0Iub/z3nfX/v
	ec6bHD4utpDBfEV6FqtKl6WFkULC5phxbZJoTso3D1tDUIfbiCHrrJ5Cda0uDFW2u3jI223B
	UO/kKIl+eXiPQn+35hGo33yWQvmOBhL59F4SjWm9PNTTUkGi8eJ2gGzjBSSqb/dQqGGyEkPn
	x6wEMjW1AKQ5Xs1Dv3d9gjzeDgL5erQ40uiXoxdXmig03/8rgQxP7BSyjJzmIWf9l6jAXkpI
	32JGBwopZsTnI5gbxyYopnWqimCa9R6K0TbfBkxj7XGSud9/hWTOdcYzf55wYswl0xGmoN6B
	MT/ObWZGr/aRzElLLWC6891UnHiPcEcqm6bIYVWRHyUL99+01eGZpYLvC8rrqFxwiyoCAj6k
	o+CortPPYtoM4KVqUREQLvAEgB2VNpJrjAN4vg5/OdB5tozHhWoAvKt5QHChEQD1E8wik/RW
	OFRT6Q8F0YUELLyZBxYPOP0XgLbhCv+1gTQDPUft/msJ+m1ovzGCLbKI/hg23jMu6VZD+/U7
	fhbQUjjd10pxmRWw86dhvxlfyORbDfiiANIXhTCvs4TghmOgtsFEchwIHzktS0uvgi+aKzGO
	M+CQ9emS7BBs1jqX+EN43/V8YZa/INgAG1oiufJOWDXlIBbLkF4GBx6v4J6wDJbYynGuLILH
	NGIuvR7qtMX/SV1mG8ZFGDhds/EUWKt/ZRf9K7vo/9dWAbwWSNhstVLOqt9LZ7+LUMuU6ux0
	ecS+DGUjWPjYt+adk03A/Ggsog1gfNAGIB8PCxKt/EcrF4tSZT8cZFUZSarsNFbdBkL4RJhE
	ZLQXysW0XJbFfsOymazqZRfjC4JzMcnPu97ZvTbtt8MxXbl5y4e3KgcvnxIVxBYfTDBrQp7Y
	PVF7Zx4Hl885dhq7hXEV2669lr83vKTrstG7biJkR1Ts4eRV0dHzf8w+XTc0177dFLrFHf2+
	Ii58n67o86zJ+F131WcU0ZkK38OVxYaS0k0VVUTkV9V3YkNz1ggCUnm4JGsg5YDr6pt7LBsw
	44MUa+jtFG/0kQsSCTpwQvEGzYtxmtd8mjtoSjLpykTPdeK+cwFZU33bv74mNYwZEuMz3IMf
	fLtaTwT2Rm7r7XEdsn02HWSWNkVoZr4ImElU1rTGrr9ehr2b7xuLcs+qn8XUJ7DxR09TGxOT
	S3N2J0i7n73ekxRGqPfLtoTjKrXsXxK41F9HBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xu7ribX3pBq8+MVmcuL6IyWLr71ns
	Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
	uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
	cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
	C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
	31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
	SUnNySxLLdK3S9DLOLptDXPBFM6Klulr2BsYT7N3MXJySAiYSJycO421i5GLQ0hgKaPE6nWH
	mSESMhLXul+yQNjCEn+udbFBFL1ilHi/YgoTSIJNwEjiwfL5rCC2iMBiFom9+ypBipgF3jJK
	XJ+5EaxbWMBD4m77frCpLAKqEvsPvwFr5hWwl9h0YRHUNnmJ/QfPgtmcAg4S36/uBTtPCKjm
	ztVuRoh6QYmTM5+AzWQGqm/eOpt5AqPALCSpWUhSCxiZVjGKpJYW56bnFhvqFSfmFpfmpesl
	5+duYgQmmG3Hfm7ewTjv1Ue9Q4xMHIyHGCU4mJVEeEU/9KQL8aYkVlalFuXHF5XmpBYfYjQF
	unsis5Rocj4wxeWVxBuaGZgamphZGphamhkrifO6XT6fJiSQnliSmp2aWpBaBNPHxMEp1cC0
	9fJ+PbM8HZZ9Z3d4Cc8y758/5dYigR8xzbP3hm0T4s51PPNssu3364EhpqsywpVqlMI0m/+X
	3TqsOrvL+abx7cKr0xInpBvpr45s2pu6yTX3f1DeoutnF2dnnL/j9cPhx3ettxM760oW6Wbo
	MfbaXU48mMkSvsVca+Pm7j4mn/sdbxrEXMT0lVPdVlUb3nigziD0z/tJdidj01zbPp+c1arx
	H86wf8gqNZnxKrDg6bNgzdPCjEmRaddb10335zu2p1RUM7NbO8aTzzvvhP9nBqkci3QGw7qr
	j8ImFe1jcg7b0LyH52qfV7nZajGVQ5rpT1dNVjdtq+64eCny5QvtANfTT6Rtp0l9b049osRS
	nJFoqMVcVJwIAN4Rz1i5AwAA
X-CMS-MailID: 20250120172127eucas1p18a33aa80018ff77317c7f02cf94f8e79
X-Msg-Generator: CA
X-RootMTR: 20250120172127eucas1p18a33aa80018ff77317c7f02cf94f8e79
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172127eucas1p18a33aa80018ff77317c7f02cf94f8e79
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
	<CGME20250120172127eucas1p18a33aa80018ff77317c7f02cf94f8e79@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_092129_487323_33489952 
X-CRM114-Status: GOOD (  10.83  )
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

T-Head SoCs feature separate power domains (power islands) for major
components like the GPU, Audio, and NPU. To manage the power states of
these components effectively, the kernel requires generic power domain
support.

This commit enables `CONFIG_PM_GENERIC_DOMAINS` for T-Head SoCs,
allowing the power domain driver for these components to be compiled and
integrated. This ensures proper power management and energy efficiency
on T-Head platforms.

By selecting `PM_GENERIC_DOMAINS`, we provide the necessary framework
for the power domain drivers to function correctly on RISC-V
architecture with T-Head SoCs.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index f51bb24bc84c..c414dc618b66 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -48,6 +48,7 @@ config ARCH_THEAD
 	bool "T-HEAD RISC-V SoCs"
 	depends on MMU && !XIP_KERNEL
 	select ERRATA_THEAD
+	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the RISC-V based T-HEAD SoCs.
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
