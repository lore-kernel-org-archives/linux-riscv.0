Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6A6C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 12:01:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 012B060FE4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 12:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 012B060FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=STOpdqMGxahAxeeDo9cZWdxLLehAxTWpwyPVCLymRXc=; b=faZTN93lGfijH9HEFo8rGRTkXO
	fQWgXwiIzYCp5YuIkhUxu/N3yuoSfDVTK08wf8cVhTI7qyZ69MYdaun1fP1g3mWUHRO9K24j8lrZh
	58baLLwbcsKb1G2BcPz1mJoSeqrOmjH/Beu/1NbhS78ud1i9lk8XVuDuiP0md4ldV77ftROgx30oJ
	qZsXYyOjuH8LMTDSdyKgBRP0f8MKbdZEhr2P+gfF4ThIF6usZOyTPFWyKM+rIt6NwW9+2/KKBZCuL
	divSvvIGhm0S87txltv+hCku6a5XeZnXZ3VEeNwJ6ykOhME/V2CKW0FtNr0euQXp1tTq4YdiR/MRt
	/yhSePSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg4ba-00EAy0-4X; Mon, 10 May 2021 12:01:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4OB-00E8Q7-01
 for linux-riscv@desiato.infradead.org; Mon, 10 May 2021 11:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=FIOo4Qk/l8SvL2KDxtHTOH/9aRPxSm5v/VYippRVQzA=; b=rziwzWKdQxP0dUqtffyR3p24xp
 3JduvKFZkxmQu3ij7bMBJq/LSWkLSBRhZvTGiv8TeolACLe+1Gsg1o87/ey++4Eho70loHs9cT78+
 1iPv57GPBqvj5c+Tvqud6DvI0kmzIm73assFeX18sUP8JPtSheu32oo009EUFpLxLFmqLRkfd4c7C
 rdSGWd4FPRKXhQT0BERdUzPUUcQIsUg5QNKSCH9ug5cvADGhMlERzLAv+MW2wUCN8z8vUeCZxxq8b
 lJnjJ3F+/8vl+smlfOWIRCXqOQAy6R1IRL7IAdqEmN4uJbIBjANBr1b/4Y7sKSkVT5PY00n36quUl
 rUvsyWCg==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4O7-008dqn-W1
 for linux-riscv@lists.infradead.org; Mon, 10 May 2021 11:47:53 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fdzjl116zzqTn3;
 Mon, 10 May 2021 19:44:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 10 May 2021 19:47:40 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
CC: <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <paul.walmsley@sifive.com>, <anshuman.khandual@arm.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>
Subject: [PATCH] riscv: mm: Drop redundant _sdata and _edata declaration
Date: Mon, 10 May 2021 19:58:08 +0800
Message-ID: <20210510115808.96615-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_044752_221229_62A392DF 
X-CRM114-Status: UNSURE (   7.45  )
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

The _sdata/_edata is already in sections.h, drop redundant
declaration, also move _xiprom/_exiprom close to the caller.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/mm/init.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 136d0342b147..4d08e1f7a362 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -176,13 +176,6 @@ static void __init setup_bootmem(void)
 	memblock_allow_resize();
 }
 
-#ifdef CONFIG_XIP_KERNEL
-
-extern char _xiprom[], _exiprom[];
-extern char _sdata[], _edata[];
-
-#endif /* CONFIG_XIP_KERNEL */
-
 #ifdef CONFIG_MMU
 static struct pt_alloc_ops _pt_ops __ro_after_init;
 
@@ -461,6 +454,7 @@ uintptr_t load_pa, load_sz;
 #endif
 
 #ifdef CONFIG_XIP_KERNEL
+extern char _xiprom[], _exiprom[];
 uintptr_t xiprom, xiprom_sz;
 #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
 #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
