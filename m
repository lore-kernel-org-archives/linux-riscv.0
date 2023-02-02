Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A5EC636D6
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F75BkXpl4MDfhwK3wB92noip3apkWKR+yWUG1oJ0eFc=; b=qO2FFuW9bNcTDw
	OFG7q5xx/GwMT3Hp21fMlSWA9iryZ4tb27/OKj7tEy/fNkYwf+QCyLl3wEUMXEAe4c2N6oo8ed2Ls
	JiKiX/MxmBJPrGNxe3zuIKJ5Ayj7j2+hKVl2ipYIbXPh9nfIVF+gSU5AQunhO/wbQsdLJre+mXlU1
	Ss6uBfOVdCL5fKQyBEeWH0+I4Dt9kiJJxZDyBEGp10mO/8Z2Y2WtbMcVNWZTtqQmO6omf7r3hJ+U4
	TOXSUSRxtPWzmZ0F5reH5gSVsICDsknnofWfQm+YDQYpfP8tEIEQQKJ6CCkTN0JNv9kZprM+y7/o4
	r8w7Varn/kHvLQDnapZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNb62-00GE2V-SZ; Thu, 02 Feb 2023 15:01:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNb60-00GE1Y-DI
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 15:01:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so134789wms.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 07:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jlkw1fMzfUTVbCYC+KtqbnG3D7NE4RNDzj4aOJdcTTk=;
        b=Hho5VEknzD/I/ybD9eCMzmpRc5S0us958IbJ7J/1fOM/sMv2DQL3iAMA7/kNkhPGjA
         XcGcRcBo7q8Zrpkv8E0gm/Zl+cWITnUGBosIor6P+Y6RcYQjVhHd8X6QXj5GcEY7juCf
         oQbdA9+Trz94l2yW9eYsLdiV5ZuZQeSrI70SYnkQZCMt1B816Tl4ICeb/hY8ei+8qQbD
         ALpl31iaWKT1EMEW/x6OYFtxtPuwuoZzraMSczPesUN7vxHfbFWVqQNIb2+hr9Kq3SMZ
         NU5W997TUgLLYjZp0dXWufSQi+pp4D5P2ZQ/ydYfENIuicO0zThSp2KYnhkVfuTab/mA
         bZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlkw1fMzfUTVbCYC+KtqbnG3D7NE4RNDzj4aOJdcTTk=;
        b=IFPbto60y+uN58JRsPG/ttNl7rYL6m04fjgz74aTO7+Ry9a7PueLJcv31c5oNATcUs
         TIE1tj2xGGGttWrpcc9wvS3j3HmBdaA/Bucqj2iIPk7eA6+RlXL9BdP4ClQ0zP4mGbAx
         +Gf9EbDoCPknf6g3t1j136bjUPe3MhS8rF9TFmxhdMloLiXcNGR5s++SLn20m2PHNpGg
         lrurh9mFtgl5UsnZ9w+Zz1Eisoazt+EwsSq7Omoo9Qbw7OhclhiiW1cpwXWW94twfWvn
         BvugcwE1aj1bbSCK22wcQoWK1iX4irJe0Z9G2EI5z4CdKvtGHWVCwDeQpDUyJO983ag/
         YkKA==
X-Gm-Message-State: AO0yUKX9VDo6RDrPT1pipF6RjTCKVeuYaZ7L2eNbXplsh06RDSbqqEPf
	kBG25IVtX0B0bt+USg3sWtYz2g==
X-Google-Smtp-Source: AK7set+hOCzRrJzDZKwxlLiUpPd/5jC0lc768lBbKuEI78OyTsoNb0Vd/M4/19caZPBs7ICsW7MVAA==
X-Received: by 2002:a05:600c:46ca:b0:3dc:47d4:58d2 with SMTP id q10-20020a05600c46ca00b003dc47d458d2mr6333357wmo.25.1675350108726;
        Thu, 02 Feb 2023 07:01:48 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c469000b003a84375d0d1sm5479060wmo.44.2023.02.02.07.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 07:01:48 -0800 (PST)
Date: Thu, 2 Feb 2023 16:01:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 03/14] RISC-V: Improve SBI PMU extension related
 definitions
Message-ID: <20230202150147.zcj7s3ezwrg7pqfp@orel>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-4-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230201231250.3806412-4-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_070152_473759_43D8D07E 
X-CRM114-Status: GOOD (  18.88  )
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

On Wed, Feb 01, 2023 at 03:12:39PM -0800, Atish Patra wrote:
> This patch fixes/improve few minor things in SBI PMU extension
> definition.
> 
> 1. Align all the firmware event names.
> 2. Add macros for bit positions in cache event ID & ops.
> 
> The changes were small enough to combine them together instead
> of creating 1 liner patches.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 4ca7fba..945b7be 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -169,9 +169,9 @@ enum sbi_pmu_fw_generic_events_t {
>  	SBI_PMU_FW_ILLEGAL_INSN		= 4,
>  	SBI_PMU_FW_SET_TIMER		= 5,
>  	SBI_PMU_FW_IPI_SENT		= 6,
> -	SBI_PMU_FW_IPI_RECVD		= 7,
> +	SBI_PMU_FW_IPI_RCVD		= 7,
>  	SBI_PMU_FW_FENCE_I_SENT		= 8,
> -	SBI_PMU_FW_FENCE_I_RECVD	= 9,
> +	SBI_PMU_FW_FENCE_I_RCVD		= 9,
>  	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
>  	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
>  	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
> @@ -215,6 +215,9 @@ enum sbi_pmu_ctr_type {
>  #define SBI_PMU_EVENT_CACHE_OP_ID_CODE_MASK 0x06
>  #define SBI_PMU_EVENT_CACHE_RESULT_ID_CODE_MASK 0x01
>  
> +#define SBI_PMU_EVENT_CACHE_ID_SHIFT 3
> +#define SBI_PMU_EVENT_CACHE_OP_SHIFT 1
> +
>  #define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
>  
>  /* Flags defined for config matching function */
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
