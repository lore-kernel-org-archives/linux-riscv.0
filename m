Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49DDC388F7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 11:48:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B252071A
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 11:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KSW6N3Su";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdFcNNsE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B252071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5P+L8/w/UNcs40VKjj60Hn3a2kepqWDSVtx6RzbnrGY=; b=KSW6N3SukWdhszgyAUNMtYlyd
	JCntWq005W9V+m76KWbE3GmaoJd1xPZO4k57ydd7EwQckg2BOz5+pqFAaXc6SY+/BC4oMvrfpECg+
	r2DlXMzxxHu6/AasM/L5z1MS6zlg8zExKEYko0M0EPuWwkWtpDU8UQhcYacj8dag6wwx7iYxYyX27
	fGAJoR8e7yi0+NdAz2NBzmxZ9RbEkcaF1LOe9vmpiCFU1RdpWsnQQO86/7ZHlfBtrF6GYSyfK/Fw7
	QK/UFg6841aOD3cW5QYb4YYra0zLiyrcTqvy+y8oG3v3Dzxk/ablFlzVzOaJ/kN8sk85nbMm9wgW+
	h8o8QtBdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaHHL-0001vj-Ul; Wed, 04 Nov 2020 11:48:39 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaHHI-0001uy-Sv
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 11:48:37 +0000
Received: by mail-pl1-x642.google.com with SMTP id w11so10170901pll.8
 for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2020 03:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7IzbM9m4aaHXdrXJm05MLSazuYENXBo0KE7aGRSwMEM=;
 b=ZdFcNNsEPd+MrYWXHoLvBaTyKHUZhwFwZu3J/PQqzp5Y/s91VRqgtwgRqnPdnsJFzV
 u8ndi/4ac74yeUDpbQr7HXPlEJnbasb7cO8o7gJ5QfnXfnqvT0IrHsEaICKEwxEa70A2
 YXFhqPLDhnbJkNUfiRkcSqJ8rcr7T7iBd7vGmo4WjMykCP58kLBQOzps+/fitCtmG7lx
 rqQXdb82DTVqzyozftIz+18xHfX9wm2lvzWUKmKLYyJ3imRpyuFKCfkdabT8dbUsAWYG
 nv0yauU0g8FHPsO317oAA4Yrr0jRGmrdqn85extqA7+6MeHG+mc31wlEfpFhQQxxW9Z6
 hBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7IzbM9m4aaHXdrXJm05MLSazuYENXBo0KE7aGRSwMEM=;
 b=sWC7GtvEY20xVFXO1DqT0hFq7HzyPe9oTWWk5rBcgC9XW/iPWRpcJ7q0KFOjLubxRN
 +emIW/bH6RCMdHlEh214Hb3BFiHNH5uL6NlgPHGwfHZwDRmOGsB9nxslch/kBMxMN1MO
 R77kx0B9gw5xz6yUtd+j25FQYypLFyIS3JQ4Q6dDJ1Z+zbBs289bBKHqVRdmvBDEFem4
 S32F7QcNitYsR9dW6HbMOgpmY4/QDDuvT5DoN/UlPz9e1zZ8FUZ38aDudk8tJvlM/yYw
 Bg1ClMO5HVm6mCSi2tRzXZazSZjFs8HOLhXiYhKjrsFGINalqYGbQDHUJR2qBUM+0alS
 9XLA==
X-Gm-Message-State: AOAM530KoBape7MncQemkiB4N+6CPSak4MTP2eR+a2eoEwsw3cTcSd7V
 v6/IbT3G6L5V7tRKV2DOUJfp+IB+09e8MklU+eo=
X-Google-Smtp-Source: ABdhPJwhKGHgOtsgYmsX8K8geLNyRT+0OoRlLf1+UEBmK6aJHTGU8p2K0A8JMelevcl7yJOdhQWuD2QnmsGaSXA3des=
X-Received: by 2002:a17:902:d30c:b029:d6:8208:bb1 with SMTP id
 b12-20020a170902d30cb02900d682080bb1mr29348288plc.44.1604490514732; Wed, 04
 Nov 2020 03:48:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604410035.git.yifeifz2@illinois.edu>
 <4ec2970fcc819eb4d5dac2bd35233ccdadfda845.1604410035.git.yifeifz2@illinois.edu>
 <87wnz1to9n.fsf@mpe.ellerman.id.au>
In-Reply-To: <87wnz1to9n.fsf@mpe.ellerman.id.au>
From: YiFei Zhu <zhuyifei1999@gmail.com>
Date: Wed, 4 Nov 2020 05:48:21 -0600
Message-ID: <CABqSeAQ+3sjLXH7GVt_tZrFT_e0nNMm8QgT+FBNQYSOc8viM=A@mail.gmail.com>
Subject: Re: [PATCH seccomp 3/8] powerpc: Enable seccomp architecture tracking
To: Michael Ellerman <mpe@ellerman.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_064836_964871_937FD8C0 
X-CRM114-Status: GOOD (  14.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 Linux Containers <containers@lists.linux-foundation.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 4, 2020 at 4:22 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > +#ifdef __LITTLE_ENDIAN__
>
> As Kees mentioned this should (must?!) match the configured endian.
>
> But I think it would still be better to use the CONFIG symbol, which is
> CONFIG_CPU_LITTLE_ENDIAN.

My attempt here is to be consistent with asm/syscall.h
syscall_get_arch [1]. Would it make sense to change that to
CONFIG_CPU_LITTLE_ENDIAN then?

[1] https://elixir.bootlin.com/linux/latest/source/arch/powerpc/include/asm/syscall.h#L116

> > +# define SECCOMP_ARCH_NATIVE         (AUDIT_ARCH_PPC64 | __SECCOMP_ARCH_LE)
>
> You use __SECCOMP_ARCH_LE there, but previously you only defined
> __SECCOMP_ARCH_LE_BIT.
>
> Is there some magic somewhere that defines __SECCOMP_ARCH_LE based on
> __SECCOMP_ARCH_LE_BIT ?

Oops, my bad here.

> > +# define SECCOMP_ARCH_NATIVE_NR              NR_syscalls
> > +# define SECCOMP_ARCH_NATIVE_NAME    "ppc64"
>
> What's the name used for?

This is used in the last patch in this series to report in procfs the
name of each architecture tracked by the bitmap cache.

> Usually we use "ppc64" for 64-bit big endian and "ppc64le" for 64-bit
> little endian.
>
> And usually we use "ppc" for 32-bit.

Ok.

YiFei Zhu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
