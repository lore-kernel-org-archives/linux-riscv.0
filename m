Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBD3C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:21:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45D20610CC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45D20610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WqKkM2A+018iJkR9paZDe8+oV7qgKpnQ35D4sSYG0i4=; b=HSJcnxe3PhA/iNRez8Y6FMMX6
	v2LRzNmtPqLoCFOxU8jLkQ60oADiSynpxbCCIOruvdeRH45hzkKnvt0tj+pCJ23q2XoV6EWbI4a25
	xLtr55i+0drqt0DVSEv7SuZDQEO31alPzIJ9epUzrlLXqhtduAG63WdHsBBDhAac+T2GF8gPpZteA
	j08nKjw2KruImROeOqCRwBBFcVdb4izEV/jcWPnYC0UtRQDKEA0E91DuWtMKx7+EwTQL1BmTwpwWM
	oax5s/LOxElH3wBGhG8TeXz2IpY/R7zEJ4qxsxD+P1FNSXpOKVNi+Jb1ulktO6opWOFF2EOFLiHB8
	vJJmYZAwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljEdg-002qMi-9k; Wed, 19 May 2021 05:21:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEdc-002qMU-GW
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 05:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wWRRLV9lR6OczLC+O9YUr3mFCqNUEgiS2MD5Uq0NFFc=; b=IBm4YBUgektpc2qIBoeTeyTGnD
 cAhslFnh7SDLXOFuHFXI9ULZoiCpdkdZ/UkkMkh/gd6njcRFJtBSlgsgpNH5jKAQRrAwhaGdGN1Cz
 H4827o1erHPVRx8rABhNCSVz4GGSqOucV7t7wMMO+wAZu1o++ioaschjjQnyRfH740YNuUbO1r7h5
 N3+ken8T/hJvrGYT3pqM9MCgU0aXlFXfeOLUUeK69SXmwD2QiL6HsooOp13NkIk0JN9gh2OJkbmBx
 3Cf9VGsEykALyhE0WJffesX1jZVAaRnZrayWHVgLL+jL37qyJWq8xUe8L87e/7EHEoEB8KvfmdMvD
 kNQhyAAw==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEdZ-00F8uW-N8
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 05:20:55 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2DEDA67373; Wed, 19 May 2021 07:20:49 +0200 (CEST)
Date: Wed, 19 May 2021 07:20:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, palmerdabbelt@google.com, drew@beagleboard.org,
 hch@lst.de, wefu@redhat.com, lazyparser@gmail.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210519052048.GA24853@lst.de>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621400656-25678-1-git-send-email-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_222053_925997_C0B75943 
X-CRM114-Status: GOOD (  10.57  )
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

On Wed, May 19, 2021 at 05:04:13AM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
> vendors define the custom properties of memory regions in PTE.

Err, hell no.   The ISA needs to gets this fixed first.  Then we can
talk about alternatives patching things in or trapping in the SBI.
But if the RISC-V ISA can't get these basic done after years we can't
support it in Linux at all.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
