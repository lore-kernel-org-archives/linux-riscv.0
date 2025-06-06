Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5037C61CE7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 23:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnNzzs9x+PPkZa6qZLYyCRdcs3U33cV9I+XjblopvY4=; b=rAPdl6WuTMcU8pms4GfgTWdVYR
	3wUEGwm5XD394+EfnArIjc92dZc+Drm71j4GEFE1Gsqg5SAcdoIKNckzEq5l2xl8SFkhbdsqGXr+y
	73Y4ZOV+qLMDb7grNdlwvOMk69O26PPOBwlB5v19nn2ze9BpwtyFpXNo/zGEa+1P5t4P2UmSV50+j
	L2BL8CXRU6LFHjyFBfGF9yz7a223qFt7BCIrtHJDbLbSvTrvw4kinTo/JjOPY0G71aAfBdEb3rDXe
	JP+MGmfGhpKdiFFR82LxEfivjxBFt6xBOepm0XvkgjUtz3JOyGG1d16m9KFqzgkepOx7lzaJgb63f
	OZ2UQkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgqQ-000000018mh-358Z;
	Fri, 06 Jun 2025 23:51:30 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgqO-000000018mI-1WI2
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:51:29 +0000
Message-ID: <53abb1fc-6236-4266-a6e7-25023e27e160@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749253883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/HbOR3EULs8XvSveJScVmCrHyMz65f+FWPAjqqZByU=;
	b=rlmoatxG+JMkL4LudZ4tc7daT4pNnwe5v8xYZa+Qyn4DVhMnaMRP3sWlgVDx+YIsuRQrOe
	7coND2Tv40rO/vqnsmgO8kY3u+6+M+0QmNwqwyHv1nB8cdTZCjEkvzsiqjKWFSruTO56IS
	dNRlqi/gQQR0b2pruhclZtRxs/ctqyA=
Date: Fri, 6 Jun 2025 16:51:14 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v4 01/23] riscv: Add new error codes defined by SBI v3.0
To: Anup Patel <apatel@ventanamicro.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-2-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250525084710.1665648-2-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165128_619450_6970134D 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 5/25/25 1:46 AM, Anup Patel wrote:
> The SBI v3.0 defines new error codes so add these new error codes
> to the asm/sbi.h for use by newer SBI extensions.

This patch can be dropped as it is part of the FWFT series with minor 
modifications in error mappings.

https://lore.kernel.org/linux-riscv/20250523101932.1594077-4-cleger@rivosinc.com/


> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/sbi.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 3d250824178b..4dd6aafb8468 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -419,6 +419,11 @@ enum sbi_ext_nacl_feature {
>   #define SBI_ERR_ALREADY_STARTED -7
>   #define SBI_ERR_ALREADY_STOPPED -8
>   #define SBI_ERR_NO_SHMEM	-9
> +#define SBI_ERR_INVALID_STATE	-10
> +#define SBI_ERR_BAD_RANGE	-11
> +#define SBI_ERR_TIMEOUT		-12
> +#define SBI_ERR_IO		-13
> +#define SBI_ERR_DENIED_LOCKED	-14
>   
>   extern unsigned long sbi_spec_version;
>   struct sbiret {
> @@ -503,11 +508,18 @@ static inline int sbi_err_map_linux_errno(int err)
>   	case SBI_SUCCESS:
>   		return 0;
>   	case SBI_ERR_DENIED:
> +	case SBI_ERR_DENIED_LOCKED:
>   		return -EPERM;
>   	case SBI_ERR_INVALID_PARAM:
> +	case SBI_ERR_INVALID_STATE:
> +	case SBI_ERR_BAD_RANGE:
>   		return -EINVAL;
>   	case SBI_ERR_INVALID_ADDRESS:
>   		return -EFAULT;
> +	case SBI_ERR_TIMEOUT:
> +		return -ETIMEDOUT;
> +	case SBI_ERR_IO:
> +		return -EIO;
>   	case SBI_ERR_NOT_SUPPORTED:
>   	case SBI_ERR_FAILURE:
>   	default:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
