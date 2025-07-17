Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA93C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TGOYVL71gHe3SaUg5dRBmsYjrAFAo8tOrLSmr7wVow=; b=2hBDhep//unAX4
	NmAivCy5Cyi7RkZm0lGfYjtdE1/8V3ZCgpQYQTASeYJ4l6tpHZipZvR8XJnb0/BVaplaUd0xGXOVR
	p4Bp7BifuOyQEoi8m6rr8EsBetDRg2CPQtcWiIdbM7vAKDWwv6vz8vpki1FMV6UiCGQoyeMPtq4ex
	T6rXkERe+6Hw53kvsIRuFYM1iFnktEYxqZkcl4spvxchlC43iQ2QLi5rmcMLGAjcKznM0r28RkXC4
	9u2Ck4s4UKcwwom5DMpfTxK/CouKcjT9X7rr1G4bzf8uqdEtLGrdGJxOtWiLMSyOnXwl2TETPLb2+
	zRooFazpm9+7zrGHgjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKbH-00000009gXO-3iTJ;
	Thu, 17 Jul 2025 09:08:23 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucJs8-00000009Z6H-3JFB
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 08:21:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96B5543157;
	Thu, 17 Jul 2025 08:21:38 +0000 (UTC)
Message-ID: <c6045d12-4e6c-4b95-b23e-289ce92b7474@ghiti.fr>
Date: Thu, 17 Jul 2025 10:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] riscv: Move vendor errata definitions to new
 header
To: guoren@kernel.org, palmer@dabbelt.com, conor@kernel.org,
 alexghiti@rivosinc.com, paul.walmsley@sifive.com, bjorn@rivosinc.com,
 eobras@redhat.com, corbet@lwn.net, peterlin@andestech.com,
 rabenda.cn@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250713155321.2064856-1-guoren@kernel.org>
 <20250713155321.2064856-2-guoren@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250713155321.2064856-2-guoren@kernel.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudekhedrvddufedrudehgedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedukeehrddvudefrdduheegrdduhedupdhhvghloheplgdutddrudegrddtrddufegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepghhuohhrvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopegsjhhorhhnsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegvohgsrhgrshesrhgvughhrghtr
 dgtohhmpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvght
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_012144_960205_7CD0670F 
X-CRM114-Status: GOOD (  10.35  )
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

Hi Guo,

On 7/13/25 17:53, guoren@kernel.org wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
>
> Move vendor errata definitions into errata_list_vendors.h.
>
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> ---
>   arch/riscv/include/asm/errata_list.h         | 19 +---------------
>   arch/riscv/include/asm/errata_list_vendors.h | 24 ++++++++++++++++++++
>   2 files changed, 25 insertions(+), 18 deletions(-)
>   create mode 100644 arch/riscv/include/asm/errata_list_vendors.h
>
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 6e426ed7919a..18c9f7ee9b7c 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -10,24 +10,7 @@
>   #include <asm/insn-def.h>
>   #include <asm/hwcap.h>
>   #include <asm/vendorid_list.h>
> -
> -#ifdef CONFIG_ERRATA_ANDES
> -#define ERRATA_ANDES_NO_IOCP 0
> -#define ERRATA_ANDES_NUMBER 1
> -#endif
> -
> -#ifdef CONFIG_ERRATA_SIFIVE
> -#define	ERRATA_SIFIVE_CIP_453 0
> -#define	ERRATA_SIFIVE_CIP_1200 1
> -#define	ERRATA_SIFIVE_NUMBER 2
> -#endif
> -
> -#ifdef CONFIG_ERRATA_THEAD
> -#define	ERRATA_THEAD_MAE 0
> -#define	ERRATA_THEAD_PMU 1
> -#define	ERRATA_THEAD_GHOSTWRITE 2
> -#define	ERRATA_THEAD_NUMBER 3
> -#endif
> +#include <asm/errata_list_vendors.h>
>   
>   #ifdef __ASSEMBLY__
>   
> diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
> new file mode 100644
> index 000000000000..a37d1558f39f
> --- /dev/null
> +++ b/arch/riscv/include/asm/errata_list_vendors.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef ASM_ERRATA_LIST_VENDORS_H
> +#define ASM_ERRATA_LIST_VENDORS_H
> +
> +#ifdef CONFIG_ERRATA_ANDES
> +#define ERRATA_ANDES_NO_IOCP 0
> +#define ERRATA_ANDES_NUMBER 1
> +#endif
> +
> +#ifdef CONFIG_ERRATA_SIFIVE
> +#define	ERRATA_SIFIVE_CIP_453 0
> +#define	ERRATA_SIFIVE_CIP_1200 1
> +#define	ERRATA_SIFIVE_NUMBER 2
> +#endif
> +
> +#ifdef CONFIG_ERRATA_THEAD
> +#define	ERRATA_THEAD_MAE 0
> +#define	ERRATA_THEAD_PMU 1
> +#define	ERRATA_THEAD_GHOSTWRITE 2
> +#define	ERRATA_THEAD_NUMBER 3
> +#endif
> +
> +#endif


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
