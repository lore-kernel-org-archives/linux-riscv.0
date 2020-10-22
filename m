Return-Path: <SRS0=FvZO=D5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35E3C388F2
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 05:39:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A92D223FB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 05:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BmpFji46";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="SltHHrVl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A92D223FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xDpbvMpy3FbameMD9bN0VHecojLwRYONHmiuHuVzVok=; b=BmpFji468czgzmlBSc8XvD/f1
	pHQ1fJTcUaTzbWr4XWINbJpNzZ14fV/EY32moq8FH2M8+Ul3LhBAuSYM6R/58CGMBgtJa+VsSt10p
	4Vs1my2xGUxcRwqnnfiOo1CBNCr1pYYE0LAvrCp2gHeER1tkK6lull50YDDG/fVoDtNPEc5lyRQZ6
	tKTs9GRE6WeD3wUzX6+dQwYV1efkRs4bU62THa3tLTzeFi3ffdNzffk5Qz2srWIpk5R6vIBfZY54k
	B6O8/exqsBBLkhYJSzYDuFUQ6beswTY5vkdnNYV5ScX4jLnasrL+1TDqH7TBfnSEEfr48J2b7OLE1
	7qzg0rmyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVTJQ-0003cM-2o; Thu, 22 Oct 2020 05:38:56 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVTJM-0003bO-Lx
 for linux-riscv@lists.infradead.org; Thu, 22 Oct 2020 05:38:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id c77so521920wmd.4
 for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2020 22:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=73Kve3eCD9lFW3ilOeR8Q08ZRzYRtk6HhqwKqUbeckQ=;
 b=SltHHrVlBKjJCfSt8WOzpbmWAyyApuzoEfOWBWk7w1rI4ddOMh3Jq3VYGO6SDozaCi
 qbhKgg+BGotFSLTM3VTwCagdIHZtGQZ0qJfb8YTKuuAMgpSQTOKj52jRrdmipBKo10IT
 7+IQukUEWnptNNCdytAifO1CErMOIHDbTXJXhjMOjlqbGSzttrbK689GXJYOm0n7wUPN
 7n6M2HFMlorVQqLiU+y1EPf5WjXsACSieJ6qr3wGLpT7RaSZwdP9ITxTxW9sN/3RQF5B
 9WwtjZBkREl4Z202ODJZ5nh5u9I1Vuq9TnHTOFjI2bl56AiCSh02aUn6m6OBM5pfFhVi
 C3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=73Kve3eCD9lFW3ilOeR8Q08ZRzYRtk6HhqwKqUbeckQ=;
 b=GTjEWp22G/xj6c0FLkSOtAxFCm5gciSY3qSh5hqbu8omnvCN3ZH8jBc5Q4QJ6MzWvJ
 zG0mvfBZ7tdgJeX+Fk0WYj1ro1ruzfEuUSJ6UEes2fT4nhUcxy373XGTooJwlRnb0F/y
 6S+VijdLtmTswUkH4ZcgemhKPKzVvfFLbX8zfKwg3Bb0ze4I3Qc3jwMz1u515o+rVZyp
 CEWtVdG2YaFJl0M8KXncWtDcjWXPXrqk5msgbKX6uO65sKvQdSHlA10BckecoERS88wK
 dt8I9Qp/ydy6pO3VEXOkKUnRLvzX1wJyLSsKjLGutLOzF3LUI60+bBBdv2qtyYyMCHge
 xcyg==
X-Gm-Message-State: AOAM532VSM4eXJpZbpgThh4yH/90c2y5TOiqk5vbl3mmx+Uo0iUtV98h
 24qdh0xwZxjVqonsxs4XWnHHxbi8r12acqv7Rk1kvA==
X-Google-Smtp-Source: ABdhPJz1BooD6m8TpdqoamMg/85PKq4UWpiLSY1nMNpSndxeEm8puevlbLhaB83QxyD64aWlreMZigK0s/qSSC/3jVo=
X-Received: by 2002:a7b:c92c:: with SMTP id h12mr834132wml.134.1603345131488; 
 Wed, 21 Oct 2020 22:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201006001752.248564-1-atish.patra@wdc.com>
 <20201006001752.248564-5-atish.patra@wdc.com>
In-Reply-To: <20201006001752.248564-5-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2020 11:08:39 +0530
Message-ID: <CAAhSdy162QfyxGTn=UnEDnZ3OgKh-GN=bwgQ3jpWrp1ZMWKw8g@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] riscv: Add support pte_protnone and pmd_protnone
 if CONFIG_NUMA_BALANCING
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_013852_723754_01D818CF 
X-CRM114-Status: GOOD (  19.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Jia He <justin.he@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 6, 2020 at 5:48 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> From: Greentime Hu <greentime.hu@sifive.com>
>
> These two functions are used to distinguish between PROT_NONENUMA
> protections and hinting fault protections.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 515b42f98d34..2751110675e6 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -183,6 +183,11 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>         return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
>  }
>
> +static inline pte_t pmd_pte(pmd_t pmd)
> +{
> +       return __pte(pmd_val(pmd));
> +}
> +
>  /* Yields the page frame number (PFN) of a page table entry */
>  static inline unsigned long pte_pfn(pte_t pte)
>  {
> @@ -286,6 +291,21 @@ static inline pte_t pte_mkhuge(pte_t pte)
>         return pte;
>  }
>
> +#ifdef CONFIG_NUMA_BALANCING
> +/*
> + * See the comment in include/asm-generic/pgtable.h
> + */
> +static inline int pte_protnone(pte_t pte)
> +{
> +       return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE)) == _PAGE_PROT_NONE;
> +}
> +
> +static inline int pmd_protnone(pmd_t pmd)
> +{
> +       return pte_protnone(pmd_pte(pmd));
> +}
> +#endif
> +
>  /* Modify page protection bits */
>  static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>  {
> --
> 2.25.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
