Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E7DECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 22:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmHmpb7ryjhzeIJv6ClgVdHLotPEiXYSQ0GqVzcC1PQ=; b=ekFLpizAuau8XS
	PswDlAWsUN9FhpwPd/rd69+EMK67+I3F1I7pxhrcpsVkQhV9wg4OZOAX7Tb+jX+383jsmii2+ZvzX
	UJqAs1GddOOtl8j06Gtek7XvC7A3xZtWp+LbsMp4i8Wp4rLzJQqFl7ujRZjMbeFcwWOlLF6rnzZoS
	BTZ+VusyGQ1pS3CiNqqaHRiK6o2Be7/SoBcnQbTPe1EM2reTQ2cjpNnoNDII7gb4UxheRjh4BkzQA
	vqNZuXy62YrSNvHo9UCR/M3SzfAzSuXlhOWkTzKHtpVzPzvrhnpBRuoc0WKIGsIKKjrcvMMK3V504
	SFtFs56dwUz7Yj+xznKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooY48-003BN7-31; Fri, 28 Oct 2022 22:43:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooY46-003BMd-5f
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 22:43:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5B7062AC2;
	Fri, 28 Oct 2022 22:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75AFC433D6;
	Fri, 28 Oct 2022 22:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666996980;
	bh=34c6l6gV15ZGIVGR9RSKf5GQmfOYDa5a8AkQQVHMlEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMvpcmeK0wFUUVxkzsszNeUeYKc5PFKsAk8Q+SQjcPlDSNkEoY/bzPhfWfKWVT1ZX
	 0Nou8iS1eOMO4r4WXjqCXRDUjqaEbYXWZc5yS0WfEEBSzpL8sg4xh6/Nvawqj/TYTD
	 NlVc92neML8BvmoiIoeszV35JYxEr0weFKgn8rO6kTJzF8N4RWnplK0DIb/kpe3Vif
	 Oj4iKYjbjNJT7tcnNwZ45JCNL5pv5IpLss7yem0OuPk7TeJdWiYuBMAwblUoCuW/t1
	 07W0C0c0+VqSMCH0RgC2XqKVjfrxroiqXg8MH1t8bibFB6FokUPlQzvz0eK8e2KpwU
	 CW8i9AbPis2Ew==
Date: Fri, 28 Oct 2022 23:42:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, waterdev@galaxycrow.de,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: fix styling in ucontext header
Message-ID: <Y1xa782WsdULPIiL@spud>
References: <Y0/PfL5SWNw8HCLr@wendy>
 <mhng-036eff83-1a93-4e98-9810-a4abb79e55e7@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-036eff83-1a93-4e98-9810-a4abb79e55e7@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_154302_292825_84824650 
X-CRM114-Status: GOOD (  24.99  )
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

On Fri, Oct 28, 2022 at 03:23:21PM -0700, Palmer Dabbelt wrote:
> On Wed, 19 Oct 2022 03:20:44 PDT (-0700), Conor Dooley wrote:
> > On Wed, Oct 19, 2022 at 12:07:58PM +0200, Cleo John wrote:
> > > 
> > > Hey, because I am new to Kernel submissions I wanted to ask if there is a way for me to see / track how far this commit has gone in the pipeline of commits?
> > 
> > https://patchwork.kernel.org/project/linux-riscv/patch/20221010182848.GA28029@watet-ms7b87/
> > 
> > IIRC you sent the patch during the merge window, so it wouldn't be
> > applied for v6.1-rc1. You'll get an email from the patchwork-bot when it
> > gets applied.
> 
> Yep, this is one of the more confusing parts of the Linux development
> process for new folks (or at least was for me when I was new): you send a

Nope, was the case for me too. Same applies to most subsystems, think
probably places like netdev are good in that regard as their review
cadence is really good.

> patch and it's not super clear what's going to happen to it for a while.
> The merge window is generally a pretty hectic time, so stuff like this
> that's not fixing a bug or adding some frameware that other patches depend
> on can kind of get lost in the shuffle.
> 
> I always feel kind of bad for folks about that, but patchwork should help
> some here as at least we can get the smaller stuff called out.

Yeah, hopefully patchwork helps. If we keep on top of it & over time
it'll get more useful for infrequent contributors - but for first time
contributors I'm not sure what to do other than for people that notice
it is a first time contributor to be helpful to them?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
