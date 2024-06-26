Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D839C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 07:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/+5cD4fyXJ6weiGNgg/HB3DSnqSShld9hmf809qC9u8=; b=G1SAMhdUVx8vCV
	RcAE2TQEMfL7Xd7PHl5RUIlRpH3IVOUSywBz7aJ29UJ7I6DomAGzN1MZWbyhFHc6rV0ILUwAvx/EB
	SI4zQMbzuMz2Rj2T/gllt44l956H05Po1+Z+LLxBoadBrDdFU56KId0FwLK1Ky9UtvbHC5ftsU62G
	2Braq9Dv/gRcyi/XKqudFu5zHCcZlytyGkcCDkvoXe+Ikm240B6aSVT06caqvhKMb9S4KfC7gQrVP
	3UcsFdax3fojoV5oj7blfnuqWA8AhytdKdyGTJVXUkvlARMjtZ9sEkkhPUHk1GB5fqjz6nnFpxy/L
	9V8IHWzpJ7ou8ZQrStpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN11-00000005iZl-2TgR;
	Wed, 26 Jun 2024 07:24:27 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN0r-00000005iUi-3wqi
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 07:24:21 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3d55cfebcc5so629460b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 00:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719386656; x=1719991456; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=28+2R0YMNVN2b8FjjSAlDFHsrFLhKCgCE06SYvvPxuY=;
        b=ffSAlMRmreaEmXHfXJfGpZp5mKiCQw70hQ3m8GlilzaZ1bHbFaVRfEc7i1x6JPXZr/
         JQnorRCc8bMJ8Te49R6JYSaXtGsf9lm+mF0P9V7u4gCzmE+LTVKQfpqb5OYq0xZMylZS
         TdT6qNtMW8zOWeuaMwS1wbdiyQppwss6XoLlN2fBposNn/BVS+21aOJ84hlpdNwe0W+u
         cu912EaGT7d1qC++7bcyi7KdIiut1n06kWfH6bWXuuEztt1HrgCi+K2pr8z9QvBmj2iz
         RA7EoDVLec/alZMuwg0e6fmCVVnt/riLVj9MTP4LOqObLS7vBM3KZJ59fiTDOCI7BiTT
         TflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719386656; x=1719991456;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28+2R0YMNVN2b8FjjSAlDFHsrFLhKCgCE06SYvvPxuY=;
        b=LGUYPwmkXq1/fzXlpMhzyHJRfzH9envvRDv5LgCtpxmwPbA/JV9hJM1vWGMogCuXtJ
         rngrnEnN6YHfP+wGvpptanHvtoBCgL1/D1T3SCB9wZZYaivyJY/atikZe10c0r226/Mh
         Q3G3MVv0n4haThHPiunpyRIfwjYlnEe0kbtCQZT1zZlw/1SkLiMoM947QQyIAoZ3plwN
         SrrVB1+OLa97zHZUtH5DnPsvr8yHOWD9V2vRz0Rlc8TrKQ7EFGczw00/DzH40zePG+x4
         YK/btSygDPAFxO8jtntYvrWABt3IAQtzVOT0IXCWyg/7V/VNSYHG4emTXqohPU+JKJtp
         BhMA==
X-Gm-Message-State: AOJu0YzqLaaXxg2ty56ik0xLLUIzw9R1cC68ve0CfnVLihrHaXy5FEmN
	xGbkvP7r8V9bNGTURVZCXPW+vw324ZrylXIa/D2BFKfkwlO90cgOeh2jSXifty0=
X-Google-Smtp-Source: AGHT+IHjdai+QGS6HcsrCB7cdgiPaThjZ4KTE2hdtBxgDxRzNsR46vLc5RHtMevlnVOBtgqAi78eZg==
X-Received: by 2002:a05:6870:b4a4:b0:254:b6f0:21b6 with SMTP id 586e51a60fabf-25d06bb45d2mr9741006fac.10.1719386655791;
        Wed, 26 Jun 2024 00:24:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706984a721csm2692218b3a.37.2024.06.26.00.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 00:24:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 0/3] Assorted fixes in RISC-V PMU driver
Date: Wed, 26 Jun 2024 00:23:00 -0700
Message-Id: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANTBe2YC/x3LQQqAIBBA0avErBPCmpKuEiFhY80iEwciEO+et
 Hx8fgahxCQwNxkSPSx8h4q+bcCdWzhI8V4NutNDN2pUF4uzkZK3nl8ShQ4nj4i70QbqFRP9oU7
 LWsoHP3tXwWEAAAA=
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, garthlei@pku.edu.cn
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_002418_145784_324960F3 
X-CRM114-Status: GOOD (  13.69  )
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

This series contains 3 fixes out of which the first one is a new fix
for invalid event data reported in lkml[2]. The last two are v3 of Samuel's
patch[1]. I added the RB/TB/Fixes tag and moved 1 unrelated change
to its own patch. I also changed a error message in kvm vcpu_pmu from
pr_err to pr_debug to avoid redundant failure error messages generated
due to the boot time quering of events implemented in the patch[1]

Here is the original cover letter for the patch[1]

Before this patch:
$ perf list hw

List of pre-defined events (to be used in -e or -M):

  branch-instructions OR branches                    [Hardware event]
  branch-misses                                      [Hardware event]
  bus-cycles                                         [Hardware event]
  cache-misses                                       [Hardware event]
  cache-references                                   [Hardware event]
  cpu-cycles OR cycles                               [Hardware event]
  instructions                                       [Hardware event]
  ref-cycles                                         [Hardware event]
  stalled-cycles-backend OR idle-cycles-backend      [Hardware event]
  stalled-cycles-frontend OR idle-cycles-frontend    [Hardware event]

$ perf stat -ddd true

 Performance counter stats for 'true':

              4.36 msec task-clock                       #    0.744 CPUs utilized
                 1      context-switches                 #  229.325 /sec
                 0      cpu-migrations                   #    0.000 /sec
                38      page-faults                      #    8.714 K/sec
         4,375,694      cycles                           #    1.003 GHz                         (60.64%)
           728,945      instructions                     #    0.17  insn per cycle
            79,199      branches                         #   18.162 M/sec
            17,709      branch-misses                    #   22.36% of all branches
           181,734      L1-dcache-loads                  #   41.676 M/sec
             5,547      L1-dcache-load-misses            #    3.05% of all L1-dcache accesses
     <not counted>      LLC-loads                                                               (0.00%)
     <not counted>      LLC-load-misses                                                         (0.00%)
     <not counted>      L1-icache-loads                                                         (0.00%)
     <not counted>      L1-icache-load-misses                                                   (0.00%)
     <not counted>      dTLB-loads                                                              (0.00%)
     <not counted>      dTLB-load-misses                                                        (0.00%)
     <not counted>      iTLB-loads                                                              (0.00%)
     <not counted>      iTLB-load-misses                                                        (0.00%)
     <not counted>      L1-dcache-prefetches                                                    (0.00%)
     <not counted>      L1-dcache-prefetch-misses                                               (0.00%)

       0.005860375 seconds time elapsed

       0.000000000 seconds user
       0.010383000 seconds sys

After this patch:
$ perf list hw

List of pre-defined events (to be used in -e or -M):

  branch-instructions OR branches                    [Hardware event]
  branch-misses                                      [Hardware event]
  cache-misses                                       [Hardware event]
  cache-references                                   [Hardware event]
  cpu-cycles OR cycles                               [Hardware event]
  instructions                                       [Hardware event]

$ perf stat -ddd true

 Performance counter stats for 'true':

              5.16 msec task-clock                       #    0.848 CPUs utilized
                 1      context-switches                 #  193.817 /sec
                 0      cpu-migrations                   #    0.000 /sec
                37      page-faults                      #    7.171 K/sec
         5,183,625      cycles                           #    1.005 GHz
           961,696      instructions                     #    0.19  insn per cycle
            85,853      branches                         #   16.640 M/sec
            20,462      branch-misses                    #   23.83% of all branches
           243,545      L1-dcache-loads                  #   47.203 M/sec
             5,974      L1-dcache-load-misses            #    2.45% of all L1-dcache accesses
   <not supported>      LLC-loads
   <not supported>      LLC-load-misses
   <not supported>      L1-icache-loads
   <not supported>      L1-icache-load-misses
   <not supported>      dTLB-loads
            19,619      dTLB-load-misses
   <not supported>      iTLB-loads
             6,831      iTLB-load-misses
   <not supported>      L1-dcache-prefetches
   <not supported>      L1-dcache-prefetch-misses

       0.006085625 seconds time elapsed

       0.000000000 seconds user
       0.013022000 seconds sys

Changes in v3:
 - Added one more fix
 - Separated an unrelated change to its own patch.
 - Rebase and Added RB/TB/Fixes tag.
 - Changed a error message in kvm code to avoid unnecessary failures
   at guest booting.
Changes in v2:
 - Move the event checking to a workqueue to make it asynchronous
 - Add more details to the commit message based on the v1 discussion

[1] https://lore.kernel.org/linux-riscv/20240418014652.1143466-1-samuel.holland@sifive.com/
[2] https://lore.kernel.org/all/CC51D53B-846C-4D81-86FC-FBF969D0A0D6@pku.edu.cn/

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (1):
      drivers/perf: riscv: Do not update the event data if uptodate

Samuel Holland (2):
      drivers/perf: riscv: Reset the counter to hpmevent mapping while starting cpus
      perf: RISC-V: Check standard event availability

 arch/riscv/kvm/vcpu_pmu.c    |  2 +-
 drivers/perf/riscv_pmu.c     |  2 +-
 drivers/perf/riscv_pmu_sbi.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 43 insertions(+), 5 deletions(-)
---
base-commit: 55027e689933ba2e64f3d245fb1ff185b3e7fc81
change-id: 20240625-misc_perf_fixes-5c57f555d828
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
