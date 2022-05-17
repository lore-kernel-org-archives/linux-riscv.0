Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E849EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 May 2022 07:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LMW+4tS8/w07Cz3fhkBHCrey4ty0aFw7ns41Jf0aNuw=; b=0pBg7Lwr68b7s4
	7JjqxzULQ8CwDNHTCt6St3AipGyvjvEQaQCzqs6iTxTQykqlRvbB+yrWgOeFkz0Arx5yQnbSgWQIY
	opGM0LK/HOaVo7zjnzZIL2KM+GTv1SdQU/JjdzdTtUPlyBFaZi/yc61734GKxnsXgBUY4cprFgfl+
	nLlCPexk93jcgUcrDfQN8Tzk5a331c+KFQtuPc15zRKc7rytz54voxJhOocxdFucE5Ci36j3gpb9n
	Cbrb9I4KFXltpVj9ZiaCL6rAG5FtqpcvlIvggnZbDhRM5p3v3fPQ6MXnBj67k5n2YsWhY5ryGqnuY
	0vjuSp9yj42zKsp1BFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqrcK-00C8Go-VU; Tue, 17 May 2022 07:27:40 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqrc7-00C86N-AQ; Tue, 17 May 2022 07:27:28 +0000
Received: from kwepemi100021.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L2SMs5W4MzbcBg;
 Tue, 17 May 2022 15:26:01 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi100021.china.huawei.com (7.221.188.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 15:27:21 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 15:27:20 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
 <linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tong Tiangen
 <tongtiangen@huawei.com>, <wangkefeng.wang@huawei.com>, Guohanjun
 <guohanjun@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>
Subject: [PATCH -next 0/2] mm: fix some page table check related issues
Date: Tue, 17 May 2022 07:45:46 +0000
Message-ID: <20220517074548.2227779-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_002727_582173_CECC346C 
X-CRM114-Status: UNSURE (   4.77  )
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

This patchset solves some ptc-related issues found recently.

Tong Tiangen (2):
  riscv/mm: fix two page table check related issues
  arm64/mm: fix page table check compile error for
    CONFIG_PGTABLE_LEVELS=2

 arch/arm64/include/asm/pgtable.h    | 33 +++++++++++++++--------------
 arch/riscv/include/asm/pgtable-64.h |  5 +++++
 arch/riscv/include/asm/pgtable.h    |  5 -----
 include/asm-generic/pgtable-nopmd.h |  2 ++
 4 files changed, 24 insertions(+), 21 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
