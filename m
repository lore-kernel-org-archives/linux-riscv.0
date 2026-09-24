Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B65C9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 18:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Mftev0nyaYYBRpVHQ8iuUaXZt4hTFwf02Z6IlSo4o0=; b=mxRVFWHErJL9V8
	KxbAtCJzvxuHPZHcH95vive/5sfcntwpwLhLoq0pYtN7uRFQHXK4N1z1leJzKuNSdv8cjC+pPdVvl
	YNoUpIlccCpKjTdzqepUcE5dL2QId/55vs4UueYYJ+dOZKqLT1cFxZmRONz+OuvycaYFicjSFnjll
	nrCq5Mc3ZwdVAyUyLeEiO7TgYMav/0KkNoNhZFCeqPIrYPI3rFDo2/CMrKU0UAW/wz8RpIim1dEAw
	xkKnFr+z4lLVQJWrb47Ec3lV8AXGFNibnbkArR/di6wBL43ijLKHoc69GpLsPbtHEiuGSvHpi10hD
	HtJMPpVGNtqXXlT9YCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nk9-0000000BqyI-2MNL;
	Thu, 24 Sep 2026 18:00:25 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nk7-0000000BqxH-1N0r
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 18:00:24 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-52fa9c055b5so11364511cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 11:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790272822; x=1790877622; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yIrEACM/1hk8RvSSdnwytl7iIy1+VcppA4PP9Tt2BDk=;
        b=EcdN7Q3rP776qc8wZL2iTjjhL/qGk5NmmrMk87vwYPWp9hV0fqAmtAtWeTgTlln7wP
         EDp+TnSLgrKe1WGphYhPrl8Ak3VLf7nMpVYutpgDAjGKXB0S3Suho9UmkOT9URJv2m8D
         mI8U+awCZqV4q9n1zGUxP4/q7mCVbnBvKJYjYWSWT7Q4+Rw9yS/p5hYYPvhaJLU0SCz4
         m4YaZdVoyc2iV7S+ekT6dcpjBydEhS7bRsvw4QaNwJEb62ZDTXpzHnbX7jovxn4ekykq
         aFdhuRsGj3GqVlY37/ID5IE7etNUCNR2VlmMwoR7AVWoFv0zAxCdCzpBMQwXlm3R/qpW
         y+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790272822; x=1790877622;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIrEACM/1hk8RvSSdnwytl7iIy1+VcppA4PP9Tt2BDk=;
        b=k4EhRW2PbS3ehp1aNdLp6xts7e7HtAPmnvE/Kw3CFbzO+WwIqos44GIaOTetJswzYS
         YUgVhh10jtIMskDa/EDE1jgHEOgVh8kLmSbC9Sq4oZpLUOiSU5xXW6hAJd0mfWm52UIb
         9gKF2IuaYnrLrZTKJ5ICOePp/Mf0UgG3laYirex6RmuB1FXgtfR+7wJ4nPaoBy67bCTl
         6UrOhQYdXjH4qaOgihJfYcbs1YwUaH35xR5F0T3CKwGiAg58hIt2u/JsuW/T0X6pSp+h
         iHMBlHXOin7bv+kwZEScq9AHiGh9D3FxhGRpyFsIuaic3L/0zXu3Iuuor/GwNe8p1Yom
         ldSA==
X-Forwarded-Encrypted: i=1; AKwUvByHUhzHVHnFoKK8Uc03aJuzLSbVGmSkMcfEVw8ycGd9ECMFuil33OHi6ZTUbzVnAcTNHEsZzOGZwwqoPg==@lists.infradead.org
X-Gm-Message-State: AFuF++kHxfqliRiujQUwE7YeCb++EM5iFd7AuUWD+5dimCGkLa6H/ITB
	IMVpcczwBk9A5uH9TQwvYTMluziNy3MNbvU8g+fl1lgGdNyWV13leI70LErevwclA90=
X-Gm-Gg: AYBFou2/kk0/vc27WcJtcfTEKgfmoaNrdGN8Juq6ImR+JtkTdx6IkvGUBkRQCLyuit/
	ZhDLc7dZXVV4WSOWSZMa3w9P33VrGKj6iXTatREga6vJW1yu7UDrZHqqQ8WwXtRpmy0pGQnCea2
	L02EP4qAI9EznbfBFiLAaPE47jGxTaniFOOox0qMTsQekyNTxpcxrr/v5JwPDnWBwrigUD6Ecwb
	xTMgIUUywEADjxMZdei6Nw/aJImUflQNKRmeB0e3nQxSsu7vwotINsigiYq8Qa0eifhFgWw+lOT
	hTMMr9FjclUmWaFvv/L1NzYgPRu+mbeunysnIah3ICLUTtHfQWm0mEd5akXRjaHLXnAuGCS+bM5
	evbRCPR3JbDIL/ZHuzwduZyesxbRgjvwIW46+2EiYAW62ra4vXuRIPXt8S3S2s23jeeWTnetXXu
	Sw9QVuDnNrPjBE2fYhygqrGeh1Cfbh9NzMI2gPix+7X6VSyCF6o86+Ez8P2vOOo1LyX40EU4JdF
	lOovHcThgfEnuTz/lf+7qCG78KH69Qgg7eYzdNev7ABpSxcd1mTAUY=
X-Received: by 2002:ac8:5a46:0:b0:530:e682:87c with SMTP id d75a77b69052e-5330b6df434mr78501cf.33.1790272821894;
        Thu, 24 Sep 2026 11:00:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb38d347sm47450101cf.25.2026.09.24.11.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:00:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:00:18 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 05/40] mm/vma: ensure mmap_prepare doesn't set actions
 on a mergeable vma
Message-ID: <arVkwC_wNoTLjRYf@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_110023_374960_DD994E62 
X-CRM114-Status: GOOD (  20.43  )
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

On Thu, Sep 17, 2026 at 05:22:14PM +0100, Lorenzo Stoakes (ARM) wrote:
> When a user requests an mmap_action be performed in mmap_prepare, this
> involves populating the VMA range with data.
> 
> However, if the VMA is mergeable, it might then mistakenly be merged with
> another VMA without having populated the range.
> 
> Every mmap action currently available sets VMA flags such that the VMA
> cannot be merged.
> 
> However, to ensure that no future mmap action falls foul of this, assert
> that this is the case upon mmap_prepare validation.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  mm/vma.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/mm/vma.c b/mm/vma.c
> index d6ed10cefc8f..62f2ce1ad5a1 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -2809,6 +2809,15 @@ static int mmap_validate(unsigned long prev_start, unsigned long prev_end,
>  int mmap_prepare_validate(const struct vm_area_desc *prev_desc,
>  			  const struct vm_area_desc *desc)
>  {
> +	/*
> +	 * It is not valid to execute mmap actions for VMAs which can be merged,
> +	 * as any such merge would leave portions of the mapping incorrectly
> +	 * unmapped.
> +	 */
> +	if (vma_flags_can_merge(&desc->vma_flags) &&
> +	    WARN_ON_ONCE(desc->action.type != MMAP_NOTHING))
> +		return -EINVAL;
> +

If you wanted to make this unit-testable, you could pull it out into a
separate function:

static bool mmap_action_is_valid(const struct vm_area_desc *desc)
{
	return desc->action.type == MMAP_NOTHING ||
		!vma_flags_can_merge(&desc->vma_flags);
}

then write:

if (WARN_ON_ONCE(!mmap_action_is_valid(desc)))
	return -EINVAL;

And you can write a unit test directly against mmap_action_is_valid

otherwise

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
