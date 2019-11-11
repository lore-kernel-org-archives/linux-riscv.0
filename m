Return-Path: <SRS0=SgWD=ZD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD22AC17445
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 17:30:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93C63214DB
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 17:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R+N5Sbf8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93C63214DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pwsan.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g6JZmmQmyUQ/r75veFEbYJQkMfXkBotX95SV0mRTm+4=; b=R+N5Sbf8J5cINY
	zjujP1dar9CJPYQ4zOOhAA+3pKtvs/yX06m2FnJro3MghlZYblV0+907hXxvANsBLfq09TrhGw692
	tHYD3EPGjJsPsGKPzeXH5dgnOvttp+zUUfk339XGYToNaILNcZuxRRDYOMY8ZMIAhNmozyWOKGpwv
	yczBDyaxoO/J2LB0fHRi/9+A01qXtqL/2vrDT3vuCVSKcNJE9CQ8CBUohhyMbR2W7BoMaoEOdLnuQ
	gco22vuWkKHPH7GZn8XojFT1fRXEW9AKekKDc1VD3d/1jMFZ/5cHWe2PXO7mMXRpZVCwl6eAyKQTj
	1CKBo9JgsW0doFWx15kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUDW4-0001pe-Po; Mon, 11 Nov 2019 17:30:16 +0000
Received: from utopia.booyaka.com ([74.50.51.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUDW3-0001pK-07
 for linux-riscv@lists.infradead.org; Mon, 11 Nov 2019 17:30:16 +0000
Received: (qmail 2500 invoked by uid 1019); 11 Nov 2019 17:30:13 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 11 Nov 2019 17:30:13 -0000
Date: Mon, 11 Nov 2019 17:30:13 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] Documentation: admin-guide: add earlycon documentation
 for RISC-V
In-Reply-To: <20191108061009.GA30335@lst.de>
Message-ID: <alpine.DEB.2.21.999.1911111729271.32333@utopia.booyaka.com>
References: <alpine.DEB.2.21.9999.1910091252160.11044@viisi.sifive.com>
 <CAMuHMdUfqvkVJHHwyuYxLSxj_iUofx-vSvEj92C5mg3bGxHqmA@mail.gmail.com>
 <20191010112347.4a7237bb@lwn.net> <20191108061009.GA30335@lst.de>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_093015_119082_3236BC6F 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Andreas Schwab <schwab@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Jon,

On Fri, 8 Nov 2019, Christoph Hellwig wrote:

> can you please revert this?  The paragraph above this addition already
> describes the riscv case perfecty well with my previous patch:
> 
> 	earlycon=	[KNL] Output early console device and options.
> 
> 			When used with no options, the early console is
> 			determined by stdout-path property in device tree's
> 			chosen node or the ACPI SPCR table if supported by
> 			the platform.
> 
> 			[RISCV] When used with no options, the early
> 			console is determined by the stdout-path
> 			property in the device tree's chosen node.

I support reverting the RISCV section, now that Christoph's more general 
change has gone in.



- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
