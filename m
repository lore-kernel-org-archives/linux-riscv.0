Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A89DC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:01:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7292E2073E
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 02:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rJIkLXI6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="sI+hqjvR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7292E2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=OBpXPaI93mvyqK4HhfK52LNp2kkTpqQBmKZGS9Bnklo=; b=rJIkLXI6nxt6RS7nWpSAFBv91
	r2IoTxsnLl57FJ2g/2diK6/bSxKRM9VtjDbJNDFo+zkuxlzEDSV8wiUBFcsFXYFHGTBqSX2gXYl3d
	qVw+NYW5pF6MCjDUEv3PFoZ7A9z5ASdFMqBuU5XkzCj6yukLdiPo1JHL2wRH2X1f0O41IrNHOBBOO
	War3DWSifXyuvvBhYvALxNDiMkiRGjDO05Zjk19JZi3Fgrj1mrUm8GQ6/kcJ2YCT/+jHM37sWL+Pf
	+ZQRkagpt8ENoEt9O+wgxoYjGTaHz+oKXwxRtbVPLhWQ6X3bPbn4BlMb/9kXlMOBs21/0RrwSHJVl
	jnnX77kCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k38js-0000cp-Jl; Wed, 05 Aug 2020 02:01:08 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k38jq-0000bf-2o
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 02:01:07 +0000
Received: by mail-pl1-x644.google.com with SMTP id t11so4562882plr.5
 for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2020 19:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=kJcpV3FFFfsD2l55JahUfRW8uq2TSc6p0u2YdLtfElo=;
 b=sI+hqjvRrwWh582aNgQiqkG2hjMhJaMuduojBE29+CtdYVAKWZMeahFLnr+VsDAHDj
 xyXqs7tqdRfi2Ie4zFfZwIWY0i7jezrHbCxDvha1AVTrngUAe19Io2J2+OWApT93in/d
 4WVezYpqJOdMNKiL/Us16O0iLMBd2B4ewCuxjm/2PTNeaK2vcXTRFYrVMAiBmcFgFA0F
 Kd9QWJtrcYnsW3U+3Aq301UK+FyWwT5xuqfy+Qn3QTMip8DBK20tP7at0G4UuyI5bYYJ
 TaQhgyLoYB5IJ7LViGAHAYVNPbDKMRYgAMAQAmA6+AVYh8rl4vltO0+OKUTSF80tZEIx
 KsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kJcpV3FFFfsD2l55JahUfRW8uq2TSc6p0u2YdLtfElo=;
 b=gg2CuDd2xJ1KSFMoTJgYD8BesWnj5CH8O81LW4zsaccPkyd1BGB0keRGtyNOj1O0Tr
 2sbNPOkS1qMOLITTyaF/L5wParRmdGf04rYSxoHWpw5l3rGTKPup1zbgx1ouHgri+gr7
 zV4PGaNbh8r2xKwho7IW0j9uC7dbVCag9hhXiqJtRiEvmVcBAKzX6G5s7nfutP2ppLbK
 v3Z6mrt2C8FYCiESLFMXRG55QsK5Rp/ncycg8+chFrQyKK+v8NyUowqbp7QceD7ZTEAO
 /G47cPUDGCsP2Tm7TEEn0TthajraDEa1tGlmK2Lxy4t+7y0YYZitGVoFc+npfweMp9+u
 c93g==
X-Gm-Message-State: AOAM532IMj7ZcD2AYnkGJ+gWroYO6/3PebDo+fFkurv1UcHbTJdBnjyF
 2WErzMhpNVb95wH/z81Z4esis7CoDjU=
X-Google-Smtp-Source: ABdhPJxf9Ivj52yHuPOhnrAktIWy7INuXCJ1yMVqmLgBHLBpNMK7tJiwnUKeTzthHlO7ATskrL+cbg==
X-Received: by 2002:a17:90a:ff85:: with SMTP id
 hf5mr934567pjb.79.1596592863295; 
 Tue, 04 Aug 2020 19:01:03 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t11sm541305pjo.41.2020.08.04.19.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 19:01:02 -0700 (PDT)
Date: Tue, 04 Aug 2020 19:01:02 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Aug 2020 19:00:52 PDT (-0700)
Subject: Re: [PATCH 2/2] riscv: ptrace: Improve the style in NT_PRFPREG regset
 handling
In-Reply-To: <alpine.DEB.2.20.2007232216420.4462@tpp.orcam.me.uk>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: macro@wdc.com
Message-ID: <mhng-eba72823-400f-40a2-b76a-4132385840bd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_220106_169392_D155B926 
X-CRM114-Status: GOOD (  19.83  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jul 2020 16:22:30 PDT (-0700), macro@wdc.com wrote:
> Use an auxiliary variable for the size taken by floating point general
> registers in `struct __riscv_d_ext_state' to improve the readability of
> code in the `riscv_fpr_get' and `riscv_fpr_set' handlers, by avoiding
> excessive line wrapping and extending beyond 80 columns.  Also shuffle
> local variables in the reverse Christmas tree order.  No functional
> change.
>
> Signed-off-by: Maciej W. Rozycki <macro@wdc.com>
> ---
>  arch/riscv/kernel/ptrace.c |   24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
>
> linux-riscv-ptrace-fpr-style.diff
> Index: linux-hv/arch/riscv/kernel/ptrace.c
> ===================================================================
> --- linux-hv.orig/arch/riscv/kernel/ptrace.c
> +++ linux-hv/arch/riscv/kernel/ptrace.c
> @@ -58,18 +58,16 @@ static int riscv_fpr_get(struct task_str
>  			 unsigned int pos, unsigned int count,
>  			 void *kbuf, void __user *ubuf)
>  {
> -	int ret;
> +	const size_t fgr_size = offsetof(struct __riscv_d_ext_state, fcsr);
>  	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
> +	int ret;
>
>  	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &fstate->f, 0,
> -				  offsetof(struct __riscv_d_ext_state, fcsr));
> +				  fgr_size);
>  	if (!ret) {
>  		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
> -					  &fstate->fcsr,
> -					  offsetof(struct __riscv_d_ext_state,
> -						   fcsr),
> -					  offsetof(struct __riscv_d_ext_state, fcsr) +
> -					  sizeof(fstate->fcsr));
> +					  &fstate->fcsr, fgr_size,
> +					  fgr_size + sizeof(fstate->fcsr));
>  	}
>
>  	return ret;
> @@ -80,18 +78,16 @@ static int riscv_fpr_set(struct task_str
>  			 unsigned int pos, unsigned int count,
>  			 const void *kbuf, const void __user *ubuf)
>  {
> -	int ret;
> +	const size_t fgr_size = offsetof(struct __riscv_d_ext_state, fcsr);
>  	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
> +	int ret;
>
>  	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &fstate->f, 0,
> -				 offsetof(struct __riscv_d_ext_state, fcsr));
> +				 fgr_size);
>  	if (!ret) {
>  		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
> -					 &fstate->fcsr,
> -					 offsetof(struct __riscv_d_ext_state,
> -						  fcsr),
> -					 offsetof(struct __riscv_d_ext_state, fcsr) +
> -					 sizeof(fstate->fcsr));
> +					 &fstate->fcsr, fgr_size,
> +					 fgr_size + sizeof(fstate->fcsr));
>  	}
>
>  	return ret;

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

(Though the comments in the first patch apply here)

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
