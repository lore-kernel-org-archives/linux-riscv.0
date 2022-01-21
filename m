Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EB8C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 07:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8eJHvevV9Uq92Z4dl7hgOs2HJjNpgWtEl9HL2ZzYS7g=; b=HJIT8Auf3TNdmJ
	6RKP2KzPR7h9JKU1D+eNzwT27EL5jrFAhQY4CJ79Vk6lSIXp7kJtMYbVkfJxFi2qxbCyIM/SIwM+2
	gMxcdJvLkILRSJdJj6P2Wi8UpJrJsDqje2Fa9XMnenzpekHBBxq2Zj4GvLKNOSF4vSjdiCkCs/bGK
	XExnTO8BK7qX3AOQJ7hY9eqibscrVNDL7MlXEyM8IdHCOFcixTjK4uvfpBKnPpSBvSULQ2RulvSq8
	OxAOYCjbZem7kPgeW2rfY0UYeha+YXrHmVRHLVlyELt0ELuBrZ46x0HgFd5G8BJkuauKocBwueQy3
	4k+zXf4jiInVC43DP6+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAo6r-00E1oF-8h; Fri, 21 Jan 2022 07:13:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAo6f-00E1mD-B5; Fri, 21 Jan 2022 07:13:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFEEF61778;
 Fri, 21 Jan 2022 07:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E498C340E2;
 Fri, 21 Jan 2022 07:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642749188;
 bh=SYu90Dv3l/L+64SNcy50aiw16Lnx3umbKRTsGOMrQkg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k3uRWzp0SWvrQt4wpv0wp6HqoqMuube0dVeHTED+DvTqJqQ9JteKgAHFuRzMK7La9
 hdnPtmnF2+6oHL0sMYFETK3B/JMjsOW1iHomI2Xxura1sskJ+xnkPbfy35KWaVO1oF
 26rdD0dYwJ3PYFSq+U3dWovrDZcwDzLVyfSAEZDEYRmJINM8Tmg0Ctmu12Rf81s5Ac
 gTKy8KVDZlLocphtUaf3ZDWDQa7DnN48hoqfKvLktVOOCow1KTrdDLQoLL6djNiLnt
 IAwyIbddJ0s5SrRTLwybw+lS0U5xtFSYhGyprgDLn7Xl/Wos5XISZ+lA6JoDVYmrwQ
 LJ4wkPbrGtrCw==
Received: by mail-ua1-f52.google.com with SMTP id w21so15277940uan.7;
 Thu, 20 Jan 2022 23:13:08 -0800 (PST)
X-Gm-Message-State: AOAM531rtbr0goG0o7qou64CSA/nbhmx8UjORt66J9gXUo1aoA0qL9qM
 L1p0BMsIhf2D8BAiXg6lL/ccIq1DnvfCtd4TVq0=
X-Google-Smtp-Source: ABdhPJx6xNJuRVb4aLVlJ7P9bbeDPtJXSmXNRd3kkpQg8PkHlzrym8B0ENWLs0YxpXjFKvxlitpnKg+MIWjsd2Jznqg=
X-Received: by 2002:a67:c89e:: with SMTP id v30mr1186161vsk.2.1642749187280;
 Thu, 20 Jan 2022 23:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-14-guoren@kernel.org>
 <CAK8P3a03-3QTC-vxmnbouK7wBd8iunPGZpX0-Jf6ntS1DY0E=w@mail.gmail.com>
In-Reply-To: <CAK8P3a03-3QTC-vxmnbouK7wBd8iunPGZpX0-Jf6ntS1DY0E=w@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jan 2022 15:12:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRMWj0yVLn2=16Gu1O-6tuqLaxcdduw0YnDK6vrizJEsQ@mail.gmail.com>
Message-ID: <CAJF2gTRMWj0yVLn2=16Gu1O-6tuqLaxcdduw0YnDK6vrizJEsQ@mail.gmail.com>
Subject: Re: [PATCH V3 13/17] riscv: compat: signal: Add rt_frame
 implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_231309_486688_C347CEC8 
X-CRM114-Status: GOOD (  14.05  )
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

On Thu, Jan 20, 2022 at 6:31 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement compat_setup_rt_frame for sigcontext save & restore. The
> > main process is the same with signal, but the rv32 pt_regs' size
> > is different from rv64's, so we needs convert them.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
>
> I hope someone else can properly review this part, it's not my area
> but it looks complex enough that it could bring subtle bugs.
Here are ltp signal test results:

sigaction01                                        PASS       0
sigaction02                                        PASS       0
sigaltstack01                                      PASS       0
sigaltstack02                                      PASS       0
sighold02                                          PASS       0
signal01                                           PASS       0
signal02                                           PASS       0
signal03                                           PASS       0
signal04                                           PASS       0
signal05                                           PASS       0
signal06                                           CONF       32
signalfd01                                         PASS       0
signalfd4_01                                       PASS       0
signalfd4_02                                       PASS       0
sigpending02                                       PASS       0
sigprocmask01                                      PASS       0
sigrelse01                                         PASS       0
sigsuspend01                                       PASS       0
sigtimedwait01                                     PASS       0
sigwait01                                          PASS       0
sigwaitinfo01                                      CONF       32


>
>        Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
