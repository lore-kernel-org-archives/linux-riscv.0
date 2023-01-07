Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1333EC54EBC
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbmMWhgW3KNqOqTcWxEhODCIOt3OOMZrhjX9f7re61k=; b=MHkdjDOAd9ADGS
	26kFA39f4zQCWk2RCS7ogycX1v4OlC+k8UsHljcAtueqOoA/IUN+Ak7pO42yQ8vwvYxaXrRYD2S7q
	cMdWe0xUdC/kSkcYyGZ3sG5EnTdh4JPlvr8ryc8DZiLFPhfh8p1XUdtvv4Hrv0orJEj/mOZ0vorCk
	FNwBN9c8w9+akYzFg7vFpV4eySXpJNucs+JrKfYEO62lYT4xFsm11huM1wVIyWBwMqJnd4wPAYbk8
	U/ldjWW0Hofho6NUFcFGbgpr0vhOyb3LdQhUaiXzsE0btdmeDtlNmYwqIFukXDY+v/cnHCdn/ZWa9
	gRbTz3t25Tj9Zz65Bwwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE5y5-00421l-JI; Sat, 07 Jan 2023 09:58:25 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE5y2-0041zX-C1
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 09:58:23 +0000
Received: by mail-ed1-x530.google.com with SMTP id s5so5381327edc.12
        for <linux-riscv@lists.infradead.org>; Sat, 07 Jan 2023 01:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/G9FcPlsL/ZYj6GpUzWdxZcsGx3VidjRMEnUyipGwTQ=;
        b=ycWZqSuFZ74To3dd3tRCQ6yRVxeq0UgluFKJfCwP7NMrAi4WhtdoXJFHq0fmn1PcGZ
         BidASz6yKHGfquMRO74r2wrv8n+3X0DaZHkvkUeed47LjYLFsCzlUSCcaNFJrkFwxmoe
         XAHqOJ+UooXB9uvMJr8qlJIPmNmP37tWffvmpi4nX/A3FuNHaVXj1ce3Qn+8CeG8GX3Y
         MbyMb8D/6efptMLg4LLEfs6zzrHmW6u41Vva+hK3pWH/RbLaTmU0G1JtluVSjaq/fitt
         rTRyEpJadF8DorfLe9vcUfJby2JEfhmaVxAxCymp+VXVioibcnYNPo8pOZlOma6G5xX6
         DZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/G9FcPlsL/ZYj6GpUzWdxZcsGx3VidjRMEnUyipGwTQ=;
        b=JNWP5BjDTNml6//az3jh0C2mIYqVWr9dl7um0NurgQJT5RiO4bOkWifV6vTEQ3XyQO
         8Op3vfa5ajp741kx/6t1H3s3Iw9V+/q7JkAzBbaaCbHbnCULXqoHqBDagj0oDJU69FuQ
         O0oGp4kUFa+5lGnDV3DlAksQ8dr2ux/R5GVsngU4DDz89clWVoOoX+315b+3782SVapM
         i0G/Cli7IeIKZqeYCtiH1kKux5zw6sm8ZuexgxH7bOY0De9FRhEIZgxNYuuDDLxXWonf
         AcNlgthj2qLB9+t+mOVtumQOukSlFeWtpWonPKXQVSUGEN3P6GWp1zXv2idDoUv8gx/8
         mL0g==
X-Gm-Message-State: AFqh2koq5KbG3/W+n9ixXpYwO9P6HuF3mwIcOYhpjw7tLQWpkyyukb7G
	pRJJnxNsnTh1wYwI80ejvD1E+ZNQFljvKbZwJ6z0tQ==
X-Google-Smtp-Source: AMrXdXtLzFeJ9Ad5w+6FMr/1aURZJ28sV0J+AoE7j06eU9sJC8r/2qmYF8xl4P6NBEVpO98LES7s9yYkIY+u5wURJzM=
X-Received: by 2002:a05:6402:43cf:b0:48d:5b18:b009 with SMTP id
 p15-20020a05640243cf00b0048d5b18b009mr2154665edc.49.1673085498197; Sat, 07
 Jan 2023 01:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1> <20230105003813.1770367-5-paulmck@kernel.org>
In-Reply-To: <20230105003813.1770367-5-paulmck@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Jan 2023 15:28:06 +0530
Message-ID: <CAAhSdy1VsT48WPQHZ5Pj5WNZRPUQvciFPF2LySawVv27tehD+g@mail.gmail.com>
Subject: Re: [PATCH rcu 05/27] arch/riscv/kvm: Remove "select SRCU"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	rostedt@goodmis.org, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_015822_438871_BEEAC63F 
X-CRM114-Status: GOOD (  13.63  )
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

On Thu, Jan 5, 2023 at 6:08 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> Now that the SRCU Kconfig option is unconditionally selected, there is
> no longer any point in selecting it.  Therefore, remove the "select SRCU"
> Kconfig statements.
>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <atishp@atishpatra.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: <kvm@vger.kernel.org>
> Cc: <kvm-riscv@lists.infradead.org>
> Cc: <linux-riscv@lists.infradead.org>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/kvm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index f36a737d5f96d..6bc9b290c1283 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -27,7 +27,6 @@ config KVM
>         select KVM_XFER_TO_GUEST_WORK
>         select HAVE_KVM_VCPU_ASYNC_IOCTL
>         select HAVE_KVM_EVENTFD
> -       select SRCU
>         help
>           Support hosting virtualized guest machines.
>
> --
> 2.31.1.189.g2e36527f23
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
