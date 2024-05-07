Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9778FC19F4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 21:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DS76W8K8P3Cq1u6JpuObv/7AIP4en0HHv9fj4mheG8U=; b=Kv6
	Cn4im4ZCaGW8/9cs8iH6uudqm3Ssk0OtOBlvsM44/PuY/bZ8DcJ5eqApJCHXsijnU6lo9O2v69ExM
	A7nET64Xvg+BXKHP2NgPKb/TzGKGyf6fn0Nd4WByMg8dcftPD81i6Tqz+Tn8ypAk8diXExVgz1//T
	+aZTly0Pj8wq7FYHnV7Q63ZzoYvD+Ur8lUX6GZwPLfEnoaDF4wKiwqFgZG0Kll8CUB4sK/7fj5dAE
	ykJtmlp/HnbM2jz/xp6t2Dt9/ffEWduphKTXj6Mt9LVhnlch9MxnJNq5c17SFkLUiN5kVlP9nRlmS
	CgpO/X4UYBlFbG5wWtVhqenxBwXSVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Sbp-0000000Cvfb-2ltF;
	Tue, 07 May 2024 21:44:25 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Sbk-0000000Cvbu-10bL
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 21:44:23 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5d8dd488e09so4423678a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 14:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715118256; x=1715723056; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EqE8unr5Y0tDCis4xdjJK0CstdIHAP3qZAtz/KAFViU=;
        b=IEqaZscs+f9ocH/k1VxFYGPqmvRd6OWaKg79IC3CjdNM1Q3om6SqYvWYKzZiCowSb/
         KS2wA3qvr+4k3oDEeJyZz0CpYCmLxKThBQoCwkwyk7xbBBhs4/BhGq1kd1IsjkWuCmkF
         8dw0zuJ9G8sfsVDHzdFmeHheI0DfyvE/cJh6OltptxEFFVeyzWLnTjMJjgy1n6ojEepn
         JRAQGFbQYzhQE8xLz9KSdlobLvAT2hXy5y2TmyN02IDYGUNn5ki195Ljo8EPwj+sTD3U
         isCR/yAL75UOduQ3Jmb63sksjp9Iv+B06Bfhb6lOqqY5lmN8Otyrp8+ozrfmUKiUeJmX
         ygXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715118256; x=1715723056;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EqE8unr5Y0tDCis4xdjJK0CstdIHAP3qZAtz/KAFViU=;
        b=hmsauK1dAV1krm9eC2YaL7q3RTBJ2zyVl2KEOUNmWoxnQPlJSh2GOX1MsxEdwJVqKw
         fSG9/S7SE1zJE/MGLJPkshmdXxDpVfRdGJ2cIqjbRDxhOdrQt4msLkDSqj4atHjfHP4g
         olQu837BN7l1lKnDtw3Nqv/3atRsQwVnktzFoRevoxxcTVLwi4nWor8i3DpUtIzHsyXI
         tZTfhDJzClcPKEWb5r48U9JVYnqeINUXcnIpKeLdDXq9sn9K5ABDmNEsa+2Y2cA+GS0R
         t9KOyh4ikRQZC3U/BalASWthfKs8JPJZ8hPAFLtavB2rbqWNfXihPt55pjB+P6r64AzK
         mA1A==
X-Forwarded-Encrypted: i=1; AJvYcCWT3phDzo0K72/sSQijUNBZEYd91LBzwDKSAHbLmSgjduqfG9J6oXcKez8W6w/scjTsazV+cqo4SOoC+n4SYFuaaciHeiHwXm/j0NxntCDY
X-Gm-Message-State: AOJu0Ywc1L5ZJkLeoOokta18ieN7SrQZ+nLZEHm7fn9sRrkGA/pLCkYI
	0ENJA9FugscjuHk+UovllUtoRx+t2XNYYKWpSaVNNGPYiuvBrDHjvoiwO5kdsL2GH6LZ0UJpWpl
	qbg==
X-Google-Smtp-Source: AGHT+IFisE4XLh7ZU+8mMwucPbxKUp9BzA2d0YyKj/xpS/Zt0NyK17LSV96dCgkbVAdnpiktJzrlwRA0ARY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a65:6a93:0:b0:5dc:14c9:64aa with SMTP id
 41be03b00d2f7-62f1f684fd2mr2704a12.3.1715118255449; Tue, 07 May 2024 14:44:15
 -0700 (PDT)
Date: Tue,  7 May 2024 21:38:25 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507214254.2787305-1-edliaw@google.com>
Subject: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Christian Brauner <brauner@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Seth Forshee <sforshee@kernel.org>, 
	Bongsu Jeon <bongsu.jeon@samsung.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"=?UTF-8?q?Andreas=20F=C3=A4rber?=" <afaerber@suse.de>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-input@vger.kernel.org, iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-actions@lists.infradead.org, mptcp@lists.linux.dev, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_144420_362610_C6247870 
X-CRM114-Status: GOOD (  11.61  )
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

809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
asprintf into kselftest_harness.h, which is a GNU extension and needs
_GNU_SOURCE to either be defined prior to including headers or with the
-D_GNU_SOURCE flag passed to the compiler.

v1: https://lore.kernel.org/linux-kselftest/20240430235057.1351993-1-edliaw@google.com/
v2: add -D_GNU_SOURCE to KHDR_INCLUDES so that it is in a single
location.  Remove #define _GNU_SOURCE from source code to resolve
redefinition warnings.

Edward Liaw (5):
  selftests: Compile kselftest headers with -D_GNU_SOURCE
  selftests/sgx: Include KHDR_INCLUDES in Makefile
  selftests: Include KHDR_INCLUDES in Makefile
  selftests: Drop define _GNU_SOURCE
  selftests: Drop duplicate -D_GNU_SOURCE

 tools/testing/selftests/Makefile                              | 4 ++--
 tools/testing/selftests/alsa/Makefile                         | 2 +-
 tools/testing/selftests/arm64/signal/Makefile                 | 2 +-
 tools/testing/selftests/cachestat/test_cachestat.c            | 2 --
 tools/testing/selftests/capabilities/test_execve.c            | 2 --
 tools/testing/selftests/clone3/clone3.c                       | 2 --
 .../testing/selftests/clone3/clone3_cap_checkpoint_restore.c  | 2 --
 tools/testing/selftests/clone3/clone3_clear_sighand.c         | 2 --
 tools/testing/selftests/clone3/clone3_selftests.h             | 1 -
 tools/testing/selftests/clone3/clone3_set_tid.c               | 2 --
 tools/testing/selftests/core/close_range_test.c               | 2 --
 tools/testing/selftests/drivers/dma-buf/udmabuf.c             | 1 -
 tools/testing/selftests/exec/Makefile                         | 2 +-
 tools/testing/selftests/fchmodat2/fchmodat2_test.c            | 2 --
 tools/testing/selftests/filesystems/binderfs/binderfs_test.c  | 2 --
 tools/testing/selftests/filesystems/devpts_pts.c              | 1 -
 tools/testing/selftests/filesystems/dnotify_test.c            | 1 -
 tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c | 2 --
 tools/testing/selftests/filesystems/eventfd/eventfd_test.c    | 2 --
 tools/testing/selftests/filesystems/fat/rename_exchange.c     | 2 --
 tools/testing/selftests/filesystems/overlayfs/Makefile        | 2 +-
 tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c   | 2 --
 .../testing/selftests/filesystems/statmount/statmount_test.c  | 3 ---
 tools/testing/selftests/futex/functional/Makefile             | 2 +-
 tools/testing/selftests/futex/functional/futex_requeue_pi.c   | 3 ---
 tools/testing/selftests/hid/Makefile                          | 2 +-
 tools/testing/selftests/iommu/Makefile                        | 2 --
 tools/testing/selftests/ipc/msgque.c                          | 1 -
 tools/testing/selftests/kcmp/kcmp_test.c                      | 2 --
 tools/testing/selftests/kselftest_harness.h                   | 2 +-
 tools/testing/selftests/kvm/aarch64/arch_timer.c              | 2 --
 tools/testing/selftests/kvm/aarch64/page_fault_test.c         | 1 -
 tools/testing/selftests/kvm/aarch64/psci_test.c               | 3 ---
 tools/testing/selftests/kvm/aarch64/vgic_init.c               | 1 -
 tools/testing/selftests/kvm/arch_timer.c                      | 3 ---
 tools/testing/selftests/kvm/demand_paging_test.c              | 3 ---
 tools/testing/selftests/kvm/dirty_log_test.c                  | 3 ---
 tools/testing/selftests/kvm/guest_memfd_test.c                | 2 --
 tools/testing/selftests/kvm/hardware_disable_test.c           | 3 ---
 tools/testing/selftests/kvm/include/userfaultfd_util.h        | 3 ---
 tools/testing/selftests/kvm/kvm_binary_stats_test.c           | 2 --
 tools/testing/selftests/kvm/kvm_create_max_vcpus.c            | 2 --
 tools/testing/selftests/kvm/kvm_page_table_test.c             | 3 ---
 tools/testing/selftests/kvm/lib/assert.c                      | 3 ---
 tools/testing/selftests/kvm/lib/kvm_util.c                    | 2 --
 tools/testing/selftests/kvm/lib/memstress.c                   | 2 --
 tools/testing/selftests/kvm/lib/test_util.c                   | 2 --
 tools/testing/selftests/kvm/lib/userfaultfd_util.c            | 3 ---
 tools/testing/selftests/kvm/lib/x86_64/sev.c                  | 1 -
 tools/testing/selftests/kvm/max_guest_memory_test.c           | 2 --
 .../testing/selftests/kvm/memslot_modification_stress_test.c  | 3 ---
 tools/testing/selftests/kvm/riscv/arch_timer.c                | 3 ---
 tools/testing/selftests/kvm/rseq_test.c                       | 1 -
 tools/testing/selftests/kvm/s390x/cmma_test.c                 | 2 --
 tools/testing/selftests/kvm/s390x/sync_regs_test.c            | 2 --
 tools/testing/selftests/kvm/set_memory_region_test.c          | 1 -
 tools/testing/selftests/kvm/steal_time.c                      | 1 -
 tools/testing/selftests/kvm/x86_64/amx_test.c                 | 2 --
 .../selftests/kvm/x86_64/exit_on_emulation_failure_test.c     | 3 ---
 tools/testing/selftests/kvm/x86_64/hwcr_msr_test.c            | 2 --
 tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c             | 2 --
 tools/testing/selftests/kvm/x86_64/hyperv_evmcs.c             | 1 -
 tools/testing/selftests/kvm/x86_64/hyperv_ipi.c               | 2 --
 tools/testing/selftests/kvm/x86_64/hyperv_svm_test.c          | 1 -
 tools/testing/selftests/kvm/x86_64/hyperv_tlb_flush.c         | 2 --
 tools/testing/selftests/kvm/x86_64/nested_exceptions_test.c   | 2 --
 tools/testing/selftests/kvm/x86_64/nx_huge_pages_test.c       | 3 ---
 tools/testing/selftests/kvm/x86_64/platform_info_test.c       | 2 --
 tools/testing/selftests/kvm/x86_64/pmu_counters_test.c        | 2 --
 tools/testing/selftests/kvm/x86_64/pmu_event_filter_test.c    | 3 ---
 .../selftests/kvm/x86_64/private_mem_conversions_test.c       | 1 -
 tools/testing/selftests/kvm/x86_64/set_boot_cpu_id.c          | 1 -
 tools/testing/selftests/kvm/x86_64/set_sregs_test.c           | 1 -
 .../selftests/kvm/x86_64/smaller_maxphyaddr_emulation_test.c  | 3 ---
 tools/testing/selftests/kvm/x86_64/smm_test.c                 | 1 -
 tools/testing/selftests/kvm/x86_64/state_test.c               | 1 -
 tools/testing/selftests/kvm/x86_64/sync_regs_test.c           | 2 --
 tools/testing/selftests/kvm/x86_64/ucna_injection_test.c      | 2 --
 tools/testing/selftests/kvm/x86_64/userspace_msr_exit_test.c  | 2 --
 tools/testing/selftests/kvm/x86_64/vmx_dirty_log_test.c       | 3 ---
 tools/testing/selftests/kvm/x86_64/vmx_pmu_caps_test.c        | 1 -
 .../testing/selftests/kvm/x86_64/vmx_preemption_timer_test.c  | 1 -
 tools/testing/selftests/kvm/x86_64/xapic_ipi_test.c           | 2 --
 tools/testing/selftests/kvm/x86_64/xapic_state_test.c         | 1 -
 tools/testing/selftests/kvm/x86_64/xss_msr_test.c             | 2 --
 tools/testing/selftests/landlock/base_test.c                  | 2 --
 tools/testing/selftests/landlock/fs_test.c                    | 2 --
 tools/testing/selftests/landlock/net_test.c                   | 2 --
 tools/testing/selftests/landlock/ptrace_test.c                | 2 --
 tools/testing/selftests/lib.mk                                | 2 +-
 tools/testing/selftests/lsm/common.c                          | 2 --
 tools/testing/selftests/lsm/lsm_get_self_attr_test.c          | 2 --
 tools/testing/selftests/lsm/lsm_list_modules_test.c           | 2 --
 tools/testing/selftests/lsm/lsm_set_self_attr_test.c          | 2 --
 tools/testing/selftests/membarrier/membarrier_test_impl.h     | 1 -
 .../selftests/membarrier/membarrier_test_multi_thread.c       | 1 -
 .../selftests/membarrier/membarrier_test_single_thread.c      | 1 -
 tools/testing/selftests/memfd/common.c                        | 1 -
 tools/testing/selftests/memfd/fuse_test.c                     | 2 --
 tools/testing/selftests/memfd/memfd_test.c                    | 1 -
 tools/testing/selftests/mm/cow.c                              | 1 -
 tools/testing/selftests/mm/gup_longterm.c                     | 1 -
 tools/testing/selftests/mm/hugepage-mmap.c                    | 1 -
 tools/testing/selftests/mm/hugepage-mremap.c                  | 2 --
 tools/testing/selftests/mm/hugetlb-madvise.c                  | 2 --
 tools/testing/selftests/mm/hugetlb-read-hwpoison.c            | 2 --
 tools/testing/selftests/mm/khugepaged.c                       | 1 -
 tools/testing/selftests/mm/ksm_functional_tests.c             | 1 -
 tools/testing/selftests/mm/madv_populate.c                    | 1 -
 tools/testing/selftests/mm/map_populate.c                     | 2 --
 tools/testing/selftests/mm/mdwe_test.c                        | 1 -
 tools/testing/selftests/mm/memfd_secret.c                     | 2 --
 tools/testing/selftests/mm/mlock2-tests.c                     | 1 -
 tools/testing/selftests/mm/mrelease_test.c                    | 1 -
 tools/testing/selftests/mm/mremap_dontunmap.c                 | 1 -
 tools/testing/selftests/mm/mremap_test.c                      | 2 --
 tools/testing/selftests/mm/pagemap_ioctl.c                    | 1 -
 tools/testing/selftests/mm/pkey-helpers.h                     | 1 -
 tools/testing/selftests/mm/protection_keys.c                  | 1 -
 tools/testing/selftests/mm/split_huge_page_test.c             | 2 --
 tools/testing/selftests/mm/thuge-gen.c                        | 2 --
 tools/testing/selftests/mm/uffd-common.h                      | 1 -
 tools/testing/selftests/mount_setattr/mount_setattr_test.c    | 1 -
 .../move_mount_set_group/move_mount_set_group_test.c          | 1 -
 tools/testing/selftests/nci/Makefile                          | 2 +-
 tools/testing/selftests/net/af_unix/diag_uid.c                | 2 --
 tools/testing/selftests/net/af_unix/scm_pidfd.c               | 1 -
 tools/testing/selftests/net/af_unix/unix_connect.c            | 2 --
 tools/testing/selftests/net/csum.c                            | 3 ---
 tools/testing/selftests/net/gro.c                             | 3 ---
 tools/testing/selftests/net/ip_defrag.c                       | 3 ---
 tools/testing/selftests/net/ipsec.c                           | 3 ---
 tools/testing/selftests/net/ipv6_flowlabel.c                  | 3 ---
 tools/testing/selftests/net/ipv6_flowlabel_mgr.c              | 3 ---
 tools/testing/selftests/net/mptcp/mptcp_connect.c             | 3 ---
 tools/testing/selftests/net/mptcp/mptcp_inq.c                 | 3 ---
 tools/testing/selftests/net/mptcp/mptcp_sockopt.c             | 3 ---
 tools/testing/selftests/net/msg_zerocopy.c                    | 3 ---
 tools/testing/selftests/net/nettest.c                         | 2 --
 tools/testing/selftests/net/psock_fanout.c                    | 3 ---
 tools/testing/selftests/net/psock_snd.c                       | 3 ---
 tools/testing/selftests/net/reuseport_addr_any.c              | 3 ---
 tools/testing/selftests/net/reuseport_bpf_cpu.c               | 3 ---
 tools/testing/selftests/net/reuseport_bpf_numa.c              | 3 ---
 tools/testing/selftests/net/reuseport_dualstack.c             | 3 ---
 tools/testing/selftests/net/so_incoming_cpu.c                 | 1 -
 tools/testing/selftests/net/so_netns_cookie.c                 | 1 -
 tools/testing/selftests/net/so_txtime.c                       | 3 ---
 tools/testing/selftests/net/tap.c                             | 3 ---
 tools/testing/selftests/net/tcp_ao/Makefile                   | 2 +-
 tools/testing/selftests/net/tcp_fastopen_backup_key.c         | 1 -
 tools/testing/selftests/net/tcp_inq.c                         | 2 --
 tools/testing/selftests/net/tcp_mmap.c                        | 1 -
 tools/testing/selftests/net/tls.c                             | 3 ---
 tools/testing/selftests/net/toeplitz.c                        | 3 ---
 tools/testing/selftests/net/tun.c                             | 3 ---
 tools/testing/selftests/net/txring_overwrite.c                | 3 ---
 tools/testing/selftests/net/txtimestamp.c                     | 3 ---
 tools/testing/selftests/net/udpgso.c                          | 3 ---
 tools/testing/selftests/net/udpgso_bench_rx.c                 | 3 ---
 tools/testing/selftests/net/udpgso_bench_tx.c                 | 3 ---
 tools/testing/selftests/perf_events/remove_on_exec.c          | 2 --
 tools/testing/selftests/perf_events/sigtrap_threads.c         | 2 --
 tools/testing/selftests/pid_namespace/regression_enomem.c     | 1 -
 tools/testing/selftests/pidfd/pidfd.h                         | 1 -
 tools/testing/selftests/pidfd/pidfd_fdinfo_test.c             | 2 --
 tools/testing/selftests/pidfd/pidfd_getfd_test.c              | 2 --
 tools/testing/selftests/pidfd/pidfd_open_test.c               | 2 --
 tools/testing/selftests/pidfd/pidfd_poll_test.c               | 2 --
 tools/testing/selftests/pidfd/pidfd_setns_test.c              | 2 --
 tools/testing/selftests/pidfd/pidfd_test.c                    | 2 --
 tools/testing/selftests/pidfd/pidfd_wait.c                    | 2 --
 tools/testing/selftests/prctl/Makefile                        | 2 ++
 tools/testing/selftests/proc/Makefile                         | 2 +-
 tools/testing/selftests/ptrace/get_set_sud.c                  | 1 -
 tools/testing/selftests/ptrace/peeksiginfo.c                  | 1 -
 tools/testing/selftests/resctrl/Makefile                      | 2 +-
 tools/testing/selftests/riscv/mm/Makefile                     | 2 +-
 tools/testing/selftests/rseq/basic_percpu_ops_test.c          | 1 -
 tools/testing/selftests/rseq/basic_test.c                     | 2 --
 tools/testing/selftests/rseq/param_test.c                     | 1 -
 tools/testing/selftests/rseq/rseq.c                           | 2 --
 tools/testing/selftests/rtc/Makefile                          | 2 +-
 tools/testing/selftests/seccomp/seccomp_benchmark.c           | 1 -
 tools/testing/selftests/seccomp/seccomp_bpf.c                 | 2 --
 tools/testing/selftests/sgx/Makefile                          | 2 +-
 tools/testing/selftests/sgx/sigstruct.c                       | 1 -
 tools/testing/selftests/tmpfs/Makefile                        | 2 +-
 tools/testing/selftests/user_events/abi_test.c                | 2 --
 tools/testing/selftests/x86/amx.c                             | 2 --
 tools/testing/selftests/x86/check_initial_reg_state.c         | 3 ---
 tools/testing/selftests/x86/corrupt_xstate_header.c           | 3 ---
 tools/testing/selftests/x86/entry_from_vm86.c                 | 3 ---
 tools/testing/selftests/x86/fsgsbase.c                        | 2 --
 tools/testing/selftests/x86/fsgsbase_restore.c                | 2 --
 tools/testing/selftests/x86/ioperm.c                          | 2 --
 tools/testing/selftests/x86/iopl.c                            | 2 --
 tools/testing/selftests/x86/lam.c                             | 1 -
 tools/testing/selftests/x86/ldt_gdt.c                         | 2 --
 tools/testing/selftests/x86/mov_ss_trap.c                     | 2 --
 tools/testing/selftests/x86/nx_stack.c                        | 2 --
 tools/testing/selftests/x86/ptrace_syscall.c                  | 2 --
 tools/testing/selftests/x86/sigaltstack.c                     | 2 --
 tools/testing/selftests/x86/sigreturn.c                       | 3 ---
 tools/testing/selftests/x86/single_step_syscall.c             | 3 ---
 tools/testing/selftests/x86/syscall_arg_fault.c               | 3 ---
 tools/testing/selftests/x86/syscall_numbering.c               | 3 ---
 tools/testing/selftests/x86/sysret_rip.c                      | 3 ---
 tools/testing/selftests/x86/sysret_ss_attrs.c                 | 3 ---
 tools/testing/selftests/x86/test_FCMOV.c                      | 4 ----
 tools/testing/selftests/x86/test_FCOMI.c                      | 4 ----
 tools/testing/selftests/x86/test_FISTTP.c                     | 4 ----
 tools/testing/selftests/x86/test_mremap_vdso.c                | 1 -
 tools/testing/selftests/x86/test_shadow_stack.c               | 3 ---
 tools/testing/selftests/x86/test_syscall_vdso.c               | 4 ----
 tools/testing/selftests/x86/test_vsyscall.c                   | 3 ---
 tools/testing/selftests/x86/unwind_vdso.c                     | 3 ---
 tools/testing/selftests/x86/vdso_restorer.c                   | 3 ---
 218 files changed, 20 insertions(+), 426 deletions(-)

--
2.45.0.rc1.225.g2a3ae87e7f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
