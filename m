Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93CFF588C4
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 13:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LHSZsKBZ1FUgFDTlquEXt1B/puvH5TlZjwEL0TvFQ3g=; b=x+r7zXQwYQMeyM
	XYJMldN8WTBIfUNWxwIOq7IDkBGs+LuHYL7o7oc9IZjl6Q3PuoG1CEdVEORHkJyAAG8wgr9MbAME9
	B0vN5gJYqdauHOKTrxi8T8Zf3udqiqmM7MlfqGMToZYP/NozqNB/rqVEgptqTqTVxMKH1++jgDbQr
	CtEUAgThmGv1PUMmj+g6yl2tTi3TnON7Ug0whxCVntlrT8hZ73gXGx2CTDxwGavKQ6aqztVY34QYP
	ySx3lK5Bp3tNZHHvagbeA+IfPf5DqWo5X52vuNqr6EwkFkKxJj3O5AE+AxUoRIn+b3unvDCwwpL8L
	Sjt6ONvUQCvtstA7Mrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoNA-00000006xE4-3ecR;
	Mon, 20 Apr 2026 13:09:08 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoN7-00000006xCi-1qWp
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 13:09:07 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GEFGIAcBK6jfrRgMqwmCZQZvh/pfo3Q1T0NyKQWEBd0=;
	b=SHsvD0qe9rAdeDQkIW7JFjRHivOcFJ74ayrpFrDhlJASAC3EQzbKMS6Awtz3rWbFkQlR/JQlL
	xk26HsG6xjH6+gQ2cFNV3LVyZPG3OCO1mXwnX9SV95pRVK/CXj7mX8gseSEFfCG7HbNVbha/Dsa
	Gzz9bOZSZANW1cgIZ01aWmg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fzlyJ34WpzRhR4;
	Mon, 20 Apr 2026 21:02:32 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id E288D40537;
	Mon, 20 Apr 2026 21:08:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Apr
 2026 21:08:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <akpm@linux-foundation.org>, <ruanjinjie@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <david.laight.linux@gmail.com>,
	<nathan@kernel.org>, <cp0613@linux.alibaba.com>
Subject: [PATCH v4 0/2] arch/riscv: Add bitrev.h file to support rev8 and brev8
Date: Mon, 20 Apr 2026 21:12:50 +0800
Message-ID: <20260420131252.179729-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_060905_635061_29E23DC7 
X-CRM114-Status: UNSURE (   8.43  )
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

Jinjie Ruan (2):
  bitops: Define generic __bitrev8/16/32 for reuse
  arch/riscv: Add bitrev.h file to support rev8 and brev8

 arch/riscv/Kconfig                    |  2 ++
 arch/riscv/include/asm/bitrev.h       | 51 +++++++++++++++++++++++++++
 include/asm-generic/bitops/__bitrev.h | 25 +++++++++++++
 include/linux/bitrev.h                | 20 +++--------
 lib/Kconfig                           |  4 +++
 lib/bitrev.c                          |  4 +--
 6 files changed, 88 insertions(+), 18 deletions(-)
 create mode 100644 arch/riscv/include/asm/bitrev.h
 create mode 100644 include/asm-generic/bitops/__bitrev.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
