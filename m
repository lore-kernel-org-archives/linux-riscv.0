Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65820C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 01:56:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB0AB610A3
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 01:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB0AB610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ls3aMc0oEW7tTGH2wWHWPrQa7bjfg9EFpWmoED4/Cg=; b=WONLnv/qGEsSDv
	L0vZGDqcwKnrYmHUZaCaVltRZ3I4y411HMUO5bHL/IpniKK6CwuORrJkf4afoA+YV5uxE3kp6cBQL
	d41N2hFK27Wep4DnGHKlrLbf4l21KZ2Z3/jSA9DmWN2V1FPTlFyj0QKS8Sn9uMekpRpUXhA+uu6g0
	P826SEQ6dmGct3kQYsAtUb+ycjC/aiTQ8Z8UTyarlvh9Euw2jUED/PVQEUkWnu7EP5vsD965Bqjaf
	4mTnDpchRTqkO0scyysc816w2BNTB2y15O77+dX6TX/v3ggSjhvB+z2++d9COPH2FCt7uNMtzzZ32
	+cSEEtpLtTUb0oBRjBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXZgb-008aJs-8y; Tue, 05 Oct 2021 01:56:05 +0000
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXZgO-008ZnA-B3; Tue, 05 Oct 2021 01:55:53 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNgdx17Hfz4xbX;
 Tue,  5 Oct 2021 12:55:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633398938;
 bh=gYlu6Qv+8m83iP3aG7acEoyr8D3DPbZlTHZ8jerl4Jw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oI6DgPAmrS6eid+iQKQamhFupmXA2CScxqKHRX+CJjC8/0fF1BV9+LamvP9D9eSE9
 npjDtMfC1MNcKzde3tkhkeuyG4S9CqgWI+LezmFwIFfQSxbUaY4NuejzURphht7FGp
 ek1oZ95ogFF9mgsmHq93KfvqDA7s9lg+SefS7Uu4jQH2xweVqk/OBZLY5w4Y8cz5FF
 jyvaNEhNFclinElquxf3fKJ2na1IGJxwQje4Hg2exFycrlUGHsDHKTaqoiruy7a9vc
 DhFa9QFOiNLbuIgQmTX/jgFIHs3lgRjeXXAezx290U6sPOlbkpQN1FwNvR9TVFpWGR
 ggckHw/xPBG0Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Keith Packard <keithpac@amazon.com>,
 Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra
 <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "open list:LINUX FOR POWERPC
 (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, "open list:S390"
 <linux-s390@vger.kernel.org>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
In-Reply-To: <202109301045.15DDDA0B@keescook>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
 <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
 <87ee99lii7.fsf@mpe.ellerman.id.au> <87pmst1rn9.fsf@mpe.ellerman.id.au>
 <CAMj1kXFXtbD3=L+QvCnwbyFr-qbWivZ0wRGT0N4LNxANPD8x4g@mail.gmail.com>
 <878rzf0zmb.fsf@mpe.ellerman.id.au> <202109301045.15DDDA0B@keescook>
Date: Tue, 05 Oct 2021 12:55:31 +1100
Message-ID: <87ilycqlpo.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_185552_631652_F5719546 
X-CRM114-Status: GOOD (  26.77  )
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

Kees Cook <keescook@chromium.org> writes:
> On Thu, Sep 30, 2021 at 08:46:04AM +1000, Michael Ellerman wrote:
>> Ard Biesheuvel <ardb@kernel.org> writes:
>> > On Tue, 28 Sept 2021 at 02:16, Michael Ellerman <mpe@ellerman.id.au> wrote:
>> >>
>> >> Michael Ellerman <mpe@ellerman.id.au> writes:
>> >> > Ard Biesheuvel <ardb@kernel.org> writes:
>> >> >> On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>> >> >>>
>> >> >>> The CPU field will be moved back into thread_info even when
>> >> >>> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
>> >> >>> of struct thread_info.
>> >> >>>
>> >> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> >> >>
>> >> >> Michael,
>> >> >>
>> >> >> Do you have any objections or issues with this patch or the subsequent
>> >> >> ones cleaning up the task CPU kludge for ppc32? Christophe indicated
>> >> >> that he was happy with it.
>> >> >
>> >> > No objections, it looks good to me, thanks for cleaning up that horror :)
>> >> >
>> >> > It didn't apply cleanly to master so I haven't tested it at all, if you can point me at a
>> >> > git tree with the dependencies I'd be happy to run some tests over it.
>> >>
>> >> Actually I realised I can just drop the last patch.
>> >>
>> >> So that looks fine, passes my standard quick build & boot on qemu tests,
>> >> and builds with/without stack protector enabled.
>> >>
>> >
>> > Thanks.
>> >
>> > Do you have any opinion on how this series should be merged? Kees Cook
>> > is willing to take them via his cross-arch tree, or you could carry
>> > them if you prefer. Taking it via multiple trees at the same time is
>> > going to be tricky, or take two cycles, with I'd prefer to avoid.
>> 
>> I don't really mind. If Kees is happy to take it then that's OK by me.
>> 
>> If Kees put the series in a topic branch based off rc2 then I could
>> merge that, and avoid any conflicts.
>
> I've created:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/thread_info/cpu
>
> it includes a --no-ff merge commit, which I'm not sure is desirable? Let
> me know if I should adjust this, or if Linus will yell about this if I
> send him a PR containing a merge commit? I'm not sure what's right here.

It looks good to me.

I don't think Linus will be bothered about that merge. It has useful
information, ie. explains why you're merging it and that arch
maintainers have acked it, and quotes Ard's cover letter.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
