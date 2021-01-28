Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACC4C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 20:08:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F24D64DF5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 20:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F24D64DF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y/hL8lsO3ZaD+ZEmCe1TAwR40JrPIs5AG0xKcKpsRDc=; b=cAZsb4DdeyOScq2RRkmn41PyX
	tkkJoiRy4X5pczQuK7YEo0HQGCVaoGeZAwPcLfcUtqpfuxhqgdgnu7eSV+vbIeAY1C/klcCWEjqqJ
	fKTqGWl9kV9uVGoMEdjcGEhX6ZBMsHjzzypWFjlLc/pGjqKdY/5yvX63VbqhM/SpTW5CDL8+phhCh
	4ZDbuGfAA8mPiWQ0Rv0oyJbWG+gliE6nwUPtqkuN2lKyM+caXiZqoqwuCYx+JnpAAwOj5gti7K/li
	0TisU5HQQMOj9F7LTl8mccH15kL6rLFR95S5+DRV0qk7mKA4IjdWBNyy0RYYxokczXELIcEHUBMsY
	SblROK9bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Da6-0001Oy-4h; Thu, 28 Jan 2021 20:07:54 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Da2-0001OC-5X
 for linux-riscv@lists.infradead.org; Thu, 28 Jan 2021 20:07:51 +0000
Received: by mail-il1-x136.google.com with SMTP id c20so6423049ilj.13
 for <linux-riscv@lists.infradead.org>; Thu, 28 Jan 2021 12:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yc0cCbs1djyd0FuZIi9VgflfqN74WZxddsSTT80OwBg=;
 b=lxbJRGCLDdaUbid3RMhCMwlmgkMmDcLeKDXezA2/LOksG8yOSjQ1UqsNlROasSjJJU
 7O6nwi2rFw294IPMrGxxCL70PXnUl8QZnnlZyS98F+pSYAQpLg6IpZDZwVhJSGoCXHJt
 NEjFT3uuRAunB4oDvzooA6Wtqip3oMTiWGMfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yc0cCbs1djyd0FuZIi9VgflfqN74WZxddsSTT80OwBg=;
 b=MN5/k6urG4HykoktQrF7hG5Y13deC6weii3FGs3keETtPGIyknHKKAkSNlB7n6q6gC
 wuVk1UUWm6ceo5XvE1BNAxRnxNT4Ce4p/ExvXJdNQwabqOxsdtoZYVdAvz68ntvheLSq
 3SVRwiJJP28UJOc+EeAMPOro+GhVyHliE6XpPs85QlSKwKvcH7jD05AM/uZ/6pnY4vXM
 6MxzfPM5Fh6E1oFcFsh8qPTkYaSJPKHXDhzMSmUgp17cNP2VXg17XSrzw35D/cPVSCzL
 HZ6+/d7ciscJH8jfG/16plBDC3dZ3REQ/2HHcBoK1WIwD4V4dFfXG6b9ebDQxqT8/urE
 y1jA==
X-Gm-Message-State: AOAM533Xus7rTYkTXgNldU8C1kDpsPScaPmQSXwgreDQD38R9PmLloU7
 Q8LTspASJDJlyMMqVG8grydTgRlSa0o2uq+l21Of
X-Google-Smtp-Source: ABdhPJwWYzYtP8x+TenCxXMmxvh5r+deUf8+214MHNss6gD/s2ewWJvdhGP/YUde6nLL46FZesuI3nljn79b33Q0qmE=
X-Received: by 2002:a92:cd8e:: with SMTP id r14mr598106ilb.77.1611864466662;
 Thu, 28 Jan 2021 12:07:46 -0800 (PST)
MIME-Version: 1.0
References: <b67f8941-6624-d814-e6d3-2ddfdfbdf7dd@infradead.org>
In-Reply-To: <b67f8941-6624-d814-e6d3-2ddfdfbdf7dd@infradead.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 28 Jan 2021 12:07:35 -0800
Message-ID: <CAOnJCUJc0-x-gmLAKxb9ULjOX1yBjxZvwi4=_0ETH-L7JtKhNw@mail.gmail.com>
Subject: Re: Kconfig-induced build errors: CONFIG_PAGE_OFFSET
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_150750_354152_6CAF94AF 
X-CRM114-Status: GOOD (  22.85  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 LKML <linux-kernel@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 27, 2021 at 7:18 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> I took a riscv-32 .config from kernel test robot (it was for a clang build)
> and did a "make olddefconfig" (using gcc tools) and got build errors
> due to this config item from arch/riscv/Kconfig;
>
>
> config PAGE_OFFSET
>         hex
>         default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
>         default 0x80000000 if 64BIT && !MMU
>         default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
>         default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
>
> PAGE_OFFSET is undefined for the case of 32BIT && MAXPHYSMEM_2GB.

Because, RV32 doesn't support 2GB physical memory yet.

The compilation errors can be fixed by not allowing MAXPHYSMEM_2GB for RV32 and
MAXPHYSMEM_1GB for RV64. How about this ?

--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -253,8 +253,10 @@ choice
        default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY

        config MAXPHYSMEM_1GB
+               depends on 32BIT
                bool "1GiB"
        config MAXPHYSMEM_2GB
+               depends on 64BIT && CMODEL_MEDLOW
                bool "2GiB"
        config MAXPHYSMEM_128GB
                depends on 64BIT && CMODEL_MEDANY


> That causes lots of errors when _AC() is used to paste
> CONFIG_PAGE_OFFSET to "UL", like these:
>
> In file included from ../include/vdso/const.h:5,
>                  from ../include/linux/const.h:4,
>                  from ../include/linux/bits.h:5,
>                  from ../include/linux/bitops.h:6,
>                  from ../include/linux/kernel.h:11,
>                  from ../init/do_mounts_initrd.c:3:
> ../arch/riscv/include/asm/uaccess.h: In function '__access_ok':
> ../arch/riscv/include/asm/page.h:34:46: error: 'UL' undeclared (first use in this function)
>    34 | #define PAGE_OFFSET  _AC(CONFIG_PAGE_OFFSET, UL)
>       |                                              ^~
> ../include/uapi/linux/const.h:20:23: note: in definition of macro '__AC'
>    20 | #define __AC(X,Y) (X##Y)
>       |                       ^
> ../arch/riscv/include/asm/page.h:34:22: note: in expansion of macro '_AC'
>    34 | #define PAGE_OFFSET  _AC(CONFIG_PAGE_OFFSET, UL)
>       |                      ^~~
> ../arch/riscv/include/asm/pgtable.h:26:27: note: in expansion of macro 'PAGE_OFFSET'
>    26 | #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
>       |                           ^~~~~~~~~~~
> ../arch/riscv/include/asm/pgtable.h:41:24: note: in expansion of macro 'VMALLOC_START'
>    41 | #define VMEMMAP_START (VMALLOC_START - VMEMMAP_SIZE)
>       |                        ^~~~~~~~~~~~~
> ../arch/riscv/include/asm/pgtable.h:50:26: note: in expansion of macro 'VMEMMAP_START'
>    50 | #define PCI_IO_END       VMEMMAP_START
>       |                          ^~~~~~~~~~~~~
> ../arch/riscv/include/asm/pgtable.h:51:27: note: in expansion of macro 'PCI_IO_END'
>    51 | #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
>       |                           ^~~~~~~~~~
> ../arch/riscv/include/asm/pgtable.h:53:26: note: in expansion of macro 'PCI_IO_START'
>    53 | #define FIXADDR_TOP      PCI_IO_START
>       |                          ^~~~~~~~~~~~
> ../arch/riscv/include/asm/pgtable.h:59:27: note: in expansion of macro 'FIXADDR_TOP'
>    59 | #define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
>       |                           ^~~~~~~~~~~
> ../arch/riscv/include/asm/pgtable.h:471:19: note: in expansion of macro 'FIXADDR_START'
>   471 | #define TASK_SIZE FIXADDR_START
>       |                   ^~~~~~~~~~~~~
> ../arch/riscv/include/asm/uaccess.h:56:17: note: in expansion of macro 'TASK_SIZE'
>    56 |  return size <= TASK_SIZE && addr <= TASK_SIZE - size;
>
>
> I suppose that it wants something like this, but someone else can
> fix/use the correct default value here:
>
> ---
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Provide a default value for PAGE_OFFSET for the case of
> 32BIT and MAXPHYSMEM_2GB.
>
> Fixes many build errors.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>  arch/riscv/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20210125.orig/arch/riscv/Kconfig
> +++ linux-next-20210125/arch/riscv/Kconfig
> @@ -143,6 +143,7 @@ config PA_BITS
>  config PAGE_OFFSET
>         hex
>         default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
> +       default 0x80000000 if 32BIT && MAXPHYSMEM_2GB
>         default 0x80000000 if 64BIT && !MMU
>         default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
>         default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
>
>
>
> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
