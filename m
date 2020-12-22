Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06EEC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 01:44:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E4522A83
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 01:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E4522A83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lxDB3mjR2p7ZV3Wi5LrLPz4aQweX+8rV/hZXx7FR7NA=; b=Dsem69YIBAI56inDwnJSreq2E
	xKTUHuhpWtjj2rlWKiydXKqX4dX15DP+VaZzVSZ27xJfvCmjc1UB/WiRzea5RFZdXKVFtMoLjVFEb
	2fyDSx9lhE4PFUD5AEJ2venxx/Pxzo2P6QolppBXSV4e4zBVI3xcTts3Wro1D75vYlXI+QYskHiaq
	J6Z4bew2OX/q40mCKQd9G6I4DMITxpjb72L6rPPCXkmOydC6IKEWaNHgPXSbXZohZGrU6c5EoVniF
	9Dylawoa4POHArSt9904gxKHT+Cbjgr+LFAk9O6QqMV603MA14NGpM+XFu07HiPxReWyIR1165uiL
	4SnRC3bHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krWiv-00040a-Hq; Tue, 22 Dec 2020 01:44:25 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krWis-0003zs-VS
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 01:44:23 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id f6so1829248ybq.13
 for <linux-riscv@lists.infradead.org>; Mon, 21 Dec 2020 17:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YH3kWY/9FTGGbdzmNW9iq4F93NRlfV9MWRvEtUM4SS0=;
 b=rjmLASfuwY28xHGdpeV19G1UBOLlHHOdWjZgjVW/XmS9DcoS+OXS0kiWoh4378uujl
 jy4nUBTNtXJeExUNXmxcA5VTBzKFrJlOJ2sOZyQv11+B4iXErsaCHCzUoxMX725JJSVF
 zhQkcLI14tlflcdajcQWTyYJbAeqtkDPCmbJc9Ln8iqPqk8msY9HfFKhXbY99zj3UD/I
 VvsXaWkO+OWCkmvrE/ekjrAjVWSkBOBNBorhdxd2kdrigyouJPKHQXxvgwBRDuvfNvDZ
 p/HhrGC5McY2W+sJ3ZvDlJc3TYVljC4KerJW6Fvm3XpnZxaPUs39Ms8QfdI1c8QUVIDL
 ueJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YH3kWY/9FTGGbdzmNW9iq4F93NRlfV9MWRvEtUM4SS0=;
 b=Es+aFn5ezzr8j26qmfwK3z01mlepfBG76nL2ZmwlprzE+wVMA8VLgCjWzAxnqa7rD/
 6YME0oANO/+xryP9t7SSn5M6ct0m/WjHA1IMU+CE8TI87akgvJwSnein8fyyUggQiEwU
 ExXHf2AshxJR0a8HEMRTl/hhSRzy61JDDvCo9NozxcLGr3nw308QtxxkIkhcpUGEtnOh
 QbZckHsTrIyIo4973OzuiK8XK/dAKA47MqzAA882VVefPyio0phvchL895XuPOw42sm7
 nL8iffCxwflSYS3zoaLhdpdLZRGTzho8ylGqc4GEU8BiKfIIl7moK9tXvSRaRsjwQ/Yw
 qOzQ==
X-Gm-Message-State: AOAM530suHdUs7/k+pIfsPPidUCR/nxQIK8V7TVSI4raTNA3ILNlzjF9
 eDzmjq21MNTpUfZors8GiZY///OudEjtYhR7QZ8=
X-Google-Smtp-Source: ABdhPJysp9vMmw/VrIF8je/96pRXtsRwVglS1oOcwhaM9qgwQUdK1kNb9gWC9DWMJURPZkbZN/TYBVB5HPX0fjC4np8=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr26754851ybs.122.1608601459692; 
 Mon, 21 Dec 2020 17:44:19 -0800 (PST)
MIME-Version: 1.0
References: <20201221203719.15988-1-vitaly.wool@konsulko.com>
In-Reply-To: <20201221203719.15988-1-vitaly.wool@konsulko.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 22 Dec 2020 09:44:08 +0800
Message-ID: <CAEUhbmVrMEWCds2QRgnUGE4KGakxrYi6Z_EY-meyX33Fy_teoA@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: enable XIP
To: Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_204423_050432_E2995686 
X-CRM114-Status: GOOD (  17.98  )
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
Cc: Bin Meng <bin.meng@windriver.com>, Nicolas Pitre <nico@fluxnic.net>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Vitaly,

On Tue, Dec 22, 2020 at 4:39 AM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> Introduce XIP (eXecute In Place) support for RISC-V platforms.
> It allows code to be executed directly from non-volatile storage
> directly addressable by the CPU, such as QSPI NOR flash which can
> be found on many RISC-V platforms. This makes way for significant
> optimization of RAM footprint. The XIP kernel is not compressed
> since it has to run directly from flash, so it will occupy more
> space on the non-volatile storage to The physical flash address
> used to link the kernel object files and for storing it has to
> be known at compile time and is represented by a Kconfig option.
>
> XIP on RISC-V will currently only work on MMU-enabled kernels.
>
> Changed in v2:
> - dedicated macro for XIP address fixup when MMU is not enabled yet
>   o both for 32-bit and 64-bit RISC-V
> - SP is explicitly set to a safe place in RAM before __copy_data call
> - removed redundant alignment requirements in vmlinux-xip.lds.S
> - changed long -> uintptr_t typecast in __XIP_FIXUP macro.
>
> Changed in v3:
> - rebased against latest for-next
> - XIP address fixup macro now takes an argument
> - SMP related fixes

The above changelogs should go below ---

> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>  arch/riscv/Kconfig                  |  46 ++++++++-
>  arch/riscv/Makefile                 |   8 +-
>  arch/riscv/boot/Makefile            |  13 +++
>  arch/riscv/include/asm/pgtable.h    |  56 +++++++++--
>  arch/riscv/kernel/cpu_ops_sbi.c     |   3 +
>  arch/riscv/kernel/head.S            |  69 +++++++++++++-
>  arch/riscv/kernel/head.h            |   3 +
>  arch/riscv/kernel/setup.c           |   8 +-
>  arch/riscv/kernel/vmlinux-xip.lds.S | 132 ++++++++++++++++++++++++++
>  arch/riscv/kernel/vmlinux.lds.S     |   6 ++
>  arch/riscv/mm/init.c                | 142 +++++++++++++++++++++++++---
>  11 files changed, 460 insertions(+), 26 deletions(-)
>  create mode 100644 arch/riscv/kernel/vmlinux-xip.lds.S
>

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
