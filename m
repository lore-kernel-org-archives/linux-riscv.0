Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAE2C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8uikFvgg6E/hO/K/swN6ueTrmfje2pr2plERtEZaRwc=; b=ZrUOrbwV0nIWf0
	ZvSj/D5iwmqcfFvE5lOCnL4kDkj5mPeLWvbW/zLhkyvbecNNp/tzEoR6rqnMhJ7pyjNfYX1bkeEeO
	t44pxBkSSODkMhZnF152LEI72y4BmMxxo5zrPSm+0PTllKPy9plin0knaWPUqdaSUWe+yhoTp3oSZ
	dbCfaWFffUvFBvqWbqWPYbO1QzRrygUBz+qwIpWlSOsxFVz2qRZXwZknae/sF4OhtdpfW1TJjU9jM
	lnc0w9rCuUSHTSyCLGwDWf9LxNIqvI+SMtuNbK/3r+Km6pdn2Y/o63dBKzg3NXAKScGPeaDZxU4yQ
	9SJZ+tTkDL1mGsClVSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfif7-004gPc-17;
	Fri, 24 Mar 2023 14:45:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfif5-004gOq-09
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 14:45:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id le6so1965545plb.12
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 07:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679669097;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZXUPhMi1ETDwZe5lY9GB/SQK/ctMF989jSe1q7ilEo=;
        b=VT0WWYHZM0c6swX/cYjunSRPofSmuS3/hHpt0Y8bB4EeHbgzKWTreQKbGb+hHOADKs
         q/T480zMx+/n00LaEj8chlCkZzzf874vpzKDHOIQVB+EXB8BUG24LsaJHl1tA1dI14W3
         jN9NxWfE86v9zmFicFXHS2Ae2Ozq0PYaFnrgjKccYoTCpbkcSbw++X9/PvZnfSnRxq4T
         INRSp01LOTdb/3xl9gRdOAgequdCxNBoXvgGC4rlwy1xh3zz3AWfl8a92JObpJb6yWVj
         EmVGZqUfIEi6db/IznuHwTgW7TAkVo1sjKcMCHPMqZp5S9D5TK7nOZbCzlfF94c8IP1g
         O+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679669097;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZXUPhMi1ETDwZe5lY9GB/SQK/ctMF989jSe1q7ilEo=;
        b=aTk/4uL0Ku1+tMBImOYO+SEi8bFfYz4kAbGpmY5e0/VJTTO0qPY88+dPgnGTc+W46n
         NsxeBPEYLG0NYLIj1cC1BYs9OkZVnCsU1yucb5PueiQ4oMo1a80w+UxtN1GzZeXkNBLK
         bHe5tz65IMgL9pg97ZvOK+nc1/5qqTexCkf1Cm5n8oOWHULXTJz5XKl2nOMXHR1GBlmC
         jH7G9ZoWXHFL23e/H9ht1GKW1OSuorp2edhHlFg39mvfgbYsTqMalvHmEjgp4s/paLna
         IBvktkJre3cGpB2F6Ygl/Fbw6bHTxApA3+eiVIf+Ag9SYCd8cIwgLrkuSNYpc2dojLac
         s6kw==
X-Gm-Message-State: AAQBX9epyvWolI85YSpnt4y/uduXitNdoysN3vSJz62Ioy+3AmaExTtb
	J6turB4x5g+fDLL4zYhPA/SJANhHqpTvY6hxTcA=
X-Google-Smtp-Source: AKy350bt+TteTHm7dnhroYzhJ0u8eIFGFhXPPksXeIxCNwVC689tSlL6Daby7LAaHZbHN3BNz6Pmpw==
X-Received: by 2002:a17:903:1103:b0:19f:67b1:67e with SMTP id n3-20020a170903110300b0019f67b1067emr3734746plh.49.1679669097085;
        Fri, 24 Mar 2023 07:44:57 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id w5-20020a1709029a8500b001a064cff3c5sm14260697plp.43.2023.03.24.07.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 07:44:56 -0700 (PDT)
Date: Fri, 24 Mar 2023 07:44:56 -0700 (PDT)
X-Google-Original-Date: Fri, 24 Mar 2023 07:44:36 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.3-rc4
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-4d782094-e4c0-4626-a038-78e17e33b19e@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_074459_296475_C209ED02 
X-CRM114-Status: UNSURE (   6.74  )
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

The following changes since commit 47dd902aaee9b9341808a3a994793199e7eddb88:

  RISC-V: mm: Support huge page in vmalloc_fault() (2023-03-14 19:15:34 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.3-rc4

for you to fetch changes up to e89c2e815e76471cb507bd95728bf26da7976430:

  riscv: Handle zicsr/zifencei issues between clang and binutils (2023-03-23 12:52:49 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.3-rc4

* A fix to match the CSR ASID masking rules when passing ASIDs to
  firmware.
* Force GCC to use ISA 2.2, to avoid a host of compatibily issues
  between toolchains.

----------------------------------------------------------------
Dylan Jhong (1):
      riscv: mm: Fix incorrect ASID argument when flushing TLB

Nathan Chancellor (1):
      riscv: Handle zicsr/zifencei issues between clang and binutils

 arch/riscv/Kconfig                | 22 ++++++++++++++++++++++
 arch/riscv/Makefile               | 10 ++++++----
 arch/riscv/include/asm/tlbflush.h |  2 ++
 arch/riscv/mm/context.c           |  2 +-
 arch/riscv/mm/tlbflush.c          |  2 +-
 5 files changed, 32 insertions(+), 6 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
