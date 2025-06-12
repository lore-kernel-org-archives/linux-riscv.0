Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C852FC7114A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PgxB+VxdMGrz5yq1ZnjrsnYwrxpVnOqcyIC5mOjWUA=; b=D9sgpVcMY7h1s3
	ITCbzv4emSse+2VHty8ZfTKWe2Ffg+QN4V9z199+E6kMmYQ+5E1NQSvPCcaDePNYO+60H1lHU9+DN
	qKWxTElPykTYzcXwwkSzS3ghIUb2F9ni7ASvE2gKIAdy3kxFdN2UyJqs8p+I71/Lx0gK6Vbrezy5U
	e1aSxyNoBZJAaA7vEr28J22FvW11xXjKAdYGdpwbQQ4zX/o+/BOTHhMiuTYOs7y6NYiTLq0rDmKTd
	rdtaPp1eMWJPx1sXfnPjbV9l1TXOVSHuKry/7UEIrul70icdbfaTuNzZyaixwqFosjQjMKwFN47Cx
	rL0bACEbGivlzLSBrlrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnml-0000000EDbz-2Lm2;
	Thu, 12 Jun 2025 19:40:27 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhXp-0000000DJmU-0C95
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 13:00:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4F2344344;
	Thu, 12 Jun 2025 13:00:33 +0000 (UTC)
Message-ID: <288c7d1d-e1b4-4ea1-8877-8b7de033b24a@ghiti.fr>
Date: Thu, 12 Jun 2025 15:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] riscv: Optimize gcd() performance on RISC-V
 without Zbb extension
To: Kuan-Wei Chiu <visitorckw@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jserv@ccns.ncku.edu.tw, Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
 <20250606134758.1308400-4-visitorckw@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250606134758.1308400-4-visitorckw@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduhedufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepvhhishhithhorhgtkhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrk
 hgvlhgvhidrvgguuhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjshgvrhhvsegttghnshdrnhgtkhhurdgvughurdhtfi
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_060037_233695_42FD206B 
X-CRM114-Status: GOOD (  16.02  )
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

On 6/6/25 15:47, Kuan-Wei Chiu wrote:
> The binary GCD implementation uses FFS (find first set), which benefits
> from hardware support for the ctz instruction, provided by the Zbb
> extension on RISC-V. Without Zbb, this results in slower
> software-emulated behavior.
>
> Previously, RISC-V always used the binary GCD, regardless of actual
> hardware support. This patch improves runtime efficiency by disabling
> the efficient_ffs_key static branch when Zbb is either not enabled in
> the kernel (config) or not supported on the executing CPU. This selects
> the odd-even GCD implementation, which is faster in the absence of
> efficient FFS.
>
> This change ensures the most suitable GCD algorithm is chosen
> dynamically based on actual hardware capabilities.
>
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   arch/riscv/kernel/setup.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f7c9a1caa83e..785c7104fde7 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -21,6 +21,8 @@
>   #include <linux/efi.h>
>   #include <linux/crash_dump.h>
>   #include <linux/panic_notifier.h>
> +#include <linux/jump_label.h>
> +#include <linux/gcd.h>
>   
>   #include <asm/acpi.h>
>   #include <asm/alternative.h>
> @@ -361,6 +363,9 @@ void __init setup_arch(char **cmdline_p)
>   
>   	riscv_user_isa_enable();
>   	riscv_spinlock_init();
> +
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB) || !riscv_isa_extension_available(NULL, ZBB))
> +		static_branch_disable(&efficient_ffs_key);
>   }
>   
>   bool arch_cpu_is_hotpluggable(int cpu)


Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
