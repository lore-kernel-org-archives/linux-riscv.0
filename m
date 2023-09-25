Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9968BCE7A94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irZmiYTytCmYMNnWpkapINmMbYPJYizGy8Xwoblanpg=; b=GPXyAsx+2JM5c4
	8F7X77FYtLj+TVN75k+aOR4R5S5a/hHqJBpU+paR+qegSwyiyLAauzD8dO3vNxpBG2pZadeFZN92y
	HjhBQdJ5joYQjzDNubuZBJNWjBgqTXrWuIfU2WWIqtFw5Lpp8RQrmNwYQxrG4ldhqz23ea6jY1tOm
	pwmjSptKqZ+5BEroT0G2LsNkKwemCr1MTkMSwwqWscTlpqaMFJhCbNuSKTvSRT/zjKWfI0lrWpJ62
	Lml17f/5tuIN4vUQH3E9M/OZgWb1xwkmxYfIWMlLes3Wg1Ia3EnuO9tfdf4fiyMtvAZr+FHazj1Qr
	2UWx24iedJqtl46LuHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkSE-00EENM-1A;
	Mon, 25 Sep 2023 12:12:46 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkSB-00EEMo-2Q
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 12:12:45 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-532c66a105bso7293987a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 05:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695643956; x=1696248756; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uLURMO+KZpLH7KQRjBMGKDAiCzocbTt1mtUrf+ln9xM=;
        b=YZFoiwcYalXNHgxSij2b5b/OgIxJ/XhI+Tf41VqOfweZV1tnenT4MbmITy+J7SUnNA
         OalrS+BrF6+lUiajVFDVP45T2sR9JI12MsIIfhrlRm9vEibruvELba8OQAMoy4MEOoVW
         COsKxIDs4QM0mEPZj5KrJ88JPgN4cQAbFK4SRKy6nWRcR0dLWcpc5RV19AL94uK1zkTq
         TLZ5FileQ9aR2TTlkmoJI8rfG66gcQ05PwpCBcWwcV5737AxdNX9joRbvq4tiTo78X9y
         bV5CbEJ0OxulyCkJYMa3g1DRmvt/p/zUgJLiKZD/gRpcZ0R/kI2XQu2vgzR1lc2OF8E6
         e/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695643956; x=1696248756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLURMO+KZpLH7KQRjBMGKDAiCzocbTt1mtUrf+ln9xM=;
        b=MKJ2EHQFV6uLtu7EOa3pWn0BLgy1YN03Z/DMrPN+xiPVTs3ks3XxHOf/2mgU4W6BfN
         EAn7BB3RaGdDZP5wXxiX/1qYxOeY51m6akexLVgCm3R5Ked9Fhw3idcjjkG+CtZjY1XL
         5cbV6KGgTWvcK/wZyaWYMa9Y+2LtLQK+LHq28pEwidZr2sZnyBbhw9LRWMA3rzxTwqsb
         tJCqvVlC9v2V9oc5GvdztbRr22liKtElJTyh6iWsP3LcYJ0tb6KyLFay8Pl/Yf0BQVMU
         xG2iBFAcaMd+0GTSn4UOmTZVVM0JEyM2LSDeC1kn/DayuWOPdp7oF25u2wuFPRodrHO7
         Hpgw==
X-Gm-Message-State: AOJu0Yyr82KTwb8qAHTLocZl+ZsFaqQ2jSpuEe1LcokQboJjngJskuMv
	PsC5+0LhRmK5vEDoIKBnwBJEnA==
X-Google-Smtp-Source: AGHT+IFssZYp3/zszVu8+Op0gS6tdcgQ6e5Vr+5HRUSPFZG+nmOsNYSJK6JiIdRWaFvX57GVnZcF0A==
X-Received: by 2002:a50:ee89:0:b0:522:2ce0:d80a with SMTP id f9-20020a50ee89000000b005222ce0d80amr5311724edr.35.1695643956538;
        Mon, 25 Sep 2023 05:12:36 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f15-20020a50ee8f000000b0052a19a75372sm5413963edr.90.2023.09.25.05.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 05:12:35 -0700 (PDT)
Date: Mon, 25 Sep 2023 14:12:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, apatel@ventanamicro.com
Subject: Re: [RFC PATCH 3/5] RISC-V: hwprobe: Introduce which-cpus flag
Message-ID: <20230925-a628309b112947f606130f8f@orel>
References: <20230921125518.175428-10-ajones@ventanamicro.com>
 <mhng-7c3d5229-a87c-47f3-8a7c-4db3de333ff1@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-7c3d5229-a87c-47f3-8a7c-4db3de333ff1@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_051243_814681_A7BECAC9 
X-CRM114-Status: GOOD (  14.79  )
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

On Mon, Sep 25, 2023 at 04:23:29AM -0700, Palmer Dabbelt wrote:
> On Thu, 21 Sep 2023 05:55:22 PDT (-0700), ajones@ventanamicro.com wrote:
...
> > @@ -274,11 +405,24 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
> >  		if (ret)
> >  			return -EFAULT;
> > 
> > +		cpumask_and(&cpus, &cpus, cpu_online_mask);
> > +
> > +		if (which_cpus) {
> > +			if (cpumask_empty(&cpus))
> > +				cpumask_copy(&cpus, cpu_online_mask);
> > +			ret = hwprobe_which_cpus(pairs, pair_count, cpusetsize, &cpus);
> > +			if (ret)
> > +				return ret;
> > +			ret = copy_to_user(cpus_user, &cpus, cpusetsize);
> > +			if (ret)
> > +				return -EFAULT;
> > +			return 0;
> 
> So this is now essentailly two syscalls.  IMO it'd be cleaner to split out
> the implementations into two functions (ie,
> hwprobe_{which_cpus,which_featurs}() or whatever) rather than have an early
> out and the rest inline.
> 
> Also: maybe we want a whole hwprobe file?  It's sort of its own thing now,
> and it's only going to get bigger...

I'll do both for v1.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
