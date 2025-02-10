Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D4FC02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSsCT5jtizH1UJw28ZUC0zzd3cyt3q7koPuDukUZUCs=; b=sEIxxMUKGZ6y+k
	KpThSdiAv9Mnp2KuHKP2V0LFThDrM1SoFjobUAm19KQRvV8Axg3aDbG+jYdlZVmmbqDGuFRiwyUHP
	cfOq/vZQwuKsEk2QB07Q96RGW7NgNGk47cVr1Dz3dBYi8zOztikKeoBSQtghm2NK60sMunc7aZsey
	2rkKHg3HNUkx0ul68tmYWY0YDa0hQK8D0DMkgz37u5idJCwQx6+u/tbxLmUkGfRS3QW0XLcp3YXdk
	5rPGvRk8MBnkOGUqYRCou5uTE87f//eBZeQ8y86+hAIsc22mry0qcWpt64MyI1qOqaoQD6dLuTEJW
	oBjaUMsNb7tDZwFQcHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQK4-0000000GrYW-1Rox;
	Mon, 10 Feb 2025 09:43:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQK1-0000000GrY4-3byQ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 09:43:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4394a823036so1174825e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739180600; x=1739785400; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vd6QRU+2E32PqUfzpGGLWnF0mLRXE9e/IUHXmZWK/vA=;
        b=O0KxC66sX68ATMgD4HHPjAdCvD8WZX5YCTEVxrHoElX7wWFXeZF9gpxTNAKM02feW4
         V3NNS6CwTRbTwX3b/xCgQLVjHOrlF5f1yfyZZgK50LoYdIBwo4lo7vYG2NyVwr4wLLaJ
         JaIV0rBraJdkYAZfdVfJbdYItG/TMVpa++ar5Fma4/c6LFBQu/L9bBghw9uCwF/+or++
         6f63wB92n0zReY2mlbouDowRxRCD/4RUVxqjRgRstnnxRfd88Ja5rLJFRA7AHkiAdToU
         m9kV8fQXw+kvHiZ0KyvPebUnWKwez+NZtFl1Kvv3NX/T4DJDfAb07hWGfLla87zsUCVF
         P8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739180600; x=1739785400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd6QRU+2E32PqUfzpGGLWnF0mLRXE9e/IUHXmZWK/vA=;
        b=wQ0nYtwjfzB8ls3tJ11Umwhfb3oM0SoCt696q5vmQldKPZ8r/MDDbBQm7TNrbHCv8B
         +0lO3v9H4uSiEorvdUoo6lGsoVzuxX7fqf1x0cBIFWWvMVPo5RtS7xCX9dyLJP92pS6i
         4bOfoarmhITQ2dIsKbMoOcGm5ASb4ztPpki2MRAbHdTvsm6qb5lJM1JHuVhrebPBAK+5
         HRKYhrUgDBuo2K8XURA1FWxZWzDYckmq04VG9xbxD/xqIKwrgn4yuksUr5PojWn0heTO
         u/AoyTc+OxmoT+qx5wFa2iHvu6YfnO5lRbypXe4h/w3/bfZBr9Y34dFv5+k8YyjKyhPq
         4Beg==
X-Gm-Message-State: AOJu0Yzn82nQv01caKtHMI/RQ0/wr/2PzLowIcHYEBM5QO8AYxfgaPXz
	DT/RDhxd6O5kv0GvGkXp0OIiQkAPJ3h+ollk6+qXgOiA2R5YvcZ1wLT6jrefB994AandS/KgYou
	d
X-Gm-Gg: ASbGnctHBczwfkjNwvortJZTodp79LBd124VBD/VdfOiK8o65+3ptGPot7BCtg80F5X
	0m4GyjrCzrmnPpqHnA8zH27tNhgLB68QylXFynYVJAxVH90nh83Mvk1KHefGy+79XQKRSygEeO7
	SF/lH2QgzaWm2PRs6J3P9rJzFWSZ1vaMjJwu63QPnrjrQv0Arn3Wum3IKw01F6A6ChlIblZZHvY
	WxXqsaYQQEF6J7twuLtKRserkmmjjRKNrm9YwQmRivgmf2ugV/1kdlFRIbj86yZyHRJfY2HHbue
	7tY=
X-Google-Smtp-Source: AGHT+IFRLkjybFieOXOH5tV7bOv0UazibB2LYsvwMDsRR1+KIdtj2nHV6LDRet17gWhnLJNyEaXexA==
X-Received: by 2002:a05:600c:34ce:b0:439:3254:4bf1 with SMTP id 5b1f17b1804b1-43932544f7cmr57004835e9.8.1739180600051;
        Mon, 10 Feb 2025 01:43:20 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae5c7sm139032785e9.18.2025.02.10.01.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:43:19 -0800 (PST)
Date: Mon, 10 Feb 2025 10:43:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, jesse@rivosinc.com, 
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
Message-ID: <20250210-51cedc94f4cba8c96516adc5@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com>
 <Z6ax7B45OsGerjfA@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6ax7B45OsGerjfA@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_014321_898535_E38897DA 
X-CRM114-Status: GOOD (  18.48  )
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

On Fri, Feb 07, 2025 at 05:22:52PM -0800, Charlie Jenkins wrote:
> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
> > Probing unaligned accesses on boot is time consuming. Provide a
> > function which will be used to look up the access type in a table
> > by id registers. Vendors which provide table entries can then skip
> > the probing.
> 
> The access checker in my experience is only time consuming on slow
> hardware. Hardware that supports fast unaligned accesses isn't really
> impacted by this?

That's true, but...

> Avoiding a list of hardware that has slow/fast
> unaligned accesses in the kernel was the main reason for dynamically
> checking.

...I'm not sure why we should try to avoid determining hardware support
by its description when a description can be provided.

> We did introduce the config option to compile the kernel with
> assumed slow/fast accesses, which of course has the downside of
> recompiling the kernel and I assume that you already considered that.

yup

> 
> Instead of having a table in the kernel, something that would be more
> platform agnostic would be to have an extension that signals this
> information. That seems like it would accomplish the same goal and
> leverage the existing infrastructure in the kernel, albeit with the need
> to make a new extension.

Yes, I agree that another profile "named feature" may be the best
approach. I'll consider proposing one, but [1] implies there may be
some resistance to creating something like that.

[1] https://github.com/riscv/riscv-isa-manual/issues/1611

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
