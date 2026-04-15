Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1849F41982
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d8tic4IFNibQ8gQlITyd5TrhkywIhMoU/bRRmkyrorU=; b=HXLX+93+a5q6kP
	hHZQ3ADq82oOYbey333XDjzkgAvKRawQLVNIkstdKLQwNdJzQjByhRya+yge4hyH/RdWnir5JO1DL
	L825GDIujMjjd4qcnvIWJGC1LnvDrdLf0H744rOgmpIW5WDa5yDz474DNKW8Esr+tYKt4kiFNnqD4
	VJoiH0rmxZiCFMaSR/xUthVEITID0RivADDzEsfJ/XmxgPWnkMVYVbE1oYR17hAWY0bEIjug4QzLX
	HLzycrX7J2TUDnBGlH/7lryHEH2wynU714MRHz4+jPISXvCEKcJJJYJg+6x4DzFuiUm1KBdP5Slpf
	kzmEJEAiTzbteyWNAlRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCweH-00000000uqW-1p4o;
	Wed, 15 Apr 2026 09:35:05 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCweE-00000000uop-2KmL
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 09:35:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YQ0HES9M608BC3CtTS0uLReOlu+ttpsb3HMn3ebyh0g=;
	b=fL6P+7avLF9Gwlf76dJA0YWKk8yY3fXXLnJaFWRPaQCWD74J7xF7JJxu0ZzT+3pHEG0lZxZx9
	+k7BiB4EO5QUk8v7twbew8WykqNIYnJ+q6vyyJYZOy5ZPgU/XwGITuwAiVmcbO8SL6w3Wtfyz23
	ZF4byK4pfmq6gBtfalGXt/I=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fwbRl5lsSzLlSv;
	Wed, 15 Apr 2026 17:28:35 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6387740565;
	Wed, 15 Apr 2026 17:34:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 15 Apr
 2026 17:34:52 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <cp0613@linux.alibaba.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 0/2] arch/riscv: Add bitrev.h file to support rev8 and brev8
Date: Wed, 15 Apr 2026 17:38:25 +0800
Message-ID: <20260415093827.2776328-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_023502_761327_56A64105 
X-CRM114-Status: UNSURE (   6.28  )
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

Changes in v2:
- Define generic __bitrev8/16/32 for reuse in riscv.

Jinjie Ruan (2):
  bitops: Define generic __bitrev8/16/32 for reuse
  arch/riscv: Add bitrev.h file to support rev8 and brev8

 arch/riscv/Kconfig                    |  1 +
 arch/riscv/include/asm/bitrev.h       | 41 +++++++++++++++++++++++++++
 include/asm-generic/bitops/__bitrev.h | 22 ++++++++++++++
 include/linux/bitrev.h                | 20 +++----------
 4 files changed, 68 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/bitrev.h
 create mode 100644 include/asm-generic/bitops/__bitrev.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
