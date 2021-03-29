Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F2DC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:04:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D19CB61936
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D19CB61936
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oT4bBQOHeRd068YyfnAER5XbaJ4DsPa+f+8+5QBVnLQ=; b=lnmehK9j2zd70or3AF9qweYzqv
	BZDHKvnzQYd6in0eo7if814EMwAQJCH0p9tmp20kCm6tUEHgfRsM9xvtq7KxsifqAudRIrdSZZhKt
	Wulho8EpX8CHj4ZSqxxweQyo50wHVmBP9VgUKEIaHAztufmQ+9dlSJIesfFgZx5GTg0785wEQqxDP
	Yy8ZAyitHOipkXZ3HONaK/HKudVv/TEAiyDiFwtk7bkEC6GEQykJrE5eCC8PWLN2n8CJdSdonEO1j
	DbqdKjvHLJ795nt/lCmG/YI9tKVY2Ho3vDaQJMkLpqEAMURSkTS+/kjs8ZQEo3QnUP3jt/MDoX9En
	2Nauhupw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1qx-0026G9-9z; Tue, 30 Mar 2021 00:03:27 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQwbI-00136u-AR
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 18:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=TtLVGU3fdGFUnspw6rWTgvkrU7WnO/Si+O2feWCXEJ0=; b=PzuqL32U8LFDO
 BDoLS9X6KUhf/FnGgOT84hR9gjiMXS62xNjlTlMAbCCVAzspdbC39z5WYHRgl8qF
 eGFEU+04M0WG98v6Xhu5epUnPsANchst09f0TdMqxe/ppET33slA01s86jxWht8s
 PHxpwEl0CoAHCyBOl0hTSWIlQM9WHA=
Received: from xhacker (unknown [101.86.19.180])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDX3EjgG2JgN_FpAA--.35355S2; 
 Tue, 30 Mar 2021 02:26:40 +0800 (CST)
Date: Tue, 30 Mar 2021 02:21:44 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, "
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=" <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH 0/9] riscv: improve self-protection
Message-ID: <20210330022144.150edc6e@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDX3EjgG2JgN_FpAA--.35355S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyxKrykur15Xw4rZrW5Jrb_yoW8Xr4Dpr
 s0kry5ZrWrCrn3CF1ayrykur1fXwsYg3yagrsrC34rJw4avFWUZwn5Xwn3tr98XFy0gF9a
 kF45u34Ykr18Z37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkKb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
 Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJV
 W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
 wI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F
 4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU84KZJ
 UUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_192701_227413_94ED01CB 
X-CRM114-Status: UNSURE (   7.50  )
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

From: Jisheng Zhang <jszhang@kernel.org>

patch1 is a trivial improvement patch to move some functions to .init
section

Then following patches improve self-protection by:

Marking some variables __ro_after_init
Constifing some variables
Enabling ARCH_HAS_STRICT_MODULE_RWX

Jisheng Zhang (9):
  riscv: add __init section marker to some functions
  riscv: Mark some global variables __ro_after_init
  riscv: Constify sys_call_table
  riscv: Constify sbi_ipi_ops
  riscv: kprobes: Implement alloc_insn_page()
  riscv: bpf: Move bpf_jit_alloc_exec() and bpf_jit_free_exec() to core
  riscv: bpf: Avoid breaking W^X
  riscv: module: Create module allocations without exec permissions
  riscv: Set ARCH_HAS_STRICT_MODULE_RWX if MMU

 arch/riscv/Kconfig                 |  1 +
 arch/riscv/include/asm/smp.h       |  4 ++--
 arch/riscv/include/asm/syscall.h   |  2 +-
 arch/riscv/kernel/module.c         |  2 +-
 arch/riscv/kernel/probes/kprobes.c |  8 ++++++++
 arch/riscv/kernel/sbi.c            | 10 +++++-----
 arch/riscv/kernel/smp.c            |  6 +++---
 arch/riscv/kernel/syscall_table.c  |  2 +-
 arch/riscv/kernel/time.c           |  2 +-
 arch/riscv/kernel/traps.c          |  2 +-
 arch/riscv/kernel/vdso.c           |  4 ++--
 arch/riscv/mm/init.c               | 12 ++++++------
 arch/riscv/mm/kasan_init.c         |  6 +++---
 arch/riscv/mm/ptdump.c             |  2 +-
 arch/riscv/net/bpf_jit_comp64.c    | 13 -------------
 arch/riscv/net/bpf_jit_core.c      | 14 ++++++++++++++
 16 files changed, 50 insertions(+), 40 deletions(-)

-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
