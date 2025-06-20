Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8E3C7EE2C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:References:
	In-Reply-To:Mime-Version:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2JrDsyrNaR/7izAMB71s5JaZtN/K6BqfsWhb+Oxhng=; b=UQ3eqlkkO+AH6N
	RCMEkbQyZbhVzC4wlp7/WG9ZpvMRyCY6z2GRu1VV8fD/+akM+dm3mDKt4iLkjp7QKsGvFaGj1SWXY
	hcNJ0PBd0B0fea+9GTCegVCjtHjm4chE02F/aYbSMHrR/jsw2nlx73xe2vCnKsQjkUsyUsU4rLwXo
	VdDf22UnaVjhC0mrBc7rgYfkwV0LC+sL2FWIfGW0M5cY7sbEwoe0otcddNdRtmrTmdDtz5n7i0RA7
	E4Xcp20Mb86BIbnb/9J7cqivcbyAVcn4dwG/MWEQvDlmfiCT9+G/5JZwVnm7MFTA8X72xTPHCc861
	ZLzZF2A0SX8XbT/N8n5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZ74-0000000FLqi-2stI;
	Fri, 20 Jun 2025 10:36:50 +0000
Received: from sg-3-14.ptr.tlmpb.com ([101.45.255.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYEP-0000000FDh4-1wj8
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 09:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750412410;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=DSXFLaHV+ytdpl3MS+800NYkToDbPrkHYChL5TyTBVY=;
 b=A1w8XwHKyXRXqXK0kiJJfA7qBwtdVqdy/pA72el2dkYJn6d+rFciZdMyDjceeek/Dw3MfZ
 zRD86STxKQ4YQpPzjJyeE57ILW/U07RINDFjTv+1eooJU34VGvBl8mZec+QPll/A3AX5Q7
 YlME64KyfkL2cuGKCUw10BPaZoMKTOL927tukSVh552zm8p4x6EP3HH938i7JEHxRQA1vV
 pLxM9YO+WJaNtn8V5ZRllSZVpk52UUrkEIS8q9NGZ2YV1isBwo00wqUmfdVXWL8LRq95Kz
 9M8uqkOwpRlGG/CPztZfGnYX+sZQaEUDzwc1+OOZNL4yY3wpC55GGDW6xDHLyg==
Subject: Re: [PATCH 2/5] RISC-V: KVM: Allow Zicbop extension for Guest/VM
Mime-Version: 1.0
In-Reply-To: <e2a040c161f17c1717b64750e774474d8ee8f0d6.1750164414.git.zhouquan@iscas.ac.cn>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn> <e2a040c161f17c1717b64750e774474d8ee8f0d6.1750164414.git.zhouquan@iscas.ac.cn>
X-Lms-Return-Path: <lba+268552c78+6dc699+lists.infradead.org+liujingqi@lanxincomputing.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Date: Fri, 20 Jun 2025 17:40:06 +0800
User-Agent: Mozilla Thunderbird
Message-Id: <655ef636-704d-4a6d-9de7-5eb44282af42@lanxincomputing.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
To: <zhouquan@iscas.ac.cn>, <anup@brainfault.org>, <ajones@ventanamicro.com>, 
	<atishp@atishpatra.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>
Content-Language: en-US
Received: from [127.0.0.1] ([180.165.3.105]) by smtp.feishu.cn with ESMTPS; Fri, 20 Jun 2025 17:40:07 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_024021_864540_C904CC9F 
X-CRM114-Status: UNSURE (   9.95  )
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

On 6/17/2025 9:10 PM, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
>
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zicbop extension for Guest/VM.
>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>   arch/riscv/include/uapi/asm/kvm.h | 1 +
>   arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>   2 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 0863ca178066..56959d277e86 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -185,6 +185,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>   	KVM_RISCV_ISA_EXT_ZICCRSE,
>   	KVM_RISCV_ISA_EXT_ZAAMO,
>   	KVM_RISCV_ISA_EXT_ZALRSC,
> +	KVM_RISCV_ISA_EXT_ZICBOP,
>   	KVM_RISCV_ISA_EXT_MAX,
>   };
>   
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index b08a22eaa7a7..d444ec9e9e8e 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -68,6 +68,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>   	KVM_ISA_EXT_ARR(ZFH),
>   	KVM_ISA_EXT_ARR(ZFHMIN),
>   	KVM_ISA_EXT_ARR(ZICBOM),
> +	KVM_ISA_EXT_ARR(ZICBOP),
>   	KVM_ISA_EXT_ARR(ZICBOZ),
>   	KVM_ISA_EXT_ARR(ZICCRSE),
>   	KVM_ISA_EXT_ARR(ZICNTR),
> @@ -171,6 +172,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>   	case KVM_RISCV_ISA_EXT_ZFA:
>   	case KVM_RISCV_ISA_EXT_ZFH:
>   	case KVM_RISCV_ISA_EXT_ZFHMIN:
> +	case KVM_RISCV_ISA_EXT_ZICBOP:
>   	case KVM_RISCV_ISA_EXT_ZICCRSE:
>   	case KVM_RISCV_ISA_EXT_ZICNTR:
>   	case KVM_RISCV_ISA_EXT_ZICOND:

Seems 'RISCV_ISA_EXT_ZICBOP' should be declared in 'arch/riscv/include/asm/hwcap.h' ?
Otherwise,
Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
