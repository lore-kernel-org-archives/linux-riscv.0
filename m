Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF595C88E41
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 02:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A4KRm4dyl7JuXTXoRK/ek0/H0ekmlb5wGA0kAFjeunk=; b=FqL1UgMr7q52og
	2YD+CuUTuwAkdLnnl2ghAJnHLwnvdQELCP9J3fBtVmT2MtYK57F7u48nls0hgsBmVbm4UFgh/2kNG
	qj9bEHltYpY8sVDNeB2A2ahyj0mfXPs5XiKLLd83DdhtZmfy/7EsJ7iXhasW8qnj37E1608nW7fWV
	hKwSJzVjNXVpEA/YhbMrTOHgeTo5V1ia5V5zFtI7lc2b9ZNhwZmIC3EEQxwgLd/lTPR9m+PBSppcy
	DvpmUGWl76Cub728GQzScZ6zLfA+SSUOx8FcgruroNAF/zQ7lK5rzQohj7tqRT46BVSMgXjkN99f8
	Ho50dZTh86cQgCBdzgyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rSL-0000000Fjw6-2Xm6;
	Fri, 11 Sep 2026 02:57:37 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rSI-0000000Fjux-0o2y
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 02:57:36 +0000
Received: by mail-pj2-x0a.google.com with SMTP id d9443c01a7336-2cf49dc298bso2773545ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 19:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095452; x=1789700252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fZGhKbaKpC/0bwb/aBifkG6HcLnnMOlc1Eg8oJ/QHc=;
        b=JI3zLeynNpLYRUiW3txARod10FFSXbJE7oiprBp/IwZdOd0VCk/G9XdUQEe/0RmxWe
         IDlj9DdhBdYzzOj+ZzJls3TvSr3ck4ks40PWfnROmEbsUkCNkm0GHcSqWZeoH/eSFVYF
         RrCfV842Hp0fOyJjiA7M3aMDSRLRoPSD/wFeRMMJfV/syORCB4JnTVcKaMwyKbW2VZqs
         jV48fOyp5mcYSd+cyjqKc4HmQTBoQXK1gu79nRVYk9/+AcfHGsHqB6jdLY/aFVpbF3Fq
         /Dys4sX6dfQV8VbRtcfT7Nkv0KSI3oZT8og1oKZ+fP4JX/7OgSeLCCP7aUSPa/84OqwG
         9iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095453; x=1789700253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fZGhKbaKpC/0bwb/aBifkG6HcLnnMOlc1Eg8oJ/QHc=;
        b=DxQJHfCSCnj+x4l1drDjxScPwytPakR7Lcc0piJRt32HUe4Tp/h3MqEB+4QYu2RD00
         hpawh8HEVBWpwHpn/aTR8iZ84tKt01Duc5peWmatirMRbtO7nonETJvO52qDRWB/pdSE
         KvVzjQqS35+xURXX/yxGLOCbNi1NI4Mspvx/onjtwnsl5nsYgjfR1n3D877Wc9gHfL11
         CdHJzio+ct4nSM1tTr/3TRmYHl5ZPKLiGdb0B7lOwQ9MgCNHJe1B9IzKUDaSgsNOBg4l
         b0lEpNZ0Sg+y8YW1jI5PvWbefokVepbZ/QBaLgUu0/k9Xo47SFa5vejKopjHGyNSdyCK
         TntA==
X-Forwarded-Encrypted: i=1; AKwUvBxntEP++1GJHVhAvoIeC6axuOO61glHru51ZTZ2UO+XlJkvgaSwKNdiQ2yeb4sJBXFvQCrjU3qVtwNHmQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mr5RIfU2SNbSHtHD5JQu2NVwTZcn8RaD1iZoqjp25XSEyOF0tS
	QhCLu/MKj4OoQplrJ2+PBLPmg4e9utBn/ykSUCwbAVdta3n2plLargmp
X-Gm-Gg: AYBFou3qEg5UBLoDeHNBiW/HT9Rh6TD9Mi7dY+PFo5ZLePoryq+GAn+im2Mpplz24VM
	XEyqErPtP2rMuUkB0Dh52i7YkRGAaZptimlsZsAjrWw4N5gLIYvwQLD8W60WmI0LmW5LLyYxROV
	ojSGxoozED6zgcJ8H+jJfrypNCAAt8ZxqEUAcGvHegNNzZfQNdnbEBTdWXTtJp2tflHBOhaq0Xy
	CBXzfJK0SRpNJp+dtN6CpcOihkWg3tJf9RtcZIeneCErjcoaEaf/OKzj2EZSQG90Fq0X8AKuf0E
	21m1EPYMnmOMfayMFuBujIgFss6/ceVsJcunm8ZzSQqobx/l+i9W/W6CAzyQULC5lFFhb0ZwjbG
	2IgLRPRw8xrwrCtwgKZhZRnpnVlg81PM5kKN29LEU1+ZutZResU7Ys7y5CrK3RC2zYR/RGkdV58
	eVPn8Q55sfJaw4ePe0flMhaj3jGqX25RxgS8XPOrI57aGV6LmhZiWGKICMSOBHE93qKtxztP07T
	a7v672aM2zbhbajE4KyPwo+ig==
X-Received: by 2002:a17:902:d4ce:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2dd2a336ab6mr39680795ad.13.1789095452393;
        Thu, 10 Sep 2026 19:57:32 -0700 (PDT)
Received: from zhr-ThinkStation-K.mioffice.cn ([2408:8607:1b00:8:8ce8:c617:f32:c38e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce9c8besm3944495ad.18.2026.09.10.19.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 19:57:31 -0700 (PDT)
From: Hongru Zhang <zhanghongru06@gmail.com>
X-Google-Original-From: Hongru Zhang <zhanghongru@xiaomi.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	baohua@kernel.org,
	surenb@google.com,
	ljs@kernel.org,
	david@kernel.org,
	liam@infradead.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shakeel.butt@linux.dev,
	vbabka@kernel.org,
	willy@infradead.org,
	zhaonanzhe@xiaomi.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	linux-s390@vger.kernel.org,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	Hongru Zhang <zhanghongru@xiaomi.com>
Subject: [PATCH v6] mm: retry page faults once under the per-VMA lock
Date: Fri, 11 Sep 2026 10:56:13 +0800
Message-ID: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_195734_253602_D63F27A6 
X-CRM114-Status: GOOD (  20.06  )
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

From: Hongru Zhang <zhanghongru@xiaomi.com>

The per-VMA lock fault path releases the per-VMA lock when the folio
cannot be locked. It then waits for the folio to become lockable
without holding the VMA lock and retries the page fault. However,
the retry always takes the mmap_lock instead of the per-VMA lock.
This can cause serious lock contention when a writer is holding the
mmap_lock at the same time.

Add a single retry under the per-VMA lock in the architecture fault
handler. This does not touch any page fault code in mm. The retry is
very likely to succeed because the first page fault has already waited
for the folio to become lockable. For example, this usually means that
any required I/O has completed. This allows faults that can make
progress on an immediate retry to stay on the per-VMA lock path,
avoiding waits on the mmap_lock when it is write-contended. This
reduces page-fault latency and mmap_lock contention. Some faults may
retry unnecessarily, for example, those in __vmf_anon_prepare() or
device-private fault handling, which require the mmap_lock. However,
these cases are expected to be infrequent and only add one cheap
per-VMA lock attempt. If the second attempt still returns
VM_FAULT_RETRY, the fault continues through the existing mmap_lock
path.

Based on the stress model from Kunwu Chan and Wang Lian in RFC v2, we
adapted a benchmark [1] to a 20-core Intel i7-12700 desktop by reducing
the thread count and adjusting the memcg limits. The benchmark uses
concurrent page faults under memcg pressure with parallel munmap to
amplify mmap_lock read-write contention.

Filemap throughput (higher is better)

+---------+------------+---------------------+
| Threads |  Vanilla   |       Patched       |
+---------+------------+---------------------+
|   40    | 1069.34 /s | 1400.13 /s (+30.9%) |
+---------+------------+---------------------+
|   60    | 1038.12 /s | 1683.37 /s (+62.2%) |
+---------+------------+---------------------+
|   80    | 1042.62 /s | 1767.83 /s (+69.6%) |
+---------+------------+---------------------+

mmap_lock contention count (lower is better)

+---------+-----------+---------+-----------+
| Threads |  Vanilla  | Patched | Reduction |
+---------+-----------+---------+-----------+
|   40    | 3,187,336 |  52,086 |  -98.4%   |
+---------+-----------+---------+-----------+
|   60    | 4,385,154 |  65,079 |  -98.5%   |
+---------+-----------+---------+-----------+
|   80    | 5,337,890 |  69,708 |  -98.7%   |
+---------+-----------+---------+-----------+

These results show that retrying once under the per-VMA lock keeps more
file-backed faults on the fast path, improving throughput and reducing
mmap_lock contention.

Using benchmark [2], we tested this on a 20-core Intel i7-12700 desktop
with a 2GB swapfile. The benchmark uses one pressure thread under memcg
limits to keep a 128MB non-zero anonymous mapping under swap pressure,
12 reader threads to fault it back in, and optional mmap writer threads
to amplify mmap_lock read-write contention. Each test ran for 60 seconds
and reported completed reader rounds per second under swap pressure.

Swap throughput (higher is better)

+--------------+-------------+---------------------------+
| mmap writers |   Vanilla   |          Patched          |
+--------------+-------------+---------------------------+
|      0       | 17303.09 /s | 17899.48 /s       (+3.4%) |
+--------------+-------------+---------------------------+
|      4       | 12596.23 /s | 16095.20 /s      (+27.8%) |
+--------------+-------------+---------------------------+
|      8       |     0.58 /s | 15420.57 /s (+2658619.0%) |
+--------------+-------------+---------------------------+

With increasing mmap_lock write pressure, Vanilla degrades sharply and
drops to near zero at eight writers. Patched kernel holds up much better.

Performance was evaluated on a Pixel 6 running Android 17, using Baidu
Tieba (com.baidu.tieba) and Tencent Video (com.tencent.qqlive), both
very popular Android apps, as the workloads. For each workload, we
performed 100 cold app launches with each kernel variant (vanilla and
patched). Each run recorded cold app launch time, measured as the time
to first frame, and the main thread's mmap_lock wait events. Shorter
launch times indicate better performance.

Baidu Tieba cold app launch time

+-----------+----------+----------+--------+
| Statistic |  Vanilla |  Patched | Change |
+-----------+----------+----------+--------+
|    Mean   | 3,672 ms | 3,580 ms |  -2.5% |
+-----------+----------+----------+--------+
|  Maximum  | 4,469 ms | 4,156 ms |  -7.0% |
+-----------+----------+----------+--------+

Baidu Tieba cold app launch time distribution

+-------------+------------+------------+
|  Time (ms)  |   Vanilla  |   Patched  |
+-------------+------------+------------+
| 2,750-2,999 |  0  (0.0%) |  1  (1.0%) |
+-------------+------------+------------+
| 3,000-3,249 |  8  (8.0%) | 14 (14.0%) |
+-------------+------------+------------+
| 3,250-3,499 | 17 (17.0%) | 30 (30.0%) |
+-------------+------------+------------+
| 3,500-3,749 | 38 (38.0%) | 27 (27.0%) |
+-------------+------------+------------+
| 3,750-3,999 | 26 (26.0%) | 18 (18.0%) |
+-------------+------------+------------+
| 4,000-4,249 |  8  (8.0%) | 10 (10.0%) |
+-------------+------------+------------+
| 4,250-4,499 |  3  (3.0%) |  0  (0.0%) |
+-------------+------------+------------+

Baidu Tieba main-thread mmap_lock wait statistics

+----------------------+----------------+----------------+--------+
|        Metric        |     Vanilla    |     Patched    | Change |
+----------------------+----------------+----------------+--------+
|    Total Wait Time   |  569.9 ms/run  |  469.9 ms/run  | -17.6% |
+----------------------+----------------+----------------+--------+
| Read-Lock Wait Count | 32.4 waits/run | 10.9 waits/run | -66.2% |
+----------------------+----------------+----------------+--------+

Tencent Video cold app launch time

+-----------+----------+----------+--------+
| Statistic |  Vanilla |  Patched | Change |
+-----------+----------+----------+--------+
|    Mean   | 1,907 ms | 1,840 ms |  -3.5% |
+-----------+----------+----------+--------+
|  Maximum  | 3,023 ms | 2,851 ms |  -5.7% |
+-----------+----------+----------+--------+

Tencent Video cold app launch time distribution

+-------------+------------+------------+
|  Time (ms)  |   Vanilla  |   Patched  |
+-------------+------------+------------+
| 1,250-1,499 |  3  (3.0%) |  7  (7.0%) |
+-------------+------------+------------+
| 1,500-1,749 | 32 (32.0%) | 33 (33.0%) |
+-------------+------------+------------+
| 1,750-1,999 | 39 (39.0%) | 36 (36.0%) |
+-------------+------------+------------+
| 2,000-2,249 | 12 (12.0%) | 15 (15.0%) |
+-------------+------------+------------+
| 2,250-2,499 |  7  (7.0%) |  4  (4.0%) |
+-------------+------------+------------+
| 2,500-2,749 |  5  (5.0%) |  3  (3.0%) |
+-------------+------------+------------+
| 2,750-2,999 |  1  (1.0%) |  2  (2.0%) |
+-------------+------------+------------+
| 3,000-3,249 |  1  (1.0%) |  0  (0.0%) |
+-------------+------------+------------+

Tencent Video main-thread mmap_lock wait statistics

+----------------------+----------------+---------------+--------+
|        Metric        |     Vanilla    |    Patched    | Change |
+----------------------+----------------+---------------+--------+
|    Total Wait Time   |  139.6 ms/run  |  66.4 ms/run  | -52.4% |
+----------------------+----------------+---------------+--------+
| Read-Lock Wait Count | 28.4 waits/run | 4.7 waits/run | -83.5% |
+----------------------+----------------+---------------+--------+

Across both workloads, the single retry under the per-VMA lock
substantially reduced mmap_lock read-side contention, leading to lower
app startup times at both the mean and the tail.

[1] https://gist.github.com/zhr250/c36c2c54d9351df37e12fd072d4926ef
[2] https://gist.github.com/zhr250/218ffe693f842346b56434483127422c

Signed-off-by: Hongru Zhang <zhanghongru@xiaomi.com>
Suggested-by: Barry Song <baohua@kernel.org>
Suggested-by: Suren Baghdasaryan <surenb@google.com>
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Tested-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
Changes since RFC v5:
- Added measurements from 100 cold app launches per kernel for each of
  Baidu Tieba and Tencent Video on a Pixel 6 running Android 17
  Tested by Nanzhe Zhao. Thanks!
- Rebased onto mm-unstable; no code changes

Changes since RFC v4:
- Drop `VM_FAULT_MAY_USE_VMA_LOCK` and always retry once under the
  per-VMA lock, based on feedback from Lorenzo and Barry. Thanks!

Changes since RFC v3:
- Keep VM_FAULT_RETRY unchanged and add VM_FAULT_MAY_USE_VMA_LOCK as an
  advisory bit
- Bound VMA-lock retries with FAULT_FLAG_TRIED
- Opt in filemap_fault() and do_swap_page() to VM_FAULT_MAY_USE_VMA_LOCK
- Rebased on mm-unstable

Changes since RFC v2:
- Redesigned as a single blacklist-based patch (v2 was 5 per-path patches)
- Added retry_vma loop to all architectures (not just x86)
- Rebased on mm-unstable

Changes since RFC v1:
- collect tags from Pedro, Kunwu and Lian, thanks!
- handle case (2), for uptodate folios, don't retry PF

Link to RFC v5:
https://lore.kernel.org/all/20260814085300.399107-1-zhanghongru@xiaomi.com/

Link to RFC v4:
https://lore.kernel.org/all/20260804095135.45897-1-zhanghongru@xiaomi.com/

Link to RFC v3:
https://lore.kernel.org/all/20260626075019.1833065-1-zhanghongru@xiaomi.com/

Link to RFC v2:
https://lore.kernel.org/all/20260430040427.4672-1-baohua@kernel.org/

Link to RFC v1:
https://lore.kernel.org/all/20251127011438.6918-1-21cnbao@gmail.com/

 arch/arm/mm/fault.c       | 8 ++++++++
 arch/arm64/mm/fault.c     | 8 ++++++++
 arch/loongarch/mm/fault.c | 8 ++++++++
 arch/powerpc/mm/fault.c   | 7 +++++++
 arch/riscv/mm/fault.c     | 8 ++++++++
 arch/s390/mm/fault.c      | 6 ++++++
 arch/x86/mm/fault.c       | 8 ++++++++
 7 files changed, 53 insertions(+)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 0a09d4ff7718..70472744f5c5 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -344,6 +344,7 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	vm_fault_t fault;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 	vm_flags_t vm_flags = VM_ACCESS_FLAGS;
+	bool vma_lock_retried = false;
 
 	if (kprobe_page_fault(regs, fsr))
 		return 0;
@@ -395,6 +396,7 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	if (!(flags & FAULT_FLAG_USER))
 		goto lock_mmap;
 
+lock_vma:
 	vma = lock_vma_under_rcu(mm, addr);
 	if (!vma)
 		goto lock_mmap;
@@ -424,6 +426,12 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 			goto no_context;
 		return 0;
 	}
+
+	if (!vma_lock_retried) {
+		vma_lock_retried = true;
+		goto lock_vma;
+	}
+
 lock_mmap:
 
 retry:
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 75c3e463df2e..c7fd6f485b16 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -614,6 +614,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	struct vm_area_struct *vma;
 	int si_code;
 	int pkey = -1;
+	bool vma_lock_retried = false;
 
 	if (kprobe_page_fault(regs, esr))
 		return 0;
@@ -682,6 +683,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	if (!(mm_flags & FAULT_FLAG_USER))
 		goto lock_mmap;
 
+lock_vma:
 	vma = lock_vma_under_rcu(mm, addr);
 	if (!vma)
 		goto lock_mmap;
@@ -728,6 +730,12 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 			goto no_context;
 		return 0;
 	}
+
+	if (!vma_lock_retried) {
+		vma_lock_retried = true;
+		goto lock_vma;
+	}
+
 lock_mmap:
 
 retry:
diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index 2c93d33356e5..ef6ea847b1e0 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -181,6 +181,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 	struct mm_struct *mm = tsk->mm;
 	struct vm_area_struct *vma = NULL;
 	vm_fault_t fault;
+	bool vma_lock_retried = false;
 
 	if (kprobe_page_fault(regs, current->thread.trap_nr))
 		return;
@@ -219,6 +220,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 	if (!(flags & FAULT_FLAG_USER))
 		goto lock_mmap;
 
+lock_vma:
 	vma = lock_vma_under_rcu(mm, address);
 	if (!vma)
 		goto lock_mmap;
@@ -265,6 +267,12 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 			no_context(regs, write, address);
 		return;
 	}
+
+	if (!vma_lock_retried) {
+		vma_lock_retried = true;
+		goto lock_vma;
+	}
+
 lock_mmap:
 
 retry:
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 806c74e0d5ab..06018b6d7086 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -422,6 +422,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	int is_write = page_fault_is_write(error_code);
 	vm_fault_t fault, major = 0;
 	bool kprobe_fault = kprobe_page_fault(regs, 11);
+	bool vma_lock_retried = false;
 
 	if (unlikely(debugger_fault_handler(regs) || kprobe_fault))
 		return 0;
@@ -487,6 +488,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (!(flags & FAULT_FLAG_USER))
 		goto lock_mmap;
 
+lock_vma:
 	vma = lock_vma_under_rcu(mm, address);
 	if (!vma)
 		goto lock_mmap;
@@ -517,6 +519,11 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	if (fault_signal_pending(fault, regs))
 		return user_mode(regs) ? 0 : SIGBUS;
 
+	if (!vma_lock_retried) {
+		vma_lock_retried = true;
+		goto lock_vma;
+	}
+
 lock_mmap:
 
 	/* When running in the kernel we expect faults to occur only to
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae4..ff861793dba9 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -284,6 +284,7 @@ void handle_page_fault(struct pt_regs *regs)
 	unsigned int flags = FAULT_FLAG_DEFAULT;
 	int code = SEGV_MAPERR;
 	vm_fault_t fault;
+	bool vma_lock_retried = false;
 
 	cause = regs->cause;
 	addr = regs->badaddr;
@@ -347,6 +348,7 @@ void handle_page_fault(struct pt_regs *regs)
 	if (!(flags & FAULT_FLAG_USER))
 		goto lock_mmap;
 
+lock_vma:
 	vma = lock_vma_under_rcu(mm, addr);
 	if (!vma)
 		goto lock_mmap;
@@ -376,6 +378,12 @@ void handle_page_fault(struct pt_regs *regs)
 			no_context(regs, addr);
 		return;
 	}
+
+	if (!vma_lock_retried) {
+		vma_lock_retried = true;
+		goto lock_vma;
+	}
+
 lock_mmap:
 
 retry:
diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
index 46d828926009..dcd1ba24497f 100644
--- a/arch/s390/mm/fault.c
+++ b/arch/s390/mm/fault.c
@@ -271,6 +271,7 @@ static void do_exception(struct pt_regs *regs, int access)
 	unsigned int flags;
 	vm_fault_t fault;
 	bool is_write;
+	bool vma_lock_retried = false;
 
 	/*
 	 * The instruction that caused the program check has
@@ -294,6 +295,7 @@ static void do_exception(struct pt_regs *regs, int access)
 		flags |= FAULT_FLAG_WRITE;
 	if (!(flags & FAULT_FLAG_USER))
 		goto lock_mmap;
+lock_vma:
 	vma = lock_vma_under_rcu(mm, address);
 	if (!vma)
 		goto lock_mmap;
@@ -318,6 +320,10 @@ static void do_exception(struct pt_regs *regs, int access)
 			handle_fault_error_nolock(regs, 0);
 		return;
 	}
+	if (!vma_lock_retried) {
+		vma_lock_retried = true;
+		goto lock_vma;
+	}
 lock_mmap:
 retry:
 	vma = lock_mm_and_find_vma(mm, address, regs);
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index aa88370ce739..df10d5cea4ee 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1222,6 +1222,7 @@ void do_user_addr_fault(struct pt_regs *regs,
 	struct mm_struct *mm;
 	vm_fault_t fault;
 	unsigned int flags = FAULT_FLAG_DEFAULT;
+	bool vma_lock_retried = false;
 
 	tsk = current;
 	mm = tsk->mm;
@@ -1331,6 +1332,7 @@ void do_user_addr_fault(struct pt_regs *regs,
 	if (!(flags & FAULT_FLAG_USER))
 		goto lock_mmap;
 
+lock_vma:
 	vma = lock_vma_under_rcu(mm, address);
 	if (!vma)
 		goto lock_mmap;
@@ -1360,6 +1362,12 @@ void do_user_addr_fault(struct pt_regs *regs,
 						 ARCH_DEFAULT_PKEY);
 		return;
 	}
+
+	if (!vma_lock_retried) {
+		vma_lock_retried = true;
+		goto lock_vma;
+	}
+
 lock_mmap:
 
 retry:

base-commit: 3628c3df6cd2797b34714d23113cd44cb30801e7
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
