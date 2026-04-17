Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C5DF43683
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mpLxEqDDQUk2SM4dkhX4aolbywSUw62Bi995S2rL6TU=; b=lPa/PdmGMzS3tV
	NTGrcTdZCydwX+2qOvUfnSwv1xZoQxCbdV5ODYWkJqRIb7HHPBGuCkXQIHaxAgTNgsYNRudtlR524
	4E0cDpFiArQqm2S9PHjZcgHaXB3CKRmZAM+ue8htN8DiFGDvEAsUInHk2lGctQeTuyP8+Ncfv/RXo
	ObvMRkMX6WerjrqopvLqEP6L/+PC869/JEVQYNUN7mHmmexDOQbM46C/Xoj2+ADFj52Y1I54chEJq
	6JULgoaArFa1api7V/B7EtPPnQUhGjVMoHUaNqLwfuQL+Aw73OOAED/VfqjmZg7tU/ZYkwsoSoN2B
	MP/IoAVFQ3Qzr3nI+r9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfV8-00000003orA-4ACB;
	Fri, 17 Apr 2026 09:28:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfU3-00000003nIM-2iIy
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Apr 2026 09:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EtIc7q3V6qNXESO1LHnLl1hUghAJRlwCvg1Ur/lCRC8=; b=WOYc3ZyMRC4SM9+cNZpmWmjCPx
	h6YsFgnMh2Ptf9IUNqPNCRxiW15Tlq8LJjF+8DDjHfFGue3okQ1pZEZHNGrGceCPU2PP4mRJk0xmO
	62Fkbs4OUeLrIkFi0WFaVngF+/3TV3f4qn1/rIIq5oareeP/3OaReX6MdXMsixVe/21boT/UG5SCD
	szT9bAkAZMlK1jYRLLHg3ISNRJIvuMpnZ/jD5C3J5kDhMIEyEu2QOWI72pZ2jkUTqw0hssrXDEKVs
	YbyA1hCNMrbpg/CCUCeluQtlJ6RXFvYURxMVXZCGy13TjYkrta3OM5dv1HWZaoalPWpE1L+aFpl+n
	v/GkRrLw==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfU0-000000054hz-2mBL
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 09:27:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EtIc7q3V6qNXESO1LHnLl1hUghAJRlwCvg1Ur/lCRC8=;
	b=I1e6q0Cwtg9FNqISTXXmYiYoyVEfqrktA60qhkps+zKka7CV4QpM+YavzTYpQkafllKzSB+Ye
	cxX32++4Im0VoYmnOmdDWVOM1ungHosFl2LKji1yo7qk77AmYmJfY3OwgncHrao+L73nyNwxbZj
	+jT44jOi5k4ZJSufk01TrlI=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fxq9k69yfzcbN4;
	Fri, 17 Apr 2026 17:20:42 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9962940561;
	Fri, 17 Apr 2026 17:27:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 17 Apr
 2026 17:27:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
	<arnd@arndb.de>, <akpm@linux-foundation.org>, <ruanjinjie@huawei.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <david.laight.linux@gmail.com>,
	<nathan@kernel.org>
Subject: [PATCH v3 0/2] arch/riscv: Add bitrev.h file to support rev8 and brev8
Date: Fri, 17 Apr 2026 17:31:00 +0800
Message-ID: <20260417093102.3812978-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_102729_030086_684FBC0D 
X-CRM114-Status: UNSURE (   7.15  )
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

 arch/riscv/Kconfig                    |  1 +
 arch/riscv/include/asm/bitrev.h       | 55 +++++++++++++++++++++++++++
 include/asm-generic/bitops/__bitrev.h | 22 +++++++++++
 include/linux/bitrev.h                | 20 ++--------
 lib/bitrev.c                          |  3 --
 5 files changed, 82 insertions(+), 19 deletions(-)
 create mode 100644 arch/riscv/include/asm/bitrev.h
 create mode 100644 include/asm-generic/bitops/__bitrev.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
