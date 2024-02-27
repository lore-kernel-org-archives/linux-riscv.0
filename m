Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DE8C54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 12:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9O+dPM2DCY4kzwNIX+msvyILxbOlcaRluFjs8mRC/Qg=; b=uvEjNSuYEG4VcO8ezuxZJlR0S4
	zAXOE4u333v8AwQcOhTnU72IHn/mk5Jmln//ZYcdJ18El6TUfshKT8OHkgMtDRRsVABualXJRjLj7
	N5e++c7A4HFnmwTyX+O6V+rrMzXDm6R43Y5WXz2icrRDYhBdXJWRFMIiyk2KEyG+Lw0CRaOm9ImLj
	QhPbJJdqLbMthyhIlTxlk2rqDkw2KneCo7bB1eqNKul3Ew2q4I8IrZqeTbGlG2I3UoVxQFaIiDftM
	Wa6TF6bXC/HjsUiOODnrScxZZjO/Y3ld+5k15GKiJRrQLS8pz1hguwETd75FPoG62jWDAO4WD9tBh
	dhgSQNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewpR-00000005F5M-02oN;
	Tue, 27 Feb 2024 12:45:01 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewpO-00000005F4j-1jNI
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 12:45:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3490240007;
	Tue, 27 Feb 2024 12:44:50 +0000 (UTC)
Message-ID: <20db97b7-6225-42a4-9f2a-b926aa26b7aa@ghiti.fr>
Date: Tue, 27 Feb 2024 13:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix definition of _PAGE_NOCACHE_THEAD
Content-Language: en-US
To: Fei Wu <fei2.wu@intel.com>, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, guoren@kernel.org, jszhang@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240227124412.2565716-1-fei2.wu@intel.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240227124412.2565716-1-fei2.wu@intel.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_044458_625798_9FE034AA 
X-CRM114-Status: GOOD (  12.68  )
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

Hi Fei,

On 27/02/2024 13:44, Fei Wu wrote:
> _PAGE_NOCACHE_THEAD is not used but the definition is wrong.
>
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> ---
>   arch/riscv/include/asm/pgtable-64.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index b42017d76924..b99bd66107a6 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -136,7 +136,7 @@ enum napot_cont_order {
>    * 10010 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Shareable, Non-trustable
>    */
>   #define _PAGE_PMA_THEAD		((1UL << 62) | (1UL << 61) | (1UL << 60))
> -#define _PAGE_NOCACHE_THEAD	((1UL < 61) | (1UL << 60))
> +#define _PAGE_NOCACHE_THEAD	((1UL << 61) | (1UL << 60))
>   #define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
>   #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
>   


This fix is already in -fixes: 
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?id=c21f014818600ae017f97ee087e7c136b1916aa7

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
