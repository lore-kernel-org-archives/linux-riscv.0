Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DF1C3601A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=pp9+7SiQLN1CffW85Ua+Oq8IxpZPYLc9XG8m8Utg6ro=; b=lD/v9J/RQmciHP
	XUd7rtG9lu1cxy9ydB7A6RLjvVweI6HhU4a/3HHXImyjOu3/7dwsgSU+2aP39ypftkT+JwlPFwnS0
	XHdJvB4VFh3lvQe+5CMCGproaB8Z+iAxjnX3RRG0jZ/EdJfwDMMZ98Ylh79KSmOGYjPP3U2LU4iU6
	wvaHmdxVLK33ktQcMQDg/3xNeHYPyB89+5ZFq+V1Fp7x9aBlgjMhx2A728ssdJSLFo2R/mWiXlsfs
	J9M01i+oA9viqjycUW2bR2UfV+ZmG690HzKywlmDYeDD6q3AiIZ+DR1HK+gWKOy/v7eH4gJ8QMezU
	+CeOH/vfuR25XCFGSzpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYCF-00000006DqZ-2T4H;
	Tue, 17 Sep 2024 13:24:47 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYCD-00000006Dpi-2hcg
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:24:46 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3a046d4c465so18870195ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726579484; x=1727184284; darn=lists.infradead.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+GO6NbsJM6lj36sGfiQI8cJQWsBmv1dgpBBPrnX7Pwc=;
        b=xjzDUTdrGz6x4Ecn/46ZumVbHdJ3FR8CSNY99LNx+3MuJtwXraLeOFfpCCDrL66wls
         chd5Re78c8Pdiet92iJ/WGZmLQM5YYnO5xfDDDkD4yiacAxfCTwEvVFk8zLcwb5iuuzn
         lDUbXufvp22fB1l2ArE2u17foCsTO46OXcuitetV1c5E5BB7JqefZoh4dAOzhK/fUyBh
         6QNl6LBflD/M3W78mWrHDF0ZICOapmjz8vftisBU+b6zTNINFUQDdF/2M9xGLWVlFj/m
         UWLcYVodNJdtJSTwGSFJ3H1CwmOVU2vYAaEPm91bBx69wmNHGe8Vrb34YI8GUYI46Mwb
         cH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726579484; x=1727184284;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+GO6NbsJM6lj36sGfiQI8cJQWsBmv1dgpBBPrnX7Pwc=;
        b=XF/Kf8F99qUmVMWJz0616cVKIpWgbvOEA/nvSi/053/TrDuPSmW3hfqsMko7zA3iSt
         lImE8JFuKvvT379LnSuP0kvgf97g+b/tScC5U0E3zv+0/RprqzuWAIJFaNHXjkibtJhy
         a4vLBlgjbb6592x/U7rOo8yrPYrAzgvn6bOgYdSC32h4tZE12fawRQJJBFtpcopd/rLl
         JIu/UnDFLGJ9IXcx9wdW8u+ivRzmvmOLSni8B0zCEAkfd+YkQA6sW3/9cdZYnxygPoqL
         4+RHS1QshS6L04u0WDs75rISEK3K6AqKqvv20x00anKnXwuMcPBe5xi5M5dySPbPF7Vi
         Foww==
X-Forwarded-Encrypted: i=1; AJvYcCUxtNPOunqPdvAt634RC6mNBvE9rnWNVQ2ut6CwV5sooFA9HhN2v0auSgcQHLo67iVGI7opHGCJiqBqAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBOwNE+8Z/osZtox9ib2QBDzUst36BgjJHeVl+2HihIjH1tcd/
	VifaEoBhLwAok6SfFzb8+UhaRsi9VRhNcN6wpYC/6z5PUccwYagShgb7gQ1TC9o=
X-Google-Smtp-Source: AGHT+IGzktPt5rKmypCFuPOGhoO3476MNHo/ULcvqysTy4mC+7xbksXlxosTGEXdcx5RmPg0u5jk5A==
X-Received: by 2002:a92:c56e:0:b0:3a0:92e5:af68 with SMTP id e9e14a558f8ab-3a092e5b19emr88470795ab.15.1726579483879;
        Tue, 17 Sep 2024 06:24:43 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db4998e21dsm5830170a12.75.2024.09.17.06.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:24:43 -0700 (PDT)
Date: Tue, 17 Sep 2024 06:24:43 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Sep 2024 06:24:36 PDT (-0700)
Subject: Re: [PATCH -next] irqchip/sifive-plic: Make use of __assign_bit() API
In-Reply-To: <20240902130824.2878644-1-lihongbo22@huawei.com>
CC: tglx@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
  samuel.holland@sifive.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  lihongbo22@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lihongbo22@huawei.com
Message-ID: <mhng-d2276021-b769-46e2-af6c-40802385909c@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_062445_700890_68A7D8DD 
X-CRM114-Status: GOOD (  17.07  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 02 Sep 2024 06:08:24 PDT (-0700), lihongbo22@huawei.com wrote:
> We have for some time the __assign_bit() API to replace
> open coded
>     if (foo)
>         __set_bit(n, bar);
>     else
>         __clear_bit(n, bar);
>
> Use this API to simplify the code. No functional change
> intended.
>
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index 2f6ef5c495bd..c576b9bbeb13 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -252,10 +252,8 @@ static int plic_irq_suspend(void)
>  	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
>
>  	for (i = 0; i < priv->nr_irqs; i++)
> -		if (readl(priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID))
> -			__set_bit(i, priv->prio_save);
> -		else
> -			__clear_bit(i, priv->prio_save);
> +		__assign_bit(i, priv->prio_save,
> +		    readl(priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID));
>
>  	for_each_cpu(cpu, cpu_present_mask) {
>  		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
