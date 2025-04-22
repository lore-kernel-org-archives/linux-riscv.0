Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50156C369D9
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QheF5GtTHmwo681xXQ8DvvFh2JqXqFy41c8v6oj9ys=; b=sVGTG2yhzULTk9
	xBB1gP3UVatxBQCakL1/gOAYSXptDfU/Ea93n0FN80UmlV5v5/XFeef+tWlB8mdQ3Pug6MVcng/k5
	sSaJTnBF+Ptv94dTAsRnw7xaQFy5kUjgnUuCvf6uKmJ2GPX23RH7+2Ja/EE6UHmHwmNRtl/woUo5g
	Hv/CBBgHUIqP9fxasTug4cKdqg+Mb60kxQFpO2hHxgXd9OTUs/ysZk+s01XQkNkVvoR0wACqymu9w
	2ParjfRBxzkGTSeXraAkiCyelIQyW66TF3YT/m7LnvXGWQAkqGWPR/7il6tle7QkhS7Kkm/L4yVfE
	Z+hDB4i44Iq1vYQHXMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ebm-00000007UeF-1PBK;
	Tue, 22 Apr 2025 14:28:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DUE-00000007G9V-2QHt
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 13:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 35ED8A4B24B;
	Tue, 22 Apr 2025 13:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786EAC4CEEC;
	Tue, 22 Apr 2025 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745327789;
	bh=6tmGmklnwN8vx0n4rAj1N5XTQGSDE0iGYL1o4MkaNLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bIs5bTuJvCfBmMKpxZc5Tm7AdYWPFbFzUlulT0XmxotWEMOM0WZlwAB2jVTywkcE6
	 oz01+0jHJ4Zi7TwAU225as4iIeuOMdhPaROhk1ewBAgQNGHLy6R1a1Gx3Qumz7I/8m
	 7yQ1ZTtjaXx88GTEWOv7M8flVGNribf+XGC7oyk4=
Date: Tue, 22 Apr 2025 15:16:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Ryo Takakura <ryotkkr98@gmail.com>, alex@ghiti.fr,
	aou@eecs.berkeley.edu, bigeasy@linutronix.de,
	conor.dooley@microchip.com, jirislaby@kernel.org,
	john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pmladek@suse.com,
	samuel.holland@sifive.com, u.kleine-koenig@baylibre.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] serial: sifive: lock port in startup()/shutdown()
 callbacks
Message-ID: <2025042252-geology-causation-a455@gregkh>
References: <20250405043833.397020-1-ryotkkr98@gmail.com>
 <20250405044338.397237-1-ryotkkr98@gmail.com>
 <2025040553-video-declared-7d54@gregkh>
 <397723b7-9f04-4cb1-b718-2396ea9d1b91@suse.cz>
 <2025042202-compare-entrap-0089@gregkh>
 <a7cf9864-6810-43d8-a7f6-f71cc1ee081c@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7cf9864-6810-43d8-a7f6-f71cc1ee081c@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_061630_748787_2A2A569B 
X-CRM114-Status: GOOD (  32.72  )
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

On Tue, Apr 22, 2025 at 03:07:54PM +0200, Vlastimil Babka wrote:
> On 4/22/25 12:50, Greg KH wrote:
> > On Tue, Apr 22, 2025 at 12:20:42PM +0200, Vlastimil Babka wrote:
> >> 
> >> I admit it's surprising to see such a request as AFAIK it's normally done to
> >> mix stable fixes and new features in the same series (especially when the
> >> patches depend on each other), and ordering the fixes first and marking only
> >> them as stable should be sufficient. We do that all the time in -mm. I
> >> thought that stable works with stable marked commits primarily, not series?
> > 
> > Yes, but when picking which "branch" to apply a series to, what would
> > you do if you have some "fix some bugs, then add some new features" in a
> > single patch series?  The one to go to -final or the one for the next
> > -rc1?
> 
> As a maintainer I could split it myself.

You must not have that many patches to review, remember, some of us get
a few more than others ;)

> > I see a lot of bugfixes delayed until -rc1 because of this issue, and
> > it's really not a good idea at all.
> 
> In my experience, most of the time these fixes are created because a dev:
> 
> - works on the code to implement the feature part
> - while working at the code, spots an existing bug
> - the bug can be old (Fixes: commit a number of releases ago)
> - wants to be helpful so isolates the fix separately as an early patch of
> the series and marks stable because the bug can be serious enough in theory
> - at the same time there are no known reports of the bug being hit in the wild
> 
> In that case I don't see the urgency to fix it ASAP (unless it's e.g.
> something obviously dangerously exploitable) so it might not be such a bad
> idea just to put everything towards next rc1.

Yes, but then look at the huge number of "bugfixes" that land in -rc1.
Is that ok or not?  I don't know...

> This very thread seems to be a good example of the above. I see the later
> version added a
> Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
> which is a v5.2 commit.

Agreed, but delaying a known-fix for weeks/months feels bad to me.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
