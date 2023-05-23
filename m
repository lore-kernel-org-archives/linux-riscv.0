Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95937C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZlrnmsOJ8uKpFvxD5j9LQV8PVbin248RiAPifrh284=; b=cSOr4CXbkk/hQG
	fMoFsE5jHXcuGqtEzn0KpRICigAVmiANOPFaC5LIsT2c7ZiT5iHWEHQYdVucm8KY1P/ycmjZ1p6dS
	ZWfArT2zPSnEqS7+mwegHEfo1ATDAPUWevb82/2u3yIpquhwZIlDXzbwsRdZltexFda0p58ihrlIA
	AqU4SI9SikBXYcZy6ICoQTulHEOhPQaNGMjEHHWUUlCZ/YJFGerOqztKgdzpmIvecjxcMGZKpRSYT
	1eA4vBWTeWDT18pUkg/DYG9TiQyXcaSSB+VNzaV4Un2h2Phty7sJ5O21XS6hXj+OJM6ACdzm57FxI
	2HBlinQ1VQCOFF3oUcjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1QhX-00A9zD-33;
	Tue, 23 May 2023 12:01:15 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1QhV-00A9xq-1W
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 12:01:14 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-513fd8cc029so1435369a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 23 May 2023 05:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684843271; x=1687435271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwDgLKuZAoJyLnwNBTa9Plj4tI2jTn00PeEyIRBeY3M=;
        b=UlTc6dBhYhV5+FwOb+RSPI2rk8Q3qpFgLR3evPzNE3qoSA/1Tv938oYhaUah40zsTJ
         f5TXQMK2Cs079ySx+YpwdRWznI362VlsBkVu90B+Ov9nuERDJwdJYMfohfmTSI2+kDdI
         scPtnFlwU4iUXY9LM6WpBfRQbFpdHeGc4hMcAFqULPVX1fZW3lDlnnbfO1JqByHkrWWK
         3iO8KQPZs0CPPK/LLdsYu6zc5ox+KJMKgleV+yRLT7U3LAyno33h5A9o/0CfapwLHQDI
         veiFgFew6wafBYy17ZumPHmrNo9K9VFsHBpJb7AfKpU3Gm3sGMXUvay7WEwp5nxFryVv
         cQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684843271; x=1687435271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwDgLKuZAoJyLnwNBTa9Plj4tI2jTn00PeEyIRBeY3M=;
        b=Ly+n7aa5C87eqP2HiRRFR91N5rTyPTyWOfew4W6AevXQSuuLt2CKIMLP2L6Fb0l7Ww
         d02MTCth9T3oI68QddH4H5EvCd1IKrDyyOBO+dCkf2ITu2pnmKqCgUTTvKRVAdxVAKRd
         RyPnGvOyEu4a1Tna5zXH6Dzpol1aMIS9oPB4MZ5g1qXXmRoMjKJiyTfIZ0xIVAuc8m44
         BY2GiD55jpsJUpUSDQRvVqIiLezTKP/Vvv36cduQlKVkC3IFLMd6s2JfuAtwL9+n0zH+
         XS9d0gH5ezboZDEneYNIwbzu/+CCR4kpzhnM2tJq5+PUNAdmUJmM0EUz31NiCul538D8
         pYqQ==
X-Gm-Message-State: AC+VfDw7TTD/eeDlq/wivGmVCaF19Apm+9+gDAFtW7BHAlSGukUe2g+W
	jo8cXAA9LwfIC8IxryA5i2CuBw==
X-Google-Smtp-Source: ACHHUZ40CX09dMi0e735PDRKFRNtfgI4LS6imtI87HuWDsDYP/q8KqRU12dipkCjnKzQegYx3Zmfiw==
X-Received: by 2002:a17:906:d550:b0:966:4bb3:df63 with SMTP id cr16-20020a170906d55000b009664bb3df63mr15157840ejc.63.1684843271141;
        Tue, 23 May 2023 05:01:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t20-20020a17090616d400b009662c57b4ffsm4397666ejd.96.2023.05.23.05.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:01:10 -0700 (PDT)
Date: Tue, 23 May 2023 14:01:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev, Weili Qian <qianweili@huawei.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, 
	Len Brown <lenb@kernel.org>
Subject: Re: [PATCH V6 09/21] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <20230523-7263e5220667fd82a462afc7@orel>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
 <20230515054928.2079268-10-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230515054928.2079268-10-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_050113_512826_68D6388C 
X-CRM114-Status: GOOD (  12.12  )
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

On Mon, May 15, 2023 at 11:19:16AM +0530, Sunil V L wrote:
> RINTC structures in the MADT provide mapping between the hartid
> and the CPU. This is required many times even at run time like
> cpuinfo. So, instead of parsing the ACPI table every time, cache
> the RINTC structures and provide a function to get the correct
> RINTC structure for a given cpu.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/include/asm/acpi.h | 10 ++++++++
>  arch/riscv/kernel/acpi.c      | 45 +++++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/setup.c     |  4 ++++
>  3 files changed, 59 insertions(+)


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
