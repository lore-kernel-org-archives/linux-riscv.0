Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDFAC07E9D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 02:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GHqwQdsXPFHeHU1GiNcVmnH2vT8b4KUk5k1SkpfFBY8=; b=ijIxAPOlYtaHsL
	84vupSTusIL0n02ctieuMTtYz6qtcZtKS5R0opleNzFdyvH0HEaSqEpjdG2qmLYV/QNR4p+a74YDh
	bDkQrEGE4DbuXbiPQlcUupXFZdmqzj37Tzn0b4e5rwv0eUn6IZP7vT4+dCWiaJPhj0P4vutAyA24w
	PotNc5LU6oAjVsjX3rJ2ochsMCKRTJ5mlyGlv40CUade9bxmizrpk+lbHmkxOQ3JDKRHp6s1tMpYZ
	BAC4vPa4QGlo/sftiihDtTme/z8MAbPoGM4/1EAih8zYWgClBaoN78cenIH3tMWQJC322s2lsnXRW
	9ZweG4vkkuVoVCesS/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0Ld-007qBj-6S; Tue, 27 Sep 2022 02:29:25 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od0Kl-007pyJ-Ou; Tue, 27 Sep 2022 02:28:34 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mc3MT4JCPzHtgR;
	Tue, 27 Sep 2022 10:23:33 +0800 (CST)
Received: from huawei.com (10.67.174.53) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 10:28:19 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>, <maz@kernel.org>,
	<alexandru.elisei@arm.com>, <liaochang1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-csky@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH V4 0/3] kprobe: Optimize the performance of patching ss
Date: Tue, 27 Sep 2022 10:24:32 +0800
Message-ID: <20220927022435.129965-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.53]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_192831_999326_BABB34CA 
X-CRM114-Status: UNSURE (   5.47  )
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

Single-step slot would not be used until kprobe is enabled, that means
no race condition occurs on it under SMP, hence it is safe to pacth ss
slot without stopping machine.

v4:
1. Add Acked-by from Will Deacon
2. Mark Rutland provides some subtleties on arm64 micro-architecture
   that needs to follow.

v3:
1. Drop duplicated I-Cache maintenance for arm64.
2. Add Acked-by from Masami Hiramatsu.

v2:
Backport riscv patch to cksy and arm64.


Liao Chang (3):
  riscv/kprobe: Optimize the performance of patching single-step slot
  csky/kprobe: Optimize the performance of patching single-step slot
  arm64/kprobe: Optimize the performance of patching single-step slot

 arch/arm64/kernel/probes/kprobes.c | 27 +++++++++++++++++++++------
 arch/csky/kernel/probes/kprobes.c  |  6 +++++-
 arch/riscv/kernel/probes/kprobes.c |  8 +++++---
 3 files changed, 31 insertions(+), 10 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
