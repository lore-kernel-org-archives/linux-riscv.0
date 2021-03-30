Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFF4C433C1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:07:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3E8061924
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3E8061924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=coEb9GqBcWcGScTM0mT4PJStWRVjpo+0LfS5WH2fgmc=; b=i2B+RYGU6GriadOxcf8YpOMeL
	vpruOO4t2w6JJvCJAPVSAbjo9cWaWlSNm6L1TDo0q2meRGRNZLL/mYI6pNfhyV19NAd12VU8rWb4V
	ywSdiu3Jtr1xSPLrmyA3LwS/1EeBtXMhdYGMaGBlPFudAugiwPsnTkMNRMkI9pdRa/guXCNWgUOWs
	B96VcJFEr6RKCkzwywi9l6z83WAlLgZ1ejwQCKyJ5f2HHwcWXoOfQititwcYJkHiNHq2LZ3wUjaMB
	wr8rjafPuPzKOGAelB/y6uWXVQ6C86CAp7nKD/B1KSpp7A4KFkA/qdGQpRm2CEPN3+ZCy4ug4TvNd
	FikcDQJeA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR6aR-002iZz-8S; Tue, 30 Mar 2021 05:06:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR6aI-002iZ4-9V
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 05:06:36 +0000
Received: by mail-pf1-x42b.google.com with SMTP id s11so5276058pfm.1
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 22:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0fxf1pqArnRlwV/UXS2GCx4oBLa7c/szr4cwgrzePoI=;
 b=jIuKZHa7oZIGY8lzBAj9I5ffuXlznNjKZjiIn9eEJjMGwSRXlQP8gDL+5W+8Z0tfvg
 flmVGbIzjY+frOIEgJOdTYJ+rxyRcq/ESbrCfrPsj4QSvkEukLgadJBGL6QSrSbMCLqZ
 LmEPM7PKe82E4FZffxN3ChnwER0El8dHHIyQbHzDukPLZKmTR5ZLmMhc5ZO7R/P4TOVZ
 Ow9u+w5Hq929+JP02SREQpdsJakFcViOLRl2dQmvwxXhE3WO0nbew4kZJLgcazZ9VRYl
 Vx/CLCMtf2tDVRsDQpI7ZwPhjyeCEvZHrzPkMGa5iAW9+R2VHd3QlsmDyZER+HG76ES1
 /phQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0fxf1pqArnRlwV/UXS2GCx4oBLa7c/szr4cwgrzePoI=;
 b=g6VmRju/eUOJpSzLUEI8hVCbQsE8psAxrJLpNKsuegEUwb0cGBnn0wcrM6xQyzzk/I
 NE54EAldrKT8pYhZ4BEAZGQRGh1/AqCXThs4mw07sPrVZ3DT6ALmsY0eFZlwEtVLCiSK
 FqUXQBUIthI4YMMASC8vJPP+tJ6xrCBwb2hjUy2bebhve9fA2TqMe+BTEKuU+TC/ZEoo
 VsylSEqlI3Az+Gjor4Jrwih4eHNB4dEDBHFwwzH8IhL+jEzdbKzFqQcNOuNRfKdI7CyA
 hzz026tRq+2fMcDnZp0rUEHJDRt75UYKiTvY5VlHO4RoWZSMvLlMGlMCShM54jcm0rxF
 kW5A==
X-Gm-Message-State: AOAM530GWhsmgqV0abcrN5iDnYsS39LA3pODKzCvGRFhVPHJ8jHrvZWT
 QzrVrdOwNYwaB1GZdbWgwhrirg==
X-Google-Smtp-Source: ABdhPJzswVyCCiZPCQPJRXrQwpsQvzoUWDBpaMvczfG7dW1Gqx15K3sybIOlB5eg36GHmbejYHxJ/g==
X-Received: by 2002:a63:4460:: with SMTP id t32mr26348816pgk.139.1617080791906; 
 Mon, 29 Mar 2021 22:06:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id fh19sm1390377pjb.33.2021.03.29.22.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 22:06:31 -0700 (PDT)
Date: Mon, 29 Mar 2021 22:06:31 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Mar 2021 22:01:15 PDT (-0700)
Subject: Re: [PATCH] kbuild: buildtar: add riscv support
In-Reply-To: <20210316160242.61712-1-me@carlosedp.com>
CC: david.abdurachmanov@sifive.com, me@carlosedp.com, masahiroy@kernel.org,
 michal.lkml@markovi.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: me@carlosedp.com
Message-ID: <mhng-6e97a94b-b3a1-4bdb-aa0b-30f44ec3d2fb@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_060634_565566_4F54561E 
X-CRM114-Status: GOOD (  15.24  )
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

On Tue, 16 Mar 2021 09:02:43 PDT (-0700), me@carlosedp.com wrote:
> Make 'make tar-pkg' and 'tarbz2-pkg' work on riscv.
>
> Signed-off-by: Carlos de Paula <me@carlosedp.com>
> ---
>  scripts/package/buildtar | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 936198a90477..221aa7df008d 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -123,10 +123,18 @@ case "${ARCH}" in
>  				cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
>  				break
>  			fi
>  		done
>  		;;
> +	riscv)
> +		for i in Image.bz2 Image.gz Image; do
> +			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
> +				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
> +				break
> +			fi
> +		done
> +		;;
>  	*)
>  		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
>  		echo "" >&2
>  		echo '** ** **  WARNING  ** ** **' >&2
>  		echo "" >&2

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
