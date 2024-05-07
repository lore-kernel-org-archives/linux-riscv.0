Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98EEC25B4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=749b3EP4h32XIUxjO1h60YAYE8zPnH6AfaqH+s5Gfho=; b=Jk45EMJaas68Gu
	9p3hOl51jsPANKzYdc2geT+uLVCdspkY+kiUm77GQ+LUi4BzaWGYT0zMRStG2s5JJ5Gg1dashHs4N
	TDNab7amDmnluetDlbkQ9G+ficBzk1qBDJpEfWXV9X33ibSqz1BLJFt1T5UOAgPr+YrleJrYGs21i
	7WdDa0p7K9lspG+aolhSCn5RJroGX0q/2px5UO+YJ/8UhHxU24dDWP6gFpyvn6u0rO3bJhXR556+5
	j15z0RLs1nI0VNMRm3j9nQtGZLyM6cVn1OpQVs1Ny2p0vSBjFClRmdmYteEZVNBu+hz93WwOuDPLZ
	mp2LfIB7JXNRmKkqZuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4KEF-0000000B0WI-2A0H;
	Tue, 07 May 2024 12:47:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4KEB-0000000B0U3-2Umr
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 12:47:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VYdHM1fVJzYmKg;
	Tue,  7 May 2024 20:43:27 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 89DE2180065;
	Tue,  7 May 2024 20:47:16 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 7 May 2024 20:47:15 +0800
Message-ID: <6836eb5c-f135-4e58-987b-987ab446b27c@huawei.com>
Date: Tue, 7 May 2024 20:47:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv, bpf: Optimize zextw insn with Zba extension
Content-Language: en-US
To: Xiao Wang <xiao.w.wang@intel.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <luke.r.nels@gmail.com>,
	<xi.wang@gmail.com>, <bjorn@kernel.org>
CC: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
	<martin.lau@linux.dev>, <eddyz87@gmail.com>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <john.fastabend@gmail.com>, <kpsingh@kernel.org>,
	<sdf@google.com>, <haoluo@google.com>, <jolsa@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <haicheng.li@intel.com>
References: <20240507104528.435980-1-xiao.w.wang@intel.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240507104528.435980-1-xiao.w.wang@intel.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_054728_003806_75A55C0A 
X-CRM114-Status: GOOD (  16.99  )
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


On 2024/5/7 18:45, Xiao Wang wrote:
> The Zba extension provides add.uw insn which can be used to implement
> zext.w with rs2 set as ZERO.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>   arch/riscv/Kconfig       | 19 +++++++++++++++++++
>   arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6bec1bce6586..0679127cc0ea 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -586,6 +586,14 @@ config RISCV_ISA_V_PREEMPTIVE
>   	  preemption. Enabling this config will result in higher memory
>   	  consumption due to the allocation of per-task's kernel Vector context.
>   
> +config TOOLCHAIN_HAS_ZBA
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zba)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> +	depends on AS_HAS_OPTION_ARCH
> +
>   config TOOLCHAIN_HAS_ZBB
>   	bool
>   	default y
> @@ -601,6 +609,17 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
>   	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
>   	depends on AS_HAS_OPTION_ARCH
>   
> +config RISCV_ISA_ZBA
> +	bool "Zba extension support for bit manipulation instructions"
> +	depends on TOOLCHAIN_HAS_ZBA
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the ZBA
> +	   extension (address generation acceleration) and enable its usage.

It would be better to add Zba's function description like Zbb.

> +
> +	   If you don't know what to do here, say Y.
> +
>   config RISCV_ISA_ZBB
>   	bool "Zbb extension support for bit manipulation instructions"
>   	depends on TOOLCHAIN_HAS_ZBB
> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> index f4b6b3b9edda..18a7885ba95e 100644
> --- a/arch/riscv/net/bpf_jit.h
> +++ b/arch/riscv/net/bpf_jit.h
> @@ -18,6 +18,11 @@ static inline bool rvc_enabled(void)
>   	return IS_ENABLED(CONFIG_RISCV_ISA_C);
>   }
>   
> +static inline bool rvzba_enabled(void)
> +{
> +	return IS_ENABLED(CONFIG_RISCV_ISA_ZBA) && riscv_has_extension_likely(RISCV_ISA_EXT_ZBA);
> +}
> +
>   static inline bool rvzbb_enabled(void)
>   {
>   	return IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && riscv_has_extension_likely(RISCV_ISA_EXT_ZBB);
> @@ -937,6 +942,14 @@ static inline u16 rvc_sdsp(u32 imm9, u8 rs2)
>   	return rv_css_insn(0x7, imm, rs2, 0x2);
>   }
>   
> +/* RV64-only ZBA instructions. */
> +
> +static inline u32 rvzba_zextw(u8 rd, u8 rs1)
> +{
> +	/* add.uw rd, rs1, ZERO */
> +	return rv_r_insn(0x04, RV_REG_ZERO, rs1, 0, rd, 0x3b);
> +}
> +
>   #endif /* __riscv_xlen == 64 */
>   
>   /* Helper functions that emit RVC instructions when possible. */
> @@ -1159,6 +1172,11 @@ static inline void emit_zexth(u8 rd, u8 rs, struct rv_jit_context *ctx)
>   
>   static inline void emit_zextw(u8 rd, u8 rs, struct rv_jit_context *ctx)
>   {
> +	if (rvzba_enabled()) {
> +		emit(rvzba_zextw(rd, rs), ctx);
> +		return;
> +	}

Looks good to me. It seems that Zba has fewer uses in rv64 bpf jit.

> +
>   	emit_slli(rd, rs, 32, ctx);
>   	emit_srli(rd, rd, 32, ctx);
>   }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
