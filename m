Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B25C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 07:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHhYXxf1EgYS8swQMkLtjMg/ZW4a7loj1M2XeslbgoE=; b=LIXhImN3UxzGND
	Fg4c9jTmy9QgBhQ1vO27SP19x+GNtiaAlVyl1881kVPack5EyPicaErbevfVzjUabmihcHMB28khL
	PCOZjflidIdIAdx8PUWZCbg/wmR1IqtvtYvYARnO28LVUx6io4laesL5Mfx4vZptzNciULxYiPDLg
	00WaOO7DsIfRQw4438bwJ5clqOgUuwHtTVMegpfyA72ySgxje+dzEGsDUtKVWFSQoHrmFEeCMNDgR
	LVw/qrlMZ5OpWfwMJncT9TzCbH3SDkF5nbwKcFNh7r84tagzHh45k0KS4+2zU8rf4QV62cpEEdl2l
	uIistIIp4CgnXz1woR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN8Cj-00H5YU-4p; Thu, 24 Feb 2022 07:06:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN8Cg-00H5Xm-1E; Thu, 24 Feb 2022 07:06:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8199B61983;
 Thu, 24 Feb 2022 07:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BB1C340FB;
 Thu, 24 Feb 2022 07:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645686376;
 bh=d3iTCnmjiWI2WfX8T3i0lRHp9N81t6Yh8Z7V7FwGN/U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qRHA5NqUEplN9pIxZqIsW0kBn4+MBilYUh4ACzsMgXUXNRVhSeH8k99rVs+VguAdz
 S6nw5jZeA2U0sfghJtI+av1c041361/u33OVFn034lG4nfre1v86nWYuQmM7joS4ks
 Agm8jI646/XZqBZpm2KUVxpK4cH1m93Yam+wbo2huzzTMAz3INUDtPU8ZxedY0sjkR
 Q0blhmmZF3gCmqsSyWTbjENBVylQ/UtE3IYK+1xeZimaMKGdlOrqKnMJ1W0pixwOSS
 2onkioItET0unfSCYSyvkdtjTxUNN6BpQw2svjAg1a0ZTXaFUQp1iqBJgsEQrsP26v
 H7DkLDPiyrc0w==
Received: by mail-lf1-f42.google.com with SMTP id y24so2305085lfg.1;
 Wed, 23 Feb 2022 23:06:16 -0800 (PST)
X-Gm-Message-State: AOAM533prblXVona+CLe0OehJX6wpYgr3+OFgV1x8qjMO1ZSqN5EKHIj
 3ZYKdzhcxshW09Ujb9BbIL20tA5uQrugdapsYAQ=
X-Google-Smtp-Source: ABdhPJyN7vOmEPkorPTffJc1X7o++TFchfjh5Aum2nyP+tyYB62T97KqiFOhsVfqhaexAyBFN29agtP9qBPfezDsID0=
X-Received: by 2002:adf:a446:0:b0:1ed:c41b:cf13 with SMTP id
 e6-20020adfa446000000b001edc41bcf13mr1075883wra.407.1645686364180; Wed, 23
 Feb 2022 23:06:04 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-8-arnd@kernel.org>
 <c6f461f1-1dd9-aec1-2c85-a3eda478a1be@kernel.org>
In-Reply-To: <c6f461f1-1dd9-aec1-2c85-a3eda478a1be@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 24 Feb 2022 08:05:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a34OBFhncvg32hO3qb1uH8cvwFb0ro1jEMT4bdOLrtfdw@mail.gmail.com>
Message-ID: <CAK8P3a34OBFhncvg32hO3qb1uH8cvwFb0ro1jEMT4bdOLrtfdw@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] nios2: drop access_ok() check from __put_user()
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Rich Felker <dalias@libc.org>, 
 David Miller <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-csky@vger.kernel.org, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_230618_165928_4B0EDAFF 
X-CRM114-Status: GOOD (  15.95  )
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

On Thu, Feb 24, 2022 at 12:30 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
> On 2/16/22 07:13, Arnd Bergmann wrote: From: Arnd Bergmann <arnd@arndb.de>
> >
> > Unlike other architectures, the nios2 version of __put_user() has an
> > extra check for access_ok(), preventing it from being used to implement
> > __put_kernel_nofault().
> >
> > Split up put_user() along the same lines as __get_user()/get_user()
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>

Thanks! Could you also have a look at patch 2 (uaccess: fix nios2 and
microblaze get_user_8)? That one is actually more critical, and should
be backported to stable kernels.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
