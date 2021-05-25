Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9DDC2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 06:35:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 086E7610A5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 06:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 086E7610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sj+3JW/ns7TFzmHcK3rUaxiJ5QlwvNAk4f3CmfiXwws=; b=LooEOxwG38xHBM
	4bAqRmccpa9QRJH5b/lcgxAPTqPmexJU2Jbg5C3aY1GpZl3iBXNchI1iCq5LVdmMDmzjjcmUBpc45
	WJ+jQcxtXwaiDBPmIiPmU0sRWk//G5iI1Ku0pHOxTjxxyqOcEKgV+UcgU39olkVh482OF74fwcR+F
	hcuEeYA3ZwLZa7WCFqr05cnvjLNRD06UQc7cBEZDvEU9Uj8c7q0JGVLtAv2dhD0p3CHi6wzVYjXuo
	XRsefckjrWzZgVaOAzsRtAr6Exsdg0ttYbSa++rrpyGoBFavEEEW59STEB9hKOrpsN2ATKAcFQkhb
	SQYz5a0E1lLJBxEsdXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llQeW-003eSn-JO; Tue, 25 May 2021 06:34:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llQeV-003eS8-OE
 for linux-riscv@bombadil.infradead.org; Tue, 25 May 2021 06:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l76PMWwpyUywZLSPQWxlVCkV0Gpx/Lj+papEoZT+usU=; b=nxMsfjJ56nJZsedt7pMMtsU2dQ
 s66X+UHTPW9Pvr0NZFeGrpkRebz0bVJXAj3WwNMKN4BMYNNtm7QF8q/k4gireJ5A1/O0yIe6iHpf1
 fNaEzyiT88Zio+afVonMcWw4AacHG94txCxY8e/BB9s3e1x99e5jtgaj80W/Ly5hGzqijngVgbn+4
 Gquox9i4ezhDsq0BG2/77r09PwciTdFQ3Ma19fsTqnkX2Nr3pZycMg5b37lefHHng7Hcrc0EWOx2M
 8eGIQQZ7JSsIPBCKMVMGQocha9Qv9qyzoDZPY6OJi4N8Z7ub+8+en2hmHKdgDcv8EX7Z5wBr9PUTx
 P+dJps9A==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1llQeB-003C3l-RS; Tue, 25 May 2021 06:34:41 +0000
Date: Tue, 25 May 2021 07:34:35 +0100
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, palmerdabbelt@google.com, arnd@arndb.de,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 2/3] riscv: Fixup PAGE_UP in asm/page.h
Message-ID: <YKyae+8O25A8vxMS@infradead.org>
References: <1621839068-31738-1-git-send-email-guoren@kernel.org>
 <1621839068-31738-2-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621839068-31738-2-git-send-email-guoren@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Mon, May 24, 2021 at 06:51:07AM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Current PAGE_UP implementation is wrong. PAGE_UP(0) should be
> 0x1000, but current implementation will give out 0.
> 
> Although the current PAGE_UP isn't used, it will soon be used in
> tlb_flush optimization.

Nak.  Please just remove the PAGE_UP/PAGE_DOWN macros just like they
have been removed from other architectures long ago and use the
generic DIV_ROUND_UP macro for your new code like everyone else.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
