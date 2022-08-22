Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CB2C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 03:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GNyCCq/Rjf4eBRdYrA0xLwZYI5TlXGlfMJ7Tkefq2fg=; b=eDG7pi1MONlR6t
	IpBL9NgNVJhc7PWRL2XDHNEkUa9Ht4acfE2mhD+MTVx1Ly+hiSrPEA9md67GRZT2Zb5nXcj17YkOu
	1lA1iB8qCZFzxdDI4E0F1KT5MnoiRKv664fdGi0wXCT0p3ovSF0MdtRsGK01kd9HymPol1S7/iTiQ
	bdDZXM48t3j6u60JW3hFfUjC/bRzHDB2CyFFawObH8Doj3ZfBKvJoItR15cXxEEz795/NToKSGsZ2
	dOwvbn4+8gYJ0dMN+mtHdbDr2HYez4SClMlXBLNE/Rkes9LJMgnhFkOqy7nTtxCZ/5VCEDNnmfCem
	43KTrV5TZpoNg7JlEsSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPxk7-004H1N-JT; Mon, 22 Aug 2022 03:04:47 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPxk2-004GvD-7Q
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 03:04:45 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M9xvJ2qJLzkWbZ;
	Mon, 22 Aug 2022 11:01:00 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 11:04:27 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 22 Aug
 2022 11:04:27 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-riscv@lists.infradead.org>, <oleg@redhat.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<guoren@kernel.org>
CC: <zouyipeng@huawei.com>
Subject: [PATCH -next 0/2] riscv: ptrace: implement PTRACE_{PEEK,POKE}USR
Date: Mon, 22 Aug 2022 11:01:03 +0800
Message-ID: <20220822030105.16053-1-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_200444_157809_361E9743 
X-CRM114-Status: UNSURE (   6.47  )
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

The PTRACE_{PEEK,POKE}USR going to get/set tracee's user register.
This patch sets add PTRACE_{PEEK,POKE}USR and compat implement to
riscv.

I notice this issuse when transplanting some app form x86 to riscv
recently.
I don't know why these two function are not implemented now, and I
found few talk about that.

The {PEEK,POKE}USR are both defined in include\uapi\linux\ptrace.h,
So I was thinking maybe these two function shouled be implemented.

Yipeng Zou (2):
  riscv: ptrace: Implement PTRACE_{PEEK,POKE}USR
  riscv: ptrace: Implement Compat PTRACE_{PEEK,POKE}USR

 arch/riscv/include/asm/compat.h |  13 ++++
 arch/riscv/kernel/ptrace.c      | 111 ++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
