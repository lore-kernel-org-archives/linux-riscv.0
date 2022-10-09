Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A0BC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Oct 2022 12:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HB0hgfXs/rQcVSSUszP76ME2ZVC4sRahTtE/4gJEkII=; b=Dm9BiLidG/oir5
	EY3nWz86jMllhFg4NXGAA7l61a5NpjUGUBLn7T87Cunsqj3jM3Jpx+ujZ8HQvo0Pds+qxif5zIDKk
	Ta99JYbdWgBbjU4lTydadkFxfLiSvB4o3o4V66vEJF79hgwNrckTArJeR/7TmdsmiUHPVDsZ9JbK1
	aVaCAudRL1VBdl2+r3983TFbmznjH5sNq4ONEzP18fD5tzNHCxpDNJARcGo3R6s302KUEVd1qtORF
	I3wv4zczHly4gTlkRzRi0PhVxZ8IM3fWEbj4b8u8NL1QLNlH85uG5e/kJ8rFuCs+KcCFSylTdDuZj
	p1bDPRTvpArfjP7exNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohVeC-00FaS7-PI; Sun, 09 Oct 2022 12:43:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohVe9-00FaQx-J4
	for linux-riscv@lists.infradead.org; Sun, 09 Oct 2022 12:43:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4901DB80D19;
	Sun,  9 Oct 2022 12:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA862C433D6;
	Sun,  9 Oct 2022 12:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665319387;
	bh=bfA3IYKx0Be92w8PMyPQQIiBQ42NlAAt1mAtmJKrAg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJxgGN3NX/61miSGlo7CrAo8bGt9TAwM8pa4paB+WgHMTwJ9HPRzT4qJS09B6Tjwx
	 927o7XIsgMCxmbWA6xOHz7HuhXjqx9XxFxo+5xFpsDell3omt70/JQQ1/+UVwz0M0K
	 Od2wCr4UrNQ0gS1+bQ74IU+2PbJdLqZQ9MaYrfR2mzAHiZGSdqwrLHo9N78bukEYJ4
	 BGJ8hfLFQKLgF0gHmaIkmuG79gu+4fJdGnYQit5bRr7ixbi7HbbtNfnI57cdlAvBk1
	 +fg9wPymkfpVq8kmkLO8Y9AS8tFBH0gmORFIVVeQ5H/znhPXOqcL3UtjTe8sLxNm59
	 hgctv+xb19C5Q==
Date: Sun, 9 Oct 2022 13:43:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Cleo John <waterdev@galaxycrow.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixed styling in riscv ucontext header
Message-ID: <Y0LB1oLuVIytgKI/@spud>
References: <20221009120340.GA41243@watet-ms7b87>
 <Y0K7PDzwuOPweYSm@spud>
 <1923489.PYKUYFuaPT@watet-ms7b87>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1923489.PYKUYFuaPT@watet-ms7b87>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_054309_940068_D74A8D4D 
X-CRM114-Status: GOOD (  35.42  )
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

On Sun, Oct 09, 2022 at 02:38:43PM +0200, Cleo John wrote:
> Hey Connor,
> 
> On Sun, 9. October 2022, 14:14:52 CEST, Conor Dooley wrote:
> > Hey Cleo,
> > 
> > On Sun, Oct 09, 2022 at 02:03:40PM +0200, Cleo John wrote:
> > > Fixed styling in riscv ucontext header
> > 
> > This should probably be "riscv: fix styling..."
> 
> okay yea, I will change this in a second patch.
> 
> > > This patch changes the two comments in ucontext.h by getting them up to
> > > the cody style proposed by torwalds.
> > s/This patch changes/Change
> > 
> > Looks like some typos here too & your lines need to be wrapped at 72
> > characters for commit messages. git usually enforces that automatically
> > when you do a `git commit`.
> I will wrap the lines, but where are the typos if I may ask?
>

"cody style" & s/w/v/ in Linus' name.

> > > In my opinion this also improves the readability so I think this is a
> > > useful change to do. Please also tell me if you have a different opinion.
> > 
> > FYI commentary on the patch should go below the ---.
> will note
> 
> > > Signed-off-by: Cleo John <waterdev@galaxycrow.de>
> > > ---
> > > 
> > >  arch/riscv/include/uapi/asm/ucontext.h | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/uapi/asm/ucontext.h
> > > b/arch/riscv/include/uapi/asm/ucontext.h index 44eb993950e5..0cd6f8616985
> > > 100644
> > > --- a/arch/riscv/include/uapi/asm/ucontext.h
> > > +++ b/arch/riscv/include/uapi/asm/ucontext.h
> > > @@ -18,7 +18,8 @@ struct ucontext {
> > > 
> > >  	/* There's some padding here to allow sigset_t to be expanded in 
> the
> > 
> > Why fix the closing comment but leave the opening ones incorrect?
> > 
> > Thanks,
> > Conor.
> 
> I mixed the code style up with the one in net/ -will fix
> 
> Thanks,
> Cleo.
> 
> > >  	 * future.  Though this is unlikely, other architectures put 
> uc_sigmask
> > >  	 * at the end of this structure and explicitly state it can be
> > > 
> > > -	 * expanded, so we didn't want to box ourselves in here. */
> > > +	 * expanded, so we didn't want to box ourselves in here.
> > > +	 */
> > > 
> > >  	__u8		  __unused[1024 / 8 - sizeof(sigset_t)];
> > >  	/* We can't put uc_sigmask at the end of this structure because we 
> need
> > >  	
> > >  	 * to be able to expand sigcontext in the future.  For example, 
> the
> > > 
> > > @@ -27,7 +28,8 @@ struct ucontext {
> > > 
> > >  	 * ucontext, so we're putting this at the end in order to allow 
> for
> > >  	 * infinite extensibility.  Since we know this will be extended and 
> we
> > >  	 * assume sigset_t won't be extended an extreme amount, we're
> > > 
> > > -	 * prioritizing this. */
> > > +	 * prioritizing this.
> > > +	 */
> > > 
> > >  	struct sigcontext uc_mcontext;
> > >  
> > >  };
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
