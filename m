Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A2FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 05:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqE0Gcp5CS00PCWDiyuMAJqxAiS+zRIMuufIhKgP6vM=; b=WnMJ8NTvCE3ENP
	WUh9aHIcIxuQI7iLuKhe7BsqB/BNu5G2/gXcVvviPX1/mMXd1FpYTszzR3y/9Bsw9dPMKYXQHiJFx
	H87EuAYb4yJQAM5wzs1pe9PiL6d9PNyt3xDXMlq+22S6KX8Hcxd968Maov6WDcmzSHYU+/aAG3DhH
	zErxH2+aGKo0tTROSDJnIurMnUVxVMFWjKKKgRuD+nBhLufJJd2yG8DS0LA+IWT55/lOuSmKtFGtF
	rc0H9yT+heYC01BcS6a8yEfjOwTGfmRUJ2K0GvPzexHD/3Po2+L6L0jxdJRJ5NwVrTvKzAMhOWC1B
	x4B+DHOcgvjBV/Z1Tkfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqTK-00AfkG-KV; Thu, 13 Oct 2022 05:09:30 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqTH-00AfiY-I7
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 05:09:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id r17so1469472eja.7
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 22:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LsAeT6CaX+I87tuvZVSRCFPqmOJTIZuIRCOfCe3pn5I=;
        b=tDSjM/hiWDiveEWJwFqstNxQatbsWFAl8ZrR5x0hDFjzOqQkLTEVB7WZlu/5hQyUvJ
         vp3r3ds6qA8GCUBe+ix49ZyUez7tUvcM4EKz1XcC3fj53v71I7cC5fuNY/ipDvBKiZUE
         BC3Qvu8na40ricNTGTxK4etM1i810zgJ5XAK+5lrG8AvsW0RtonUM9osISqy9zFJus+l
         bKUmNNvoT2gYdniXJwLdaN0xUDOQA824TYodbDvmsYYhGj8c9FkzY+f8ffwmuTCdleUL
         QXOXqfwPOrumqXgdS9/oaHwVDFy+hXygvD/cMN0tgZyweyHl7V7C2OQS41Q8ZrcfNcAd
         J/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsAeT6CaX+I87tuvZVSRCFPqmOJTIZuIRCOfCe3pn5I=;
        b=UU3nTRvQiQkBN3LQQbtYrKgj8uOUiNDDbBrf/ZY2iqjBM7Kp4vF7f2yUUj4bWjVrdk
         8Y8qHonywB0CeFySxRyPGDWjKd5+GKRpYUU/RPcdclCnNmqqOLEc6N8S2IMvbJ78LftB
         HyEcNgSYMWcfMKtLcD8r6B6Rr258KRxqsJtvLTM80maYCZ2W2HTE9mLWcTOQkUfwfx96
         PL56DtQ/+KrwO37dYiwAY7Qglu+SOwMRMrQpTZAF84J/whyo3p52uD1l+gx5lrPbZ+0L
         TxAKOmvZITIwOSYlFw5IQrSZxLNnPJhNbtaWaZafPVwNCbZ6Hx9uD6W9VG1tFfhcs15m
         32GQ==
X-Gm-Message-State: ACrzQf2KoctFQRVvwnJNFZm9L/yJp9C2w5Zs866W+0CGa1PjuHub2koK
	6sBVXDgJHEv61afxRnUqDO1A7QzONq2fafUPn2+zNw==
X-Google-Smtp-Source: AMsMyM4aD4d3ERHBlF/+CYeDceDj6eV5HxBMOEcrIQkNlmb556eFbXSIJsAAQ/3GgUFXUWh88/GEdRNwWm6wPQl7CCc=
X-Received: by 2002:a17:907:3e1b:b0:78d:ccd0:c9f8 with SMTP id
 hp27-20020a1709073e1b00b0078dccd0c9f8mr12090519ejc.705.1665637765346; Wed, 12
 Oct 2022 22:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221013045619.18906-1-palmer@rivosinc.com> <20221013045619.18906-3-palmer@rivosinc.com>
In-Reply-To: <20221013045619.18906-3-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 10:39:13 +0530
Message-ID: <CAAhSdy21Yxpzf09aN6c_=zpe9cTwsr0wqnungHk01ZuWPNHu6w@mail.gmail.com>
Subject: Re: [PATCH 2/4] Documentation: RISC-V: Allow patches for non-standard behavior
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>, corbet@lwn.net, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_220927_639843_648CBA31 
X-CRM114-Status: GOOD (  21.72  )
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

On Thu, Oct 13, 2022 at 10:26 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The patch acceptance policy forbids accepting support for non-standard
> behavior.  This policy was written in order to both steer implementers
> towards the standards and to avoid coupling the upstream kernel too
> tightly to vendor-specific features.  Those were good goals, but in
> practice the policy just isn't working: every RISC-V system we have
> needs vendor-specific behavior in the kernel and we end up taking that
> support which violates the policy.  That's confusing for contributors,
> which is the main reason we have a written policy in the first place.
>
> So let's just start taking code for vendor-defined behavior.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me from a KVM RISC-V perspective.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  Documentation/riscv/patch-acceptance.rst | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index 5da6f9b273d6..0a6199233ede 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -29,7 +29,12 @@ their own custom extensions.  These custom extensions aren't required
>  to go through any review or ratification process by the RISC-V
>  Foundation.  To avoid the maintenance complexity and potential
>  performance impact of adding kernel code for implementor-specific
> -RISC-V extensions, we'll only accept patches for extensions that
> -have been officially frozen or ratified by the RISC-V Foundation.
> -(Implementors, may, of course, maintain their own Linux kernel trees
> -containing code for any custom extensions that they wish.)
> +RISC-V extensions, we'll only accept patches for extensions that either:
> +
> +- Have been officially frozen or ratified by the RISC-V Foundation, or
> +- Have been implemented in hardware that is either widely available or
> +  for which a timeline for availability has been made public.
> +
> +Hardware that does not meet its published timelines may have support
> +removed.  (Implementors, may, of course, maintain their own Linux kernel
> +trees containing code for any custom extensions that they wish.)
> --
> 2.38.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
