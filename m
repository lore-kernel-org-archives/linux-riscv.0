Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF32C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:30:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 155E764E85
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 155E764E85
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sC+wSn36+WnnTnafNLu6vPku6oXTBizIMG6fvkJaTqQ=; b=qZbc/7Jr5PUpptiKxwtmfJoC6A
	BBd8CyKuw3Csl0vGI6fKp5+ahid2vqbHWIg4cueSFzVDu5ADKQ3PkAvCJ4RziHMJrqCThBEgjfDWa
	0bP67vmI3G1F2/kK7fXAUqR6mfT3uSYALgYXJofqeO+cozYLlhFEd1QUaxvCISe5FFWKuQTsjEXSH
	phb7De9kr04zkSBhbkgLFw357L7MlzqimGHuxPiufRNwNpESQG3Ged/qRQwuHEqeTP5eGIpteWzWw
	Hvz+RTBhlFBY6XFmfbf6qyWQqdDTlN4hfazmDVoAay3HyQHlmmw6XJ/d2X3SgTQV3+FuMZ+4Wi1yI
	g11SqRAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9CEu-0006z8-Hy; Mon, 08 Feb 2021 19:30:28 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9CEs-0006yB-4D
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 19:30:27 +0000
X-Originating-IP: 2.7.49.219
Received: from debian.home (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C803F60008;
 Mon,  8 Feb 2021 19:30:20 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Kasan improvements and fixes 
Date: Mon,  8 Feb 2021 14:30:13 -0500
Message-Id: <20210208193017.30904-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_143026_276753_F048C661 
X-CRM114-Status: UNSURE (   7.53  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This small series contains some improvements for the riscv KASAN code:

- it brings a better readability of the code (patch 1/2)
- it fixes oversight regarding page table population which I uncovered
  while working on my sv48 patchset (patch 3)
- it helps to have better performance by using hugepages when possible
  (patch 4)

Alexandre Ghiti (4):
  riscv: Improve kasan definitions
  riscv: Use KASAN_SHADOW_INIT define for kasan memory initialization
  riscv: Improve kasan population function
  riscv: Improve kasan population by using hugepages when possible

 arch/riscv/include/asm/kasan.h |  22 +++++-
 arch/riscv/mm/kasan_init.c     | 119 ++++++++++++++++++++++++---------
 2 files changed, 108 insertions(+), 33 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
