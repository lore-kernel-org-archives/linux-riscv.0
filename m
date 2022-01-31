Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DDCC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 17:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+g+e+SUSBcaaB5mVmZYyq8bDzBfei0dUpXA/dcfXpc=; b=o6jOP6eirpmJ/X
	oyTVhxgH8MD/8vuwN5JZ52KYHrobkVGhRoS4QztP0R7rtd/kLMUxWXd3JBDsrrl64G/x4HVwoOpZI
	lu1X+2jJexROl5gBVHeCKvmLuLZsPqnmg2GHatpugkLCXLRUHF17410H/K7rX2Q8CDHApRFbH0J8C
	gyx9uH0VB0mf3Hoy7wpK8tLAzPxfDITjLM7kzj6UaIy8+Mg9xxYSNREyD7zs1bCQEzN+V1oDXaSdt
	t8lG5JyUzC2+xJ/CGujFqnDXZ/6qjqTVCypt0z/aMWkGu3q25mhhDIYa3BSaTXvrIqW45Pd+WUj7E
	3Fqagp+shwTwsao9lxfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEarM-00AErv-8s; Mon, 31 Jan 2022 17:53:00 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEarI-00AEqm-0K
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 17:52:58 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so19037141pjt.5
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 09:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CcsYkeFWzOuHVmFeeXrDJz8XxU7vHUFunNdU3i9ZZtY=;
 b=7DZOG/Si4Y67M983xBg4BrN5MuwQ1ow4QJ+jyJmD5ZLDymLk6+YIjf+Gl5QmDOD+0J
 trjfrdHTMPhy43dsnf5I+drC7LDttcE3C9d/5N367rNEjg/et13YYo2fSlkdX4tKSEOZ
 zIePhCSkQqsyjewS93DiY4QKAt7olnhC7DjMOFFDZhzg/rw1z6Q7w58f/VTtg0mquQLb
 s4G9bAzB9uSDK34DFjha/hErAlCgd7pAeKs/LH0lolWJ0Cj+RzWcwUztf4bVrvXdbF1q
 j+f55aa0wvozjYdp7GxdBuTf8ZPGNp1luNGI9xS0XSiN0T2JDKy91ncsnV568rUCXXCD
 P2pQ==
X-Gm-Message-State: AOAM532lVhnu/UEA7ujrGFWLTSzku3uXwdhFnBnj5ra0DKCCZ/9AEmlR
 Y2j3XWQpMuPW3t1+sRIV8BEyjWYi+AZdFSxjLkI=
X-Google-Smtp-Source: ABdhPJyZa4u3xNi1E7JmnZsDxyCzljnF3V/8bfIsbQsrsz6gDNkzIkrSzqUGacJJgYr0qaim4+d8jz0OjLS4yc7gW3E=
X-Received: by 2002:a17:902:7b95:: with SMTP id
 w21mr21774260pll.48.1643651574378; 
 Mon, 31 Jan 2022 09:52:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643635156.git.geert@linux-m68k.org>
In-Reply-To: <cover.1643635156.git.geert@linux-m68k.org>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Mon, 31 Jan 2022 18:52:43 +0100
Message-ID: <CANBLGcyZ+wcBiZOyd8jC2-cUx_m+Zu6XZB6gyDOL_omQzEesPw@mail.gmail.com>
Subject: Re: [PATCH 0/3] RISC-V: Fix cpumask rework falloout
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@rivosinc.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_095256_102521_A9AB9166 
X-CRM114-Status: GOOD (  13.73  )
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

On Mon, 31 Jan 2022 at 14:26, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
>         Hi all,
>
> This patch series intends to fix the fall-out from commit
> 26fb751ca37846c9 ("RISC-V: Do not use cpumask data structure for hartid
> bitmap"), cfr. the discussion in thread[1].
>
> Thanks for your comments!
>
> [1] "[PATCH v3 6/6] RISC-V: Do not use cpumask data structure for hartid
>      bitmap"
>     https://lore.kernel.org/r/20220120090918.2646626-7-atishp@rivosinc.com/
>
> Geert Uytterhoeven (3):
>   RISC-V: Fix hartid mask handling for hartid 31 and up
>   RISC-V: Fix handling of empty cpu masks
>   RISC-V: Fix IPI/RFENCE hmask on non-monotonic hartid ordering
>
>  arch/riscv/kernel/sbi.c | 72 +++++++++++++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 25 deletions(-)

I built this and rebooted my Starlight board a number of times without
seeing any of the errors that usually shows up when [1] is not
reverted.

Tested-by: Emil Renner Berthing <kernel@esmil.dk>

[1]: 26fb751ca37846c9 ("RISC-V: Do not use cpumask data structure for
hartid bitmap")

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
