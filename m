Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18E5C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OogQE63IGUlAaS81NbakMqHMfL4o8NTJX4haJaiQRgs=; b=dbrSo6qac9N/JT
	a524laOFn3d7xgVio45DLB5qr90YO5Ji2SvirjkBNNiJIQCLhZjZrxAnUTuOc4cTh9o9q8UJtqG73
	HqGKtebMAlXsSe65YRgo4NB2Yq3rqXAjbQC+fE87xV2lHW9GizjspKnJxe06Jm1Z9c1+r67nnNu8n
	TNnIKmisErx50lY9OYpB9D49KmnO0klxQ4W68b3vhOf6Ftqfe2xM/a4c9yuUnW9SN0+aNqbJ694+Q
	xZ/71pHbzN+rwsH9FpaAABWmOdsgVwFtmZNOqHtM4z/kt543uO+nLAd5TZ/6ZKMnXzGh2D18gWZXX
	okq0n3PC6G3ODgrm1WRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welxl-00000000bCl-3uoq;
	Wed, 01 Jul 2026 03:50:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welxj-00000000bCL-1mMk;
	Wed, 01 Jul 2026 03:50:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id D44E941930;
	Wed,  1 Jul 2026 03:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 34D621F000E9;
	Wed,  1 Jul 2026 03:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782877810;
	bh=T2hTvlYeEHmVWblghsmcULzurIVmIm0KteC2foXWL4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=asBx/pvWNrFnZYBspRkbA/I6pxY5wRW0Lvrd7tA0d6v7MXkJDjynYVi+iPqtGDH2H
	 omMweFN3sHn5Uzygl0ckOSfEENZ1y4tk+wuno/wawIL/eMUwv8EHKjc0iXqjU/+Sfn
	 7bUt5qrgAlQMDKusfJ+TQUegRmfcz7CutCLGc2mbud98u5klDsr+hjS+PGWnYVGn4y
	 JS+rXzClMk0a1KlwkP3DUUgIQ8wwKrSmJ0P7G96OOwsMn8iZ9SOTnY7JWVcMPVMdwj
	 JStvyC80x133tJVhaYjzdJn9o2RqtVa22FiYcCRd1S33nvLklNjxWez82dvJ586v9r
	 CH9YzC9mNmEEQ==
Date: Wed, 1 Jul 2026 06:50:07 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Tao Liu <ltao@redhat.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
	bhe@redhat.com, zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	linux-integrity@vger.kernel.org, pratyush@kernel.org,
	Markus.Elfring@web.de, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] riscv: Fix a NULL pointer dereference in
 machine_kexec_prepare
Message-ID: <akSOb1_1tcJvFyda@kernel.org>
References: <20260701025732.66330-2-ltao@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701025732.66330-2-ltao@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 01, 2026 at 02:57:33PM +1200, Tao Liu wrote:
> A NULL pointer dereference issue is noticed in riscv's machine_kexec_prepare,
> where image->segment[i].buf might be NULL and copied unchecked.
> 
> The NULL buf comes from security/integrity/ima/ima_kexec.c:
> ima_add_kexec_buffer(), where kbuf is added by kexec_add_buffer(),
> but kbuf.buffer is NULL

This should have a proper call sequence. Now the root cause is
obfuscated.

> 
> Fix this by simply adding a check before copy.
> 
> Fixes: b7fb4d78a6ad ("RISC-V: use memcpy for kexec_file mode")
> Acked-by: Baoquan He <bhe@redhat.com>
> Acked-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Tao Liu <ltao@redhat.com>
> ---
> 
> v3 -> v2: Add fixes tag; Replace "reference" to "dereference".
> link to v2: https://lore.kernel.org/linux-riscv/20260627222602.23594-2-ltao@redhat.com/
> link to v1: https://lore.kernel.org/linux-riscv/20260529032739.13264-2-ltao@redhat.com/
> 
> ---
>  arch/riscv/kernel/machine_kexec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index 2306ce3e5f22..afc68f6a4aa1 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -41,6 +41,13 @@ machine_kexec_prepare(struct kimage *image)
>  		if (image->segment[i].memsz <= sizeof(fdt))
>  			continue;
>  
> +		/*
> +		 * Some segments (e.g. IMA) reserve space but have no buffer
> +		 * loaded yet. Skip them as they cannot contain an FDT.
> +		 */

This is destined to rot over time. It also adds up also potentially to
the backporting effort while backporting to stable kernes. And most
importantly. Please, don't document every other null check.

> +		if (image->segment[i].buf == NULL)

if (!image->segments[i].buf)

> +			continue;
> +
>  		if (image->file_mode)
>  			memcpy(&fdt, image->segment[i].buf, sizeof(fdt));
>  		else if (copy_from_user(&fdt, image->segment[i].buf, sizeof(fdt)))
> -- 
> 2.54.0
> 
> 

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
