Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17C4CCD1A5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 23:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LxxH7vcFeY6M8o9qVGF/eZKWhrTdTLd7AM4pHtRXUU=; b=RlxVP0OF/BARXC
	BbUk+04+f6CGDz0/QXv3oau7LRIYK9HSjTbv61tv9UDRqKTZgB0+20r+gNXkXgZsuzioyA31npkFj
	DXCsnXCKxZ42r+hwjCXANK+of398+tQB8/FuLfDYU9H7zF2sUgjlT7qvZ8nqPN1VUZcH0Bjb+wHhB
	PmKA+pE5Yw95Usu8rOMPV5Uliq9sX/fMRjmmmMx75hqjVN3SjpDx+BW5KUnU3lMc6Hzw1Y4GNt8S7
	FqTPS9/HjYqbhEKbqyRYXJCLBQsrxw29OFfmK/0215Jz83uktsV1GFiJA2qj9W8P/qVm0NDm2j/yk
	W0/+pb5wf7ljmZrpZWzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBLfn-00000000uny-0PJg;
	Tue, 21 Oct 2025 23:21:47 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBLfk-00000000unZ-33xC
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 23:21:45 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b679450ecb6so4594429a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761088903; x=1761693703; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/sG1jk/D7r3ClCgjL60On0j3McaW8ML4Lr1KS/4bzw=;
        b=Lw0WoaKDdNZHNYmymeU2J0/pnSJd2kbvmITylLkMH6oWNo/qOM3xFIFiYpG6KO4Wxv
         vhDv65E+TarjdmbNlTNIzX8qAY9oItLfpDMgOl8jFi3swDWwewdRGQT7RlhnGnWe11Lh
         9QMRPTv26xhIflyf95P4O3qKo7ZJRdS/jwZLZaTwmuu214dE+WAvQkOUmcyQ89rb3xsS
         9UKYIzbwmZifDUkWW2r5D4WdmxLUjx/IDoVtv+UvHwsxqNnk81fWIGm9DnETwQW+gevk
         6WR37EBqR8+Xtj+J8wRIpTKtFRjJvzWJz0spBjGAZ2lqeUy+zEPeaqsSlRTiip65UXaA
         cdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761088903; x=1761693703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/sG1jk/D7r3ClCgjL60On0j3McaW8ML4Lr1KS/4bzw=;
        b=oqOlBGF2mShi7NtS4WzcKZkqXWKmNCXo779wTTu2VnNbMAsWN3jjIMsMBstAooEH2g
         QeE1ZWX/GfZI2jYDkkACO/DHXQor7sQiG/XLwzLGTOu0Azinadzk4SXMIgu1xerp14TY
         RjdSv6IjUnSVoIwqWrAF/0JyRBZ+l0P8LfV8QB+jM4heBayS5xmgS6XZzNRxNISZEx4k
         RedpERhizJPH3Y5Jb3Ynx8LnLFh+fsANuA3jX2Po0/jt8nSIH1vVTpPUVOJIsxibXpKX
         Tg7nh38FeWOBcAFwAbrju3zh3SXE0PFTR04NbiVsH5yotozYRl1GqTCtGtzkcqktqg/V
         16og==
X-Forwarded-Encrypted: i=1; AJvYcCXxNf1oyrtijMlxjMSBUblilYDtb+gRTpBgq6YswgMEUBmHfrxgiWJc+FwPgp9DS1AS8ylGjEm18BDPuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaTpdRsDCRpdve0mMfl2hTJk3vepaSH/jeoSQq7+bL/EFZh77i
	XE6VJuS7E9GkncuTLoOmHnNWsjBxdVEraoUJn18sliXK/0Oi2N+DEMaEPSAfXPKE/So=
X-Gm-Gg: ASbGnctCkyM295kc7SKf2qAOzdo4vZ3Vk3xr0Oxi9RQ/JAgUyIeXRKrgFOR91Dlvoic
	hRvOl2iSOHf5uWCW0EClNGeQXvB3tb5ZF0+eIpN5gBTI5smh004dhQrr5VuYX2bePZP1VYM11D2
	VuuYOAsHJMlJfyX5ho9SKigB5/SvKcDVgoCBgLSuqP9baa6GLhWgPaxqdqZPlr+Q3dQoGoGkNuU
	X4gVL8arKCo8SwCnGpPO+YzMdEE+qo50974oLvkRDSZhbbeQeRYGLRoC+GSLwpZIs5PSui6iHU+
	SfwTKKuJbTXnorxFw6MC5EJZRI9DhyPSr4/zSdqsK04oW2Z6HajSpCG/V/pLPEqyGDGvRgvZYT1
	/I3vcmUIh7cTA9CWh1Iksqsb/d56AIGjdMesVspGzH9tV4w2li02lMe9HcrwaXxsgeuYfRbZU3Q
	ECMzkHEl/Zlan4
X-Google-Smtp-Source: AGHT+IE6NQoNLTk3Nz7GLQHnJMwF2PBGrN0ifVkPryTJs6MYiO3iNqHLbbOvp74DNY+7bQCnliJ3OA==
X-Received: by 2002:a17:902:ecc6:b0:290:7e29:f59f with SMTP id d9443c01a7336-290c9cf34f1mr242661745ad.27.1761088903517;
        Tue, 21 Oct 2025 16:21:43 -0700 (PDT)
Received: from localhost ([208.115.86.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e2247a359sm662800a91.12.2025.10.21.16.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:21:43 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:21:42 -0700
From: Andrew Jones <ajones@ventanamicro.com>
To: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
Cc: alex@ghiti.fr, alexghiti@rivosinc.com, aou@eecs.berkeley.edu, 
	cleger@rivosinc.com, evan@rivosinc.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, samuel.holland@sifive.com, 
	shuah@kernel.org, zhangyin2018@iscas.ac.cn, zihongyao@outlook.com
Subject: Re: [PATCH v3 1/2] riscv: hwprobe: Expose Zicbop extension and its
 block size
Message-ID: <20251021-be53f84c246523b7c4e31917@orel>
References: <20251020152924.64551-1-zihong.plct@isrc.iscas.ac.cn>
 <20251020153309.68267-1-zihong.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020153309.68267-1-zihong.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_162144_793869_D6951D38 
X-CRM114-Status: GOOD (  23.93  )
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

On Mon, Oct 20, 2025 at 11:33:08PM +0800, Yao Zihong wrote:
> - Add `RISCV_HWPROBE_EXT_ZICBOP` to report the presence of the
>   Zicbop extension.
> - Add `RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE` to expose the block
>   size (in bytes) when Zicbop is supported.
> - Update hwprobe.rst to document the new extension bit and block
>   size key, following the existing Zicbom/Zicboz style.
> 
> Signed-off-by: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 8 +++++++-
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
>  4 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 2f449c9b15bd..52f12af43b9d 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -275,6 +275,9 @@ The following keys are defined:
>         ratified in commit 49f49c842ff9 ("Update to Rafified state") of
>         riscv-zabha.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOP`: The Zicbop extension is supported, as
> +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
>       :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
>       mistakenly classified as a bitmask rather than a value.
> @@ -369,4 +372,7 @@ The following keys are defined:
>  
>      * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
>          vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
> -	Instruction Extensions Specification.
> \ No newline at end of file
> +	Instruction Extensions Specification.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
> +  represents the size of the Zicbop block in bytes.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 948d2b34e94e..2f278c395af9 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  
>  #include <uapi/asm/hwprobe.h>
>  
> -#define RISCV_HWPROBE_MAX_KEY 14
> +#define RISCV_HWPROBE_MAX_KEY 15
>  
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 5d30a4fae37a..9cc508be54c5 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -82,6 +82,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
>  #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
>  #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
> +#define		RISCV_HWPROBE_EXT_ZICBOP	(1ULL << 59)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> @@ -107,6 +108,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	12
>  #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
>  #define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0	14
> +#define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 000f4451a9d8..7a6ae1327504 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -113,6 +113,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
>  		EXT_KEY(ZICBOM);
> +		EXT_KEY(ZICBOP);
>  		EXT_KEY(ZICBOZ);
>  		EXT_KEY(ZICNTR);
>  		EXT_KEY(ZICOND);
> @@ -293,6 +294,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
>  			pair->value = riscv_cbom_block_size;
>  		break;
> +	case RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE:
> +		pair->value = 0;
> +		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOP))
> +			pair->value = riscv_cbop_block_size;
> +		break;
>  	case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
>  		pair->value = user_max_virt_addr();
>  		break;
> -- 
> 2.47.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
