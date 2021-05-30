Return-Path: <SRS0=590W=KZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863ACC4708C
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 04:54:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4150A610FC
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 04:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4150A610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=glty6Ppc2WNzh1OlDWIPzl6Y6CFaq80zPaeuqOx3EZQ=; b=2Z43XnYIqk9NDc
	0CY6E0zoG0/AcULjFLxIR5baToIAeFy+gWhCgwCqt4TuW07bK1eE9LCchhKsqvfgQRIl/eGPNLU5y
	0QC7G1TDL56fNjRazvlp8ciIrrrIG/AuYjI2BlQ2jwG5ciA8AwtIZLwpHIBt26BgSgnbH9qXRm3oA
	/tNnleyvqTla78HV63K1PfnelIgNBGSRWB6VK3r4GDxptXHLJRd2kFPjeVIHvRlmAzsaar+J8z6tI
	Qv4MhtchwgapOnXsfFVbM5G7dJyLOppI07imFHejECRJd9VWyEV5SpnD4t5/1d4yprluYsWe4Dzl1
	or6w6WNWIDV8mTw0al6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnDSx-008z4n-Am; Sun, 30 May 2021 04:54:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnDSu-008z49-OW
 for linux-riscv@lists.infradead.org; Sun, 30 May 2021 04:54:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 562836102A;
 Sun, 30 May 2021 04:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622350460;
 bh=8j+beZJ0vT46mk9agllfdVUQIeq9LdNVKMDsT+pMEyM=;
 h=From:To:Cc:Subject:Date:From;
 b=dGK9IodYmYsvRq6EdXsOx0R9PtXpqZGztRk5dWD9VL1jwIKUg6X5uR2wEpriiLlJr
 4x5AtcaEd4lzQSygyjwrocwEFeJ9i2BYGLJH6CQzMXn4GB5lAfHZdxvudJWbj5q11N
 wsRaCWCX3uXt+wuvYCS9ioBp8VOdRi3q2tl+HtgZ3+IGORcFpyfSuNPRR12fsnCAV0
 cF+2aZJ5ClCdeSjw/i4qrxpMCR5UtOXzk8ovPhmfIx4GC6mH0b8xlhxVBztqNfOxo1
 0wsA2+W4I8H7fLxg2YZCrvLtq3cc2nT6d9TI1CyaKZylLOBS63ZkL3pyN8cog+KdU5
 Gqg1vdkMernRw==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/2] arch: Cleanup unused functions
Date: Sun, 30 May 2021 04:53:26 +0000
Message-Id: <1622350408-44875-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_215420_840691_4C92800F 
X-CRM114-Status: UNSURE (   4.97  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

These functions haven't been used, so just remove them. The patch
has been tested with riscv, but I only use grep to check the
microblaze's.

Changes since v1:
 - Separate into two patches
 - Add Reviewed-by & Acked-by

Guo Ren (2):
  riscv: Cleanup unused functions
  microblaze: Cleanup unused functions

 arch/microblaze/include/asm/page.h |  3 ---
 arch/riscv/include/asm/page.h      | 10 ----------
 2 files changed, 13 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
