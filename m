Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F67C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 02:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTMwCAvQRgU1LydogOJs99YLsfGAu0p9FXSAGGA3a/o=; b=ehGwwQU7RPkCcp
	qqx3CJUT5a7SB3nVN75dsH2WejX2+GIONZfzh7G6Q8mR2lz4Nke1etoS0t+dAo3zBoWuqB7zGbT1a
	StS9iJa7+5dSwkz8yePe2yzw7wbs7VJMuKe1lFxDAnX6CoUGVpv7rtGj33L7hTi1mPKGN/bo/OvP8
	Qa5tKkZaq+sLaR8DX6/gu/DfKR3bsv0cvqlixZUCIJSpOKt+cH54oVwxskO2aCmfkrd6+3CT/oFNt
	Y3aasGfWyLnp7KeVanoLiERIXln4HJ47IpgQHfAKVmrwZQ1VSbRn4dc584YZyoD9lOB4IhsqFHFLw
	WDzZHaAybFlIVTJQzD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7793-00EKA6-Rs; Tue, 11 Jan 2022 02:44:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n778q-00EK6A-QV; Tue, 11 Jan 2022 02:44:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49571B8182F;
 Tue, 11 Jan 2022 02:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8ACC36AFA;
 Tue, 11 Jan 2022 02:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641869045;
 bh=ZU/rHB8FnpSXUsKne+pbLzZ+noAo0MmMuqR+JolfoEE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FIXZmAOcNHXQ7ZM8JZhHkhdBWZszVi+ECpPOUMS7Q2uAMUWdtSKJgKxm4iPtpaQ5x
 I21P4xp3+iDmYip4C+ATD3Hqnxzlkk/Y+fOC3iOZWcI+MAk1G6A6JbeyITPek/lmAz
 pnP/Qdgpq7CWUIHiMFxdqzslfvavEROTb5R2s9RhCijilg8mEIkXGHdcQroc6CN9GY
 MmBTswGCNQ7Dcolsem3eW0EaTRnKzPoPSa0G+/Xhq2TnZaSOhdNbMk8usIMM9zp34/
 iYYC2acRHzBNo+XfhlJmI0nEozUnX/UaLGUcwGJVd5qv1KqMl88lPx4k3JUHzNSEpi
 SMbg8w1JgJPaw==
Received: by mail-vk1-f170.google.com with SMTP id 191so4799120vkc.1;
 Mon, 10 Jan 2022 18:44:05 -0800 (PST)
X-Gm-Message-State: AOAM5334A6qvQyh6DonmkdMZXbYubli2MhX4b1TZHu4RpSDmxaGeEJji
 mS5y4lxMjrvuVUf7ef4ZKy6uSQgLTiLBgRFp/a0=
X-Google-Smtp-Source: ABdhPJxiL77rGTLuws5g7KGQ/X9mfhysvv2bOJP9MXedX7dnBC1sSY9bwxU9DL7TLgPk3W1o87rBKfppwaCBYGQoNO8=
X-Received: by 2002:a1f:e243:: with SMTP id z64mr1284031vkg.28.1641869044562; 
 Mon, 10 Jan 2022 18:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-4-guoren@kernel.org>
 <CAK8P3a2zn9M6X09WsjJ9HYiS9WnO_YPCvJLSBk+HaH+yZHQqfA@mail.gmail.com>
In-Reply-To: <CAK8P3a2zn9M6X09WsjJ9HYiS9WnO_YPCvJLSBk+HaH+yZHQqfA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 11 Jan 2022 10:43:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTzUV1teCh0Avw7rTsrd=50atKGCdpQsVyEeUus1TeGjA@mail.gmail.com>
Message-ID: <CAJF2gTTzUV1teCh0Avw7rTsrd=50atKGCdpQsVyEeUus1TeGjA@mail.gmail.com>
Subject: Re: [PATCH V2 03/17] asm-generic: fcntl: compat: Remove duplicate
 definitions
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, 
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_184409_146646_013356A6 
X-CRM114-Status: GOOD (  28.15  )
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

On Mon, Jan 10, 2022 at 9:35 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Dec 28, 2021 at 3:39 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Remove duplicate F_GETLK64,F_SETLK64,F_SETLKW64 definitions in
> > arch/*/include/asm/compat.h.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
>
> Unfortunately, this one does not look correct to me:
>
> > @@ -116,7 +116,7 @@
> >  #define F_GETSIG       11      /* for sockets. */
> >  #endif
> >
> > -#ifndef CONFIG_64BIT
> > +#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT)
> >  #ifndef F_GETLK64
> >  #define F_GETLK64      12      /*  using 'struct flock64' */
> >  #define F_SETLK64      13
>
> The problem here is that include/uapi/ headers cannot contain checks for
> CONFIG_* symbols because those may have different meanings in user space
> compared to kernel.
>
> This is a preexisting problem in the header, but I think the change
> makes it worse.
>
> With the current behavior, user space will always see the definitions,
> unless it happens to have its own definition for CONFIG_64BIT already.
> On 64-bit parisc, this has the effect of defining the macros to the
> same values as F_SETOWN/F_SETSIG/F_GETSIG, which is potentially
> harmful. On MIPS, it uses values that are different from the 32-bit numbers
> but are otherwise unused. Everywhere else, we get the definition from
> the 32-bit architecture in user space, which will do nothing in the kernel.
>
> The correct check for a uapi header would be to test for
> __BITS_PER_LONG==32. We should probably do that here, but
> this won't help you move the definitions, and it is a user-visible change
> as the incorrect definition will no longer be visible. [Adding Jeff and Bruce
> (the flock mainainers) to Cc for additional feedback on this]
>
> For your series, I would suggest just moving the macro definitions to
> include/linux/compat.h along with the 'struct compat_flock64'
> definition, and leaving the duplicate one in the uapi header unchanged
> until we have decided on a solution.
Okay.

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
