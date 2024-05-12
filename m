Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1EAC25B4F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 May 2024 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbKY9yQFDv0DguO5sylp8Pi8Z59UExR97mVTo4CBU28=; b=N4jEYgV5pdafJP
	CaFMlMzDV6uGv3a11fAl7y59Kz6o6ViqWyuRrItDv5e2i9HMOL01ROUFG0VWr0VFschQyUSzPB3Se
	Ky55JAErjBYj4B8bVbsqa7iNwn3l9oTdkvrBtwS1+TeEZHS5uaZWglAnHUJIiS8HcHUnHbjCwEnj0
	HBhlkSIj5WLejDrLNPnfNCCFt3O+GGFF8w0f4Q/OF+2cF3cG18DiCvb4gmIubUL3vvXWbGR7J18im
	bETE/2ZpJ/ddfNvRvMxP2EXRe6Nt0LJmI1/AaGM+7+gTb5lcHUU9YGstjcidsfOOhw354ZBAgQPc0
	MwEecWYDyGdbELBJOJfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6C3S-0000000AJac-3jRC;
	Sun, 12 May 2024 16:28:06 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6C3P-0000000AJZJ-1M0h
	for linux-riscv@lists.infradead.org;
	Sun, 12 May 2024 16:28:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B45E60004;
	Sun, 12 May 2024 16:26:52 +0000 (UTC)
Message-ID: <0ea4aff6-980f-4fc6-9ab7-9ca4c9d15d1e@ghiti.fr>
Date: Sun, 12 May 2024 18:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/29] riscv mm: manufacture shadow stack pte
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, paul.walmsley@sifive.com,
 rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
 kito.cheng@sifive.com, keescook@chromium.org, ajones@ventanamicro.com,
 conor.dooley@microchip.com, cleger@rivosinc.com, atishp@atishpatra.org,
 bjorn@rivosinc.com, alexghiti@rivosinc.com, samuel.holland@sifive.com,
 conor@kernel.org
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
 akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
 shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
 jerry.shih@sifive.com, hankuan.chen@sifive.com, greentime.hu@sifive.com,
 evan@rivosinc.com, xiao.w.wang@intel.com, charlie@rivosinc.com,
 apatel@ventanamicro.com, mchitale@ventanamicro.com,
 dbarboza@ventanamicro.com, sameo@rivosinc.com, shikemeng@huaweicloud.com,
 willy@infradead.org, vincent.chen@sifive.com, guoren@kernel.org,
 samitolvanen@google.com, songshuaishuai@tinylab.org, gerg@kernel.org,
 heiko@sntech.de, bhe@redhat.com, jeeheng.sia@starfivetech.com,
 cyy@cyyself.name, maskray@google.com, ancientmodern4@gmail.com,
 mathis.salmen@matsal.de, cuiyunhui@bytedance.com, bgray@linux.ibm.com,
 mpe@ellerman.id.au, baruch@tkos.co.il, alx@kernel.org, david@redhat.com,
 catalin.marinas@arm.com, revest@chromium.org, josh@joshtriplett.org,
 shr@devkernel.io, deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
 jhubbard@nvidia.com
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-12-debug@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240403234054.2020347-12-debug@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_092803_587321_639AB355 
X-CRM114-Status: GOOD (  11.72  )
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

On 04/04/2024 01:34, Deepak Gupta wrote:
> This patch implements creating shadow stack pte (on riscv). Creating
> shadow stack PTE on riscv means that clearing RWX and then setting W=1.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/include/asm/pgtable.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 4d5983bc6766..6362407f1e83 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -408,6 +408,12 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
>   	return __pte(pte_val(pte) | _PAGE_WRITE);
>   }
>   
> +static inline pte_t pte_mkwrite_shstk(pte_t pte)
> +{
> +	/* shadow stack on risc-v is XWR = 010. Clear everything and only set _PAGE_WRITE */


Nit: Not sure the comment is necessary


> +	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
> +}
> +
>   /* static inline pte_t pte_mkexec(pte_t pte) */
>   
>   static inline pte_t pte_mkdirty(pte_t pte)
> @@ -693,6 +699,12 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
>   	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
>   }
>   
> +static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
> +{
> +	/* shadow stack on risc-v is XWR = 010. Clear everything and only set _PAGE_WRITE */
> +	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
> +}
> +
>   static inline pmd_t pmd_wrprotect(pmd_t pmd)
>   {
>   	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

Otherwise:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
