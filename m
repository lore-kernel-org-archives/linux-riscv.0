Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409FAC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Mar 2022 11:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5I4oMmJKNYXuOGD1AWhE39GpOWncQupPG5caqhGikk=; b=bNLfz0/Rox+Lzj
	64KZVH5+zoVWD6JIwWpdf11hd1IEeD8FzDCbY5T2HxmSKTvg8Ee+JHoRHEFBAZNyHe4FCx1o554HV
	5+T8VYPw+cE4x2C6MFHN3TNEIgThwG8FstLVazdM13kv0K/kmOPgvv/UVUi9GB5GnZD35NswBqgfI
	+9wScexrIZzr6nzwBMMo3z/FX5OjASXybbRLo/8What0rqU5HMeEO1avuo3T5Thq9jLJhquLaqbgu
	5uM+RlZkPjxCSN8+41X6AkxfTs/ST/JIgIZzhStOzTZnhSV58Pp848+rAdrgLrfrjJogo5lVAIzcT
	MPv0Nv39N8HaE+xf2Nag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVXQy-003gMi-0Q; Sat, 19 Mar 2022 11:39:48 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVXQv-003gM6-TU
 for linux-riscv@lists.infradead.org; Sat, 19 Mar 2022 11:39:47 +0000
Received: by mail-lj1-x236.google.com with SMTP id r22so14277869ljd.4
 for <linux-riscv@lists.infradead.org>; Sat, 19 Mar 2022 04:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y5rb/Yqi5NN7XZ/MmiRVeK5TPw9M1I0RZCaA66Lu/5w=;
 b=KAPBlkaGiCLm9fcSwqKhNljOouS1ZmsBfDXkobBg2aZkvyDAqe8q+MXw+oNH5r+VY8
 3PQZAK48cKbABd9QS5gKUCURdcgo/lnSbHky5A5WTjTcylzSAQwzHM1E3CoGNyW4H4/Z
 laOJCo8vmhbk0lQa6l6Le4b72IbETDg9kr60QlgfXcEKoxdcxzJ6NWK5GmuMfjzNHVDw
 4QO06SbphYbjVAc+wglXcHVEQhuiu6y05BShmHMBvdVy9muQsZ9ZL2x86maRI8hONtVP
 2PbTrD3ckJRvwXWlZIKgywjJiIQy2QBq6ivPPezlX+ItzMcs6RtMABkG78DodSnj+w+I
 p56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y5rb/Yqi5NN7XZ/MmiRVeK5TPw9M1I0RZCaA66Lu/5w=;
 b=HLJ9ENuf53RJKf6CIL2f/N6CLg3T1NCDD+bgC+sTA7FnDEDHhw5LuxhhQIyN1OrCnd
 /hypvK7K4dxvlHJB204Vd2HsD2y7Xd/zHkLW7yci4K+rEZWkrdG/tAkEbDdtwTGHgb0c
 zqawrXcfrDlIWgnPYtSgBiKgRLU1n6ieJg3kIzqMxV1yTU5BlFFSi6ACta840e2f0bdN
 PoQcDBBj4kbJjdzmnH8G223JvH0RDDaaMs1HegWmCiS9SHokQ2EIgLAXyahjgfGoOWxs
 rCsfe9N204vZwu9MN/f/H3PWfwODjpBzCF2nH8Ok7Hh5rM6VGxeK0OurQql/KtFD1trq
 vuzQ==
X-Gm-Message-State: AOAM532+qCK64uzSDjlx16wASYuedU5bnDWw3jAe/AEQAquf17/McQuO
 358n2pUNO9lnw97ZIMkW5U+4JnOXEgNby4mfddW8EA==
X-Google-Smtp-Source: ABdhPJzROACa86AklSBYVBypFM4Wj7ORn2S6CpOACIDdXjNIhVDWVaICxTHt7pGEUv8kGzRGnNVXg/ZQKN8a8lgOiUE=
X-Received: by 2002:a05:651c:2123:b0:247:e3b1:da81 with SMTP id
 a35-20020a05651c212300b00247e3b1da81mr9197167ljq.34.1647689983405; Sat, 19
 Mar 2022 04:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220317035542.272547-1-apatel@ventanamicro.com>
 <f1079093-54db-bd20-3342-b06d069c5d1f@codethink.co.uk>
 <CAK8P3a0Gt7TOT2zpNw7YNR=MNLBWVAADL5dBgY15ZL8sDW20HQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0Gt7TOT2zpNw7YNR=MNLBWVAADL5dBgY15ZL8sDW20HQ@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 19 Mar 2022 17:09:31 +0530
Message-ID: <CAK9=C2XGgfEZ890DgKmPXKw7=1BjnP-2L+_bpx+efX_rnw=_Nw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Increase range and default value of NR_CPUS
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220319_043945_982638_7031F265 
X-CRM114-Status: GOOD (  20.04  )
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

On Fri, Mar 18, 2022 at 8:44 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Mar 18, 2022 at 3:46 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> >
> > On 17/03/2022 03:55, Anup Patel wrote:
> > > Currently, the range and default value of NR_CPUS is too restrictive
> > > for high-end RISC-V systems with large number of HARTs. The latest
> > > QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
> > > restrictive for QEMU as well.
>
> If qemu allows 512, what is the reason for limiting the kernel to 256?

There is no particular reason. I will change this to 2-512 range to match
the maximum number of CPUs supported by the QEMU virt machine.

>
> > > Other major architectures (such as
> > > ARM64, x86_64, MIPS, etc) have a much higher range and default
> > > value of NR_CPUS.
> >
> > What's the memory overhead for increasing this?
>
> It's supposed to be very small, I would expect three main sources of overhead:
>
> - cpumask_t variables, those grow once you go beyond the size of
>    an unsigned long (32 or 64 bits), so with the default just on the limit, this
>    makes no difference.
>    Note that you can run out of stack space with NR_CPUS values if
>    CONFIG_CPUMASK_OFFSTACK is disabled. Should not be
>    a problem for 512 or below.

Yes, the rationale is to have default NR_CPUS such that size of
cpumask_t does not change for RV32 and RV64.

>
> - percpu variables: these are dynamically allocated based on the number of
>   CPUs at boot time, so they should not have any real impact.
>
> - NR_CPUS sized arrays, these are sometimes used in place of
>   percpu data. This is only a problem if the array members individually
>   are more than a few bytes. There are not too many of these in the kernel,
>   as using those is discouraged.

Separately, we are also trying to replace NR_CPUS sized arrays.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
