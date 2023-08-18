Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF88C7113C
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uVaACIcnMGmp/bGo8pp2vEg37noB1KOrJRL7D4SdiFI=; b=uDAGrp/aT7ZDlf
	+B4dC0uZwfjjmnQ2vjIxXN7mmI90hHJIdN/iTw485LiVdtR2HL7NAhNScSORoNR1BhjFC+2IkqMO0
	21IbVzCLIOq6DdLbEIkBqITbVU9EWqAo2yxTDr7QwPBSSyLWLxUmqtYLUTMPY+wmZnM2Fd9t1wH/O
	LiU28u1IjbfOU2rz8IgtN7w9M8e6refZrMCFQR9Q5O64GJBaLXz8Pzc9YgfW+zn5JcImLJdoTMt7v
	3Vyu8UCHMbp4WPZ9498j/81jaN4wMArIPianwCp5JjfoHqm4o6dy7Q7E7sZr263qzc2pGmSHMuJ7Y
	z/Htft64DLrvbpaE+WoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzNN-009OEU-2v;
	Fri, 18 Aug 2023 13:18:53 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWzNK-009OE9-1H
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 13:18:52 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-688779ffcfdso761924b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 06:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692364727; x=1692969527;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbD3qI39lbOw6xxkLO7d3cqNPb86CrbmsEERY0HKJBM=;
        b=fb98EVQU18p4I1zlKBc/bdGKgp6zXHP8aOT1xj+RIHckZkwZhtwQ0g2/UptKUkV/BM
         84shHFq389pWSy83J6AH7o6PS5DPiUVHOT+LcYpE70NSVy1uvH02yFLBWvnLZPeC1Rg8
         INVFem78FhCaT+GD25Z099lk6txBxEjBkkqygscAc6kfqxxw4Wn1NURAx7CqdYkMxyUJ
         DDpe0wzYiioaVQ3IghdGWo53XT6ooIMQuThImYo73w6Jf1Nl6/lJQr9tq30OWOcyl8aB
         m1qXu0glAm+K9vQ3NjgNxRJzVTOEtamjefQsmcfun/HZeVNKi3sv/BqFaudEpwmCYIkR
         hDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692364727; x=1692969527;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbD3qI39lbOw6xxkLO7d3cqNPb86CrbmsEERY0HKJBM=;
        b=D7eX49ob9KHVg4RHohr2ECLy80Xb8Bypk0oTTDJvoQ3Qrrl8IhfQbfFqrubx+ZQKgG
         toaOYaP21WR+F/wehkhknSdLvDpKE6ZWkBPoShfTlfU33ETkrxAEUBPe3ZtyHeY2NoEe
         T34pPWS6VAPLYazvCfjr2bWqvxcQXYcyIvkD6UCqx9uJIVHjBRieW9UeMyzgvhIOGE8k
         AChL9cdc/8Aa/ftBMjSMtvPrHXOqAwHJ5CYPv3NateP4E8P7G0I1tkPwgux3l9RnLwZp
         ZIxk0pXMMybpmQfeBQ/IqEevPCgisKghudbwA5LIlxyWJrmob8fJ5+/jffAF27kXz/JA
         3jnw==
X-Gm-Message-State: AOJu0YwBB7abN50opfrOJlL7930uWjAETcRur0YPlYLyI+MEIL1TQzgU
	dtjFw2TG0tl6In4x5BSbCqpLylmfa4EHm49/Ino=
X-Google-Smtp-Source: AGHT+IHoek2C14Iem4bCSW/tHEuu0KJ8jn0qnpFQM0qfV3FuQg0/LTwBzSAHXhsxBTjnvo06e+MqrQ==
X-Received: by 2002:a05:6a00:c89:b0:687:9a0b:9265 with SMTP id a9-20020a056a000c8900b006879a0b9265mr2861600pfv.29.1692364727053;
        Fri, 18 Aug 2023 06:18:47 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id v24-20020aa78098000000b006888029fd63sm1527580pff.9.2023.08.18.06.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 06:18:46 -0700 (PDT)
Date: Fri, 18 Aug 2023 06:18:46 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Aug 2023 06:18:39 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.5-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e50f03c7-2a36-48e9-bda4-8f04ff461826@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_061850_638923_13F8444A 
X-CRM114-Status: UNSURE (   7.06  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 7e3811521dc3934e2ecae8458676fc4a1f62bf9f:

  riscv: Implement flush_cache_vmap() (2023-08-10 08:54:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc7

for you to fetch changes up to ca09f772cccaeec4cd05a21528c37a260aa2dd2c:

  riscv: Handle zicsr/zifencei issue between gcc and binutils (2023-08-16 07:39:38 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.5-rc7

* A fix to avoid excessive rejections from seccomp RET_ERRNO rules.
* A fix for compressed jal/jalr decoding.
* A pair of fixes for independent irq/softirq stacks on kernels built
  with CONFIG_FRAME_POINTER=n.
* A fix to avoid a hang handling uaccess fixups.
* Another build fix for toolchain ISA strings, this time for Zicsr and
  Zifenci on old GNU toolchains.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: uaccess: Return the number of bytes effectively not copied

Celeste Liu (1):
      riscv: entry: set a0 = -ENOSYS only when syscall != -1

Guo Ren (2):
      riscv: stack: Fixup independent irq stack for CONFIG_FRAME_POINTER=n
      riscv: stack: Fixup independent softirq stack for CONFIG_FRAME_POINTER=n

Mingzheng Xing (1):
      riscv: Handle zicsr/zifencei issue between gcc and binutils

Nam Cao (1):
      riscv: correct riscv_insn_is_c_jr() and riscv_insn_is_c_jalr()

 arch/riscv/Kconfig                     | 32 +++++++++++++++++++-------------
 arch/riscv/include/asm/insn.h          | 15 +++++++++++++--
 arch/riscv/kernel/compat_vdso/Makefile |  8 +++++++-
 arch/riscv/kernel/irq.c                |  3 +++
 arch/riscv/kernel/traps.c              |  9 ++++++---
 arch/riscv/lib/uaccess.S               | 11 +++++++----
 6 files changed, 55 insertions(+), 23 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
