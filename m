Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29239C433FE
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Nov 2022 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CpzgNYCsWw17pzWaKlsWi8tJoyAo0r0Nb9bg6U1Rnxc=; b=x6F8vmp3cWCMEU
	aegb6G2BRFRU94enSh2nPBvaBl6at/I9OFOdPW2QuGtjjhOnHQH2kqLRlEJcIUUZjf2xuRzdAkvwh
	e44zkluknBovhi/SHSvRXIfte5fUC0NfGKGngzkmSy85tfQbwQ9XsVmbMpQBBUzhBfP0G/pOHStO9
	cW5itzCpZ+P3nm/MdWudPVSUATxPS17td+CGYhktH6QvCEypPZSkKrWDrH2CBWpwj3uqOmfqEvp0v
	Zn4Ca5M2JLdcimlgQ4BP8tuc8vk2u1mVsEOIE+/JDXH6S1lMsMu+TwRmBncmIWu3Oc7JDmJWatwEo
	1njWi5fkvvfPOE5Ftqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orcUr-007uTB-Ag; Sun, 06 Nov 2022 10:03:21 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orcUn-007uRR-Ck
	for linux-riscv@lists.infradead.org; Sun, 06 Nov 2022 10:03:19 +0000
Received: by mail-pg1-x531.google.com with SMTP id 136so4159130pga.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Nov 2022 02:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BU/GEX7oGTrvEjxodaV3U4uYUl5yeLKJDVZ9b6saoY=;
        b=Kno/QC2ZKL9BcYH+lP3M0AqqYhOtAKS0FVBDBaPnqg5xd31e/3D430yc/RwAqyPKNA
         aF52b3NCHQiXwq8Aywu3LZdUhwOGbvI79QDIGHJur5iqHXUIPU21rGBu8EenlfBaPFiA
         hsp/rej9ZgNeZojPbvarbK/z/zrRmom6plT8MN/zpuDb48uxmcLhdN0cyZboa65kQ+m4
         BHZhQsbYlcaK1f85xNjmn5lOiCge/BOBQb6Gltf23lxAUdDygWatDQMyyqiQzgtTenJe
         +LuU9/rGLtNDqTAhCMOXyYF9fZxerhlxLxor4HPMdmNBMFQsyEAmUugVVqOBJgphMn/G
         iVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BU/GEX7oGTrvEjxodaV3U4uYUl5yeLKJDVZ9b6saoY=;
        b=qTZejF4hxaXmhMu9ctkE6j/eXOqmoowvAHe3UWM0HawzoakX1d5vD672zlWBWHPTSF
         9+my38T4S726MYrZ2aSjVlvjZPFtE4uGm+RaByJvsYJjepRjZPBDxlGkH5WPmok1gmvq
         V19noyeNEeozhA+aCHqQHikct+MRSyq1GpX1iPoxwq+gzaeymMynWBLfpkaoEwXTRplF
         QWOr/IwtPNql1K1WAQGbWGJy48r1/Ly1uTUy6+ee0QzUEy378Nx38Z2hQBsKOgdyQ5Tz
         XYwxPLFhqvX9G4djhdPtsz+IDpbeAMXQg9xEXMlcdTadeV4OF24/FpfijnQ/R6SuIgWP
         4a7Q==
X-Gm-Message-State: ACrzQf35SGKDpRl9f5cZAZO5aPf/rxCcC4C507JjomfTNX5IkVMzKnry
	84R6S+4aPmFfTLcG+w0kmb8=
X-Google-Smtp-Source: AMsMyM70O2q+4fIAYpvGU7bMSturp7FQUBo+pb4Y9kjdXowomrHLvtMAiVgvPjakgfAW1bk8mY0CmQ==
X-Received: by 2002:a62:1e04:0:b0:56d:a2cf:e7fb with SMTP id e4-20020a621e04000000b0056da2cfe7fbmr31601371pfe.48.1667728992801;
        Sun, 06 Nov 2022 02:03:12 -0800 (PST)
Received: from debian.. (subs02-180-214-232-28.three.co.id. [180.214.232.28])
        by smtp.gmail.com with ESMTPSA id z22-20020a630a56000000b0043c732e1536sm2333547pgk.45.2022.11.06.02.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 02:03:12 -0800 (PST)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: riscv: tableize memory layout
Date: Sun,  6 Nov 2022 17:02:40 +0700
Message-Id: <20221106100239.53704-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13584; i=bagasdotme@gmail.com; h=from:subject; bh=HGrd3JUcYf98N1p7UhkB1UPQZR83cFVfgAcmvlNv+ek=; b=owGbwMvMwCH2bWenZ2ig32LG02pJDMnpbfZ/r8+oWNW0t3NqzJ01R0Ptl0aZ3DnBGro63ityUX+U fNuljlIWBjEOBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzkw3RGhutC6pHrHd8ciX8dFNpr72 gfuDbmkuBDuyWlHKXO25Y1MDP8r9JvfsRZ9uJJjuRnrlcND38st7h5Wewlk8fLN5of7jJ94gYA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_020317_465044_365051B1 
X-CRM114-Status: UNSURE (   9.75  )
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

The memory layout is written as table but it is inside literal code
block, which renders as preformatted text. Write the layout in reST
grid table instead.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/riscv/vm-layout.rst | 120 +++++++++++++++---------------
 1 file changed, 58 insertions(+), 62 deletions(-)

diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
index 5b36e45fef60bd..139320e35de81f 100644
--- a/Documentation/riscv/vm-layout.rst
+++ b/Documentation/riscv/vm-layout.rst
@@ -30,70 +30,66 @@ the RISC-V Linux Kernel resides.
 RISC-V Linux Kernel SV39
 ------------------------
 
-::
-
-  ========================================================================================================================
-      Start addr    |   Offset   |     End addr     |  Size   | VM area description
-  ========================================================================================================================
-                    |            |                  |         |
-   0000000000000000 |    0       | 0000003fffffffff |  256 GB | user-space virtual memory, different per mm
-  __________________|____________|__________________|_________|___________________________________________________________
-                    |            |                  |         |
-   0000004000000000 | +256    GB | ffffffbfffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical
-                    |            |                  |         |     virtual memory addresses up to the -256 GB
-                    |            |                  |         |     starting offset of kernel mappings.
-  __________________|____________|__________________|_________|___________________________________________________________
-                                                              |
-                                                              | Kernel-space virtual memory, shared between all processes:
-  ____________________________________________________________|___________________________________________________________
-                    |            |                  |         |
-   ffffffc6fee00000 | -228    GB | ffffffc6feffffff |    2 MB | fixmap
-   ffffffc6ff000000 | -228    GB | ffffffc6ffffffff |   16 MB | PCI io
-   ffffffc700000000 | -228    GB | ffffffc7ffffffff |    4 GB | vmemmap
-   ffffffc800000000 | -224    GB | ffffffd7ffffffff |   64 GB | vmalloc/ioremap space
-   ffffffd800000000 | -160    GB | fffffff6ffffffff |  124 GB | direct mapping of all physical memory
-   fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
-  __________________|____________|__________________|_________|____________________________________________________________
-                                                              |
-                                                              |
-  ____________________________________________________________|____________________________________________________________
-                    |            |                  |         |
-   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
-   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
-  __________________|____________|__________________|_________|____________________________________________________________
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   |    Start addr    | Offset  |     End addr     |  Size   | VM area description                                      |
+   +==================+=========+==================+=========+==========================================================+
+   | 0000000000000000 |    0    | 0000003fffffffff | 256 GB  | user-space virtual memory, different per mm              |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   | 0000004000000000 | +256 GB | ffffffbfffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical      |
+   |                  |         |                  |         | virtual memory addresses up to the -256 GB               |
+   |                  |         |                  |         | starting offset of kernel mappings.                      |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   |                             Kernel-space virtual memory, shared between all processes:                             |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   | ffffffc6fee00000 | -228 GB | ffffffc6feffffff | 2 MB    | fixmap                                                   |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   | ffffffc6ff000000 | -228 GB | ffffffc6ffffffff | 16 MB   | PCI io                                                   |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   | ffffffc700000000 | -228 GB | ffffffc7ffffffff | 4 GB    | vmemmap                                                  |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   | ffffffc800000000 | -224 GB | ffffffd7ffffffff | 64 GB   | vmalloc/ioremap space                                    |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   | ffffffd800000000 | -160 GB | fffffff6ffffffff | 124 GB  | direct mapping of all physical memory                    |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   | fffffff700000000 | -36 GB  | fffffffeffffffff | 32 GB   | kasan                                                    |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   |                                  Identical layout to the 39-bit one from here on:                                  |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   | ffffffff00000000 | -4 GB   | ffffffff7fffffff | 2 GB    | modules, BPF                                             |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
+   | ffffffff80000000 | -2 GB   | ffffffffffffffff | 2 GB    | kernel                                                   |
+   +------------------+---------+------------------+---------+----------------------------------------------------------+
 
 
 RISC-V Linux Kernel SV48
 ------------------------
 
-::
-
- ========================================================================================================================
-      Start addr    |   Offset   |     End addr     |  Size   | VM area description
- ========================================================================================================================
-                    |            |                  |         |
-   0000000000000000 |    0       | 00007fffffffffff |  128 TB | user-space virtual memory, different per mm
-  __________________|____________|__________________|_________|___________________________________________________________
-                    |            |                  |         |
-   0000800000000000 | +128    TB | ffff7fffffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical
-                    |            |                  |         | virtual memory addresses up to the -128 TB
-                    |            |                  |         | starting offset of kernel mappings.
-  __________________|____________|__________________|_________|___________________________________________________________
-                                                              |
-                                                              | Kernel-space virtual memory, shared between all processes:
-  ____________________________________________________________|___________________________________________________________
-                    |            |                  |         |
-   ffff8d7ffee00000 |  -114.5 TB | ffff8d7ffeffffff |    2 MB | fixmap
-   ffff8d7fff000000 |  -114.5 TB | ffff8d7fffffffff |   16 MB | PCI io
-   ffff8d8000000000 |  -114.5 TB | ffff8f7fffffffff |    2 TB | vmemmap
-   ffff8f8000000000 |  -112.5 TB | ffffaf7fffffffff |   32 TB | vmalloc/ioremap space
-   ffffaf8000000000 |  -80.5  TB | ffffef7fffffffff |   64 TB | direct mapping of all physical memory
-   ffffef8000000000 |  -16.5  TB | fffffffeffffffff | 16.5 TB | kasan
-  __________________|____________|__________________|_________|____________________________________________________________
-                                                              |
-                                                              | Identical layout to the 39-bit one from here on:
-  ____________________________________________________________|____________________________________________________________
-                    |            |                  |         |
-   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
-   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
-  __________________|____________|__________________|_________|____________________________________________________________
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   |    Start addr    |  Offset   |     End addr     |  Size   | VM area description                                   |
+   +==================+===========+==================+=========+=======================================================+
+   | 0000000000000000 |    0      | 00007fffffffffff | 128 TB  | user-space virtual memory, different per mm           |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   | 0000800000000000 | +128 TB   | ffff7fffffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical   |
+   |                  |           |                  |         | virtual memory addresses up to the -128 TB            |
+   |                  |           |                  |         | starting offset of kernel mappings.                   |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   |                            Kernel-space virtual memory, shared between all processes:                             |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   | ffff8d7ffee00000 | -114.5 TB | ffff8d7ffeffffff | 2 MB    | fixmap                                                |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   | ffff8d7fff000000 | -114.5 TB | ffff8d7fffffffff | 16 MB   | PCI io                                                |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   | ffff8d8000000000 | -114.5 TB | ffff8f7fffffffff | 2 TB    | vmemmap                                               |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   | ffff8f8000000000 | -112.5 TB | ffffaf7fffffffff | 32 TB   | vmalloc/ioremap space                                 |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   | ffffaf8000000000 | -80.5 TB  | ffffef7fffffffff | 64 TB   | direct mapping of all physical memory                 |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   | ffffef8000000000 | -16.5 TB  | fffffffeffffffff | 16.5 TB | kasan                                                 |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   |                                 Identical layout to the 39-bit one from here on:                                  |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   | ffffffff00000000 | -4 GB     | ffffffff7fffffff | 2 GB    | modules, BPF                                          |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+
+   | ffffffff80000000 | -2 GB     | ffffffffffffffff | 2 GB    | kernel                                                |
+   +------------------+-----------+------------------+---------+-------------------------------------------------------+

base-commit: 0cdb3579f1ee4c1e55acf8dfb0697b660067b1f8
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
