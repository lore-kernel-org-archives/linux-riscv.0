Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7999CC369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 17:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=XtK11B3jkmIhU/GmMlZq1+VYLmsAjUUs6I0EsTpDp24=; b=km1
	FGqa+oZgQHP36BYk9x58kM2x32Ix7fmHsEOcMA6GHyBWAMkEYcn12NfQahtLIIQjLX90X6VM7Wxv7
	rMIDvxSbdIn2kHvkLLNAXHH305t4a8hGnqIsKUQKiwwNTnsQnnztCVHQi+04fgZ1+hO9Wv/+tJCJm
	h3+PUbKndYyfejFXS2gGMet7SIBGgFREQZOFAS/qbWc5WDML1WMV7ZgyssM2R6NHFRC58u/1Y3ZLD
	vmk6/fUb7u/TF42r9h7TIQWj6JNxQyTpEbFLx7ezGj+NXUq8O0M2cLWvWHuDsQh7dCnHrkI5KZWMH
	2O/4UZdFLqCCOBDkhE1yMHuOrIBCvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5pla-0000000HILp-2B0B;
	Fri, 18 Apr 2025 17:44:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5plY-0000000HIL4-0Nb6
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 17:44:41 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2254e0b4b79so31126285ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 10:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744998279; x=1745603079; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2sScoLYMaDn6o5OZxST51MbutXhshEvaoFDk5vxulw=;
        b=EAOu5dMimxEGQTra+slZyDC+Vncl5OD2gbljRqkg8+lhfdACrBIbnlDAEdMgSKlz8P
         f3De0ivY/JaBy1Dg4I+Pn0VP8fsF0f2yVCHJbWGibnJjs4+oey3lve1NKTvrE9H1R6Gm
         AMaT20K2HEnrmvKGgAqqe3zskfCuFqjuIN5WaLQ20yTfDwa/mbwVuSNdwGrg9aB9uKHa
         lu4Xsm+DyNWjVE1vvMkrkxlDCdz0JMx0aksWhas06/hrfy9JfhZ0OgP3u7BZKJK8CkEd
         1aoyw7GcBQ2dUHCDtsBkSoCGhjluOajSwjjAwLPxz2QoTLe+7ovGVVJzjGYYsHDn0ZLm
         G9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744998279; x=1745603079;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2sScoLYMaDn6o5OZxST51MbutXhshEvaoFDk5vxulw=;
        b=CyVZQHil4L/4tM3rEZ/GAv+1WalX5hh4WfDmcaobdfWj807/LNa0FBbW4ebkyv22aq
         3Yp3ZDVxD3Rs7dNoZS85huLepVWH7ZuNJk/0cASgxfIHt7KHieam+WEsrB10ZHLWrlc8
         PKlt9gasUnyHyccMMr7E0utfeEyRLDxMNyoWW6rbAGMlJvhVEXDhwfsea/CLGVrneCnR
         CbsBZTuEU6JNtxA0Daez19VhtwQeNdBcrY0ia79MujufkN6VdHGrmSVm7nYd4JwIXlCa
         kZs7CzY8YdQ6ECl63xJZ02ubJ3GrBYUcFof0eMUH35/YGGmidI6T6adJHNHFV2b+hQco
         bF+A==
X-Gm-Message-State: AOJu0YzU+tMtXKTMOv1ymuzwFikkjWwn3vjQ2LXeOEXdG//RS/M/x9A6
	GuDyxY4idBfHgWwaFJGzDRVMFf1JCndSRKjFOSM440uk83GAj/LVwe5xoWgkftMZcjrnZqYApJG
	0
X-Gm-Gg: ASbGncsVbqJUCciQX5lGM6us7eCbLibH6zZ62ncTtgyaohFyjB6q1mYPHijvAkrgv1+
	yUZ+5Ry4gSHgUcltSk+Fjw1+hvPZyThH8zgRFHX8ArzlLNF3m1lLs4x/FJIeY8Cvbe7BxKyIRdK
	HGmo7141wWGWjvuTv6MlfUF1lfOWW+eUCfyPjzIdmA9Phw79oX8Uuqom4ua4B3RJ1Jg7GFDmst+
	qUJ7ir2ONmN4RAiM+oo5O8eSYJP6JVNlQ5YIlZiYkDqlTZdfTvn1tu7Y550OuLB8rn5epPVI01t
	HasFfwg4fplAvVf0NtPSnSE/V529UoCGvtY=
X-Google-Smtp-Source: AGHT+IEmnUz2ElBuRHEXkqy+dL2GRgVQy/otpmUsX+CAcGHoJWiC25Bm0HyRcKLFwhTOA5Qyz0xf0A==
X-Received: by 2002:a17:902:e808:b0:223:8256:533d with SMTP id d9443c01a7336-22c536207d3mr51359195ad.46.1744998278702;
        Fri, 18 Apr 2025 10:44:38 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaeb59dsm1933880b3a.177.2025.04.18.10.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:44:38 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:44:38 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Apr 2025 10:44:34 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.15-rc3
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-b22e94a2-6d25-4597-b1d2-c527bbd0f64f@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_104440_396245_64CDFE3B 
X-CRM114-Status: UNSURE (   7.58  )
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
Content-Type: multipart/mixed; boundary="===============6240097213101166937=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6240097213101166937==
Content-Type: text/plain

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc3
Primary key fingerprint: 00CE 76D1 8349 60DF CE88  6DF8 EF4C A150 2CCB AB41
     Subkey fingerprint: 2B3C 3747 4468 43B2 4A94  3A7A 2E13 19F3 5FBB 1889
merged tag 'riscv-fixes-6.15-rc3'

for you to fetch changes up to 615e705fc8c7bdb6816faf09b5b16a0441f050e7:

  Merge tag 'riscv-fixes-6.15-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes (2025-04-16 11:10:25 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.15-rc3

* A fix for an issue where C instructions ended up in non-C builds, do
  to some broken inline assembly in the KGDB breakpoint insertion code.
* A fix to avoid spurious printk messages about misaligned access
  performance probing.
* A fix for a handful of issues with /proc/iomem's reserved region
  handling.
* A pair of fixes for module relocation processing.
* A few build-time fixes.

----------------------------------------------------------------
This got hung up last week on the plugin ICE, which I thought was a RISC-V
problem but actually looks to be something pretty generic.

----------------------------------------------------------------
Andrew Jones (2):
      riscv: Fix unaligned access info messages
      riscv: Provide all alternative macros all the time

Björn Töpel (1):
      riscv: Properly export reserved regions in /proc/iomem

Nam Cao (1):
      Documentation: riscv: Fix typo MIMPLID -> MIMPID

Nathan Chancellor (2):
      riscv: Avoid fortify warning in syscall_get_arguments()
      riscv: Avoid fortify warning in syscall_get_arguments()

Palmer Dabbelt (3):
      Merge tag 'riscv-fixes-6.15-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes
      Merge patch series "riscv: Rework the arch_kgdb_breakpoint() implementation"
      Merge tag 'riscv-fixes-6.15-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes

Samuel Holland (2):
      riscv: module: Fix out-of-bounds relocation access
      riscv: module: Allocate PLT entries for R_RISCV_PLT32

WangYuli (2):
      riscv: KGDB: Do not inline arch_kgdb_breakpoint()
      riscv: KGDB: Remove ".option norvc/.option rvc" for kgdb_compiled_break

Will Pierce (1):
      riscv: Use kvmalloc_array on relocation_hashtable

 Documentation/arch/riscv/hwprobe.rst        |  2 +-
 arch/riscv/include/asm/alternative-macros.h | 19 ++++++---------
 arch/riscv/include/asm/kgdb.h               |  9 +-------
 arch/riscv/include/asm/syscall.h            |  7 ++++--
 arch/riscv/kernel/kgdb.c                    |  6 +++++
 arch/riscv/kernel/module-sections.c         | 13 ++++++-----
 arch/riscv/kernel/module.c                  | 11 +++++----
 arch/riscv/kernel/setup.c                   | 36 ++++++++++++++++++++++++++++-
 arch/riscv/kernel/unaligned_access_speed.c  | 35 +++++++++++++++++-----------
 9 files changed, 89 insertions(+), 49 deletions(-)


--===============6240097213101166937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6240097213101166937==--
