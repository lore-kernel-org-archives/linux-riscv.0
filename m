Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D33F8FA72
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 13:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8fxbDdN3mHEK8IuHQlMn3B3ivS6nmBSrerjUtn+jXnw=; b=PWc7kZfhm/avDq
	r6Jr4Lgjk5IWJPe6h2gV6dVGYVmFkGTkZdnboO+jJrJvmqJJPA21YY5W+s01Cy9ThouDfgI42OyN3
	C4AZO0MjKRPK7ireEUgR9DyQ895KWnr0nQ2ISjmtamLnpBekdQj1rvmCxi3WSEc04nFBMZ3r6ZOLW
	FGiDF8K8ALVw/T7l15KffMC7sXkZstbkPGX8a40ioxkAQOrRiC3+q4wEE9WLKyLEzyWQoovvahRMP
	9Vl14QI8O9bntyKwcbDwkv9bIk1rKvnFvKbSgMdfN7gsB4OlsZB3YIIPPbYgUcnP83raFfVTAUlyt
	Ih/U5DuV1UZUO+BGSjgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAm2-00000008d5x-38Mg;
	Tue, 21 Apr 2026 13:04:18 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAlz-00000008d3U-2Pot
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 13:04:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3Wt4gXH4m4VxYG6Xv0sQjCP7dpdPAwm1RXVyZ7lfv4M=;
	b=Q7Sn0/olTzgL+cfjml101/4jnirmE1O3oT+4uwS6gIPA9lUVIMrlLDh4ssHVZVityUS7JQFOW
	MCSTvoT2zuzABZTM8mMaM796qJv4nxJ/uRmPJbQsr7wQAQDwxExAB/xamg6Mx8lmJeQ8gLut+18
	KMznJM2h0dN6cMfiSt+U5iI=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4g0MpW4jLDz1T4Hv;
	Tue, 21 Apr 2026 20:57:55 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 004A3201E9;
	Tue, 21 Apr 2026 21:04:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Apr
 2026 21:04:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <akpm@linux-foundation.org>, <ruanjinjie@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <david.laight.linux@gmail.com>,
	<nathan@kernel.org>, <cp0613@linux.alibaba.com>
Subject: [PATCH v5 0/3] arch/riscv: Add bitrev.h file to support rev8 and brev8
Date: Tue, 21 Apr 2026 21:07:49 +0800
Message-ID: <20260421130752.607500-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_060415_810359_0F63ECE9 
X-CRM114-Status: UNSURE (   9.30  )
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

Add bitrev.h file to support rev8 and brev8 for riscv.

Tested functionally on riscv64 QEMU with:
	"-M virt,acpi=on,zbkb=true,zbb=true"

Changes in v5:
- Rename NEED_BYTE_REV_TABLE to GENERIC_BITREVERSE.
- Add help text and make GENERIC_BITREVERSE depends on BITREVERSE, and
  use def_bool.
- Split into three patches.
- Add suggested-by.

Changes in v4:
- Update the riscv implementation as David suggested.
- Add new config called NEED_BYTE_REV_TABLE as David suggested to avoid
  bloating the .data section for architectures that have full hardware
  bit-reverse support and don't need the table.

Changes in v3:
- Fix the build issue by remving the CONFIG_HAVE_ARCH_BITREVERSE macro
  for byte_rev_table.
- Update the riscv implementation as David suggested.
- Add Reviwed-by.

Changes in v2:
- Define generic __bitrev8/16/32 for reuse in riscv.

Jinjie Ruan (3):
  lib/bitrev: Introduce GENERIC_BITREVERSE and cleanup Kconfig
  bitops: Define generic __bitrev8/16/32 for reuse
  arch/riscv: Add bitrev.h file to support rev8 and brev8

 arch/riscv/Kconfig                    |  2 ++
 arch/riscv/include/asm/bitrev.h       | 51 +++++++++++++++++++++++++++
 include/asm-generic/bitops/__bitrev.h | 25 +++++++++++++
 include/linux/bitrev.h                | 20 +++--------
 lib/Kconfig                           | 18 ++++++++++
 lib/bitrev.c                          |  4 +--
 6 files changed, 102 insertions(+), 18 deletions(-)
 create mode 100644 arch/riscv/include/asm/bitrev.h
 create mode 100644 include/asm-generic/bitops/__bitrev.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
