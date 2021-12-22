Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5483C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hw0rPg3NePgNeWB0ZocWYBmMV40phqTShB0Pb8z2BRI=; b=t7XVo8wJhoLZgO
	puHJ7eHGpdEku5LkXKYnRVrKxX7bqnAZM933SjNdAobuPtpKnPXEhN+hmKGIw/VTsGs/4/XsWfVYN
	xbdsFvk+K3/3lFq1sABEgZ0gdE5o8W7j+88ZNWpolKfx5bXeSArdhbLXuFxnc1+WOO1hoAaSMq3Nd
	5bzJFJqS/U2WLubh3BQVNqqDzibMvJuFQ3OfZQX+ngvMGExQ0cec9xzQtAbTgWCoet4RyJAs7tSsj
	d+szr6/TZWdhFuCB+YT3nWsd+6/RjyEwOGr4iaT4P32jtUAbDKBEsBtIeNYAC3rFBgvuwgA3WkoPb
	LCODls2ibM0JfOBJGKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n02YE-00AfqE-Lh; Wed, 22 Dec 2021 14:25:06 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n02Xz-00Afl3-R3
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 14:24:54 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MDykM-1n9tu11ECC-009zr0 for <linux-riscv@lists.infradead.org>; Wed, 22
 Dec 2021 15:24:49 +0100
Received: by mail-lf1-f54.google.com with SMTP id u13so5699721lff.12
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 06:24:49 -0800 (PST)
X-Gm-Message-State: AOAM532TUi7ucCADLjuXmtpdvSAnVkVjxe+8/Czd6GWMZecQPnZxkjgd
 ynLpi06rhwQVvygVSYp0Iw43QoZA6w0WT8nBqzQ=
X-Google-Smtp-Source: ABdhPJzZqUV3m/4gBi9PAOChOgb2RpOg4jQAP0/DgyHh+MJob01VsDYVK0s1Stco5K8zA3yLynfQmmGKPYOk7XFmlEE=
X-Received: by 2002:adf:a352:: with SMTP id d18mr2189656wrb.317.1640181632663; 
 Wed, 22 Dec 2021 06:00:32 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-6-guoren@kernel.org>
 <CAK8P3a2XOVYB1Fm5TBdjtKx9DXoG93Zrw7TiquYL_Zy916dLwQ@mail.gmail.com>
 <CAJF2gTR2fAU=+0fvW_VCqaZfDkSTAxQ=cKE9iAYOoGORb3m+4g@mail.gmail.com>
 <CAK8P3a17A3MU_atWNEretDcr5sLRc7540tM4vfc=H4M8qVCDEg@mail.gmail.com>
In-Reply-To: <CAK8P3a17A3MU_atWNEretDcr5sLRc7540tM4vfc=H4M8qVCDEg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Dec 2021 15:00:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2b0zun=b84d=LhrjrwLDiKh5_KgyZbBAjTz+40NZri=A@mail.gmail.com>
Message-ID: <CAK8P3a2b0zun=b84d=LhrjrwLDiKh5_KgyZbBAjTz+40NZri=A@mail.gmail.com>
Subject: Re: [PATCH 05/13] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Anup Patel <anup.patel@wdc.com>, gregkh <gregkh@linuxfoundation.org>, 
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>, 
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:u2L7LA/rjkymQYZhcqKmY5oK03Ijv2lmnqfcM6DUEkEa+85Bmf9
 tydRIlUmtl7EqxRiT8sMwuzjUldzNKhZM/HHL+8sWMDYda9Sdozu96kH0xyIlTUdiDb6axl
 yG/WZQC7rBPKoh96PNQLNEut6JLhiE9RG/zk7/3nU90A+0W2HUR7vlKIo68fO5A2GTCo2zx
 JYsLQZ+JP1kLWFg/lnyuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nFED3Qn/+18=:BmP/sOn3p/Qd1mZTfbFpdP
 a/KDlxqgiSvBruRzdX/sF9I+bickVOmFF8rhFHh9efDGoOUmrtu7Ck33mjQf7btSoDcjLjFvF
 dGehLHTz0qKMQ7yZVn4BkmgxajBG6TReDIsEVY61r76f0wJGk/wBJZcfp0XtB/mgCVLGg2kBJ
 ySCFqZ9FOy7iFjxVTAiCTVjDeSnQsE+9Wp29kfSluOjiRkT9FhYCs03ccBHg30nc1GrTGgKFt
 UuU0jCpi12nlsbdX2gVTZSEepksXOryb3LwaZR2cjMYDGzTMnWGka4yXCsH9jSjg83TNBU2qG
 NquHoFY7XiHo3SSR7qarbZkwtYFs+wRLqNMRIQ8Mz4lKnLKUcOIzImE+vl8GDn1wpCRAhdr6M
 bPKX9IuMouA5h4T+jlc6uGutAJZnziW5hoMoiPohPXfWuKjFaT4LF3MPSAPrQBVvVYaLUqXc2
 YaAceLu1dTi9o0SlDZZE+gbF0d9gqhRHdTe060zcRcHFK3TIYeSUdRZETDw9v9064g1XDEany
 htxynZrPPrNLAl97suwm4+Zm87wOJm9ZdpeHVtwCcRNneW/NHKoZN/0sHhzp0h37Jhbq13IaS
 B4D+GLYN36Uj8ETK9amDYVMRCJ6ec+4Un40O0vO92N9P4tookHf2ZsT/Ixnz/akidn6paF72u
 6/c9jqs1B5sp4WGegqcQnaffR2lzgx0aAj8BXx3pkODC0I1ZmsRRj1OwjoGDDr+Fyp8epzaNu
 2Zb6rxZ58cxSOpJHGLe69zFWsakuiQdZedKVgtiqcXUGG/f9s/z3lC6YRRwrNoMVGHgwt/SSO
 4BWXyghVGOqNuHlbmLbr21iTEgK+B+5YoHtVbhDdFMVzfnTdQI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_062452_198843_009C4FC5 
X-CRM114-Status: GOOD (  14.12  )
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

On Wed, Dec 22, 2021 at 2:21 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Dec 22, 2021 at 1:43 PM Guo Ren <guoren@kernel.org> wrote:
>
> Right, I think the patch would be a nice cleanup, but it appears that
> riscv is among the few architectures that have defined their own
> nonstandard mmap2() syscall after all, despite using the standard
> name for the entry point. Not sure how this slipped past my original
> review, but it certainly can't be changed now.

No, I misread, the calling conventions are fine after all, it's
just written in a rather odd way.

> Maybe leave it there and change the #ifdef to build mmap2 for both
> native rv32 and compat mode.

This bit still applies though, I don't think you need to add another
helper, just use the one that is already there.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
