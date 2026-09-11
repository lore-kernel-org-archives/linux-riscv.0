Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9CDC88E41
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 05:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0Xamlez8Gq8fMJpg9/XzFZHxTtAY2F3+bDATB66px8=; b=unEKhlTQ5kzG1a
	v2dHoynkD4HFNqKaUt9Gc3Y95gT4w4OoFdusuLSbqqEtNxsFE48QBOfb+aLM85grCxUymWDya07h9
	E79X+2B3X4cKf5LAMOgJilmMcSd5FRxL8D3ebzF+Mo7coCIGGRfs+MeE+Y86KScC/5dolzZpFPRl3
	5Ax9Ucf33qB5MKyp9lHfHRvUTJ5/0wKvI6hDAgP0NWYG1G/IMa5wDd6v0q0nF4iJKd20kvcyoxOpS
	9TPlO6UV0NocXC7AYDwlTKESJY9Qz4tT4xAUgacp3s9NIB9L2CcpxbAGyEaSlvUXY3jYCCcxxEZi+
	MmPdxNDC+n/U/liV1MBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tht-0000000Frg8-1tO2;
	Fri, 11 Sep 2026 05:21:49 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4thq-0000000Frfm-0BGn
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 05:21:47 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc4c1210748so436928a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 22:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789104105; x=1789708905; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OvxSaNqswfMI7MoABq1pjZcckfAsFzvKQ+mSQEh+4AM=;
        b=A/9m3B9vsJVdPWEeth10we6zyOhFArkn9DWoZt2w3a1C3TFN7jsRY8bMJrF7WDEdr1
         8L8kyUx7qO2FzTkau0kTF3kwh/xZeJ+hB/Iqa/7f2HTH2wA8J3wz8C6qit5FCAqJWadA
         CbsZhKh8dPDxd2DvJF4sUN0ZAzdcU+7jpt7cDYEF0mVZe6RWgwmwhQVJm0qiNhNnN28/
         67JyRz2V2wKC79vc+nIQKDrgUQCQTwYJORAfI1dcp4lEEKzWfHPRB74Cpies8J4dATAX
         nwh54ZpzlGOnUCU9YytW4VzbD+3qmD2i+lSTPvn4z2/Afsc6l7yz/ctkKNv8z6LObXQq
         hM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789104105; x=1789708905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvxSaNqswfMI7MoABq1pjZcckfAsFzvKQ+mSQEh+4AM=;
        b=jbcVEh+392KeZnjsH+cr+0D1pled/+Ti+wkJg+uH9jvPwEWYOtfA432wMxXDNbZPZD
         y0F5GVeZZ5jbzqsmO060fJsiLdqWiIskHhbomu2VlL68faWEhbpeEYMH4tnFzmEEtvOO
         MW1+FG5neiLNLiSk2egNjWlBMgFDnTZrGsyJfB1S5yPufebis3NHbAQsKSFCG05mSpAB
         e26XTHE/fhxgzF027yL/eKsbuYUFC5JN+4H6oWa8lVX/C36uUKf+g9RnT9OvIPOwQ1dr
         94OT4Jrq3Jee1q++6CkcFCmMGD+w27LIr/kqFc2pnedlswW3zJXoQ39mP5c8bVSVrh8c
         HD9w==
X-Forwarded-Encrypted: i=1; AKwUvBw95rVDvslcD0hibh3mNM+b5xJsYTEKpsxIyap80+qRNkDeLoWRAbSOucRbYkOt1OJENyPgU3CNdWGZXg==@lists.infradead.org
X-Gm-Message-State: AFuF++kpP1oHhRRBoyT2WEQpA8YQthLHyGOaJAslgWupFYj6YHnabbek
	mHhJTwJpkxueEApRr0BArLdXkDNiHxS4kJF27U6XSOZylsUMvNm/31Lk
X-Gm-Gg: AYBFou3r11ZGDl5nHVfpkvHAqkuaB+guy4vlOI4NEOpEP8U5eHwqyPLx7pw8+2ed3Sm
	ChcZ8x/IY57gGMco/z1jfPq1TNboTks7aE/BcRqvQ1cV8v1y+0yhPeP2KVhODeCHHnm+3Anpwf9
	fIknIGjOIF/tVx7iMoZBfyUEIdkQNDiN9eIkw048o7X/Zkf/x/Vfz4QDOshHeZgX/5TCsM4CizO
	HHV9FrNlrbyeO+jMLpDfdRHVYtr44YSOxiR7UX2UEEwtIWZc8QvsUtAyiKfrXlmjgND9PrHBMu3
	unQKgZs9pnCnr6wf2nM8SO2uSIHCQ6gZ4wQ4gEyYB8fYXkh6EQux2cAABD3JutpekuTrlkfCc2a
	x9QhebDlqj3rfap+yAUkVCd1QU+9aerHO/OlTBIVxNa98kQhnlTYcqCf1VD+TM62nkRTpsyRRR0
	MWyqG2OQ+8SJ+lhkIRyp8VKAca4H7CoqIQ3tflVr+yJ2e6HfRr8JYNAHhZpucjzIkOMrfebs/2u
	IRAC8kza8Ax7vveoMDHewaWCQMKQHiypsDi/ffueAAaaw==
X-Received: by 2002:a05:6a21:6f88:b0:3d1:be60:2811 with SMTP id adf61e73a8af0-3daed30037bmr5351249637.15.1789104104920;
        Thu, 10 Sep 2026 22:21:44 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8137fsm3495801c88.9.2026.09.10.22.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:21:44 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:51:32 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: gary@garyguo.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH V3] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqOO6_kXGaaIkCuq@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260910100801.2159785-2-mkchauras@gmail.com>
 <DLBMFNHCKSJ6.1I36FDVEACEUF@garyguo.net>
 <20260910.222417.2048885189565815846.tomo@flapping.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910.222417.2048885189565815846.tomo@flapping.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_222146_115884_AF3CD68A 
X-CRM114-Status: GOOD (  25.84  )
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

On Thu, Sep 10, 2026 at 10:24:17PM +0900, FUJITA Tomonori wrote:
> On Thu, 10 Sep 2026 13:05:27 +0100
> "Gary Guo" <gary@garyguo.net> wrote:
> 
> > On Thu Sep 10, 2026 at 11:08 AM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
> >> The Rust kernel infrastructure generates inline asm for WARN() via
> >> ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> >> preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> >> arch-specific asm template string for use in Rust's core::arch macros.
> >>
> >> powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> >> Rust builds to fail on powerpc with
> >> ```
> >> error: no rules expected `ARCH_WARN_ASM`
> >>    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
> >>     |
> >>   1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
> > 
> > I think we probably want to catch this earlier by have something like
> > 
> > #ifndef ARCH_WARN_ASM
> > #error "ARCH_WARM_ASM is not defined"
> > #endif
> > 
> > in generated_arch_warn_asm.rs.S.
> 
> Good idea.
> 
> One thing needs to be fixed first. arm and loongarch do not define
> ARCH_WARN_ASM. rust/kernel/bug.rs uses bindings::WARN_ON() on those
> architectures, so it never includes generated_arch_warn_asm.rs. But
> rust/Makefile still generates the file for them. With #error, their
> builds would break.
> 
> I think we should add a condition to rust/Makefile to stop generating
> the file for arm and loongarch. Then #error can be unconditional.
> 
> Does that sound reasonable? I can send patches.
> 
Hey,

Sounds fair to me.
> 
> >>  arch/powerpc/include/asm/bug.h | 36 +++++++++++++++++++---------------
> >>  1 file changed, 20 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> >> index 0db48977c70c..df2183c35945 100644
> >> --- a/arch/powerpc/include/asm/bug.h
> >> +++ b/arch/powerpc/include/asm/bug.h
> >> @@ -32,34 +32,38 @@
> >>  #endif /* verbose */
> >>  
> >>  #else /* !__ASSEMBLER__ */
> >> -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> >> -   sizeof(struct bug_entry), respectively */
> >>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> >> -#define _EMIT_BUG_ENTRY				\
> >> -	".section __bug_table,\"aw\"\n"		\
> >> -	"2:	.4byte 1b - .\n"		\
> >> -	"	.4byte %0 - .\n"		\
> >> -	"	.short %1, %2\n"		\
> >> -	".org 2b+%3\n"				\
> >> -	".previous\n"
> >> +#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
> >> +	".section __bug_table,\"aw\"\n"			\
> >> +	"2:	.4byte " label "b - .\n"		\
> > 
> > "b" is part of the label. "1b" itself is a label and "1" is just an integer.
> > 
> > If the code uses
> > 
> >     _EMIT_BUG_ENTRY(..)
> >     "1: ..."
> > 
> > then the correct label would be "1f".
> 
> Agreed.
> 
> I think keeping the label fixed, as v2 did, would be fine too. x86,
> arm64 and riscv all hardcode it. A comment that says the caller must
> put the trap at 1: might be enough.
> 
Enforcing the label would be a better idea so that we can avoid
mistakes. I'll fix these and send out a new one.

Regards,
Mukesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
