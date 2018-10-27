Return-Path: <SRS0=itc2=NH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F538ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 06:07:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631812085B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Oct 2018 06:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PvafvY6W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BOuWSG/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 631812085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0DNND35NrUU62ShzaWQ+jIRDpXrI/QRIelocILHlgfM=; b=PvafvY6WZ8SN/6FkrxN47tea3
	zoKmq76QtrJbIes29jldwqX/dqIDE863xlbjSexSN3ctu6fVAT1No2EdBxG97idt7wrkILLArN2X3
	UhYHFkLTQTyV4h3Lyn3ErkZpAzBa/NSl7EGT6Bu6teugnwCBLgvU8uvLXJot5pHjC6+rRZnHN7ahh
	MscbcvFUrKGah7etB6cTJZMl1g+RWxMh0ViJerddFsjOIoT6zwAOAily0mW+5BLWua0xXjM8S6t3l
	HL0tip1GW77nR/KXkBOGO/5QreKVI906SSaf2dwBEwVnP10tWbv50XekT+ljv2qjCWF1mj4uFxkTX
	szmHv3J7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gGHl2-0005jq-Kh; Sat, 27 Oct 2018 06:07:36 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGHky-0005gU-TV
 for linux-riscv@lists.infradead.org; Sat, 27 Oct 2018 06:07:35 +0000
Received: by mail-pl1-x643.google.com with SMTP id b9-v6so1433712pls.7
 for <linux-riscv@lists.infradead.org>; Fri, 26 Oct 2018 23:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4MgGyHpaFljNUU/NS+lIwkQShtcjMjXMnCBswOpfcyA=;
 b=BOuWSG/bJyfqcClS6UEIDrOy0bZ7Go4PKrerBjvaIyECq0wv7GW3AnTOvTp4dk+081
 GvIm0h09dRsBsnjJhx/ejMwSJPVTS1D4dcUxmM4cIYHfyEKzO9+ZoWDqkbLC/i/n6cxG
 0f+sUBXkErdo8K9tDyTyozaS6gt+Sc60fY/klpyrB0StMFxiasfPXSKYv2zim1bmKZCE
 A0fNxaFdoV3v+UJacQzgufaJ3b23+mMI48H9WO6iHfZWzg+jARN/e/WGDG7f4D4IbzJD
 UT7aOc5i136a/67pHqlEvKNrFHpY9VDYs4ubMzzY3g06fxFvyzKgh14k5dUAdKDEQvQn
 /Tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4MgGyHpaFljNUU/NS+lIwkQShtcjMjXMnCBswOpfcyA=;
 b=l+4M35xVohLNu1FHKjUr0+YuIQeIBMC/C+dBpZYqQj4QYfCoG1FX5C8DC0hF+c0ugS
 188raUKiRkT8e9pFBV5b3JwNKIV1fdMpFtXSnl8hQUHkuQwbG7W912+m2jzUkG68pp23
 EZJubF3aFlGc+9E4yLhtYfzh195nHxNkAgmD/mQw2Qdb+95shcxuMre+KsgzQgp3hTop
 c417psoKHng40R4vZK6fh6qd3DExekh6hPu4ro8DchkyfXURJmHhRDLsne5aQjXXC7lJ
 s+nHbkeqOEzMsByn2efOJ0WhrB8Wp9uG0DJo81IaDhUP299LbVPp6sduPN0cStefgvxs
 rU4g==
X-Gm-Message-State: AGRZ1gKCKUoe9n+X+RprwK2G+XkfT3JnE3AUM1uAyOQAGhGgSJQSjg5j
 EwCIYD4hhb89KN7uJWyNelYMKw==
X-Google-Smtp-Source: AJdET5fQ+cjgrmKRWKK5AJZeON3QZshDMwNsZ57mE66nZhv8tR27WOvlvam+15+pDGF1MMCQDCE8ag==
X-Received: by 2002:a17:902:a584:: with SMTP id
 az4-v6mr4124547plb.46.1540620442018; 
 Fri, 26 Oct 2018 23:07:22 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id m12-v6sm7313307pgd.81.2018.10.26.23.07.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Oct 2018 23:07:20 -0700 (PDT)
Date: Fri, 26 Oct 2018 23:07:20 -0700 (PDT)
X-Google-Original-Date: Fri, 26 Oct 2018 23:00:34 PDT (-0700)
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
In-Reply-To: <CALCETrUSvugnh1JiLgn49c4_dw6F8bXiO52jdqiAKEn-CgzoXA@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: luto@amacapital.net
Message-ID: <mhng-d334eb95-7c80-4070-a053-d04e9b564b74@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181026_230732_970964_213AA851 
X-CRM114-Status: GOOD (  19.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: kstewart@linuxfoundation.org, aou@eecs.berkeley.edu, wad@chromium.org,
 keescook@chromium.org, Greg KH <gregkh@linuxfoundation.org>,
 Wesley Terpstra <wesley@sifive.com>, david.abdurachmanov@gmail.com,
 linux-kernel@vger.kernel.org, eparis@redhat.com, dhowells@redhat.com,
 linux-audit@redhat.com, pombredanne@nexb.com, linux-riscv@lists.infradead.org,
 tglx@linutronix.de, paul@paul-moore.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181027060720.H8KcZxd6KCBPdo6A7yNNvc4juwBn6ByUon2Sw0e1hZk@z>

On Thu, 25 Oct 2018 14:02:20 PDT (-0700), luto@amacapital.net wrote:
> On Wed, Oct 24, 2018 at 2:42 PM Kees Cook <keescook@chromium.org> wrote:
>>
>> On Wed, Oct 24, 2018 at 1:40 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
>> > From: "Wesley W. Terpstra" <wesley@sifive.com>
>> >
>> > This is a fairly straight-forward implementation of seccomp for RISC-V
>> > systems.
>> >
>> > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
>> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> > ---
>> >  arch/riscv/Kconfig                   | 18 ++++++++++++++++++
>> >  arch/riscv/include/asm/seccomp.h     | 10 ++++++++++
>> >  arch/riscv/include/asm/syscall.h     |  6 ++++++
>> >  arch/riscv/include/asm/thread_info.h |  1 +
>> >  include/uapi/linux/audit.h           |  1 +
>> >  5 files changed, 36 insertions(+)
>> >  create mode 100644 arch/riscv/include/asm/seccomp.h
>> >
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index a344980287a5..28abe47602a1 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -28,6 +28,7 @@ config RISCV
>> >         select GENERIC_STRNLEN_USER
>> >         select GENERIC_SMP_IDLE_THREAD
>> >         select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
>> > +       select HAVE_ARCH_SECCOMP_FILTER
>>
>> I think this patch is missing most of the actual seccomp glue?
>>
>> config HAVE_ARCH_SECCOMP_FILTER
>>         bool
>>         help
>>           An arch should select this symbol if it provides all of these things:
>>           - syscall_get_arch()
>>           - syscall_get_arguments()
>>           - syscall_rollback()
>>           - syscall_set_return_value()
>>           - SIGSYS siginfo_t support
>>           - secure_computing is called from a ptrace_event()-safe context
>>           - secure_computing return value is checked and a return value of -1
>>             results in the system call being skipped immediately.
>>           - seccomp syscall wired up
>>
>> I only see syscall_get_arch(). Nothing is using TIF_SECCOMP (I'd
>> expect a masked check in entry.S -- it seems like tracepoints are
>> getting missed too? I see it handled in ptrace.c but not checked in
>> entry.S?) There's no checking for seccomp in ptrace.c, etc.
>
> Hi RISC-V people:
>
> I strongly, strongly suggest that you rewrite your asm to work the way
> that x86's does: have a function called prepare_exit_to_usermode() and
> make it work more or less like x86's.  Doing all the exit work in asm
> like you are is just setting you up for a world of pain.

OK, thanks for the suggestion.  Next time we have to change it I'll try to take 
a look and figure out something sane.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
