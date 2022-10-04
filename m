Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BAAC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 23:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jB19mcKNleQQhj36vVNm7L40/DQiynqVWC3stFtg7y8=; b=FMZo6IsCh7k42WdrveUebloNcT
	2FizWJ9kXv+vz2t7c2TlQOdoOsxpHtAZFpfAtkaqQamr+CXPRgQKKzN7NPcMHAY6cK+nttWcbrs94
	E6aipHiPxZBmYhKNQV8vnWjw2oWGIbo227SmCvAayIokrbLr7AGqV1qPQthdNhmF8KUPRlcDII7t1
	ghYpV1N+0YMl4kUerIrmdBrZrX8I3rvrWUZlmGrc8aixrQLJ7ZlFlcTx7R2KPZDTuDGJwuNJSOUb2
	lpmmA5bO01oaeLdJvKASxSEs6dRimrb5/dAVvo30HElVlH5ThWyGIJWEDicJard9UARMrL1FBsW2m
	/9NgbEHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofrj0-00BamK-4p; Tue, 04 Oct 2022 23:53:22 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofrit-00BaaT-GA
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 23:53:17 +0000
Received: by mail-pg1-x531.google.com with SMTP id a23so6265388pgi.10
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 16:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Me4MtrhkzwJ/+NLdmToxO2yl0aqX6DoqofwZcoelHg=;
        b=AR7bf0iAVx4nuUqI6C2YPK4bvX5RRdEhmEEMpd8ltbpZwoqKNZgTz+R59HUuZttpAW
         FRLCpuOTAumssWjBZviJDBzkEAn5zsrhZi9x1B10Zx4afUS+4G+kwM51FCcpKd93qAjS
         q187NUk+1tD4nzN7AL5bY8XfwAbzGX1nYCWph5diKNf0k8CO4f8nJorLzoJnGGEQCXIF
         4utx6Yu2xGr8+ZOtnt1nT7jZmgo4vyextjXtSUUN/gXxNAxqfey/9aAyzd5QrP4ymy0I
         0q5Ez6DNUN5S+Xx8xZS3OLkkdb9Shw5f+MN9oJst/6i/bT+K8ZNO27D1cMpRWGkx3ZkU
         DuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Me4MtrhkzwJ/+NLdmToxO2yl0aqX6DoqofwZcoelHg=;
        b=fXDTP5mJ8DwUS6ZuyH6HkpcNQRA77j6ZzRJ22WpF12pWZW0iGWFxwh19k5OG/IZxe4
         GYKg52YrLo8DWO1LiMvSX15Qrryc29kRd+lvPNPQNSwdaiOuZyJGGnt6ZTiIwX2TO1tN
         /X2QIkgw1fTydZMcZEEXWUj/8seedoFVxFYNbeXy401Sh3k26FhW4CHJnbuMxdd/hSK3
         +D8Fl1bNZNAt2PJAhxRiNXvZl9SVLEsmISTcP44jEwTkckIBZBSRr64yI3PCjjbzpCNJ
         bi+TJICL+C/KPj9XiuvyWq4z/J/W6FMV1hG3G6FcFliH43QXzshHiVURceRKTFhQiw8Z
         vSyQ==
X-Gm-Message-State: ACrzQf1j7qnWiXCvsJAJiPCQoR6vRIkJJvFvssFZ7ZEJDcfWwNe3wy04
	wyWQNMc96VQhbb9oCfKDhAN+2A==
X-Google-Smtp-Source: AMsMyM5jTp6XHAJzlLg7NZSgkkC8npqddXYgcsYEEZRklZmzdkq4aKdmfDh3gGaDlzI2DVQ/0IZ7zw==
X-Received: by 2002:a63:91c2:0:b0:44b:89d5:715 with SMTP id l185-20020a6391c2000000b0044b89d50715mr13709124pge.304.1664927594082;
        Tue, 04 Oct 2022 16:53:14 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id n6-20020a170903110600b0016ee3d7220esm9566668plh.24.2022.10.04.16.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 16:53:13 -0700 (PDT)
Date: Tue, 04 Oct 2022 16:53:13 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Oct 2022 16:52:37 PDT (-0700)
Subject: Re: [PATCH v3] RISC-V: Increase range and default value of NR_CPUS
In-Reply-To: <CAOnJCUKUTt1VfU+wMfxE4P21ttW5uaegXD+0oq4O4KgpGOWhaQ@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
  Alistair Francis <Alistair.Francis@wdc.com>, heinrich.schuchardt@canonical.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, apatel@ventanamicro.com, anup@brainfault.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-1bcc94fc-bb33-4caf-ab65-fca155189645@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_165315_782905_34A02BC8 
X-CRM114-Status: GOOD (  30.47  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 18 Aug 2022 14:29:03 PDT (-0700), atishp@atishpatra.org wrote:
> On Tue, May 24, 2022 at 5:08 AM Anup Patel <anup@brainfault.org> wrote:
>>
>> Hi Palmer,
>>
>> On Wed, Apr 20, 2022 at 4:54 PM Anup Patel <apatel@ventanamicro.com> wrote:
>> >
>> > Currently, the range and default value of NR_CPUS is too restrictive
>> > for high-end RISC-V systems with large number of HARTs. The latest
>> > QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
>> > restrictive for QEMU as well. Other major architectures (such as
>> > ARM64, x86_64, MIPS, etc) have a much higher range and default
>> > value of NR_CPUS.
>> >
>> > This patch increases NR_CPUS range to 2-512 and default value to
>> > XLEN (i.e. 32 for RV32 and 64 for RV64).
>> >
>> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>
>> Can this PATCH be considered for 5.19 ?
>>
>> Thanks,
>> Anup
>>
>> > ---
>> > Changes since v2:
>> >  - Rebased on Linux-5.18-rc3
>> >  - Use a different range when SBI v0.1 is enabled
>> > Changes since v1:
>> >  - Updated NR_CPUS range to 2-512 which reflects maximum number of
>> >    CPUs supported by QEMU virt machine.
>> > ---
>> >  arch/riscv/Kconfig | 9 ++++++---
>> >  1 file changed, 6 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index 00fd9c548f26..1823f281069f 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -275,10 +275,13 @@ config SMP
>> >           If you don't know what to do here, say N.
>> >
>> >  config NR_CPUS
>> > -       int "Maximum number of CPUs (2-32)"
>> > -       range 2 32
>> > +       int "Maximum number of CPUs (2-512)"
>> >         depends on SMP
>> > -       default "8"
>> > +       range 2 512 if !SBI_V01
>> > +       range 2 32 if SBI_V01 && 32BIT
>> > +       range 2 64 if SBI_V01 && 64BIT
>> > +       default "32" if 32BIT
>> > +       default "64" if 64BIT
>> >
>> >  config HOTPLUG_CPU
>> >         bool "Support for hot-pluggable CPUs"
>> > --
>> > 2.25.1
>> >
>
>
> Ping ?
> It would be useful to include this patch sooner than later to enable
> high HART count testing by default.

Ya, I think that's reasonable: the higher CPU counts have found a bunch 
of issues, but they're not really Linux bugs and stopping folks from 
running them is just going to stop those bugs from being fixed.  It 
seems like these higher default NR_CPUS are stable on smaller systems so 
that shouldn't hurt anything.

I'm still getting a bunch of issues when trying to run the larger CPU 
count systems in QEMU, but I think it's OK just assuming those are 
long-tail issues that would manifest anyway and are just more likely 
with the higher core counts.

So I've got this on for-next, under the rationale that the new default 
CPU counts are safe.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
