Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3266ACD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=GD0fY5/3v9jVnFfUNhLGdcmMZUINDL3le/qejJy5Bps=; b=n86t+lPK4JPaq6
	BhatQk5iUWEo4I+R9dWoLBqpUxIup38D046aPJoi97ZuqJPv4Ba1uFDwFJQKt3lJX/+b8i/O/AY/Z
	q9gUMkfO/d78809deMuwnqGLBi8sDbbINuUabMMHtSshQZE67U5TqUQi2+PPaUYLj2MONEvL6HHal
	lu7rgdhHvk22FNlJU53tyRTtJx4CGzsVkihhZz7XmhPJHK5XJWWYy62vkT8BDGrKnbv09Q5LvATqy
	VG1X9eJxCKD+EMIszBXoYKnHoY13eSvDZDUwCepHgNPsU3Fb64t4U9NU5OJa7SKua3s2Gpuae2IlO
	LhGVkYuc/a+IArdq2jYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgrZ-0000000EZwv-1AYx;
	Wed, 03 Jun 2026 08:22:09 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgrT-0000000EZir-3tS1
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:22:07 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260603082157euoutp01e82452044c5615a884d2466603f70ee8~1hID3ZtVd2273122731euoutp010
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jun 2026 08:21:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260603082157euoutp01e82452044c5615a884d2466603f70ee8~1hID3ZtVd2273122731euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1780474917;
	bh=SAqb9w1AiOsNCF3wjfMLZwtgBl1qxKLUQad9icvEUo0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=SkMUuSu/H/Sb6WhublGwwTqpBPfU1esZMo/jSOm3mW74rG3jO3pFQ4Q2RzkxNPGGX
	 ovJgju9l3c0MAnO42DIAoQOxXnYAJKbG4JViJqaNk53cmvZ3V0Jt7OLijlU9oHh5dH
	 /KdBMJjOWFkSiC0P6Teleob9OKaUKOjzFwFKYQ6U=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260603082156eucas1p1f44a198f7957d9d82ec0b8bc296fb03c~1hIDkpYq30809808098eucas1p1e;
	Wed,  3 Jun 2026 08:21:56 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260603082156eusmtip2b81b77ab34355333315be1787296bc98~1hIDIpBoQ0579205792eusmtip23;
	Wed,  3 Jun 2026 08:21:56 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-riscv@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Drew Fustini
	<fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: [PATCH] riscv: defconfig: thead: enable PCA953X GPIO driver
Date: Wed,  3 Jun 2026 10:21:32 +0200
Message-Id: <20260603082132.3200787-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20260603082156eucas1p1f44a198f7957d9d82ec0b8bc296fb03c
X-Msg-Generator: CA
X-RootMTR: 20260603082156eucas1p1f44a198f7957d9d82ec0b8bc296fb03c
X-EPHeader: CA
X-CMS-RootMailID: 20260603082156eucas1p1f44a198f7957d9d82ec0b8bc296fb03c
References: <CGME20260603082156eucas1p1f44a198f7957d9d82ec0b8bc296fb03c@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_012204_445042_ABCC65B0 
X-CRM114-Status: UNSURE (   8.61  )
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
+CONFIG_GPIO_PCA953X=y
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
