Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C004EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hpKD4jkn+MhgOWxfx5LikjRH0hP3CxeKVEErOEPf0O8=; b=akonF+xAjeVULZ
	Q/mwvbh+ROofhsnSnecO0ETeQW/XB86pBVm7NrkK1ovqGGTqwgRHN+4KLf+A45jZnPGKRvSj6lyMK
	3pR/AXxST8wiQXeHWLNQ9/hCQOT4jhxzUJsrkyVk/JNdFlzqtXj3YfhOrsE+TacHLTjfg9tD4KtPE
	bL47ZfmbhGky0nYr3lFAg/slamqfBinceMDvGgJfQM2khzNuGxe5Nr8DJMLVB8bFYWUjSbC9PjljP
	BtRmWr35vG4cPKrLW5NRSwkYZOMiUIiJSnS6vsHKhVth3nThsK+WPK4JgOvl74j0F1Apn/swFh6Xd
	dNudZNLPd/r6L83iFhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Twx-00CIdM-2s;
	Wed, 14 Jun 2023 17:06:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Twv-00CIco-1t
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 17:06:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA15A60FB3;
	Wed, 14 Jun 2023 17:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9723C433C0;
	Wed, 14 Jun 2023 17:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686762384;
	bh=utdEvYUpXqsQufHduirjZptaosbT7iBSaT04oIEZrB4=;
	h=From:To:Cc:Subject:Date:From;
	b=alv7HhvCb3WZqMW/enyiPr4ngdwS1rtv6z1vKcBRoOD6uoo28XyXL2wsQGEyMWh/d
	 dZTOW7IP+SxdtL0DZZkdmPYb2rnu8Siw6IUVzViHZbpRTdTaEtPPzO8B91YzYKfFyZ
	 5LVhyo8qSKwjCddIBXhz7p0kQLHrRoMqIfh3jlga35isUoJKH/00nIrqg1KON/mdrv
	 Wpxt5BE9F9YZ+NTffx2F8GLMTYImiF5iQmh8NDHaeazzlzjkmsPbueUZB/L0YrObE1
	 63qrSDUZbqfGbAs7+1GqMFcn6KaMO9DCH2slAMDwJ/x2HKgDeNWQAzLkQjWnfmqK2P
	 +7gGVC6TFtHQA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] riscv: some CMO alternative related clean up
Date: Thu, 15 Jun 2023 00:55:01 +0800
Message-Id: <20230614165504.532-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_100625_666236_01F112A5 
X-CRM114-Status: UNSURE (   6.68  )
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

This series consists of clean up patches of the "riscv: Reduce
ARCH_KMALLOC_MINALIGN to 8" series[1]. Per Catalin suggestion, I will
submit the enabling of riscv ARCH_KMALLOC_MINALIGN 8 in next
development window. However, the cleanups are good for submitting
now.

PS: Conor's reviewed-by tag is included.

[1] https://lore.kernel.org/linux-riscv/20230526165958.908-1-jszhang@kernel.org/

Jisheng Zhang (3):
  riscv: errata: thead: only set cbom size & noncoherent during boot
  riscv: mm: mark CBO relate initialization funcs as __init
  riscv: mm: mark noncoherent_supported as __ro_after_init

 arch/riscv/errata/thead/errata.c    | 7 +++++--
 arch/riscv/mm/cacheflush.c          | 8 ++++----
 arch/riscv/mm/dma-noncoherent.c     | 2 +-
 3 files changed, 10 insertions(+), 7 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
