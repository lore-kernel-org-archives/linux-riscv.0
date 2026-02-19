Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB363E9A02C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Feb 2026 01:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DT78BfJSu1ThPN1wbGQXHLqDE3cwhfydLu0d0o8ctcU=; b=bwhMkpfaC1I9IAHcWhQV1E/Pqr
	08q4TLu/dq5f+MYH5ad+3NQDO74dbFKOwTdAxgLmsy1f/JL9EjgZGNwqjd4+Bt2Xtn16IfUNi01cc
	KR/ItYr7U0KAzz6yD8PZrLnmwaiIKMrRmTrSr5WjokMEGVjpxI2Nl/6tPi/Vp2jb6ds7DAauWdNWH
	5EaNT/u5a3MJQuBligHc87K2RJJ+mIrIZPwpSrC7rpD2P8xdtZNh7Cg82aWVv4F+rpSsn1aLj1jpD
	GKKQbHGP3NtP/6s6F2FW360Eet2O5e2hZLew2nqkn/DeYavdqIzQfGJm7yTfZ4PR+wKjUBsBygkl2
	7qOHOHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstId-0000000AikW-0AAx;
	Thu, 19 Feb 2026 01:57:51 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstIa-0000000Aik8-0s58
	for linux-riscv@lists.infradead.org;
	Thu, 19 Feb 2026 01:57:49 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2ba68df3687so274676eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Feb 2026 17:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1771466267; x=1772071067; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DIxbBlPbP8TJgRno8AcCVRuKne7rBLgcVpvlMJ31i4Q=;
        b=U1p/jv5u/f3W9Kj3v4tU6mVG5V/gdHOvIZUBlAAF7eVGny53sX5Gu9WYNJ1+J/gcM1
         GLGwQiC8fNNWX10ObsxtYWJFK95t5iXkde4QGG7jW4mK3/XAmqb/x1iHZalSInQStfO+
         kx7YmbKUNgjtPi34ZbW19f+0xskxqzsVcNpMcykziFtleoJVTQ2HFUEALTPA3CC1Bt3j
         suJ5LCUuS0xVWl5JkUkvrif7sN7ye0z4RKuwrJPEQ+OhIOtXj0aU6LwdI2QemwHmG9K2
         +kvqSA3Km1wnwXG4uSy5UqxRrNNCM1e2Mig0RCBVy/UYCVdv1l+c6WZXT4/viB8DyXsb
         aGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771466267; x=1772071067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DIxbBlPbP8TJgRno8AcCVRuKne7rBLgcVpvlMJ31i4Q=;
        b=JYa8rxR5tWZOwMzBpS//s9ROhb4JO6+f9jeFCh91fXg2mNqX7jLghKHCMdcWAAvsFV
         NOq+6+cuzpSlKVTmHzWGuqMVlZeMiuduGJ1fpIU1OydztXeVzNvaRp8wYr4xd2rfWAuG
         EGaFLxwi30AR7neSTlnWfhSwR0zwpqRWuaIxsT3nFiuH1XYeXH+PDUViikf+AvSLhb9j
         iOumlpBI9j42t9vWyzopzKxXEXsLXyuMeOSlf9eU50ww/tIsadJNqYXv90VAXMdrMpCf
         K5kFnlniWhU4mVGf1mrYi6wkrh9vDQ4unLMzE1uTqhJZXFu6zTUFkiruZlv0tF3FGy5N
         Q7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUmn0YoNpQeuJHDhqQh6ZNV8sDsfTdQ7dA/QN0eO1ytNczCCQp7wPqBEoaBsBY0KWEoEkqNMeytXjZnzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YynIMlNioZLtH+JwHFQ8Sll6s9I75tvuogUPFDgYd1TvyeIsOxS
	ULslHuhF2dTI4P1XLanpTN1BXWIXuLOimdpTZVOj6FYxnAfIm/leI9vuQh+QV/JLxwI=
X-Gm-Gg: AZuq6aLw7Ox2B+hy94v1G10QbJ8IZg+K7P8jirtEX+lpBk+B1Rm6qmumUby8DEF+tUG
	/dA3V4/aTnZCNNESOd93vpWpSSJma+Z0I763lKManxlCdwb819Q82/cOB1NsIrLeqq0DO+wtLjL
	uXQgMs1IJtu0X0sgj7nDeSSZZusQ6US50dn7lsVUDY9Z7HHnU//hi8ep774l1mNKujX9kf/AaO3
	OjShQuCMSGJ+3KzztBR/9QjNP/rU51Qrv0xjZJTGLek9sayvnQbHxA7zxr4P0NY+wskz5NEIg8w
	AaKXFr1oj7YdiBLPomgx4onJXK5/92pNEGTTAJCmHrWEdM0HX9jokvGrLJsvS6HnKmUPsA4bdcy
	qOJeCOGgnAJDkrs5lDkQv2D4CjzrnH+/aNuQzM0hUL5vQknbgb/dy7OxguT6bK7d9TCvgItcvpz
	mZI5AMesuK/3tpLMSPKl/f3o/dxBESATPZ
X-Received: by 2002:a05:7022:1609:b0:127:3480:7c9f with SMTP id a92af1059eb24-12741b6364emr7860691c88.10.1771466267033;
        Wed, 18 Feb 2026 17:57:47 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cba192sm19547183c88.13.2026.02.18.17.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 17:57:46 -0800 (PST)
Date: Wed, 18 Feb 2026 17:57:45 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"Yu, Yu-cheng" <yu-cheng.yu@intel.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"zong.li@sifive.com" <zong.li@sifive.com>
Subject: Re: [GIT PULL] RISC-V updates for v7.0
Message-ID: <aZZuGYQUy11Gse7x@debug.ba.rivosinc.com>
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
 <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
 <b2aae256-7d3c-447d-aa8b-5904848cff6a@sirena.org.uk>
 <CAHk-=whfQXKr3Sgoc7R1tPWFD3A1gEhUh=j7GGwz8yg_EQVhNA@mail.gmail.com>
 <aZYZsBlH_tVxnZIf@debug.ba.rivosinc.com>
 <196537b2933567d1781901f813a72ffffedd10fd.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <196537b2933567d1781901f813a72ffffedd10fd.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_175748_260304_F6C931A9 
X-CRM114-Status: GOOD (  27.95  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Rick,

Comments inline.

On Wed, Feb 18, 2026 at 09:58:41PM +0000, Edgecombe, Rick P wrote:
>On Wed, 2026-02-18 at 11:57 -0800, Deepak Gupta wrote:
>> Later in 2022 when I started doing work for cfi extensions on RISC-V, I =
started
>> with arch-agnostic prctl for enabling shadow stack and branch tracking. =
I was
>> hoping that all arches would end up converging on that. Soon Mark Brown =
sent
>> out arm's "Guarded Control Stack" (aka shadow stack) which used the
>> arch-agnostic shadow stack prctl.
>>
>> So today we have
>> - arch specific shadow stack prctl for managing (enable/lock/disable) sh=
adow
>> =A0=A0 stack on x86
>>
>> - arch-agnostic prctl for shadow stack management on arm64 and RISC-V
>>
>>
>> If we land arch-agnostic prctl for enabling branch tracking for userspac=
e as
>> part of risc-v patches, I am hoping we can leverage that for x86 "branch
>> tracking enabling" as well. I don't know if "BTI" is enabled for userspa=
ce in
>> the arm64 world but if it isn't then it can use the same prctl. This cre=
ates
>> symmetry and convergence as well between major 3 arches for branch track=
ing
>> support.
>
>Arm already uses PROT_BTI to enable their landing pad like thing. It doesn=
't
>need a prctl AFAIU. Peterz had been suggesting we do a similar PROT for x8=
6 user
>IBT. Although an additional prctl might still be required for x86. We'd ha=
ve to
>actually start taking the patches upstream to see.

x86 doesn't have any equivalent BTI bit in PTEs to mark code pages. IIRC, it
does have mechanism where a bitmap has to be prepared and each entry in bit=
map
encodes whether a page is legacy code page (without `endbr64`) or a modern =
code
page (with `endbr64`). And CPU will consult this bitmap to suppress the fau=
lt.

As of today almost all distros and packages are shipping with
`-fcf-protection=3Dfull` compile flag and that means all userspace binaries=
 should
have `endbr64` compiled in (i.e. modern binaries).

To be very specific, anyone using beyond 7.0 kernel (that's where x86 `endb=
r64`
enabling support will land) is most likely running latest userspace on it. =
Anyone
who is running old userspace anyways is so behind that its likely plagued w=
ith
vulnerabilities that an effort to enable cfi on it may be futile.

So if x86 were to follow arm model and use it's legacy interworking bitmap =
to
support mix of old (without `endbr64`) and new binaries in task's address s=
pace,
I see following problems:

- It'll need support in kernel to prepare and manage readonly bitmap in tas=
k's
   address space. Along with code in kernel to support updating bitmap on
   `dlopen` happening in userspace.

- Every indirect call to a legacy binary will lead to an additional load on
   legacy interworking bitmap virt memory and thus will lead to perf issues=
. So
   even in the case when someone has mix of old and new binaries, they most
   likely won't enable it. Or try to make sure that they have all binaries =
in
   task's address space with `endbr64` support.

- As of today no one is using legacy interworking bitmap part of Intel CET.=
 And
   I am also not sure how much of this hardware feature has been verified. =
So
   likely, you may run into issues and errata first.

This is a lot of throwaway work to support a usecase which likely doesn't e=
xist
because most distros anyway compile binaries with `endbr64` and even if suc=
h a
use case exist, its perf characteristics will suck quite bad and security
guarantees are also poor (worst of both world).

So my suggestion would be to keep it like shadow stack:

Loader takes a decision whether to enable forward cfi for current task or n=
ot
(like it is done for shadow stack)

Hopefully Intel will deprecate legacy interworking part of Intel CET in fut=
ure
generation(s) and simplify it.

>
>>
>> Furthermore, Control-flow integrity is shadow stack (for backward cfi) a=
nd
>> branch tracking (for forward cfi) both. It'll look odd and ugly (to an e=
xtent
>> it already is because x86 and arm64/riscv use different prctls for shstk=
) that
>> shadow stack has its own prctl and we invent new cfi prctl just for bran=
ch
>> tracking.
>>
>> Ideally, it would have been nicer if we had
>> `PR_GET/SET_TASK_EXPLOIT_MITIGATIONS` and sub-codes under them to enable=
 all
>> sort of things like "Manage CFI", "Manage memory tagging", "Manage specu=
lation
>> control", etc. But things evolved on their own pace at different timelin=
es.
>
>During shadow stack/lam enabling we tried to create a generic x86 interfac=
e for
>"per-thread features" with the idea that IBT would also go in there. Howev=
er,
>tglx made a bunch of points[0] against trying to do a universal thing.
>
>After that attempt we kind of gave up and just let them be specific. Altho=
ugh,
>it was not appreciated at the time that arm and riscv shadow stack would b=
e so
>similar.
>
>I don't think we should have a generic "CFI" control though, because there=
 are
>other very different forms of backward edge CFI like PAC.
>
>[0] https://lore.kernel.org/lkml/87zgjjqico.ffs@tglx/
>
>>
>> Given that we already have a fragmentation in prctl space, I propose we =
go for
>> arch-agnostic branch tracking prctl and let other ISAs implement support=
 as
>> they go about it.
>
>I think the situation for forward edge isn't the same as shadow stack, whe=
re the
>features matched so well. At least for ARM. My best guess is that x86 could
>possibly use it if/when we get to user IBT. But best guess, would have a P=
ROT
>involved too. So that could be different semantics. Sorry, I never looked =
at
>your forward edge patches. I think you don't have a PROT, right?
>
>>
>> If you agree, I'll let Paul choose the right name for it (given that ind=
ir_lp
>> isn't a favorite)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
