Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4FAC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 13:19:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E5DA611C3
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 13:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E5DA611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5RUYcFZkoSNVoERoCW4qkAtNqkwHPZLoRan5yAqHJw=; b=SEfzg1utZXkhCr
	p9xH7EM03kiwQQsNJwuZVVBvqCICXrhYwmLtKLlKJNLuBmb1YAqjC2tw222Nk86eVLi/f+iMtFZdU
	Hc+sF7rWYC4xx2RKw1gk1IuZMgVHmB8U18J8fgZB+MNxt+wQw651zPuTntrkskAzM51ZJqtkAB56U
	WDLg35uLkwx1A/OZ2wWLdOre67DLfoDXtK5gWM/i4Wdq0TGveOcshY4GeA78PvNjPbP65Z3yw+2Ry
	VJW8yZDgbe/c9bpn5UucQgeIPQjF0lN9aD/8xqHoProOGXnK6bsLCdU+5zh6NhVHyEX3B9HVygowX
	nKyLVBR0U2pPtd9cd+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVD0z-007JWj-V9; Tue, 28 Sep 2021 13:19:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVD0m-007JVO-H6; Tue, 28 Sep 2021 13:19:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A864611C3;
 Tue, 28 Sep 2021 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632835148;
 bh=VeB5GXPFGYAi+MDx0ZEO0Lyx1tXoFrq/FrWnMOweEWQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E6PkQJw5it78rA4KrKO0b5LutT3C4uTphBUvGPD4fQ0Di5ZYNWWgWk+/s5idGmc/k
 xQcPA/EsJt4Koh7XNKWbT7/MPE8Fv4Z8JCChz4cO08bYcgM/ynRHcsvaxeZ3G7+xhE
 DsIQ1gaK89EAwDU3qB7rcULuUK25ZFVWdi5QuwBOfe/kJ9Jlactxz6E+u/TmNUYp81
 vS13IOXY/pys6vZUgOPJEtmlFP/29ITZzuU3K3lcvR3IVGcy5ZCEMBwiVyo+6M4bp4
 uxbQAtqg3w4x39Cdq6Wkj0KCk+POXNtOq9TVKZaHtWgA485nqR3ZV7pK5wOPD1b5NC
 JwPezpCThn3ZA==
Received: by mail-oi1-f176.google.com with SMTP id v10so29836401oic.12;
 Tue, 28 Sep 2021 06:19:08 -0700 (PDT)
X-Gm-Message-State: AOAM5309z4G/EMLwFSqN+oEYOJ7iEDWM4440uvGtDgtyWRbwKMupe7UX
 DPu5wa88Jw6Mq55QhB7Knq9MCmaCGyNi0/XcjmA=
X-Google-Smtp-Source: ABdhPJyep3Pw1Kqo5huUAuGsrpllZ2c8nSuyzA6EOwJFgMmmBzpyy+vZsyEyrP7TXFbetznr+4dx/vVu8duHYpn76tM=
X-Received: by 2002:a05:6808:1148:: with SMTP id
 u8mr3509831oiu.33.1632835136613; 
 Tue, 28 Sep 2021 06:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
 <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
 <87ee99lii7.fsf@mpe.ellerman.id.au> <87pmst1rn9.fsf@mpe.ellerman.id.au>
In-Reply-To: <87pmst1rn9.fsf@mpe.ellerman.id.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 28 Sep 2021 15:18:45 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFXtbD3=L+QvCnwbyFr-qbWivZ0wRGT0N4LNxANPD8x4g@mail.gmail.com>
Message-ID: <CAMj1kXFXtbD3=L+QvCnwbyFr-qbWivZ0wRGT0N4LNxANPD8x4g@mail.gmail.com>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Keith Packard <keithpac@amazon.com>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, 
 Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:S390" <linux-s390@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_061908_609708_661291A6 
X-CRM114-Status: GOOD (  22.44  )
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

On Tue, 28 Sept 2021 at 02:16, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Ard Biesheuvel <ardb@kernel.org> writes:
> >> On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
> >>>
> >>> The CPU field will be moved back into thread_info even when
> >>> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
> >>> of struct thread_info.
> >>>
> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>
> >> Michael,
> >>
> >> Do you have any objections or issues with this patch or the subsequent
> >> ones cleaning up the task CPU kludge for ppc32? Christophe indicated
> >> that he was happy with it.
> >
> > No objections, it looks good to me, thanks for cleaning up that horror :)
> >
> > It didn't apply cleanly to master so I haven't tested it at all, if you can point me at a
> > git tree with the dependencies I'd be happy to run some tests over it.
>
> Actually I realised I can just drop the last patch.
>
> So that looks fine, passes my standard quick build & boot on qemu tests,
> and builds with/without stack protector enabled.
>

Thanks.

Do you have any opinion on how this series should be merged? Kees Cook
is willing to take them via his cross-arch tree, or you could carry
them if you prefer. Taking it via multiple trees at the same time is
going to be tricky, or take two cycles, with I'd prefer to avoid.

-- 
Ard.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
