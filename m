Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B85C30659
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TZNDq2bZqd2UYSclBm9NDHgfDfLI2Dq2z6+909RqHpg=; b=oSG+qMXrvniYnH
	b5nAqFNm4QUS2a5pedwFLDl5MkHsQN/cn2eGdYK5OX3zShZ6fY5aQNGfKUKG6RdEb8AonJgg18IOy
	hzugMynZxbWk27jsoUJ3I6ogrHGoDi7af+UAZmJIQvPuXXCyD1ni/nYk66BIe0fGErxjL4gwDNvhs
	Pryb3U2HfZ0zDDIcrBh1dK0H0a4Jnq8g34PHz4gmOCiHesdBBd4I0mlVN30SqWOh/l+EgsZflgR1S
	Y0peyuch/RAFS7cS5/R0OyRJXqutWuW+SuCD73+FYTzSms/IiSTWfwd9/65Jn1gTOmqJAE0T2Ml+M
	WjRm9ew4Rkq3nQLS7QCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6P2-0000000CxSV-0EN6;
	Fri, 28 Jun 2024 07:52:16 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6Or-0000000CxM0-0rp3
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 07:52:07 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5c2237d7aadso143549eaf.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 00:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719561123; x=1720165923; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lfk2FSfAfTy7rTZuEBD/W0oaye5LlvyVrrLcE/eP+AI=;
        b=GgdI2U5ifotiGl1pnTh8OtUskbZqJBje/NNuUmu/mMagvjBgzof2bysBYGkJ7wg3Yg
         fgb8oR+KXJ0SnHbqlB/piXNAbKvUezDl6FBV0rmhGIoAc3mlSUtLPzdKeNzWIGbzjVmw
         CmSutOpbBRO/HBFmRX0yi/2WFwqY2BDwN2qaGbZHR23lRPh2rwo9UUatO5lWtkJQCI0v
         Z5XK3sDxtPPQgxbPVj4VcktrxyOkRfkNOxtZj+cDPWeirKUA/oix4KJigiO1SBno3Bd9
         0tAdgk4Lgq2EjIDYC7Zy5T2JDl7wJVdYrW0okNB7Cxcc1E7kEXas5wcYGKmEhfUptaVw
         OzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719561123; x=1720165923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lfk2FSfAfTy7rTZuEBD/W0oaye5LlvyVrrLcE/eP+AI=;
        b=WIh+C89591rLqM7bo5w4fUP1py3cD5KjwV+MkT36tB8XppiUUpCkCBoDqWCdWMOtjy
         hDL6xfW7ZwwVwOC1s86U7OVn5lhG8knqrZAm3+ZCstIdxd3O5iNWFgPwwXSkNqmLFS0o
         kMkg2H0QXRQbU9k8DfoxOb/kXi8WawfwjuuA9kGYs7JUwYAtRruR1V2NjXYRa+9M6heu
         yI4hW1s7oJRYhRSclRFgDcfiqw9Qc2nI/bdwTKynt9qhhcrFjgsZGwQcBbSQ0CTdrkvp
         3JYjLWwVaxXOJp7e4iYwa7KNN9+MB/PmKaqnyU35r9CHkQT/4tIE7SaTyQGVZKnHNEDW
         w2mw==
X-Gm-Message-State: AOJu0YyBhA22PUXBnZKOp8tjV4xANUScUkWFL/RAa8G71FwbT9IplPxJ
	SlIsJ5gy6w/OYvw99V3hMJon2xyVLrOI8LHAoa9cVcd7kJIjmJzfKX1jPCVToeM=
X-Google-Smtp-Source: AGHT+IGJY3zwz2Dh3ONBt7zBT44037cWL19x8gYpDsscR2++QxJYS7DFgyh8r/X4g1UFT/8YlTY5Ng==
X-Received: by 2002:a05:6358:9497:b0:1a6:5ef1:c372 with SMTP id e5c5f4694b2df-1a65ef1c9c7mr603886655d.26.1719561123194;
        Fri, 28 Jun 2024 00:52:03 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c69b53bf2sm685068a12.2.2024.06.28.00.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 00:52:02 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 0/3] Assorted fixes in RISC-V PMU driver
Date: Fri, 28 Jun 2024 00:51:40 -0700
Message-Id: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIxrfmYC/2WNwQrCMBBEf6Xs2UhImho8+R+llJps7B7alKwEp
 eTfjQVPHt8Mb2YHxkTIcG12SJiJKa4V2lMDbp7WBwrylUFJ1cpOGbEQu3HDFMZAL2RhnLkEY4y
 3ykK1toRHUaV+qDwTP2N6HwdZf9PfVve3lbWQwqMOFr21frrfEuXItLqziwsMpZQPn0Cn3bEAA
 AA=
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
X-CRM114-CacheID: sfid-20240628_005205_488223_1C0474B4 
X-CRM114-Status: GOOD (  14.23  )
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
to its own patch. I also changed an error message in kvm vcpu_pmu from
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

Changes in v4:

- Added SoB tags.
- Improved the commit message in patch 1
- Link to v3: https://lore.kernel.org/r/20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com

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
