Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E9AC07E9B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 08:00:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 687F660FDB
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 08:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 687F660FDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SRe+d38+f4JsPqbQFjd9i8g4UocqsmtQYyaSR0NQ6Dw=; b=cGtPIoWYkYa2IX
	5cY5JyzBcQDkDs0Z+5A/SkbsXLtvEQ6+tl2ARJY8qDLdjDan6dS/KujZNWVIDVtOf3bsdtsGhaaoS
	5QMC25Wh3RMFQ6nC1lTYynvI71A3QnMlwy2qzQZMov7FCz8QqyYK+cUhrIrgQjH/jl4fVpfT1YyOh
	/Ks8N9XnNX4CJG2fJN/KTW2VgqRBlnW11ENdC0scV3hg0ZjYYtmkTIzWI67K+V7MQLa3aJTORjkNr
	1eRtKXZVGM/S3nk3Ohj+KW7W1xUs0MkvvBQHA3oNQjXUs3yC1ylybxwdsh3iK3yVQkPN55uK98yUp
	nUqjLcykCGyy3QExLrOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m678z-00Eo7H-3D; Wed, 21 Jul 2021 07:59:53 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m678w-00Eo6V-CE
 for linux-riscv@lists.infradead.org; Wed, 21 Jul 2021 07:59:51 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AFF95FF804;
 Wed, 21 Jul 2021 07:59:38 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH -fixes 0/3] Fixes regarding CONFIG_PHYS_RAM_BASE 
Date: Wed, 21 Jul 2021 09:59:34 +0200
Message-Id: <20210721075937.696811-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_005950_588303_92C3637F 
X-CRM114-Status: UNSURE (   8.46  )
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

The following commits: 

7094e6acaf7a ("riscv: Simplify xip and !xip kernel address conversion macros")
9b79878ced8f ("riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED")

expose CONFIG_PHYS_RAM_BASE for all kernel types whereas this value is
implementation-specific, so that breaks the kernel genericity.

The first patch in this patchset removes the usage of CONFIG_PHYS_RAM_BASE
by introducing a new global variable that holds this value.

The second patch reverts 9b79878ced8f ("riscv: Remove 
CONFIG_PHYS_RAM_BASE_FIXED").

The last patch is an optimization 'symmetrical' to the one introduced in
the first patch: this is not a fix, then it is not necessary to pull
this into -fixes.

Alexandre Ghiti (3):
  riscv: Get rid of CONFIG_PHYS_RAM_BASE in kernel physical address
    conversion
  Revert "riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED"
  riscv: Optimize kernel virtual address conversion macro

 arch/riscv/Kconfig            |  6 ++++++
 arch/riscv/include/asm/page.h |  9 +++++----
 arch/riscv/mm/init.c          | 17 ++++++++++++-----
 3 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
