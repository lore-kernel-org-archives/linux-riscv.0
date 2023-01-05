Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D29C5479D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 20:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXVTIsOgFA9gcUuGwX1yo9YrU9XBY5v8pH0ttV5vDXg=; b=2XPfGunUeyX4e0
	fx54rKgG0MPY11xelbPRMoXb+ea8ALSJLr4IYGmFpvfqg8QNKffmdkc3XbHeIycq+DGXlbvvT8Ik+
	bCd/QwvzY2LQLYYFe5QuFVFOixTyJotBhlO30wmzSocJgTSZ7/+xl1zAPeJNixUfJKs36EVMjbtjF
	KcCqvLG5FiCxN0+m0HGF2kP6tTH4pilwSRmJAMrvGIPZQiQDn/Gkp0KY7e3pNNFF495KTVjEfd081
	NZ5PTIXLzGl1HUYA3N3zQC+fA+DffWkN2WqW2vwcwqQlNKSOMEA1USqzTkX8Hbx0BjPRApwc6lqwr
	lBuGRHeGSPLBsiLSku8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWud-00EaKk-2q; Thu, 05 Jan 2023 20:32:31 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDOCq-00BYtV-By; Thu, 05 Jan 2023 11:14:46 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NnkPn2PdWz4xyp;
	Thu,  5 Jan 2023 22:14:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1672917269;
	bh=H58PB5dB0RHrhFpgNYwPMvKuMcKWPpw8G9iLJXZd65A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j/cwOOWYJWVodOQKWxwA65hoiWL4SWeIvVb4ffTACF3VKkA3elmaJ1hYI+wZXwx9L
	 RJ8aLHL842B7PawFJSpXS1qAYC9xwNFOV8u7rmFvlQO7LJk/Wwp3W8tO/xES+41iMV
	 7mOwnQhFKX0M/lIRco+2PSiXUa28qRGAU3HnP78MWuRaw+0+pwWQ01XnpelZX/NpC4
	 MfHAlNtln3QY7tMEcO2VhEKgPhkJFZwH/aZcLHMO77/gEXnpJPVJPk5h3IAQbX/wKC
	 VXb38ngZxmv8RGPyOx8tTFiTtLmMVwSUMs8gztUA0pKa5j1o26PlSFhzs4RJ6rVJOY
	 3RocSLreOfmbw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ard Biesheuvel <ardb@kernel.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, linux-arch@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Thorsten
 Leemhuis <regressions@leemhuis.info>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Dennis Gilmore <dennis@ausil.us>, Albert Ou <aou@eecs.berkeley.edu>, Arnd
 Bergmann <arnd@arndb.de>, Jisheng Zhang <jszhang@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, llvm@lists.linux.dev
Subject: Re: [PATCH v2] arch: fix broken BuildID for arm64 and riscv
In-Reply-To: <CAMj1kXGD3wQUPsRhvD7bO9xBJ6NR=Z+y8wXmKSCs57Oeh3MzGw@mail.gmail.com>
References: <20221226184537.744960-1-masahiroy@kernel.org>
 <Y7Jal56f6UBh1abE@dev-arch.thelio-3990X>
 <CAK7LNAQ-MWhbiTX=phy3uzmNn+6ABZmi49D6d1n1-k-jxcQzgA@mail.gmail.com>
 <87fscp2v7k.fsf@igel.home>
 <CAMj1kXGD3wQUPsRhvD7bO9xBJ6NR=Z+y8wXmKSCs57Oeh3MzGw@mail.gmail.com>
Date: Thu, 05 Jan 2023 22:14:20 +1100
Message-ID: <87y1qh2pyr.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_031444_943451_186FBBCB 
X-CRM114-Status: GOOD (  16.43  )
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

Ard Biesheuvel <ardb@kernel.org> writes:
> On Thu, 5 Jan 2023 at 10:21, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> On Jan 05 2023, Masahiro Yamada wrote:
>>
>> > I do not understand why 99cb0d917ffa affected this.
>> >
>> >
>> > I submitted a fix to shoot the error message "discarded section .exit.text"
>> >
>> > https://lore.kernel.org/all/20230105031306.1455409-1-masahiroy@kernel.org/T/#u
>> >
>> > I do not understand the binutils commit either,
>> > but it might have made something good
>> > because EXIT_TEXT appears twice, in .exit.text, and /DISCARD/.
>>
>> I think the issue is that the introdution of a second /DISCARD/
>> directive early in script changes the order of evaluation of the other
>> /DISCARD/ directive when binutils < 2.36 is used, so that the missing
>> RUNTIME_DISCARD_EXIT started to become relevant.  As long as /DISCARD/
>> only appears last, the effect of EXIT_TEXT inside it is always
>> overridden by its occurence in the .exit.exit output section directive.
>> When another /DISCARD/ occurs early (and binutils < 2.36 is used) the
>> effect of EXIT_TEXT inside the second /DISCARD/ (when merged with the
>> first) overrides its occurence in the .exit.text directive.  The
>> binutils commit changed that because the new /DISCARD/ directive no
>> longer affects the order of evaluation of the rest of the directives.
>>
>
> Exactly. The binutils change mentions output section merging, which
> apparently applies to the /DISCARD/ pseudo section as well.
>
> However, powerpc was also affected by this, and I suggested another
> fix in the thread below
>
> https://lore.kernel.org/all/20230103014535.GA313835@roeck-us.net/

I'm working on powerpc fixes, which I think are all improvements
regardless of whether your change in the above thread is merged or not.

I'll try and get them posted tonight.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
