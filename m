Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2574CD4846
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 01:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02p3kkXcqCbTbX3bYF0JiSJHoBn/uHlfvi0SEqfUvn8=; b=P77JuNUPQucj+qOSxY++WHvmXn
	4/N2r6RadGzLVF+Yz59tYUeeP14PlyTbQKIW702ghtJ+v8CnOctLg9jSZLeNH3zICPoeWmKiRuW+z
	FxMTY4zdeIqHYGxSkj3t9R+npxakcQCWryV8j50TlEAj4rHPMFjAcxQlArKvfmTTRKFUbX36kSOvb
	+QeJjeJlRAR+IfVF2WWQmNReGN3txKF8M05EleYe6Q5IfmZ3U27+tFYit0L3oJY96aSQFkJkV8UbT
	RunMqRLpeMcN4V1V7A2s37kOfzmkOJDDMTd3RFlpGnHsgElUOPcM5t+e1208YPrXUBVTT1pFfRfd7
	GGqAnE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbjC-0000000F9jE-12gy;
	Tue, 12 May 2026 01:16:06 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbj8-0000000F9gu-3vPa
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 01:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778548555; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=SdIkXC2hhhsU6vb6OXp8W9bqyYpOKZS9DgZSp5+mh0E=;
	b=fINMJ5OPqliAxcbINLYhrgD4EN/oN3DsLEvtaRpUz1PpMlPSzd3gxIShTx40GKAMffLieZWr2RBlt5kiVl3uMQ0Kc4pYATaNEhMo8IFNS8RJGgXA1tm4hTPOIns/s4V27g6pfwD3C9CSYEw8NpxJwhIPRsjgTYxTBoZKNMYNDlk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R781e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0X2obJHU_1778548545;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X2obJHU_1778548545 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 May 2026 09:15:52 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: guoren@kernel.org
Cc: alex@ghiti.fr,
	alexghiti@rivosinc.com,
	bjorn@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: Re: [PATCH V2] riscv: mm: Fixup no5lvl failure when vaddr is invalid
Date: Tue, 12 May 2026 09:15:32 +0800
Message-ID: <20260512011542.2329-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260125055212.433163-1-guoren@kernel.org>
References: <20260125055212.433163-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_181603_846673_7C4384D6 
X-CRM114-Status: GOOD (  17.13  )
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
Content-Type: multipart/mixed; boundary="===============3703464962508584412=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3703464962508584412==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

On Sun, 25 Jan 2026 00:52:12 -0500, guoren@kernel.org wrote:

> Unlike no4lvl, no5lvl still continues detect satp, which
> requires va=pa mapping. When pa=0x800000000000, no5lvl
> would fail in Sv48 mode due to an illegal VA value of
> 0x800000000000.
> 
> So, prevent detecting the satp flow for no5lvl, when
> vaddr is invalid. Add the is_vaddr_valid() function for
> checking.
> 
> Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> Cc: Björn Töpel <bjorn@rivosinc.com>
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> ---
> Changelog:
> 
> v2:
>  - Use is_vaddr_valid() instead of simple return.
>  - Don't change the original no5lvl code logic.
> 
> v1:
> https://lore.kernel.org/linux-riscv/20260118145441.291302-1-guoren@kernel.org/
> ---
>  arch/riscv/mm/init.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index addb8a9305be..bfea9f73e703 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -852,6 +852,27 @@ static void __init set_mmap_rnd_bits_max(void)
>  	mmap_rnd_bits_max = MMAP_VA_BITS - PAGE_SHIFT - 3;
>  }
>  
> +static bool __init is_vaddr_valid(unsigned long va)
> +{
> +	unsigned long up = 0;
> +
> +	switch (satp_mode) {
> +	case SATP_MODE_39:
> +		up = 1UL << 38;
> +		break;
> +	case SATP_MODE_48:
> +		up = 1UL << 47;
> +		break;
> +	case SATP_MODE_57:
> +		up = 1UL << 56;
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	return (va < up) || (va >= (ULONG_MAX - up + 1));
> +}
> +
>  /*
>   * There is a simple way to determine if 4-level is supported by the
>   * underlying hardware: establish 1:1 mapping in 4-level page table mode
> @@ -893,6 +914,9 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
>  			   set_satp_mode_pmd + PMD_SIZE,
>  			   PMD_SIZE, PAGE_KERNEL_EXEC);
>  retry:
> +	if (!is_vaddr_valid(set_satp_mode_pmd))
> +		goto out;
> +
>  	create_pgd_mapping(early_pg_dir,
>  			   set_satp_mode_pmd,
>  			   pgtable_l5_enabled ?
> @@ -915,6 +939,7 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
>  		disable_pgtable_l4();
>  	}
>  
> +out:
>  	memset(early_pg_dir, 0, PAGE_SIZE);
>  	memset(early_p4d, 0, PAGE_SIZE);
>  	memset(early_pud, 0, PAGE_SIZE);

Tested-by: Chen Pei <cp0613@linux.alibaba.com>

Thanks,
Pei


--===============3703464962508584412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3703464962508584412==--
