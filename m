Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CA2C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZNuU5v2YO2ix5+z2BFO8i09aSww16e+2edZQFjDmebs=; b=u0Z3oNplmFED1f
	TSkoGvneB5wh3/vbdVVX58vkh4tfukBPStTvoUV0zjPrAt4+uyNKuV0xdW6B1VmbnQVqHD5CsBSMs
	wbPFwjdSFbfDsiKux2BI/vluqvmiyEEPFh2gdf7+m3Mzr5fin7Vc/Ax2J5PwC/CGf/0y6/iO7YZi5
	btsmwkbL+aGo2VKkdm0mHeMSQ7xkIxJffJdFy1s4f/U4dM7O465whueQn+tGFQIWkPjREp4/wRAwM
	ZzsR5W+Dyw+JN5NMxef08DZa1dcGWdXZIFa6J/PGfBaLam2c6/CGut93K4DpMj8G8mWqm9AnDknei
	BB/H4OLlEBTM/6NO534g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIUW-0025dQ-2Z;
	Tue, 08 Aug 2023 08:55:00 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTIUT-0025ci-1A
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 08:54:59 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-68783b2e40bso3752097b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 01:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691484894; x=1692089694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Le8fn762Y5CUnoFQr2/BBoNQfidUQOWRJ8EQa2ZP11Y=;
        b=GvbcgUQ+LiKpm+LeH8uslgJewixxEykAnFvTX0TTOfx5AzIzHaRiK4/yU3UOMUZU0z
         RN1jaoWyry6IwJuWbieCsTCgFEDSlpzTDvU3dsLZZ3v6Gnovby815MKGe3pFpxSo8xBq
         5i8SdmzXonzBp6xeHMSeCOPm39/RWbAbvyd02o7foW42wXRSYObFz9EcqUdyD/mCQS2c
         TwJdG28enT0K+8cJaqhSrxsPhy3UVBlebf/cv+qKDSYaUkOA1woJKBTw+nfsJNeDiSdF
         zsfyrpeMUeJVLsZ2r1tcp+YGOwLznbVEZsMlhDDPexNAALSTW9kRB172P7FZ2ytJ/Gym
         Rg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691484894; x=1692089694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le8fn762Y5CUnoFQr2/BBoNQfidUQOWRJ8EQa2ZP11Y=;
        b=U8KwwWcHWyDOI1ldT5AqMbOfsx4L3Akdm1EBb3B6jMvsUeQmYqIc5jdhsIBRyEssse
         B5QZ6HN8ciaWJLq4pe92rqPu07PDi4CXethRPsGSHG7XEzz02o6JGC5h9IMC//+qz80o
         avi9Yd315/RbYB9RZXjP7oT52rX42Jf45SkZkfTMWnDpFH9+P6xeEuJsdQlaPIQBMfWM
         cR6SD10zM1DDl+ag/2KjlnMfVy7C1ujaG53ibq0dFEg6TxKnN+APXCqLXVyCgJTvilln
         2/H2ezQrJaRhnSLoWbKKVUSj0rVE8I+SKEkn2vF8JrJTARONw0IIsaPywS5JZ4qo8w7a
         uzAg==
X-Gm-Message-State: AOJu0YzRETBcZSLW22d7c65M7I6tu3tvvrlqEGRDcipWclm18HRfWrbg
	b9i6ZgDdpYspHKdEt6XpA8s=
X-Google-Smtp-Source: AGHT+IHqSQDQs8brFk626XEPW9Ti0KzKwZl/AxfQkZEzZP09tvCgA7P+WrswZV5n7CPXFPqaTST+mg==
X-Received: by 2002:a05:6a20:3d85:b0:140:a6ec:b56a with SMTP id s5-20020a056a203d8500b00140a6ecb56amr7743758pzi.3.1691484893795;
        Tue, 08 Aug 2023 01:54:53 -0700 (PDT)
Received: from localhost.localdomain ([2408:843e:c10:3c2f:5b2:f199:933:ff42])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c14400b001b9be3b94d3sm8408060plj.140.2023.08.08.01.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:54:53 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	suagrfillet@gmail.com,
	anup@brainfault.org,
	alex@ghiti.fr,
	conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: BUG Report: Some issues about vmlinux with emit-relocs 
Date: Tue,  8 Aug 2023 16:54:38 +0800
Message-Id: <20230808085438.3445957-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_015457_398955_1EE7DB87 
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

Hi, everyone:

I encountered some issues when testing CONFIG_RELOCATABLE.

The story starts with the issue "the empty relocations in .rela.dyn"
mentioned in patch 1 of "Introduce 64b relocatable kernel" thread [1].
And it had been circumvented by ld `--emit-relocs` option in patch 6.

With the `emit-relocs` option enabled, the vmlinux would grow bigger,
so vmlinux.relocs was created as a backup to generate the Image file
and vmlinux objcopyed itself to check/strip all .rela* sections.

Not sure there is a solution to fix the "empty relocaions" issue
and get rid of the `emit-relocs` option.
Until that, there are some other issues with vmlinux's `emit-relocs` option:

1. result of `remove-section` varies with different version GNU-objcopy

- the sections of vmlinux with objcopy 2.31.1

riscv64-linux-gnu-readelf -SW 00_rv_test/vmlinux |grep rel
  [10] .rela.dyn         RELA            ffffffff80c26138 913138 2186a0 18   A  9   0  8
  [15] .rela__ksymtab    RELA            0000000000000000 11529760 052dd0 18   I 49  14  8
  [17] .rela__ksymtab_gpl RELA            0000000000000000 1157c530 05eba8 18   I 49  16  8
  [20] .rela__param      RELA            0000000000000000 115db0d8 005400 18   I 49  19  8
  [22] .rela__modver     RELA            0000000000000000 115e04d8 000300 18   I 49  21  8
  [24] .rela__ex_table   RELA            0000000000000000 115e07d8 00cde0 18   I 49  23  8
  [29] .rela__bug_table  RELA            0000000000000000 115ed5b8 0bd1e0 18   I 49  28  8
  [32] .data.rel         PROGBITS        ffffffff816a5940 e21940 0d0df0 00  WA  0   0 64

- the sections of vmlinux with objcopy 2.38

riscv64-linux-gnu-readelf -SW 00_rv_newtool/vmlinux | grep rel


  [25] .data.rel         PROGBITS        ffffffff816a6340 f77340 0d0cb0 00  WA  0   0 64

The difference comes from binutils's commit c12d9fa2afe ("Support
objcopy --remove-section=.relaFOO").
The option `--remove-setions='.rela__'` wasn't supported before
binutils/objcopy 2.32, so all of '.rela__' RELA sections were kept.
And '.rela.dyn' section was kept due to the mismatch between the
stripped 'dyn' section_pattern and the actual '.dynamic' section name.

Should we kill the '.rela.dyn' section from the vmlinux ?
IMO, some senses (like, kexec/kdump) will load/run vmlinux directly that
needs this allocatable section.
And from my kexec/kdump test with vmlinux, the 2nd kernel could start
with '.rela.dyn' but failed if no '.rela.dyn'.

How about keeping '.rela.dyn' section in vmlinux and
making `remove-section` consistent with different version GNU-objcopy ?


2. the stripped vmlinux has huge symtab

I found a similar issue[2] about the huge symtab of kernel modules.

The aggressive link-time relaxations of RISC-V need sufficient
relocation info and local symbols to rewrite the code at link time.
That would result in a lot of extra symbols and relocations.

Kernel modules are compiled `-mno-relax`. But the toolchain still needed
to improve to emit fewer things under `-mno-relax`. Util that, stripping
ko with `--discard-all` or `--discard-locals` would be an option to
reduce the symtab size. (the Ubuntu fixing patch [3])

While vmlinux now uses `emit-relocs` option that would aggravate the
symtab size.
(It would take a long long time to start when using the current vmlinux
as the Crash's namelist. Crash is busy in symtab_init() function.)

So how about objcopying vmlinux with `--discard-locals` option to
reduce the symtab size ?

(And how about adopting the Ubuntu patch into riscv kernel tree? )


3. suspicious relocations in vmlinux

The vmlinux has some suspicious R_RISCV_NONE/R_RISCV_64 relocations
emitted with the `emit-relocs` option, that would be detected by
`tools/reloc_check.sh` and flush the console when making vmlinux.

riscv64-linux-gnu-objdump -R ./00_rv_newtool/vmlinux | grep -E '\<R_' | awk '{print $2}' | sort | uniq -c
      6 R_RISCV_64
  20201 R_RISCV_NONE
  71307 R_RISCV_RELATIVE

Is there a way/tool to get rid of these relocations from vmlinux,
or temporarily silence the echo of those bad relocations?


[1]: https://lore.kernel.org/all/20230329045329.64565-1-alexghiti@rivosinc.com/
[2]: https://github.com/riscv-collab/riscv-gnu-toolchain/issues/1036
[3]: https://patchwork.ozlabs.org/project/ubuntu-kernel/patch/20220309161622.124754-1-dimitri.ledkov@canonical.com/#2855027

Finally, you can try this temporary git-diff for issue1 and issue2:

diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
index a46fc578b30b..3324c3ede9c6 100644
--- a/arch/riscv/Makefile.postlink
+++ b/arch/riscv/Makefile.postlink
@@ -20,10 +20,10 @@ quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
 cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
 
 quiet_cmd_relocs_strip = STRIPREL $@
-cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
-                                --remove-section='.rel__*'      \
-                                --remove-section='.rela.*'      \
-                                --remove-section='.rela__*' $@
+cmd_relocs_strip = 							\
+	$(CONFIG_SHELL) $(srctree)/arch/riscv/tools/relocs_strip.sh	\
+				  "$(OBJCOPY)" "$(CONFIG_LD_VERSION)" "$@"
+
 endif
 
 # `@true` prevents complaint when there is nothing to be done
diff --git a/arch/riscv/tools/relocs_strip.sh b/arch/riscv/tools/relocs_strip.sh
new file mode 100755
index 000000000000..20cb69cf041b
--- /dev/null
+++ b/arch/riscv/tools/relocs_strip.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# This script strips and the relocations and the
+# compiler-generated local symbols of a vmlinux.
+
+if [ $# -lt 3 ]; then
+        echo "$0 [path to objcopy] [version of GNU objcopy] [path to vmlinux]" 1>&2
+        exit 1
+fi
+
+objcopy="$1"
+objcopy_version="$2"
+vmlinux="$3"
+
+# binutils/objcopy didn't support '--remove-setions='.rela__'' option util 2.32,
+# use `--remove-relocations` to remove those RELA sections.
+
+if [ 0 -lt $objcopy_version -a 23200 -gt $objcopy_version ]; then
+
+	$objcopy --remove-section='.rel.*'	\
+		 --remove-section='.rela.*'	\
+		 --remove-relocations='__*' $vmlinux
+else
+	$objcopy --keep-section='.rela.dyn'	\
+		 --remove-section='.rel.*'	\
+		 --remove-section='.rel__*'	\
+		 --remove-section='.rela.*'	\
+		 --remove-section='.rela__*' $vmlinux
+fi
+
+# discard the compiler-generated local symbols of vmlinux
+
+$objcopy --discard-locals $vmlinux


-- 
Thanks
Song Shuai


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
