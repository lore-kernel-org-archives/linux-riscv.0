Return-Path: <SRS0=eaTI=Q4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5871C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 17:49:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4C7F20818
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 17:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lnUVKRsM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4C7F20818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pwsan.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:
	Date:Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VzvhrgwrNlhmQip/uc+dkc61w4CXp8HbY9DJ5eFb6PU=; b=lnUVKRsMEE7GvXijbjW+oX0Al
	WRsRDIubYuYm7nVn66V0n/NEDArSnj77h6BFwHOcdTHKxA8zB+6PAKQbihAJIFEe4sxgjK6ehYe/z
	/RkEXH4YqlrGoA6niF5/TM0g0nJ3C0vs66lUgaOUdgUppFUTc8q85eJ6/Njt5+/bp/ZQG4CuVeKWY
	6JpT1jDnWd/T76L//wtOgUN4Nd6UMeHkk9lTMsU0PXEnLjy1rOeSqYLLiPYV3IWJq0LdTwA1xrZhN
	KBvXIM4LiVCSMJQcqwPg0gVcnOlTmXK8cmlKpE3+6rMoyQYK0g/MUClBO3MI1Dk41tfglgk+qtJ0D
	4egLfohYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwsTI-0001JI-Tp; Thu, 21 Feb 2019 17:49:20 +0000
Received: from utopia.booyaka.com ([74.50.51.50])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwsTD-0001Af-Na
 for linux-riscv@lists.infradead.org; Thu, 21 Feb 2019 17:49:18 +0000
Received: (qmail 11986 invoked by uid 1019); 21 Feb 2019 17:49:13 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 21 Feb 2019 17:49:13 -0000
Date: Thu, 21 Feb 2019 17:49:13 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <CAJ+HfNhmJq7ut2OsTvy8N8r2zeiJgBAYdUj0g-SoCso9Y-V6Gg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.999.1902211740020.8433@utopia.booyaka.com>
References: <CAJ+HfNgwAFevO6cXMU_FjQtLJ=uxHmmWM8c-VWu58SMkKXgVyQ@mail.gmail.com>
 <alpine.DEB.2.21.999.1902211627330.8433@utopia.booyaka.com>
 <CAJ+HfNhmJq7ut2OsTvy8N8r2zeiJgBAYdUj0g-SoCso9Y-V6Gg@mail.gmail.com>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="843723315-1782191913-1550770820=:8433"
Content-ID: <alpine.DEB.2.21.999.1902211740290.8433@utopia.booyaka.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_094916_217032_78A7804B 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: linux-riscv@lists.infradead.org, Christoph Lameter <cl@linux.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--843723315-1782191913-1550770820=:8433
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.999.1902211740291.8433@utopia.booyaka.com>

On Thu, 21 Feb 2019, Björn Töpel wrote:

> On Thu, 21 Feb 2019 at 17:28, Paul Walmsley <paul@pwsan.com> wrote:
> >
> > On Wed, 20 Feb 2019, Björn Töpel wrote:
> >
> > > Christopher mentioned "per-cpu atomicity" in his Plumbers RISC-V HPC
> > > talk [1]. Typically, this would be for the per-cpu implementation in
> > > Linux, so I had a look at the current implementation.
> > >
> > > I noticed that RISC-V currently uses the generic one. Has there been
> > > any work on moving to a RISC-V specific impl, based on the
> > > A-extensions, similar to what aarch64 does? Would that make sense?
> >
> > Yes doing a RISC-V implementation with the AMO instructions would make
> > sense.  Care to take that on?
> >
> 
> Yeah, I'll take a stab at it! I guess AMO is in general favored over
> the LL/SC path, correct?

Yes.  I think our current plan is to only support cores with the 
A-extension in upstream Linux.  Between LR/SC and atomics, the atomics 
would be preferred.  As Christoph wrote, using an atomic add avoids the 
fail/retry risk inherent in an LR/SC sequence, and is easier to optimize 
in microarchitecture.


- Paul
--843723315-1782191913-1550770820=:8433
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--843723315-1782191913-1550770820=:8433--

