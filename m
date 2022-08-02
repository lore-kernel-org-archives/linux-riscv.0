Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8738EC00140
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Aug 2022 14:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b81SaI7wpOkuArBHzV8kpxLJDA3FWMQfgluoGLBMmVs=; b=kcGkxj77UC1n0j
	3V8aAdvxX5Go7ZWZPG0w3p8G3dzHoqE3RxtPpWpn0kcWqYQJauQLGK6RgyNKkjF2RHzHFejKzVhOc
	16HWTnSQDurjfee+8ZS8mHXp3tm24v5OG8buNE60o9rm1pcCeq3aISrwoJ4caPSmzcXoaQn29KFqj
	Y6YYKjG4RvjXK+jQxjM4fEWaIRc9BqdMoDRA10RI2x63mfyMptj6tDb+wHal7CSTamGeOlevE4+FG
	8S9C7jiLdckXlzRCQ/d2Ti3RjCkyD42JrvE8GuLND5fcdYfDf8zk2EVQIyyisz1h/DYe36K9/19WP
	j4SaZgoQlaAZpA2Uq8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsTe-00EkV4-J5; Tue, 02 Aug 2022 14:02:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsTA-00EkER-3m; Tue, 02 Aug 2022 14:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V0bxhMuFGVpCNNCF4xZRTUKyf/IayXy8Ya6lnRp3eRM=; b=c+eAFf5yhUXd9GX0Xjgrlhci7w
	u2nOpt7L7zHbqejW/W8vk/nWgJn+ectptRURVYjT9GuMuXoEVJIaCYb4G5Ck4ZpHR4CLsKuu3OqN/
	UOuPSi+rY3emlnof227LYCgd9DmHLebeowaDY2JGOUaE4Fm34ooWGqBKlCBs/xEoS0YNkRIqLWa/v
	I8vAY7O/oQOUU4gQL9rUsv8JBoGFsCmC+/8CJhQ7W26arJc4Cjd48pz0Kcqam8A8TcpciOihHNlee
	PzeqvSu311ay0SXY7CEZwHekoJZFc2qRIlA9vp82SOEaYgiZxu950tHs7KZpBGWstkWLgZ8CyQzyu
	S3Zudeiw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsT4-008PBV-Tf; Tue, 02 Aug 2022 14:01:54 +0000
Date: Tue, 2 Aug 2022 15:01:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-um@lists.infradead.org,
	live-patching@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v8 00/31] Rust support
Message-ID: <YukuUtuXm/xPUuoP@casper.infradead.org>
References: <20220802015052.10452-1-ojeda@kernel.org>
 <YukYByl76DKqa+iD@casper.infradead.org>
 <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com>
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

On Tue, Aug 02, 2022 at 03:45:50PM +0200, Miguel Ojeda wrote:
> Hi Willy,
> 
> On Tue, Aug 2, 2022 at 2:26 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > None of this (afaict) has been discussed on linux-fsdevel.  And I may
> > have missed somethiing, but I don't see the fs module in this series
> > of patches.  Could linux-fsdevel be cc'd on the development of Rust
> > support for filesystems in the future?
> 
> In order to provide example drivers and kernel modules, we need to
> have some safe abstractions for them, thus we are adding some as we
> need them.
> 
> More importantly, the abstractions also serve as a showcase of how
> they may be written in the future if Rust support is merged.
> 
> This does not mean these abstractions are a final design or that we
> plan to develop them independently of subsystem maintainers. In fact,
> we would prefer the opposite: in the future, when the support is
> merged and more people start having more experience with Rust, we hope
> that the respective kernel maintainers start developing and
> maintaining the abstractions themselves.
> 
> But we have to start somewhere, and at least provide enough examples
> to serve as guidance and to show that it is actually possible to write
> abstractions that restrict the amount of unsafe code.
> 
> And, of course, if you are already interested in developing them, that
> would be actually great and we would love your input and/or that you
> join us.

No objections to any of this.  I love the idea of being able to write
filesystems in Rust.  I just think it would go more smoothly if
linux-fsdevel were involved more closely so people at least have the
option of being able to follow design decisions, and hopefully influence
them.  That goes both ways, of course; I hardly think our current
operations structures are the optimum way to implement a filesystem,
and having fresh eyes say things like "But that shouldn't be part of the
address_space_operations" can impel better abstractions.

> As for the `fs` module, I see in lore 2 patches didn't make it
> through, but I didn't get a bounce (I do get bounces for the
> rust-for-linux ML, but I was told that was fine as long as LKML got
> them). Sorry about that... I will ask what to do.

The obvious answer is to split out the 'fs module' into its own patch
;-)  I presume it was part of the kernel crate which would have been
either patch 17 or 11 in that series?

> Meanwhile, you can see the patches in this branch:
> 
>     https://github.com/Rust-for-Linux/linux.git rust-next
> 
> Cheers,
> Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
