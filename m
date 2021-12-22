Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DA0C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYZCZAaAbxAP3zkka2A7zbSdFw8W52oVolnn5H4SjV8=; b=txApZyN8/kYKvg
	FcRvZFEkuWF/9hAlZqoqtejGY/EXORGzooVBMtSn39EiaDhNA0Y6iZATOk64U5R0bfIndt5faPlnn
	zizIJPQXZfNew2QzUYbWG12WZqqtPRUUvSzyrrwK5/7cjtMXipRdBFhGb5rN6ICdtHl9jWKCqwcxb
	nwS3Jv5DcH+cTINvB3uHgxzTzoujcIVmV2bUNE+IF5OumuQomHHy3+pRwJcUVdggo006YsdxYTBx3
	0n9NZ9pJlv2lIwH5/gPwJ9V4Sz8VQLSPl6tAdF8BImsQa+dSYkjxeXmYiXRqq8lSrjUcfc9u1ZuRi
	jnlxGrh9moYPJJMzpNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzzk9-00A6ms-RS; Wed, 22 Dec 2021 11:25:13 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzzk7-00A6m9-C5
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 11:25:12 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MXGes-1mySWx0E9O-00Yle3 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec
 2021 12:25:09 +0100
Received: by mail-wr1-f53.google.com with SMTP id s1so4265426wrg.1
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 03:25:09 -0800 (PST)
X-Gm-Message-State: AOAM533KLwdMqyt8Hyzlyoy3PTecy5wsQj+ba+1p6ZPUseCJncMFlouf
 2vGWZnRoOt9VGqxUmnZWtNHKgxOj5hW/XnRZaxQ=
X-Google-Smtp-Source: ABdhPJyzTQEUJiZGgYouqu/F3g2sBUQ8LPZJZWS9OtjFPbJzgfkwT3GGQ8ezpmjyngodUiRN0dk6hAlvyjeBwblBf7Y=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr1784540wru.12.1640172308745;
 Wed, 22 Dec 2021 03:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-2-guoren@kernel.org>
 <CAK8P3a1fC8aro3kHLvGMVDdvVYjaQdxJeGur9ac=11+6=r0Xyg@mail.gmail.com>
 <CAJF2gTQciNaXk+_am=kS2uSwg6oGM4aJqiw_O5KN-DrHetf8nA@mail.gmail.com>
In-Reply-To: <CAJF2gTQciNaXk+_am=kS2uSwg6oGM4aJqiw_O5KN-DrHetf8nA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Dec 2021 12:24:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a38C500PhRP3BysRap-ajhU3NJ-KWJQnoGaCH7aV+xoJQ@mail.gmail.com>
Message-ID: <CAK8P3a38C500PhRP3BysRap-ajhU3NJ-KWJQnoGaCH7aV+xoJQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] syscalls: compat: Fix the missing part for
 __SYSCALL_COMPAT
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:nQhxPt5dpQ2nJoL9+G+GMrz3xtv898fDHLaNjvvJtYsIVtNqxih
 pgUZ+XuDr0enWa5sALxyMkCSya2GncWATvYM5iBhEJJQZHBZTcnt7yHn5Q1kGxTe+6CjQc6
 iITaqHGhIrank4fQH3cfUH7UCgPENsKmVZSZVBr5lx+HoChHP5nT8Lfn3LVSSypieIDd671
 DmCVB2nYFB9rcrjPEfifQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UKp4Ix7axfY=:hHftJIjgx7provjK7YUVLE
 g5fnOp/zNJcwxbsTVnEgxDX5HxcFr2iG4AcfQ890Vqd8wXYiIrxm3x267mTt9ROPC1ljKLbax
 h9mPXB5HrcCSCiNymtz9t3U7zJeYtWfeaLX0mZav88aCfCE/VzHSIkrrg3DfgsizzrvOlLRSk
 C7xyi0PTwFgdF6HeFSq5kUzeBcrS5A5jadRsHjyVT6TQGNfRn3PM4p7eFHOKwG1iYFNoc5f0O
 TflJ76tZTeyusMnOeGu3O7ysNL8kXq0bwxzKlYvY7fv66cf7apa265oUDSQkfQveJrS/59Ho7
 Zndjnq+1DVNeezcTC60l2/C8e9eL/TpvIjgoOnSJgykGLBK7tiZpz/jH00QAdX2SccVI4tkJo
 wENcRDiKPU+od+4wAkUCusOF9HSYPIAS/RWdkhzQI31VPqMzX9DRUHBGIzghYqrrJHkTZQKIg
 e+ePt+78scGwnNlH3Lhs5Ay6n5uIC9yrQuXHXMNuNA2nDK4UFHXgAesfLuCQBpxmFPLf7o9Wo
 eqcUUNQfiHIAXQOKzg8U/d7+IxE0RQnrUEkL3vVq9ZL/G84nWJH3LmwiTTVS090bzqWE5Trcs
 hTEWwuBom2Nu8zE2reWQ2lbimwV19dJicuNR0zPnu5f/5EQf/6g66r9GqE1YTbluVtMz0I4VO
 B8E17u2rUjhcnCw5lHp8ADS7eGGNbGyjG+Z7fr9FZM7pzbNK4V4hG8qS+wf7GQiWLqBw8Alu1
 1CDH+mEgsy+x71DmfQ27+0URKO1cj4hVrWIWgWFxqlDWXnqwZxcpyGCttt4YavjgVQW8MVtSQ
 R0zHuL1xbMvZOYd9cmOGRHbXFRYi4J+xsBy54B79EKIaQiEDiQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_032511_748233_D3F23381 
X-CRM114-Status: GOOD (  15.45  )
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

On Wed, Dec 22, 2021 at 12:16 PM Guo Ren <guoren@kernel.org> wrote:
> On Wed, Dec 22, 2021 at 1:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> > >  /* 295 through 402 are unassigned to sync up with generic numbers, don't use */
> > > -#if __BITS_PER_LONG == 32
> > > +#if defined(__SYSCALL_COMPAT) || __BITS_PER_LONG == 32
> > >  #define __NR_clock_gettime64 403
> > >  __SYSCALL(__NR_clock_gettime64, sys_clock_gettime)
> >
> > This part looks wrong, you expose clock_gettime64 to user space this way, both
> > in asm/unistd.h and in the table.
> >
>
> No, we only define __SYSCALL_COMPAT in compat_syscall_table.c. It
> won't be expose to user space, because there is no __SYSCALL_COMPAT.

Ok, it looks good then. It feels like we should have a macro to wrap this, but
in reality what we should actually do is to convert the entire file to the
more modern syscall.tbl format, so let's just stay with your version.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
