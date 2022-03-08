Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40A4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 07:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWF0cUDZKtUxwXVkDAEm4e9ga9HneKnzxIJCosk3gCY=; b=Uscav1HNkvAZ+V
	lEQG7A6ztlh3Kzgnb+059r7SDvRm1dSFLtFfsz3qp712y8p+NKFIaJu8yy0csUuw5NOAyZDt5iARC
	qLWkxGQ3qgRl4EInSBAaBXkdbaqNzXZ09t3IuEBVpebSiiz6gYviGd7lgmBFAkbaPO+iEvwAR1mg8
	KiPVRDn0NySyDMKkqlGwE9iIhGAwr6QiXwKOVB6yo+a+ypxcFGX0K5nUF3Ie9wpUHxMVex8ZirZBs
	Stffjf+DIBHQqk4h1a8NMn6j6JeRgPUKMiuRuuiV3TB726DAw5WhyEW6BYyFcdjLaxw/e6HYadnic
	hnjnfYSUENy+0RntyKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRUJT-0034sM-6m; Tue, 08 Mar 2022 07:31:19 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRUJO-0034rC-9r
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 07:31:17 +0000
Received: by mail-pg1-x52d.google.com with SMTP id t14so15710760pgr.3
 for <linux-riscv@lists.infradead.org>; Mon, 07 Mar 2022 23:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jIiVWa5RPO0UkMoO6VabG+wirDAiPqn9asCQ23rPNl0=;
 b=ajFCxjWCllJJRaac5YKnci6dDvjo0p1W+Tffuj0DKVwDJ/LB/iln7+kvyFmGr4HtLD
 YrQo9Qt6ASkeoTmwfqoXu78eU3nRW2HdByPsD10DsZ4AxDre6A94RTLDGO5Oq2RdSFQq
 MICuZF/BiRkRxF4QEgfLIyPpfXHTbkf/PZsMk/108pjOFhtZwu8LCvBxOMjhHZ9xhBhg
 Yjv5zdPmXr2IiLkIFX+hyHg7L8MiUyTaOs5mmG7sYUagBo9MTEBaLWei/3i7IQiK3qOq
 zDSgQ/JhIyoqmai+KBf49pFEutAPRDuOnbdybW5B/FYEiiqsIpB1vUQ5oxRMjL3Kg+al
 tLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jIiVWa5RPO0UkMoO6VabG+wirDAiPqn9asCQ23rPNl0=;
 b=d+5kz8PokUE90XbPRuXX3s0Q+PVhoXzr+I1AmQyuuFqxJbEGhb0HZpXp/XTfBqWCga
 onF5ppeVh9te0atWI7XSBP5LM7uXExebFad5RS49C7DWJYNPA6YG/+fmFcJNHwroKL0g
 9I/tCRPQmZM4GysG4ROCNiazClVdxoEj+wYwtNROLkdcisQojc3gGN4Ivrm8LBLmMQyU
 WTbg0aOE73LZ/dkeR5PGPVlVvJsFIJU+sw2buieO2lpIEgbEEbw2vMqQ2NAVnjHKtW5q
 uNqRLrizd+npqn56y53sT8aobDC8sz3w5r5C0DvBo3YJ9aRM+60xFhe4Y9mx4Qojpr2C
 82xQ==
X-Gm-Message-State: AOAM5302Ip19JaSJEtdvyGQbxwvzSqk03FhFb/NrF/+Kp3odp4cd0uSh
 SFqKrs9uFhKzRv5f4EmB0RLyHZiDZsC83hO9+AsqEMiLj5uz3A==
X-Google-Smtp-Source: ABdhPJwpaumrUMZYXCEwTG3iNGhQ8kmXD+cXLnPYewcphbz2UTvUmH4sLWsV0xWyzSK9jvoTB/8eqGeQ0wd90zK97Uo=
X-Received: by 2002:a05:6a00:acf:b0:4e1:9222:1ef3 with SMTP id
 c15-20020a056a000acf00b004e192221ef3mr17254176pfl.18.1646724672566; Mon, 07
 Mar 2022 23:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20220302023048.6140-1-vincent.chen@sifive.com>
 <20220302023048.6140-3-vincent.chen@sifive.com>
In-Reply-To: <20220302023048.6140-3-vincent.chen@sifive.com>
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 8 Mar 2022 15:30:59 +0800
Message-ID: <CAPqJEFoyBFjBrri1uxMshw48P-_OR8p=N1tBwMo4de_OO+C9fw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rseq/selftests: Add support for RISC-V
To: Vincent Chen <vincent.chen@sifive.com>
Cc: palmer@dabbelt.com, mathieu.desnoyers@efficios.com, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_233114_478225_70ED19AB 
X-CRM114-Status: GOOD (  23.37  )
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

Hi Vincent,

On Wed, Mar 2, 2022 at 10:33 AM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> Add support for RISC-V in the rseq selftests, which covers both
> 64-bit and 32-bit ISA with little endian mode.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  tools/testing/selftests/rseq/param_test.c |  23 +
>  tools/testing/selftests/rseq/rseq-riscv.h | 676 ++++++++++++++++++++++
>  tools/testing/selftests/rseq/rseq.h       |   2 +
>  3 files changed, 701 insertions(+)
>  create mode 100644 tools/testing/selftests/rseq/rseq-riscv.h
>
> diff --git a/tools/testing/selftests/rseq/param_test.c b/tools/testing/selftests/rseq/param_test.c
> index 699ad5f93c34..0a6b8eafd444 100644
> --- a/tools/testing/selftests/rseq/param_test.c
> +++ b/tools/testing/selftests/rseq/param_test.c
> @@ -207,6 +207,29 @@ unsigned int yield_mod_cnt, nr_abort;
>         "addiu " INJECT_ASM_REG ", -1\n\t" \
>         "bnez " INJECT_ASM_REG ", 222b\n\t" \
>         "333:\n\t"
> +#elif defined(__riscv)
> +
> +#define RSEQ_INJECT_INPUT \
> +       , [loop_cnt_1]"m"(loop_cnt[1]) \
> +       , [loop_cnt_2]"m"(loop_cnt[2]) \
> +       , [loop_cnt_3]"m"(loop_cnt[3]) \
> +       , [loop_cnt_4]"m"(loop_cnt[4]) \
> +       , [loop_cnt_5]"m"(loop_cnt[5]) \
> +       , [loop_cnt_6]"m"(loop_cnt[6])
> +
> +#define INJECT_ASM_REG "t1"
> +
> +#define RSEQ_INJECT_CLOBBER \
> +       , INJECT_ASM_REG
> +
> +#define RSEQ_INJECT_ASM(n)                                     \
> +       "lw " INJECT_ASM_REG ", %[loop_cnt_" #n "]\n\t"         \
> +       "beqz " INJECT_ASM_REG ", 333f\n\t"                     \
> +       "222:\n\t"                                              \
> +       "addi  " INJECT_ASM_REG "," INJECT_ASM_REG ", -1\n\t"   \
> +       "bnez " INJECT_ASM_REG ", 222b\n\t"                     \
> +       "333:\n\t"
> +
>
>  #else
>  #error unsupported target
> diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
> new file mode 100644
> index 000000000000..845ec7d0f2ed
> --- /dev/null
> +++ b/tools/testing/selftests/rseq/rseq-riscv.h
> @@ -0,0 +1,676 @@
> +/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
> +/*
> + * Select the instruction "csrw mhartid, x0" as the RSEQ_SIG. Unlike
> + * other architecture, the ebreak instruction has no immediate field for
> + * distinguishing purposes. Hence, ebreak is not suitable as RSEQ_SIG.
> + * "csrw mhartid, x0" can also satisfy the RSEQ requirement because it
> + * is an uncommon instruction and will raise an illegal instruction
> + * exception when executed in all modes.
> + */
> +
> +#if __ORDER_LITTLE_ENDIAN__ == 1234
> +#define RSEQ_SIG   0xf1401073  /* csrr mhartid, x0 */
> +#else
> +#error "Currently, RSEQ only supports Little-Endian version"
> +#endif
> +
> +#if __riscv_xlen == 64
> +#define __REG_SEL(a, b)        a
> +#elif __riscv_xlen == 32
> +#define __REG_SEL(a, b)        b
> +#endif
> +
> +#define REG_L  __REG_SEL("ld ", "lw ")
> +#define REG_S  __REG_SEL("sd ", "sw ")
> +
> +#define RISCV_FENCE(p, s) \
> +       __asm__ __volatile__ ("fence " #p "," #s : : : "memory")
> +#define rseq_smp_mb()  RISCV_FENCE(rw, rw)
> +#define rseq_smp_rmb() RISCV_FENCE(r, r)
> +#define rseq_smp_wmb() RISCV_FENCE(w, w)
> +#define RSEQ_ASM_TMP_REG_1     "t6"
> +#define RSEQ_ASM_TMP_REG_2     "t5"
> +#define RSEQ_ASM_TMP_REG_3     "t4"
> +#define RSEQ_ASM_TMP_REG_4     "t3"
> +
> +#define rseq_smp_load_acquire(p)                                       \
> +__extension__ ({                                                       \
> +       __typeof(*(p)) ____p1 = RSEQ_READ_ONCE(*(p));                   \
> +       RISCV_FENCE(r, rw)                                              \
> +       ____p1;                                                         \
> +})
> +
> +#define rseq_smp_acquire__after_ctrl_dep()     rseq_smp_rmb()
> +
> +#define rseq_smp_store_release(p, v)                                   \
> +do {                                                                   \
> +       RISCV_FENCE(rw, w);                                             \
> +       RSEQ_WRITE_ONCE(*(p), v);                                               \
> +} while (0)
> +
> +#ifdef RSEQ_SKIP_FASTPATH
> +#include "rseq-skip.h"
> +#else /* !RSEQ_SKIP_FASTPATH */
> +
> +#define __RSEQ_ASM_DEFINE_TABLE(label, version, flags, start_ip,       \
> +                               post_commit_offset, abort_ip)           \
> +       ".pushsection   __rseq_cs, \"aw\"\n"                            \
> +       ".balign        32\n"                                           \
> +       __rseq_str(label) ":\n"                                         \
> +       ".long  " __rseq_str(version) ", " __rseq_str(flags) "\n"       \
> +       ".quad  " __rseq_str(start_ip) ", "                             \
> +                         __rseq_str(post_commit_offset) ", "           \
> +                         __rseq_str(abort_ip) "\n"                     \
> +       ".popsection\n\t"                                               \
> +       ".pushsection __rseq_cs_ptr_array, \"aw\"\n"                    \
> +       ".quad " __rseq_str(label) "b\n"                                \
> +       ".popsection\n"
> +
> +#define RSEQ_ASM_DEFINE_TABLE(label, start_ip, post_commit_ip, abort_ip) \
> +       __RSEQ_ASM_DEFINE_TABLE(label, 0x0, 0x0, start_ip,               \
> +                               ((post_commit_ip) - (start_ip)), abort_ip)
> +
> +/*
> + * Exit points of a rseq critical section consist of all instructions outside
> + * of the critical section where a critical section can either branch to or
> + * reach through the normal course of its execution. The abort IP and the
> + * post-commit IP are already part of the __rseq_cs section and should not be
> + * explicitly defined as additional exit points. Knowing all exit points is
> + * useful to assist debuggers stepping over the critical section.
> + */
> +#define RSEQ_ASM_DEFINE_EXIT_POINT(start_ip, exit_ip)                  \
> +       ".pushsection __rseq_exit_point_array, \"aw\"\n"                \
> +       ".quad " __rseq_str(start_ip) ", " __rseq_str(exit_ip) "\n"     \
> +       ".popsection\n"
> +
> +#define RSEQ_ASM_STORE_RSEQ_CS(label, cs_label, rseq_cs)               \
> +       RSEQ_INJECT_ASM(1)                                              \
> +       "la     "RSEQ_ASM_TMP_REG_1 ", " __rseq_str(cs_label) "\n"      \
> +       REG_S   RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(rseq_cs) "]\n"     \
> +       __rseq_str(label) ":\n"
> +
> +#define RSEQ_ASM_DEFINE_ABORT(label, abort_label)                      \
> +       "j      222f\n"                                                 \
> +       ".balign        4\n"                                            \
> +       ".long "        __rseq_str(RSEQ_SIG) "\n"                       \
> +       __rseq_str(label) ":\n"                                         \
> +       "j      %l[" __rseq_str(abort_label) "]\n"                      \
> +       "222:\n"
> +
> +#define RSEQ_ASM_OP_STORE(value, var)                                  \
> +       REG_S   "%[" __rseq_str(value) "], %[" __rseq_str(var) "]\n"
> +
> +#define RSEQ_ASM_OP_CMPEQ(var, expect, label)                          \
> +       REG_L   RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"         \
> +       "bne    "RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"     \
> +                 __rseq_str(label) "\n"
> +
> +#define RSEQ_ASM_OP_CMPEQ32(var, expect, label)                                \
> +       "lw     "RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"        \
> +       "bne    "RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"     \
> +                 __rseq_str(label) "\n"
> +
> +#define RSEQ_ASM_OP_CMPNE(var, expect, label)                          \
> +       REG_L   RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"         \
> +       "beq    "RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(expect) "] ,"     \
> +                 __rseq_str(label) "\n"
> +
> +#define RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, label)             \
> +       RSEQ_INJECT_ASM(2)                                              \
> +       RSEQ_ASM_OP_CMPEQ32(current_cpu_id, cpu_id, label)
> +
> +#define RSEQ_ASM_OP_R_LOAD(var)                                                \
> +       REG_L   RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"
> +
> +#define RSEQ_ASM_OP_R_STORE(var)                                       \
> +       REG_S   RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"
> +
> +#define RSEQ_ASM_OP_R_LOAD_OFF(offset)                                 \
> +       "add    "RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(offset) "], "     \
> +                RSEQ_ASM_TMP_REG_1 "\n"                                \
> +       REG_L   RSEQ_ASM_TMP_REG_1 ", (" RSEQ_ASM_TMP_REG_1 ")\n"
> +
> +#define RSEQ_ASM_OP_R_ADD(count)                                       \
> +       "add    "RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1             \
> +               ", %[" __rseq_str(count) "]\n"
> +
> +#define RSEQ_ASM_OP_FINAL_STORE(value, var, post_commit_label)         \
> +       RSEQ_ASM_OP_STORE(value, var)                                   \
> +       __rseq_str(post_commit_label) ":\n"
> +
> +#define RSEQ_ASM_OP_FINAL_STORE_RELEASE(value, var, post_commit_label) \
> +       "fence  rw, w\n"                                                \
> +       RSEQ_ASM_OP_STORE(value, var)                                   \
> +       __rseq_str(post_commit_label) ":\n"
> +
> +#define RSEQ_ASM_OP_R_FINAL_STORE(var, post_commit_label)              \
> +       REG_S   RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(var) "]\n"         \
> +       __rseq_str(post_commit_label) ":\n"
> +
> +#define RSEQ_ASM_OP_R_BAD_MEMCPY(dst, src, len)                                \
> +       "beqz   %[" __rseq_str(len) "], 333f\n"                         \
> +       "mv     " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(len) "]\n"       \
> +       "mv     " RSEQ_ASM_TMP_REG_2 ", %[" __rseq_str(src) "]\n"       \
> +       "mv     " RSEQ_ASM_TMP_REG_3 ", %[" __rseq_str(dst) "]\n"       \
> +       "222:\n"                                                        \
> +       "lb     " RSEQ_ASM_TMP_REG_4 ", 0(" RSEQ_ASM_TMP_REG_2 ")\n"    \
> +       "sb     " RSEQ_ASM_TMP_REG_4 ", 0(" RSEQ_ASM_TMP_REG_3 ")\n"    \
> +       "addi   " RSEQ_ASM_TMP_REG_1 ", " RSEQ_ASM_TMP_REG_1 ", -1\n"   \
> +       "addi   " RSEQ_ASM_TMP_REG_2 ", " RSEQ_ASM_TMP_REG_2 ", 1\n"    \
> +       "addi   " RSEQ_ASM_TMP_REG_3 ", " RSEQ_ASM_TMP_REG_3 ", 1\n"    \
> +       "bnez   " RSEQ_ASM_TMP_REG_1 ", 222b\n"                         \
> +       "333:\n"
> +
> +#define RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, post_commit_label)          \
> +       "mv     " RSEQ_ASM_TMP_REG_1 ", %[" __rseq_str(ptr) "]\n"       \
> +       RSEQ_ASM_OP_R_ADD(off)                                          \
> +       "ld     " RSEQ_ASM_TMP_REG_1 ", 0(" RSEQ_ASM_TMP_REG_1 ")\n"    \
> +       RSEQ_ASM_OP_R_ADD(inc)                                          \
> +       __rseq_str(post_commit_label) ":\n"
> +
> +static inline __always_inline
> +int rseq_cmpeqv_storev(intptr_t *v, intptr_t expect, intptr_t newv, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
> +                                 RSEQ_INJECT_ASM(4)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> +                                 RSEQ_INJECT_ASM(5)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow outputs */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (__rseq_abi.cpu_id),
> +                                   [rseq_cs]           "m" (__rseq_abi.rseq_cs),
> +                                   [v]                 "m" (*v),
> +                                   [expect]            "r" (expect),
> +                                   [newv]              "r" (newv)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2
> +#endif
> +       );
> +
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +#endif
> +}
> +
> +static inline __always_inline
> +int rseq_cmpnev_storeoffp_load(intptr_t *v, intptr_t expectnot,
> +                              off_t voffp, intptr_t *load, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPNE(v, expectnot, "%l[cmpfail]")
> +                                 RSEQ_INJECT_ASM(4)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPNE(v, expectnot, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_OP_R_LOAD(v)
> +                                 RSEQ_ASM_OP_R_STORE(load)
> +                                 RSEQ_ASM_OP_R_LOAD_OFF(voffp)
> +                                 RSEQ_ASM_OP_R_FINAL_STORE(v, 3)
> +                                 RSEQ_INJECT_ASM(5)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow outputs */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (__rseq_abi.cpu_id),
> +                                   [rseq_cs]           "m" (__rseq_abi.rseq_cs),
> +                                   [v]                 "m" (*v),
> +                                   [expectnot]         "r" (expectnot),
> +                                   [load]              "m" (*load),
> +                                   [voffp]             "r" (voffp)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2
> +#endif
> +       );
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +#endif
> +}
> +
> +static inline __always_inline
> +int rseq_addv(intptr_t *v, intptr_t count, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> +#endif
> +                                 RSEQ_ASM_OP_R_LOAD(v)
> +                                 RSEQ_ASM_OP_R_ADD(count)
> +                                 RSEQ_ASM_OP_R_FINAL_STORE(v, 3)
> +                                 RSEQ_INJECT_ASM(4)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow outputs */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (__rseq_abi.cpu_id),
> +                                   [rseq_cs]           "m" (__rseq_abi.rseq_cs),
> +                                   [v]                 "m" (*v),
> +                                   [count]             "r" (count)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1
> +#endif
> +       );
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +#endif
> +}
> +
> +static inline __always_inline
> +int rseq_cmpeqv_trystorev_storev(intptr_t *v, intptr_t expect,
> +                                intptr_t *v2, intptr_t newv2,
> +                                intptr_t newv, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
> +                                 RSEQ_INJECT_ASM(4)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_OP_STORE(newv2, v2)
> +                                 RSEQ_INJECT_ASM(5)
> +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> +                                 RSEQ_INJECT_ASM(6)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow outputs */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (__rseq_abi.cpu_id),
> +                                   [rseq_cs]           "m" (__rseq_abi.rseq_cs),
> +                                   [expect]            "r" (expect),
> +                                   [v]                 "m" (*v),
> +                                   [newv]              "r" (newv),
> +                                   [v2]                        "m" (*v2),
> +                                   [newv2]             "r" (newv2)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2
> +#endif
> +       );
> +
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +#endif
> +}
> +
> +static inline __always_inline
> +int rseq_cmpeqv_trystorev_storev_release(intptr_t *v, intptr_t expect,
> +                                        intptr_t *v2, intptr_t newv2,
> +                                        intptr_t newv, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
> +                                 RSEQ_INJECT_ASM(4)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_OP_STORE(newv2, v2)
> +                                 RSEQ_INJECT_ASM(5)
> +                                 RSEQ_ASM_OP_FINAL_STORE_RELEASE(newv, v, 3)
> +                                 RSEQ_INJECT_ASM(6)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow outputs */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (__rseq_abi.cpu_id),
> +                                   [rseq_cs]           "m" (__rseq_abi.rseq_cs),
> +                                   [expect]            "r" (expect),
> +                                   [v]                 "m" (*v),
> +                                   [newv]              "r" (newv),
> +                                   [v2]                        "m" (*v2),
> +                                   [newv2]             "r" (newv2)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2
> +#endif
> +       );
> +
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +#endif
> +}
> +
> +static inline __always_inline
> +int rseq_cmpeqv_cmpeqv_storev(intptr_t *v, intptr_t expect,
> +                             intptr_t *v2, intptr_t expect2,
> +                             intptr_t newv, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error3]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
> +                                 RSEQ_INJECT_ASM(4)
> +                                 RSEQ_ASM_OP_CMPEQ(v2, expect2, "%l[cmpfail]")
> +                                 RSEQ_INJECT_ASM(5)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
> +                                 RSEQ_ASM_OP_CMPEQ(v2, expect2, "%l[error3]")
> +#endif
> +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> +                                 RSEQ_INJECT_ASM(6)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow outputs */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (__rseq_abi.cpu_id),
> +                                   [rseq_cs]           "m" (__rseq_abi.rseq_cs),
> +                                   [v]                 "m" (*v),
> +                                   [expect]            "r" (expect),
> +                                   [v2]                        "m" (*v2),
> +                                   [expect2]           "r" (expect2),
> +                                   [newv]              "r" (newv)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2, error3
> +#endif
> +       );
> +
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +error3:
> +       rseq_bug("2nd expected value comparison failed");
> +#endif
> +}
> +
> +static inline __always_inline
> +int rseq_cmpeqv_trymemcpy_storev(intptr_t *v, intptr_t expect,
> +                                void *dst, void *src, size_t len,
> +                                intptr_t newv, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
> +                                 RSEQ_INJECT_ASM(4)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_OP_R_BAD_MEMCPY(dst, src, len)
> +                                 RSEQ_INJECT_ASM(5)
> +                                 RSEQ_ASM_OP_FINAL_STORE(newv, v, 3)
> +                                 RSEQ_INJECT_ASM(6)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow outputs */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (__rseq_abi.cpu_id),
> +                                   [rseq_cs]           "m" (__rseq_abi.rseq_cs),
> +                                   [expect]            "r" (expect),
> +                                   [v]                 "m" (*v),
> +                                   [newv]              "r" (newv),
> +                                   [dst]                       "r" (dst),
> +                                   [src]                       "r" (src),
> +                                   [len]                       "r" (len)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1, RSEQ_ASM_TMP_REG_2,
> +                                   RSEQ_ASM_TMP_REG_3, RSEQ_ASM_TMP_REG_4
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2
> +#endif
> +       );
> +
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +#endif
> +}
> +
> +static inline __always_inline
> +int rseq_cmpeqv_trymemcpy_storev_release(intptr_t *v, intptr_t expect,
> +                                        void *dst, void *src, size_t len,
> +                                        intptr_t newv, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[cmpfail]")
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[cmpfail]")
> +                                 RSEQ_INJECT_ASM(4)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> +                                 RSEQ_ASM_OP_CMPEQ(v, expect, "%l[error2]")
> +#endif
> +                                 RSEQ_ASM_OP_R_BAD_MEMCPY(dst, src, len)
> +                                 RSEQ_INJECT_ASM(5)
> +                                 RSEQ_ASM_OP_FINAL_STORE_RELEASE(newv, v, 3)
> +                                 RSEQ_INJECT_ASM(6)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow outputs */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]    "m" (__rseq_abi.cpu_id),
> +                                   [rseq_cs]           "m" (__rseq_abi.rseq_cs),
> +                                   [expect]            "r" (expect),
> +                                   [v]                 "m" (*v),
> +                                   [newv]              "r" (newv),
> +                                   [dst]                       "r" (dst),
> +                                   [src]                       "r" (src),
> +                                   [len]                       "r" (len)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1, RSEQ_ASM_TMP_REG_2,
> +                                   RSEQ_ASM_TMP_REG_3, RSEQ_ASM_TMP_REG_4
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort, cmpfail
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1, error2
> +#endif
> +       );
> +
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +cmpfail:
> +       return 1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +error2:
> +       rseq_bug("expected value comparison failed");
> +#endif
> +}
> +
> +#define RSEQ_ARCH_HAS_OFFSET_DEREF_ADDV
> +
> +/*
> + *   pval = *(ptr+off)
> + *  *pval += inc;
> + */
> +static inline __always_inline
> +int rseq_offset_deref_addv(intptr_t *ptr, off_t off, intptr_t inc, int cpu)
> +{
> +       RSEQ_INJECT_C(9)
> +
> +       __asm__ __volatile__ goto(RSEQ_ASM_DEFINE_TABLE(1, 2f, 3f, 4f)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_DEFINE_EXIT_POINT(2f, "%l[error1]")
> +#endif
> +                                 RSEQ_ASM_STORE_RSEQ_CS(2, 1b, rseq_cs)
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, 4f)
> +                                 RSEQ_INJECT_ASM(3)
> +#ifdef RSEQ_COMPARE_TWICE
> +                                 RSEQ_ASM_CMP_CPU_ID(cpu_id, current_cpu_id, "%l[error1]")
> +#endif
> +                                 RSEQ_ASM_OP_R_DEREF_ADDV(ptr, off, 3)
> +                                 RSEQ_INJECT_ASM(4)
> +                                 RSEQ_ASM_DEFINE_ABORT(4, abort)
> +                                 : /* gcc asm goto does not allow outputs */
> +                                 : [cpu_id]            "r" (cpu),
> +                                   [current_cpu_id]      "m" (__rseq_abi.cpu_id),
> +                                   [rseq_cs]           "m" (__rseq_abi.rseq_cs),
> +                                   [ptr]                       "r" (ptr),
> +                                   [off]                       "er" (off),
> +                                   [inc]                       "er" (inc)
> +                                   RSEQ_INJECT_INPUT
> +                                 : "memory", RSEQ_ASM_TMP_REG_1
> +                                   RSEQ_INJECT_CLOBBER
> +                                 : abort
> +#ifdef RSEQ_COMPARE_TWICE
> +                                   , error1
> +#endif
> +       );
> +       return 0;
> +abort:
> +       RSEQ_INJECT_FAILED
> +       return -1;
> +#ifdef RSEQ_COMPARE_TWICE
> +error1:
> +       rseq_bug("cpu_id comparison failed");
> +#endif
> +}
> +
> +#endif /* !RSEQ_SKIP_FASTPATH */
> diff --git a/tools/testing/selftests/rseq/rseq.h b/tools/testing/selftests/rseq/rseq.h
> index 3f63eb362b92..72efb6d3d84e 100644
> --- a/tools/testing/selftests/rseq/rseq.h
> +++ b/tools/testing/selftests/rseq/rseq.h
> @@ -79,6 +79,8 @@ extern int __rseq_handled;
>  #include <rseq-mips.h>
>  #elif defined(__s390__)
>  #include <rseq-s390.h>
> +#elif defined(__riscv)
> +#include <rseq-riscv.h>
>  #else
>  #error unsupported target
>  #endif
> --

I've run tests on riscv qemu32 and qemu64. It passed with no error and
warning message.

# bash run_param_test.sh
Default parameters
Running test spinlock
Running compare-twice test spinlock
Running test list
Running compare-twice test list
Running test buffer
Running compare-twice test buffer
Running test buffer with barrier
Running compare-twice test buffer with barrier
Running test memcpy
Running compare-twice test memcpy
....
Running test buffer with barrier
Running compare-twice test buffer with barrier
Running test memcpy
Running compare-twice test memcpy
Running test memcpy with barrier
Running compare-twice test memcpy with barrier
Running test increment
Running compare-twice test increment
Running test membarrier
Running compare-twice test membarrier
# echo $?
0

Thanks.

Tested-by: Eric Lin <eric.lin@sifive.com>

Best regards,
Eric Lin

> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
