Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AB3D16263
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 13:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7bKTd4CzvOjC94WCKk30ZXSmmEEbvpsCM58A5h6RH8=; b=h0XTDQuLdUNSXzXz4HRaaqe5h1
	MC8q9iT4NRyTlp7rpoBrd3iBbXCexeEIsLZgZPSi1fNwPtaJHXe+K0iEEPeeIDXVusJRRcDFR4NHX
	guDnrbpTW36EuucisQe+jlv9HjGV6nOl8eLuwI5Rcs3l1+8gWd9Tjg4OFogxJN28Qjz7Tna9Ux1/r
	dxlEAPzqk5AvH+lJzvQTq3+PPRWo3GDjYyZVN9q65DAgawhAhW/mmpfiaTegNdaJnQ3Eua8JRKlb3
	BSpO0hWkRT/WLStXRSVrT6Scwlzq3plK4Ql2qEt7BGDt4pB7IKglQSbfLBCmPg3KuG76DecIMeJET
	s82Jz2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LDh-00000005JKV-05cA;
	Mon, 14 Oct 2024 13:34:45 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Jw6-000000052Xr-49FI
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 12:12:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF0F4E0007;
	Mon, 14 Oct 2024 12:12:25 +0000 (UTC)
Message-ID: <d39e4832-50f3-4fc8-ba95-a2d6eefa5abe@ghiti.fr>
Date: Mon, 14 Oct 2024 14:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: ACPI: fix early_ioremap to early_memremap
Content-Language: en-US
To: Yunhui Cui <cuiyunhui@bytedance.com>, punit.agrawal@bytedance.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 sunilvl@ventanamicro.com, ajones@ventanamicro.com, alexghiti@rivosinc.com,
 jeeheng.sia@starfivetech.com, haibo1.xu@intel.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241014094705.71775-1-cuiyunhui@bytedance.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241014094705.71775-1-cuiyunhui@bytedance.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_051231_249919_BF4775AA 
X-CRM114-Status: GOOD (  16.85  )
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

Hi Yunhui,

On 14/10/2024 11:47, Yunhui Cui wrote:
> When SVPBMT is enabled, __acpi_map_table() will directly access the
> data in DDR through the IO attribute, rather than through hardware
> cache consistency, resulting in incorrect data in the obtained ACPI
> table.
>
> The log: ACPI: [ACPI:0x18] Invalid zero length.
>
> We do not assume whether the bootloader flushes or not. We should
> access in a cacheable way instead of maintaining cache consistency
> by software.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>   arch/riscv/kernel/acpi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 6e0d333f57e5..3177c9af8764 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -210,7 +210,7 @@ void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
>   	if (!size)
>   		return NULL;
>   
> -	return early_ioremap(phys, size);
> +	return early_memremap(phys, size);
>   }
>   
>   void __init __acpi_unmap_table(void __iomem *map, unsigned long size)


It makes sense to me since with this, we don't have to care about how 
the firmware mapped the table. And it mimics all other architectures 
(arm64, loongarch and x86).

Here is the corresponding fixes tag:

Fixes: 3b426d4b5b14 ("RISC-V: ACPI : Fix for usage of pointers in 
different address space")

With the corresponding fix in __acpi_unmap_table() as pointed by Sunil, 
you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

And regarding the sparse error, I don't see any other architecture 
casting to __iomem, so maybe that's not necessary anymore?

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
