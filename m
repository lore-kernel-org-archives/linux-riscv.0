Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545B7CD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 06:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=83astGFwnQK4GnutvGASmngBURD16DxLneK4LXdPcX0=; b=cuoSDwISrA+Ksd
	oNWFZNxldJFCjc56KVpgiYAWEIVv0cIkLX+ZQeH4FWofe7buq2CJPW8VKXVJMK1p6tnNDfzXsajB9
	cqLDRZ2WjJ2MsSmH0Mvj0M6+GPFObXTSeyt2DRwJSuAt69lmRCgX1/jKfsXu2NAMYXmTfkR2y/kLt
	Y4/3mE0r0xJ5zXI9r4DKPZ83wMHYpdTE0zQoNnqQv+s/s2vuus5EGT+NAkP6/PMoKIjL6bxnCvVYE
	79xemSMgAiyKtqEh4+HvXgeNJpWoF4FGbabfGEtKC7v94ruW3X+/Qa/CVJCCjCh1k/CFPkgOQQKC6
	LWQj+pvRxWt3mMXF8Dtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEYY-00000005iT7-33jv;
	Fri, 08 May 2026 06:19:26 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEYV-00000005iSc-2V4X
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 06:19:24 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-834da62e52dso723256b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 23:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221162; x=1778825962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkBzF4kHcyHsJwA7Bk0uOMxQ0R67JepyxHs0+PT2pxU=;
        b=UwmOaYONVsVyKYW7NGfy4UPyyIBZoogz+zk5EbTnqaOaBTgPoWxmR1p/Xxoyn/Bopm
         w+d/3+bDQhmMsACpnJScjSVrh2oyb4ZLgwdtLG6K3M9vMiOGl4quSJoWjzG8AvB5hBKe
         41Btg7+JcTY5igTZ6Y+iXcC3YH/fA395uHrkxq1RaO3Lg63B0B3imhsNNc338tAFoXZ0
         PyvFds8XrXRrggcdCv6N79anSa3qfjb+sGsXQGmahNLbMT1ow2meip1Gi4yZ9zB0NT+F
         aoq3jOKMJqyY/zq15UmEE/TorjKR8HqaniY59LLBhC5WoeMoPHZXeEp88FIkQU5u9dRA
         oIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221162; x=1778825962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkBzF4kHcyHsJwA7Bk0uOMxQ0R67JepyxHs0+PT2pxU=;
        b=MWvyaK4XqjoVPkWf0xQfJyIdwoN1Cwi58Xdt8u/uwFmYh5h8YaoeViiC9hwc/ivCxA
         c77cIhEbI7siEluSSMFKelCzNIvdPLGqyVY29b8kkCflasaPStWb3ogm4aWbZnTJJl0w
         cSSNgMydXelzznAnzfM4ta3tpRkqppxHKEZ3RmvBXhYdir11QwjaQ8Bf3TPAADvVkF7O
         u+KC/4MRm1KrsQ2YH5B4GJuRhr+xtMrUyv0KeEqU9X9Q47myIqsIiBzBmrHY9MNBvhKD
         JigzZ/hjd8f1gCPOAe4xeedKBkceUpZ/uIdJUCl4G4+dEDTdtYUOTPAwSeadnEIVD+Cx
         bL0g==
X-Forwarded-Encrypted: i=1; AFNElJ8BHzAqTr3b3XXM9O1p6tFVwDOAFJcgiNqTZv8r9+E4XKrkYiwBFzRPUaLCm9+F+yC7J48wH1AQQnAOSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGqmKnr0MzReql5qMhNeJlhO6gRrevmuMJJlw8dbff4rgNBbjX
	CFfJzPw8buFL3Buhw3FQdn3q0B77ggR+uda4MZp/lFOVLpbfEYbXcGNP
X-Gm-Gg: AeBDievJSGs5gEr+b0bxixZZfxkg+MUoMYZhcQfzLa8BF2JajRIhzJ3S+O3+RQZLPtU
	f2WJszRzd08qzopE4YNUPCpWa2Dm+W+sHRTJZZqOQvwPA40+7N1wb2Yr/bL4I2qFVsi9AeHlLhg
	IiZYoor5NUXD1azyVVoW4fGZSJl18bwj2dOT7j37UuADpwCmjIgpSgP07VTP63mE+PAVg43j0Ch
	pfxVhDBl5A8Hy1eb1Zldg/TbeX7pxEecXH8uQzU/zKTQMM780gVkHjM4aOpV5yubistnTLSQP/F
	gAFmhJH6GOIUrN6doOIFTIKaShACF0otnbF1B3rwhWCFX90lqKgG0N4m5p7wy1HJgBc57bUzid4
	LFp4INB7smu98eoGw9ZcA7eXnprPWlnIXIyWZs+zbeaPN3lmpnUxlvLxFBgDQGTYhktV5DCHmsv
	EgrE7fDSfbSQpSW0j7QJbm2YflbaeYsqf/dgvehw==
X-Received: by 2002:a05:6a00:a381:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-83a5c0c51b3mr10342541b3a.22.1778221162014;
        Thu, 07 May 2026 23:19:22 -0700 (PDT)
Received: from ubuntu22.mioffice.cn ([43.224.245.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm11308452b3a.19.2026.05.07.23.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:19:21 -0700 (PDT)
From: Wenchao Hao <haowenchao22@gmail.com>
X-Google-Original-From: Wenchao Hao <haowenchao@xiaomi.com>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barry Song <21cnbao@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Minchan Kim <minchan@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Wenchao Hao <haowenchao22@gmail.com>,
	Wenchao Hao <haowenchao@xiaomi.com>
Subject: [RFC PATCH 0/3] mm/zsmalloc: reduce lock contention in zs_free()
Date: Fri,  8 May 2026 14:19:07 +0800
Message-Id: <20260508061910.3882831-1-haowenchao@xiaomi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_231923_644495_2888145E 
X-CRM114-Status: UNSURE (   8.11  )
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

Swap freeing can be expensive when unmapping a VMA containing many swap
entries. This has been reported to significantly delay memory reclamation
during Android's low-memory killing, especially when multiple processes
are terminated to free memory, with slot_free() accounting for more than
80% of the total cost of freeing swap entries.

Lock contention in zs_free() is a major contributor to this cost:
  - pool->lock (rwlock) read-side atomic operations become expensive
    under multi-process concurrency due to cacheline bouncing
  - class->lock held across zspage page freeing causes zone->lock
    contention to propagate back

This series addresses both issues:

Patch 1: Encode class_idx in obj value
  On 64-bit systems, OBJ_INDEX_BITS is over-provisioned. We split it
  into class_idx + obj_idx so that zs_free() can determine the correct
  size_class from the obj value alone, without needing pool->lock.

Patch 2: Remove pool->lock from zs_free()
  With class_idx available from the obj encoding, zs_free() acquires
  only class->lock (re-reading obj for a stable PFN). This eliminates
  rwlock read-side contention between concurrent zs_free() calls and
  page migration/compaction.

Patch 3: Drop class->lock before freeing zspage pages
  Move the actual page release (free_zspage) outside class->lock. The
  bookkeeping is done under the lock, but buddy allocator interaction
  (zone->lock) no longer nests inside class->lock.

Performance results:

Test: each process independently mmap 256MB, write data, madvise
MADV_PAGEOUT to swap out via zram (lzo-rle), then concurrent munmap.

Raspberry Pi 4B (4-core ARM64 Cortex-A72):

  mode        Base       Patched     Speedup
  single      59.0ms     56.0ms      1.05x
  multi 2p    94.6ms     66.7ms      1.42x
  multi 4p    202.9ms    110.6ms     1.83x

x86 (20-core Intel i7-12700, 16 concurrent processes):

  mode        Base       Patched     Speedup
  single      11.7ms     9.8ms       1.19x
  multi 2p    24.1ms     17.2ms      1.40x
  multi 4p    63.0ms     45.3ms      1.39x

Single-process shows modest improvement. With multiple processes,
each read_lock/read_unlock atomically modifies the shared rwlock
reader count, and the cost of these atomic operations increases
with more CPUs accessing the same cacheline concurrently.
Eliminating pool->lock removes this overhead entirely.

Patch 1-2 only work on 64-bit systems (gated by ZS_OBJ_CLASS_IDX);
32-bit falls back to the original pool->lock path. Patch 3 benefits
all architectures.

Wenchao Hao (2):
  mm/zsmalloc: encode class index in obj value for lockless class lookup
  mm/zsmalloc: remove pool->lock from zs_free on 64-bit systems

Xueyuan Chen (1):
  mm/zsmalloc: drop class lock before freeing zspage

 mm/zsmalloc.c | 146 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 131 insertions(+), 15 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
