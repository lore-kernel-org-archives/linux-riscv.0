Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EABC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 05:45:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6504224BE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 05:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6504224BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CFi/4BUy6NCuEvVOEpmXOKaZ3fNoYX7Sn9zrZqP0p9o=; b=wUYnmRDMf9crHn5+RuImh+XuN7
	KgSmy5ufSYd0RT/cz10vODHIfzoJLRCfMjC5lyUiQV28mXc/5qBZ2O45CMqTS6Xijcvy0iWn8T7UN
	gRrZyu7GfyLAxiRLpvfu7LjPcT1U+vtlFloMfnFrKfyzV391R7FOj/pV4+CFEIOsfaM/dlfyO6tge
	H5GG3SFo053O3J8HVs5c9OWI09a9UavoJ8hXYY9wN4QvEjurtxtgZnV9iN5DGOcqSOFzM0L19j/JV
	/yoy4LzlOqmTSlaYieTNRUzvenb7Haav8bBiMPuoyuzOtCPhHmOZGouEdZVoig+lyk6PbxsC73wD5
	cGgEOU6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl3uC-0000qs-9O; Fri, 04 Dec 2020 05:45:20 +0000
Received: from atcsqr.andestech.com ([60.248.187.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl3u8-0000nr-Ld
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 05:45:18 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 0B45hrF7094224;
 Fri, 4 Dec 2020 13:43:53 +0800 (GMT-8)
 (envelope-from tesheng@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0;
 Fri, 4 Dec 2020 13:43:44 +0800
From: Eric Lin <tesheng@andestech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <walken@google.com>, <vbabka@suse.cz>, <peterx@redhat.com>,
 <akpm@linux-foundation.org>, <penberg@kernel.org>,
 <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>
Subject: [PATCH v3 0/2] Let illegal access to user-space memory die
Date: Fri, 4 Dec 2020 13:42:57 +0800
Message-ID: <20201204054259.32684-1-tesheng@andestech.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 0B45hrF7094224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_004517_271158_04BC610C 
X-CRM114-Status: UNSURE (   6.04  )
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
Cc: Eric Lin <tesheng@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Accesses to user-space memory without calling uaccess routine
leads to hanging in page fault handler. Like arm64, we let it
die earlier in page fault handler.

Changes in v3:
	-Let no_context() use die_kernel_fault() helper

Changes in v2:
    -Add a die_kernel_fault() helper
    -Split one long line code into two

Eric Lin (2):
  riscv/mm: Introduce a die_kernel_fault() helper function
  riscv/mm: Prevent kernel module to access user memory without uaccess
    routines

 arch/riscv/mm/fault.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

-- 
2.17.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
