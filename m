Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE5C606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 09:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UV/5Uc4z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wix8FG5B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=No4WbVIBLgjc0im47zyBKJ77uNJU/uoreiXaYAsrCS4=; b=UV/5Uc4zGuqhe+2PswtCEt+X3M
	WPluIZNGX8A/0BdjZIHMij6q+o5qs/rUriFoF+E84TdfPaYOQNX46uhCQD4Bu5xPmEyw6WMXiOWoh
	ibxyymnio6pwa1b50WvcTX9VvirQsak/u72jU9oHk1dmJsqfRjCeIm3K/IismPJqyJaKr4S0x3pmE
	Kq5Da/iyAno83ujGVbTXFB3Fz4rGgWrQZZlEIM4zcF91xUL4tb1G+R89PlBKcsV2l+w1JQS6ZHnDo
	S19zcqFDX24LORqUUCxayCkRP7/9NlKmIaT0LjfnLU5vEkuyN/9Z9hSio5NASohkjMGwt1ITNRiiW
	G4hln5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrvl-0000000FM3Q-1BFz;
	Fri, 27 Nov 2026 09:07:45 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrvi-0000000FM1D-0jRN
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 09:07:44 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2f04824c47bso16884625ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 01:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770461; x=1796375261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/UMHkeyUCY25NbdTw5rz9oJMH9U+JYd8hruRProdo8=;
        b=Wix8FG5BFgZoGXuPlaZJZ14Vh2suHpndWcq9h/lCb+1AcP4t0bD8NnGSWEmqN9oxZP
         wdzrPcC+13xFOabwPUU3OlBWwNlKdSJ1pC7RIp6GKerXgQHkelmLy0w2TXZpo5RJKZQ5
         jG+RvsvpxAOP12ht+rKCFVfEeHzTzLkOLmJYTvwnnPsQ/gBQIa6woFT+iMpiP6ZSr8pH
         d3m4IpYF8wmW59r9/hGgQppg+NaUJ1eUksFY3Mnwa5joY3yLWySvVg10JLb4nlbw8E2M
         I+EcS/Ef0UVNLSxqkIOBI4PnhZHBehm1Miizby0Fn8DM5Jg0H1FMcCFkctNy7EKUxOyy
         T1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770461; x=1796375261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/UMHkeyUCY25NbdTw5rz9oJMH9U+JYd8hruRProdo8=;
        b=B85toISpeLaqCiy5WdXUYtZsacIMyTEFAKwohqcZvDAGlQyMP1T0zA01l3Y2R0jwXk
         feREvnw0Uk1yLec8grkVAQyGv4o+0kC3DSQsAPrSBx70+5A2swhAW1aryb6NPdywT2XE
         brN+XNpNujdhFfZ+bCJLyVjxjLf3rqRdLNjbL+vZhXxIzB5VI0KGWpQIi6U8U4EVXt7E
         r8fwoQW+pSfBbOo8vY9F9ztWJP0CmlTYOSVAKljs28pBjrCSRAMgg8PqrFE0v386WaFC
         aH6uVIOPOJN/vQWQaSwtkntalcmPRaNF4WiUQMOt3xadlWTG/vhAPEQMLkZxfjrq6KlE
         3gxw==
X-Forwarded-Encrypted: i=1; AL+hErEYGythz9ouqic0fBxUS9DH3fXNNZdAa+N10xz2Sx3axwLJZFiNEvMCVsBf8NKPqlQxK/o8m8O4+i+FAQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+I+sL5K11j4KNtvORpjqnWr10bUsGb+rEghcHPQT+0rwuGOGXb
	IFS+hs1SfWDF5P5BcYJnnobblxQkbx6eJrW3Jzhr5/BvppDTRrYCG3ig
X-Gm-Gg: AZFdTZeiFzsFJdX3krJ4bAwbEysd9DTDbgnIksHO7vUG28LJDuFY0wtanmvVrAtm9wu
	9oOllfxPmGsPywW9eTyU84KUyfxjoFrm1X+IKrK3M4+pj8iUV8RONL/yF017BzAfWS3A8TjY8td
	xY1ZJZG/+6nIxk9M42qa0D7GAZwNShhf/IdbAtczOm34FRp2qQg1hASxP9YcNn6pTrnkdoYcu3R
	6Y3oxpeDdjjNxwCKiRN3NgmgMSiZHY3+C3IFiWAC4PnDbr1QPcp980XTkBjcaqdGpmyUugFZTp+
	JoGfPetGldtqyuhG0W/1iRXqcitCdHoEGHvqXsqIJ9f6Sd+0pw+PlDyPAtWwztsuGcS+FE4S1z/
	pSWcHEHVHdgXg7hbgf8zcIPEzNwfszOs//rUNGG8D4UB0F0ug5MeGbTyw29zQhYWqzuJnDvbch/
	OwlvWlfXaZfGxzVF7v7u0NRabghjouzBIOk4rG/Y/15KKrmznC902AUs7noPMiedduQKXLXgqbg
	uiqX8YnfMkP6bkuiW1a1PS7TdRGi8h/igV13VqZYgsgOHCdKWX6WfZBU49vxnDh49TheaH9HnYA
	1CkOM3WLkWVJI8sVEnZAto8U5o5BCFdrDPQ0cojMZA==
X-Received: by 2002:a17:90b:5287:b0:3b0:d35d:bb86 with SMTP id 98e67ed59e1d1-3b41c8fe261mr23255612a91.15.1795770460754;
        Fri, 27 Nov 2026 01:07:40 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:07:39 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 0/8] kdump: reduce vmcore size and capture time
Date: Fri, 27 Nov 2026 17:07:15 +0800
Message-ID: <20261127090723.741253-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_010742_214764_F2656C7C 
X-CRM114-Status: GOOD (  14.01  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wandun Chen <chenwandun@lixiang.com>

On SoCs that carve out large firmware-owned reserved memory (GPU,
camera ISP, ...), kdump currently dumps those carveouts as part of
system RAM even though their contents are firmware state that is not
useful for kernel crash analysis.

ACPI systems already filter reserved memory out of the vmcore through
their existing path: firmware reports those carveouts as unusable in
the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
(is_usable_memory(), efi-init.c), and the ELF header builder has
always skipped nomap regions; only DT-based systems currently fail
to filter these regions, which is what this series addresses.

This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
memblock to filter reserved memory on DT-based architectures. A new
flag is needed because MEMBLOCK_NOMAP can only express regions without
a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
so kdump omits them; reusable CMA regions are different because their
pages are handed back to the buddy allocator and may carry crash-relevant
data.

Since the reserved memory regions are filtered out, the vmcore is
smaller in size and faster to produce.

The series is based on linux-next and is organized as follows:

Patches 1-3: Preparation and bugfixes: switch riscv crash_mem to
             memblock, fold the duplicated per-arch memblock walks
             into the weak defaults, and serialize crash header
             preparation against memory hotplug.
Patches 4-7: NODUMP infrastructure: switch crash_core to
             for_each_mem_region(), introduce the MEMBLOCK_NODUMP
             flag, add a dumpable flag to struct reserved_mem, and
             mark /reserved-memory entries with MEMBLOCK_NODUMP.
Patch 8:     Skip MEMBLOCK_NODUMP regions when building the vmcore
             ELF header.


v9 --> v10:
1. Rebased on the latest linux-next, which includes the
   reserved-memory rework.

2. Patch 7: fix two issues found by Sashiko [1], by skipping
   the NODUMP marking entirely when early reservation fail
   and clamping the marked range to page boundaries.

   The changes only tighten the conditions for marking NODUMP
   and the overall logic is unchanged, so the Acked-by and
   Reviewed-by tags are kept -- Marek, Rob, please let me know
   if you disagree and I will drop them.

3. The remaining x86-specific race in patch 3 found by Sashiko [2]
   (Xen balloon inserting a System RAM resource outside
   device_hotplug_lock) is pre-existing, and fixing it depends on
   resolving other pre-existing issues first, so it will be sent
   separately.

[1] https://sashiko.dev/#/message/sashiko-outbox-181183@kernel.org
[2] https://sashiko.dev/#/message/sashiko-outbox-181179@kernel.org

An Ack for patch 1 from the riscv maintainers is still pending:
I have pinged them, but no response yet. The Ack will be added
once received.

v8 --> v9:
1. Patch 7: Avoid a potential boot panic on SH when NODUMP marking requires
   memblock resizing before it is allowed. SH supports neither
   CONFIG_KEXEC_FILE nor CONFIG_CRASH_HOTPLUG, so skip marking when both
   are disabled.

v7: https://lore.kernel.org/lkml/20260922084256.1515554-1-chenwandun1@gmail.com/
v6: https://lore.kernel.org/lkml/20260902073116.802752-1-chenwandun1@gmail.com/
v5: https://lore.kernel.org/lkml/20260806093519.2907771-1-chenwandun1@gmail.com/
v4: https://lore.kernel.org/lkml/20260630074715.4126796-1-chenwandun1@gmail.com/


Wandun Chen (8):
  riscv: build crash_mem ranges from memblock instead of resource tree
  crash_core: fold duplicated memblock arch hooks into the weak default
  crash_core: serialize crash header preparation against hotplug
  crash_core: replace for_each_mem_range() with for_each_mem_region()
  memblock: introduce MEMBLOCK_NODUMP flag
  of: reserved_mem: add dumpable flag to opt-in vmcore
  of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
  crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF
    header

 arch/arm64/kernel/machine_kexec_file.c     | 29 ------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 -----------
 arch/riscv/Kconfig                         |  2 +-
 arch/riscv/kernel/crash.c                  |  2 +-
 arch/riscv/kernel/machine_kexec_file.c     | 33 --------------
 arch/x86/kernel/crash.c                    |  2 +-
 drivers/of/fdt.c                           |  2 +
 drivers/of/of_private.h                    |  1 +
 drivers/of/of_reserved_mem.c               | 30 ++++++++++++
 include/linux/crash_core.h                 |  2 +
 include/linux/memblock.h                   |  9 ++++
 include/linux/of_reserved_mem.h            |  1 +
 kernel/crash_core.c                        | 53 +++++++++++++++++++++-
 kernel/dma/contiguous.c                    |  1 +
 mm/memblock.c                              | 16 +++++++
 15 files changed, 116 insertions(+), 94 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
