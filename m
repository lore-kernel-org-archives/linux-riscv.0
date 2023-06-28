Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F282EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 18:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XjKINE0fgsimA9LJCmUdMVcrPowlPunfT8EkHxuB9L0=; b=y/T0bE0/8rv3Mj
	FQu79RYkuEKHMPlznuHnlWHwqqnDj8N2fmmLnNmmwXecPnwk0MjBL33D/XAfkwf8t2m53b4W0hNoV
	9Y+0gGiKDy14XnEDgmn/JWGvIfJEH5AkeJ6u0lDOQCRhYUO7LUW18IFxA7iWjdKoh8XK7H33H1new
	HBPq1mpi5Ho75ZxcauGmTi7Cx/mjrjxxSN1QJwqyIOfRLtoLbg4aq3TBkST4g5aus+uvbUqjWSotQ
	2Jz5Mkpm4zEbrlSfStLPVNN9QJv5mdf7MPysLsKu2/BYLJRUP1S721kNFJfgf3kYlkZjHz+p2qmmK
	QFbU1HrrUQGbDMKUtdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaGE-00GREu-2s;
	Wed, 28 Jun 2023 18:51:26 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEaGA-00GRBe-0z
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 18:51:25 +0000
X-QQ-mid: bizesmtp76t1687978248tvmfh55f
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Jun 2023 02:50:47 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: kNiroXLcbYfrJCsBI1sa5E6qtqNyNUUSAPAKfE1it5MbxZO/BaVe/duwUGXKF
	Sm9d/SAmlvYOT+pgc5igmBpIt9S2G4iKsnTlVXEvkaFaHcDNqBQzv2bSp41ULt8iIrDCCnw
	tdsdjVq+IbEYYN7LM3/MDZ3DnO9T5rDy+lL/Yyim/NFIp/+GQWL01mQEGU0Q3mRYtZNu00W
	BmFVKFq2OsmovkZ2/TLDlFljGX9E2juXwgQaKyXF/LfN8W1bXuZJYedEeHDWhOt5FMXxMwz
	2SLVCGCFSefiq1H6yfNBBnHM0QEHRC068sGkE+J52h9ZMmARwFYG5Hn4/VSAttMSijYP9eS
	YlV97yWdOyNmZvtepGpyk/g7CsQIA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12319157307414105420
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 00/11] tools/nolibc: shrink arch support
Date: Thu, 29 Jun 2023 02:50:41 +0800
Message-Id: <cover.1687976753.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_115122_649966_DC93F1AA 
X-CRM114-Status: GOOD (  11.71  )
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

Hi,

This patchset further improves porting of nolibc to new architectures,
it is based on our previous v5 sysret helper series [1].

It mainly shrinks the assembly _start by moving most of its operations
to a C version of _start_c() function. and also, it removes the old
sys_stat() support by using the sys_statx() instead and therefore,
removes all of the arch specific sys_stat_struct.

Tested 'run' on all of the supported architectures:

               arch/board | result
              ------------|------------
          arm/vexpress-a9 | 141 test(s) passed, 1 skipped, 0 failed. See all results in /labs/linux-lab/logging/nolibc/arm-vexpress-a9-nolibc-test.log
                 arm/virt | 141 test(s) passed, 1 skipped, 0 failed. See all results in /labs/linux-lab/logging/nolibc/arm-virt-nolibc-test.log
             aarch64/virt | 141 test(s) passed, 1 skipped, 0 failed. See all results in /labs/linux-lab/logging/nolibc/aarch64-virt-nolibc-test.log
              ppc/g3beige | not supported
              ppc/ppce500 | not supported
                  i386/pc | 141 test(s) passed, 1 skipped, 0 failed. See all results in /labs/linux-lab/logging/nolibc/i386-pc-nolibc-test.log
                x86_64/pc | 141 test(s) passed, 1 skipped, 0 failed. See all results in /labs/linux-lab/logging/nolibc/x86_64-pc-nolibc-test.log
             mipsel/malta | 141 test(s) passed, 1 skipped, 0 failed. See all results in /labs/linux-lab/logging/nolibc/mipsel-malta-nolibc-test.log
         loongarch64/virt | 141 test(s) passed, 1 skipped, 0 failed. See all results in /labs/linux-lab/logging/nolibc/loongarch64-virt-nolibc-test.log
             riscv64/virt | 141 test(s) passed, 1 skipped, 0 failed. See all results in /labs/linux-lab/logging/nolibc/riscv64-virt-nolibc-test.log
             riscv32/virt | 119 test(s) passed, 1 skipped, 22 failed. See all results in /labs/linux-lab/logging/nolibc/riscv32-virt-nolibc-test.log
    s390x/s390-ccw-virtio | 141 test(s) passed, 1 skipped, 0 failed. See all results in /labs/linux-lab/logging/nolibc/s390x-s390-ccw-virtio-nolibc-test.log

  Notes:
  - ppc support are ready locally, will be sent out later.
  - full riscv32/virt support are ready locally, will be sent out later.

Changes:

* tools/nolibc: remove old arch specific stat support

    Just like the __NR_statx we used in nolibc-test.c, Let's only
    reserve sys_statx() and use it to implement the stat() function.

    Remove the old sys_stat() and sys_stat_struct completely.

* tools/nolibc: add new crt.h with _start_c

    A new C version of _start_c() is added to only require a 'sp' argument
    and find the others (argc, argv, envp/environ, auxv) for us in C.

* tools/nolibc: include crt.h before arch.h

    Include crt.h before arch.h to let _start() be able to call the new
    added _start_c() in arch-<ARCH>.h.

* tools/nolibc: arm: shrink _start with _start_c
  tools/nolibc: aarch64: shrink _start with _start_c
  tools/nolibc: i386: shrink _start with _start_c
  tools/nolibc: x86_64: shrink _start with _start_c
  tools/nolibc: mips: shrink _start with _start_c
  tools/nolibc: loongarch: shrink _start with _start_c
  tools/nolibc: riscv: shrink _start with _start_c
  tools/nolibc: s390: shrink _start with _start_c

    Move most of the operations from the assembly _start() to the C
    _start_c(), only require to do minimal operations in assembly _start
    now.

With this patchset, porting nolibc to a new architecture become easier,
the powerpc porting will be added later.

Best regards,
Zhangjin
---
[1]: https://lore.kernel.org/lkml/cover.1687957589.git.falcon@tinylab.org/

Zhangjin Wu (11):
  tools/nolibc: remove old arch specific stat support
  tools/nolibc: add new crt.h with _start_c
  tools/nolibc: include crt.h before arch.h
  tools/nolibc: arm: shrink _start with _start_c
  tools/nolibc: aarch64: shrink _start with _start_c
  tools/nolibc: i386: shrink _start with _start_c
  tools/nolibc: x86_64: shrink _start with _start_c
  tools/nolibc: mips: shrink _start with _start_c
  tools/nolibc: loongarch: shrink _start with _start_c
  tools/nolibc: riscv: shrink _start with _start_c
  tools/nolibc: s390: shrink _start with _start_c

 tools/include/nolibc/Makefile         |  1 +
 tools/include/nolibc/arch-aarch64.h   | 53 ++----------------
 tools/include/nolibc/arch-arm.h       | 79 ++-------------------------
 tools/include/nolibc/arch-i386.h      | 58 +++-----------------
 tools/include/nolibc/arch-loongarch.h | 42 ++------------
 tools/include/nolibc/arch-mips.h      | 73 +++----------------------
 tools/include/nolibc/arch-riscv.h     | 65 ++--------------------
 tools/include/nolibc/arch-s390.h      | 60 ++------------------
 tools/include/nolibc/arch-x86_64.h    | 54 ++----------------
 tools/include/nolibc/crt.h            | 57 +++++++++++++++++++
 tools/include/nolibc/nolibc.h         |  1 +
 tools/include/nolibc/signal.h         |  1 +
 tools/include/nolibc/stdio.h          |  1 +
 tools/include/nolibc/stdlib.h         |  1 +
 tools/include/nolibc/sys.h            | 64 ++++------------------
 tools/include/nolibc/time.h           |  1 +
 tools/include/nolibc/types.h          |  4 +-
 tools/include/nolibc/unistd.h         |  1 +
 18 files changed, 122 insertions(+), 494 deletions(-)
 create mode 100644 tools/include/nolibc/crt.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
