Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFC6C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eaY4o5SY6w9Z9LmN0veYCLqqWt76hMULWf7m6XHi6YM=; b=C5i4xnJiqmXyNA
	DesruwF0ZHaacBfrSfm4kSIEgsI5KrjPL4LP0jOTWubZU8fUC2DioQPjK6OFxFCNUgDI7jjsc9gS8
	I9CUcplsVY7tfrxIeCMENcSXt384DQDljllc+5FFC9Glbmatayeu1g/YY/wxYr40SW3CG24UUEQ7H
	No3Diq+nhhpYtKoAIBZklLfWkjbrcoXLTR52rsqeEpPCE2fGgNiH4AtCAigiqUnU0OisWP/vk/W/V
	hZIGX7SZD+jFsuV2rDgp0KNKKt8OiybVOH5HnO4tA/Uwq5+1x7Jggk0Iqpn1kjXCw33B1wN6AEq51
	QLnXVoPi8xX5u4dXoCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7FTO-00000001myQ-2psJ;
	Wed, 15 May 2024 14:19:14 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7FTM-00000001mxA-29o0
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 14:19:14 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3c9b94951d5so845229b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715782750; x=1716387550; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a9+nEjIRGhMjrhSd4waxnxR1U1OPOKlFj61G/GYKSuU=;
        b=ocJG9Y7oI70TyEaggUhJ4fo1uRFYC0A29ciJAXRurijnUkRepykByjzwXSr1d0pezP
         B8Biwh5R5JYhy9Nl0GmOxVMUn9ZfiW8oTitlT4Zk5P+HiMaCVLZIV5RfJ3DGE4wdznx6
         8fXTxLvtbz3YbiT/gmQnIaxNrz/bKLCCLoODORIYuuUoiHpIHDo2rLJ1VqGqBLV5EyxN
         YjSjmR7PWBGxmZX6YRLUeLRNwnyfhcFk5TOiDPWnF12c8uzv/QUt+yCSftk/MV7IyKDO
         y/bwwYmZWqdZ8tD0w7Lnqs4fhaTkq4waYGnS4c7bLKRrc2ggWjn7mLqo3VVb3/4ht5Lx
         9Ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715782750; x=1716387550;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9+nEjIRGhMjrhSd4waxnxR1U1OPOKlFj61G/GYKSuU=;
        b=hrqj6g8QpvOZ4HYdl3HJo6WKiM+eyJiM+ERUnPdeB49iZyWYgXPMPIMCu2xgZYB0aU
         Pm63nNs89bMNCEVEUjCOd0dkzzTzpH4bN8RIztv8dJCXTURNoW9+xccPwJ4Ih+m8sxAc
         LGnb3GNxzwZprfTc7R0FSTe4KbVSdKahOW4JMuMQStCNgI3fm/xK9/9QaWKb4xMUsmI4
         WQcCcycTslRBngkWBNMVMxJT85rTusEQlq2XBBqnzuo9QgPHAJcWTx1K7q6cI4lw1wWl
         P6tDQFI3lMwNZzO5uQSFw41v5jsRdcmAV0nz/ljLWb4Coupe38p37iF+nSKtRVPQy03K
         fVmA==
X-Forwarded-Encrypted: i=1; AJvYcCVvehmNwLsW03HqlcjZTiE+ihnLT/VPtrFiEVxBqXULSFhwnK2dTcT3apYvx9VRAVSL80ceCTEg9X/mWKKtBPOmgyxBsiZQVhJEf+gi3xPQ
X-Gm-Message-State: AOJu0Ywlf29V7zubHNwK5+Q7l5Taut4bAlkKOa1qFmyIW7gHrUPoeGa2
	qwPdwisjmJPwppkUWK4gK7vPiuOVV4zdPQ1TCkhQvh726SorYgXKdzsoybVkJUcmMSC7w8T4t03
	xrIW2iRP3hWNFPvGNQyyxCeGglHguX/K2XQwUmg==
X-Google-Smtp-Source: AGHT+IH/7/dqPY9r1lhR5haX5AIQ/98Ll9YuM9T0D4wFA2HFYmBB4m8nfB/jKUjlQdttEXRU3o5RpwBPOQ1s/m/TNvM=
X-Received: by 2002:a05:6808:2d9:b0:3c8:65ee:6795 with SMTP id
 5614622812f47-3c99704cfbdmr14936618b6e.22.1715782749719; Wed, 15 May 2024
 07:19:09 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 15 May 2024 16:18:58 +0200
Message-ID: <CA+G9fYtDtgb8zNGfDQPS2u_n_45rDiDgJR6ud3uuxkJBR0rUzA@mail.gmail.com>
Subject: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments to
 function 'riscv_ipi_set_virq_range'
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_071912_605439_4D0F0AB3 
X-CRM114-Status: UNSURE (   4.56  )
X-CRM114-Notice: Please train this message.
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

The riscv builds failed on Linux next-20240515 tag due to following build
warnings / errors with gcc-13 and clang toolchain.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build Log:
-----
drivers/irqchip/irq-riscv-imsic-early.c: In function 'imsic_ipi_domain_init':
drivers/irqchip/irq-riscv-imsic-early.c:52:9: error: too many
arguments to function 'riscv_ipi_set_virq_range'
   52 |         riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/smp.h:119,
                 from include/linux/lockdep.h:14,
                 from include/linux/spinlock.h:63,
                 from include/linux/sched.h:2142,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from include/linux/node.h:18,
                 from include/linux/cpu.h:17,
                 from drivers/irqchip/irq-riscv-imsic-early.c:8:
arch/riscv/include/asm/smp.h:52:6: note: declared here
   52 | void riscv_ipi_set_virq_range(int virq, int nr);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~

metadata:
  git_describe: next-20240515
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 82d92a9a1b9ea0ea52aff27cddd05009b4edad49
  git_short_log: 82d92a9a1b9e ("Add linux-next specific files for 20240515")

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240515/testrun/23894295/suite/build/test/gcc-13-lkftconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2gUiKdxX7qM27ritMJT5pRyZhyi/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240515/testrun/23894295/suite/build/test/gcc-13-lkftconfig/history/

--
Linaro LKFT
https://lkft.linaro.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
