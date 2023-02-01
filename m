Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4FFC636D4
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 19:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHo6Y+V0+Dr+DhpFPrNN3G/Ec0LbstCeuIohS4uc1fs=; b=FQuF8DbwUdOAL+
	Tj6+zuMsSpI/YpYtHeasnuLNKAWPbGGThM2tK6WiMYaEtlzXW85rMQXOOmdVHY4LCsznrWQxqyiyJ
	uo1bP3Zmh9Nmw4iB57dgK1PpnrQOKl5sUFw5ymHy063GlTwOmjghCDCguoqK3fbjXUXyKPT9XajDq
	Uo2DfiPTczqoqo0zRc1vMOOQZtS2dUqkPl9idXb1b+ZveMwMMI6BB7rk58SU5XNsEJHd6q0sExoyV
	UxWx1l4AE8qsUOX29yTPKAk29p+sSzUvcjK5oVqvyWOWo1CYgR3zA+AaAk+Rd7rWdila/GCT6Ihp7
	US5OH70ZdpacLXahAy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJ9K-00DRAj-Nb; Wed, 01 Feb 2023 19:52:06 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJ9H-00DR99-3b
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 19:52:04 +0000
Received: by mail-ej1-x633.google.com with SMTP id k4so49226817eje.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 11:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vLOt8Htpi1Up/DCPSKgd2HVLgjbb3KJvZ9wNHdxeIi0=;
        b=F70AJ99pkUxssTeL0XhQsULJ+i1q3hIfT9mQJxKYXMRcGN/4hPjNKQXfjgd8TBqpBG
         BetUorZ/VTlYCLAfd+XP2RRKW0JVrfaxYcX4T9dpsWXY9GYLSKeTv64OlMI8Kd6WjuJ/
         BWyXoO4myVBwLlBRPvXQouhFGSPXaEWcUSKkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLOt8Htpi1Up/DCPSKgd2HVLgjbb3KJvZ9wNHdxeIi0=;
        b=c4fht/O3sRfWYkdecWrd6DI0ACxCUCtm7i2lSQ4RYokzq5q82LvQBavmPyOB66XD45
         xsH+AhjnqRim89MCj98nnVFPCJjpsYaXn79sNB6PO3yYG/EVqr9W3f5zvgTF3WMa0cnE
         tb1kXTxqOoE7o6jrGOIMvg3RacryeSMASmqcsF1e4mCKFM1Z0Sq2F/Zf5G2yvf5WoY2R
         AvVjh0upf+1adzpPR8q2HA81MRSYsfd2jzvJR9zvAqQyGLs3p5IFBw2on9Dp4i5PFE10
         vKDOwm2mSYD/Wq2VuPzMmGffyyUOidADABKiANBcoO+2sjRtHs35OfPQ0iSKZ8zNApBi
         ezGw==
X-Gm-Message-State: AO0yUKXyfKJk9j4C/onNz6YkBLgaoU/x0whZx7+giZVf73KnldWtX2qY
	PYuKL++nZKfQGACh9O+5dThds+cSlLEpmGx5Gdw=
X-Google-Smtp-Source: AK7set95K/KazyqDOebSB/KmXSPkJuZz0bToU0ENA3UOjn/ZxlUkF5hGgG0WJ2plNhPPVUJU/nPx/g==
X-Received: by 2002:a17:906:2ad4:b0:871:dd2:4af0 with SMTP id m20-20020a1709062ad400b008710dd24af0mr3777101eje.26.1675281113102;
        Wed, 01 Feb 2023 11:51:53 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id my31-20020a1709065a5f00b0088cf92eb0e1sm2377626ejc.150.2023.02.01.11.51.51
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 11:51:51 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id ud5so54717774ejc.4
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 11:51:51 -0800 (PST)
X-Received: by 2002:a17:906:f8d4:b0:878:51a6:ff35 with SMTP id
 lh20-20020a170906f8d400b0087851a6ff35mr995069ejb.43.1675281111261; Wed, 01
 Feb 2023 11:51:51 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV> <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
 <8f60f7d8-3e2f-2a91-c7a3-6a005d36d7d3@gmx.de>
In-Reply-To: <8f60f7d8-3e2f-2a91-c7a3-6a005d36d7d3@gmx.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Feb 2023 11:51:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=whYidrLJSq80s8C0LSui_h9164cxG6WNV1M77Tk_2QFug@mail.gmail.com>
Message-ID: <CAHk-=whYidrLJSq80s8C0LSui_h9164cxG6WNV1M77Tk_2QFug@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To: Helge Deller <deller@gmx.de>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Peter Xu <peterx@redhat.com>, 
	linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, openrisc@lists.librecores.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_115203_169922_CCC5ACE5 
X-CRM114-Status: GOOD (  10.78  )
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

On Wed, Feb 1, 2023 at 12:21 AM Helge Deller <deller@gmx.de> wrote:
>
> AFAICS, the only applications which really care about the return
> code are
> - testsuites like LTP (i.e. the fstat05 testcase)

Those have actually shown issues with various library implementations,
exactly because real system calls act very differently in this area
from library wrappers.

Things like the vdso implementation of gettimeofday() get a SIGSEGV if
the timeval or timezone pointer is invalid, while the "real system
call" version returns -1/EFAULT instead.

And very similar things happen when glibc ends up wrapping system
calls and converting buffers manually. At some point, glibc had a
special 'struct stat' and basically converted the native system call
to it, so you did 'stat()' on something, and it ended up actually
using a private on-stack buffer for the system call, followed by a
"convert that kernel 'struct stat' to the glibc 'struct stat'" phase.
So once again, instead of -1/EFAULT, you'd first have a successful
system call, and then get a SIGSEGV  in glibc.

And as you say, test suites would notice. But no actual normal app
would ever care.

Of course, there's always the abnormal apps. There _are_ the odd cases
that actually catch faults and fix them up, and can then be confused
by changes like that.

It's very very rare, but it happens - things like emulators do tend to
do some really strange things.

         Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
