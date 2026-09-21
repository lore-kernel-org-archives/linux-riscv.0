Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4771C982ED
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1sf7BbuCsSe3rkh9Nt1k4MBG6A4Byuhs9vMtL+zsfsw=; b=mBQ0EuewDLNv0l
	OvigUU6qx6B3Ewh9hocuebUVnQNe9lAL5rdKt85sGFkQTdzV/qi5otwwpJ/OOcnWLXkQ8L7ACt870
	plSkIo2swcGpLL7PevFh4CYXcXHDNIttAodMf4vb4OjHjCEuNfty+glGscTLWSLoIGMk8eYndYm8K
	ipcNFNWpuiwGAJDrbIO9SV5Piv0gcwLIu6E42K/8LzqF0IZdXx1q8pk7LiEIBfM629aHfD3DzzVOt
	hAE6HU2DdeDpbla0w5qm0yzRTA56VlstuR3BjQOVT85brbfA+Id/Fal0f1LHAx8ORkXF1U2OVn0jQ
	8X8m/thwFeSbRMReXrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bye-00000001q9n-1Tik;
	Mon, 21 Sep 2026 11:14:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byb-00000001q90-1WT9
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qHUJIBm2U4V64OwaSBxvcTjq0/clFqcHASwuFrVtamA=; b=dq6f9BrWHp55meJLH+CzXuPJ1B
	QTH0KWUYurtnErIy2RyuPKjjRxeejwVyV/UAfWiplifZB6lVtLRhsg0ID9C4tmgHx0PoZrlfiJMA3
	buLbof93eweffTVlRp+se5f/nFk/bI1qNS0nctT8Zd8AOYYmZTetlhxsMyDEW0O6w+EmlxtAwWgIK
	z+QXVpXzCCxWz5xD3lQgtkytXL/brzoF2S21dH4w2ZQMPHt2+KCo6rSiFn1f+q3yXmGKbyeD70Wpv
	I0IbkPnOFJEY5V41K61NvGyZKZ/aEt/0Cb0ybSE6Yea5/rpKIUj39E3QhE40WZD6eGODRbYUHF7Pi
	nYxYRelA==;
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8byU-0000000CB24-0bXk
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 11:14:22 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so1931958a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989255; x=1790594055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHUJIBm2U4V64OwaSBxvcTjq0/clFqcHASwuFrVtamA=;
        b=beTVo7EhWQSWptzjMV9NLyweWMJG+mrIXeoH4I6oW2Dv3dIhliLUuYhO0NS69GiDh0
         hlqt6qEjFvLNJH/6hlf5qNzZCJoyplIWE189S4loTzoyqoNkYBwlfJgszGTnPginO3hn
         hdMiPrNv7+cXdmM6WrDmje6jRSJT62CbQ6MR/A76C8gxPS2eFsCEn+eCRShr4dktGw4a
         7En/jTh9C/SDB/LbvEOm/Ml2w5ctIqycM7oqemn7lSR225HXnmnLdzxU3MSy5aFuTJZx
         OZP/28hW6x5LodumQRIKZv7pvtpFIDmkaYhezlICs+Y06LwwB1sviVJ8zzwsK5mI9uNG
         2Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989255; x=1790594055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHUJIBm2U4V64OwaSBxvcTjq0/clFqcHASwuFrVtamA=;
        b=wlUe2VSijk1OI4NmQrSjboucBJ80vQgKDB04G5ymTC5EjrNCQlbrc2UaghKC+bUYeh
         uoZ+wEqqCT1nICs/VTqWnDFdCtl9Kr8GuxkiNLxuZfbBTRA7f5ZE1B4xD18rNZwU7jCp
         spGC9YmiQgi57d0DyxcPuBA98CSL77MqaH86NynUshu+y8EpHMMgumsS8+v0CcH5+a8A
         xNorG4zI6N5wmOtvWw9wwRdQVMKQQco7q1RWqPG2UBhjAm6u/kbOJbRO98f4aXSwPCvj
         cgTzIivlMIGqRHcQ+iAiahgAfA5kWB2rN6uZXGzoMdBDu8/P3CqPYtQDN0I2ikd2+G6R
         qdSg==
X-Forwarded-Encrypted: i=1; AKwUvBzoDzDOdLQenEFo7C4I4FnKrona+3ga3Z57Hvrlb+zEWSb4CovT1iSDQtBWn4KKc91d9K8LxvdluXr9Aw==@lists.infradead.org
X-Gm-Message-State: AFuF++m6oLgv51p0YfsDaKsAM0I+/kFp89ooGVg6hYLRWeS5763W9GZ0
	vROxowHrwcofrj3qRTEOzOi1vyucWnuZBZvKdLgnXuuzC6PIY/WpTACZ
X-Gm-Gg: AYBFou1R6Szq+BPOh8UJ6JTOE13XxQbOWzVlHpHBBrKPajOuXHMrq+DUIgzhuvuf6RU
	0uwfvMA2YbdmS9oGJ32NTQxWQKUQ55uCasoOo9EChzjl845GcDA45QGRWZ8Icy/iH9CkCnPc7Wq
	bs7j1IBb9YXs3lvbMKw/WezFwXrFbuGeYknU3qpxsbYlqRIiyM6TFqM8ZDf9DL70DlYjnxphneS
	UTz1NWKoK6LVRPB3Leoc53UETPdJTHEkBkvzvQCcgWr/L3DxlbVxpsh2IAb2XT6NaZ2HjdDXQ0l
	efMwvFz0GFB0cvu7mKvjFY6T2RLsVpZiA2ibimO0LOlZ6V0YEehytN9KkZfn6bxmgSiGOPgIIyQ
	mmeuhbl5ox6Ju7qQkp79wpu9v+LGpyeOvrH5pggSyOPfRmgSyc4ti4XOaiozI0kxNprp8vVM4GA
	uVE3ZFO1BLrVTNHS3BeeFqlTMisk1zt0FeijuWjMFI84f7E+wR2FdMxuqaEtQ8xrH/2yXHbOtZp
	plQQQUbzE2f8NTkHxLsfA==
X-Received: by 2002:a17:90b:2d0c:b0:39e:6c6a:4b77 with SMTP id 98e67ed59e1d1-39e6c6a5492mr9909928a91.65.1789989255197;
        Mon, 21 Sep 2026 04:14:15 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:14 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 0/5] KVM: riscv: Age G-stage PTEs locklessly
Date: Mon, 21 Sep 2026 20:13:57 +0900
Message-ID: <20260921111402.120911-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121420_209769_AF2B4F38 
X-CRM114-Status: GOOD (  12.94  )
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

Aging G-stage PTEs currently runs with mmu_lock held for write, taken
by the common MMU notifier code. When MGLRU or kswapd ages a large
range, every vCPU taking a G-stage fault blocks on the lock, and the
dirty-logging read-side fast path blocks behind aging as well.

This series lets RISC-V select KVM_MMU_LOCKLESS_AGING, so G-stage
aging can run without mmu_lock while protecting page-table walks with
RCU.

  1. Age all G-stage PTEs in a GFN range
     Bug fix, posted separately [1] and included unchanged so the
     series applies on riscv_kvm_queue. Drop it if already applied.

  2. Read G-stage PTEs once when walking page tables
     A lockless walker must derive presence, leaf-ness and the child
     address from a single snapshot of each entry.

  3. Write-protect G-stage PTEs atomically
     Aging will clear the Accessed bit without mmu_lock; the plain
     read-modify-write in GSTAGE_OP_WP could clobber that update.

  4. Free G-stage page tables after an RCU grace period
     Table pages and the root outlive any RCU reader. Root teardown
     keeps pgd_levels intact so a walker holding the old root sees
     consistent metadata.

  5. Age G-stage PTEs locklessly
     Select KVM_MMU_LOCKLESS_AGING and walk under rcu_read_lock().

This builds on Jinyu Tang's rwlock and cmpxchg helpers already in
riscv_kvm_queue. Wang Yechao's huge page recovery series [2] adds a
second page-table free site in kvm_riscv_gstage_recover_huge();
whichever lands second will need to switch that put_page() to
gstage_free_page_table(). I can rebase the series as needed.

A possible follow-up is to run clear-dirty-log and the general fault
path under the read side of mmu_lock, as arm64 and x86 do. Patch 3
provides the atomic write-protection needed for the former.

Testing
-------
QEMU virt, -cpu rv64,h=true (Svadu), 4 vCPUs, TCG. The host kernel
was built with KASAN, PROVE_LOCKING, PROVE_RCU, LOCK_STAT and LRU_GEN.

After each patch:
  - dirty_log_perf_test -v 2 -b 256M -i 3
  - access_tracking_perf_test -v 2 -b 256M -s anonymous_thp
    (2M THP disabled and 64K mTHP enabled)
  - 20 VM create/destroy iterations

With MGLRU aging forced on the VM's cgroup every 50-100ms:
  - dirty_log_perf_test -v 3 -b 256M -i 3
  - 30 VM create/destroy iterations

With CONFIG_KVM=m, 5 module load/unload cycles, each with a VM created
and destroyed immediately before module unload, to exercise module
teardown after queuing RCU frees.

No WARN, KASAN, lockdep or RCU reports were observed. The kvm_age_hva
tracepoint recorded approximately 65k events per aging pass.

Performance results from dirty_log_perf_test -v 3 -b 256M -i 3, with
lock_stat enabled for mmu_lock and 86 aging passes:

                           no aging          aging
                         before  after     before   after
  guest dirty time       12.5s   12.4s     18.6s    16.7s
  mmu_lock W wait total  0.15s   0.17s     44.4s    0.15s
  mmu_lock W contentions  35k     35k      1.0M     30k
  mmu_lock R wait total   0       0        7.5s     0

Before the series, 93% of write-lock waiters were from
kvm_mmu_notifier_clear_young(), and the dirty-log read-side fast path
waited for mmu_lock 352k times. After the series, aging does not
acquire mmu_lock.

Absolute numbers are inflated by TCG; only the relative change is
meaningful. Under TCG, the atomic write-protect change in patch 3
increased the clear-dirty-log time from approximately 16ms to 30ms,
as TCG serialises AMO instructions; hardware numbers would be welcome.

[1] https://lore.kernel.org/all/20260918072622.284188-1-suunj1331@gmail.com/
[2] https://lore.kernel.org/kvm-riscv/20260914055936.3672758-1-wang.yechao255@zte.com.cn/

SeungJu Cheon (5):
  KVM: riscv: Age all G-stage PTEs in a GFN range
  KVM: riscv: Read G-stage PTEs once when walking page tables
  KVM: riscv: Write-protect G-stage PTEs atomically
  KVM: riscv: Free G-stage page tables after an RCU grace period
  KVM: riscv: Age G-stage PTEs locklessly

 arch/riscv/include/asm/kvm_gstage.h |   4 +-
 arch/riscv/kvm/Kconfig              |   1 +
 arch/riscv/kvm/gstage.c             | 111 +++++++++++++++++++++-------
 arch/riscv/kvm/main.c               |   3 +
 arch/riscv/kvm/mmu.c                |  56 +++++++-------
 5 files changed, 117 insertions(+), 58 deletions(-)


base-commit: 41e81f7e3ef96594fb840445343c0ee7723aa550
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
