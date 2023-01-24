Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA7FC25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHVf+e4KwcVpPlH2verAu0IVCtEmpPGy6aE9vWH8cIk=; b=2cFhNueAPcJ8YP
	GMlvYGK4AQXOxV1a7SLaHSpfYddyVMDOf09f4MeGUqCQGfK+dnKBefiShaIhRJUUbGku8H+02k542
	++5Vrw0aS+BRyPe5OXR9jx7sNnHc4eWqJ5KSo2qWHHXqkXsWZy2taLWQW2AVqJjE4cTsayB+P/2rb
	WgN428bTq2cRBbFonfV2J1Vi6zOvRQ8ikDaiKHFR9hhGaVIwx0vi1d0wJWE9z/6Em1tL2+kPriExQ
	9pZ6Ics5k7j4qzjUJ25BnZjBiGVCjEOoS7vrVW8HNPVTXGiiOckOlzl7I90ZGOs0kGwRX6rNn5nOs
	5fLlpCTkhpSRrwZPQqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKxh-004SrB-CG; Tue, 24 Jan 2023 15:11:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKxU-004Soa-NL; Tue, 24 Jan 2023 15:11:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21B1F4B3;
	Tue, 24 Jan 2023 07:12:14 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FE4F3F5A1;
	Tue, 24 Jan 2023 07:11:30 -0800 (PST)
Date: Tue, 24 Jan 2023 15:11:28 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	linux-riscv@lists.infradead.org,
	Pierre Gondois <pierre.gondois@arm.com>
Subject: Re: [GIT PULL] cacheinfo/arch_topology: Updates for v6.3
Message-ID: <20230124151128.4d57tpkuahaw2kex@bogus>
References: <20230120121856.1407369-1-sudeep.holla@arm.com>
 <CAMuHMdUZzLkWvhQ=YeH2KfQ_FRidemfOvbbHf_b1AHROK9HFNA@mail.gmail.com>
 <20230124144245.ddphvqbcxpzrlgek@bogus>
 <Y8/xJZOourqBvxVR@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8/xJZOourqBvxVR@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_071136_821796_67B7CB92 
X-CRM114-Status: GOOD (  21.42  )
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

On Tue, Jan 24, 2023 at 02:54:29PM +0000, Conor Dooley wrote:
> On Tue, Jan 24, 2023 at 02:42:45PM +0000, Sudeep Holla wrote:
> > On Tue, Jan 24, 2023 at 02:44:10PM +0100, Geert Uytterhoeven wrote:
> > > Hi Sudeep,
> > > 
> > > On Fri, Jan 20, 2023 at 1:22 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > > It has been tested on RISC-V which is the main users outside of arm64.
> > > 
> > > Has it?
> > >
> > 
> > Hmm, I might have mixed up things then. I was on a vacation for quite some
> > time and might have assumed Conor response on the thread with testing.
> > Extremely sorry for that. However it was in -next for few days before
> > Greg applied to his tree.
> 
> Sorry chief! The CI stuff we run on the RISC-V patchwork only provides
> build coverage etc & my CI against linux-next doesn't check for this kind
> of thing.

No worries, it was holiday hang over from my side. I did check and repond
to the other thread during holiday and then mixed up things, my bad.
Sorry for that.

> I'll put it on my todo-list to add that, both for patchwork and in our
> internal CI.

Thanks.

> I only reviewed the patch that was moving the code to common group and
> not the others unfortunately. Next time I'll be sure to review the lot!
>

Also I really hope we don't have to change this much but who knows. I
thought so few years back yet we are changing it so much in the recent
days. Hope that will enter quiescent state soon ;) yet again.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
