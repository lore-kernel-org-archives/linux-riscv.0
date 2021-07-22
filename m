Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7751BC6377D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 17:27:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E6C6135B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 17:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E6C6135B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LcumGxy2Rcv5bLRLa9gVFpZO9XmThkd37LBmtc7Zco4=; b=C3jK8120sjyuCoNz0ouqnHwrOt
	b4WM09cFjQsQ4a6mZVdppxh4Bo46+TNyNvGNKhMtP7FMfRc1/Uvo+v4gD1Vx2V9WGfo0Ob5Q+BPhH
	Sxz+KcUprG1cLr40g1rT3Bh2BW0sJ87Tmc6ZskkOGUeYDIjAW6f2mG7KfCRzXrk3eCYOi6CsN8Hg/
	dH2LNIhVq3UVeSVde6N3Eb54QeZL+b22KANdWMNSy90+Ye8GyO3bfoVrqjK4hLzvXQ1fMfYc+gxCF
	EwMG8nxR2uLhj2Yebfl30tp8oqKGI/OdrNw8dm5IOGPV63BY2RYPaGHmu/7ty/iDjb4/6onRi2hnI
	PXpRRAhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6cTR-002JBR-FT; Thu, 22 Jul 2021 17:27:05 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6cTN-002JAh-MK
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 17:27:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id p17so5305166plf.12
 for <linux-riscv@lists.infradead.org>; Thu, 22 Jul 2021 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TOWH02qjc77Xd7z81JLx4HL1UgCCUE8E3VxL2ZDH10A=;
 b=t8OJgEQZtgTCfwbdGyrHlRTDkRw1saAVFWKuPC/C8zLE7iS02OyqryL3omqbO9fqrN
 V9XM0wc52FkRRi0GdFxdTRFooePjhHeAyMWMW4U96NVyEZjnKZPR2vjxxJWOhqcLup+/
 63hgPGdxq4t2MSTAODblcUIc7JuDR6u0byJ4rxy/anunneel22elHKNnFA7ij7wXZprM
 M7IdVNkH1FlTQ0ExvLKmCXXGV5aNEewuSohq7OdwsX4BaqDdAJo6RbyZPyCbTW6kajOb
 E9JYUbyN2XqmdbgfXj+JxzxdKXlBZ69MOjE0oL8+1bXSOOvQhD4lxeF1ubv9/M4Xyem9
 ofXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TOWH02qjc77Xd7z81JLx4HL1UgCCUE8E3VxL2ZDH10A=;
 b=TrWvY8xp3yCo5CZdMiON66EP4MjU2G6242tR4ACXee/aNEmbBRLuCQz8Y7qLJWjCAo
 iIHaHLzoVZTRdWJ19aGRWR3uuAZyreb6fKCRhZq5ZjxZGfzpevrpgpV//Vkj7Rh793w2
 wnp0p7HoaIjQfl1UuBuN1RpSa1VVdsVx9UCKG61RxfyjxJEgnuP+btdF1sUg6FrjQIYa
 nsIdsRrEffs7n2PtQNZopepsk3y3W3m7lWwruMxT9O8AdO/XF7YECZkGyq9AXSpBkUxE
 khdJOZZNJws9Ce8sgGUL7MG8PMlGQs0eJqaHF8LFcD3T3DlnehgjEopP88xwkKsnR2PB
 xTLQ==
X-Gm-Message-State: AOAM532OIfLfyBFJOgz+i2pNjTJ3IVBXNL1uGbu6CgUL6qfv/AeTEWoa
 2KdLwPNpRJ0aH6cSOYxsk8TZZw==
X-Google-Smtp-Source: ABdhPJx3zydz+GFRy8ZokYCyu76kOZ+rPujojki6m4FvqsyUDl/yfWpZxtJVWLNTDJugitA/vWBAyA==
X-Received: by 2002:a65:6a0d:: with SMTP id m13mr1018088pgu.356.1626974820669; 
 Thu, 22 Jul 2021 10:27:00 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n32sm30611132pfv.59.2021.07.22.10.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:26:59 -0700 (PDT)
Date: Thu, 22 Jul 2021 10:26:59 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jul 2021 23:23:49 PDT (-0700)
Subject: Re: [PATCH -next 1/2] riscv: implemented auipc simulate instruction
In-Reply-To: <20210629023455.280998-1-chenlifu@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 guoren@linux.alibaba.com, chenlifu@huawei.com, penberg@kernel.org,
 mhiramat@kernel.org, me@packi.ch, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: chenlifu@huawei.com
Message-ID: <mhng-65ffe489-280a-4ebd-94e3-745f7114218d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_102701_832684_B5D9BFAC 
X-CRM114-Status: GOOD (  31.00  )
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

On Mon, 28 Jun 2021 19:34:54 PDT (-0700), chenlifu@huawei.com wrote:
> To test the kprobe-based event tracing, we prepare
> a kernel module 'kprobe_test.ko' to add the probes.
> The assembly codes (partially) of the module are as follows:
> ...
> 0000000000000000 <kprobe_test_branch>:
> ...
> 0000000000000038 <.LVL1>:
>   38:	00000597          	auipc	a1,0x0
>   3c:	00058593          	mv	a1,a1
> ...
>
> Test the kprobe-based event tracing in qemu-system-riscv64:
> First, install the kprobe test module:
> insmod /root/kprobe_test.ko
>
> Then, add a probe as a new event at an 'auipc' instruction,
> the following error occurs due to the instruction not allowed to probe yet:
> echo "p:auipc kprobe_test:kprobe_test_branch+0x38 epc=%epc opcode=+0(%epc):x32" >> /sys/kernel/debug/tracing/kprobe_events
> sh: write error: Invalid argument
>
> This patch implemented the 'auipc' simulate instruction and allowed to probe it.
> Merge this patch and perform the test again, the test results are as follows:
> First, add a probe at the 'auipc' instruction:
> echo "p:auipc kprobe_test:kprobe_test_branch+0x38 epc=%epc opcode=+0(%epc):x32" >> /sys/kernel/debug/tracing/kprobe_events
> echo 1 > /sys/kernel/debug/tracing/events/kprobes/auipc/enable
>
> Then, do something to run to the probe.
> After that, see the traced information:
> cat /sys/kernel/debug/tracing/trace
> sysctl-58      [001] d...   179.126350: auipc: (kprobe_test_branch+0x38/0x10e [kprobe_test]) epc=0xffffffff016122aa opcode=0x100073
>
> Now we can see the traced information.
> The actual address of the symbol 'kprobe_test_branch' is as follows:
> cat /proc/kallsyms | grep kprobe_test_branch
> ffffffff01612272 t kprobe_test_branch   [kprobe_test]
>
> Based on the traced information and the actual address of the symbol
> 'kprobe_test_branch', we can also see that the 'auipc' instruction
> has been replaced by 'ebreak(0x100073)' instruction.
>
> --------
>
> Signed-off-by: Chen Lifu <chenlifu@huawei.com>
> ---
>  arch/riscv/kernel/probes/decode-insn.c   |  2 +-
>  arch/riscv/kernel/probes/simulate-insn.c | 34 ++++++++++++++++++++++++
>  2 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
> index 0ed043acc882..5eb03fb61450 100644
> --- a/arch/riscv/kernel/probes/decode-insn.c
> +++ b/arch/riscv/kernel/probes/decode-insn.c
> @@ -38,11 +38,11 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
>  	RISCV_INSN_REJECTED(c_ebreak,		insn);
>  #endif
>
> -	RISCV_INSN_REJECTED(auipc,		insn);
>  	RISCV_INSN_REJECTED(branch,		insn);
>
>  	RISCV_INSN_SET_SIMULATE(jal,		insn);
>  	RISCV_INSN_SET_SIMULATE(jalr,		insn);
> +	RISCV_INSN_SET_SIMULATE(auipc,		insn);
>
>  	return INSN_GOOD;
>  }
> diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
> index 2519ce26377d..b81719522d5c 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.c
> +++ b/arch/riscv/kernel/probes/simulate-insn.c
> @@ -83,3 +83,37 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
>
>  	return ret;
>  }
> +
> +#define auipc_rd_idx(opcode) \
> +	((opcode >> 7) & 0x1f)
> +
> +#define auipc_imm(opcode) \
> +	((((opcode) >> 12) & 0xfffff) << 12)
> +
> +#if __riscv_xlen == 64
> +#define auipc_offset(opcode)	sign_extend64(auipc_imm(opcode), 31)
> +#elif __riscv_xlen == 32
> +#define auipc_offset(opcode)	auipc_imm(opcode)
> +#else
> +#error "Unexpected __riscv_xlen"
> +#endif
> +
> +bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs)
> +{
> +	/*
> +	 * auipc instruction:
> +	 *  31        12 11 7 6      0
> +	 * | imm[31:12] | rd | opcode |
> +	 *        20       5     7
> +	 */
> +
> +	u32 rd_idx = auipc_rd_idx(opcode);
> +	unsigned long rd_val = addr + auipc_offset(opcode);
> +
> +	if (!rv_insn_reg_set_val(regs, rd_idx, rd_val))
> +		return false;
> +
> +	instruction_pointer_set(regs, addr + 4);
> +
> +	return true;
> +}

Thanks.  These are on for-next, with the checkpatch errors fixed and the 
commit messages mostly removed -- it was all pretty awkwardly phrased so 
I didn't want to clean it up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
