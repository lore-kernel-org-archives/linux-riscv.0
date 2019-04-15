Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA3FC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 503D120656
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dMVJ4mAM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 503D120656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YcfZAvA2kavdXtOpRPZmlWA9emn+a0Hf7dy3YcWAYII=; b=dMVJ4mAMEGkVe2
	pdNkt660FFLw/vu9kDLRAN5dHlomldWI9Ig8O+5RrUk+W+K8+tBkmcloXfXQBDkp/gZf0rePVibdw
	Vq6drqK7kKS8b4ZK4COaUltbUuY/MXNNevTUFmY23uJ1MmJfVPf+yXdXS78dsLhAbEIgT/07L9Y/z
	8td7/+173uSvYzJEVkPMMewsnGEM+keqeDEYJtxGeDEfHokr8jrXdaixqzwNryfz2E46JLtzZl20K
	frnHd8cHgQCjDp9fiFl/LMOCXTrgqZWuVNIjcXSKibSJD0r6Vhb4XcSh8YeXk3pIToF10aWOmaSI6
	rJD8lhoDfrrwKI3nwwZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFxhm-0006KU-7N; Mon, 15 Apr 2019 09:15:10 +0000
Received: from 213-225-15-255.nat.highway.a1.net ([213.225.15.255]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFxhj-0005i7-Ic; Mon, 15 Apr 2019 09:15:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: misc cleanups v3
Date: Mon, 15 Apr 2019 11:14:31 +0200
Message-Id: <20190415091442.19945-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

below is a number of small cleanups and improvements that started
piling up during work to support the RISC-V kernel in nommu port.
While that port isn't quite ready yet these patches should be useful
on their own.

Changes since v2:
 - drop the patch to remove the non-framepointer code, it turns out
   CONFIG_FRAME_POINTER can be turned off on RISC-V after all..
Changes since v1:
 - fix up a few patch descriptions
 - fix the interrupt cause patch to actually compile without further
   prep patches, doh!
 - remove dead code related to non-framepointer builds
 - remove another big endian ifdef
 - add another patch from my nommu stack to clean up the parse_dtb
   calling conventions

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
