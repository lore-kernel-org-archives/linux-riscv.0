Return-Path: <SRS0=IOE3=GT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD96C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jan 2021 05:59:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F8FB23AA7
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jan 2021 05:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F8FB23AA7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qt2qgpXHlVW/TBN4+I/S213OiZzpGJ/dkQFNiIXJFIg=; b=mi60G68N4GCENNC4i/C1VFFDp1
	IJ6r+w0ac9EIPKjMEA4Tb8kUMLUqoCDfBDrqLLS3ds5AENQaxTgxp0vsOVAJwo1QgYwpEhnwAXKwD
	iTXn+1Z5TmXJGNHB8ucNTqrmGiqVdiO6mOgoBpFqT4lNISw0GdxaEH0oJNAtFuUupQBMLgPqu3ZBI
	X5OVKpH3sqq3+/DzCww2rkmld0TaqGQtnU65i8alh1PhNp5L7TVVZi5bEcPcFL3/krIITerfQb+FG
	1zDMTzLDBuyHfL/kRlb1XQ6CY7C3Xksk3+CNTK68h2TGJG8+QjQPyY10UyLesXyBIPiZ6LqdoXEpF
	zYqfyUVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0ecR-00076b-EG; Sat, 16 Jan 2021 05:59:27 +0000
Received: from exmail.andestech.com ([60.248.187.195]
 helo=ATCSQR.andestech.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0ecM-00074v-W9
 for linux-riscv@lists.infradead.org; Sat, 16 Jan 2021 05:59:24 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 10G5thf2057676;
 Sat, 16 Jan 2021 13:55:43 +0800 (GMT-8)
 (envelope-from nylon7@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0;
 Sat, 16 Jan 2021 13:58:37 +0800
From: Nylon Chen <nylon7@andestech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <kasan-dev@googlegroups.com>
Subject: [PATCH v2 0/1] kasan: support backing vmalloc space for riscv
Date: Sat, 16 Jan 2021 13:58:34 +0800
Message-ID: <20210116055836.22366-1-nylon7@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 10G5thf2057676
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_005923_462694_3FF2DE7B 
X-CRM114-Status: UNSURE (   5.43  )
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
Cc: aou@eecs.berkeley.edu, nickhu@andestech.com, alankao@andestech.com,
 Nylon Chen <nylon7@andestech.com>, nylon7717@gmail.com, glider@google.com,
 paul.walmsley@sifive.com, aryabinin@virtuozzo.com, palmer@dabbelt.com,
 dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

v1: https://lore.kernel.org/patchwork/cover/1364392/
v2:
    1) Fix checkpatch issues.
    2) Remove set_pmd and pmd_populate because it's not necessary.

Nylon Chen (1):
  riscv/kasan: add KASAN_VMALLOC support

 arch/riscv/Kconfig         |  1 +
 arch/riscv/mm/kasan_init.c | 57 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 57 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
