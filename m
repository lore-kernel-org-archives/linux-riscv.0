Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5179C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 18:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=av5oxdwk1fh2yvPKGTUFxQcLNCFtre+exehzYaTRlxM=; b=wYj/xaEDJ52NZbxQitFVaoGrdT
	z8tWA7Imzd8FqLL99+wzj+7smDeBw8wMfo9Ioabl6Ppn9mswFkOI6K2QIvH+4klUHDYuOoe3ajkqS
	wSQCuYrNnNQEIQBIiB++Gc/ywiTo7I3vSdYMKKiFK/hRqwEyNLGVbcigyBLpEvnI1sSjDD9jNH08x
	kgKTIt/vg2IwdX2iMy6NMPTZX/osr/5zanYXYtW3AvEiJqlBPWp5FzvyOIYqceVifsplF3MkiBHIm
	2IdMh6xL59ka4AuOYJwI4UIIW792YivDJaPG/0h2kZweoSoptqSyN/rZKRBimddamarpBfINCozwh
	MinAd+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCNfz-000000058np-1iyy;
	Wed, 29 May 2024 18:05:27 +0000
Received: from mail-vk1-xa49.google.com ([2607:f8b0:4864:20::a49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCNfu-000000058hY-0gBy
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 18:05:24 +0000
Received: by mail-vk1-xa49.google.com with SMTP id 71dfb90a1353d-4e4f007b7beso20145e0c.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 11:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717005918; x=1717610718; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPLVZGS8AMw+CagEZYqGOZQVma0bD0XI55fQjmFacis=;
        b=UmxKPS0c0fohYeRBfe0k64qc4eo8AGM+nYpSdMg+TkGdsFoVq/MUpvskaMLkLEo4eO
         kloTeH+ji38OZvpfj1vf8f2HS4EQeDLpAdx+CMZMQgXqrI8AqrhZwMnd07IFGXumHS/5
         lP0vg2tq2SbybXCYvhWfGwXqyRMj7o/GsYH7Yf+iY8Vo9hbbhCLnTla5IZ8ByWFgKary
         4L4qpSJ6g1CwTQRBIvkYI0alVROZMpjKI3p6e2f8GMaIsaJwDF76TnRntCqM+1COWtU4
         LcMo82B40mjQ9UBtBk0B8fm4FJ5ye0wS1A/JWUV7hBg1pWfD5cviwD5pCcS6cpjm0J7n
         M1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005918; x=1717610718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPLVZGS8AMw+CagEZYqGOZQVma0bD0XI55fQjmFacis=;
        b=wHQx3/Vt/J4mYoPQJjR34RvpgPhbfQzcL3QjHdGgP7BLCSMK9A8Y5o5ZWWJgoSN9ja
         rDe3MvZ2Bgll0KizEwv2bcutSlQxIvuU+7nvtxDo3RRiEI9TwklgWuPiY9oXaadtqO9U
         FOJhR4IjVNI7rzSq2IsYve6u50sbxxI8Ucikf4mfmtqrx4/Lgu2X2SkIHsMz+poFChaP
         bttJ2Y9fahdYzsS2pmswY5yqWpf8kgijaELWvJRuF978OmqEIfWCbqzraGRLO0iKnDSC
         AzJXXult8UVBiQ8dsjnv2Gs3/pA1yT6c8vaduLQMMxY+a1gJ3wobRkAe77JKokHU5rzn
         BPlw==
X-Forwarded-Encrypted: i=1; AJvYcCUkYpv03jVPX8cNTspSObQC7N1BFwgmqs9bVcPFg/m7N4JIGGwfNYrtpuMR2YX+95DmtcFd2DZn7gPiWqWcLrlBh99Sb4DCm/oord4Hc+Ap
X-Gm-Message-State: AOJu0YyC+WYp1z+QREwIRzW4M7mi3zfEjv4fRFw+ZM4tseH3EgRRvNLK
	+e6eZG01GDG+XvpLiigpqqKgZ8l3usvNbwD+iAzjIgIyc97g6LMCe0YPWWQYOaMMTb0R8lpOX64
	wLADFJBNkhfEtK/KP3w==
X-Google-Smtp-Source: AGHT+IHYErK4IEAw4AodIy6/uS9D/1KylfkBeNLUgQvcCMlB4bZF6bJgSfUsGpPUaVK45i5PNzhTyn3VxbK8rZqg
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6122:2006:b0:4d8:797b:94e0 with
 SMTP id 71dfb90a1353d-4e4f0112182mr502860e0c.0.1717005918294; Wed, 29 May
 2024 11:05:18 -0700 (PDT)
Date: Wed, 29 May 2024 18:05:04 +0000
In-Reply-To: <20240529180510.2295118-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240529180510.2295118-2-jthoughton@google.com>
Subject: [PATCH v4 1/7] mm/Kconfig: Add LRU_GEN_WALKS_SECONDARY_MMU
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Houghton <jthoughton@google.com>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_110522_223474_9CCAC70A 
X-CRM114-Status: GOOD (  11.89  )
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

Add this option so that one building the kernel can choose whether or
not they want to support walking the secondary MMU.

We want users to be able to blindly enable all lru_gen features to have
the best possible performance most of the time. Walking the secondary
MMU is mainly useful for be able to do proactive reclaim, and it is
possible that doing this can harm VM performance.

This option should be enabled by users who run VMs and also care to do
proactive aging/reclaim with MGLRU.

With this config option enabled, a user can still disable the
new functionality at runtime through sysfs.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index b4cb45255a54..3ac4b1dbf745 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1222,6 +1222,14 @@ config LRU_GEN_STATS
 
 	  This option has a per-memcg and per-node memory overhead.
 
+config LRU_GEN_WALKS_SECONDARY_MMU
+	bool "Walk secondary MMUs when aging"
+	depends on LRU_GEN && LRU_GEN_WALKS_MMU
+	help
+	  This option allows multi-gen LRU to walk secondary MMU page tables
+	  when aging. This allows for proactive reclaim, but this can reduce
+	  overall performance (e.g. for a KVM VM).
+
 config LRU_GEN_WALKS_MMU
 	def_bool y
 	depends on LRU_GEN && ARCH_HAS_HW_PTE_YOUNG
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
