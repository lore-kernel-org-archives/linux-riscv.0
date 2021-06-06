Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77650C47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D3A61408
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 15:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D3A61408
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qpfOvOo1IE56sXnPFjazNFhsOUunZgAZgK5OKKRhZu8=; b=P3zHfxhN2Ix5xz
	xSgdHYDz1pq/8xA/gFwc6Fm0X2w77+qTkymClR/6ZYTX1yQMQ1dDPFeJziU0uQyCeekgTRA0Sv5Bz
	qCIh4v5VabOIHs3ln0YJaMoVluaSEWoEz5R6IrVVK7fHqaToI+OADwwLDDaV4YYZyQ83HrIjcywn+
	u2Cnr/ZTgiAnSUIXUP41eZCmhX3QaFKHG5LEXblHHydyhe22JNLMMAl9yFPaoBoMHd3gMuS3EvEZC
	Yv2GOhTDcQokVaCFB8Pd3InLTZ1732P72daXj1XStImb0ZJLn+AJt7Zs41zCoSVbdbw/j1bx+5ezr
	BMMcm1XQHtXkdxYFWzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpua9-000TYm-Fc; Sun, 06 Jun 2021 15:20:57 +0000
Received: from [2001:4bb8:192:ff5f:a26e:bb8d:e917:2d71] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpua8-000TYW-Ag; Sun, 06 Jun 2021 15:20:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org,
	palmerdabbelt@google.com
Cc: anup.patel@wdc.com,
	linux-riscv@lists.infradead.org
Subject: rebased ASID-based tlbflush
Date: Sun,  6 Jun 2021 17:20:48 +0200
Message-Id: <20210606152050.636038-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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

Hi all,

this is what I think is a resonable set of patches for the ASID based
flushing, largely based on the work from Guo and thus attributed to him.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
