Return-Path: <SRS0=HQWJ=IG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BCEC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 06:07:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B7E865139
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Mar 2021 06:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B7E865139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZT1z5hLDDnWVllzFm0JGLh32y8rIg3EaxBVhWzSWOQU=; b=jMGlYPcY3XejEd+F8ByE3hHwy
	7UfMGZZduGT213RIDvo+8unE2Xybx9uA4zJZPgU4ekQt+p09ULMAf20E90wwU9KOxXcOWFOZDQ1lv
	W8cw8/uY8s0xgcJXVMevL7KiOt7eGHtiO9qs92tlMiSjf+3LVPmofwYNW6PdhTeCRQ+BjdxeZNlF/
	85yySRlwle31o/cywQsVke/IveWH9Mp0y0YmlJEu18aQqMQ90eLP4a/ae17TTs3R3h2aPByE9NhcC
	jmeC5gXRl7NQsaJYP0MaHxBgR8vMXhkiYyBs0ra4sfISDis/XBPYIYnIfinIKtwctLcv924AtYaDr
	io4t3ZZmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ93H-00FQ0o-Fc; Mon, 08 Mar 2021 06:07:37 +0000
Received: from exmail.andestech.com ([60.248.187.195]
 helo=ATCSQR.andestech.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ939-00FPya-La
 for linux-riscv@lists.infradead.org; Mon, 08 Mar 2021 06:07:31 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12866wZL041553;
 Mon, 8 Mar 2021 14:06:58 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.128) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Mon, 8 Mar 2021
 14:06:56 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <linux-fsdevel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <ruinland@andestech.com>, <alankao@andestech.com>
Subject: [PATCH 1/1] Modifying fs/binfmt_elf.c:elf_core_dump() to use
 round_up()
Date: Mon, 8 Mar 2021 14:03:56 +0800
Message-ID: <20210308060356.329-2-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210308060356.329-1-ruinland@andestech.com>
References: <20210308060356.329-1-ruinland@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.12.128]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12866wZL041553
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_060728_748402_CEE200B7 
X-CRM114-Status: UNSURE (   9.63  )
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

Since roundup() will use plain division which might cause the compiler
to use its own integer library routines (i.e. __divid3() in libgcc) on
32bit mahcines when "O0" is specified. The problem won't occur if it
uses round_up() which utilize bitwise operations (shift & and), and the
limitation that "the divisor must be the power of 2" is true on
ELF_EXEC_PAGESIZE.

Signed-off-by: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
---
 fs/binfmt_elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index b12ba98ae..01d4d6d2b 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -2209,7 +2209,7 @@ static int elf_core_dump(struct coredump_params *cprm)
 		offset += sz;
 	}
 
-	dataoff = offset = roundup(offset, ELF_EXEC_PAGESIZE);
+	dataoff = offset = round_up(offset, ELF_EXEC_PAGESIZE);
 
 	offset += vma_data_size;
 	offset += elf_core_extra_data_size();
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
