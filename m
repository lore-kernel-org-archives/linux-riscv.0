Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3E3CA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Gi1zKpdbUHHypNt3VqoeAvHtUDtcGSzDY9yayXZQVY=; b=m+RWXJ6Zso7eCJ
	XmnA8cIfSyogSVm8X0o20KjcRTg1hU+Suc2/PV0x2JEuyq6EeID7tt6PDF0xtxc4aK5wduVzD+7GB
	N7Q9sAnpgkwhIkh5B0TYGS720hR3udydJStrvOA+Lz6VkMUEcx2Ato76gg64hs7sTj0UwnJLOmS1h
	Fq/FH1Y1KxQLtLhn5EXGpzGCLykiqUvBTRf0Dm1oplALbqpqpEB/NG3uQCYcwd0Tk/jx2/+dafVx1
	2vy7GEkPBEb04ThT5V1Ad78EIYvk16Atc3AZpnBmzG8mXyRGrZcaYh63Ec7VniT6roRTjaAWrm0gi
	e1RPTMdt+kRBxo+IJQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgbg-0000000C5sJ-2kF6;
	Fri, 02 Oct 2026 16:59:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgbf-0000000C5rY-1sdS
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Oct 2026 16:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zQhpLMTibM/LrulRiWGxm1vI28JIxcKeJZdFQ1aTjNs=; b=EhCfIPjeWqUmEtluCwO3sTe0SR
	RVQ5SHeoP/KLLtNIZUuZx7ObxrZOvuJmna+eGkbagmEcHIjm01AbZM6NNWGsJAUXKhF3EvZavxoEi
	n001+30AUIYHcsPRg0/P+Am1C6wlNhcKEJeXBg9LuOuiDyaRUigN0br7z4Q+G+FABXvNVB9IJyjgx
	IBRKh8543sQc7RuRA6uWiw1TZNrdRU51+wDjFWAePmOLfkYPcl+Vpm+89ATZhMokDSH2RxWXd+ZMx
	7O2SG9uAW04Its+ghAbY7y/dsCAL1waJlic+u/GP42rsVMim0A25UgmjZ3ZRmXbpI4F81lkwYpvCa
	x3/QgJJQ==;
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCgbX-000000068oY-292N
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:59:33 +0000
Received: by mail-pj2-x2a.google.com with SMTP id 98e67ed59e1d1-3a4b4770191so1999956a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960361; x=1791565161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQhpLMTibM/LrulRiWGxm1vI28JIxcKeJZdFQ1aTjNs=;
        b=GbuBHdpe/Iyzn6S9djQK2OoKjUH2LsENr+on3ZovWUvVYFSXFOcbLM17BW5c4s+YcG
         vL7Ox72D2zhDBS98hIypPjCIVUOdWNlHOdBc/3vFgXC6MyzBLPpgqzk6vPLanuEKHNFd
         14WJU8i0FmVNZqZkP77IPDQVl+dpT5I69+IfpU20cvBx93bM30tQ9kH+ze3ERQaHdrEK
         07At7766Gboo/4pvFo55ywPBs3qEJhiFr+1BPlYOzDW/Un8kY/nsxgbyGuS6VzFTUiMu
         4ciigFBd1BWEUmpxVf0LHvSH5piVYlT1UEskfvG5owFtOTgU1Cfvhhpc9AZMoRuPXnR5
         EvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960361; x=1791565161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQhpLMTibM/LrulRiWGxm1vI28JIxcKeJZdFQ1aTjNs=;
        b=I7oB4iaPtvITRj5o9+PxK+4XiQM4dHAd8ZTRDD6hbWIa8OhPUN8w8Fq+oZAUIxcJUQ
         kTHrzyLboSWU7TPF2L7PKs1I5bpH/hE9RUB0ys6+f5DXkGGS8YlPbEZkPLN0OgS1z6Oz
         ciTgpWgaTv481hgptPknJRNqkwzENCAupDYHMVrBqLjvjPxt6BvTkCYohFhKJWIH7gLR
         VprrkeuD+2Re0BgSeRANXJUCeCyO2cMBnH6Nh0gt+/tcQCEu67Uf/TjxTgW7gaqe8Ow9
         uM+uGUGSNoxrVjNQSvF6LWO55QzkC2h3bn0xdzZmXXMCqx9DmNFOjpCdx4p5FgnaS/+A
         pbBg==
X-Gm-Message-State: AFq9FYKJHWbg3a8aachL1x/8MCpMpMdtESxYtJlKhNV87FzUiWBMUSyJ
	ZhcmcnEo/d+J5MduUBmk2rVafnp8ZU0nHCzneG0SZuAuht+vI9A5XUHW4g5ihIlfS62BuIb1rCm
	c9FnnT85lWQ==
X-Gm-Gg: AYBFou0QhfjwCNQ1XlZdmcvrGYbqGJQNA10DgDjzA3hKCObH/J2TWEmedj34RJSnQAs
	vd/wFpD86kN1FnWHAsOJCLtrYtLl95QtPZf2D17I+hjbpLW1tlCn3he0lTWAczlVCtLLyqkpSgn
	IP7SqVCIPYzQsymjXsna8bwCcp627Wj74NWKAOdyO/pTQeALZwN7W9pT6+BUETVi4dUAovu+L54
	xnG1kplpLttkhjBPK2trEQlYRUReT6svyXfubXvHsD6tuJn2Sl7jpfnQ2ijB4bK04uYiFnT8kdY
	0JFVbPmAVYZIy+NA+oqvxWf398cakjICv5vGzIUfmdeNWbSDOCNcIS0edJhJlQRT4l++EtlD+Gq
	l+Z2Us6NAgD6LQ3e+dWU7i7AY3hYIcY+Bs6pjk4E+8nKsts8hbzlFayrmmb/Abt7oVvNBHAqvs4
	YkXD02sgvkAij+OsgeVl/P2a6Q9Zlr3sZATvMEyxnkVZH6DqRskhN0/CCVX0tqqSFbD7k+pns/I
	Z6Z0hJschpLnsYOPNIr8M2DgzxR
X-Received: by 2002:a17:90b:3882:b0:3a4:c028:fd6e with SMTP id 98e67ed59e1d1-3a6ceaacd1bmr3230479a91.30.1790960360565;
        Fri, 02 Oct 2026 09:59:20 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:20 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Andrea Parri <parri.andrea@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH v5 0/5] riscv: Use Zalasr for acquire and release operations
Date: Sat,  3 Oct 2026 00:59:05 +0800
Message-Id: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_175929_491512_89CEAB9D 
X-CRM114-Status: GOOD (  10.72  )
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

The Zalasr extension provides load-acquire and store-release
instructions. The base ISA parsing, hwprobe, instruction definitions,
and KVM support from v4 are already upstream. This series resubmits only
the acquire/release optimizations that were left out.

The v4 implementation could mix fence-based and aq/rl mappings. That
combination does not provide the RCsc ordering expected by Linux locking
primitives unless the fence-based side is strengthened. It also needs to
preserve the existing lowering on systems without Zalasr.

Strengthen the remaining fence-based fallbacks on Zalasr systems before
introducing annotated operations. Then use Zalasr for acquire loads,
release stores, xchg, cmpxchg, and generic atomic acquire/release
operations. Also use acquire loads in smp_cond_load_acquire() so the
satisfying load provides the required ordering.

Systems without Zalasr retain the existing lowering. Uniprocessor builds
keep their existing plain AMO sequences where no inter-CPU ordering is
required.

Changes in v5:
- Drop the base ISA, hwprobe, instruction definition, and KVM patches
  that are already upstream.
- Add a preparatory patch that strengthens fence-based fallbacks when
  they can be paired with Zalasr acquire or release operations.
- Select aq/rl annotations only when Zalasr is available and preserve
  the non-Zalasr lowering.
- Optimize smp_cond_load_acquire() with Zalasr acquire loads.
- Rework xchg, cmpxchg, and atomic operations around the current
  RISC-V atomic macros.

v4:
https://lore.kernel.org/r/20251020042056.30283-1-luxu.kernel@bytedance.com

---

Qingwei Hu (1):
  riscv: Strengthen fallback barriers with Zalasr

Xu Lu (3):
  riscv: Apply Zalasr to smp_load_acquire/smp_store_release
  riscv: Use Zalasr for xchg and cmpxchg ordering
  riscv: Use Zalasr for atomic acquire and release operations

Yunhui Cui (1):
  riscv: Optimize smp_cond_load_acquire() with Zalasr

 arch/riscv/include/asm/atomic.h  |  84 ++++++++++++++-
 arch/riscv/include/asm/barrier.h |  97 ++++++++++++++++-
 arch/riscv/include/asm/cmpxchg.h | 179 ++++++++++++++++++++-----------
 arch/riscv/include/asm/fence.h   |   9 ++
 4 files changed, 298 insertions(+), 71 deletions(-)


base-commit: 4982d3552a3bf94de503acf93433277d08421de6
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
