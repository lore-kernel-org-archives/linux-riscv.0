Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE99C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 04:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:To:References:From
	:Message-Id:Date:In-Reply-To:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PARA8RSKw0zbhNDgGJuv8mc/uTK7UDHO8+yfac9Pm5I=; b=zVPEiGcBlB5463
	n5flAQjIMz1YxV4+QDfoITNL7slc5dqn3ascH6gCi4RjGh0OUBQuEpf2WM2afx4MfWJ2RM4Rt0N3+
	2upRk6l/P7wwahv7hLwy0MUksJJXiRQMjcFDTx6OEnRt0GnpOtVaRq6KsJZFux3TmEX7bk1i7ovYw
	RfAmUu46i1oTMus/ENmqHZwZziUzlXGseiedcg+uJaDtNO60LVYRFn7Xt7B6uZqHA9Fekg95Sl9yp
	dNvMf2Grkn5SoZ2Y+3sRcSpgG9mrP/fvw4AV1I/vgyAh16RKs58PPRR02Gq+XHckyVzZyvxz/F69v
	j0i98EAugmNFY7vxWdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4gr-00000001Fwm-1LPk;
	Tue, 22 Jul 2025 04:33:21 +0000
Received: from sg-1-22.ptr.blmpb.com ([118.26.132.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue4gm-00000001FwL-2Kpf
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 04:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1753158788;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Hzmpv4N547W+vBo+aJGwLDOqtL6G3pdPOh8VAcFg3f0=;
 b=FMWVlV2NyE7xWZUc8CjC12utDtxMol9z6LaGOHNWrDbtQe1YTcYVHyrONrj04w49lshIrV
 M1v8CRdWCbctUPTF9PTiLIjaP/v5EUD+drxo2cv5ZZtquo7V9kMwV/Iwbcb2nclELgIZdr
 p1vVq3pyXTEmKPcqMnXadLK251HrM07cb2nUlWqa4hPmaZ+xP5wjMzwXf3CC8qxiQICpLy
 eiuCjIzSu8yAR2x5DTL6r8R79A2l6BxyRGwB7bJXdczEiK+jZEZofH3UIjttm1ndtv4D9f
 rD9sswza6mG/WUm9nHoO78LdNANufl56EHN4ubYZnVty4AzEODy42VfuTwKD9Q==
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250722-satp-from-fdt-v1-1-5ba22218fa5f@pigmoral.tech>
Date: Tue, 22 Jul 2025 12:33:03 +0800
Message-Id: <b7dd1004-4bfd-43c7-aba7-823c0290b5d3@lanxincomputing.com>
Content-Language: en-US
X-Lms-Return-Path: <lba+2687f1482+3e8df7+lists.infradead.org+liujingqi@lanxincomputing.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
User-Agent: Mozilla Thunderbird
References: <20250722-satp-from-fdt-v1-0-5ba22218fa5f@pigmoral.tech> <20250722-satp-from-fdt-v1-1-5ba22218fa5f@pigmoral.tech>
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Tue, 22 Jul 2025 12:33:05 +0800
To: "Junhui Liu" <junhui.liu@pigmoral.tech>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
Subject: Re: [PATCH 1/2] riscv: mm: Return intended SATP mode for noXlvl options
Mime-Version: 1.0
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_213317_623866_449E724F 
X-CRM114-Status: GOOD (  14.14  )
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

On 7/22/2025 12:53 AM, Junhui Liu wrote:
> Change the return value of match_noXlvl() to return the SATP mode that
> will be used, rather than the mode being disabled. This enables unified
> logic for return value judgement with the function that obtains mmu-type
> from the fdt, avoiding extra conversion. This only changes the naming,
> with no functional impact.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>   arch/riscv/kernel/pi/cmdline_early.c | 4 ++--
>   arch/riscv/mm/init.c                 | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/cmdline_early.c
> index fbcdc9e4e14322af0cedd31343aeb9403ba2dd14..389d086a071876dde2fd57ee6f6661e65c38b7c4 100644
> --- a/arch/riscv/kernel/pi/cmdline_early.c
> +++ b/arch/riscv/kernel/pi/cmdline_early.c
> @@ -41,9 +41,9 @@ static char *get_early_cmdline(uintptr_t dtb_pa)
>   static u64 match_noXlvl(char *cmdline)
>   {
>   	if (strstr(cmdline, "no4lvl"))
> -		return SATP_MODE_48;
> +		return SATP_MODE_39;
>   	else if (strstr(cmdline, "no5lvl"))
> -		return SATP_MODE_57;
> +		return SATP_MODE_48;
>   
>   	return 0;
>   }
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 8d0374d7ce8ed72320f58e4cea212d0e2bce8fd4..d03e02a92379f2338a4f4df0ab797a7859b83dfc 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -864,9 +864,9 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
>   
>   	kernel_map.page_offset = PAGE_OFFSET_L5;
>   
> -	if (satp_mode_cmdline == SATP_MODE_57) {
> +	if (satp_mode_cmdline == SATP_MODE_48) {
>   		disable_pgtable_l5();
> -	} else if (satp_mode_cmdline == SATP_MODE_48) {
> +	} else if (satp_mode_cmdline == SATP_MODE_39) {
>   		disable_pgtable_l5();
>   		disable_pgtable_l4();
>   		return;

Nice, this change is a good idea. It's more readable.

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
