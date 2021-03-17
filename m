Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA43C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:17:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 441FC64F96
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 04:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 441FC64F96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=c9qAvkJK/EKPxdedfRP+wuToB4PswtBVLCAtrPmxn9s=; b=UIv3Ly+xUOk5pIjFrPgJyU5oE
	DCQpEao5J3LypybavSShSaeUw8OUx3dJt4rDrK2ofBrrTSDhw1yaHCkFKyYSOLKuNCINF3rsyBPGO
	16lXwX902gZfQOI34T3sNPaGoNsx1OIrrzy+Gro8WXQoWsdyTgJOkOXsQGv8wLPVwgW2foofJghcw
	/JmqgqzMBYMFaUHLOyO2uia+ZAodsJLVtTl0UjjX1wp9//EBMzrSYlL1NgZdog300hIgQfGg2kt8V
	F8pPJP1NDVX329l4IhzdI/iGgcRx+fPiwvOnROxCclFMtqw1Rsn/dnrGhOx6QG3Cln8CMlwEkk0bh
	f40v4XXGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMNco-002RLA-DV; Wed, 17 Mar 2021 04:17:38 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMNcj-002RKa-EH
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 04:17:35 +0000
Received: by mail-pf1-x434.google.com with SMTP id h3so223314pfr.12
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 21:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mBi1vr1EBCIfBIYiqhthLzLXu/cz4f2HWo3O6rM8TpQ=;
 b=SQWeDYYWjxpwsPtJKs41W8Za5PxW8JF3E/k0FAMCUg/3DA8DX0UZgNz+4VLqQWUMGQ
 oUfBPe4w/yL4cVSrMM/rHqcGG+O4RhH40unsusPfVKN78N6B11yFuQ2J27sip22EAeFk
 w23ha8MsHDQt7XJsvrptipooOO+A2sHtbFZ0ieJ1buq9XF4ax5urr4EB4ylBGRp7OuYy
 QCq6uIQwokhAAutZWgNcDql6EUB6PTZ0n2TdTqaT3H2f6Mk4srNmkQLO1v/aIAG7B7AN
 J1eMqPXzcC1yYiUhIrBuLawdpHXfMIXisChOTnUxmMy7GZjqGijgGT7oWCQKZMf/qAUT
 obTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mBi1vr1EBCIfBIYiqhthLzLXu/cz4f2HWo3O6rM8TpQ=;
 b=GywoJbs0Nv6yA7LdDS+h/G1ZJz7h8LxljSQ73xyDQRiCmNXeozo2eRJaliuCWUADdk
 jVsNIDD4SW0viK81rGKa7gEZiWXKbD2+S3cZY7hA4wU196F4Ps00LZUSssTGJOMZgmHs
 R+r//b968I1r7K0I/GO5mSxvTGFOuPqPb6ZynD3LXilGrUYAgXnHMqztxa0VYaayKhKs
 nucdgM+VYwLnQQJXymYiK5mXhnkb1gXWrcgoj4fmtK1NS6MFpK02OUwSRkV5SGXEIg5M
 sUOV6luFnSnjKyyIV0+O4eFL01ktZYun9hMKwoV1A7G4ul2rd/bRz4bUm99Ahu3Nvft2
 nv/g==
X-Gm-Message-State: AOAM530Y2MzTcLtK8pGneVXWGRsqNKVPZodWEN3nGlht5QZvBh3SLzXo
 nL/n2uT4+aQ17D+KgzgLIbenTw==
X-Google-Smtp-Source: ABdhPJxj8obCDelxJOmnY4EgTEt6uvOFjBGq+dd/ysZB8WNS7PW+umevbjKLPNZ4YaUeVcZbw0Z+iQ==
X-Received: by 2002:a65:428b:: with SMTP id j11mr969021pgp.47.1615954649202;
 Tue, 16 Mar 2021 21:17:29 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a24sm18405944pff.18.2021.03.16.21.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 21:17:27 -0700 (PDT)
Date: Tue, 16 Mar 2021 21:17:27 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 21:17:23 PDT (-0700)
Subject: Re: [PATCH] Insert SFENCE.VMA in function set_pte_at for RISCV
In-Reply-To: <20210310062250.74583-1-liu@jiuyang.me>
CC: waterman@eecs.berkeley.edu, liu@jiuyang.me,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, 
 Anup Patel <Anup.Patel@wdc.com>, akpm@linux-foundation.org, rppt@kernel.org,
 wangkefeng.wang@huawei.com, 
 greentime.hu@sifive.com, zong.li@sifive.com, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: liu@jiuyang.me
Message-ID: <mhng-875f43ab-ca1e-4b18-a12d-1a0dc8519b53@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_041733_671598_8A1CBB12 
X-CRM114-Status: GOOD (  29.72  )
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

On Tue, 09 Mar 2021 22:22:46 PST (-0800), liu@jiuyang.me wrote:
> From: Jiuyang Liu <liu@jiuyang.me>
>
> This patch inserts SFENCE.VMA after modifying PTE based on RISC-V
> specification.
>
> arch/riscv/include/asm/pgtable.h:
> 1. implement pte_user, pte_global and pte_leaf to check correspond
> attribute of a pte_t.
>
> 2. insert SFENCE.VMA in set_pte_at based on RISC-V Volume 2, Privileged
> Spec v. 20190608 page 66 and 67:
> If software modifies a non-leaf PTE, it should execute SFENCE.VMA with
> rs1=x0. If any PTE along the traversal path had its G bit set, rs2 must
> be x0; otherwise, rs2 should be set to the ASID for which the
> translation is being modified.
> If software modifies a leaf PTE, it should execute SFENCE.VMA with rs1
> set to a virtual address within the page. If any PTE along the traversal
> path had its G bit set, rs2 must be x0; otherwise, rs2 should be set to
> the ASID for which the translation is being modified.
>
> arch/riscv/include/asm/tlbflush.h:
> 1. implement local_flush_tlb_asid to flush tlb with asid.
>
> Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
> ---
>  arch/riscv/include/asm/pgtable.h  | 28 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/tlbflush.h |  8 ++++++++
>  2 files changed, 36 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index ebf817c1bdf4..95f6546ddb5b 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -222,6 +222,16 @@ static inline int pte_write(pte_t pte)
>  	return pte_val(pte) & _PAGE_WRITE;
>  }
>
> +static inline int pte_user(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_USER;
> +}
> +
> +static inline int pte_global(pte_t pte)
> +{
> +	return pte_val(pte) & _PAGE_GLOBAL;
> +}
> +
>  static inline int pte_exec(pte_t pte)
>  {
>  	return pte_val(pte) & _PAGE_EXEC;
> @@ -248,6 +258,11 @@ static inline int pte_special(pte_t pte)
>  	return pte_val(pte) & _PAGE_SPECIAL;
>  }
>
> +static inline int pte_leaf(pte_t pte)
> +{
> +	return pte_val(pte) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC);
> +}
> +
>  /* static inline pte_t pte_rdprotect(pte_t pte) */
>
>  static inline pte_t pte_wrprotect(pte_t pte)
> @@ -358,6 +370,18 @@ static inline void set_pte_at(struct mm_struct *mm,
>  		flush_icache_pte(pteval);
>
>  	set_pte(ptep, pteval);
> +
> +	if (pte_present(pteval)) {
> +		if (pte_leaf(pteval)) {
> +			local_flush_tlb_page(addr);
> +		} else {
> +			if (pte_global(pteval))
> +				local_flush_tlb_all();
> +			else
> +				local_flush_tlb_asid();
> +
> +		}
> +	}
>  }
>
>  static inline void pte_clear(struct mm_struct *mm,
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 394cfbccdcd9..4b25f51f163d 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -21,6 +21,14 @@ static inline void local_flush_tlb_page(unsigned long addr)
>  {
>  	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
>  }
> +
> +static unsigned long asid;
> +static inline void local_flush_tlb_asid(void)
> +{
> +	asid = csr_read(CSR_SATP) | (SATP_ASID_MASK << SATP_ASID_SHIFT);
> +	__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
> +}
> +
>  #else /* CONFIG_MMU */
>  #define local_flush_tlb_all()			do { } while (0)
>  #define local_flush_tlb_page(addr)		do { } while (0)

We're trying to avoid this sort of thing, instead relying on the generic kernel
functionality to batch up page table modifications before we issue the fences.
If you're seeing some specific issue then I'd be happy to try and sort out a
fix for it, but this is a bit heavy-handed to use as anything but a last
resort.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
