Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4657EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 16:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=c/HNQHV438wtgSNZGvk4rQl700w6PCHeyvip2AlNH5M=; b=J16ox2gvGAJCxqI4FFZLWBv3u2
	Bbyu/SnUQm8Ro5b0Hn6sA1QtJNrHfJZR8/nwFu/iHDSzThtNURUyq7JuzUq1VXLZBrWdwcIttHdSj
	ayz6hE6TUlgDyeNH8k/2KnwUHjFEsotX2fTEICCvvRModZ2Rb1sS12PHEHHV6wvaBtxy0/z23Otol
	F3mbVqKHUTFmQVj5lGlGlFmf2e2Dpo5fnsdY1JYn9LoexARxuAOumHh8E7w0cxKcl2bkifbo2YAwH
	lk5kbr5fGoImVN/OBHnlTEy9+WD8GS1HdVRnNPs0J/5dp20eUJBMPmj4ZkNnABib0T2+tcKHAUBDc
	glYXrDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPRzi-003MiL-Vc; Wed, 02 Mar 2022 16:38:30 +0000
Received: from mail.efficios.com ([167.114.26.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPRzf-003Mhb-NF
 for linux-riscv@lists.infradead.org; Wed, 02 Mar 2022 16:38:29 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 0345F2ACDFC;
 Wed,  2 Mar 2022 11:38:27 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gAs7bJLuqCdN; Wed,  2 Mar 2022 11:38:26 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 8871E2ACDFB;
 Wed,  2 Mar 2022 11:38:26 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 8871E2ACDFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1646239106;
 bh=YmbZMhIuiRIQ3mx/GKGWHlHT+VywSuApyvPAOWuiZgY=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Klje91tWf7evNO/5Spyv66jcn6WiugxFfLbLADbUSSXtyjTFQ71nwQttOPz32CrDA
 sXonKGPhM4cVhzastuOoxmZRllKM4pJGVX/l7XOM7enrJN8rokPCaP8ja5YdvpA56O
 MeSRUjCQJHjT8Wktt/ia14nWx9uyQ+tXm7glzUSGadWcnXsPDi02LwP83Det7t4eJQ
 YaIo9i7BDzM+a8UlqCNTkwsGLVaB+yfvdXJEISCLpo/cIhgdTf68tTLwYt06zet+B/
 BZd7yGs8sDrsRkcVKSV7Kv9S0XEDc28xrcfSPommwoSI59oakXFIEQ06XQONqFeQw2
 TgwTRV+WccVbw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kzHqrr333V1v; Wed,  2 Mar 2022 11:38:26 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 7A7AE2AD31D;
 Wed,  2 Mar 2022 11:38:26 -0500 (EST)
Date: Wed, 2 Mar 2022 11:38:26 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Vincent Chen <vincent.chen@sifive.com>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <529535828.117301.1646239106382.JavaMail.zimbra@efficios.com>
In-Reply-To: <20220302023048.6140-3-vincent.chen@sifive.com>
References: <20220302023048.6140-1-vincent.chen@sifive.com>
 <20220302023048.6140-3-vincent.chen@sifive.com>
Subject: Re: [PATCH v3 2/2] rseq/selftests: Add support for RISC-V
MIME-Version: 1.0
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4203 (ZimbraWebClient - FF97 (Linux)/8.8.15_GA_4232)
Thread-Topic: rseq/selftests: Add support for RISC-V
Thread-Index: wBlyWvoNZV6KxHMT8l8lN2ODtAr5rw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_083827_879531_2069B2CC 
X-CRM114-Status: GOOD (  14.91  )
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

----- On Mar 1, 2022, at 9:30 PM, Vincent Chen vincent.chen@sifive.com wrote:

> Add support for RISC-V in the rseq selftests, which covers both
> 64-bit and 32-bit ISA with little endian mode.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

If you also ran those tests on riscv, can you state so with a "Tested-by" ?

Small nits below,

> ---
> tools/testing/selftests/rseq/param_test.c |  23 +
> tools/testing/selftests/rseq/rseq-riscv.h | 676 ++++++++++++++++++++++
> tools/testing/selftests/rseq/rseq.h       |   2 +
> 3 files changed, 701 insertions(+)
> create mode 100644 tools/testing/selftests/rseq/rseq-riscv.h
> 
> diff --git a/tools/testing/selftests/rseq/param_test.c
> b/tools/testing/selftests/rseq/param_test.c
> index 699ad5f93c34..0a6b8eafd444 100644
> --- a/tools/testing/selftests/rseq/param_test.c
> +++ b/tools/testing/selftests/rseq/param_test.c
> @@ -207,6 +207,29 @@ unsigned int yield_mod_cnt, nr_abort;
> 	"addiu " INJECT_ASM_REG ", -1\n\t" \
> 	"bnez " INJECT_ASM_REG ", 222b\n\t" \
> 	"333:\n\t"
> +#elif defined(__riscv)
> +
> +#define RSEQ_INJECT_INPUT \
> +	, [loop_cnt_1]"m"(loop_cnt[1]) \
> +	, [loop_cnt_2]"m"(loop_cnt[2]) \
> +	, [loop_cnt_3]"m"(loop_cnt[3]) \
> +	, [loop_cnt_4]"m"(loop_cnt[4]) \
> +	, [loop_cnt_5]"m"(loop_cnt[5]) \
> +	, [loop_cnt_6]"m"(loop_cnt[6])
> +
> +#define INJECT_ASM_REG	"t1"
> +
> +#define RSEQ_INJECT_CLOBBER \
> +	, INJECT_ASM_REG
> +
> +#define RSEQ_INJECT_ASM(n)					\
> +	"lw " INJECT_ASM_REG ", %[loop_cnt_" #n "]\n\t"		\
> +	"beqz " INJECT_ASM_REG ", 333f\n\t"			\
> +	"222:\n\t"						\
> +	"addi  " INJECT_ASM_REG "," INJECT_ASM_REG ", -1\n\t"	\
> +	"bnez " INJECT_ASM_REG ", 222b\n\t"			\
> +	"333:\n\t"
> +
> 
> #else
> #error unsupported target
> diff --git a/tools/testing/selftests/rseq/rseq-riscv.h
> b/tools/testing/selftests/rseq/rseq-riscv.h
> new file mode 100644
> index 000000000000..845ec7d0f2ed
> --- /dev/null
> +++ b/tools/testing/selftests/rseq/rseq-riscv.h
> @@ -0,0 +1,676 @@
> +/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
> +/*
> + * Select the instruction "csrw mhartid, x0" as the RSEQ_SIG. Unlike
> + * other architecture, the ebreak instruction has no immediate field for

architecture -> architectures

> + * distinguishing purposes. Hence, ebreak is not suitable as RSEQ_SIG.
> + * "csrw mhartid, x0" can also satisfy the RSEQ requirement because it
> + * is an uncommon instruction and will raise an illegal instruction
> + * exception when executed in all modes.
> + */
> +
> +#if __ORDER_LITTLE_ENDIAN__ == 1234

I think we'll want to standardize on this for endianness checking (same as
the updated uapi rseq.h):

#if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)

We may have to change rseq-mips.h in the rseq selftests to do the same as well rather than
using "# ifdef __BIG_ENDIAN".

> +#define RSEQ_SIG   0xf1401073  /* csrr mhartid, x0 */
> +#else
> +#error "Currently, RSEQ only supports Little-Endian version"
> +#endif
> +

[...]

Thanks,

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
