Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9432AC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 04:06:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346722247F
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 04:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346722247F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8LsYkWbLyOWxPRiWhsq91qB56dmFbFqhLioYKG9s++w=; b=3b1rIuhF3RNsEQ0EX+k3CKd+u
	zFyv2YK4yc+ooZcSSzLhRza6srhjRSxYRQB2/H7eBSEbHY1KB3FSZ42dwJ4HQCkDsCPh0SYNipOQ5
	vS+uPZ25ySa7vbu6ms/ZbEr3kVWpDdBDodmtUki5Q/uGFxGalCmzDXZCrYHGH4EYt1lhMgaEqCPeY
	MsHJUIwwunbQYLigcp81YaLiEG+ZzOwNTix6r+3HC9BsYGer8D6BlKaj0TH2DZxlGqhS9Sou8QjnI
	egtjbyotuu/WD4ZXv91ScM0j86WTBujxQfBifC9oLgOupiRSvb0sgm4gVY7N83xWtV4jNiXDq2mAj
	gLpRDKqQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyoSz-00040F-F4; Mon, 11 Jan 2021 04:06:05 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyoSv-0003yd-8J
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 04:06:03 +0000
Received: by mail-lj1-x22d.google.com with SMTP id f11so2025427ljm.8
 for <linux-riscv@lists.infradead.org>; Sun, 10 Jan 2021 20:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hzsKcFE55evqkbte9pblpk+brr3UPTtNXgfWl4bSkvQ=;
 b=hM/2qZ5oBMHmZ8bIq4Q64okW/khXDZZZYSrngmVEwDaI9HqzAwtw+WxmJ7eyyoQcyF
 251iKCymCS/rjZyfuGfgpCUPIT8RKsh8JIpuUVOrNdwteP36K27NpUZLqVflPsKXoDa5
 Oa0EKaxkigCLQRRTLoNt6/doPd/ipur6+XXsFC6gVY8X0Bjc5uqREYSn2p/Eq9ty8vtM
 FVk4cyCZXEK2labVL98wK0CIuHGzvT+SWV41ev7uv3Bw0KcvtfVyMcqJc92OR50Cuih7
 WqYPHpRiCtegX3uP5OJe/tYF2tQDL3ZU2awVce2MkTUqtO72oqlwL5WbBU/FW9RE0kfi
 5ezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hzsKcFE55evqkbte9pblpk+brr3UPTtNXgfWl4bSkvQ=;
 b=fTjF23SOSTktbxQc2k+SZkV8UPq3Hovqzjvv1yK5ZZ5N0jzlndHNzcQqu7T5jiKJet
 7UkKumGwwcXR1a0Js43X8bXwcRjt9KeMGAtZlqElKixI70kKifLey9fJUG1s9wiFGaMI
 OtUxPHldYK0AdbZYOaYvcxSC8/nBQV0CJmWNmPNf0gRrv58CWAmQygiukuCIlPGLEmis
 F3QW89CxaXzkgf50pbyOhwleg97htZVsrUGouQJrUkRvxbV8AnQYFzjJcF5aV59q/5+k
 VduNwiASeZDY5CaSBZ6zugAomzj9sbCs1THCK9K5I0lVtpQwOYmY1uZVw0U9xzAD5OPP
 6nSg==
X-Gm-Message-State: AOAM530FHWYc9zZCyF8mQOos5mp4offOH4uyDa2wtCnH8VAh669sSNYQ
 pmiY6dEDlL1aop5hD9Egy3qjDPcsvvO4+SN9JF7sxQ==
X-Google-Smtp-Source: ABdhPJwFrWbgeTNNnn3V/4rMxmo8AroirXBbsDtnq5zOogzgkAe41SvHr0K2TNhq1Vuj2W6HdVR0ckBKuNfHVXxQ6sw=
X-Received: by 2002:a05:651c:48b:: with SMTP id
 s11mr6414476ljc.28.1610337958991; 
 Sun, 10 Jan 2021 20:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20210107092652.3438696-1-atish.patra@wdc.com>
In-Reply-To: <20210107092652.3438696-1-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Jan 2021 09:35:45 +0530
Message-ID: <CAAhSdy2w=uY-Bp_bKzmVxRwcF+-xwCtvKtZ0e-J5PTke-+m5Pg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Assorted fixes for RV32
To: Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_230602_201400_2709B90B 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Thu, Jan 7, 2021 at 2:57 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> This series fixes various issues observed in latest kernel on RV32.
> The first two patches fixes an resource tree introduced in 5.11-rc1
> while the last two fixes the case where 2GB physical memory is used
> on RV32.
>
> There are may be better way to fix the issue pointed out in PATCH 3
> as it seems a generic kernel issue where kernel pointers can not use
> last 4k of addressable memory. I am open to other better alternate
> suggestions.
>
> Atish Patra (4):
> RISC-V: Do not allocate memblock while iterating reserved memblocks
> RISC-V: Set current memblock limit
> RISC-V: Fix L1_CACHE_BYTES for RV32
> RISC-V: Fix maximum allowed phsyical memory for RV32

Please consider these fixes for Linux-5.11-rcX.

>
> arch/riscv/Kconfig             |  6 ++++--
> arch/riscv/include/asm/cache.h |  4 ++++
> arch/riscv/kernel/setup.c      | 24 +++++++++++++-----------
> arch/riscv/mm/init.c           | 16 ++++++++++++++--
> 4 files changed, 35 insertions(+), 15 deletions(-)
>
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
