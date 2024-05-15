Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBCAC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hAXAcLCH8a7qmvFlqAomFD72slOvY1riSyjCyWIESIw=; b=5GeJw+xd0H3Ntu63geZSHfvlSy
	RQENeb9kCmxpxIr97qT55kM+KipN+qJErkgfCO6qS9fx4AbMco4mS2f/3/fSlz4/0CeqpuIen+r3r
	FjZcUMf2cLsGP+/JDcoD2xhiFY9taS0wGYDUcUFbu2YIo8DCxVze7xAV0bfAkd/DK3ctXju3q1OCr
	r9Kt9BPlp4SHiLmNaePwsb3CgcsUi8tGVGdx25t+0uqTc4dziHrWo5rK3psji3dGOHJlFE3ZfQJiQ
	HMHgmFVB9dI9Y1kKPfIINlgLE2lymK4AGZnUXjgYKdgxjOKhHiCna33uNQsXKx3OkMK5SgpdHu0VS
	Mr9CRK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7I4u-00000002E4u-2u9K;
	Wed, 15 May 2024 17:06:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7I4p-00000002Dz3-0a6w
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 17:06:07 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so43727805ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1715792760; x=1716397560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQQzdQzBGV3DZrL9QqRIhsLoIytzbr5Nn+q/+rp6S9U=;
        b=o2tkPi4ryPDgzH3kDnkrM4PggEOBy7LbJN/IaCsbunOg04xNQVb8FW0DgvQCma1GrN
         ArmTyYzMhsKKyNh7AjxIsNsZPFViv353C9Pth2o/ZJ4/h9LmFmzLbeY0NNu9A7gugwYz
         mVx5JpIDERdCDicDw72Uoj97LAa44qm8QBjvQmgvDdEHPmA2X9I4rufnuy5SsB86PYLB
         Pwev8FPmALK9XBT9M0jE959Fuon/wGD8+amnk2FiZ8Zzw/qy0s5D45PKszDWuDv12Dyd
         0OI2Qp8rpJuZJ1HwQEtr5svn4uWSSppn0At+oEyY3VZwLbWunBrXt5D1GE/ojTGab1Xs
         j0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715792760; x=1716397560;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQQzdQzBGV3DZrL9QqRIhsLoIytzbr5Nn+q/+rp6S9U=;
        b=Rao9rDG/wSr3xrgJ3yNJDyvhuQ/3+p+DADKjj76ukNS+X1SdO5GqaRAQp64qIuS2/J
         Ff5Fsl53k4ZxfN4Reu8XOIAIMfeYHV1FDXgTMdQMzMyKwX57cuOANnlHsd7H9BywOMLq
         2jUxOCfoXWcsKB2AqXvAvcro8o1eAZC+h1D8h7M6/985hKTn8VD898/iT38BjJE7PMzW
         WPzA1/RjkuAng5qA2iwlOdFjrOS0w+s/9htZ9/jclrDKYZBcZao6RgXZLaVEsJeRCpgO
         bD0gQcoUe/U5qb4IYAtsgRqrromu3qdGtJB/tjio2oWq9GKh37fLMbW0xo38Uh+U0KJA
         kIFA==
X-Forwarded-Encrypted: i=1; AJvYcCVypYje0UMAooC0es7bFIrlxg/JLoatgiBer87iM4hDUerOlIzoPL2coWLfluWEtn+w5nza3I+rpbF1W4sQ2tmNYsUHCVvHoVXNizMvEs3n
X-Gm-Message-State: AOJu0YzdTokP9qiRI6PlQyinw2rs8I5Bxe3mmf01KD75rCeZW9vrqln5
	NU5p3RBpfreGBRasMtk686olu/N5TuYzVjy2//HnClfyRPG7zQfAoaZgl/24ryU=
X-Google-Smtp-Source: AGHT+IHcHqSyEX4mzVByjYRHADLbnyHvlA3EH+pwK15IXluhS5E+pQUXzIRMTRRMFI5dY8+8yAW0/Q==
X-Received: by 2002:a17:902:744a:b0:1e5:3c5:55a5 with SMTP id d9443c01a7336-1ef43c0ceb1mr150722395ad.8.1715792759795;
        Wed, 15 May 2024 10:05:59 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf316f7sm120938135ad.164.2024.05.15.10.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 10:05:59 -0700 (PDT)
Date: Wed, 15 May 2024 10:05:59 -0700 (PDT)
X-Google-Original-Date: Wed, 15 May 2024 10:05:57 PDT (-0700)
Subject: Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments to function 'riscv_ipi_set_virq_range'
In-Reply-To: <20240515-zen-calculate-289cfb90cd65@spud>
CC: naresh.kamboju@linaro.org, linux-kernel@vger.kernel.org,
  lkft-triage@lists.linaro.org, regressions@lists.linux.dev, linux-riscv@lists.infradead.org,
  apatel@ventanamicro.com, tglx@linutronix.de, anders.roxell@linaro.org, dan.carpenter@linaro.org,
  Arnd Bergmann <arnd@arndb.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_100603_783831_8D20F542 
X-CRM114-Status: GOOD (  15.62  )
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

On Wed, 15 May 2024 07:36:33 PDT (-0700), Conor Dooley wrote:
> Palmer,
> This is the issue I point out to you on the call earlier:

Ya, thanks, I just hit it.  Looks like it's a semantic conflict between 
21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early 
driver") and dc892fb44322 ("riscv: Use IPIs for remote cache/TLB flushes 
by default").  I think all we need is 

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 886418ec06cb..4fbb37074d29 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -49,7 +49,7 @@ static int __init imsic_ipi_domain_init(void)
                return virq < 0 ? virq : -ENOMEM;

        /* Set vIRQ range */
-       riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
+       riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);

        /* Announce that IMSIC is providing IPIs */
        pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);

as a conflict resolution, which IIUC should happen when Linus merges my 
next PR.  So I'll try and remember to call that out.

>
> On Wed, May 15, 2024 at 04:18:58PM +0200, Naresh Kamboju wrote:
>> The riscv builds failed on Linux next-20240515 tag due to following build
>> warnings / errors with gcc-13 and clang toolchain.
>> 
>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>> 
>> Build Log:
>> -----
>> drivers/irqchip/irq-riscv-imsic-early.c: In function 'imsic_ipi_domain_init':
>> drivers/irqchip/irq-riscv-imsic-early.c:52:9: error: too many
>> arguments to function 'riscv_ipi_set_virq_range'
>>    52 |         riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
>>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from include/linux/smp.h:119,
>>                  from include/linux/lockdep.h:14,
>>                  from include/linux/spinlock.h:63,
>>                  from include/linux/sched.h:2142,
>>                  from include/linux/ratelimit.h:6,
>>                  from include/linux/dev_printk.h:16,
>>                  from include/linux/device.h:15,
>>                  from include/linux/node.h:18,
>>                  from include/linux/cpu.h:17,
>>                  from drivers/irqchip/irq-riscv-imsic-early.c:8:
>> arch/riscv/include/asm/smp.h:52:6: note: declared here
>>    52 | void riscv_ipi_set_virq_range(int virq, int nr);
>>       |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> 
>> metadata:
>>   git_describe: next-20240515
>>   git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>>   git_sha: 82d92a9a1b9ea0ea52aff27cddd05009b4edad49
>>   git_short_log: 82d92a9a1b9e ("Add linux-next specific files for 20240515")
>> 
>> Links:
>>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240515/testrun/23894295/suite/build/test/gcc-13-lkftconfig/details/
>>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2gUiKdxX7qM27ritMJT5pRyZhyi/
>>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240515/testrun/23894295/suite/build/test/gcc-13-lkftconfig/history/
>> 
>> --
>> Linaro LKFT
>> https://lkft.linaro.org
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
