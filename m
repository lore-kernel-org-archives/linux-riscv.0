Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F16C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yxy+qGcvkVbnDU+xgU/SpX07C/znxxeo5nmUU1Lx0lQ=; b=Jm/q1jyThJZIV7
	97WAbZap/oEJ4BtyWa4ammtSURV0TTV0r9JXWN/ENKVz85emNWJZ8woGD/rgmcD9sZFccrbgBfNEm
	oJ9Wse35OrBt7ZJ294XCFOY8yOA5opy4M+wPlUVd2FqDHqvOcWuj9B3WSd1vDTgTHDsU6At6pH56Q
	hKndGy6EHL32pJ1d7ieRcJMu+QlBKsGav3kY35kGG0x65bTSS30MIsrCuXNpm0hXNpGP7T5qxvmZc
	Hy2h+9lvc6+7UssYS8KJs9bOhLl2kaoymUDFi0lUq/T2dJH4GXIzRv7WjY0UFqWVrroUflfDYa8nb
	7iJQIW6FFzBpNWdshb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjkR-004uxo-07;
	Fri, 24 Mar 2023 15:54:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjkO-004uwj-1F
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 15:54:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id d17so2278917wrb.11
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679673269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6Ngv7vLHp3FF75hEwebNFD1hG5vOf7sA7KcWcOgjlU=;
        b=Hxv6mt7/oyXVS542hr3tqu/KjMizfnZiF3ALCk/BGy17uinbxGYwY4yRdCGwqIKNhL
         VkVy6Thgx2At9vVvRGgE9qgzmQ5mR/xjCpmN/bHeww50tZUpfmYSR1kbB74EgvyACQwZ
         OmRB8HrsCvaHz5Csly8l0V0FF647Nl0tPNl0iFimG4bJrfgO5zp+dKX4G+9qmROVWYl8
         p6K30LzQV9ghXpJYXaTI8z7oPHA+DjAGwrcjK4KnXvlhRylYVpU/w0vItaMNJERluM6k
         ErUIUVFSgf+Vsq7TLLx0tF2uMMcURF3enyxnN7GCJ3qSZyLIBR/dk6+HddWxeS4A0Bok
         Pp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679673269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b6Ngv7vLHp3FF75hEwebNFD1hG5vOf7sA7KcWcOgjlU=;
        b=LcoLdpPxUGLwDjj7lToukMPeyx9nEx77M+Cf7hGWWu0zxbS6JO9smbUDMm0u/XeGKL
         DqrJAAITIV4LuPDd/mnpHXISq5w2409VCq5l+e8QtHQXKeMusf4JVY439XOzz9rYlWCx
         5Sd2/AxGrJdLgZyqTKiA3ks9Gl7aXwkeMyYVvE7f84uqOClC4ye2XwMpYf7P4vLfg1G4
         gdPbH2mcmJMvfWwb5Z6LcaHmXm/CIVvbgzVzwMFAlHKRVpArToHpTu8DAp8odBNfFszq
         J6mOknKf2wwnaVnDcAVcoMvAm1gtaACh2+Rf3467B9v6PvKf2H9QLTcuOPGVKu0KL2tj
         Gz2Q==
X-Gm-Message-State: AAQBX9dlqQ9zzlcX8fD+Z0QujfUjJWluUku+HeDC7BYn8sy9OAMoO8uy
	kJv9YXiDgq/iq6sd9o/PHQOm8w==
X-Google-Smtp-Source: AKy350Zl7H1gg9oVuKX3qg/cXgl51EjhrkA/2eBShL5nrN8+IyprgXSHeuxVL1r0qLjsJp/PpT2aGA==
X-Received: by 2002:adf:e3cd:0:b0:2cf:f467:54d9 with SMTP id k13-20020adfe3cd000000b002cff46754d9mr2664167wrm.53.1679673269318;
        Fri, 24 Mar 2023 08:54:29 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4e05000000b002d75909c76esm11767972wrt.73.2023.03.24.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:54:29 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v9 0/3] riscv: Use PUD/P4D/PGD pages for the linear mapping
Date: Fri, 24 Mar 2023 16:54:18 +0100
Message-Id: <20230324155421.271544-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_085432_614267_02B206E2 
X-CRM114-Status: GOOD (  16.06  )
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

This patchset intends to improve tlb utilization by using hugepages for
the linear mapping.

As reported by Anup in v6, when STRICT_KERNEL_RWX is enabled, we must
take care of isolating the kernel text and rodata so that they are not
mapped with a PUD mapping which would then assign wrong permissions to
the whole region: it is achieved the same way as arm64 by using the
memblock nomap API which isolates those regions and re-merge them afterwards
thus avoiding any issue with the system resources tree creation.

base-commit-tag: v6.3-rc1

v9:
- Remove new API and arm64 patches as it created more issues than it
  solved, thanks Anup for reporting those bugs!
- Add a patch that moves the linear mapping creation outside of setup_vm_final
- Use nomap API like arm64
- Removed RB from Andrew and Anup as the patch changed its logic
- Fix kernel rodata size computation

v8:
- Fix rv32, as reported by Anup
- Do not modify memblock_isolate_range and fixes comment, as suggested by Mike
- Use the new memblock API for crash kernel too in arm64, as suggested by Andrew
- Fix arm64 double mapping (which to me did not work in v7), but ends up not
  being pretty at all, will wait for comments from arm64 reviewers, but
  this patch can easily be dropped if they do not want it.

v7:
- Fix Anup bug report by introducing memblock_isolate_memory which
  allows us to split the memblock mappings and then avoid to map the
  the PUD which contains the kernel as read only
- Add a patch to arm64 to use this newly introduced API

v6:
- quiet LLVM warning by casting phys_ram_base into an unsigned long

v5:
- Fix nommu builds by getting rid of riscv_pfn_base in patch 1, thanks
  Conor
- Add RB from Andrew

v4:
- Rebase on top of v6.2-rc3, as noted by Conor
- Add Acked-by Rob

v3:
- Change the comment about initrd_start VA conversion so that it fits
  ARM64 and RISCV64 (and others in the future if needed), as suggested
  by Rob

v2:
- Add a comment on why RISCV64 does not need to set initrd_start/end that
  early in the boot process, as asked by Rob

Alexandre Ghiti (3):
  riscv: Get rid of riscv_pfn_base variable
  riscv: Move the linear mapping creation in its own function
  riscv: Use PUD/P4D/PGD pages for the linear mapping

 arch/riscv/include/asm/page.h |  19 ++++++-
 arch/riscv/mm/init.c          | 102 ++++++++++++++++++++++++++--------
 arch/riscv/mm/physaddr.c      |  16 ++++++
 drivers/of/fdt.c              |  11 ++--
 4 files changed, 118 insertions(+), 30 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
