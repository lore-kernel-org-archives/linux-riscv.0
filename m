Return-Path: <SRS0=oEUG=23=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4936EC33C8C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2020 23:20:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B54F207FD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2020 23:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BmWms5Th";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="jYk9DRTR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B54F207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srz94l2uXXDm8uhaL89NYYkGpBsk/DmmiKVKo8s3kgo=; b=BmWms5ThXzGLlF
	UxYEWWUx57yDRJXks+fq65XX1TbQFscnpyecAbsMLhX63VMt1nLoMt6do3r1cFXXsOX050/geUpG7
	n+DD0zjHKH5RMTHfdsW6jcRUdEYq4cpt5ntD91CRXWoaHw4nlqr16ztYpNX7ETdMMZc+/RDoqq/Ab
	7l3A35y/cdq2Ef1fAlFuuwTj8yc68Ckq85ks6OwEDxiMXKZWkF1AU9/tJ8FYcunsyK3z1+QLLBlS4
	HIld0nVWUHdOKBwVz9gPqEgrGs1OHfCx/MhEUqoiSTxwdpD4VOCkEzgEvKlnckaBJJP04tyqr3SrG
	P8Q7FngoDdYRJ3L/pLIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iobfo-00065L-T3; Mon, 06 Jan 2020 23:20:36 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iobfl-00064X-UN
 for linux-riscv@lists.infradead.org; Mon, 06 Jan 2020 23:20:35 +0000
Received: by mail-pj1-x1044.google.com with SMTP id m13so8390973pjb.2
 for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2020 15:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=srz94l2uXXDm8uhaL89NYYkGpBsk/DmmiKVKo8s3kgo=;
 b=jYk9DRTRireyhjENtb52/RKEST50v32C96Gq260txWajZnQCgvUkbcTRp/HvgmsJaT
 zio3OwSDqGdiXCpd48WpezHFzzepUlB+PVpMpQ2My7r9JRq2BJqjNCVI5afWqXSfJoOT
 3g2Y2WuNNxSo1s1b2ffQ/j3mNeveIpYI1/8/ELdrC0kR1Ev2pn7AKndFKjqaBcP1cODK
 imi5R+9ix0WXJOgNuP4sKKLEJZor44iihGN5WQMLFWq8BEIP5Dx2awjyHfD+llAMVE3Q
 MNBFDf1/6nK7oq21s2djuQyxFWtVlh9QIQ4E4guLOcR6mJ1SRg6dMkA4cy1ovcoBpk7U
 Xxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=srz94l2uXXDm8uhaL89NYYkGpBsk/DmmiKVKo8s3kgo=;
 b=JAL9cCL5xZtB1+nnlJ/N6234PMWP+H8ejRC6brxc2ScM6fGyQmZSAYKuhwHwsIjHaG
 J6XDPtGTEnI7y6cX4PGiDAD4ODPNf4ZlRvyJkL0qsuvoGUjFplWO3kPGfI5h3MOnIgbW
 oAobBvtrQub/dUYnnLJ9TrX9RDm1/00R+SEDXpF2D8sNZ3knPuK4lc4MzCzshabAv2Tz
 e1updzx32omZTYw43pzNo+RBEj7PR6T+GTgQNeJi9yn55H6d/oAKHefr//5Ti45aRq4g
 cou57dqKWrEG5dqENXLs+UgPE/ynEg/4xouO/avmb3LDzpiXqB3fXWLLC7zroqKSG+Me
 NjYQ==
X-Gm-Message-State: APjAAAXoXOkSlVoevWIO8HP5jxsvz12aW92VWs45B5dR9Ozlqtp68A5D
 iMTxnkOfnxgLQKj9/lDGMuL1Iw==
X-Google-Smtp-Source: APXvYqyXTzaS5RNfBUvI/u+g1zVhiot57BVfPvtWE5HmMqzI7VmtD21utgVOzkWZoI+sUgG8+/v17w==
X-Received: by 2002:a17:902:b40a:: with SMTP id
 x10mr90682005plr.64.1578352833142; 
 Mon, 06 Jan 2020 15:20:33 -0800 (PST)
Received: from rip.lixom.net (99-152-116-91.lightspeed.sntcca.sbcglobal.net.
 [99.152.116.91])
 by smtp.gmail.com with ESMTPSA id u26sm76165686pfn.46.2020.01.06.15.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 15:20:32 -0800 (PST)
From: Olof Johansson <olof@lixom.net>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v2] riscv: keep 32-bit kernel to 32-bit phys_addr_t
Date: Mon,  6 Jan 2020 15:20:24 -0800
Message-Id: <20200106232024.97137-1-olof@lixom.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106231611.10169-1-olof@lixom.net>
References: <20200106231611.10169-1-olof@lixom.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_152033_979007_AD8060C8 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

While rv32 technically has 34-bit physical addresses, no current platforms
use it and it's likely to shake out driver bugs.

Let's keep 64-bit phys_addr_t off on 32-bit builds until one shows up,
since other work will be needed to make such a system useful anyway.

PHYS_ADDR_T_64BIT is def_bool 64BIT, so just remove the select.

Signed-off-by: Olof Johansson <olof@lixom.net>
---

v2: Just remove the select, since it's set by default if CONFIG_64BIT

 arch/riscv/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a31169b02ec06..569fc6deb94d6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -12,8 +12,6 @@ config 32BIT
 
 config RISCV
 	def_bool y
-	# even on 32-bit, physical (and DMA) addresses are > 32-bits
-	select PHYS_ADDR_T_64BIT
 	select OF
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
-- 
2.20.1


