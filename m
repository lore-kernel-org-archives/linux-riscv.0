Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78195C52D7C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 10:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mt6DhDsWTPcWmy84HJREL3bVq1vblTWK3h9Z4GF8byE=; b=qemy6Jc/3v2qOf
	q6LcOGqC17iuv3mpuKTyx/tecle4GM+t2s8lTtN4MA5NHsBPcYcDMezlReE9U5ljZda8IMRbyR9Yb
	mn4iPOHXQZCB5jDUyA+T3hPjjOOkqRW8lQL8zrjbnR3KA1haRM4yLDVjLYGpm+/cfta1l8e+Phv2V
	dQfKWTjkVd0HS5rGjpdu5rE3UWxfwad9vGRB7j13cNAhpFDCnEuajWqVmZdmWk/DnY1L1rwSaAagE
	QkXC1wHu2GX+JLN5OhWj4AzlBIkpKeG74F09m4VXzVtXAunb37BR/S75p8LUq6hsakrXZeUr+7F9x
	sTihF8RGiB8t4MKULLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdobD-00000003JLI-0O7e;
	Tue, 13 Aug 2024 10:17:55 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdoWi-00000003INN-0OHJ
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 10:13:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2980FF803;
	Tue, 13 Aug 2024 10:13:10 +0000 (UTC)
Message-ID: <4fe4a8a0-b5ac-4c52-ac9f-210c59a5d2f2@ghiti.fr>
Date: Tue, 13 Aug 2024 12:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] riscv: Add CSR definitions for pointer masking
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
 Atish Patra <atishp@atishpatra.org>, Evgenii Stepanov <eugenis@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
 <20240625210933.1620802-4-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240625210933.1620802-4-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_031316_522340_A768FC4A 
X-CRM114-Status: GOOD (  13.67  )
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


On 25/06/2024 23:09, Samuel Holland wrote:
> Pointer masking is controlled via a two-bit PMM field, which appears in
> various CSRs depending on which extensions are implemented. Smmpm adds
> the field to mseccfg; Smnpm adds the field to menvcfg; Ssnpm adds the
> field to senvcfg. If the H extension is implemented, Ssnpm also defines
> henvcfg.PMM and hstatus.HUPMM.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>   - Use the correct name for the hstatus.HUPMM field
>
>   arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 25966995da04..5c0c0d574f63 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -119,6 +119,10 @@
>   
>   /* HSTATUS flags */
>   #ifdef CONFIG_64BIT
> +#define HSTATUS_HUPMM		_AC(0x3000000000000, UL)
> +#define HSTATUS_HUPMM_PMLEN_0	_AC(0x0000000000000, UL)
> +#define HSTATUS_HUPMM_PMLEN_7	_AC(0x2000000000000, UL)
> +#define HSTATUS_HUPMM_PMLEN_16	_AC(0x3000000000000, UL)
>   #define HSTATUS_VSXL		_AC(0x300000000, UL)
>   #define HSTATUS_VSXL_SHIFT	32
>   #endif
> @@ -195,6 +199,10 @@
>   /* xENVCFG flags */
>   #define ENVCFG_STCE			(_AC(1, ULL) << 63)
>   #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> +#define ENVCFG_PMM			_AC(0x300000000, ULL)
> +#define ENVCFG_PMM_PMLEN_0		_AC(0x000000000, ULL)
> +#define ENVCFG_PMM_PMLEN_7		_AC(0x200000000, ULL)
> +#define ENVCFG_PMM_PMLEN_16		_AC(0x300000000, ULL)


Nit: the other ENVCFG_XX use (_AC(Y, ULL) << Z)


>   #define ENVCFG_CBZE			(_AC(1, UL) << 7)
>   #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
>   #define ENVCFG_CBIE_SHIFT		4
> @@ -216,6 +224,12 @@
>   #define SMSTATEEN0_SSTATEEN0_SHIFT	63
>   #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
>   
> +/* mseccfg bits */
> +#define MSECCFG_PMM			ENVCFG_PMM
> +#define MSECCFG_PMM_PMLEN_0		ENVCFG_PMM_PMLEN_0
> +#define MSECCFG_PMM_PMLEN_7		ENVCFG_PMM_PMLEN_7
> +#define MSECCFG_PMM_PMLEN_16		ENVCFG_PMM_PMLEN_16
> +
>   /* symbolic CSR names: */
>   #define CSR_CYCLE		0xc00
>   #define CSR_TIME		0xc01
> @@ -382,6 +396,8 @@
>   #define CSR_MIP			0x344
>   #define CSR_PMPCFG0		0x3a0
>   #define CSR_PMPADDR0		0x3b0
> +#define CSR_MSECCFG		0x747
> +#define CSR_MSECCFGH		0x757
>   #define CSR_MVENDORID		0xf11
>   #define CSR_MARCHID		0xf12
>   #define CSR_MIMPID		0xf13

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
