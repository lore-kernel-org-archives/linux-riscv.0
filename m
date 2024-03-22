Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB29C47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIlkxgsFjlAAVlSLF3ztDHUuseSnb/XeaLWqBEBv/7E=; b=zH7of+rjbSpgTo
	mnHzhPegoDRr+1Mc7BTNWm5mizxOwxsTaA17MUiwO9pNl7A/jaOBE7jfDxyQoy5Z8VnyRpWwKcZnl
	oPEzmSaYUcutPkG712GE3haj5VtzLD7ITODfdvTtnEY6V9a/KCck41UC2DvBL0IBYaQbbVXY0gNur
	v6vOXpVq3SIMo6UvqYmfXBvK+uQ09xUVwV6Sc6xeHX4kbjnlzvNe+Ux1vFZJLmOiCvDYjyy65M0OK
	ShfHkqjAKzMtWCnuMLFM5R8SGuQ/3Nkcu+ONuwlgWwNdUaB5nwkdVU3XiyZV5eq1wHIHUDf1RIa3R
	5EcQpxapCPJ1a+KUHgmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnZnf-00000006H66-1Unk;
	Fri, 22 Mar 2024 07:58:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnZnc-00000006H4v-1WP7
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 07:58:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4146e9e45c8so13563095e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 00:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1711094324; x=1711699124; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qq2UvdnGF+i0lv3cQE2vwfxzP0IBqc7zAeM21eyo6SQ=;
        b=ZmNhDMNhYDjpJi3ovAimQQ3pDw8F4ipzlApp0lOG1RUH9IkBqE4r/v+o3rebQhg5Ti
         xHyLVPqzpIH7BuWhpBOP1YJa1iwjaeURH7HD/Id7h7agxdIr9daPCn+5tlX3tTmnZdWt
         UkFXMuW/19Dzi6yEzgMMJYL/yhcOpK6qItxTzWNI2gKCFWJaSEigDBvWEZX+rHvjrmkP
         8M0+Iqz+QDX3Nfq6twrEPVtRI7WWacBQqbU+wf4I2fg498Z4z5XngXioxTDV4NBD4hjb
         83QY5QHIXCKQtIJ8vhAOP2oF0zX4Ldps4VhQpwLdNPyIoyv5IVeidnqX6HPmcquI9u+R
         EgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711094324; x=1711699124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq2UvdnGF+i0lv3cQE2vwfxzP0IBqc7zAeM21eyo6SQ=;
        b=vjp0+MH/55ksLYym+gD+aZiNwCdckU+gDcVwDYBJPvTM690xKNzRnzaBKD74JmS75j
         k6VtuPbIknf6jl3XAZLShaDQyguwn6307nYm/ura7wKAjAzsVpSlcXefbwRVaVQlQu0j
         Dg4cizYc5o5Q2M1zuORtiQ3JNhFRGm9/7Jh/4JFWDtMw4UjZZ62Oi6eNHd4YFyNVXs84
         ID+jcDUSJbaXCVgBcZ9YtNdChuQD5fOmYMbmxrvGcutLQFexJCD/TQqwdf7o+nZsr5iP
         6GklcaVKjLlF02MZRYdsNGEOOj7aopEuy7+YwKG9Oac3GuhCbPMxOzGl/MSZvTggOS2G
         YjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzISfaxu9wTExi7RmF7BoDNsGHPqfwlCczuszqs4o6hMbi+GOyDf4rnMlZc4mOe2J4VYtjvxCjHYr2O5RS0pQbmJc3lFfPD8Pgz4xe7jOg
X-Gm-Message-State: AOJu0Yw+FmTCmmVja4JjzetHxexpIy3fwLwXf83cDT7XSeFn9ksEAKQ6
	lOuA2fwpaJJ2Soa2xU086oivB6j/59P34RDjKjMzgVqT2i7aDYxUlVUPf/piw5o=
X-Google-Smtp-Source: AGHT+IFfPw7L8Q/FyVD0aA/iJBlzVnrZAE+Hkn53NugKvE+lKFP30YlXVm9GuwDSXbo7RH3uCwUB2w==
X-Received: by 2002:a05:600c:3b17:b0:414:b66:51f3 with SMTP id m23-20020a05600c3b1700b004140b6651f3mr1050755wms.14.1711094324659;
        Fri, 22 Mar 2024 00:58:44 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c501200b004146bdce3fesm8016711wmr.4.2024.03.22.00.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 00:58:44 -0700 (PDT)
Date: Fri, 22 Mar 2024 08:58:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, tech-j-ext@lists.risc-v.org, 
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, 
	Evgenii Stepanov <eugenis@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
Message-ID: <20240322-168f191eeb8479b2ea169a5e@orel>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com>
 <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_005848_428997_011E2AF0 
X-CRM114-Status: GOOD (  15.01  )
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

On Tue, Mar 19, 2024 at 09:20:59PM -0500, Samuel Holland wrote:
...
> This is really a separate concern than when we write envcfg. The per-CPU
> variable is only necessary to support hardware where a subset of harts support
> Zicboz. Since the riscv_cpu_has_extension_[un]likely() helpers were added
> specifically for Zicboz, I assume this is an important use case, and dropping
> support for this hardware would be a regression. After all, hwprobe() allows
> userspace to see that Zicboz is implemented at a per-CPU level. Maybe Andrew can
> weigh in on that.
>

Hi Samuel,

I've approached Zicboz the same way I would approach all extensions, which
is to be per-hart. I'm not currently aware of a platform that is / will be
composed of harts where some have Zicboz and others don't, but there's
nothing stopping a platform like that from being built. I realize this
adds complexity that we may not want to manage in Linux without an actual
use case requiring it. I wouldn't be opposed to keeping things simple for
now, only bringing in complexity when needed (for this extension or for a
future extension with envcfg bits), but we should ensure we make it clear
that we're making those simplifications now based on assumptions, and we
may need to change things later.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
