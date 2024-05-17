Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF65C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 07:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQZB3+p8c36hFC8c0X9RNR8Kg6PyTuOcTwmbmWghL2Y=; b=qecyykWL5olc+D
	umTN0mdf+SIjHO++hKa7iTQd183L6g8uYyr1TZSbTPFakZFfA/wLC/nomDcIEPd2w3Q94jVhiOBSr
	4X4JYuNx3CXfN48v50v5t5RKVhYzvaUXBbieB5zXLt+ztnnoPH9cMedPD1PWYGM6pVwZjZ/kF0yOd
	jH8GHeIrs5yOtarOgfccCEMbIpXDwJx3ODiSU13/A7bG75oXDW8TKvl+luk7koTDbSdDRu59URTmq
	qZtahBQezc0abpjBrWgRGKhaY0qUDzzsWUXpD3sniFbChirjQ6iCNjKfYtxi3sq1Wa+dnq7s28Z8g
	c4YsUrvGhE8SONzyCZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7rwy-000000073EB-2wSs;
	Fri, 17 May 2024 07:24:20 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7rwu-000000073Ce-0hze
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 07:24:18 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VgdfK1Xmzz1j55s;
	Fri, 17 May 2024 15:20:41 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CCBA1A016C;
	Fri, 17 May 2024 15:24:05 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 17 May 2024 15:24:04 +0800
Message-ID: <3d7bca4f-492a-46cb-b65f-0bf14da97bb2@huawei.com>
Date: Fri, 17 May 2024 15:24:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv, bpf: Optimize zextw insn with Zba extension
Content-Language: en-US
To: Xiao Wang <xiao.w.wang@intel.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<luke.r.nels@gmail.com>, <xi.wang@gmail.com>, <bjorn@kernel.org>,
	<ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
	<martin.lau@linux.dev>, <eddyz87@gmail.com>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <john.fastabend@gmail.com>, <kpsingh@kernel.org>,
	<sdf@google.com>, <haoluo@google.com>, <jolsa@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <haicheng.li@intel.com>, <conor@kernel.org>,
	<ben.dooks@codethink.co.uk>, <ajones@ventanamicro.com>
References: <20240516090430.493122-1-xiao.w.wang@intel.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240516090430.493122-1-xiao.w.wang@intel.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_002416_588232_53A9A18B 
X-CRM114-Status: GOOD (  18.26  )
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



On 2024/5/16 17:04, Xiao Wang wrote:
> The Zba extension provides add.uw insn which can be used to implement
> zext.w with rs2 set as ZERO.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
> v3:
> * Remove the Kconfig dependencies on TOOLCHAIN_HAS_ZBA and
>    RISCV_ALTERNATIVE. (Andrew)
> v2:
> * Add Zba description in the Kconfig. (Lehui)
> * Reword the Kconfig help message to make it clearer. (Conor)
> ---
>   arch/riscv/Kconfig       | 12 ++++++++++++
>   arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6bec1bce6586..b64d55dc929f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -601,6 +601,18 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
>   	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
>   	depends on AS_HAS_OPTION_ARCH
>   
> +config RISCV_ISA_ZBA
> +	bool "Zba extension support for bit manipulation instructions"
> +	default y
> +	help
> +	   Add support for enabling optimisations in the kernel when the Zba
> +	   extension is detected at boot.
> +
> +	   The Zba extension provides instructions to accelerate the generation
> +	   of addresses that index into arrays of basic data types.
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
> +
>   	emit_slli(rd, rs, 32, ctx);
>   	emit_srli(rd, rd, 32, ctx);
>   }
Reviewed-by: Pu Lehui <pulehui@huawei.com>
Tested-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
