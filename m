Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B2CC61DB9
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 01:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3M0jT/r+8DngriNoWuul6Hcjzo1ZQVPZT4v1sUrl9C8=; b=oalzH0P7/FQIr3splmje9uZku2
	fW0OV+Xl0BPxAr7Bidftwtt5pgVLUPJqyYPARqJYDlsBR0UMedJH5XsgEko2s6r5i6fJ00NO40MIW
	0TrhO80mmQPMOKEfvqkSmtQBjBuGVeKi9pIWLMU7ppJc7Y162S5QQmTPgPMtFewFzDVv3OtHmBHdk
	3MnkbxGj46x0xGSY0yDFVr+5byHhRfWtdRHW5fej6ea0t+cZJ2M63fF8cqsFGp6cVKEdIStrM3/wj
	TZbZhomFq/8m+nJBnYEkgbl3V+hJYX19kJM4wFJoyeV32wmsEwRWzRcujaDYcY3bFYdTWR1cCZM0q
	fxKRD9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz27U-00000001jzB-0lrf;
	Wed, 26 Aug 2026 01:08:00 +0000
Received: from shrimp.cherry.relay.mailchannels.net ([23.83.223.164])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz27R-00000001jyq-2w7s
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 01:07:59 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 459984C0B62;
	Wed, 26 Aug 2026 01:07:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a204.dreamhost.com (100-96-49-23.trex-nlb.outbound.svc.cluster.local [100.96.49.23])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5A7254C0BBC;
	Wed, 26 Aug 2026 01:07:53 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Whispering-Illustrious: 4311d38559935212_1787706474061_3231139894
X-MC-Loop-Signature: 1787706474061:2906846316
X-MC-Ingress-Time: 1787706474060
Received: from pdx1-sub0-mail-a204.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.49.23 (trex/8.0.2);
	Wed, 26 Aug 2026 01:07:54 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a204.dreamhost.com (Postfix) with ESMTPSA id 4hV62Z53fJz1V;
	Tue, 25 Aug 2026 18:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1787706473;
	bh=eMsnr23HP9lPV0KenSxGVhzn+g2nKrwYjINjwE+8ptg=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=qck9ykgGD0FDGfMzf8lMjKxEz2+IBhaxPzncYO2JYJfqf03CmHex1/UlCDMf3GXeu
	 VBZ/D3+6NvU6kWUg4PUXEXnHXcMQpeEMv7muhjd1vcVORYpndgy/RedANS6aeWj1Hc
	 f6rLBX+goLntJYBBIQzXf3HnBpXEJOQaxYeBYo6ekiNBFNBAoIisqODuQSYnzeRFg+
	 mhM6EAjJlVen2M8PK8NxTfciUBwxLj2cYY8b3rUmn9mQfPjkBm3nQ10icYXGbTX07J
	 60k8ivrsNekvlJSNVkIE9VYGeAwYthFwpzuSvo1KhoCHJa0vcB6dUkFNAI+3H6yElh
	 LcL757Rqy4zxw==
Date: Tue, 25 Aug 2026 18:07:48 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org,
	thuth@redhat.com, ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk, rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com, zong.li@sifive.com,
	conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com,
	seanwascoding@gmail.com, andybnac@gmail.com,
	menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn, atishp@rivosinc.com,
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	bpf@vger.kernel.org, arnd@arndb.de, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v8 2/3] riscv: introduce percpu.h into include/asm
Message-ID: <20260826010748.zphu3wh2hlm4t4o2@offworld>
References: <20260703122832.15984-1-cuiyunhui@bytedance.com>
 <20260703122832.15984-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703122832.15984-3-cuiyunhui@bytedance.com>
User-Agent: NeoMutt/20220429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_180757_874321_C2F6B2D2 
X-CRM114-Status: GOOD (  11.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 03 Jul 2026, Yunhui Cui wrote:

>Add RISC-V specific this_cpu helpers so common percpu operations can use
>short architecture sequences instead of the generic implementation.
>Native-width operations use AMOs, while 8/16-bit operations use Zabha when
>available and a local 32-bit LR/SC fallback otherwise.

The subject and changelog could use some improvement. How about:

riscv: implement this_cpu operations

riscv has no asm/percpu.h, so every this_cpu_*() read-modify-write
takes the generic fallback, which disables local irqs.

A single AMO is atomic with respect to interrupts on the local hart,
so this can be replaced by one relaxed AMO under preemption disabled.
Native-width operations use AMOs, while 8/16-bit operations use Zabha when
available, or a local LR/SC sequence otherwise.

Some comments below, but I ran this on my sifive p550, feel free to add my:

Tested-by: Davidlohr Bueso <dave@stgolabs.net>

>
>Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>---
> arch/riscv/include/asm/percpu.h | 296 ++++++++++++++++++++++++++++++++
> 1 file changed, 296 insertions(+)
> create mode 100644 arch/riscv/include/asm/percpu.h
>
>diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
>new file mode 100644
>index 0000000000000..76b1b8c1fb953
>--- /dev/null
>+++ b/arch/riscv/include/asm/percpu.h
>@@ -0,0 +1,296 @@
>+/* SPDX-License-Identifier: GPL-2.0-or-later */
>+
>+#ifndef __ASM_PERCPU_H
>+#define __ASM_PERCPU_H
>+
>+#include <linux/bits.h>
>+#include <linux/preempt.h>
>+
>+#include <asm/alternative-macros.h>
>+#include <asm/cmpxchg.h>
>+#include <asm/cpufeature-macros.h>
>+#include <asm/hwcap.h>
>+
>+#define PERCPU_RW_OPS(sz)						\
>+static inline unsigned long __percpu_read_##sz(void *ptr)		\
>+{									\
>+	return READ_ONCE(*(u##sz *)ptr);				\
>+}									\
>+									\
>+static inline void __percpu_write_##sz(void *ptr, unsigned long val)	\
>+{									\
>+	WRITE_ONCE(*(u##sz *)ptr, (u##sz)val);				\
>+}
>+
>+PERCPU_RW_OPS(8)
>+PERCPU_RW_OPS(16)
>+PERCPU_RW_OPS(32)
>+
>+#ifdef CONFIG_64BIT
>+PERCPU_RW_OPS(64)
>+#endif
>+
>+#define __PERCPU_AMO_OP_CASE(sfx, name, sz, amo_insn)			\
>+static inline void							\
>+__percpu_##name##_amo_case_##sz(void *ptr, unsigned long val)		\
>+{									\
>+	asm volatile (							\
>+		"amo" #amo_insn #sfx " zero, %[val], %[ptr]"		\

So afaict that rd=zero could steer the AMO away from the hart, no? From the
Zaamo chapter, it notes that complex implementations "might also implement
AMOs at memory controllers, and can optimize away fetching the original value
when the destination is x0". Similar for the others (PERCPU_8_16_OP).

Maybe use a tmp register instead and force the old value from L1 ("near"):

	u##sz tmp;
	asm volatile (
		"amo" #amo_insn #sfx " %[tmp], %[val], %[ptr]"
		: [ptr] "+A" (*(u##sz *)ptr), [tmp] "=r" (tmp)
		: [val] "r" ((u##sz)(val)));


... which arm64 now does for its pcpu ops:

	/*
	 * Use value-returning atomics for CPU-local ops as they are
	 * more likely to execute "near" to the CPU (e.g. in L1$).
	 *
	 * https://lore.kernel.org/r/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop
	 */

>+		: [ptr] "+A" (*(u##sz *)ptr)				\
>+		: [val] "r" ((u##sz)(val))				\
>+		: "memory");						\

Should not need this clobber either - these don't imply barriers (but you also get
them with the preemption disable/enable).

>+}
>+

...

>+#define this_cpu_cmpxchg_1(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)

This triggers that cmpxchg variable shadowing issue you mentioned in patch 1 with
that __cpu_fallback_try_cmpxchg also using '__old'.

>+#define this_cpu_cmpxchg_2(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
>+#define this_cpu_cmpxchg_4(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
>+
>+#ifdef CONFIG_64BIT
>+#define this_cpu_cmpxchg_8(pcp, o, n)	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
>+
>+#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
>+#endif
>+
>+#ifdef system_has_cmpxchg128
>+#define this_cpu_cmpxchg128(pcp, o, n)					\
>+({									\
>+	u128 ret__;							\
>+	typeof(pcp) *ptr__;						\
>+									\
>+	preempt_disable_notrace();					\
>+	ptr__ = raw_cpu_ptr(&(pcp));					\
>+	if (system_has_cmpxchg128())					\
>+		ret__ = cmpxchg128_local(ptr__, (o), (n));		\
>+	else								\
>+		ret__ = this_cpu_generic_cmpxchg(pcp, (o), (n));	\
>+	preempt_enable_notrace();					\
>+	ret__;								\
>+})

With those above this_cpu_cmpxchg() you could now enable HAVE_CMPXCHG_LOCAL.

Thanks,
Davidlohr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
