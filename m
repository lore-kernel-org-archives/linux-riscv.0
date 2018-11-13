Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A805C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 11:25:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C45522419
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 11:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KzS3fOac";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2rG79z0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C45522419
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rzj8HsUzZflxiRd/UugZPqtWaF7i4VeMKQl14gN1FFs=; b=KzS3fOaciPLXWq
	Smjh93EiRdpSH58R6my8OUzMDK8RScqM3fCRWUy6cG4HLTByWzoYmufmVc2KYUddQR6EgFaA9SJ0T
	TxOp199F85/bU14F2gWFM+rWuyBuKHeKV2/mHM6Y8is5dQcIuX4HUfHl8uyzqSE8x7OvtEW8Q4LFm
	Rub19DD7P9q5yZz9uzRPQ69XRhY9v8ccphCFU9MqTQkqNiqpJBmk/YSURWZ7nBt3be0mFhtkEijr8
	rcg5W/70t6ul8y+JHSw5Gyn3zx0sEk/8UI9ZLcS7YIL4lK2bDjxrzt9bpBoejdFaC78O12FshKYtO
	kDy5KBZASOfYp5CvZTJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMWox-00087Y-Qt; Tue, 13 Nov 2018 11:25:27 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMWot-00086q-Re
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 11:25:26 +0000
Received: by mail-wm1-x343.google.com with SMTP id i73-v6so6218501wmd.5
 for <linux-riscv@lists.infradead.org>; Tue, 13 Nov 2018 03:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c2G0DzFCdYbb/N80ZtMvLy5kGBcGvdpkTApPhqB2Bms=;
 b=e2rG79z0WVI5Awrph7WymBZS/KsZ+VBocUExQn7nuAb7Tfayn3ZvsHkHStzdFuUPMk
 ri/yWWsid795pRe0rFeDXUiIGRjLWM97gfEtnv72IU4S9GPytWCSYddLDbG53kYkCp4C
 TdtzVJqeBpopEFt/Uk0df8xYAiqy7s8cnA/HGvtJWa4djJcAncICnj1DmVqL+rRdlJu/
 pAs0MKU5l2M2zGqjxu2Ba5S0++i/Dd4hsngqWD8mw2AmEWjgIudp92vsn2pszn95yXh7
 rh3d/vpu3vRcJG/say9tMPXfhGrOQTb47uyTH65S5DNXBPSjDxYtwUBnxkUgAA/KXEJn
 De9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=c2G0DzFCdYbb/N80ZtMvLy5kGBcGvdpkTApPhqB2Bms=;
 b=BtE96pCERlACxGZ22OWLIsMtUDdalhSEaop1iqcuH+D9dmM2h0MgIGuKtCbSUItig/
 i7n3zph0cpYns+sXURtKM+tg3gm+JLxOCTXyXbAxvpVBaUH3GUPxrpcU8ARD39Nxq3Rx
 Oc6fBrUlm9wnHmCRVjNcbEPTaa2cgj7dqXPt/L0WmfRwsPZd0x13wwsyABq//vNcqTjC
 CrdkyYGmKTaT0CExqaAQKWOUW+N/+2+afnvOHpx57OlC6FrU+XY7ALeOMDZiBCz6EgTB
 JSn4pt4DImIlkxzrF9yjkZPi22ZOqZ3ufGA3DYVwrb611u16YWCl9pZ7rx5WDaWNPWR9
 K/Ig==
X-Gm-Message-State: AGRZ1gKv3oowyDV4Kg1V5razJiu4ikYU+ehc/daSZMKr2k0BYa8C9pWl
 2C2HElHetRb2r4oygg6bvR4=
X-Google-Smtp-Source: AJdET5e+i7tkiwAqOnlQFHthKIGBB2KWowlVpBV3PrJICHIg0szUNxotd/k5MD1GVbjprHGDWXw1KQ==
X-Received: by 2002:a1c:f14:: with SMTP id 20-v6mr2812868wmp.126.1542108311397; 
 Tue, 13 Nov 2018 03:25:11 -0800 (PST)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id x65-v6sm9942872wmg.9.2018.11.13.03.25.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Nov 2018 03:25:10 -0800 (PST)
Date: Tue, 13 Nov 2018 12:25:07 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Palmer Dabbelt <palmer@sifive.com>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Documentation/features: Refresh the features list to v4.20-rc2
Message-ID: <20181113112507.GA14028@gmail.com>
References: <20181113020113.29640-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181113_032523_927575_149C6AE1 
X-CRM114-Status: GOOD (  20.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: andrea.parri@amarulasolutions.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net,
 yamada.masahiro@socionext.com, jhogan@kernel.org, linux-doc@vger.kernel.org,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 david.abdurachmanov@gmail.com, dhowells@redhat.com, jcmvbkbc@gmail.com,
 rmk+kernel@armlinux.org.uk, mathieu.desnoyers@efficios.com, ren_guo@c-sky.com,
 jglisse@redhat.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113112507.0lczBdyNpOUdUXDae_dEoFx3r7lqVcqcC4Y73KjJHVM@z>


* Palmer Dabbelt <palmer@sifive.com> wrote:

> I didn't even know this existed until David submitted a patch set that
> included updates to the documentation as a result of some features he
> added to RISC-V.  It looks like there may be a handful of other people
> who don't know this exists either, so I figured I'd just mail out a
> patch set containing all the updates split out as well as I can.
> 
> This smells like something that sholud be automatic, so if I'm jumping
> the gun here then feel free to drop this.  If nobody says anything then
> I guess I'll submit this as a separate PR to Linus from my personal
> tree, as it's not really a RISC-V thing but it seems like it's worth
> having docs that match the code where it's trivial -- I assume that's
> what this does, I didn't actually read anything but the diff because I
> never trust documentation to be up to date...
> 
> I feel compelled to say something like "maybe this should be part of
> checkpatch?", but I'm definately not looking to learn perl :)

I don't think it should be automated or part of checkpatch, but I 
(obviously) agree with the changes, except that I think it should be a 
single patch (combined patch attached below).

Thanks,

	Ingo

Subject: Documentation/features: Refresh the features list to v4.20-rc2
From: Palmer Dabbelt <palmer@sifive.com>

Run Documentation/features/scripts/feature-refresh.sh to refresh the 
kernel features support matrix list:

 - The new 'csky' architecture was added
 - s390    now supports KASAN
 - powerpc now supports stackprotector
 - xtensa  now supports sg-chain
 - arm64   now supports queued-spinlocks
 - parisc  now supports kprobes-events
 - RISC-V  now supports pte_special

[ mingo: combined the patches and the changelogs. ]

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---

 Documentation/features/core/cBPF-JIT/arch-support.txt              | 1 +
 Documentation/features/core/eBPF-JIT/arch-support.txt              | 1 +
 Documentation/features/core/generic-idle-thread/arch-support.txt   | 1 +
 Documentation/features/core/jump-labels/arch-support.txt           | 1 +
 Documentation/features/core/tracehook/arch-support.txt             | 1 +
 Documentation/features/debug/KASAN/arch-support.txt                | 3 ++-
 Documentation/features/debug/gcov-profile-all/arch-support.txt     | 1 +
 Documentation/features/debug/kgdb/arch-support.txt                 | 1 +
 Documentation/features/debug/kprobes-on-ftrace/arch-support.txt    | 1 +
 Documentation/features/debug/kprobes/arch-support.txt              | 1 +
 Documentation/features/debug/kretprobes/arch-support.txt           | 1 +
 Documentation/features/debug/optprobes/arch-support.txt            | 1 +
 Documentation/features/debug/stackprotector/arch-support.txt       | 3 ++-
 Documentation/features/debug/uprobes/arch-support.txt              | 1 +
 Documentation/features/debug/user-ret-profiler/arch-support.txt    | 1 +
 Documentation/features/io/dma-contiguous/arch-support.txt          | 1 +
 Documentation/features/io/sg-chain/arch-support.txt                | 3 ++-
 Documentation/features/locking/cmpxchg-local/arch-support.txt      | 1 +
 Documentation/features/locking/lockdep/arch-support.txt            | 1 +
 Documentation/features/locking/queued-rwlocks/arch-support.txt     | 1 +
 Documentation/features/locking/queued-spinlocks/arch-support.txt   | 3 ++-
 Documentation/features/locking/rwsem-optimized/arch-support.txt    | 1 +
 Documentation/features/perf/kprobes-event/arch-support.txt         | 3 ++-
 Documentation/features/perf/perf-regs/arch-support.txt             | 1 +
 Documentation/features/perf/perf-stackdump/arch-support.txt        | 1 +
 Documentation/features/sched/membarrier-sync-core/arch-support.txt | 1 +
 Documentation/features/sched/numa-balancing/arch-support.txt       | 1 +
 Documentation/features/seccomp/seccomp-filter/arch-support.txt     | 1 +
 Documentation/features/time/arch-tick-broadcast/arch-support.txt   | 1 +
 Documentation/features/time/clockevents/arch-support.txt           | 1 +
 Documentation/features/time/context-tracking/arch-support.txt      | 1 +
 Documentation/features/time/irq-time-acct/arch-support.txt         | 1 +
 Documentation/features/time/modern-timekeeping/arch-support.txt    | 1 +
 Documentation/features/time/virt-cpuacct/arch-support.txt          | 1 +
 Documentation/features/vm/ELF-ASLR/arch-support.txt                | 1 +
 Documentation/features/vm/PG_uncached/arch-support.txt             | 1 +
 Documentation/features/vm/THP/arch-support.txt                     | 1 +
 Documentation/features/vm/TLB/arch-support.txt                     | 1 +
 Documentation/features/vm/huge-vmap/arch-support.txt               | 1 +
 Documentation/features/vm/ioremap_prot/arch-support.txt            | 1 +
 Documentation/features/vm/numa-memblock/arch-support.txt           | 1 +
 Documentation/features/vm/pte_special/arch-support.txt             | 3 ++-
 42 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/Documentation/features/core/cBPF-JIT/arch-support.txt b/Documentation/features/core/cBPF-JIT/arch-support.txt
index 90459cdde314..8620c38d4db0 100644
--- a/Documentation/features/core/cBPF-JIT/arch-support.txt
+++ b/Documentation/features/core/cBPF-JIT/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: | TODO |
     |       arm64: | TODO |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/core/eBPF-JIT/arch-support.txt b/Documentation/features/core/eBPF-JIT/arch-support.txt
index c90a0382fe66..9ae6e8d0d10d 100644
--- a/Documentation/features/core/eBPF-JIT/arch-support.txt
+++ b/Documentation/features/core/eBPF-JIT/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/core/generic-idle-thread/arch-support.txt b/Documentation/features/core/generic-idle-thread/arch-support.txt
index 0ef6acdb991c..365df2c2ff0b 100644
--- a/Documentation/features/core/generic-idle-thread/arch-support.txt
+++ b/Documentation/features/core/generic-idle-thread/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: |  ok  |
     |       h8300: | TODO |
     |     hexagon: |  ok  |
     |        ia64: |  ok  |
diff --git a/Documentation/features/core/jump-labels/arch-support.txt b/Documentation/features/core/jump-labels/arch-support.txt
index 27cbd63abfd2..c29146c5741e 100644
--- a/Documentation/features/core/jump-labels/arch-support.txt
+++ b/Documentation/features/core/jump-labels/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/core/tracehook/arch-support.txt b/Documentation/features/core/tracehook/arch-support.txt
index f44c274e40ed..d344b99aae1e 100644
--- a/Documentation/features/core/tracehook/arch-support.txt
+++ b/Documentation/features/core/tracehook/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: |  ok  |
+    |        csky: |  ok  |
     |       h8300: | TODO |
     |     hexagon: |  ok  |
     |        ia64: |  ok  |
diff --git a/Documentation/features/debug/KASAN/arch-support.txt b/Documentation/features/debug/KASAN/arch-support.txt
index 282ecc8ea1da..c68adfc1db0e 100644
--- a/Documentation/features/debug/KASAN/arch-support.txt
+++ b/Documentation/features/debug/KASAN/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: | TODO |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
@@ -23,7 +24,7 @@
     |      parisc: | TODO |
     |     powerpc: | TODO |
     |       riscv: | TODO |
-    |        s390: | TODO |
+    |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
     |          um: | TODO |
diff --git a/Documentation/features/debug/gcov-profile-all/arch-support.txt b/Documentation/features/debug/gcov-profile-all/arch-support.txt
index 01b2b3004e0a..059d58a549c7 100644
--- a/Documentation/features/debug/gcov-profile-all/arch-support.txt
+++ b/Documentation/features/debug/gcov-profile-all/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/debug/kgdb/arch-support.txt b/Documentation/features/debug/kgdb/arch-support.txt
index 3b4dff22329f..3e6b8f07d5d0 100644
--- a/Documentation/features/debug/kgdb/arch-support.txt
+++ b/Documentation/features/debug/kgdb/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: |  ok  |
     |     hexagon: |  ok  |
     |        ia64: | TODO |
diff --git a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
index 7e963d0ae646..68f266944d5f 100644
--- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
+++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: | TODO |
     |       arm64: | TODO |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/debug/kprobes/arch-support.txt b/Documentation/features/debug/kprobes/arch-support.txt
index 4ada027faf16..f4e45bd58fea 100644
--- a/Documentation/features/debug/kprobes/arch-support.txt
+++ b/Documentation/features/debug/kprobes/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: |  ok  |
diff --git a/Documentation/features/debug/kretprobes/arch-support.txt b/Documentation/features/debug/kretprobes/arch-support.txt
index 044e13fcca5d..1d5651ef11f8 100644
--- a/Documentation/features/debug/kretprobes/arch-support.txt
+++ b/Documentation/features/debug/kretprobes/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: |  ok  |
diff --git a/Documentation/features/debug/optprobes/arch-support.txt b/Documentation/features/debug/optprobes/arch-support.txt
index dce7669c918f..fb297a88f62c 100644
--- a/Documentation/features/debug/optprobes/arch-support.txt
+++ b/Documentation/features/debug/optprobes/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: | TODO |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/debug/stackprotector/arch-support.txt b/Documentation/features/debug/stackprotector/arch-support.txt
index 954ac1c95553..32bbdfc64c32 100644
--- a/Documentation/features/debug/stackprotector/arch-support.txt
+++ b/Documentation/features/debug/stackprotector/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
@@ -21,7 +22,7 @@
     |       nios2: | TODO |
     |    openrisc: | TODO |
     |      parisc: | TODO |
-    |     powerpc: | TODO |
+    |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: | TODO |
     |          sh: |  ok  |
diff --git a/Documentation/features/debug/uprobes/arch-support.txt b/Documentation/features/debug/uprobes/arch-support.txt
index 1a3f9d3229bf..1c577d0cfc7f 100644
--- a/Documentation/features/debug/uprobes/arch-support.txt
+++ b/Documentation/features/debug/uprobes/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/debug/user-ret-profiler/arch-support.txt b/Documentation/features/debug/user-ret-profiler/arch-support.txt
index 1d78d1069a5f..6bfa36b0e017 100644
--- a/Documentation/features/debug/user-ret-profiler/arch-support.txt
+++ b/Documentation/features/debug/user-ret-profiler/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: | TODO |
     |       arm64: | TODO |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/io/dma-contiguous/arch-support.txt b/Documentation/features/io/dma-contiguous/arch-support.txt
index 30c072d2b67c..eb28b5c97ca6 100644
--- a/Documentation/features/io/dma-contiguous/arch-support.txt
+++ b/Documentation/features/io/dma-contiguous/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: |  ok  |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/io/sg-chain/arch-support.txt b/Documentation/features/io/sg-chain/arch-support.txt
index 6554f0372c3f..3c85efb8bc8d 100644
--- a/Documentation/features/io/sg-chain/arch-support.txt
+++ b/Documentation/features/io/sg-chain/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: |  ok  |
@@ -29,5 +30,5 @@
     |          um: | TODO |
     |   unicore32: | TODO |
     |         x86: |  ok  |
-    |      xtensa: | TODO |
+    |      xtensa: |  ok  |
     -----------------------
diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.txt b/Documentation/features/locking/cmpxchg-local/arch-support.txt
index 51704a2dc8d1..242ff5a6586e 100644
--- a/Documentation/features/locking/cmpxchg-local/arch-support.txt
+++ b/Documentation/features/locking/cmpxchg-local/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: | TODO |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/locking/lockdep/arch-support.txt b/Documentation/features/locking/lockdep/arch-support.txt
index bd39c5edd460..941fd5b1094d 100644
--- a/Documentation/features/locking/lockdep/arch-support.txt
+++ b/Documentation/features/locking/lockdep/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: |  ok  |
     |        ia64: | TODO |
diff --git a/Documentation/features/locking/queued-rwlocks/arch-support.txt b/Documentation/features/locking/queued-rwlocks/arch-support.txt
index da7aff3bee0b..c683da198f31 100644
--- a/Documentation/features/locking/queued-rwlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-rwlocks/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: | TODO |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: |  ok  |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
index 478e9101322c..743aa6691715 100644
--- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
+++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
@@ -9,8 +9,9 @@
     |       alpha: | TODO |
     |         arc: | TODO |
     |         arm: | TODO |
-    |       arm64: | TODO |
+    |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/locking/rwsem-optimized/arch-support.txt b/Documentation/features/locking/rwsem-optimized/arch-support.txt
index e54b1f1a8091..7521d7500fbe 100644
--- a/Documentation/features/locking/rwsem-optimized/arch-support.txt
+++ b/Documentation/features/locking/rwsem-optimized/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: |  ok  |
diff --git a/Documentation/features/perf/kprobes-event/arch-support.txt b/Documentation/features/perf/kprobes-event/arch-support.txt
index 7331402d1887..86ae33c70475 100644
--- a/Documentation/features/perf/kprobes-event/arch-support.txt
+++ b/Documentation/features/perf/kprobes-event/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: |  ok  |
     |        ia64: | TODO |
@@ -20,7 +21,7 @@
     |       nds32: |  ok  |
     |       nios2: | TODO |
     |    openrisc: | TODO |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: |  ok  |
diff --git a/Documentation/features/perf/perf-regs/arch-support.txt b/Documentation/features/perf/perf-regs/arch-support.txt
index 53feeee6cdad..687d049d9cee 100644
--- a/Documentation/features/perf/perf-regs/arch-support.txt
+++ b/Documentation/features/perf/perf-regs/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/perf/perf-stackdump/arch-support.txt b/Documentation/features/perf/perf-stackdump/arch-support.txt
index 16164348e0ea..90996e3d18a8 100644
--- a/Documentation/features/perf/perf-stackdump/arch-support.txt
+++ b/Documentation/features/perf/perf-stackdump/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/sched/membarrier-sync-core/arch-support.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
index c7858dd1ea8f..8a521a622966 100644
--- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
+++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
@@ -34,6 +34,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/sched/numa-balancing/arch-support.txt b/Documentation/features/sched/numa-balancing/arch-support.txt
index c68bb2c2cb62..305601da4c05 100644
--- a/Documentation/features/sched/numa-balancing/arch-support.txt
+++ b/Documentation/features/sched/numa-balancing/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ..  |
     |       arm64: |  ok  |
     |         c6x: |  ..  |
+    |        csky: | TODO |
     |       h8300: |  ..  |
     |     hexagon: |  ..  |
     |        ia64: | TODO |
diff --git a/Documentation/features/seccomp/seccomp-filter/arch-support.txt b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
index d4271b493b41..4fe6c3c3be5c 100644
--- a/Documentation/features/seccomp/seccomp-filter/arch-support.txt
+++ b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/time/arch-tick-broadcast/arch-support.txt b/Documentation/features/time/arch-tick-broadcast/arch-support.txt
index 83d9e68462bb..593536f7925b 100644
--- a/Documentation/features/time/arch-tick-broadcast/arch-support.txt
+++ b/Documentation/features/time/arch-tick-broadcast/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/time/clockevents/arch-support.txt b/Documentation/features/time/clockevents/arch-support.txt
index 3d4908fce6da..7a27157da408 100644
--- a/Documentation/features/time/clockevents/arch-support.txt
+++ b/Documentation/features/time/clockevents/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: |  ok  |
+    |        csky: |  ok  |
     |       h8300: |  ok  |
     |     hexagon: |  ok  |
     |        ia64: | TODO |
diff --git a/Documentation/features/time/context-tracking/arch-support.txt b/Documentation/features/time/context-tracking/arch-support.txt
index c29974afffaa..048bfb6d3872 100644
--- a/Documentation/features/time/context-tracking/arch-support.txt
+++ b/Documentation/features/time/context-tracking/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/time/irq-time-acct/arch-support.txt b/Documentation/features/time/irq-time-acct/arch-support.txt
index 8d73c463ec27..a14bbad8e948 100644
--- a/Documentation/features/time/irq-time-acct/arch-support.txt
+++ b/Documentation/features/time/irq-time-acct/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: |  ..  |
diff --git a/Documentation/features/time/modern-timekeeping/arch-support.txt b/Documentation/features/time/modern-timekeeping/arch-support.txt
index e7c6ea6b8fb3..2855dfe2464d 100644
--- a/Documentation/features/time/modern-timekeeping/arch-support.txt
+++ b/Documentation/features/time/modern-timekeeping/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: | TODO |
     |       arm64: |  ok  |
     |         c6x: |  ok  |
+    |        csky: |  ok  |
     |       h8300: |  ok  |
     |     hexagon: |  ok  |
     |        ia64: |  ok  |
diff --git a/Documentation/features/time/virt-cpuacct/arch-support.txt b/Documentation/features/time/virt-cpuacct/arch-support.txt
index 4646457461cf..fb0d0cab9cab 100644
--- a/Documentation/features/time/virt-cpuacct/arch-support.txt
+++ b/Documentation/features/time/virt-cpuacct/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: |  ok  |
diff --git a/Documentation/features/vm/ELF-ASLR/arch-support.txt b/Documentation/features/vm/ELF-ASLR/arch-support.txt
index 1f71d090ff2c..adc25878d217 100644
--- a/Documentation/features/vm/ELF-ASLR/arch-support.txt
+++ b/Documentation/features/vm/ELF-ASLR/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/vm/PG_uncached/arch-support.txt b/Documentation/features/vm/PG_uncached/arch-support.txt
index fbd5aa463b0a..f05588f9e4b4 100644
--- a/Documentation/features/vm/PG_uncached/arch-support.txt
+++ b/Documentation/features/vm/PG_uncached/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: | TODO |
     |       arm64: | TODO |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: |  ok  |
diff --git a/Documentation/features/vm/THP/arch-support.txt b/Documentation/features/vm/THP/arch-support.txt
index 5d7ecc378f29..cf0393711cbe 100644
--- a/Documentation/features/vm/THP/arch-support.txt
+++ b/Documentation/features/vm/THP/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: |  ..  |
+    |        csky: | TODO |
     |       h8300: |  ..  |
     |     hexagon: |  ..  |
     |        ia64: | TODO |
diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
index f7af9678eb66..2bdd3b6cee3c 100644
--- a/Documentation/features/vm/TLB/arch-support.txt
+++ b/Documentation/features/vm/TLB/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: | TODO |
     |       arm64: | TODO |
     |         c6x: |  ..  |
+    |        csky: | TODO |
     |       h8300: |  ..  |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/vm/huge-vmap/arch-support.txt b/Documentation/features/vm/huge-vmap/arch-support.txt
index d0713ccc7117..019131c5acce 100644
--- a/Documentation/features/vm/huge-vmap/arch-support.txt
+++ b/Documentation/features/vm/huge-vmap/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: | TODO |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/vm/ioremap_prot/arch-support.txt b/Documentation/features/vm/ioremap_prot/arch-support.txt
index 8527601a3739..c6f3e4d68152 100644
--- a/Documentation/features/vm/ioremap_prot/arch-support.txt
+++ b/Documentation/features/vm/ioremap_prot/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: | TODO |
     |       arm64: | TODO |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
diff --git a/Documentation/features/vm/numa-memblock/arch-support.txt b/Documentation/features/vm/numa-memblock/arch-support.txt
index 1a988052cd24..e51cb9f7d166 100644
--- a/Documentation/features/vm/numa-memblock/arch-support.txt
+++ b/Documentation/features/vm/numa-memblock/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ..  |
     |       arm64: |  ok  |
     |         c6x: |  ..  |
+    |        csky: | TODO |
     |       h8300: |  ..  |
     |     hexagon: |  ..  |
     |        ia64: |  ok  |
diff --git a/Documentation/features/vm/pte_special/arch-support.txt b/Documentation/features/vm/pte_special/arch-support.txt
index a8378424bc98..3d492a34c8ee 100644
--- a/Documentation/features/vm/pte_special/arch-support.txt
+++ b/Documentation/features/vm/pte_special/arch-support.txt
@@ -11,6 +11,7 @@
     |         arm: |  ok  |
     |       arm64: |  ok  |
     |         c6x: | TODO |
+    |        csky: | TODO |
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
@@ -22,7 +23,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: |  ok  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
