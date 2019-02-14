Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B105C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 17:04:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD0021927
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 17:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s5Vi5NdK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BD0021927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++EXxlnt9YVghAtqIEOVKNydhnoD14DZzr264L3KD7g=; b=s5Vi5NdKftU0UK
	X+Amiq84XM3NpQc1SL9VJ6XyIpuYWIegkV4Y5T3HDYpd9JL+e+fJIgOumTUG6fDMmBkw94BUqwit/
	d+6kXFqrvjxwhAqEREDdtlso6Oc6MBBSk8+qJul4pa3O7tX1JRy+dDJvp1JW1scpGWGgBUff7TRHU
	N9UPZ5s7ktUqvX1lbq8dkpZuOx/GNRk91xTKh92C8uJ2p+OWM2dHWUMvQGYESGC/P/EJxr/E36KVm
	A8JmXNWZSijhXUbylqnOKjY6TMoBbW3Yt92QeNqcScYToN+Wo3bpaFGEEs+PkGIZ+6zOELv64iVDO
	yTiLv/jN00LbP3f1FVcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guKQw-0000ke-IO; Thu, 14 Feb 2019 17:04:22 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guKQs-0000kH-Ks
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 17:04:20 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 900266FA8C; Thu, 14 Feb 2019 18:04:16 +0100 (CET)
Date: Thu, 14 Feb 2019 18:04:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH 0/4] provide a generic free_initmem implementation
Message-ID: <20190214170416.GA32441@lst.de>
References: <1550159977-8949-1-git-send-email-rppt@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1550159977-8949-1-git-send-email-rppt@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_090418_832056_7C0BBFBD 
X-CRM114-Status: UNSURE (   4.83  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Richard Kuo <rkuo@codeaurora.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This look fine to me, but I'm a little worried that as-is this will
just create conflicts with my series..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
