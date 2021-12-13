Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A02C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTsYA6UWOwViYJrGHBKXheLyUj64KoOPaVcS0V8K0lQ=; b=18dDxHrUGE5DhY
	2jkfc+Llo5qIVKK/deDu+HpFBYB5DTVeWhVxtlylyfayncUM5lUmPubR3RxI7aym7bVhk7v1ba7pf
	xeG/BPzwlMAvmhY4iigk0kHehyYYk0qGJjDTGMQoBOPU90bKwTIbumM4nM2fa40dC0a1d27BSC/dP
	PNaE7TB2vjc8HMb98REd02+u2M+4lWTqNr1rsNfS7mbPCBRItz1dnFu1CXecMkjRYvPR7z/J/db5N
	NL69UOog0y/DSakHcGoStVZqVSMU91FJRVL2MMtWnQ9wnRQESLZ3wxR914dfHhdtgPa9S0Dw1nNGA
	m7c0uu9HCq+mdZefhMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwkm7-009YZe-Ve; Mon, 13 Dec 2021 12:49:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwkm5-009YY3-2p
 for linux-riscv@lists.infradead.org; Mon, 13 Dec 2021 12:49:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so11533975wmb.0
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 04:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hXQYwOotvNt7nBs8RK2HcYpypTegYe76SWSdNP6SpOk=;
 b=Mwej99eKLJ2T6KE0qNHvTltiVl/qRpIrX2iSvi/ELOdMV/Xn0oR6keuB1RI5uqgbXd
 BAFu5sSboKOqGyLqZnPcMggy6S1veMWQfmIQGrwDx8PY64lEoM/WP8L4bl3SQG2kJuJ4
 bzXipTGMdUfoJtsXwbUhclcAKPHNIECs3HNG22wa0VC1/DCac3/cHjeaJi3oLJk0QAOj
 qasAldeQI1xT2p4Hv3Inm87QmC5lbOl3r04G9GL1n8eqmTWz4A/VgSBgnSIegmwkasAo
 B/wvUD7BY+uYg/Dkn9qdz1+1SjGnpi3iRU3aUspLZd+8c4E2z8INIQ6HWRsr+eIju1op
 J8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hXQYwOotvNt7nBs8RK2HcYpypTegYe76SWSdNP6SpOk=;
 b=av+5A5JusdrR41Z/ichHI01Oy6gQRNuNnM+s05W2voxpt0i8VrjOnoOU7wa0EIYUql
 NDDiOCI0+bDKon/WSs+hkSX5/aKv+97R7RMQvB+HkKApr3lFFN1gKDse8/+ksOnEpKoI
 q60JHbz8zohyX4KQ5RvQr9MiEDqIKCU4JK6jv9BVgiaQ2/YfSdalZsBMO7/gm11D1HRf
 AcfvqU0DpCLcstcS7idTsTmSv3CRVfoxbu6pRkzAguebk3oacI55RfsERLNVzWbusEQu
 7IMXn0d9lBs/NyYgYwMCFitZ4bZ33l9EZoRJL/MGyFBTcXRwYyUThbbf2UzH3q3e9SFC
 AaNw==
X-Gm-Message-State: AOAM531WQvJhzIGPJS1iVq+o0j9B9VeW51I6YY6t3WkaDLBABzcS0XP3
 ixM3Jn4Ep+k6zslenRF4sbZs15kUx+C0FYeFPkBA0w==
X-Google-Smtp-Source: ABdhPJx2Fvi9nAN/wxCPzg1bi9wODMYYJfN+Mji5z+NXA+F9wK2XSoVAsNeYsLL8OavLElsE/D2dsnGOJDc8LVYnGGg=
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr37985073wmk.59.1639399787309; 
 Mon, 13 Dec 2021 04:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-3-atishp@atishpatra.org>
In-Reply-To: <20211204002038.113653-3-atishp@atishpatra.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 18:19:35 +0530
Message-ID: <CAAhSdy3ySJN5NCkUpromH1zQQqfaDPQHmEiMGYEUY5snAd-jFQ@mail.gmail.com>
Subject: Re: [RFC 2/6] RISC-V: Do not print the SBI version during HSM
 extension boot print
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup.patel@wdc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Pekka Enberg <penberg@kernel.org>, 
 Vincent Chen <vincent.chen@sifive.com>, Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_044949_145924_EDF23EC8 
X-CRM114-Status: GOOD (  14.73  )
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

On Sat, Dec 4, 2021 at 5:50 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> The HSM extension information log also prints the SBI version v0.2. This
> is misleading as the underlying firmware SBI version may be different
> from v0.2.
>
> Remove the unncessary printing of SBI version.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/cpu_ops.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> index 1985884fe829..3f5a38b03044 100644
> --- a/arch/riscv/kernel/cpu_ops.c
> +++ b/arch/riscv/kernel/cpu_ops.c
> @@ -38,7 +38,7 @@ void __init cpu_set_ops(int cpuid)
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
>         if (sbi_probe_extension(SBI_EXT_HSM) > 0) {
>                 if (!cpuid)
> -                       pr_info("SBI v0.2 HSM extension detected\n");
> +                       pr_info("SBI HSM extension detected\n");
>                 cpu_ops[cpuid] = &cpu_ops_sbi;
>         } else
>  #endif
> --
> 2.33.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
