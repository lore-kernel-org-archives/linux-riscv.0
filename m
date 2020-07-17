Return-Path: <SRS0=PiI0=A4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A2CC433E3
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2020 06:06:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FA452070A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2020 06:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JWKtk8PK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FA452070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0eXMx/YJtRwQDrXdqKseJO377fz86ovf2Jeb6Wx5Fac=; b=JWKtk8PKIYbdy1fV/qJa42B83
	GnfcXvZFGElI8tQ/M18nD0zSZDDymZtNrWv4+TKRD7h9HjDrcsc48Ev84INWtajRuPGPeyjmh6JZi
	PYT6EH2fMH0Tbk6Qcel8NHK1K4UQ9KL5Hmu4YxWT6salJRDNNb/CRfHPIGhr9M4yWOTF8eIZUzH+W
	Kts6r+W7cmJOfs5J4rPRQObuSNhJHDPjAlnHWrXFggyvl5MDSN64MY6WYp6N+z6bhg8hR+4XXAdDl
	FdcZ3m9sx3D7SC+//11z8CkAazVcS0dRqlaoP367F7iZDw2LSJaJNLGyqp6qLurx36EX8q5Sg54dk
	1T36AUzlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwJVq-0005f2-24; Fri, 17 Jul 2020 06:06:26 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwJVm-0005eV-Rc
 for linux-riscv@lists.infradead.org; Fri, 17 Jul 2020 06:06:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E319668BEB; Fri, 17 Jul 2020 08:06:18 +0200 (CEST)
Date: Fri, 17 Jul 2020 08:06:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: clean up address limit helpers v2
Message-ID: <20200717060618.GA9842@lst.de>
References: <20200714105505.935079-1-hch@lst.de>
 <20200716164924.15e373f4dbb3071e9d4ee37c@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716164924.15e373f4dbb3071e9d4ee37c@linux-foundation.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_020623_023000_E60CD50E 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: linux-arch@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 04:49:24PM -0700, Andrew Morton wrote:
> On Tue, 14 Jul 2020 12:54:59 +0200 Christoph Hellwig <hch@lst.de> wrote:
> 
> > Hi all,
> > 
> > in preparation for eventually phasing out direct use of set_fs(), this
> > series removes the segment_eq() arch helper that is only used to
> > implement or duplicate the uaccess_kernel() API, and then adds
> > descriptive helpers to force the kernel address limit.
> > 
> > 
> > Changes since v1:
> >  - drop to incorrect hunks
> >  - fix a commit log typo
> 
> I think this *is* v1.  I can't find any differences in the patches and I
> was unable to eyeball any changelog alterations?

No, this actuall is v2.

"[PATCH 5/6] uaccess: add force_uaccess_{begin,end} helpers" dropped
two incorrect hunks in the m68k and sh arch code, and lost and "er"
in the commit log.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
