Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D956CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIja1wJekQZKkhxy6HLcR2fg/iMcdKUqsxIi0UUJV8w=; b=nOFwH10hO7+sfQ
	r3+VO2/wKYBPXAFEcnggYgoaqZVqVR4dOFocFIOynJBJL4xb/WPRHtWZDts3kautIg2kdudtdA+LO
	WuTyBvoHaNxMdkkQzmZRYrlAwaHJ1J757wimboLgIbKFZrRsCYP24M1GuRVJLi0a8Lo15BOvZIe+2
	Hh1Gds5DS5Fbzw1Ie1WEZMGeM7zr6Ab2q4LUCLdf+6POfC7zMnNYtdhPLFiWcFLDZsfOBCfyOpFMH
	xYGH8YDRo4AGpXOZ8A50jrr5Pf3YAFn0yGoqN6hltEsr3CrGULOsMbNmjiLjrxfvybdwgBAVfA8TO
	PAQmDHp0+Tq1DuPw+rWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbBH-000000047QH-39qN;
	Tue, 29 Sep 2026 16:59:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbBH-000000047Q0-0HLi;
	Tue, 29 Sep 2026 16:59:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AB8243BFA;
	Tue, 29 Sep 2026 16:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153C71F000FF;
	Tue, 29 Sep 2026 16:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790701190;
	bh=MGBWHHaEJganj8D1yagMHRlcdsNEyTtM3iC7GV8hUXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SjePm7x02Lah5vOELf9ce4YUO5z/8quB47KG1ZoIMK72aUNVrPrCdr0c0MhVEUCct
	 e/pjkzplRRlc+iDw8myI00JnCkhOCgIGqKVjqAEmF68e1bsSBFWkNDo/dnGaHUUbmN
	 gGTfswdR99FIW24ZhkxFSWQUM+NnT0oWNEgj5t/DAU3kIqebd4giVteYXHP1sJE9R7
	 LMnUflkro8TfjhlCllhq8FQKM35R/YNnamS2pvqYaCoDITHJ1zkhAY1dQR0e4Sb4q1
	 loj77pP8vyLLK7xfd/8pczOKmPjnIREFvATiAc8+2ruPOGvW7PPEKs8kujnvVWWvGM
	 j5+6rTn2iVdcw==
Date: Tue, 29 Sep 2026 18:59:39 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Andreas Schwab <schwab@linux-m68k.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260929165939.GA1890629@ax162>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <87zex4ic68.fsf@linux-m68k.org>
 <20260926121927.GA1486962@ax162>
 <are7cfMIHZZn6jLz@zx2c4.com>
 <20260927080225.37534e7c@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927080225.37534e7c@pumpkin>
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

On Sun, Sep 27, 2026 at 08:02:25AM +0100, David Laight wrote:
> On Sat, 26 Sep 2026 14:32:49 +0200
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
> > Do we even need to return a value at all? Might as well just make the
> > function two lines:
> > 
> > +       for (char *d = dst; size--;)
> > +               *d++ = value;
> 
> Wouldn't it be better to add a barrier() or similar in there to
> stop the compiler playing unwanted games>

Wouldn't that just result in the same code generation issue that Jason
pointed out on my v1?

  https://lore.kernel.org/aquyVkdYceiWdckX@zx2c4.com/

Maybe that doesn't matter because modern compilers have better options?

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
