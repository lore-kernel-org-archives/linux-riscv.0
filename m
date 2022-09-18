Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452A6ECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 00:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16au/TKxSxN2tBgGDM1OEN4zuX1Ed7jACrr6ERL/LRg=; b=lDBW4SFtBVh5pV
	CudnVsuI3Orlj1f+DdomYE564g5ZsJ7EQPcAYBnouMHmAoG1NGlTjf1xTmoJnoObEQTwJS/OcERGz
	VQpTtLy3I6YFP3zvd9kMr106HwXe+mOxsGzEr7fTMBqpuQ9ETfA0dlEX+sL4b3M0oBfhwdOLJcOBC
	vlzQ8Mnn2Z9GWTcwZ30MNz0g0sxxIvXR4g4YYSGCIoV7DKRKkCbvqosg8Jv1LgNaWeU/dqkjqaBDY
	uXRSK+jWXxoTDnL1vLOx7M3cwmGQB+OkQurFJ3TtCXQFi8QDRTAV+j9AGY9FUxYbE/zRjYbD2LWI8
	v5MVn52t5trGILcEzY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZhv7-00Alqu-Mj; Sun, 18 Sep 2022 00:12:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZhv4-00AlnF-8E
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 00:12:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id cc5so31827346wrb.6
        for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 17:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=DRljvAN4AWZUl1Iais9o7QC0ygGndq1iGLGy4ZGWC/k=;
        b=kUYPm0H/WRtmrS7e64P4uz8Q4jPF7LgDyZinC90t0ycvhSlIF6B16Xfy/vAmbs16+1
         aN5hCYdpQyyk8W8tJkXjEqCrg2+mC72pAvB70MCIamCY57DA5YZa6jLdbClHshbyNn/L
         UTr3Uu39R8Bw4j7vNT07TfW2NBqi6DJ77FRW4VjBnaCyOvqW+IVx3qjLe0hLF6E0uMGw
         WBi3SYSwB1exEAgHCgtOCzokO2pwvh41DstM3UTJULGVyBytvvfCicDNsQBvJgUKCbuv
         d3uVAYDt+33vdTlbZOUVlpKajTtXEbqSbu3mvrDSC/gZFCc/1s4Q6BdOVD2sDkh8r1tR
         udgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DRljvAN4AWZUl1Iais9o7QC0ygGndq1iGLGy4ZGWC/k=;
        b=dVu2cU5b64/9wpd7r+yyzrzZZB4uL6DWruYaFPHAwjK7bY3CafKx582X295/f22HTu
         f+G8gRu8IaSNsW1nYnQAiyMVgdFqo1CuwkMPoUcEwBVrbS9yBpv65BweMq49bsESRAZJ
         0uY2kFcT9tMP3hytxJpaFW146Dr0aqp13O7wn1Ldy36z8PaKSVM8tchkDYGja1islgZs
         ipuVG4krlWkzfB8KLi25pAtz38dhlXry0OKjdtbAxfJKjPRij92kL3qCLkdkcqzAgpwu
         u8EQH8DCnslv538TArPp6/IpvPbp8gpeXVcpOrrcGsne8NRWyWh3tHiu1WNIGXe25kUh
         nzhg==
X-Gm-Message-State: ACrzQf2Wg1JVHb6yhJeBGXUMjYRI4oPFOhPJYY/u1AEIeS7M+HdcU2yc
	NbvbSVfUis97prNOy1gRMsGa4g==
X-Google-Smtp-Source: AMsMyM4EewYftqbOOamuYP8w3cAk9Jw8D8BjcnhZlXY/C4b6OxrYmvucgqaxzpe6TDmOzIKQGCnKjg==
X-Received: by 2002:a5d:5010:0:b0:22a:cb71:9493 with SMTP id e16-20020a5d5010000000b0022acb719493mr6795775wrt.514.1663459936638;
        Sat, 17 Sep 2022 17:12:16 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4d02000000b00226dfac0149sm8999180wrt.114.2022.09.17.17.12.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 17 Sep 2022 17:12:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch
 function
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220917183849.589593-1-guoren@kernel.org>
Date: Sun, 18 Sep 2022 01:12:15 +0100
Cc: Andy Chiu <andy.chiu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Ard Biesheuvel <ardb@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 jbaron@akamai.com,
 jpoimboe@kernel.org,
 kernel@esmil.dk,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 rostedt@goodmis.org,
 Zong Li <zong.li@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>
Message-Id: <8496B5FE-1CB6-4C5C-AA83-482AE7E97B26@jrtc27.com>
References: <CAJF2gTRCkNHdE+JoLV=T7_D0eTaxDdjzoJ5fCJnUB_-ED+CrfA@mail.gmail.com>
 <20220917183849.589593-1-guoren@kernel.org>
To: guoren@kernel.org
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_171222_392761_943580B8 
X-CRM114-Status: GOOD (  19.52  )
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

On 17 Sept 2022, at 19:38, guoren@kernel.org wrote:
> 
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Reduce size of static branch.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
> arch/riscv/include/asm/jump_label.h | 17 ++++++++++-----
> arch/riscv/kernel/jump_label.c      | 32 +++++++++++++++++++++++++++++
> 2 files changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> index 38af2ec7b9bf..78f747dfa8a2 100644
> --- a/arch/riscv/include/asm/jump_label.h
> +++ b/arch/riscv/include/asm/jump_label.h
> @@ -12,17 +12,21 @@
> #include <linux/types.h>
> #include <asm/asm.h>
> 
> +#ifdef CONFIG_RISCV_ISA_C
> +#define JUMP_LABEL_NOP_SIZE 2
> +#else
> #define JUMP_LABEL_NOP_SIZE 4
> +#endif
> 
> static __always_inline bool arch_static_branch(struct static_key *key,
> 					       bool branch)
> {
> 	asm_volatile_goto(
> -		"	.option push				\n\t"
> -		"	.option norelax				\n\t"
> -		"	.option norvc				\n\t"
> +#ifdef CONFIG_RISCV_ISA_C
> +		"1:	c.nop					\n\t"
> +#else
> 		"1:	nop					\n\t"
> -		"	.option pop				\n\t"
> +#endif
> 		"	.pushsection	__jump_table, \"aw\"	\n\t"
> 		"	.align		" RISCV_LGPTR "		\n\t"
> 		"	.long		1b - ., %l[label] - .	\n\t"
> @@ -39,11 +43,14 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key,
> 						    bool branch)
> {
> 	asm_volatile_goto(
> +#ifdef CONFIG_RISCV_ISA_C
> +		"1:	c.j		%l[label]		\n\t"
> +#else
> 		"	.option push				\n\t"
> 		"	.option norelax				\n\t"
> -		"	.option norvc				\n\t"
> 		"1:	jal		zero, %l[label]		\n\t"
> 		"	.option pop				\n\t"
> +#endif
> 		"	.pushsection	__jump_table, \"aw\"	\n\t"
> 		"	.align		" RISCV_LGPTR "		\n\t"
> 		"	.long		1b - ., %l[label] - .	\n\t"
> diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
> index e6694759dbd0..64a4e5df093d 100644
> --- a/arch/riscv/kernel/jump_label.c
> +++ b/arch/riscv/kernel/jump_label.c
> @@ -11,21 +11,52 @@
> #include <asm/bug.h>
> #include <asm/patch.h>
> 
> +#ifdef CONFIG_RISCV_ISA_C
> +#define RISCV_INSN_C_NOP 0x0001U
> +#define RISCV_INSN_C_JAL 0xa001U

This is C.J (i.e. JAL X0) not C.JAL (i.e. JAL RA, which is RV32-only
and not what you want since it clobbers RA).

Jess

> +#else
> #define RISCV_INSN_NOP 0x00000013U
> #define RISCV_INSN_JAL 0x0000006fU
> +#endif
> 
> void arch_jump_label_transform(struct jump_entry *entry,
> 			       enum jump_label_type type)
> {
> 	void *addr = (void *)jump_entry_code(entry);
> +#ifdef CONFIG_RISCV_ISA_C
> +	u16 insn;
> +#else
> 	u32 insn;
> +#endif
> 
> 	if (type == JUMP_LABEL_JMP) {
> 		long offset = jump_entry_target(entry) - jump_entry_code(entry);
> +#ifdef CONFIG_RISCV_ISA_C
> +		if (WARN_ON(offset & 1 || offset < -2048 || offset >= 2048))
> +			return;
> 
> +		/*
> +		 * 001 | imm[11|4|9:8|10|6|7|3:1|5] 01 - C.JAL
> +		 */
> +		insn = RISCV_INSN_C_JAL |
> +			(((u16)offset & GENMASK(5, 5)) >> (5 - 2)) |
> +			(((u16)offset & GENMASK(3, 1)) << (3 - 1)) |
> +			(((u16)offset & GENMASK(7, 7)) >> (7 - 6)) |
> +			(((u16)offset & GENMASK(6, 6)) << (7 - 6)) |
> +			(((u16)offset & GENMASK(10, 10)) >> (10 - 8)) |
> +			(((u16)offset & GENMASK(9, 8)) << (9 - 8)) |
> +			(((u16)offset & GENMASK(4, 4)) << (11 - 4)) |
> +			(((u16)offset & GENMASK(11, 11)) << (12 - 11));
> +	} else {
> +		insn = RISCV_INSN_C_NOP;
> +	}
> +#else
> 		if (WARN_ON(offset & 1 || offset < -524288 || offset >= 524288))
> 			return;
> 
> +		/*
> +		 * imm[20|10:1|11|19:12] | rd | 1101111 - JAL
> +		 */
> 		insn = RISCV_INSN_JAL |
> 			(((u32)offset & GENMASK(19, 12)) << (12 - 12)) |
> 			(((u32)offset & GENMASK(11, 11)) << (20 - 11)) |
> @@ -34,6 +65,7 @@ void arch_jump_label_transform(struct jump_entry *entry,
> 	} else {
> 		insn = RISCV_INSN_NOP;
> 	}
> +#endif
> 
> 	mutex_lock(&text_mutex);
> 	patch_text_nosync(addr, &insn, sizeof(insn));
> -- 
> 2.36.1
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
