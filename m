Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6701C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bgf7Asw7L6/EMaXr/VX9EgPl/duEYOuCeZYOidNFa+c=; b=o5M
	0Jlq1ljgw/NZKV5MM2EBSkHeuTPb1/Fz5R1llspaszBe0ALPWbSYdJumjs1j7bOxgPAJPuwLAoafF
	JSzKHWAVC9PkXFxqp37SJcBdbYx5iSAuiqjP+ZRS0EAgo/5RzyrrBaC5vBSykPwbbmbgpxo1jJT5d
	0DLphqdA+feJdG4nN8gmcQO4KjzoedWKqH9UTZNB7Z+HIYVfev13cX/LNU1ltD3tLfNWAxficsy7e
	5vPj7V3n/I567Ih6FPOJuHfR+2ryhNK0YkNdGaQX6z7Y5BEDd96ITvIKfq2H5Pgr0iYcRKEiZcDf+
	Q9eKrRfYsFcd5mGkexdTE6W2K+GO3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dox-00000003MNp-33Q9;
	Fri, 10 May 2024 00:09:07 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dot-00000003MLn-3bJd
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:06 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f49fc7b5e6so1545138b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299739; x=1715904539; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bo1DQSr4jeoMwucZlKpQtMrLuLapiyInOQ5h9cWuz8Y=;
        b=0mDbvmjlvtt4ApBQJ4JcL+Qr3AOjtRC/N0FixEH+2oUXjL4skZQ8GypoW9J2Hw1h3u
         G7UQQ1J+l0Qx3MpNvKbLrOmc2UH9HcCMgc6pMo870Hg3J9yddbO/9llR2QpUUs3BRib1
         FOJrQ/zp9Bsfb0y3RtsOpGp+G6RdnUKhedKLJKsw+D620Wl3OLN1vLbQ4ATg24AzHGpI
         +xDBGawM2V8m49IDEu3zAW3ywv0YCpgHRFTbZ6laTrevF3y7p+fVHo4ltrygUX7OfpCm
         /zByM3Zs/EoZnismPnwx14eMrJJyqhD3Cot6r6JXS96E0gaRK5ZdXWQomifZVNxwhyjw
         zmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299739; x=1715904539;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bo1DQSr4jeoMwucZlKpQtMrLuLapiyInOQ5h9cWuz8Y=;
        b=iRIISszy5mQbVPco8wfJkxSUSQbgbsZm4oYS+bJX5An/xQb4Bfkyt2KsBy996kX1Fc
         trvc6wJCTOBo1Jnii4Jbu4LP2zh4JZNq3ehdxuX/SnLa57gl8teA9D6/DvdFaSJGU1cT
         nA5SAx1BN+kgVmb1lkyQnQi1NdhKmbMYARemtYBvDYQWOl/GBxa2CPzeqAzhVeBkkjpS
         zoMfy+0WnO3YJQe7vWEbxWw32usYWfpUY2kGRYW0oo/gGha7LIb5FeFa+vMg6yVzdDFU
         Mmru+pm2qrUN4qpMPn5T2R+AMa5gbvk/xRa3/MyDtCjcS2yru4d6GZy3+cw1fRAh6Dhq
         FCzg==
X-Forwarded-Encrypted: i=1; AJvYcCUrlJ6EWlK4ydmnqOS0HuRJefWq5ZHX8tWmNDr0lIEAEPVRqWZVAasBLzGmfJuqiCk8XH/em4F5lYUHsUxVlNjfKdzo489avKaImBu6zy7A
X-Gm-Message-State: AOJu0YyEhVZ5ONKnXm7HlMvArexvtyEWkmbezXEFg/aFFEFgdbIjvZIf
	fLnC3lvSFckpGOLmlc6HXVHHSIczYTbi93Y2F9Kld7MTFjoH3HKYlL8rjRqFsxReI14yyGKfW5W
	FgA==
X-Google-Smtp-Source: AGHT+IFevppTYghzGS3NbDqgUuI48nvVvojUBATJvkqeviE3GCRsd38pVQ/JPSkjb40Dt1jixBfIDT20/L8=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3916:b0:6f3:84f4:78e3 with SMTP id
 d2e1a72fcca58-6f4e039e850mr66751b3a.4.1715299739523; Thu, 09 May 2024
 17:08:59 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:17 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-1-edliaw@google.com>
Subject: [PATCH v4 00/66] Define _GNU_SOURCE for sources using
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_170904_006722_C53826C4 
X-CRM114-Status: UNSURE (   9.90  )
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

Centralizes the definition of _GNU_SOURCE into KHDR_INCLUDES and removes
redefinitions of _GNU_SOURCE from source code.

809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
asprintf into kselftest_harness.h, which is a GNU extension and needs
_GNU_SOURCE to either be defined prior to including headers or with the
-D_GNU_SOURCE flag passed to the compiler.

v1: https://lore.kernel.org/linux-kselftest/20240430235057.1351993-1-edliaw@google.com/
v2: https://lore.kernel.org/linux-kselftest/20240507214254.2787305-1-edliaw@google.com/
 - Add -D_GNU_SOURCE to KHDR_INCLUDES so that it is in a single
   location.
 - Remove #define _GNU_SOURCE from source code to resolve redefinition
   warnings.
v3: https://lore.kernel.org/linux-kselftest/20240509200022.253089-1-edliaw@google.com/
 - Rebase onto linux-next 20240508.
 - Split patches by directory.
 - Add -D_GNU_SOURCE directly to CFLAGS in lib.mk.
 - Delete additional _GNU_SOURCE definitions from source code in
   linux-next.
 - Delete additional -D_GNU_SOURCE flags from Makefiles.
v4:
 - Rebase onto linux-next 20240509.
 - Remove Fixes tag from patches that drop _GNU_SOURCE definition.
 - Restore space between comment and includes for selftests/damon.

Edward Liaw (66):
  selftests: Compile with -D_GNU_SOURCE when including lib.mk
  selftests/arm64: Drop define _GNU_SOURCE
  selftests/arm64: Drop duplicate -D_GNU_SOURCE
  selftests/bpf: Drop define _GNU_SOURCE
  selftests/breakpoints: Drop define _GNU_SOURCE
  selftests/cachestat: Drop define _GNU_SOURCE
  selftests/capabilities: Drop define _GNU_SOURCE
  selftests/cgroup: Drop define _GNU_SOURCE
  selftests/clone3: Drop define _GNU_SOURCE
  selftests/core: Drop define _GNU_SOURCE
  selftests/damon: Drop define _GNU_SOURCE
  selftests/drivers: Drop define _GNU_SOURCE
  selftests/exec: Drop duplicate -D_GNU_SOURCE
  selftests/fchmodat2: Drop define _GNU_SOURCE
  selftests/filelock: Drop define _GNU_SOURCE
  selftests/filesystems: Drop define _GNU_SOURCE
  selftests/firmware: Drop define _GNU_SOURCE
  selftests/fpu: Drop define _GNU_SOURCE
  selftests/futex: Drop define _GNU_SOURCE
  selftests/futex: Drop duplicate -D_GNU_SOURCE
  selftests/intel_pstate: Drop duplicate -D_GNU_SOURCE
  selftests/iommu: Drop duplicate -D_GNU_SOURCE
  selftests/ipc: Drop define _GNU_SOURCE
  selftests/kcmp: Drop define _GNU_SOURCE
  selftests/landlock: Drop define _GNU_SOURCE
  selftests/lsm: Drop define _GNU_SOURCE
  selftests/membarrier: Drop define _GNU_SOURCE
  selftests/memfd: Drop define _GNU_SOURCE
  selftests/mincore: Drop define _GNU_SOURCE
  selftests/mm: Drop define _GNU_SOURCE
  selftests/mount: Drop define _GNU_SOURCE
  selftests/mount_setattr: Drop define _GNU_SOURCE
  selftests/move_mount_set_group: Drop define _GNU_SOURCE
  selftests/mqueue: Drop define _GNU_SOURCE
  selftests/net: Drop define _GNU_SOURCE
  selftests/net: Drop duplicate -D_GNU_SOURCE
  selftests/nolibc: Drop define _GNU_SOURCE
  selftests/nsfs: Drop define _GNU_SOURCE
  selftests/openat2: Drop define _GNU_SOURCE
  selftests/perf_events: Drop define _GNU_SOURCE
  selftests/pid_namespace: Drop define _GNU_SOURCE
  selftests/pidfd: Drop define _GNU_SOURCE
  selftests/ptrace: Drop define _GNU_SOURCE
  selftests/powerpc: Drop define _GNU_SOURCE
  selftests/proc: Drop define _GNU_SOURCE
  selftests/proc: Drop duplicate -D_GNU_SOURCE
  selftests/ptp: Drop define _GNU_SOURCE
  selftests/resctrl: Drop duplicate -D_GNU_SOURCE
  selftests/riscv: Drop define _GNU_SOURCE
  selftests/riscv: Drop duplicate -D_GNU_SOURCE
  selftests/rlimits: Drop define _GNU_SOURCE
  selftests/rseq: Drop define _GNU_SOURCE
  selftests/safesetid: Drop define _GNU_SOURCE
  selftests/sched: Drop define _GNU_SOURCE
  selftests/seccomp: Drop define _GNU_SOURCE
  selftests/sigaltstack: Drop define _GNU_SOURCE
  selftests/splice: Drop define _GNU_SOURCE
  selftests/syscall_user_dispatch: Drop define _GNU_SOURCE
  selftests/thermal: Drop define _GNU_SOURCE
  selftests/timens: Drop define _GNU_SOURCE
  selftests/tmpfs: Drop duplicate -D_GNU_SOURCE
  selftests/uevent: Drop define _GNU_SOURCE
  selftests/user_events: Drop define _GNU_SOURCE
  selftests/vDSO: Drop define _GNU_SOURCE
  selftests/wireguard: Drop define _GNU_SOURCE
  selftests/x86: Drop define _GNU_SOURCE

 tools/testing/selftests/Makefile                             | 4 ++--
 tools/testing/selftests/arm64/fp/fp-ptrace.c                 | 3 ---
 tools/testing/selftests/arm64/fp/fp-stress.c                 | 2 --
 tools/testing/selftests/arm64/fp/vlset.c                     | 1 -
 tools/testing/selftests/arm64/mte/check_buffer_fill.c        | 3 ---
 tools/testing/selftests/arm64/mte/check_child_memory.c       | 3 ---
 tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c    | 3 ---
 tools/testing/selftests/arm64/mte/check_ksm_options.c        | 3 ---
 tools/testing/selftests/arm64/mte/check_mmap_options.c       | 3 ---
 tools/testing/selftests/arm64/mte/check_tags_inclusion.c     | 3 ---
 tools/testing/selftests/arm64/mte/check_user_mem.c           | 3 ---
 tools/testing/selftests/arm64/pauth/pac.c                    | 3 ---
 tools/testing/selftests/arm64/signal/Makefile                | 2 +-
 tools/testing/selftests/bpf/bench.c                          | 1 -
 tools/testing/selftests/bpf/benchs/bench_trigger.c           | 1 -
 tools/testing/selftests/bpf/cgroup_helpers.c                 | 1 -
 tools/testing/selftests/bpf/map_tests/task_storage_map.c     | 1 -
 tools/testing/selftests/bpf/network_helpers.c                | 2 --
 tools/testing/selftests/bpf/prog_tests/bind_perm.c           | 1 -
 tools/testing/selftests/bpf/prog_tests/bpf_cookie.c          | 1 -
 tools/testing/selftests/bpf/prog_tests/bpf_iter_setsockopt.c | 1 -
 tools/testing/selftests/bpf/prog_tests/bpf_obj_pinning.c     | 1 -
 tools/testing/selftests/bpf/prog_tests/btf_endian.c          | 1 -
 tools/testing/selftests/bpf/prog_tests/btf_skc_cls_ingress.c | 2 --
 tools/testing/selftests/bpf/prog_tests/cgrp_kfunc.c          | 2 --
 tools/testing/selftests/bpf/prog_tests/cgrp_local_storage.c  | 2 --
 tools/testing/selftests/bpf/prog_tests/cls_redirect.c        | 3 ---
 tools/testing/selftests/bpf/prog_tests/connect_ping.c        | 2 --
 tools/testing/selftests/bpf/prog_tests/core_retro.c          | 1 -
 tools/testing/selftests/bpf/prog_tests/d_path.c              | 1 -
 tools/testing/selftests/bpf/prog_tests/deny_namespace.c      | 1 -
 tools/testing/selftests/bpf/prog_tests/fexit_sleep.c         | 1 -
 .../selftests/bpf/prog_tests/flow_dissector_reattach.c       | 2 --
 tools/testing/selftests/bpf/prog_tests/get_stack_raw_tp.c    | 1 -
 tools/testing/selftests/bpf/prog_tests/htab_reuse.c          | 1 -
 tools/testing/selftests/bpf/prog_tests/htab_update.c         | 1 -
 tools/testing/selftests/bpf/prog_tests/map_in_map.c          | 1 -
 tools/testing/selftests/bpf/prog_tests/ns_current_pid_tgid.c | 2 --
 tools/testing/selftests/bpf/prog_tests/perf_branches.c       | 1 -
 tools/testing/selftests/bpf/prog_tests/perf_buffer.c         | 1 -
 tools/testing/selftests/bpf/prog_tests/perf_event_stackmap.c | 1 -
 tools/testing/selftests/bpf/prog_tests/perf_link.c           | 1 -
 tools/testing/selftests/bpf/prog_tests/perf_skip.c           | 2 --
 tools/testing/selftests/bpf/prog_tests/preempted_bpf_ma_op.c | 1 -
 tools/testing/selftests/bpf/prog_tests/rcu_read_lock.c       | 2 --
 tools/testing/selftests/bpf/prog_tests/reg_bounds.c          | 2 --
 tools/testing/selftests/bpf/prog_tests/ringbuf.c             | 1 -
 tools/testing/selftests/bpf/prog_tests/ringbuf_multi.c       | 1 -
 tools/testing/selftests/bpf/prog_tests/setget_sockopt.c      | 2 --
 tools/testing/selftests/bpf/prog_tests/sk_assign.c           | 2 --
 tools/testing/selftests/bpf/prog_tests/sk_lookup.c           | 2 --
 tools/testing/selftests/bpf/prog_tests/sock_fields.c         | 2 --
 tools/testing/selftests/bpf/prog_tests/task_kfunc.c          | 2 --
 tools/testing/selftests/bpf/prog_tests/task_local_storage.c  | 2 --
 tools/testing/selftests/bpf/prog_tests/task_pt_regs.c        | 1 -
 .../testing/selftests/bpf/prog_tests/tcp_custom_syncookie.c  | 2 --
 tools/testing/selftests/bpf/prog_tests/tcp_hdr_options.c     | 2 --
 tools/testing/selftests/bpf/prog_tests/test_bpf_ma.c         | 1 -
 .../selftests/bpf/prog_tests/test_bpf_syscall_macro.c        | 1 -
 tools/testing/selftests/bpf/prog_tests/test_bpffs.c          | 1 -
 tools/testing/selftests/bpf/prog_tests/test_overhead.c       | 1 -
 tools/testing/selftests/bpf/prog_tests/token.c               | 1 -
 tools/testing/selftests/bpf/prog_tests/trace_ext.c           | 2 --
 tools/testing/selftests/bpf/prog_tests/trampoline_count.c    | 1 -
 tools/testing/selftests/bpf/prog_tests/user_ringbuf.c        | 2 --
 tools/testing/selftests/bpf/prog_tests/xdp_bonding.c         | 2 --
 tools/testing/selftests/bpf/prog_tests/xdp_synproxy.c        | 2 --
 tools/testing/selftests/bpf/test_flow_dissector.c            | 3 ---
 tools/testing/selftests/bpf/test_lru_map.c                   | 1 -
 tools/testing/selftests/bpf/test_progs.c                     | 1 -
 tools/testing/selftests/bpf/test_sock_addr.c                 | 3 ---
 tools/testing/selftests/bpf/test_tcpnotify_user.c            | 1 -
 tools/testing/selftests/bpf/veristat.c                       | 1 -
 tools/testing/selftests/bpf/xskxceiver.c                     | 2 --
 tools/testing/selftests/breakpoints/breakpoint_test_arm64.c  | 3 ---
 .../testing/selftests/breakpoints/step_after_suspend_test.c  | 3 ---
 tools/testing/selftests/cachestat/test_cachestat.c           | 2 --
 tools/testing/selftests/capabilities/test_execve.c           | 2 --
 tools/testing/selftests/cgroup/cgroup_util.c                 | 3 ---
 tools/testing/selftests/cgroup/test_core.c                   | 2 --
 tools/testing/selftests/cgroup/test_cpu.c                    | 2 --
 tools/testing/selftests/cgroup/test_hugetlb_memcg.c          | 2 --
 tools/testing/selftests/cgroup/test_kmem.c                   | 2 --
 tools/testing/selftests/cgroup/test_memcontrol.c             | 2 --
 tools/testing/selftests/cgroup/test_zswap.c                  | 2 --
 tools/testing/selftests/clone3/clone3.c                      | 2 --
 .../testing/selftests/clone3/clone3_cap_checkpoint_restore.c | 2 --
 tools/testing/selftests/clone3/clone3_clear_sighand.c        | 2 --
 tools/testing/selftests/clone3/clone3_selftests.h            | 1 -
 tools/testing/selftests/clone3/clone3_set_tid.c              | 2 --
 tools/testing/selftests/core/close_range_test.c              | 2 --
 tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c  | 2 --
 .../damon/debugfs_target_ids_read_before_terminate_race.c    | 1 -
 tools/testing/selftests/drivers/dma-buf/udmabuf.c            | 1 -
 tools/testing/selftests/exec/Makefile                        | 1 -
 tools/testing/selftests/fchmodat2/fchmodat2_test.c           | 2 --
 tools/testing/selftests/filelock/ofdlocks.c                  | 2 --
 tools/testing/selftests/filesystems/binderfs/binderfs_test.c | 2 --
 tools/testing/selftests/filesystems/devpts_pts.c             | 1 -
 tools/testing/selftests/filesystems/dnotify_test.c           | 1 -
 .../testing/selftests/filesystems/epoll/epoll_wakeup_test.c  | 2 --
 tools/testing/selftests/filesystems/eventfd/eventfd_test.c   | 2 --
 tools/testing/selftests/filesystems/fat/rename_exchange.c    | 2 --
 tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c  | 2 --
 .../testing/selftests/filesystems/statmount/statmount_test.c | 3 ---
 tools/testing/selftests/firmware/fw_namespace.c              | 1 -
 tools/testing/selftests/fpu/test_fpu.c                       | 2 --
 tools/testing/selftests/futex/functional/Makefile            | 2 +-
 tools/testing/selftests/futex/functional/futex_requeue_pi.c  | 3 ---
 tools/testing/selftests/intel_pstate/Makefile                | 2 +-
 tools/testing/selftests/iommu/Makefile                       | 2 --
 tools/testing/selftests/ipc/msgque.c                         | 1 -
 tools/testing/selftests/kcmp/kcmp_test.c                     | 2 --
 tools/testing/selftests/landlock/base_test.c                 | 2 --
 tools/testing/selftests/landlock/fs_test.c                   | 2 --
 tools/testing/selftests/landlock/net_test.c                  | 2 --
 tools/testing/selftests/landlock/ptrace_test.c               | 2 --
 tools/testing/selftests/lib.mk                               | 5 ++++-
 tools/testing/selftests/lsm/common.c                         | 2 --
 tools/testing/selftests/lsm/lsm_get_self_attr_test.c         | 2 --
 tools/testing/selftests/lsm/lsm_list_modules_test.c          | 2 --
 tools/testing/selftests/lsm/lsm_set_self_attr_test.c         | 2 --
 tools/testing/selftests/membarrier/membarrier_test_impl.h    | 1 -
 .../selftests/membarrier/membarrier_test_multi_thread.c      | 1 -
 .../selftests/membarrier/membarrier_test_single_thread.c     | 1 -
 tools/testing/selftests/memfd/common.c                       | 1 -
 tools/testing/selftests/memfd/fuse_test.c                    | 2 --
 tools/testing/selftests/memfd/memfd_test.c                   | 1 -
 tools/testing/selftests/mincore/mincore_selftest.c           | 3 ---
 tools/testing/selftests/mm/cow.c                             | 1 -
 tools/testing/selftests/mm/gup_longterm.c                    | 1 -
 tools/testing/selftests/mm/hugepage-mmap.c                   | 1 -
 tools/testing/selftests/mm/hugepage-mremap.c                 | 2 --
 tools/testing/selftests/mm/hugetlb-madvise.c                 | 2 --
 tools/testing/selftests/mm/hugetlb-read-hwpoison.c           | 2 --
 tools/testing/selftests/mm/khugepaged.c                      | 1 -
 tools/testing/selftests/mm/ksm_functional_tests.c            | 1 -
 tools/testing/selftests/mm/madv_populate.c                   | 1 -
 tools/testing/selftests/mm/map_populate.c                    | 2 --
 tools/testing/selftests/mm/mdwe_test.c                       | 1 -
 tools/testing/selftests/mm/memfd_secret.c                    | 2 --
 tools/testing/selftests/mm/mlock2-tests.c                    | 1 -
 tools/testing/selftests/mm/mrelease_test.c                   | 1 -
 tools/testing/selftests/mm/mremap_dontunmap.c                | 1 -
 tools/testing/selftests/mm/mremap_test.c                     | 2 --
 tools/testing/selftests/mm/mseal_test.c                      | 1 -
 tools/testing/selftests/mm/pagemap_ioctl.c                   | 1 -
 tools/testing/selftests/mm/pkey-helpers.h                    | 1 -
 tools/testing/selftests/mm/protection_keys.c                 | 1 -
 tools/testing/selftests/mm/seal_elf.c                        | 1 -
 tools/testing/selftests/mm/split_huge_page_test.c            | 2 --
 tools/testing/selftests/mm/thuge-gen.c                       | 2 --
 tools/testing/selftests/mm/uffd-common.h                     | 1 -
 tools/testing/selftests/mount/nosymfollow-test.c             | 1 -
 tools/testing/selftests/mount/unprivileged-remount-test.c    | 1 -
 tools/testing/selftests/mount_setattr/mount_setattr_test.c   | 1 -
 .../move_mount_set_group/move_mount_set_group_test.c         | 1 -
 tools/testing/selftests/mqueue/mq_perf_tests.c               | 1 -
 tools/testing/selftests/net/af_unix/diag_uid.c               | 2 --
 tools/testing/selftests/net/af_unix/scm_pidfd.c              | 1 -
 tools/testing/selftests/net/af_unix/scm_rights.c             | 1 -
 tools/testing/selftests/net/af_unix/unix_connect.c           | 2 --
 tools/testing/selftests/net/csum.c                           | 3 ---
 tools/testing/selftests/net/gro.c                            | 3 ---
 tools/testing/selftests/net/ip_defrag.c                      | 3 ---
 tools/testing/selftests/net/ipsec.c                          | 3 ---
 tools/testing/selftests/net/ipv6_flowlabel.c                 | 3 ---
 tools/testing/selftests/net/ipv6_flowlabel_mgr.c             | 3 ---
 tools/testing/selftests/net/mptcp/mptcp_connect.c            | 3 ---
 tools/testing/selftests/net/mptcp/mptcp_inq.c                | 3 ---
 tools/testing/selftests/net/mptcp/mptcp_sockopt.c            | 3 ---
 tools/testing/selftests/net/msg_zerocopy.c                   | 3 ---
 tools/testing/selftests/net/netfilter/audit_logread.c        | 2 --
 tools/testing/selftests/net/netfilter/conntrack_dump_flush.c | 3 ---
 tools/testing/selftests/net/nettest.c                        | 2 --
 tools/testing/selftests/net/psock_fanout.c                   | 3 ---
 tools/testing/selftests/net/psock_snd.c                      | 3 ---
 tools/testing/selftests/net/reuseport_addr_any.c             | 3 ---
 tools/testing/selftests/net/reuseport_bpf_cpu.c              | 3 ---
 tools/testing/selftests/net/reuseport_bpf_numa.c             | 3 ---
 tools/testing/selftests/net/reuseport_dualstack.c            | 3 ---
 tools/testing/selftests/net/so_incoming_cpu.c                | 1 -
 tools/testing/selftests/net/so_netns_cookie.c                | 1 -
 tools/testing/selftests/net/so_txtime.c                      | 3 ---
 tools/testing/selftests/net/tap.c                            | 3 ---
 tools/testing/selftests/net/tcp_ao/Makefile                  | 2 +-
 tools/testing/selftests/net/tcp_fastopen_backup_key.c        | 1 -
 tools/testing/selftests/net/tcp_inq.c                        | 2 --
 tools/testing/selftests/net/tcp_mmap.c                       | 1 -
 tools/testing/selftests/net/tls.c                            | 3 ---
 tools/testing/selftests/net/toeplitz.c                       | 3 ---
 tools/testing/selftests/net/tun.c                            | 3 ---
 tools/testing/selftests/net/txring_overwrite.c               | 3 ---
 tools/testing/selftests/net/txtimestamp.c                    | 3 ---
 tools/testing/selftests/net/udpgso.c                         | 3 ---
 tools/testing/selftests/net/udpgso_bench_rx.c                | 3 ---
 tools/testing/selftests/net/udpgso_bench_tx.c                | 3 ---
 tools/testing/selftests/nolibc/nolibc-test.c                 | 2 --
 tools/testing/selftests/nsfs/owner.c                         | 1 -
 tools/testing/selftests/nsfs/pidns.c                         | 1 -
 tools/testing/selftests/openat2/helpers.c                    | 2 --
 tools/testing/selftests/openat2/helpers.h                    | 1 -
 tools/testing/selftests/openat2/openat2_test.c               | 2 --
 tools/testing/selftests/openat2/rename_attack_test.c         | 2 --
 tools/testing/selftests/openat2/resolve_test.c               | 2 --
 tools/testing/selftests/perf_events/remove_on_exec.c         | 2 --
 tools/testing/selftests/perf_events/sigtrap_threads.c        | 2 --
 tools/testing/selftests/perf_events/watermark_signal.c       | 2 --
 tools/testing/selftests/pid_namespace/regression_enomem.c    | 1 -
 tools/testing/selftests/pidfd/pidfd.h                        | 1 -
 tools/testing/selftests/pidfd/pidfd_fdinfo_test.c            | 2 --
 tools/testing/selftests/pidfd/pidfd_getfd_test.c             | 2 --
 tools/testing/selftests/pidfd/pidfd_open_test.c              | 2 --
 tools/testing/selftests/pidfd/pidfd_poll_test.c              | 2 --
 tools/testing/selftests/pidfd/pidfd_setns_test.c             | 2 --
 tools/testing/selftests/pidfd/pidfd_test.c                   | 2 --
 tools/testing/selftests/pidfd/pidfd_wait.c                   | 2 --
 tools/testing/selftests/powerpc/benchmarks/context_switch.c  | 2 --
 tools/testing/selftests/powerpc/benchmarks/exec_target.c     | 2 --
 tools/testing/selftests/powerpc/benchmarks/fork.c            | 2 --
 tools/testing/selftests/powerpc/benchmarks/futex_bench.c     | 3 ---
 tools/testing/selftests/powerpc/dexcr/hashchk_test.c         | 3 ---
 tools/testing/selftests/powerpc/dscr/dscr_default_test.c     | 3 ---
 tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c    | 3 ---
 .../testing/selftests/powerpc/dscr/dscr_sysfs_thread_test.c  | 1 -
 tools/testing/selftests/powerpc/mm/exec_prot.c               | 2 --
 tools/testing/selftests/powerpc/mm/pkey_exec_prot.c          | 2 --
 tools/testing/selftests/powerpc/mm/pkey_siginfo.c            | 2 --
 tools/testing/selftests/powerpc/mm/tlbie_test.c              | 2 --
 tools/testing/selftests/powerpc/papr_vpd/papr_vpd.c          | 1 -
 tools/testing/selftests/powerpc/pmu/count_instructions.c     | 3 ---
 tools/testing/selftests/powerpc/pmu/count_stcx_fail.c        | 3 ---
 tools/testing/selftests/powerpc/pmu/ebb/ebb.c                | 3 ---
 .../selftests/powerpc/pmu/ebb/instruction_count_test.c       | 3 ---
 tools/testing/selftests/powerpc/pmu/event.c                  | 2 --
 tools/testing/selftests/powerpc/pmu/lib.c                    | 3 ---
 tools/testing/selftests/powerpc/pmu/per_event_excludes.c     | 3 ---
 tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c        | 3 ---
 tools/testing/selftests/powerpc/ptrace/ptrace-syscall.c      | 2 --
 .../testing/selftests/powerpc/signal/sig_sc_double_restart.c | 1 -
 tools/testing/selftests/powerpc/signal/sigreturn_kernel.c    | 3 ---
 tools/testing/selftests/powerpc/signal/sigreturn_vdso.c      | 3 ---
 tools/testing/selftests/powerpc/syscalls/ipc_unmuxed.c       | 2 --
 tools/testing/selftests/powerpc/tm/tm-exec.c                 | 2 --
 tools/testing/selftests/powerpc/tm/tm-poison.c               | 2 --
 .../selftests/powerpc/tm/tm-signal-context-force-tm.c        | 2 --
 tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c  | 2 --
 tools/testing/selftests/powerpc/tm/tm-tmspr.c                | 2 --
 tools/testing/selftests/powerpc/tm/tm-trap.c                 | 2 --
 tools/testing/selftests/powerpc/tm/tm-unavailable.c          | 2 --
 tools/testing/selftests/powerpc/utils.c                      | 3 ---
 tools/testing/selftests/proc/Makefile                        | 1 -
 tools/testing/selftests/proc/proc-empty-vm.c                 | 3 ---
 tools/testing/selftests/ptp/testptp.c                        | 1 -
 tools/testing/selftests/ptrace/get_set_sud.c                 | 1 -
 tools/testing/selftests/ptrace/peeksiginfo.c                 | 1 -
 tools/testing/selftests/resctrl/Makefile                     | 2 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c                  | 1 -
 tools/testing/selftests/riscv/hwprobe/which-cpus.c           | 1 -
 tools/testing/selftests/riscv/mm/Makefile                    | 2 +-
 tools/testing/selftests/rlimits/rlimits-per-userns.c         | 1 -
 tools/testing/selftests/rseq/basic_percpu_ops_test.c         | 1 -
 tools/testing/selftests/rseq/basic_test.c                    | 2 --
 tools/testing/selftests/rseq/param_test.c                    | 1 -
 tools/testing/selftests/rseq/rseq.c                          | 2 --
 tools/testing/selftests/safesetid/safesetid-test.c           | 1 -
 tools/testing/selftests/sched/cs_prctl_test.c                | 2 --
 tools/testing/selftests/seccomp/seccomp_benchmark.c          | 1 -
 tools/testing/selftests/seccomp/seccomp_bpf.c                | 2 --
 tools/testing/selftests/sigaltstack/sas.c                    | 2 --
 tools/testing/selftests/splice/default_file_splice_read.c    | 1 -
 tools/testing/selftests/splice/splice_read.c                 | 1 -
 .../testing/selftests/syscall_user_dispatch/sud_benchmark.c  | 2 --
 tools/testing/selftests/syscall_user_dispatch/sud_test.c     | 2 --
 .../selftests/thermal/intel/power_floor/power_floor_test.c   | 3 ---
 .../thermal/intel/workload_hint/workload_hint_test.c         | 3 ---
 tools/testing/selftests/timens/clock_nanosleep.c             | 1 -
 tools/testing/selftests/timens/exec.c                        | 1 -
 tools/testing/selftests/timens/futex.c                       | 1 -
 tools/testing/selftests/timens/gettime_perf.c                | 1 -
 tools/testing/selftests/timens/procfs.c                      | 1 -
 tools/testing/selftests/timens/timens.c                      | 1 -
 tools/testing/selftests/timens/timer.c                       | 1 -
 tools/testing/selftests/timens/timerfd.c                     | 1 -
 tools/testing/selftests/timens/vfork_exec.c                  | 1 -
 tools/testing/selftests/tmpfs/Makefile                       | 1 -
 tools/testing/selftests/uevent/uevent_filtering.c            | 2 --
 tools/testing/selftests/user_events/abi_test.c               | 2 --
 tools/testing/selftests/vDSO/vdso_test_abi.c                 | 1 -
 tools/testing/selftests/vDSO/vdso_test_clock_getres.c        | 2 --
 tools/testing/selftests/vDSO/vdso_test_correctness.c         | 3 ---
 tools/testing/selftests/wireguard/qemu/init.c                | 2 --
 tools/testing/selftests/x86/amx.c                            | 2 --
 tools/testing/selftests/x86/check_initial_reg_state.c        | 3 ---
 tools/testing/selftests/x86/corrupt_xstate_header.c          | 3 ---
 tools/testing/selftests/x86/entry_from_vm86.c                | 3 ---
 tools/testing/selftests/x86/fsgsbase.c                       | 2 --
 tools/testing/selftests/x86/fsgsbase_restore.c               | 2 --
 tools/testing/selftests/x86/ioperm.c                         | 2 --
 tools/testing/selftests/x86/iopl.c                           | 2 --
 tools/testing/selftests/x86/lam.c                            | 1 -
 tools/testing/selftests/x86/ldt_gdt.c                        | 2 --
 tools/testing/selftests/x86/mov_ss_trap.c                    | 2 --
 tools/testing/selftests/x86/nx_stack.c                       | 2 --
 tools/testing/selftests/x86/ptrace_syscall.c                 | 2 --
 tools/testing/selftests/x86/sigaltstack.c                    | 2 --
 tools/testing/selftests/x86/sigreturn.c                      | 3 ---
 tools/testing/selftests/x86/single_step_syscall.c            | 3 ---
 tools/testing/selftests/x86/syscall_arg_fault.c              | 3 ---
 tools/testing/selftests/x86/syscall_numbering.c              | 3 ---
 tools/testing/selftests/x86/sysret_rip.c                     | 3 ---
 tools/testing/selftests/x86/sysret_ss_attrs.c                | 3 ---
 tools/testing/selftests/x86/test_FCMOV.c                     | 4 ----
 tools/testing/selftests/x86/test_FCOMI.c                     | 4 ----
 tools/testing/selftests/x86/test_FISTTP.c                    | 4 ----
 tools/testing/selftests/x86/test_mremap_vdso.c               | 1 -
 tools/testing/selftests/x86/test_shadow_stack.c              | 3 ---
 tools/testing/selftests/x86/test_syscall_vdso.c              | 4 ----
 tools/testing/selftests/x86/test_vsyscall.c                  | 3 ---
 tools/testing/selftests/x86/unwind_vdso.c                    | 3 ---
 tools/testing/selftests/x86/vdso_restorer.c                  | 3 ---
 321 files changed, 12 insertions(+), 609 deletions(-)

--
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
