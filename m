Return-Path: <SRS0=cdG+=H2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C6FC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Feb 2021 12:35:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6F7F600CF
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Feb 2021 12:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6F7F600CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AcHBME/CFH+RAv/ADx1AmkqPYB1uyQAiUkxMfd5HWAo=; b=LWbazXec6kRPeSz4vDdZbCxvV
	E/r0RGZ46+o3fdSsqt+WarzofXk9ScAz/nr0BIiAa21bHEJ3btXMBAT8WWNf+CIs1mPe803knlcPT
	uP6HTgDorMNHZW8KzKcLOvKZnltUDoCRntQOAc0fTiMu27BcRvZGxvTxlCN10Ms7WeSp7r9x+6/uB
	TEstG58jpCcwIn8EEojrgI/Hz0KnMxB53VMyOl12WZF6tXOPi1sv/BQNXXADu7vTVicnDRrlME0CY
	tzinM7ve6+HLu5XmyN3FIeSZ62813pr6K3s19qL1MarrJvuONnskt+KkknvUPk5maCZY3DTn7ow5G
	EunnVjOuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEtNv-0000TY-NU; Wed, 24 Feb 2021 12:35:19 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEtNs-0000Sv-B1
 for linux-riscv@lists.infradead.org; Wed, 24 Feb 2021 12:35:17 +0000
X-Originating-IP: 81.185.165.217
Received: from [192.168.43.237] (217.165.185.81.rev.sfr.net [81.185.165.217])
 (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DFE59240005;
 Wed, 24 Feb 2021 12:34:56 +0000 (UTC)
Subject: Re: [PATCH] riscv: mm: Remove the copy operation of pmd
To: Chuanhua Han <hanchuanhua@fishsemi.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
References: <20200330115319.1507-1-hanchuanhua@fishsemi.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <d10ea4ba-0aa5-4c70-8c3a-4a970d61f4fb@ghiti.fr>
Date: Wed, 24 Feb 2021 07:34:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20200330115319.1507-1-hanchuanhua@fishsemi.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_073516_501826_06C20694 
X-CRM114-Status: GOOD (  17.05  )
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
Cc: sfr@canb.auug.org.au, schwab@suse.de, Anup.Patel@wdc.com,
 linux-kernel@vger.kernel.org, peterx@redhat.com, tglx@linutronix.de,
 ebiederm@xmission.com, linux-riscv@lists.infradead.org, shihpo.hung@sifive.com,
 akpm@linux-foundation.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 3/30/20 =E0 7:53 AM, Chuanhua Han a =E9crit=A0:
> Since all processes share the kernel address space,
> we only need to copy pgd in case of a vmalloc page
> fault exception, the other levels of page tables are
> shared, so the operation of copying pmd is unnecessary.
> =

> Signed-off-by: Chuanhua Han <hanchuanhua@fishsemi.com>
> ---
>   arch/riscv/mm/fault.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> =

> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index be84e32adc4c..24f4ebfd2df8 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -208,9 +208,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>   vmalloc_fault:
>   	{
>   		pgd_t *pgd, *pgd_k;
> -		pud_t *pud, *pud_k;
> -		p4d_t *p4d, *p4d_k;
> -		pmd_t *pmd, *pmd_k;
> +		pud_t *pud_k;
> +		p4d_t *p4d_k;
> +		pmd_t *pmd_k;
>   		pte_t *pte_k;
>   		int index;
>   =

> @@ -234,12 +234,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>   			goto no_context;
>   		set_pgd(pgd, *pgd_k);
>   =

> -		p4d =3D p4d_offset(pgd, addr);
>   		p4d_k =3D p4d_offset(pgd_k, addr);
>   		if (!p4d_present(*p4d_k))
>   			goto no_context;
>   =

> -		pud =3D pud_offset(p4d, addr);
>   		pud_k =3D pud_offset(p4d_k, addr);
>   		if (!pud_present(*pud_k))
>   			goto no_context;
> @@ -248,11 +246,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>   		 * Since the vmalloc area is global, it is unnecessary
>   		 * to copy individual PTEs
>   		 */
> -		pmd =3D pmd_offset(pud, addr);
>   		pmd_k =3D pmd_offset(pud_k, addr);
>   		if (!pmd_present(*pmd_k))
>   			goto no_context;
> -		set_pmd(pmd, *pmd_k);
>   =

>   		/*
>   		 * Make sure the actual PTE exists as well to
> =


Better late than never: I do agree with this patch, once the PGD is =

copied into the user page table, it "comes with all its mappings" so =

there is no need to copy PMD, the only thing left to do is to make sure =

the mapping does exists in the kernel page table.

So feel free to add:

Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
Tested-by: Alexandre Ghiti <alex@ghiti.fr>

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
