Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720E5EE021D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 06:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eClUSLxIKy0cFIjIMONQO44xBIyeEJUWRW+DQI5jliA=; b=d0kcTV7ct0giVq
	oNAPcxCrvZySqhufRcaNQ84+YGsOCySGUSsxzHjAWC1Rl3mbxYcsuMKvYjsE/OnteTaMtfz9N0jSm
	FgdXk8HMKW3IcOEVbdiKAVs0fb1ZKhRvc4mhc3atStLMLXIroSww3nfZ1qnLvL11BVLAwNpL3U7Rm
	JfC2Q/RsV4F/nbrlsBqTgRYXrnSHr+fjzBSMKhHdR5/WPqlZ8kXHnAK+f75ySVZWPtxx3a9iEhypk
	2Tuh5SAUOXvYv9HJSgKnzSitcBlInH7RXAkGob3zZj4FkRdgZYcnPZlX5N4DSurIT2hfWXwkU+gGf
	vH0q6azY9t5/j9UobskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh1xA-009rpJ-22;
	Fri, 15 Sep 2023 06:05:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh1x8-009roR-1a
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 06:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694757917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3vjvuseUg6qNQpV7yl7mlZYb0V/K1W4pCetzu6/7ou8=;
	b=GBY1VdZalRnLPCZ5jrVL38UBQTICfdmsvCgi2P+m3IpWjRUDwMIMoM4J2KEnsC0MXwQ8NE
	I+W1agIvZw5L1GFXmUa9/5+11YPOg6811WNdksz48oIZ6GLT4SojGRFa9pp1TvZk4a8ZCo
	WdFAEsZBdTAxTVh2iV96qrJixL3fjIc=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-DBKzuvEBNbKmOmLVqyE_lA-1; Fri, 15 Sep 2023 02:05:15 -0400
X-MC-Unique: DBKzuvEBNbKmOmLVqyE_lA-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6bdb30c45f6so2229009a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 23:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694757915; x=1695362715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vjvuseUg6qNQpV7yl7mlZYb0V/K1W4pCetzu6/7ou8=;
        b=NjE56seL1QVb4sw5bJi9bjZBOpX87ngDOGDFE5QFBzQjhBb+4k0IpzF+SZC/eX/Dco
         F0fASEgOPNdsuj4aDHqPhwuvq5VoiScdvUsg8MtaglvAaETbc7drcgLXR2aLZ4lEgX41
         dFvDDDNFr8qSSff/wCcjMpntf8ZMVNZxMALtmGPbU9iiVE7taZiJb2n7cgB34FMYATm9
         jeJL3qeBnCMaivWM+gjFn97QLqnZRb5Z+dz6r/xjeNPIR1qm20EKt/UndtSZCmiFX59f
         tUxnvvt+jYK1O2IgMtEQpWs7Ft0T/MikW9oLnWHZT+SHBTGpIdxAbYMZLYWn18YJsACo
         slhg==
X-Gm-Message-State: AOJu0YzUTMEflPinyyn/uK227ZfOVK9A0tkK4mZR242tmDr6tBxOLq7k
	v/nOeSttSPNsfK8o9rVarlUIk8OFCFnIJ6OcNQpQVdKUpqMu3SMehuh0qpH+eBcibPw+/8twX6V
	9n32xdiBRr9B6CmqTyT+Qv4hTBT5W
X-Received: by 2002:a9d:639a:0:b0:6bb:1c21:c52e with SMTP id w26-20020a9d639a000000b006bb1c21c52emr621375otk.15.1694757914810;
        Thu, 14 Sep 2023 23:05:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNTkcLzZRrBx+Jpr7GLG62ISgWsC1FQJ/6MO+vKOCF0E/D50pmRfuPJnzxZifFOuWDgu4/ZQ==
X-Received: by 2002:a9d:639a:0:b0:6bb:1c21:c52e with SMTP id w26-20020a9d639a000000b006bb1c21c52emr621363otk.15.1694757914520;
        Thu, 14 Sep 2023 23:05:14 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id c9-20020a056830000900b006ba864f5b37sm1353275otp.12.2023.09.14.23.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 23:05:13 -0700 (PDT)
Date: Fri, 15 Sep 2023 03:05:04 -0300
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
Subject: Re: [PATCH V11 12/17] RISC-V: paravirt: pvqspinlock: Add nopvspin
 kernel parameter
Message-ID: <ZQP0EJc4ClA-iT6J@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-13-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230910082911.3378782-13-guoren@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_230518_643515_C8E6D28B 
X-CRM114-Status: GOOD (  19.32  )
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

On Sun, Sep 10, 2023 at 04:29:06AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Disables the qspinlock slow path using PV optimizations which
> allow the hypervisor to 'idle' the guest on lock contention.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  2 +-
>  arch/riscv/kernel/qspinlock_paravirt.c          | 13 +++++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index f75bedc50e00..e74aed631573 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3857,7 +3857,7 @@
>  			as generic guest with no PV drivers. Currently support
>  			XEN HVM, KVM, HYPER_V and VMWARE guest.
>  
> -	nopvspin	[X86,XEN,KVM]
> +	nopvspin	[X86,XEN,KVM,RISC-V]
>  			Disables the qspinlock slow path using PV optimizations
>  			which allow the hypervisor to 'idle' the guest on lock
>  			contention.
> diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
> index 85ff5a3ec234..a0ad4657f437 100644
> --- a/arch/riscv/kernel/qspinlock_paravirt.c
> +++ b/arch/riscv/kernel/qspinlock_paravirt.c
> @@ -41,8 +41,21 @@ EXPORT_STATIC_CALL(pv_queued_spin_lock_slowpath);
>  DEFINE_STATIC_CALL(pv_queued_spin_unlock, native_queued_spin_unlock);
>  EXPORT_STATIC_CALL(pv_queued_spin_unlock);
>  
> +static bool nopvspin;

It is only used in init, so it makes sense to add __initdata.

static bool nopvspin __initdata;

Other than that, LGTM:
Reviewed-by: Leonardo Bras <leobras@redhat.com>

Thanks!
Leo

> +static __init int parse_nopvspin(char *arg)
> +{
> +       nopvspin = true;
> +       return 0;
> +}
> +early_param("nopvspin", parse_nopvspin);
> +
>  void __init pv_qspinlock_init(void)
>  {
> +	if (nopvspin) {
> +		pr_info("PV qspinlocks disabled\n");
> +		return;
> +	}
> +
>  	if (num_possible_cpus() == 1)
>  		return;
>  
> -- 
> 2.36.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
