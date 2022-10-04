Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F61C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y40sn3vK/YYlvCx3Ek0li6FVynnA7m4vGD7Fo7MR20I=; b=Dp8Z4jdbI44Aag
	/fhOnTbHtPRDiLfHiW7zLpGyCfj1p9+aPLy9mgVadkUMYYptN8W37VoYP8GYJF0W5O5hM1O4oHIVT
	uJVfGOJ4tl4a6Mzxszh+DQGXUZs3ATP5e5Oc5yqLJ3Mzi8V8cXeiEnX83czhyHA0PVvt4mMCcAhPT
	ZDsatY86WiZEOoDbq5yAjHyVhJsGSAY7m1F9ErYzq2WLkEdPM4piEUGVOrRkW3bxQVgLDgKk4x+py
	Vcp2gGEE2KZe1A76OtPh9NAijOwQQzse+q3edYrJTyKdIJ4JTRA/OEF3QJBGu84UiJcIBvrUiilYV
	zJMmxHFoDzY5psONYMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oflVr-00AGgf-Ef; Tue, 04 Oct 2022 17:15:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oflVo-00AGgL-2l
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 17:15:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B1332B81B55;
	Tue,  4 Oct 2022 17:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60157C433D6;
	Tue,  4 Oct 2022 17:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664903717;
	bh=mGnX35o3y1NNdpCSMlejw46q4AM700HTmz9Es/OfI7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aem2PfxUwzcAtdp/4gwiBW4foLdCqlY75A9d4bOftRj3DeXAZeQ7mUDhJ3pzR52ld
	 XJEo6dsMtjcxvjSJOZGivS1jn3aeu+RxVi1f+y3/R9SJA/NN3gZzMnVgh7yR06lPbx
	 +P1dGn3XFeJyzSnOc2m5eXwzzm+uU7RcJUZwZ1EL8RDWbbfY5ODJzLb2Lhev1RxudX
	 2XHSNC23/Oi6YqSCnU6CFinQOysLNhihm/9k2X+SHpAL/RzhgcIlqy9JlkOy4yjwDn
	 wEwcWA/sWbM58krWJywf81salJN34dOrsHEI+DrVXXrRqxz/946mH3hcjl5ejdpQ+n
	 ywKsAPQreqGwQ==
Date: Tue, 4 Oct 2022 18:15:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>, Dao Lu <daolu@rivosinc.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
Message-ID: <YzxqH095FxqKZpDg@spud>
References: <2546376.ElGaqSPkdT@phil>
 <2E96A836-764D-4D07-AB79-3861B9CC2B1F@jrtc27.com>
 <13396584.uLZWGnKmhe@phil>
 <CAOnJCUKdBpbj=KDz5oibB_N_SjOiMrkWcttczuGbisi_nMWaVA@mail.gmail.com>
 <Yy+Plxzj4bckXrhy@spud>
 <CAOnJCU+fA-pxLPRviqW2d7q-E__qJYkZKkCdiNHXhJBjWCRPaA@mail.gmail.com>
 <YzS5kT2CCBPxqLg+@spud>
 <CAOnJCUKn-rNwyw5BK7=hNM-vnJ=VROjipCiDtB4BL=LZ3kKAAg@mail.gmail.com>
 <YzifTW5Y7O191gCo@spud>
 <CAOnJCUKtoiXKaS81BZyvpybFDkh-undHLqE5ZxoNmf9AtAtvfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUKtoiXKaS81BZyvpybFDkh-undHLqE5ZxoNmf9AtAtvfw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_101520_308603_F72B80E4 
X-CRM114-Status: GOOD (  21.88  )
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

On Tue, Oct 04, 2022 at 09:52:41AM -0700, Atish Patra wrote:
> On Sat, Oct 1, 2022 at 1:13 PM Conor Dooley <conor@kernel.org> wrote:

> > > Thanks. It would be good to understand what happens when "pause" is
> > > executed on these boards ?
> >
> > The actual pause instruction? uhh, so with the usual "I don't know what
> > I am doing" disclaimer, I ran each of the .insn and pause instruction 48
> > times in a row and checked the time elapsed via rdcycle & then ran that
> > c program 1000 times in a bash loop. Got the below, the insns were run
> > first and then the pauses.
> >         insn    pause
> > min     2.3     3.2
> > max     9.5     10.6
> > avg     27.0    29.1
> > 5%      2.9     4.2
> > 95%     18.1    19.1
> >
> > Swapping the pause & insn order around made a minor difference, but not
> > enough to report on. I'd be very wary of drawing any real conclusions
> > from this data, but at least both are roughly similar (and certainly not
> > even close to doing the div w/ zero args.
> >
> 
> Yeah. That's what I was expecting. So we can't drop the div for now. Otherwise,
> the existing hardware(don't support Zhintpause) suffers by spinning faster.
> 
> Thanks for running the experiments.

I've lost track, does that mean the patch is okay as, is or needs to be
changed? The former, right?

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
