Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F7CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 09:38:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1437206A2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 09:38:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YSXxfvLm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Fz9wPF+N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1437206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lu7Hvtcqrayf8pO6546R8gZxY81ECjWRDzvLWOFfMK8=; b=YSXxfvLma/dQeP
	CIPf/rmJu+q1h3PYmFdER8izHHA+2eh7NNf+tST5PK3+1q4q2TTg8SShBlNMiPqo0bLpwClpGMDFC
	LxGXEVH6fbsYwhrFPa9QdrBfh/XY38dVs7o5lfXm9IRYB+tlIEg34LJadsljhPclcF/DBqbw961/d
	aGwKFJZyhXmT0BnLgFxXTDe5OSWvIrvepxCpKVp9cSu6VCdJur9cjFInpp1uWcdBFfYbcAYNvkYj2
	Rdi8Z99Mvns96vDkS3itrNwrO1W8bRLiTcxaIxA470W6c5iowflhcvS9Hbv5LbBylRB1J41YNJDYq
	XKk7hRFWRJXq8UHLbRTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYpM0-0002Zt-NQ; Mon, 17 Dec 2018 09:38:24 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYpLx-0002Yl-O0
 for linux-riscv@lists.infradead.org; Mon, 17 Dec 2018 09:38:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id q26so11816732wmf.5
 for <linux-riscv@lists.infradead.org>; Mon, 17 Dec 2018 01:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WJwrEhYVcOS1F6tTiFDPmQ6QHY/esy3VZ1Sp2iKa5mI=;
 b=Fz9wPF+NzOq5IGgIvRMui1XEQ4DJjdPDm4/lPjT6GkHtrXm9Sp1Ns/oVbrlLoTFWoO
 9X3bpJ10/dsPRQsILCXMEz6pBqfG0c+qleFDnEnSvpaGendtytS5ehJzC2q3mRHhuaPu
 Eo/hM92XCYmY8YSWm/ODlKjzj+MRUctzW/oytDatwm4/EVUdHJ7d257LcgQvLqt7xuJX
 o5qQA36rzocYuxe/CgHQayajH0AmSmfKQCtSyVxF1XkYAll51dX9bFHEvFkYDYReOoWG
 Y3kci7vNFjmSwY22etchyNOSspA/v5T57VTrxiXJigeOWROmG8amYSVCMaGWiz8PWSni
 vEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WJwrEhYVcOS1F6tTiFDPmQ6QHY/esy3VZ1Sp2iKa5mI=;
 b=cpLl5L1G9AC55auy1JOKDe6+KLRdU//01hqU1h10S9PlTq9bhewrFhKO8mnaOTYSy9
 AC5izUm0oYJQEHNlX6DwtUkBsmlU/DXxXCHGBetRMlzlfBL3FNsBUVCBL2oIsFe0UjkY
 baASuYT700PsJfD1VxZA5cGrw3tBTADhO2bnM4A8mQAF0Ao2lt6szL078QSdaevYoluU
 o6X7SOchTPeGz9No7i4NaKh0IxHUvYgjivS178Q5hcbPFk+oiIGNH5NOLizgfNucn1OO
 /hNaNzkBGUShpxiMT4P/dUFSIeyR71WUrB1LpJyTivLAmMT+g5AdiTsceJnkTQXjQ9ME
 bQOA==
X-Gm-Message-State: AA+aEWaMIE50aVMfXVgXIavNAdLs1v24kBGR8FF0YaYR42g/nZpygHcQ
 eRS8Ume7VFK9Z1bPKv5ugunH6+apda1aKWNMnj2g943d
X-Google-Smtp-Source: AFSGD/V24/x7B5xet2NxYUhGEwvBZdr9bJH2zjH4Q6wca2LGH3+YR66J6KpVcnWavGl/X8rCrAqXI8aI82YNN2WnqsA=
X-Received: by 2002:a1c:9a46:: with SMTP id c67mr10132126wme.21.1545039489764; 
 Mon, 17 Dec 2018 01:38:09 -0800 (PST)
MIME-Version: 1.0
References: <20181130080207.20505-1-anup@brainfault.org>
In-Reply-To: <20181130080207.20505-1-anup@brainfault.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Dec 2018 15:07:58 +0530
Message-ID: <CAAhSdy0t9H4VMSpoZy1Xt2caW_BxOfEA-x-QhnMsbzXned6AUA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] IRQ affinity support in PLIC driver
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181217_013821_783776_A917A141 
X-CRM114-Status: GOOD (  14.87  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 30, 2018 at 1:32 PM Anup Patel <anup@brainfault.org> wrote:
>
> This patchset primarily adds IRQ affinity support in PLIC driver and
> other improvements.
>
> The patchset gives mechanism for explicitly routing external interrupts to
> particular CPUs using smp_affinity attribute of each Linux IRQs. Also, we
> can now use IRQ balancer from kernel-space or user-space.
>
> The patchset is tested on QEMU virt machine. It is based on Linux-4.20-rc4
> and can be found at riscv_plic_irq_affinity_v3 branch of:
> https://github.com/avpatel/linux.git
>
> Changes since v2:
>  - Fixed incorrect address of enable registers using sizeof(u32) in PATCH1
>  - Retained comment about need for locking in PATCH1
>  - Split PATCH2 into two patches
>  - Split PATCH3 into two patches
>  - Minor fix in commit description of PATCH4
>
> Changes since v1:
>  - Removed few whitspace changes from PATCH1
>  - Keep use of DEFINE_PER_CPU() as it is
>
> Anup Patel (6):
>   irqchip: sifive-plic: Pre-compute context hart base and enable base
>   irqchip: sifive-plic: Add struct plic_hw for global PLIC HW details
>   irqchip: sifive-plic: More flexible plic_irq_toggle()
>   irqchip: sifive-plic: Add warning in plic_init() if handler already
>     present
>   irqchip: sifive-plic: Differentiate between PLIC handler and context
>   irqchip: sifive-plic: Implement irq_set_affinity() for SMP host
>
>  drivers/irqchip/irq-sifive-plic.c | 143 +++++++++++++++++++-----------
>  1 file changed, 90 insertions(+), 53 deletions(-)
>
> --
> 2.17.1
>

Hi All,

Any comments on this series?

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
