Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16439C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpmQcMXIk543UZBt5mMBK800tLBPF3ElVEZHUsfv1gE=; b=qaT4hjIeSp1NzF
	ur9C2bi+gS8bjZLFlyjHFh8+v5QGanFRzr5x3sjGu5wseMNjx7n/KvzcOAcQSt3fmBZ4P30ejxH/N
	w0duSFhD/u/I9SQicQJIqWTcLb6L3FrA9HqFeO9W7L04hct5lBrgMuVLq3tmCxacENvxrjmIS7mwP
	srrhDFqf0+ZegtRMj7Zi7LzICgKUu263tF2JcP1TYpnH+V5fVsjK5K3uKB5DwPPH1FR5+CYVGQKmi
	RvBxr/NaeCWBUGil8cGVkNHooESLdUK3sdb9r3IOvjjTzyEROLXvBtheNSuq+F1sBr7x3r+jEldyH
	9911XCE8AXV7Xr4FYDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aq8-0000000DphP-0HpF;
	Thu, 10 Sep 2026 09:13:04 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aq4-0000000Dpgy-44ta
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 09:13:02 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4ab4fe290so227883a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 02:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789031580; x=1789636380; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x80sULQ0zZu1BIKAuLseVrEbYl+Sg0KA4OXi22FchTM=;
        b=I25PAfuqGWHugzA+pak7h1cTMb10eHJdd2qirB+3h2ZlIlBSCmTmv/GIOjC9KMUFLC
         GD0PYAr1B4gBgnQXp9NOA6oMUFpz0AmO/204jOPn69l3xGamu4UJNIBkq08/2b8CGdS4
         2/p5kqgrJjVLuyC0pto23eFKWuYTbbvDXeO6ErNOh6upYM2uBlGshbWhmGvgFvYOlJHD
         HWqOk+YcVjoUL0S21AP22y/gQaJ8I3WFR3w0ET0quWKlUn6589578uj9shclJlee09K8
         Z9oTfXAax9NSS4rRfeTRe8BvyQVnwHhsDOkIyWMFGMAm2hQMgWUJvPaLHKVUonT50EuJ
         mn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031580; x=1789636380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x80sULQ0zZu1BIKAuLseVrEbYl+Sg0KA4OXi22FchTM=;
        b=DQRq3k/3oAS4lXT3LBgkluCKAWHROqVB8w6hn9SyflLsc8EGl1eI9wAyfSqReGsSzw
         uTJGuSx06q1bg/YLFlpdrM+zLhj9Dnay0MSxcvTsEFkaHAHtUYj52Yo9attySN9BCIwb
         7Xq3pMdfK+Y3rL629vYb9WwR79kMud1k2eQ5SWDmh0+DwN0Tv2BanAZgn90ju56Vb1XZ
         9VLuRsejaF6Fw9wcxckRDUooSOMQAlJv4JzvpvXElmLot3Cm6bu6GMOGSCS48uEzC4Ri
         I4i6c0+Y9TgaeEbRo3qwli3NQ8uXgXgAuF/oAVGETCtYQh7RQ5Jze/93OV0FdxptGW8I
         3Bbg==
X-Forwarded-Encrypted: i=1; AKwUvBxF0B1IBQ9x7+5bIu2pwb8xJpYKtqacWSZigSwZ4HjhRhbGt1KIDG0VbyDR/IVVMlqq7Yy9LUOgWKzeEQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kGijZwS4YvM5Ih5CfanxNgWS55Xf0qa2cMRKlH0tN2FgUwWbpn
	GxY9ZC9Fo4actSitxh4FACdMIZgMUeA5hriFFTbV2v/w846mECbE14vyxzxovw==
X-Gm-Gg: AYBFou2OWei0wVp+qr3eCannyKYhh6E0k+Ey02jNPSUIlMs0kME5O9+ef1sxUgi5Znz
	RA/5wg6bhFmEOfMamzvSz1XtpPRVnYWlwtOn7WpAQpi+2yHtMO+RNZpk3WQA29i0QbhpV7zGPNF
	fBEgs5L2VxYOr02hkzMVSHK/m6bzUbmVyMRJOQJIRTAS3K+wTszrJDspKV/Z0jvo8UOsUpRPmqk
	MB4mj9Lxi+uON7Qkq3PuENqEIwYKXxtBt9QAZdBrF8LGUILTSWw5GIHu2ddTJcDwnR1fVQsjnKi
	/NYI/qsiLultjAQjXKszQjHg/Ma6ape+WHgMMnpqaaeKg9PFsPAMSb/X6KhbqPf4ozCuvI/ixea
	Ty6gs3O00uy9MZrErNF3jaSfBryhHJvsAZ89x38sm+hUAPwgqs7Gs7XDDnlA95dKt6h/K45k1eY
	18CNH9SFfrXUmBZP8lD9GSuSPMzEbZMsSLkdwju/TWZnFpYJDLMdKhbkxy0s+3ndKxNYMuK5HiG
	BrAFyaQA8hkFNbiptWTwwDJz/y40gH8V3HVJpN7JrY=
X-Received: by 2002:a17:90b:2b4f:b0:398:c6e8:3fc2 with SMTP id 98e67ed59e1d1-39d77a029c6mr3299345a91.4.1789031579674;
        Thu, 10 Sep 2026 02:12:59 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e82fa21sm3426201a91.9.2026.09.10.02.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:12:59 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:42:47 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH V2] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqJ0QZYuft-VWrnW@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260910071252.1950488-2-mkchauras@gmail.com>
 <0605f2ed-32a1-492d-850e-d1080007b4bc@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0605f2ed-32a1-492d-850e-d1080007b4bc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_021301_030913_DF5DB32E 
X-CRM114-Status: GOOD (  25.92  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2026 at 09:36:34AM +0200, Christophe Leroy (CS GROUP) wrote:
> =

> =

> Le 10/09/2026 =E0 09:12, Mukesh Kumar Chaurasiya (IBM) a =E9crit=A0:
> > The Rust kernel infrastructure generates inline asm for WARN() via
> > ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> > preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> > arch-specific asm template string for use in Rust's core::arch macros.
> > =

> > powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> > Rust builds to fail on powerpc with
> > ```
> > error: no rules expected `ARCH_WARN_ASM`
> >     --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_a=
sm.rs:1:28
> >      |
> >    1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{f=
lags}", "{size}"))
> >      |                            ^^^^^^^^^^^^^ no rules expected this =
token in macro call
> >      |
> >     ::: ../rust/kernel/lib.rs:279:1
> >      |
> > 279 | macro_rules! concat_literals {
> >      | ---------------------------- when calling this macro
> >      |
> >      =3D note: while trying to match sequence start
> > =

> > error: no rules expected `ARCH_WARN_REACHABLE`
> >     --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reacha=
ble_asm.rs:1:28
> >      |
> >    1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
> >      |                            ^^^^^^^^^^^^^^^^^^^ no rules expected=
 this token in macro call
> >      |
> >     ::: ../rust/kernel/lib.rs:279:1
> >      |
> > 279 | macro_rules! concat_literals {
> >      | ---------------------------- when calling this macro
> >      |
> >      =3D note: while trying to match sequence start
> > =

> > error: aborting due to 2 previous errors
> > ```
> > =

> > Refactor _EMIT_BUG_ENTRY to accept explicit (file, line, flags) string
> > arguments rather than relying on positional asm operand references
> > (%0, %1, %2, %3). This allows the macro to be composed as a plain
> > string concatenation, which is required for ARCH_WARN_ASM where no asm
> > operand context exists.
> =

> For a cleaner _EMIT_BUG_ENTRY() macro, shouldn't it also pass the label
> where the trap sits as a macro argument instead of blindly relying on it
> being 1: ?
> =

> Christophe
> =

Hey Thanks for pointing it out.

Yeah the assuption to always use 1 shouldn't be there. It should come as
an argument. Will fix this and send out a new revision.

Regards,
Mukesh
> > =

> > Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
> > the BUG_ENTRY() call site to preserve existing behaviour while enabling
> > ARCH_WARN_ASM to supply its own size operand independently.
> > =

> > Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
> > convention, indicating that no additional reachability annotation is
> > needed after a WARN on powerpc.
> > =

> > This brings powerpc into line with x86, arm64, s390, and riscv, all of
> > which already define ARCH_WARN_ASM and ARCH_WARN_REACHABLE.
> > =

> > Reported-by: FUJITA Tomonori <tomo@flapping.org>
> > Closes: https://lore.kernel.org/all/anG67Q6Y59kDqh-c@desktop
> > Fixes: 73b741adb264 ("rust: Add PowerPC support")
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> > Changelog:
> > V1 -> V2:
> > - commit message now has error, fixes tag and closes tag
> > =

> >   arch/powerpc/include/asm/bug.h | 28 ++++++++++++++++------------
> >   1 file changed, 16 insertions(+), 12 deletions(-)
> > =

> > diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/=
bug.h
> > index 0db48977c70c..8aba39e0cf26 100644
> > --- a/arch/powerpc/include/asm/bug.h
> > +++ b/arch/powerpc/include/asm/bug.h
> > @@ -32,34 +32,38 @@
> >   #endif /* verbose */
> >   #else /* !__ASSEMBLER__ */
> > -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> > -   sizeof(struct bug_entry), respectively */
> >   #ifdef CONFIG_DEBUG_BUGVERBOSE
> > -#define _EMIT_BUG_ENTRY				\
> > +#define _EMIT_BUG_ENTRY(file, line, flags)	\
> >   	".section __bug_table,\"aw\"\n"		\
> >   	"2:	.4byte 1b - .\n"		\
> > -	"	.4byte %0 - .\n"		\
> > -	"	.short %1, %2\n"		\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +	"	.4byte " file " - .\n"		\
> > +	"	.short " line ", " flags "\n"
> >   #else
> > -#define _EMIT_BUG_ENTRY				\
> > +#define _EMIT_BUG_ENTRY(file, line, flags)	\
> >   	".section __bug_table,\"aw\"\n"		\
> >   	"2:	.4byte 1b - .\n"		\
> > -	"	.short %2\n"			\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +	"	.short " flags "\n"
> >   #endif
> >   #define BUG_ENTRY(cond_str, insn, flags, ...)		\
> >   	__asm__ __volatile__(				\
> >   		"1:	" insn "\n"			\
> > -		_EMIT_BUG_ENTRY				\
> > +		_EMIT_BUG_ENTRY("%0", "%1", "%2")	\
> > +		".org 2b+%3\n"				\
> > +		".previous\n"				\
> >   		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
> >   		  "i" (flags),				\
> >   		  "i" (sizeof(struct bug_entry)),	\
> >   		  ##__VA_ARGS__)
> > +#define ARCH_WARN_ASM(file, line, flags, size)		\
> > +		"1:	twi 31, 0, 0\n"			\
> > +		_EMIT_BUG_ENTRY(file, line, flags)	\
> > +		".org 2b+" size "\n"			\
> > +		".previous\n"
> > +
> > +#define ARCH_WARN_REACHABLE
> > +
> >   /*
> >    * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
> >    * optimisations. However depending on the complexity of the condition
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
