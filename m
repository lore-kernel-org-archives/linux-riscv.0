Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784CBC5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 12:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywnzjcvoCePCNmRg90CjNZQ/dQLoS7Zj1MKXN/LU4Yo=; b=MohKTmfDtFY5vy
	T9Un3A5F7RT53cR8ScO7hN52EkaoPcMb1psGej3fsOi0/z6hSsK5dFWGwwMHd2d773OhCIYYuObbs
	/SxEi5+w1P2m6jVqZzHu5dXPkX80hhy6SkNlMGLQ2vRExUfnFk7N1k/2R5YsUirTtp3qbwl2eLXZv
	qlIEm7Ob67isDf0+dSNIzCaARq3WXhXZpPvshy/H5QTti8SsX3pFyOxtymU+nEpBFIXPB4J/gLkkp
	muTxdIL4OxKLCJ/41Vd234ioNdPRimqWPZ/wRYvDsxkTjmjOfblN8dHt+mH+uxzCLWoi/WPhi6oJN
	9p+S9WUMnch2KrWuD2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1mF-0000000BWIX-2TmH;
	Thu, 20 Aug 2026 12:21:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1mD-0000000BWHP-03PN
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 12:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787228504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNk7Cd7avSLwD5U7YbcUtZCLln2gfmogkmv7E85mGj8=;
	b=VIWlyvapupDFOljBdTk5HecbcN8eEojZj5SbAv4qgCl8KTBng2M0mnMFIhQ9CKUa/mCJTd
	ZqgQF96pL2J7aNrz9JLRtERJAJAA4iu0xE96Z4jYyqBl6InB3eL4cWzDqAY9v/uVQkgyz9
	nGNTEmXgAcxSohrgl/Pw4ujgADUMXG0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-35-1NbTOSR6MKevFigPeVGjpQ-1; Thu,
 20 Aug 2026 08:21:32 -0400
X-MC-Unique: 1NbTOSR6MKevFigPeVGjpQ-1
X-Mimecast-MFC-AGG-ID: 1NbTOSR6MKevFigPeVGjpQ_1787228489
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C39D1800471;
	Thu, 20 Aug 2026 12:21:27 +0000 (UTC)
Received: from rotkaeppchen (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 185991955F03;
	Thu, 20 Aug 2026 12:21:19 +0000 (UTC)
Date: Thu, 20 Aug 2026 14:21:14 +0200
From: Philipp Rudo <prudo@redhat.com>
To: Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton
 <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, Mike
 Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
Message-ID: <20260820142114.0a36ac78@rotkaeppchen>
In-Reply-To: <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
	<20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
Organization: Red Hat inc.
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: gcX04UtjqWIvf5YchASWQk1gcMFmu_Gtwot_qhWq540_1787228489
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052145_121526_A1BC4CCB 
X-CRM114-Status: GOOD (  23.34  )
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

Hi Mukesh,
Hi Pratyush,

having this patch makes sense. Personally I'd go with having a
switch-case rather than individual if-blocks. E.g.

	switch (ret) {
		case 0:
			image->fops = *fops;
			return 0;
		case -ENOEXEC:
			continue;
		default:
			return ret;
	}

IMHO that is better readable and easier to extend in case other error
codes need special handling as well. But that is only my personal
opinion.

Independent on which implementation you use.

Reviewed-by: Philipp Rudo <prudo@redhat.com>


On Wed, 19 Aug 2026 23:17:23 +0530
Mukesh Pilaniya <mpilaniy@redhat.com> wrote:

> kexec_image_probe_default() overwrites ret with each loader's probe
> return value and returns whatever the last loader returned when no
> probe matches.  The error code reaching userspace depends on whichever
> loader happens to be last in kexec_file_loaders[].
> 
> Only continue to the next loader when a probe returns -ENOEXEC.
> Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
> only when all loaders have been tried and none matched.
> 
> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
> ---
>  kernel/kexec_file.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 59fb9d71e9d8..b3060e984ef3 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
>  			      unsigned long buf_len)
>  {
>  	const struct kexec_file_ops * const *fops;
> -	int ret = -ENOEXEC;
>  
>  	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
> -		ret = (*fops)->probe(buf, buf_len);
> -		if (!ret) {
> +		int ret = (*fops)->probe(buf, buf_len);
> +
> +		if (ret == 0) {
>  			image->fops = *fops;
> -			return ret;
> +			return 0;
>  		}
> +		if (ret != -ENOEXEC)
> +			return ret;
>  	}
>  
> -	return ret;
> +	return -ENOEXEC;
>  }
>  
>  static void *kexec_image_load_default(struct kimage *image)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
