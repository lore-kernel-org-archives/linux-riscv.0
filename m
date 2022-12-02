Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98C1C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=t/Yr1cu+NOO2wz8EfQq5smU3kUR+tkLfcmrpaPyBrPg=; b=1cX
	V6Z1UTmHU7sIxOqx8j3Kl+X8LFkwI7w4CTLwpcDlutpSiPawK2noC2UyHOeNH8vk36SyKGQYXUmuz
	WYCl9b/vxOwYF+b41vDpFHPtr+Z/ENcbZnBVA7wlJante3/DQvHtWbUEIXE0uOD1/qV+cY1kb4IxC
	vvgNK+70hBW7Aeom//0BK40/2VlF3k6mq4R59hh3+1TI3cEv7c9YHcKnwmWZU8GSVZRU40MBAfmvK
	8W3+PCgW2fM91CjAZVDrh3s8sX8HykxMbUtyq2rEPnrH5eskHFxSj8mVAo1Oxiny2WWSRYO4e3GxO
	lvOHDiew3MRTTAxmDsqjAuHm7DvXEIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19Ln-0009AP-Eb; Fri, 02 Dec 2022 16:57:23 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19Hr-0006qO-0z
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 16:53:21 +0000
Received: by mail-pg1-x52a.google.com with SMTP id r18so4817297pgr.12
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 08:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxL3i93yHy4CBcLBEC/lZOli4Zd30E4xkmWEMKmX6UU=;
        b=Q5fZTvlo9IHzUB1gibPX2necq7Hc7LSBbjGfKMrN+Wtpq22AltCWdZO9t2ycvKQmbN
         Fdr33ngY1tGLVNltrNnjYMas070ID18EyX8f4v6b2t8pbRpv/16tWv5Th6WRlKlfKO/b
         d/AUTnwFK1aC7BMLqmBxoFnEgU2kE7LcdLs/dZNOh+YUIw7DzsFvouiCQ95O3dFYvyKX
         glFyvpOTiNtJJoNlby/SA0R7al2pm2OH0ei9qrBCjtzQjnlSneECKGYyLBvTKgV+MI/w
         rWElJvCfrJ13BHjsSwqWTNyfS6nkbOmbQg7jfCEkwkUK7pbAJokDQSc2L2pjUUZxcXsf
         5hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxL3i93yHy4CBcLBEC/lZOli4Zd30E4xkmWEMKmX6UU=;
        b=UcRGz1weQgkCoDio4FmlD/uDQmYu9v0Q7uyyiqsokxvD6ZMBVwb7K35JltKJsw180v
         Jgp+mX3TkGQqTErjX/IqTSo7nPNv/M9E44R0APwWFKN1D0jEepwWBHZhqBNlF8Nb+1CZ
         YT3emyLJt5+9WB1KP84ymK62KAETl+bQ85IQLSPgRmKKotnF+TgB1J/+J9/4euCuvNoS
         qD5pd57eAcQIzsAMxAOJOpVlyHUavC5oJbiqvuzhuFvuSUHD3J/Q28TQtSfXwGtfMfZE
         JhcgzNja3395khWyujrj372I8cyATVBITf0l4xNR5fU5dLRdMc013ZL7XTqxxODJAvEu
         LfnA==
X-Gm-Message-State: ANoB5pnfG0mmYJB7q3uBCjIUkNw7h/Ou6tPbvyIQRKnTE6aIzO5Su9jZ
	W1vo2Soh2vc1nFX/xWNXfj4D6FQTbeyQFMdv
X-Google-Smtp-Source: AA0mqf4XcprkvnKP2t8i2b2ADdMpFdyCSdNy15ayzXdHGp4oVDTGkKl6zCFZG3OUUv1Ua75MAiJixg==
X-Received: by 2002:a05:6a00:1d83:b0:56d:c342:ea5e with SMTP id z3-20020a056a001d8300b0056dc342ea5emr52763220pfw.71.1669999994875;
        Fri, 02 Dec 2022 08:53:14 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a15-20020aa78e8f000000b005743cdde1a7sm5303787pfr.82.2022.12.02.08.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:53:14 -0800 (PST)
Date: Fri, 02 Dec 2022 08:53:14 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 08:52:57 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.1-rc8
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-ade5e352-1239-4324-aab5-e2fb6a575c25@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_085319_298880_15408CC4 
X-CRM114-Status: UNSURE (   9.32  )
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
Content-Type: multipart/mixed; boundary="===============1638624499560227315=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1638624499560227315==
Content-Type: text/plain

The following changes since commit fcae44fd36d052e956e69a64642fc03820968d78:

  RISC-V: vdso: Do not add missing symbols to version section in linker script (2022-11-10 15:06:14 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-rc8

for you to fetch changes up to 39cefc5f6cd25d555e0455b24810e9aff365b8d6:

  RISC-V: Fix a race condition during kernel stack overflow (2022-12-01 11:38:39 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.1-rc8

* A build-time fix for the NR_CPUS Kconfig SBI version dependency.
* A pair of fixes to early memory initialization, to fix page
  permissions in EFI and post-initmem-free.
* A build-time fix for the VDSO, to avoid trying to profile the VDSO
  functions.
* A pair of fixes for kexec crash handling, to fix multi-core and
  interrupt related initialization inside the crash kernel.
* A fix to avoid a race condition when handling multiple concurrect
  kernel stack overflows.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Sync efi page table's kernel mappings before switching

Björn Töpel (1):
      riscv: mm: Proper page permissions after initmem free

Guo Ren (2):
      riscv: kexec: Fixup irq controller broken in kexec crash path
      riscv: kexec: Fixup crash_smp_send_stop without multi cores

Jisheng Zhang (2):
      riscv: fix race when vmap stack overflow
      riscv: vdso: fix section overlapping under some conditions

Palmer Dabbelt (2):
      Merge patch series "riscv: kexec: Fxiup crash_save percpu and machine_kexec_mask_interrupts"
      RISC-V: Fix a race condition during kernel stack overflow

Samuel Holland (1):
      riscv: Fix NR_CPUS range conditions

 arch/riscv/Kconfig                |  6 +--
 arch/riscv/include/asm/asm.h      |  1 +
 arch/riscv/include/asm/efi.h      |  6 ++-
 arch/riscv/include/asm/pgalloc.h  | 11 +++--
 arch/riscv/include/asm/smp.h      |  3 ++
 arch/riscv/kernel/entry.S         | 13 ++++++
 arch/riscv/kernel/machine_kexec.c | 46 ++++++++++++++-----
 arch/riscv/kernel/setup.c         |  9 ++--
 arch/riscv/kernel/smp.c           | 97 ++++++++++++++++++++++++++++++++++++++-
 arch/riscv/kernel/traps.c         | 18 ++++++++
 arch/riscv/kernel/vdso/Makefile   |  1 +
 11 files changed, 187 insertions(+), 24 deletions(-)


--===============1638624499560227315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1638624499560227315==--
