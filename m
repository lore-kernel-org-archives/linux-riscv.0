Return-Path: <SRS0=+Lbj=JF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD61C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 20:08:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2ACA60FEE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 20:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2ACA60FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XYvwBsQFc+aYzVk+txF33Db9x5aQK11CZRGabKoQBdc=; b=gXAJknJ7e7mDA3IJOg6osBKZL
	phv/NgoclLdh0GDZ+QnOsDojPEUQqT4HhYKa8Ai19QDqV+2QW/mfoIG5WnLJ/kUk6OSixLc8pBQkG
	9G/yR4C+pozs3WekjOTaredqPs4hHwRZCiBlFvHMK6fBjA5d0p9bRkiZbJ9EKV/OMs8ftCmOTTV5P
	ih0RztU2ROZK9dPZRg6+Jy29f977wVLrNnESoPH2bL4fUSne75YcnExztI785oloGwD6fmOceuqaj
	w17Oua46NzvK/cfeoXj0JY8gZQ4KpqTtWGDkKRg5wxVx9lhlVQ/K/GQDmlHnL9pDt6e99r64FFBtx
	JjAAQmfyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUax3-009AHx-PS; Thu, 08 Apr 2021 20:08:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUawo-009AGB-JK; Thu, 08 Apr 2021 20:08:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5D9A61131;
 Thu,  8 Apr 2021 20:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617912493;
 bh=lJBvFSudiDrxZs+SnGh4YtxaarzP38H043H9PsxfbKw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tBubWWY3+neAkzvUwVEoCp09FqswXCDaRx0c5tqpOKjvcYtVCmFe8JHZ54TSymAUN
 LcUpHK9kiXHWgsLiDmBkRkBjUyBdxgg10Kg/vhYMlvwhM6Td33Bu/fEAPoZH7Rwzg3
 y/02Yh1kIkod5A/25l6gmVy/uGkdg25wTAzvSArNYFnlkxuDzKdqut3U9ckR8RDs9P
 vDjyKsx0P5LjQjJsrua6oISbMFMHmtnTHx3DuSW049FdIe7WaniCJJy7rcIwUJrymm
 s/dYmx64TzuZ1Bdy4C5SW9baPR3AZmbYAPa+qWcEfy3HARHgLptgEEwfQza7x3mWiq
 CQZwA4HwhhFsA==
Received: by mail-ed1-f45.google.com with SMTP id ba6so3906768edb.1;
 Thu, 08 Apr 2021 13:08:12 -0700 (PDT)
X-Gm-Message-State: AOAM531Iqgjf0W05B/t5Jk6Eib6eSF7W4VjePvkOMXRwET5FoVqLrqcr
 b500P0FYQ+B/YCsYwSkEIAuAcRGjk5cDcf12tg==
X-Google-Smtp-Source: ABdhPJyQM3sGNyB4lBHJyB/vMz0AuBm9hT4GnsJ9rwYhPZ4h1PIVlO3IzyI5ADQSr6ra6UOvePCEFavpVtRgMZ1GG6I=
X-Received: by 2002:a05:6402:212:: with SMTP id
 t18mr13947421edv.165.1617912491462; 
 Thu, 08 Apr 2021 13:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <34d20d1dbb88f26d418b33985557b0475374a1a5.1617556785.git.christophe.leroy@csgroup.eu>
In-Reply-To: <34d20d1dbb88f26d418b33985557b0475374a1a5.1617556785.git.christophe.leroy@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Apr 2021 15:08:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ=UNfptbNHR5XAS9BQRv3C5+YonW9rwypA5gGt2N7bGQ@mail.gmail.com>
Message-ID: <CAL_JsqJ=UNfptbNHR5XAS9BQRv3C5+YonW9rwypA5gGt2N7bGQ@mail.gmail.com>
Subject: Re: [RFC PATCH v6 1/1] cmdline: Add capability to both append and
 prepend at the same time
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Will Deacon <will@kernel.org>, Daniel Walker <danielwa@cisco.com>, 
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Arnd Bergmann <arnd@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 microblaze <monstr@monstr.eu>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, nios2 <ley.foon.tan@intel.com>, 
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, X86 ML <x86@kernel.org>, 
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_210814_942518_3E9CB4A8 
X-CRM114-Status: GOOD (  17.20  )
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

On Sun, Apr 4, 2021 at 12:20 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> One user has expressed the need to both append and prepend some
> built-in parameters to the command line provided by the bootloader.
>
> Allthough it is a corner case, it is easy to implement so let's do it.
>
> When the user chooses to prepend the bootloader provided command line
> with the built-in command line, he is offered the possibility to enter
> an additionnal built-in command line to be appended after the
> bootloader provided command line.
>
> It is a complementary feature which has no impact on the already
> existing ones and/or the existing defconfig.
>
> Suggested-by: Daniel Walker <danielwa@cisco.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> Sending this out as an RFC, applies on top of the series
> ("Implement GENERIC_CMDLINE"). I will add it to the series next spin
> unless someone is against it.

Well, it works, but you are working around the existing kconfig and
the result is not great. You'd never design it this way.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
