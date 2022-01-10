Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17A9C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxTUeC/TO62syHU8B0StadtSnSTyVuEbX1LZ06MXgzM=; b=u7GCPDjVQTfDAY
	oMOaP1pXBDLPFyyY4t0nTUp07nt6nAGDt2tNUDu9ACizwpbTCGM0lHYl5W6TdVgHf6bWjBPq/PHZ7
	/VbaX0ZYL3jwppZYt+LegFzQp03UpM67qeVJpxJhv1knXbS/ZA0aUwqRguvTPf0lOG6BQjCOUzIjl
	y/84GIVGzD0kHMGkoRw5uvIbPnief9HNQnMFUMuwxwftFRJDZvLZIjCpl1ruvVYqT23lk1urlIY/R
	uud450yfc9TvLMfptOox9tqyK4beURH8eDWAqUa3tAymuaKhwyNvADuyg87rhUpEtS3r3uylQkQdU
	9yq2pC2tpafC9f3xGHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6upy-00BY5p-8v; Mon, 10 Jan 2022 13:35:50 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6upm-00BY1d-2G; Mon, 10 Jan 2022 13:35:39 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M7aqD-1mzTmf0aAX-0083pS; Mon, 10 Jan 2022 14:35:36 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso7292379wme.1; 
 Mon, 10 Jan 2022 05:35:35 -0800 (PST)
X-Gm-Message-State: AOAM531IoJo+RUkej5pwm/R8OoWalPzqXSvM2Yr4dN9PsDdU7N/vreoN
 /DKixa4dKcOlKms2V7g7CfGMYyx19qV+W8AL6ZE=
X-Google-Smtp-Source: ABdhPJxi0Z/ZiBz/NSOKjhoGPprS74nLPOzeNY5wtnvdjs0k7wca4Io+stHgBpdw9GGPmWr9NuMWVabYObO8sOckUL0=
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr8601383wmf.173.1641821735504; 
 Mon, 10 Jan 2022 05:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-4-guoren@kernel.org>
In-Reply-To: <20211228143958.3409187-4-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 10 Jan 2022 14:35:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2zn9M6X09WsjJ9HYiS9WnO_YPCvJLSBk+HaH+yZHQqfA@mail.gmail.com>
Message-ID: <CAK8P3a2zn9M6X09WsjJ9HYiS9WnO_YPCvJLSBk+HaH+yZHQqfA@mail.gmail.com>
Subject: Re: [PATCH V2 03/17] asm-generic: fcntl: compat: Remove duplicate
 definitions
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, 
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
X-Provags-ID: V03:K1:c5ulGSwFH7dSvczCy/ZMJT2KEVezazRTHE956ir6SPS4AFGT0as
 F0xpKD8aggEu6OVSQsWSjNHVPecHpMhn9Zuh1IZp0QMBLfv9vtcPHsGGTNPIinduBrFDU8t
 4HzeDvrS3Qxu8azUiMAUAUwv5M078tnZYQs3rOpIBXoCwHZKYvAmjU5UfoPykjfZLdzysxy
 BD8ex5Hg+tqSLxcbYiYRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4e96AgJdS9g=:YS43pTl+diI8IBZJWBO0ja
 ZJ4aN5ztjLkfiP1FJlHZv11hNpx26Ub3fv1YlnNTLW/SHdfx+EvLlqmyM50I6vb92sKeZRDoV
 603Weo1/7tuPrpx+9xFphtKNtTI6ySYqGbdVn7mTrEjv3qWAtdodq6yfId7jT8VkHuK0YWpnd
 p+Fup5uCM6SUDs5lK1K3vnX9bIQaVD1SAyk+CCm9ffgQ6EwYhyIN6xVxF/tXsfX/odMJDLK6D
 63WGAyNrsYGMiqXTE3ptg9Kz8HIX/jXOyZFf2kZaEYbs3sSQNAbINIhmKaicl9O81UGXYvGeb
 8jQbGMnz7bTHSVUnzc7xsAsTbYLjovjhSt1XYOxmENQmMOqpBZiZHm/yy7XjwGUVlj99KhgYi
 AX3PjT4ljqIeHFDBO5jcdT6D6yp8PnM9mMobkC+YZl6R+yIXG4DsXzoa3XYkb0i4Zr5nzLM00
 OnwZFVlB+sqkwNYSpxzbdE4UrM/Mvb07GEJFpyLAwunzWt8e/o75pKxC20f9ruNlQb99A5NmN
 jCcBFxEG0lNvJHXMICj5PwgcNGWxrCPbuhTq1nbaq2KE6KxbgOS19+apvZB4UEIZ3qdkZzIMz
 ZqIZ3OyC/03yO4YfYJNqtEiqpJnkjfO0mEag1FJ0Md8lbURZnSSmwvg+ts5XVcClCYKax2AMF
 +FjqOqovPJ9FTRQbwLLEgeBg5GegxajYNMs731GmPIi/SAbJ36w6KYBT1nirpln2VNoT30bau
 Q4+nDNwVgp7IpVZg/VxL7cI6VR+VWr7HnYE6/eYvY5E79ZzxSADuqjZ8XQF4zemdLSny3Jsu4
 JhkEwUfCs/AVD1SqyQ+CSMz0ehtB7cGF0i+LSjZ5Vr4bWPpfz8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_053538_424063_0E98A7BD 
X-CRM114-Status: GOOD (  18.32  )
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

On Tue, Dec 28, 2021 at 3:39 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Remove duplicate F_GETLK64,F_SETLK64,F_SETLKW64 definitions in
> arch/*/include/asm/compat.h.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

Unfortunately, this one does not look correct to me:

> @@ -116,7 +116,7 @@
>  #define F_GETSIG       11      /* for sockets. */
>  #endif
>
> -#ifndef CONFIG_64BIT
> +#if !defined(CONFIG_64BIT) || defined(CONFIG_COMPAT)
>  #ifndef F_GETLK64
>  #define F_GETLK64      12      /*  using 'struct flock64' */
>  #define F_SETLK64      13

The problem here is that include/uapi/ headers cannot contain checks for
CONFIG_* symbols because those may have different meanings in user space
compared to kernel.

This is a preexisting problem in the header, but I think the change
makes it worse.

With the current behavior, user space will always see the definitions,
unless it happens to have its own definition for CONFIG_64BIT already.
On 64-bit parisc, this has the effect of defining the macros to the
same values as F_SETOWN/F_SETSIG/F_GETSIG, which is potentially
harmful. On MIPS, it uses values that are different from the 32-bit numbers
but are otherwise unused. Everywhere else, we get the definition from
the 32-bit architecture in user space, which will do nothing in the kernel.

The correct check for a uapi header would be to test for
__BITS_PER_LONG==32. We should probably do that here, but
this won't help you move the definitions, and it is a user-visible change
as the incorrect definition will no longer be visible. [Adding Jeff and Bruce
(the flock mainainers) to Cc for additional feedback on this]

For your series, I would suggest just moving the macro definitions to
include/linux/compat.h along with the 'struct compat_flock64'
definition, and leaving the duplicate one in the uapi header unchanged
until we have decided on a solution.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
