Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A8CC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 22:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXu+f/ccX84iLofjUbPaxWr20dllpsDMZx+PHglr5KM=; b=gyeT+GdR5HwFgY
	M2yvL1MsNC8qonT/CEe7MjzegEBsgK4yZjnDwdYvJY1vbUODCMwZN1wjDKsRhuzJQxrIxR3RhCv3w
	mSLwPxG/9BV62uQ9RDH2mxaZOJrnr6jwmao7+QE6CJ3MvoCVrK3vknyVt38o9NYliCTfp3UVvBNPb
	272N99UjKAaMPgN45SxZdD0yhBc5ObM7yV0UwEmETTY/6Xm9b+wqs/CjnHaaAM2NlS0vFWdygXfqJ
	IV0JIcicZfdUeuUB7z6VTtUJklZgm9t7Dt7RbeX7oAsQa15VYuOCsG61uVVtl5MsQqlmVOXz7m9Jv
	xpEVTjUpqCJvUvMs3hHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDwRq-005ZJu-3R; Sat, 29 Jan 2022 22:43:58 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDwRm-005ZJV-SE; Sat, 29 Jan 2022 22:43:56 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mo7if-1mTwJP2dD9-00pacG; Sat, 29 Jan 2022 23:43:52 +0100
Received: by mail-wr1-f47.google.com with SMTP id s9so17908986wrb.6;
 Sat, 29 Jan 2022 14:43:52 -0800 (PST)
X-Gm-Message-State: AOAM532LL7sM7Bt1EiWs4zLdodYJ6kC6PwAqo+r+seQTqixpcxuWAlrR
 Ygh4jfiRXKv+0tGN+fdq6JYT+4PoOCUboDbLHHc=
X-Google-Smtp-Source: ABdhPJzI0D41s8yrwHglCZkVEr0x+bK1CMwYgZgaz1NErnnr1PsIuPoCJo0tLrBweMwgRCKK6bnEP4/locNb0Mfr0Gg=
X-Received: by 2002:a05:6000:3c6:: with SMTP id
 b6mr11705793wrg.12.1643494389446; 
 Sat, 29 Jan 2022 14:13:09 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-9-guoren@kernel.org>
In-Reply-To: <20220129121728.1079364-9-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 29 Jan 2022 23:12:53 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
Message-ID: <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
Subject: Re: [PATCH V4 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:zfqEITrf5H65dAwJI49aTBpVarBrtcz3PO92LwAqAajq2NFafvz
 ncD9M9UeSmBoN89bNZpyQBJ3Dp4dhyGA1nydHZhrOYkEvFSNbXN2Y4YygNUgWZ+w90Ub+P2
 R8sSSHwr5KFee+Co9yv4o3u54lBGwQdljDelnb0gk5A5eGGYhJnRN0gxZREzHixgrdDZgmE
 OrC8KmkDwAVxo6KetQOrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UJ1j6WwoK6c=:w+LBwfjeCJGaHBi95gexj/
 5Frhz9Z25PbY+Ive1xEl8qEqOUAs5TGyxlqCwpedpEcqWLSgrDMNuX0P4LGt6MU4CNEHuKzy5
 tk84In+6TI7o84EbOfGEptLfDmjj0v821041OT94UOm+xq0ZIeegE7NcVJGWX/ParsxYtC6ul
 lA/zp/d4VL99xcT6ckqhtwpiVIFMUFLn32tYE7CuQwTqYV1pGSbzAFnzY0YGmJ5h1ZrHfNZUc
 1MrMR7UgOTOIULHzNlVJJxOV7vWZCyud566pSSQ0IaKIeaeB5cAZ99aGHyaV8m72Ktddfv6hk
 o3WMm+qSfLfQsh7ft+nMnG3OGPCvjYKqW/yOiHOovrW25EmelGNT/sd+B1P3gUs8DFkDs8/bI
 79orq8VG5//XSJ3AomyO7cJo/T6sYrxxpC5dJnq01H1/a87WhD5xIGmSMFgEv7UPBNCyURw1B
 9I5lK8c1g8W7QOeEFVPwvweHjxHNARrG2QLD2pLCgy9l+pw2jTY7Qt1r9ttfYR41wzXJymhqK
 9cHoIQvLId/JGehJwiDv6KV/GHVzHO/VOt0a2mCOEthJ5WyZyW5GDze+AXTbKVjngWxCCEb3e
 T+yobBJJEwK07wL0JElfRn8yWnwSnktcnkMecjUORExEeii/O+Ye9LLzy5xGtChM78rsgb33i
 Mo5+gVEZzx5Llk7DPSrOHILlLY4Dqk++9bo5qhWDek0kmLe8aqN92T3npgoZNRf4DAhoI6k8W
 Kko+mRxT3pQV10ftSNizjvjhUt3C3vhwDdHzLHEmnMMm2q0+2SoA/mVFunFA/dNqP+Nb13+Ze
 rdh0zXobQ98XW7l9IXPKvpTLpaS5qp77xyQeefT77kX7cGUbQQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_144355_241563_C51BC588 
X-CRM114-Status: GOOD (  11.50  )
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

> Implement compat sys_call_table and some system call functions:
> truncate64, ftruncate64, fallocate, pread64, pwrite64,
> sync_file_range, readahead, fadvise64_64 which need argument
> translation.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

This all looks really good, but I would change one detail:

> +#ifndef compat_arg_u64
> +#define compat_arg_u64(name)           u32  name##_lo, u32  name##_hi
> +#define compat_arg_u64_dual(name)      u32, name##_lo, u32, name##_hi
> +#define compat_arg_u64_glue(name)      (((u64)name##_hi << 32) | \
> +                                        ((u64)name##_lo & 0xffffffffUL))
> +#endif

I would make these endian-specific, and reverse them on big-endian
architectures. That way it
should be possible to share them across all compat architectures
without needing the override
option.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
