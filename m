Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2259CC4708D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 09:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPdf4EfKg5Nmt3Bfwhhzr4kG6Ongg5bEHYCZtUSzMfo=; b=x6GhUkiOK5oR6a
	2D7PVJGfhh8AwG8E1AIry2Ge0E75iwDIV8mqr+TFqMdDW1rv4lQ/1ZMQGNm9Q75RfsAFOa5ue7rNf
	PYUjuJjBAyqOd3sqwxgXPUVTDPNBGva+CrA5vvbeSIVnGwAP6LGSGvAFvaQxcC1A6I285Gy18GErl
	FNOhVG8VovVgzx+K1KlOZrnXCUb6YelebnKYCSoWVqSspmapmLyKrs8w2SvhNAiJZcF8INYSYIGE/
	MQDQBfA5Mn6cKpMo0g/LBTikpXoSNuxGqLJ3orMg9FoLo187AcGVgPOMjGF1atRMrC3CQqyQHgK2T
	/q+5NxG4LBWkH/kw8vqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fey-006FKN-Ss; Thu, 01 Dec 2022 09:15:12 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0feg-006FCI-FQ
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 09:14:56 +0000
Received: by mail-ed1-x532.google.com with SMTP id s5so1454695edc.12
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 01:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ+kWHZHwj+iACmb2u6Cu3JDoLA7ZyuXRVYodkgg1Bg=;
        b=gZmWK1FtAjVvJJ5FWTShzqLnADCXlyqM1RNaOW7Y2Fef+Lrz50KogMzXhYmJKgguEn
         fJYVwvYfdNhPv4hMbO7Tfe6j8hG+4xY7hVw+EY5VDz+j6eXx+OD8CnbChs6ZWNuEXL5j
         yS7ClHhuOlplJOt2lbo9uRJUJk6k+C7t+t5DK5FyL2kqI+lPFgN1LLRcJNoDjJONXegE
         90P450GiGm2bZbqTITkfRiK8585fo6fv+SyIm23aYQBdEQ8KyqvN8RtdeOeDQGpniqo4
         CpCtuJ9vKfdPp51EG8Lqj55JknIFTVdRI5RcES4TE3w8NgZr+Wg3Kcc9sIs3vKxUUSQL
         /Rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ+kWHZHwj+iACmb2u6Cu3JDoLA7ZyuXRVYodkgg1Bg=;
        b=5H6RqYK4MSExeiVfZFTc15UfW+QppZdsIYz8inMW5dsm6Zoi56h2IoBiF+rWPxKJkh
         nVnCR0KXa+2HBxfa5sK6t5guVGKMtta/ca//UeX5j4M9SPlZyqzcjSu/wbxGG0jNzfqJ
         zVsxtXyl9QGKGgcmB/9FUoMNWaO7mmurdz9ox4ARO3dcysa793uEcKb5UP5aZTE5lh0c
         JCyFCfYlWkiXtsrddVZpLGnD19r58aWrs/i76deLNXhS0ky7lVUF63QQpWnTnuasYTkN
         vDilChPufkTVwRX5723RTgqkVQchLeMO3T5yC96g0VBqyNV5D3nS741CMh0zKSzq+Ex7
         wifg==
X-Gm-Message-State: ANoB5pkzsWDYZ1eF91q7QCcyi8kH96/QZogadQtA2jsU6c/sVKpiujNm
	ip1OC8lkixjPzxJ5qHyz6swa+Q==
X-Google-Smtp-Source: AA0mqf70unPfwc4AqZklJ4TK7P8phujtuTUWFR4aVjNeYQN4uWVpaaiuo2HgNhD5LaSrEbZsol3YIQ==
X-Received: by 2002:a05:6402:505:b0:46b:aa:856a with SMTP id m5-20020a056402050500b0046b00aa856amr20078382edv.171.1669886090590;
        Thu, 01 Dec 2022 01:14:50 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id k2-20020a17090632c200b0078db18d7972sm1511405ejk.117.2022.12.01.01.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 01:14:50 -0800 (PST)
Date: Thu, 1 Dec 2022 10:14:49 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu,
	corbet@lwn.net, guoren@kernel.org, heiko@sntech.de,
	paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 3/3] Documentation: riscv: add a section about ISA
 string ordering in /proc/cpuinfo
Message-ID: <20221201091449.q5zyfb2ubsnh6slt@kamzik>
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-4-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130234125.2722364-4-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_011454_577865_8E4AACF4 
X-CRM114-Status: GOOD (  26.69  )
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

On Wed, Nov 30, 2022 at 11:41:26PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The RISC-V specs are permissive in what they allow as the ISA string,
> but how we output this to userspace in /proc/cpuinfo is quasi uAPI.

uABI

> 
> Formalise this as part of the uAPI, by documenting the list of rules

uABI

> we use at this point in time.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I've not "tested" these docs. The NIPA-esque pwbot should go and
> test it AFAICT. If it doesn't, I'll go add that.
> ---
>  Documentation/riscv/uabi.rst | 42 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
> index 21a82cfb6c4d..bc3c8ced644b 100644
> --- a/Documentation/riscv/uabi.rst
> +++ b/Documentation/riscv/uabi.rst
> @@ -3,4 +3,46 @@
>  RISC-V Linux User ABI
>  =====================
>  
> +Misaligned accesses
> +-------------------
> +
>  Misaligned accesses are supported in userspace, but they may perform poorly.
> +
> +ISA string ordering in /proc/cpuinfo
> +------------------------------------
> +
> +The canonical order of ISA extension names in the ISA string is defined in
> +chapter 27 of the unprivileged specification.
> +The specification uses vague wording, such as should, when it comes to
> +ordering, so for our purposes the following rules apply:
> +
> +#. Single-letter extensions come first, in "canonical order", so
> +   "IMAFDQLCBKJTPVH".
> +
> +#. All multi-letter extensions will be separated from other multi-letter
> +   extensions by an underscore.
> +
> +#. Additional standard extensions (starting with 'Z') will be sorted after
> +   single-letter extensions and before any higher-privileged extensions.
> +
> +#. The first letter following the 'Z' conventionally indicates the most
> +   closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> +   If multiple 'Z' extensions are named, they should be ordered first by
> +   category, then alphabetically within a category.
> +
> +#. Standard supervisor-level extensions (starting with 'S') will be listed
> +   after standard unprivileged extensions.  If multiple

nit: Seems like a short line, at what character are we required to wrap at
in this file?

> +   supervisor-level extensions are listed, they will be ordered
> +   alphabetically.
> +
> +#. Standard machine-level extensions (starting with 'Zxm') will be listed
> +   after any lower-privileged, standard extensions.  If multiple
> +   machine-level extensions are listed, they will be ordered
> +   alphabetically.
> +
> +#. Non-standard extensions (starts with 'X') will be listed after all
> +   standard extensions.
> +
> +An example string following the order is:
> +   rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> +
> -- 
> 2.38.1
>

If this uABI hasn't "shipped" yet, giving us the freedom to discuss it
more, then I'd prefer we don't publish this (which looks like "shipping"
it) until we're 100% sure that this is the uABI we want.

(I feel like if we can still change the order in proc, as the previous
patch did, then we haven't yet shipped it.)

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
