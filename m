Return-Path: <SRS0=l+05=NX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACD1C432BE
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 02:38:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2BBC60F12
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 02:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2BBC60F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xt9lpyjhvTMvhihh84aBalQ7tc7Xf9K67lmsvovFKSE=; b=WMeefoncLZI5pE
	9Hw2x26U8aJ7Fw3uYcVXNLMVUXufaNGKwxYX9INwe/3U1YLpXRy4gMkzOLs+nFKIpTu/8kvNxf8+2
	XRRrkMTTLnRq7BYqX5yT6OCDRVehV0nX1b841LwXyWL4pux7gWjNs2DX0WmJr7maBkv/lsyiTjdBF
	SmJmxIE7a25/dCtwwRWrmCmqt2HGWGZ6QdTlNxOZfJvDgddkDGL0+Ts10Di0h9zJXF/RLCTNTPkZt
	mMib6VtyWopjDZQmC5VzSAJP3+coy4UpFjGEz0FlD3nZI6qXziQSz3YeW97HgjW04etXqmClFxQ24
	f6VzZUohLjatqba/UVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLG8U-003bTI-PV; Wed, 01 Sep 2021 02:37:58 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLG8P-003bRE-Iv
 for linux-riscv@lists.infradead.org; Wed, 01 Sep 2021 02:37:57 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gzp5k3m7bzbfdy;
 Wed,  1 Sep 2021 10:33:46 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 1 Sep 2021 10:37:41 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 1 Sep 2021 10:37:41 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <abdulras@google.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next v3 0/3] riscv: Fix two vdso issue
Date: Wed, 1 Sep 2021 02:46:18 +0000
Message-ID: <20210901024621.2528797-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_193753_832638_D6606CC8 
X-CRM114-Status: UNSURE (   7.18  )
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

v3->v2:
  Adapt to the latest code.

v2->v1:
  Add patch "Refactor asm/vdso.h" to avoid vdso.lds syntax error if
  CONFIG_GENERIC_TIME_VSYSCALL=n.

1) Move vdso data page up front and introduce enum vvar_pages, This makes it
easier to introduce new feature TIME_NS.

2) In arch_setup_additional_pages(), make Wait for the lock in the killable mode
and return with EINTR if the task got killed while waiting.

Tong Tiangen (3):
  riscv/vdso: Refactor asm/vdso.h
  riscv/vdso: Move vdso data page up front
  riscv/vdso: make arch_setup_additional_pages wait for mmap_sem for
    write killable

 arch/riscv/include/asm/syscall.h  |  1 +
 arch/riscv/include/asm/vdso.h     | 15 ++++-----
 arch/riscv/kernel/syscall_table.c |  1 -
 arch/riscv/kernel/vdso.c          | 53 +++++++++++++++++++------------
 arch/riscv/kernel/vdso/vdso.lds.S |  3 +-
 5 files changed, 42 insertions(+), 31 deletions(-)

-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
