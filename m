Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6272F327CD
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BH16F6gZ6+c4wJzBCKWhpjU/mRPu/LO6rTfykb0axvM=; b=jH0ejmwE+1u0M8
	qVll0Bf/IksbKWOwcIV/ZXMBka/KZcnEE3HrbgFc6FPIsj8WlmVK/GtmJipOaD3fp/zAJ4Q1mDivF
	qAl2Hu6JSuNdcexeYkb0Itz2vmH6P7EbnHoZrjLOwsnbzp3WcJjmxlyH0vnz2foJAJ9TKOcghFkCX
	nJatzZQZNmwLaU0Ni2VAk5qIf215L9I1OjwOvnok+ECLPw/HcObfMV+uCRGqlBAGLArhn+rj24jUs
	EuD5ZTt2C+MhRjNyntcgm0nXfMoeIzR+/WdF4lYq6sCTZT3XY8TckspHr81dQGU5s4ydrQbcWGQGn
	WV6fmDvRyh9jIyD+up7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7M5-00000008KHJ-04bm;
	Tue, 21 Apr 2026 09:25:17 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7M2-00000008KGO-0qTS
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 09:25:15 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ab077e3f32so16884545ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1776763510; x=1777368310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TYfKwapVQTASKc189TeQO1FVNxhT1wLsuvJTPgVY/gk=;
        b=darQBRhP9F5IlzCgnhdF2InrqHdlku9ihpraGs7v60Q2x7dqtTS0P47BBGuQdbszlI
         TCyIXewOpj/eHRkQZ4uazQQzZ+6vcxWbmPoo7UQ0WwznqGb9sS8q+cxtZt8bxCkaXB8z
         PW0GTr47180oG+Y5DObtyB+bzpm96jVHwyNYTRx6lkBY+/ZA5yykw0t247waZ8SS81uZ
         0i8XTd3ybD7x/0DqDa79cWkjqB4MpFi8AJMpDIAWCOHBHfJ45GxXgzjDHdoo4kCWIxUX
         x6huWTlQ1LNmmwcaahHaDBMFdDPjCepMyzuUSPkLZYGti7lxUbdk7Y3Wsx9NIOREZjCI
         jydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763510; x=1777368310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYfKwapVQTASKc189TeQO1FVNxhT1wLsuvJTPgVY/gk=;
        b=Zw9RuiVEq984Xz2HM8cPN33UTtu0oJP5IZMEGJwx3EgfNkDZBjb2tudoB4AvEChF83
         3hIxk0WSvVue0uGpVzmc8rVl/PGokbpAmByLDRv7Ulv76Z2MWb7akxqs+dsZtmugBnSG
         9cx0DqJ8/r0mSuknxake1Ls+VzjKkeGA4n3/Efn+8QseUfTyuXAR/WPcGLmhFdb6m1zs
         WQGIDrBWcTueJ3nbIQcJrsJ4HdRiYHqg0OstgcerrVTccJnXjnke5NxJQFlplHsxHLZb
         LNkbwShl4ifnIkEG1fsZ+hRf+lQJxyUv6PNrUqybzFN5BvfnK94K4KE4FdWEYTjKFwqs
         LnCw==
X-Forwarded-Encrypted: i=1; AFNElJ+EMl9eUnziHOxm70n/8ZUuJ3rZUVV12Bur6cs0QCbuhQ6ymLtvQXhpcqIK7VvOL+JxrfQFeTTo4Y3sSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YysOQyHD7ZKggRC5x2tsx0fxcmrpxajPzv+5qL8dSYDCi+20Xgl
	9r1PL+YvYAYCBI1UCPCRjX5FxAbJtGdFMaHmSZAZlqgJPVPzlUCuLh679WEX7NAhE4k=
X-Gm-Gg: AeBDieuR2QQOjpRaUQvg9gbIR5BFu0dFWoUxqW3w0jITp/SKw62RjEluqGHq+K9MZxb
	3xPqDaxu1SS1saSsRUcWxq8v6paXZeqMyaw0P9DpmP+BKE8JdzAN0JtB/D4AgQ3vlbXMbFlLYwe
	r5m+o0mLAUovgu7dphUURzGZVKpzDg6H7PphFha9y0veAkQlSpLKfTMyrm9JEKIGNTrY7X68HKL
	mOW6BGRSLvjkBjRAGEFtWYgTD2jo86sLAYwo6PRQKfe+iY1kveZsofG7R2+gteH5LRhtiMVFbEJ
	qD5O+MWDR+yM1CNLFEVqeuPM3YhspWKxG/LkMBiybJCNacI8m5SMkXWtFgVd+/XYrI67JbDgD5X
	ZctpC09oo29eomD0KkC/T+50DSFCcTM5iEPUqalYluk/H0HMpEVHnVUW+EHh/d/Xlixz9KsU1Ut
	T8d8XDTT4eUBY5u2o+r2/yFh24eVXG2OKXTG4zBSscgGfVvsFWt7h/gJrL1btHAPudkeUVjYsRU
	HxkaBY=
X-Received: by 2002:a17:903:1ac8:b0:2b0:70c8:ccea with SMTP id d9443c01a7336-2b5f9eaeba2mr175964215ad.13.1776763510266;
        Tue, 21 Apr 2026 02:25:10 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff39csm131965105ad.4.2026.04.21.02.25.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Apr 2026 02:25:09 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	andreyknvl@gmail.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	apopple@nvidia.com,
	ardb@kernel.org,
	atish.patra@linux.dev,
	baolin.wang@linux.alibaba.com,
	cuiyunhui@bytedance.com,
	david@kernel.org,
	debug@rivosinc.com,
	djordje.todorovic@htecgroup.com,
	dvyukov@google.com,
	elver@google.com,
	glider@google.com,
	ilias.apalodimas@linaro.org,
	junhui.liu@pigmoral.tech,
	kasan-dev@googlegroups.com,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	ljs@kernel.org,
	namcao@linutronix.de,
	osalvador@suse.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rmclure@linux.ibm.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryabinin.a.a@gmail.com,
	surenb@google.com,
	vincenzo.frascino@arm.com,
	vishal.moola@gmail.com,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn
Subject: [PATCH v1 0/7] riscv: add Svnapot-based contiguous PTE support
Date: Tue, 21 Apr 2026 17:24:50 +0800
Message-Id: <20260421092457.37649-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_022514_322244_E745F1FC 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi,

First of all, thanks to Ryan Roberts for the work on mTHP and
Contiguous PTE support on arm64. That work provides a very useful
reference for reducing page fault overhead and TLB pressure for
large but still PTE-mapped memory ranges.

This series adds Svnapot-based contiguous PTE support for RISC-V.

To achieve similar benefits on RISC-V, this series introduces a
Contiguous-PTE-like mechanism built on top of the Svnapot extension.
The intent is to preserve the core-MM PTE semantics while allowing
RISC-V to transparently fold eligible base-page mappings into
Svnapot-encoded contiguous mappings when possible.

The series splits the low-level raw PTE helpers from the public
core-MM-facing PTE helpers, so that:

-the __xxx helpers expose the raw hardware PTE encoding,
-the xxx helpers provide the semantic view expected by core MM,
-and Svnapot-aware handling is centralized in the public wrapper layer.

Performance results:

-Compared with the native 4K base-page setup, the mTHP + PTE fold
scheme improves overall SPEC CPU performance by about 2%.
-The native 4K page setup shows higher memory access latency, and its
memory read latency is about 12% higher than this scheme.

Yunhui Cui (7):
  riscv: mm: split raw and public PTE helpers
  riscv/kvm: use raw PTE helpers for G-stage leaf PTEs
  riscv: mm: add Svnapot-aware contiguous PTE wrappers
  riscv: hugetlb: switch NAPOT mappings to raw PTE helpers
  riscv: add contiguous PTE range clearing helpers
  riscv: batch write-protect contiguous PTE ranges
  riscv: add Svnapot-aware pte_batch_hint support

 arch/riscv/include/asm/kfence.h  |   4 +-
 arch/riscv/include/asm/pgtable.h | 455 +++++++++++++++++++++-
 arch/riscv/kernel/efi.c          |   4 +-
 arch/riscv/kernel/hibernate.c    |   2 +-
 arch/riscv/kvm/gstage.c          |  48 +--
 arch/riscv/kvm/mmu.c             |   4 +-
 arch/riscv/mm/Makefile           |   1 +
 arch/riscv/mm/contpte.c          | 650 +++++++++++++++++++++++++++++++
 arch/riscv/mm/fault.c            |   4 +-
 arch/riscv/mm/hugetlbpage.c      |  55 ++-
 arch/riscv/mm/init.c             |   8 +-
 arch/riscv/mm/kasan_init.c       |  14 +-
 arch/riscv/mm/pageattr.c         |  12 +-
 arch/riscv/mm/pgtable.c          |  58 ++-
 14 files changed, 1222 insertions(+), 97 deletions(-)
 create mode 100644 arch/riscv/mm/contpte.c

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
