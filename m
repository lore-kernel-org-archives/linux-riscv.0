Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B82DEDE99E
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8G+uYwf90a/pP9nYuZGJlBqM58ytGzMsJPQaWm65Wg=; b=oMLbnex/2aXnvc
	PGoeXxqo+6LiY7xRHPu7kVf3KVAb8+VFSzguCst2H2tDd+t+aEX9QrDNKEZxrYy7LlNzuVMlNPZjn
	zueVe4N46eqh6mROf2YnUGJaWdim5EiADTFGVR0yC/usOVk72Yk4nedpbHPwhE2bMYp1q7/xDPhRR
	XxCdcJAp5bEktYDJTvC+oQim0ROBUIsOgn5ZenHqW73Al8Re5djTV7YvINazs4itWCmvrVOwtrvE0
	sRJw7MhLW1cGvGL/Fbmu4T2Y2tZNuJq1dF2Esl38AR1zwyrVYkw8RFduO8FuMrJee0Mr51cnfnCzR
	qDfEjOblBGR/FZx2XaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgimX-007qXp-0p;
	Thu, 14 Sep 2023 09:37:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgimU-007qWh-0R
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 09:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694684221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vQlQADn2LNqOGAlsXmaezeqHZMFdsyRwPKTLWRd854=;
	b=TDAGFleMZDXaox0b9O9cR/KjF6jDxgxfKQ8tnSDBwtsTEH+ol2xb9fbv6qDM+eIhDk26G/
	XFaCM4IcZp/UXEj6HDkSR76S5iFceNolN+w3h+mCACiyw+kjohQJCw39GFIlOT5zqv2+YD
	/sXjroxZJTlLnMJLrGtE3oWA7z7BunQ=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-WuT7U118Py6selthdyc_fg-1; Thu, 14 Sep 2023 05:37:00 -0400
X-MC-Unique: WuT7U118Py6selthdyc_fg-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3a9f866abceso1078808b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 02:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694684219; x=1695289019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vQlQADn2LNqOGAlsXmaezeqHZMFdsyRwPKTLWRd854=;
        b=eqMO4JxkquOYw6A1u+bU0azbJP+mpe4VgSZILeAWBEKu22Pf0a4yvjtYPSptXgwOye
         6D50N76QbR+Xr7L9vsFBKd0wKtfH3fBpEQTUW24s3qK8P7Al+iU8PkHY4VzdEuItCBFi
         XmI3X8zUDFVu9czzDw1dIyG5k6f4Ju8A79mAzkWCHwPItVBH3Ye599JYZzQ9J103SO0p
         566DqxkNvpVaZP8l/6GMHKa9J/tNrAXdhI2ulODLJn356Y+uhuKaeXy2XFHRCkkn9Ia0
         X4pDTDb9d+8ZAIj1DpHoxAWWe2tvvX4OmTsorYZNFFb7r/68IVlBGa86+rNkUP1JxX0B
         CcyA==
X-Gm-Message-State: AOJu0Yz7kzHrSC/B/ec2H3P1CGlPOwj8tdT4K8EGAUtfj7ext6x5jqvE
	IXdYv52tw0BHKFKCELZo6WolSsR0r44mo4rxsGu8YnvQON/pYd0cJrP1Lw6Cax/3i3V63LVusE+
	hyuOcos9Ang7EORb03qGN0IsNofk0
X-Received: by 2002:a05:6808:bd4:b0:3a3:7a28:f841 with SMTP id o20-20020a0568080bd400b003a37a28f841mr6255998oik.41.1694684219278;
        Thu, 14 Sep 2023 02:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOYB9XBC6PVpc7f+a0f60gNl1NFed8atTc8/uEab+FTz4RvHJ//hpWsS4nDqiqEtsGdQd5ag==
X-Received: by 2002:a05:6808:bd4:b0:3a3:7a28:f841 with SMTP id o20-20020a0568080bd400b003a37a28f841mr6255987oik.41.1694684219072;
        Thu, 14 Sep 2023 02:36:59 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id n11-20020a9d4d0b000000b006b96a4287d4sm495055otf.5.2023.09.14.02.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 02:36:58 -0700 (PDT)
Date: Thu, 14 Sep 2023 06:36:49 -0300
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 10/17] riscv: qspinlock: errata: Enable qspinlock for
 T-HEAD processors
Message-ID: <ZQLUMbDKMgDzptPw@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-11-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230910082911.3378782-11-guoren@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_023702_247073_DBA4C812 
X-CRM114-Status: GOOD (  15.12  )
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

On Sun, Sep 10, 2023 at 04:29:04AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> According to qspinlock requirements, RISC-V gives out a weak LR/SC
> forward progress guarantee which does not satisfy qspinlock. But
> many vendors could produce stronger forward guarantee LR/SC to
> ensure the xchg_tail could be finished in time on any kind of
> hart. T-HEAD is the vendor

nit: "a vendor"

> which implements strong forward
> guarantee LR/SC instruction pairs, so enable qspinlock for T-HEAD
> with errata init help.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/errata/thead/errata.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 751eb5a7f614..0df6a67302c0 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -86,6 +86,13 @@ static bool errata_probe_write_once(unsigned int stage,
>  	return false;
>  }
>  
> +extern bool enable_qspinlock_key;

Oh, now I understand why it was not static before. :)


> +static void errata_probe_qspinlock(unsigned int stage)
> +{
> +	if (stage == RISCV_ALTERNATIVES_BOOT)
> +		enable_qspinlock_key = true;
> +}
> +
>  static u32 thead_errata_probe(unsigned int stage,
>  			      unsigned long archid, unsigned long impid)
>  {
> @@ -103,6 +110,8 @@ static u32 thead_errata_probe(unsigned int stage,
>  	if (errata_probe_write_once(stage, archid, impid))
>  		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
>  
> +	errata_probe_qspinlock(stage);
> +
>  	return cpu_req_errata;
>  }
>  

So, if THEAD then enable qspinlock().

LGTM:
Reviewed-by: Leonardo Bras <leobras@redhat.com>

> -- 
> 2.36.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
