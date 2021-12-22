Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F05C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nWu/wyrANHrf5DEicYT6Emg5WAWE5iX9iY5FmmONb4=; b=BLT6EaISTcFFuo
	Pyj0aX/RDHUDSBi3O2RJlwtEs5aWtAYkdCLntgeuNjlKzJINeRD6hx7CqQKSZYEr313oXuVpLlX6r
	C7ZNlwKalqQZBczRleZCITiXftLHu49W1xpCKBFWRADoiCUxx2dq5/6bso6+crq/k/wwwZLFShjnK
	gFC7DkWF1OOjjEcFkaV3KmicLqc8yYJvAxTAWfVibqQrCu6M6YH8RdJ84OkbKk+qWfZgNOxa8IkqR
	S5vo5OaIYIWkY7++Hbasjj1nCkNASJuwVxjbYCo00REC0mguJZvv7nmz8IyvQ6Uh/H7T3nroD0Wlr
	47HqLb+jSWdjeXdqjxnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n00Oo-00AET3-24; Wed, 22 Dec 2021 12:07:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n00Oi-00AERU-Ld
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 12:07:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37B85619E4
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 12:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2DAC36AEB
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 12:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640174827;
 bh=+wqXN0WBIIDqmYLgad4enZJ2Q7SP/1omJsy3ZSi/9sQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FgJBC2cmzC9ZDUPKM6OeTvPlm0kpzUupY5nnoF0GpYUQXfS3Aj0YPjqxHrKtExyhR
 Kv3JoqgSULLvap/lDwP/Cbt8P6hB6dmJBD0x5I4PFJUUVlfmSksd6FNRRlxQw90wsZ
 bO9Kf5f/3fraeTe4698bzDeG28PRNet9rdyINQAQFzUN/P5L0XO8wjIXAZB9m8f/Sy
 DAG9Vxy1fg5xIT8iODXBDoIfFd2MVRlOt3pSUGixzUAu/hpzHKTozKUeTD0Cnp5Jrj
 ktKcQC4HBaPk3xdXFPBECnw2bQb2Cb0p8Vcdff/7fnt9643HExwc8iW/9ITp9eCMhI
 64UBiTMWNQidQ==
Received: by mail-ua1-f49.google.com with SMTP id p37so3722381uae.8
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 04:07:07 -0800 (PST)
X-Gm-Message-State: AOAM530jS1RA/Z2a+I7Af4YCkO6x6a7Na2978hJna5tXAYpm3Z0GEOgy
 elx9fgBvKft+S5v9e+Xc9Uv6ZzlJblzoRRtdt+U=
X-Google-Smtp-Source: ABdhPJxGX4KrZs2TnGR1gSjUu92pDva4Xdm8isb3ATByYY/kfaTFVcqSn5kqos02FM+dXr9lRhbSDFcRUucnDxIKpsQ=
X-Received: by 2002:a67:e244:: with SMTP id w4mr788901vse.51.1640174826756;
 Wed, 22 Dec 2021 04:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-9-guoren@kernel.org>
 <CAK8P3a0-ZOwoC_Ft+TiKAXdETcqU5XPS+9DZGkA+bB73SNCCbQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0-ZOwoC_Ft+TiKAXdETcqU5XPS+9DZGkA+bB73SNCCbQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Dec 2021 20:06:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ=Yo98-S12D9CbVXPJsAKpLu1NhJAVB3yu+J9thz6CUg@mail.gmail.com>
Message-ID: <CAJF2gTQ=Yo98-S12D9CbVXPJsAKpLu1NhJAVB3yu+J9thz6CUg@mail.gmail.com>
Subject: Re: [PATCH 08/13] riscv: compat: Add COMPAT Kbuild skeletal support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_040708_768684_DAAAB567 
X-CRM114-Status: GOOD (  17.62  )
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

On Wed, Dec 22, 2021 at 2:23 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> > +
> > +config SYSVIPC_COMPAT
> > +       def_bool y
> > +       depends on COMPAT && SYSVIPC
>
> Can this be moved to init/Kconfig next to SYSVIPC?

I would try another patchset, to see other architecture guys' advice.

$ grep SYSVIPC_COMPAT arch -r
arch/x86/Kconfig:config SYSVIPC_COMPAT
arch/parisc/Kconfig:config SYSVIPC_COMPAT
arch/powerpc/Kconfig:config SYSVIPC_COMPAT
arch/arm64/Kconfig:config SYSVIPC_COMPAT
arch/riscv/Kconfig:config SYSVIPC_COMPAT
arch/s390/Kconfig:config SYSVIPC_COMPAT
arch/mips/Kconfig:config SYSVIPC_COMPAT
arch/mips/Kconfig:      select SYSVIPC_COMPAT if SYSVIPC
arch/mips/Kconfig:      select SYSVIPC_COMPAT if SYSVIPC
arch/sparc/Kconfig:config SYSVIPC_COMPAT

>
> > +
> > +COMPAT_SYSCALL_DEFINE0(rt_sigreturn)
> > +{
> > +       return 0;
> > +}
>
> This confused me a bit while reviewing, would it make sense to reorder the
> patches to add the three missing functions first instead of adding the
> dummy and then replacing it?
Okay, I would try in the next version. Make the compile at last.

>
>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
