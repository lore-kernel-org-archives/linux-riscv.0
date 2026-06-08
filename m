Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD78CD8C8E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 07:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=cWzUkK36mb8+mPDIw1GLUulelZExT2Yeq94ocNhWj0U=; b=XBjCYELgkyv6Rk
	mU5//oKggn2W1vzhoYa2r0k4W9tPq/NROMsb0J9V+2STHoleXY8gsCSORDwfLuld5HLIZamEe9FoI
	mbCOJ1FM7T/XLM9B3YzhhPl/e+/2aXXZ5Athl9qotwIoA4wGf7nMpDeszs5aTP7valJk2jBf+iLuX
	AjSoyj028pdrA5k9uEBTfSUPWpgSMF7yNPyJ41hK/YS3CxTtpIAID9Kg69mV5lYn9w/BVnbNXUMLw
	KAGnqsYycHZXLF0b4tdp7HKRRTvNPuDTTDS2HGRrn8XjfDaGl9ZRY5maR0cFIy22RVJBdTIWvvHyb
	5v8L785dG/cnPy5WxESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUbz-000000030KM-3GqY;
	Mon, 08 Jun 2026 07:41:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUby-000000030Jz-0Zma
	for linux-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 07:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description:In-Reply-To;
	bh=d+LGia6BRCpn+6sp11xiCdpjBF97jXBcQxKthDSlXFk=; b=qP2OW5+EDKYTB3Jo7ot/WwvRtW
	zsw5XczNwJhkaEADhNK3sKbIzkPyzOP/lxrbSgsjg/8gZCJYQQH4tzBYSU33yDopGFVGXv09tX8Zx
	w9KFhsyTUG5gaxN+VLKXyrx82p4+6T3n/1qW3e4jCAHXtqD+hjGca5pe+djT2Eb4SOEA1O37TqPfW
	mXNHZDYmF4CuBfe476pp4nzORUhQszq6O9+ZqLe15pmsYlOg3yO4hU99MKUT4P6AYNNQFEAAOpjtX
	KXXD6oDHEN7WB+Ko7QW5tppHwJoLZJf2jSu66lFtWwn2U9Rqm6JqD8l5xFes7kE/WUZn2V0Io/riV
	+kL3LIFg==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWUbu-00000000epf-1KP3
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 07:41:28 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260608074116euoutp0207bbfbbd2fa843376b05be49bd6aa327~3Cy_jAVbT0813908139euoutp02d
	for <linux-riscv@lists.infradead.org>; Mon,  8 Jun 2026 07:41:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260608074116euoutp0207bbfbbd2fa843376b05be49bd6aa327~3Cy_jAVbT0813908139euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1780904476;
	bh=d+LGia6BRCpn+6sp11xiCdpjBF97jXBcQxKthDSlXFk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=flCKLUXIN1fNst18o3lkAFBdkg8/BP6ovc510nunGxL/5FqecIQAXBHEQJhZ9v6JB
	 Ig3mWcuf1PCFwHY4H5ZQV96U+cVI1saUtWjxv8tV5MIvVDH9NkdTKzdtoyv5+QmSow
	 dbUMp23k06zdoBxiZWpr/8FaRoTZtud3GVdZDBjE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260608074116eucas1p15c0f84c280d8645d778e42777bd238d1~3Cy_VC3aj2851428514eucas1p10;
	Mon,  8 Jun 2026 07:41:16 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260608074114eusmtip114308ce4c07c9abd405e796bcc15e854~3Cy8Z63YN1469214692eusmtip1s;
	Mon,  8 Jun 2026 07:41:14 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-riscv@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Drew Fustini
	<fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: [PATCH v2] riscv: defconfig: thead: enable PCA953X GPIO driver
Date: Mon,  8 Jun 2026 09:41:04 +0200
Message-Id: <20260608074104.2198409-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20260608074116eucas1p15c0f84c280d8645d778e42777bd238d1
X-Msg-Generator: CA
X-RootMTR: 20260608074116eucas1p15c0f84c280d8645d778e42777bd238d1
X-EPHeader: CA
X-CMS-RootMailID: 20260608074116eucas1p15c0f84c280d8645d778e42777bd238d1
References: <CGME20260608074116eucas1p15c0f84c280d8645d778e42777bd238d1@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_084126_602814_E4378CEA 
X-CRM114-Status: UNSURE (   8.31  )
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

Enable PCA953X GPIO driver to properly probe Wifi pwrseq driver on
LicheePi4a board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- copile GPIO_PCA953X as a module
v1:
https://lore.kernel.org/all/20260603082132.3200787-1-m.szyprowski@samsung.com/
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 08445df56006..a51a423d53f4 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -174,6 +174,8 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
 CONFIG_GPIO_SPACEMIT_K1=y
+CONFIG_GPIO_PCA953X=m
+CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_SENSORS_SFCTEMP=m
 CONFIG_CPU_THERMAL=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
