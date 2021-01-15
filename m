Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5D9C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 05:41:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E3F7239FC
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 05:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E3F7239FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MrhjtgIuc93OesCDQEbm24Iu3RNpMguT6BVQDCV52jE=; b=Yy9S9NJl3RRy8iKKUiedZ+g3/F
	IA/pNuWQm9iBN0WR1MRXX/czs9bk5WufTjPEHlXFyPsmQnUNPOukfrn5RyZ1aGiYLn6AgreJxIMCY
	ifgNkNyB8gXNzR6b4sfNpfcU8TAoXCDQZuntII6SUZZt+3xc3HqZHT8vV4nk3qZ3kkR06a3WBVhn8
	X6VS/EBYCkoECr4ACMwsNMTZ31/VdHTjHgGENoaiwEhz1jE/mTiEqAJoJXHrecldsfkXeAxSmkksk
	5guxOeQ5pC9+FcZ+VIMnBV/rZZb5fSWGoxzsZTTUEUOc7RjUJ6VlOE7bODZG1oAdA3bUaMiq5m/lU
	L574UgSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0HrK-0002HQ-KW; Fri, 15 Jan 2021 05:41:18 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0HrE-0002CF-1C; Fri, 15 Jan 2021 05:41:13 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DH9431Yw0zj7nk;
 Fri, 15 Jan 2021 13:39:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Fri, 15 Jan 2021 13:40:40 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Russell King <linux@armlinux.org.uk>,
 <palmerdabbelt@google.com>, Atish Patra <atish.patra@wdc.com>
Subject: [PATCH v3 0/4] initrd: Use unified initrd reserve function in
 ARM/RISCV
Date: Fri, 15 Jan 2021 13:46:02 +0800
Message-ID: <20210115054606.124502-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_004112_948777_E368F120 
X-CRM114-Status: UNSURE (   5.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: guoren@kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use the same implementation of initrd reserve to avoid duplication.

v3:
- split into four patches, suggested-by Palmer Dabbelt
v2:
- fix build error found by kernel test robot

Kefeng Wang (4):
  initrd: Add the preprocessor guard in initrd.h
  initramfs: Provide a common initrd reserve function
  ARM: Covert to reserve_initrd_mem()
  riscv: Covert to reserve_initrd_mem()

 arch/arm/mm/init.c     | 43 +--------------------------------
 arch/riscv/mm/init.c   | 54 +-----------------------------------------
 include/linux/initrd.h | 11 +++++++++
 init/initramfs.c       | 45 +++++++++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+), 95 deletions(-)

-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
