Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6570D12696
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 09:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyr2zUBPzpAh9UQ5CoUq5PJk8hG35ueecFOIdebAfR0=; b=OnluHC2BGQ1Blu
	46dmjvLAlLAsd67Q6ehSSxn6X3wuh/BJyXb9XZcKN4Qfgldr1oRfq4UL8t6njzxXNp3/lIkg7AfGS
	uDnPBQVwAdBrq0ThcnDB+asXEI63Y19c51IDaFsLRnxxuGmubpInoMod/zGfQwQjxUKVSsf651GWj
	h6M5QSF0JW4H0UycN5WyaP11O3Z+PvHFdeY7elsOwhGCrm3YbV7pW5DDeQME1O7ShzJWKIuhTl3CB
	8rq/yCzTe+A0oNVkBtKd0BLpw8mXdRXDyIRiCCjV02mXjo0RKTQh9xWx9Mh0hf9ZhzWhyk9y1ABAS
	Zei2hvslRFC3R75gTE7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjTB-00000006PB6-04uQ;
	Wed, 03 Dec 2025 09:48:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjT8-00000006PAe-1RsR
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 09:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ACDDD43D81;
	Wed,  3 Dec 2025 09:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0009DC4CEFB;
	Wed,  3 Dec 2025 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764755297;
	bh=uKfYxEI3gz5eSd5Zwj5AZNpCOTpyZcRJ172r4yyo2xY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JzZgPZ4OKP2lPoyi7YeJkOvfsGuLtNmku1jEO88VMaBNmU2MwEDcQLz3m76Xw83lz
	 KwBpsv1AwYkO2FFCbTDbDgqFk9QfmNjjaMt47pyu5/2/DRot0lA39SzpSXsDEor0Y5
	 XpBHlmA1kfHC2mQje+J0Yvul+hk6kOqRQkyCssuWP/FXVT4uvYMgZEIsg6Hyx/4rL5
	 yqOxB7LC6lJf+Cst8MlnRkOxVFfVbsBC3w0FnuCwJxq7H1pIePxwyxwnY93ljpgIaX
	 +E94LWtt1ILzR51c20jiY3e7nSVjapeenK5U0k1qTTNhYDtBe/MQAAj+WMVCFypU8a
	 DunnI6v2xN2ZQ==
Message-ID: <0d64e8f4-8b95-43df-b802-b85082545824@kernel.org>
Date: Wed, 3 Dec 2025 10:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: reset: Add Kendryte K230 reset controller
 bindings
To: q691800735@163.com, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20251203092632.219525-1-q691800735@163.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251203092632.219525-1-q691800735@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_014818_430957_41190A30 
X-CRM114-Status: GOOD (  17.41  )
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

On 03/12/2025 10:26, q691800735@163.com wrote:
> From: jybruceupup <q691800735@163.com>
> 
> Add canaan-k230-reset.h to define reset IDs, types and register offsets
> for Kendryte K230 RISC-V SoC, covering CPU, peripherals and subsystems.
> 
> Update MAINTAINERS RISC-V entry to include the new reset binding header
> for proper maintenance tracking.
> 
> Signed-off-by: jybruceupup <q691800735@163.com>
> ---
>  MAINTAINERS                                   |   1 +
>  include/dt-bindings/reset/canaan-k230-reset.h | 513 ++++++++++++++++++
>  2 files changed, 514 insertions(+)
>  create mode 100644 include/dt-bindings/reset/canaan-k230-reset.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d83920cbc..b489ab6cd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22105,6 +22105,7 @@ C:	irc://irc.libera.chat/riscv
>  P:	Documentation/arch/riscv/patch-acceptance.rst
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
>  F:	arch/riscv/
> +F:	include/dt-bindings/reset/canaan-k230-reset.h

Filename matching compatible.

>  F:	include/dt-bindings/soc/canaan,k230_pm_domains.h
>  N:	riscv
>  K:	riscv
> diff --git a/include/dt-bindings/reset/canaan-k230-reset.h b/include/dt-bindings/reset/canaan-k230-reset.h
> new file mode 100644
> index 000000000..17a9719b0
> --- /dev/null
> +++ b/include/dt-bindings/reset/canaan-k230-reset.h
> @@ -0,0 +1,513 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +/* Copyright (c) 2023, Canaan Bright Sight Co., Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Please don't send us downstream code. There is no single line in
upstream like that, so take it as an example.

> + */
> +#ifndef _DT_BINDINGS_CANAAN_K230_RESET_H_
> +#define _DT_BINDINGS_CANAAN_K230_RESET_H_
> +
> +/* reset register offset */
> +#define K230_RESET_REG_OFFSET_SHIFT     16
> +#define K230_RESET_REG_OFFSET_MASK      0xffff0000

Register offsets are not bindings.

And finally - where is any user of it? Please send bindings with users
or explain why there is no user (with proper rationale) in commit msg.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
