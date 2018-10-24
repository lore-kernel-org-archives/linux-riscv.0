Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67381ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 19:56:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F48120832
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 19:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OnHXPq2w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPXWBrBY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F48120832
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUte/ottKIGIyjD3aOACnhmnrs2YeHjB1bEOue0YI8I=; b=OnHXPq2wDE6aRD
	HJSw286Rk/QuVMzFbKD1ZEocErB+D9DCzGtDKu5/jaNnD7/ZwqZWGl5domOawjoZnrXAJ/zidcjgi
	0RZLlGsu/i8d7t4S2hbXMRJ604sBCLHfodlkbFmrYTCfhMeRrB83h3h4ISc6/aMn1qjut5opTErG1
	0AgtZAR24KZz1M9RfA13C9SiBCYjmpRi6m2GF0sVBNeIGZxrGkALN13c186BQoE/XrWcCWhktzgb2
	iHqybNNLklGG3UZY4yWXJCkEutkp4k2qmE5dytv0fyGVBO1BQnAYJDPD/x1lWVXxExtcefzNG3M+O
	32+226MSPTPWRJj6seAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFPGZ-0001NV-5N; Wed, 24 Oct 2018 19:56:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFPFm-0000u7-OM; Wed, 24 Oct 2018 19:55:51 +0000
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6639A20868;
 Wed, 24 Oct 2018 19:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1540410930;
 bh=odyqBKiYzBv5IdIjuzYAxZmBJIO7/EssQKEqn+zv55Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pPXWBrBY48yKmVZsXTwnisZP13JqtDYYYkw0MgF5fzrB0Kyr3C1w180LeNbCUqTMI
 7jGgJ5Aa6GlqBjlH1EXuO620tqj2AM9TpbqXXOJqD8ThiOnXSMbaekyyxcisqwNUJm
 6H8xB6oFAY5/Mosi2BOK2RnN9DT9LDaSAgYcgCaw=
Received: by mail-qt1-f169.google.com with SMTP id l9-v6so7062283qtj.12;
 Wed, 24 Oct 2018 12:55:30 -0700 (PDT)
X-Gm-Message-State: AGRZ1gJPN1T+TS7q9yI1Qsder2+YUe3h7Cqu3anFUpdDGuhHvkd57ryU
 qL4gNCteMYXL4yWHjPbOcfvVsViNlsIeK3ayRQ==
X-Google-Smtp-Source: AJdET5fsfiJJQiRG4tYbtk5oK2Hs+N0GSRD1ejgIMFFWz394cehWWCibOhJ12q0e8gCpcmQUgoAPaMWg1f+S+gdFGLQ=
X-Received: by 2002:ac8:5414:: with SMTP id
 b20-v6mr106396qtq.144.1540410929467; 
 Wed, 24 Oct 2018 12:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20181024193256.23734-1-f.fainelli@gmail.com>
In-Reply-To: <20181024193256.23734-1-f.fainelli@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Oct 2018 14:55:17 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+KCOv6pXXHhHDZ+7-QUrmtMDvSjEVhK15yZ3qbnn61Ag@mail.gmail.com>
Message-ID:
 <CAL_Jsq+KCOv6pXXHhHDZ+7-QUrmtMDvSjEVhK15yZ3qbnn61Ag@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: Cut rebuild time when changing
 CONFIG_BLK_DEV_INITRD
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_125542_929177_B9EF16E0 
X-CRM114-Status: GOOD (  19.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, linux-ia64@vger.kernel.org,
 SH-Linux <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, arcml <linux-snps-arc@lists.infradead.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Marc Zyngier <marc.zyngier@arm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Openrisc <openrisc@lists.librecores.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-alpha@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024195517.EjLAZu2E0KLbHT-aOGBtzCWmCJaD5-4k23w5lEJakFE@z>

On Wed, Oct 24, 2018 at 2:33 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> Hi all,
>
> While investigating why ARM64 required a ton of objects to be rebuilt
> when toggling CONFIG_DEV_BLK_INITRD, it became clear that this was
> because we define __early_init_dt_declare_initrd() differently and we do
> that in arch/arm64/include/asm/memory.h which gets included by a fair
> amount of other header files, and translation units as well.

I scratch my head sometimes as to why some config options rebuild so
much stuff. One down, ? to go. :)

> Changing the value of CONFIG_DEV_BLK_INITRD is a common thing with build
> systems that generate two kernels: one with the initramfs and one
> without. buildroot is one of these build systems, OpenWrt is also
> another one that does this.
>
> This patch series proposes adding an empty initrd.h to satisfy the need
> for drivers/of/fdt.c to unconditionally include that file, and moves the
> custom __early_init_dt_declare_initrd() definition away from
> asm/memory.h
>
> This cuts the number of objects rebuilds from 1920 down to 26, so a
> factor 73 approximately.
>
> Apologies for the long CC list, please let me know how you would go
> about merging that and if another approach would be preferable, e.g:
> introducing a CONFIG_ARCH_INITRD_BELOW_START_OK Kconfig option or
> something like that.

There may be a better way as of 4.20 because bootmem is now gone and
only memblock is used. This should unify what each arch needs to do
with initrd early. We need the physical address early for memblock
reserving. Then later on we need the virtual address to access the
initrd. Perhaps we should just change initrd_start and initrd_end to
physical addresses (or add 2 new variables would be less invasive and
allow for different translation than __va()). The sanity checks and
memblock reserve could also perhaps be moved to a common location.

Alternatively, given arm64 is the only oddball, I'd be fine with an
"if (IS_ENABLED(CONFIG_ARM64))" condition in the default
__early_init_dt_declare_initrd as long as we have a path to removing
it like the above option.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
