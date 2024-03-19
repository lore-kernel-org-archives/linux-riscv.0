Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01470C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 12:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VN/Qc5zrdzKP76Et2geuVx/6BM1bFMfyOhjZd3xoEF4=; b=kuJz4jNPUtX8Dw
	AnzFC6lU3U39PgRWmdNyu5JQuvv7y9ut5soONK+KWUbMy5pj3HmJ1St4M1QvGAprDAOqS9kMvdt+Z
	bOj5i00E65p3gV+1PR28DnQepi+RhOXknUgdsvyTIROEBcpOonijH1Cl1QSY6At0wOxEuxB3AHxy/
	+DgQjqHM1rIGhrUVsLspq889TNy8DRGG/wYBL4b+kr2IaJxyxJDF8RDc6JNHsf+VibUp5nTW//0eZ
	37fPrUW4O5f7Nhcg2f0Y9xG/5YiKs5oyz+3orRB6KuHe2TZyj4UgKoogEXaYt8YH9OFPvB9f3oqRh
	KSeevAQ2mTCnpKhxlyPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmYhc-0000000CdmQ-3o9i;
	Tue, 19 Mar 2024 12:36:24 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmYha-0000000CdkT-2XsR
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 12:36:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4743CC0006;
	Tue, 19 Mar 2024 12:36:16 +0000 (UTC)
Message-ID: <112ac071-71cc-466e-ab13-f624edb77bb9@ghiti.fr>
Date: Tue, 19 Mar 2024 13:36:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Remove redundant CONFIG_64BIT from
 pgtable_l{4,5}_enabled
Content-Language: en-US
To: Dawei Li <dawei.li@shingroup.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 set_pte_at@outlook.com
References: <20240312085005.298657-1-dawei.li@shingroup.cn>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240312085005.298657-1-dawei.li@shingroup.cn>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_053622_809975_AD6198AC 
X-CRM114-Status: GOOD (  11.58  )
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

Hi Dawei,

On 12/03/2024 09:50, Dawei Li wrote:
> IS_ENABLED(CONFIG_64BIT) in assignment of pgtable_l{4,5}_enabled is
> redundant, remove it.
>
> While at it, annotate pgtable_l{4,5}_enabled with __ro_after_init.


I guess this comment ^ implies that you need to split this patch into 2 :)

Feel free to add on both:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


>
> Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
> ---
>   arch/riscv/mm/init.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index fa34cf55037b..204cdf5b829d 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -50,8 +50,8 @@ u64 satp_mode __ro_after_init = SATP_MODE_32;
>   EXPORT_SYMBOL(satp_mode);
>   
>   #ifdef CONFIG_64BIT
> -bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
> -bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
> +bool pgtable_l4_enabled __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL);
> +bool pgtable_l5_enabled __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL);
>   EXPORT_SYMBOL(pgtable_l4_enabled);
>   EXPORT_SYMBOL(pgtable_l5_enabled);
>   #endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
