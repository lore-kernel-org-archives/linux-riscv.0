Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C39EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXE+hiuWSXbEPdpQvhOEI0OKyFuYH01QsGMslIAAtr8=; b=XfSCmJMDccdA+z
	oZSFRes7Xxl+ybRZmtgJjrXmDfsQtLqdIK0b/d1luQlnjYCK+PmWKBwPkpJzxNNBi/9zqf0ncduzD
	h+sAj6prhHUnbfWqGX4UA6Ef2440L60o+hmL89URzDkAh9lE5hZ+uEIus/e0VMFlD0XdXA0Jrj1fv
	R43WA/+e3GdyyqGyQqfbx779A+8XUwt/xZ4zSEx9Lh2BQ99aide2SI7VbklVJ4j7+wrvWJHU0h8sd
	XGcwIQBH52zAR97aptWWkYPAkZygxkGbIfhCBrFOCn5jpZ38KEqMHdFTvf6ttc1/VKmH1W3uI5Brm
	R/Fq7rVLc0P8IV1KaUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBK1-00EkCG-03;
	Tue, 11 Jul 2023 11:14:21 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBJy-00EkBb-26
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 11:14:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4EF6240005;
	Tue, 11 Jul 2023 11:14:10 +0000 (UTC)
Message-ID: <a7bb09c9-870a-d8f2-23c3-7f6fd2c68e2b@ghiti.fr>
Date: Tue, 11 Jul 2023 13:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] riscv: correct pt_level name via pgtable_l5/4_enabled
Content-Language: en-US
To: Song Shuai <suagrfillet@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 bjorn@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230711105202.842408-1-suagrfillet@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230711105202.842408-1-suagrfillet@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_041418_838680_2ECCE39D 
X-CRM114-Status: GOOD (  17.85  )
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

Hi Song,


On 11/07/2023 12:52, Song Shuai wrote:
> The pt_level uses CONFIG_PGTABLE_LEVELS to display page table names.
> But if downgrading page mode from kernel cmdline in 64BIT, it will
> give a wrong name.
>
> Like, using no4lvl for sv39, ptdump named the 1G-mapping as "PUD"
> that should be "PGD":
>
> 0xffffffd840000000-0xffffffd900000000    0x00000000c0000000         3G PUD     D A G . . W R V
>
> So select "P4D/PUD" or "PGD" via pgtable_l5/4_enabled to correct it.
>
> Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> ---
>   arch/riscv/mm/ptdump.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
> index 20a9f991a6d7..cfdd327981ee 100644
> --- a/arch/riscv/mm/ptdump.c
> +++ b/arch/riscv/mm/ptdump.c
> @@ -384,6 +384,11 @@ static int __init ptdump_init(void)
>   
>   	kernel_ptd_info.base_addr = KERN_VIRT_START;
>   
> +#ifdef CONFIG_64BIT
> +	pg_level[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
> +	pg_level[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
> +#endif


You don't need the #ifdef here as pgtable_lX_enabled are always declared.


> +
>   	for (i = 0; i < ARRAY_SIZE(pg_level); i++)
>   		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
>   			pg_level[i].mask |= pte_bits[j].mask;


The Fixes tag is wrong to me, if satp mode is restricted by the hardware 
itself (not from the command line), the same problem happens. Maybe that 
should be the sv48 introduction patch? Or the sv57? It will be more 
cumbersome to backport with the sv48 introduction though as this patch 
won't apply as-is.

Otherwise, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
