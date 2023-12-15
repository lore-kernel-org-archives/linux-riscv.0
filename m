Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C89BC46CC6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2zQj/R6CXi9TRncJD6UK2U3pcvSrbAF//xjx/s92PvE=; b=rU6BOGUJYLSjlv
	du70w25rrl4kM6Y2qY0m10V9++NiKcdhqxhghAqANr8FlDyHOQXEMRpvUS2xKVYpiLcP4B56HIp1k
	LXKzh22cqcvf1XQI7qHdKLFm6+o/VLF7pMjmHiRpAwjbdiCuaa27uO9NBCcd8COuJbJC4Y6Eg1o9Z
	2LEcBCvG9+qVz9PRfZRPUjnsXaYQXJ46eYnQs1RrhkNpzQay1tdVyTKTJO7lw/8jsjZzHpIqkux9g
	fML/1GViURYACQOmVoNhyIIfwdr6u/pC4ZSCQaM2RQJyMb7Plwjy3vC+3Ev0oo92vBexR9q0Fotm5
	RXMAJE/yhvWP+8XsRd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZT-002daN-2y;
	Fri, 15 Dec 2023 09:33:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZO-002dYy-2L
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 Dec 2023 09:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-Id:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=M6xOa2fYXl3T5Nij1IGMapcelc4vod3qWujvkNL82EQ=; b=j2nwutH6cjxGn6zu9q2Jxr8W3/
	lkRuWHA2VNVNiroJZLzT3fOMTKjNSK3zCVlitlmqCKQRc9laFozuwpeLaX80Nl7i1NNbb0Kkkv5Hs
	zNiDBMcPiWrP8fj+JA+GnjcNpHzvNZ2IXuwpp7btsy8hWHGWejQeP82Tud78W4yQ2XkZiAAYMOfll
	HNyB5ItcoZlsTNiJ4XPTiu0S/fO4WybnLTjLpeBqgENl/hsbTr3bpZciOgIQFP2jjLI9l3eElim4H
	bzk1m8T76cJeCvy43cpiRZwwtWYIkWf5BK1MB6n8Ia2VTaIl/vzPClRahZBKIudlpWS+fp3yQpKD5
	Qm4R46Ig==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZE-009rFx-0N;
	Fri, 15 Dec 2023 09:33:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id BCB7C3005B2; Fri, 15 Dec 2023 10:33:11 +0100 (CET)
Message-Id: <20231215091216.135791411@infradead.org>
User-Agent: quilt/0.65
Date: Fri, 15 Dec 2023 10:12:16 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 tglx@linutronix.de,
 mingo@redhat.com,
 bp@alien8.de,
 dave.hansen@linux.intel.com,
 x86@kernel.org,
 hpa@zytor.com,
 davem@davemloft.net,
 dsahern@kernel.org,
 daniel@iogearbox.net,
 andrii@kernel.org,
 martin.lau@linux.dev,
 song@kernel.org,
 yonghong.song@linux.dev,
 john.fastabend@gmail.com,
 kpsingh@kernel.org,
 sdf@google.com,
 haoluo@google.com,
 jolsa@kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 samitolvanen@google.com,
 keescook@chromium.org,
 nathan@kernel.org,
 ndesaulniers@google.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org,
 bpf@vger.kernel.org,
 linux-arch@vger.kernel.org,
 llvm@lists.linux.dev,
 jpoimboe@kernel.org,
 joao@overdrivepizza.com,
 mark.rutland@arm.com,
 peterz@infradead.org
Subject: [PATCH v3 0/7] x86/cfi,bpf: Fix CFI vs eBPF
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi!

What started with the simple observation that bpf_dispatcher_*_func() was
broken for calling CFI functions with a __nocfi calling context for FineIBT
ended up with a complete BPF wide CFI fixup.

With these changes on the BPF selftest suite passes without crashing -- there's
still a few failures, but Alexei has graciously offered to look into those.

(Alexei, I have presumed your SoB on the very last patch, please update
as you see fit)

Changes since v2 are numerous but include:
 - cfi_get_offset() -- as a means to communicate the offset (ast)
 - 5 new patches fixing various BPF internals to be CFI clean

Note: it *might* be possible to merge the
bpf_bpf_tcp_ca.c:unsupported_ops[] thing into the CFI stubs, as is
get_info will have a NULL stub, unlike the others.

---
 arch/riscv/include/asm/cfi.h   |   3 +-
 arch/riscv/kernel/cfi.c        |   2 +-
 arch/x86/include/asm/cfi.h     | 126 +++++++++++++++++++++++++++++++++++++-
 arch/x86/kernel/alternative.c  |  87 +++++++++++++++++++++++---
 arch/x86/kernel/cfi.c          |   4 +-
 arch/x86/net/bpf_jit_comp.c    | 134 +++++++++++++++++++++++++++++++++++------
 include/asm-generic/Kbuild     |   1 +
 include/linux/bpf.h            |  27 ++++++++-
 include/linux/cfi.h            |  12 ++++
 kernel/bpf/bpf_struct_ops.c    |  16 ++---
 kernel/bpf/core.c              |  25 ++++++++
 kernel/bpf/cpumask.c           |   8 ++-
 kernel/bpf/helpers.c           |  18 +++++-
 net/bpf/bpf_dummy_struct_ops.c |  31 +++++++++-
 net/bpf/test_run.c             |  15 ++++-
 net/ipv4/bpf_tcp_ca.c          |  69 +++++++++++++++++++++
 16 files changed, 528 insertions(+), 50 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
