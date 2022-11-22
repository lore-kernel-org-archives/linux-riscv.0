Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D947EC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 15:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYrg0xwnEaoYf6fvB2mOqlMsWSIdhyjTfScH8owI5qk=; b=bgZhqL+zMDtnmm
	SYzC3ZLYk6l1u0aFGbEwKbGECQPHTMAwpugF10P4m3YZylL/tURotVEHH5qWQD3dEAErQw4hpD/nl
	u9/2pgwMFRFznSRLlH6b/PjH2kqIDrTF+gN265upEstZREGBSMF6WDRq4a5SOqsmBcYib4LdIKRB/
	ifVAzaq8djXp1junDaK4KAc2AuxNg2Gb37cwgLeAxquoHZQ1RmqYWcbxh/sc1yvifi+AqorrXg7n/
	s5QQgrtxDvSR91YQ/2TvaEa6jBsMeXqYvHmkrKx13LcRuBLbl3LnIl9tZ7aPXXRsQjpVbZBZzVpeQ
	5/y3m35C9BBtnGcDIxvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxUzT-00AG1U-BH; Tue, 22 Nov 2022 15:15:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxUzM-00AFyG-KP
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 15:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669130108; x=1700666108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GpkSIeWT0lMRPcyAIGKwb/kNRvRf9zXgnioryzKVzg8=;
  b=MtqKTKWnf6QpcvSS8LUyIMSkL1Mj4e9pZPX6vbtK+NS8yVnXe7f8c8ix
   PecXVdD7mDkG+fxHRYspEcuwoRayE6Y6BCGIOJ/VDAjILD7U7FGTvUEsF
   RprVN4fMspqamld5pdJNAXYKHdIk62Hi6Vf+lFVfEO/1sMAZurcZsV7kU
   tWC8luVDdYvbeEoUmCBjTZwhoMbMVgjOR7Xnjb4nWIohk8nQCX8uHo54O
   jQ6LBEvm+tRFkkfQZvOwDHt2L5ulALU5UUGGIZL+24DJfwOZlwDcIo2Rg
   ezEpEA0eUnmTix6yWDl+wWnZ4qG2NA+bYtB10Wysq/WUupXogTuruHomO
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; 
   d="scan'208";a="188165690"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 08:15:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 08:15:00 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 22 Nov 2022 08:14:59 -0700
Date: Tue, 22 Nov 2022 15:14:41 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, <arnd@arndb.de>
CC: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>,
	<soc@kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: RISC-V SoC Drivers for v6.2
Message-ID: <Y3znYdAi8fS4Paak@wendy>
References: <608037ab-1e9c-4f70-b85c-5665a4bb1769@app.fastmail.com>
 <mhng-3945534f-98a0-453a-8a1b-3e1c8f3441a4@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-3945534f-98a0-453a-8a1b-3e1c8f3441a4@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_071508_778686_D24EDE28 
X-CRM114-Status: GOOD (  34.39  )
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

On Tue, Nov 22, 2022 at 07:00:00AM -0800, Palmer Dabbelt wrote:
> On Tue, 22 Nov 2022 06:38:40 PST (-0800), Arnd Bergmann wrote:
> > On Mon, Nov 21, 2022, at 18:24, Conor Dooley wrote:
> > > Hey Arnd,
> > > 
> > > Same stuff applies here: lmk if there's something you'd rather see changed.
> > > Perhaps you'd prefer to see PRs per vendor? Although I think that's less
> > > likely to matter here than in the DT stuff. Again, I'll try to get the PR
> > > out a bit earlier next time.
> > 
> > Applied, this looks fine, just a few things to keep in mind:
> 
> Thanks!

Ditto :)

> > - please add "[GIT PULL]" to the subject line of the email
> 
> FWIW, here's the script I use to send pull requests:
https://github.com/palmer-dabbelt/home/blob/master/.local/src/git-send-pull.bash

I noticed that yesterday evening while double checking what I'd sent out
but by then it was too late...
I'll use the script I use for internal stuff going forward & hopefully
avoid a repeat.

> > - Splitting up a large pull request into smaller ones can be
> >   helpful to make sure things don't go in unnoticed. I try to
> >   (briefly) look at each patch, but if you have 20 boring but
> >   large patches, and a small but important patch that I may
> >   need to comment on, that is a good reason to split.

Sure. I'll try to figure out what makes the most sense for a split
versus having stuff in linux-next in a reasonable way. I suppose volume
of changes will mainly dictate the approach.

> > > Not too much to see here, Yang Yingliang has added some error handling
> > > to the setup of the driver that reports SiFive cache topology
> > > information. I've put it on -next given how far we are in the release
> > > cycle, feel free to put it on fixes if you disagree :)
> > 
> > This is fine either way, as none of the fixes are likely to cause
> > any real issues. I usually like to err on the side of having too much
> > in the fixes branch instead of risking to miss something, but I'm
> > just as happy to follow your preference here.

Cool. I'll bear that in mind for next time, thanks.

> > > RISC-V SoC drivers for v6.2
> > > 
> > > SiFive:
> > > - add probe error handling to the ccache driver
> > 
> > Since this tag description becomes part of the git history, try to write
> > it like you would write a commit log in the future. Ideally that
> > avoids bulleted lists (I know they are easy) and instead uses full
> > sentences that explain things about the state of the patches. If there
> > are bugfixes, are users likely to need the fixes or were they found
> > through inspection? For new features, explain who would have the
> > corresponding hardware and what it does. Again, what you have here
> > is not wrong, but it can always get better.

Yeah, I can do that. You likely won't get a Christian Brauner novella
out of me ever, but I'll do something more cover letter-y next time
around.

Thanks again,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
