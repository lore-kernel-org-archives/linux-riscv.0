Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ABDC71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fs9TX8scu/27mbiQG4Phdlv2I8MHtbQeCSyJ9Ozu1L8=; b=i6Jwz87sHjpHUS
	tUJPbfUCifEd9spgenVeP1kWHHiKXMdxFlZeTPB3dXfpFH/RoaKNx7y0E6sXHjduSbMpyYR9wn6S7
	UUiz31CSSN9xxredZSyBB0hvQVJSgrHOQNqePa7EwcZPgdzzPnV2b/yqRbVNFYMZqzFCnJF+qQ335
	lim1aasztkOgVrsi5jaHOmqsWT7vFJHOEquwJ7TMP+rGmCrbIxatJmJE5krr46sjdAeylX6magr4L
	1PSOlysAq/dZbZ6NnsJG58OtMCOFnCElV1FBlw2Q9Je7jg+vzcA06PtsTvhqnNnGyi+Sv2+EB217x
	D5PafXCTF+ktxAwdhL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnmk-0000000EDbt-45Xb;
	Thu, 12 Jun 2025 19:40:26 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhWn-0000000DJj1-3w8Z
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 12:59:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0882E4433C;
	Thu, 12 Jun 2025 12:59:24 +0000 (UTC)
Message-ID: <b74f5717-bab6-4d8c-8afb-fe3fcb6e29ff@ghiti.fr>
Date: Thu, 12 Jun 2025 14:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] riscv: Optimize gcd() code size when
 CONFIG_RISCV_ISA_ZBB is disabled
To: Kuan-Wei Chiu <visitorckw@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jserv@ccns.ncku.edu.tw, Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
 <20250606134758.1308400-3-visitorckw@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250606134758.1308400-3-visitorckw@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduhedufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepvhhishhithhorhgtkhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrk
 hgvlhgvhidrvgguuhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjshgvrhhvsegttghnshdrnhgtkhhurdgvughurdhtfi
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_055934_110551_6A866037 
X-CRM114-Status: GOOD (  11.51  )
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

Hi Kuan-Wei,

On 6/6/25 15:47, Kuan-Wei Chiu wrote:
> The binary GCD implementation depends on efficient ffs(), which on
> RISC-V requires hardware support for the Zbb extension. When
> CONFIG_RISCV_ISA_ZBB is not enabled, the kernel will never use binary
> GCD, as runtime logic will always fall back to the odd-even
> implementation.
>
> To avoid compiling unused code and reduce code size, select
> CONFIG_CPU_NO_EFFICIENT_FFS when CONFIG_RISCV_ISA_ZBB is not set.
>
> $ ./scripts/bloat-o-meter ./lib/math/gcd.o.old ./lib/math/gcd.o.new
> add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-274 (-274)
> Function                                     old     new   delta
> gcd                                          360      86    -274
> Total: Before=384, After=110, chg -71.35%
>
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index bbec87b79309..f085adc6f573 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -95,6 +95,7 @@ config RISCV
>   	select CLINT_TIMER if RISCV_M_MODE
>   	select CLONE_BACKWARDS
>   	select COMMON_CLK
> +	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
>   	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
>   	select EDAC_SUPPORT
>   	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)


In v2, Andrew asked if he could merge it, so:

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
