Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E0AC04FF8
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 03:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiF+GRDFpuWeVhx9+1dC9tKtKW5nqCcCCCPdWivbuZ0=; b=PwGlDjt1C4XlY1Du9e+domdZW0
	/UyYLjqhlnc4IWhbMtp6WlhunLJMp02DzlXk3Fa8Po7BUgF0rqdBG1xAh4a2eXg6nzU1bapQtmwgs
	0H+RuYfBdYKLaOfPb/rq1C3BmwNxGqAP34cYX0+UCCZR1hHx94ZyYOghgrV+L6EhBfWorpDyDwd1W
	MNS6z2HzcDQjaNqLHnagdvZUgbrf2XZnGkRpYRZ7GTA6QCjnlYIbZA1G04nu48frKgvm8gIgoKlcJ
	0JhtSN/Cp7mbbJHP3/wvwI0KAnmXmtrAnLEpF+UGVl4llOsRIGHiF9D2AwEsgE5Vq4r2tGr0r5oGL
	3a5F3YvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxeqc-00000004DFZ-0ieM;
	Fri, 19 Apr 2024 03:23:34 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxeqY-00000004DEl-25yh;
	Fri, 19 Apr 2024 03:23:32 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-1e5b6e8f662so13478645ad.0;
        Thu, 18 Apr 2024 20:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713497008; x=1714101808; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rkTMLIqteFTKJ/kNcp3QQqr3wtAr/MdNE0+T1ql8bB4=;
        b=f8J8W9FCeo3MxP03I+gOf0w0hAPRfh4jPNV4EE28efd4wbm+jWtLbvuJk/IU4mphF1
         JfFMOGWVEaRTGikW7KYJTRj/UNC+FglYE6LEex4gOyn0BKO5E/vXkuDSpMdKo8hC6u/Z
         Mg0ERcJrkV8ZFgHGecIgoBfHmL9EI5g+Bsj0FwxJtyJI/Mnh3ALqryEsVpKr25/AnMIc
         aJQOmJOFIy5BakcJlBB8TkTMAstGhCEpd0HGzVX33Vh0W/xsqSvoZ6GNQA6hylKsNm1F
         umylARSTdmygy/ol6Rt6HsAICmT1CENiW8TO6DlRy7QuS5CP3VIoQrH4fA47uYdXO4nA
         25xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713497008; x=1714101808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkTMLIqteFTKJ/kNcp3QQqr3wtAr/MdNE0+T1ql8bB4=;
        b=Kru1WHYqHRPQ0ZV3auOFVXqYua/TPbvzkGMhBsdxybiXBUBLrXffo7aP+F1XNFPgkZ
         76qqFaEfe3ecRoL7sQaDMDJ4zPC1nLn8rg1oWMjJ708+h9vgKNhwdB4N5Nl/0GmNqtZM
         Q4ZA2GzakxTxArWZB8CQgzRs0hvVMUkDJ6vntN3a6Y2wHWqjUBnFQVkR0NbwDiohtn5O
         ZMhs4pbwqxjqHzMj5/Fm533sY6cgOaQRS2nzqlTyKb3f4lpapHIcODJY2mZ+/MEDpBZd
         c1/QWTSeQoXztK9RoxGq1jzJQFEFI/a1MVUZqO2NwcyfF1unTBfhEOO8vEV2/rrINkUq
         8ghQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT/x3mgNPRYPK2/11xeaMqpm6E8sbr82H1wmCkVn/urqJW+IuNdLSpDK7dDpcSnboJ6O/UGXNp5damrD0icoDok8YGagoWPB81UPX0KUTktj2rPTTzcGvUldwJQ2Xhp4Oo6FmCXUGqEGyKOVuu6gmnVTII8fo=
X-Gm-Message-State: AOJu0YxtL68J6VKtFPqbIGDK2G/g+X66l4DrIUlr3BpOg6RJ3rfeY5iT
	+xpLQLyOEPC928fAD8HUKj9Oeq8pltEVDT9Rljt92Mbxh6k3q6pYI6kzbxDLzsk=
X-Google-Smtp-Source: AGHT+IFcqSNcJwvLtQsKIF35W+no4QmEUqR9PgxOJnSrzkqnfVrSeUklYgHoCBe3eD+W5EXz3SXiCg==
X-Received: by 2002:a17:902:ecc8:b0:1e2:71fd:dd85 with SMTP id a8-20020a170902ecc800b001e271fddd85mr1103014plh.23.1713497008312;
        Thu, 18 Apr 2024 20:23:28 -0700 (PDT)
Received: from [172.27.234.152] (ec2-16-163-40-128.ap-east-1.compute.amazonaws.com. [16.163.40.128])
        by smtp.gmail.com with ESMTPSA id s2-20020a170902ea0200b001e43cf17fe5sm2291080plg.6.2024.04.18.20.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 20:23:27 -0700 (PDT)
Message-ID: <8738cb85-fac1-4a15-9666-eb05316f5368@gmail.com>
Date: Fri, 19 Apr 2024 11:23:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 2/9] irqchip: Add RISC-V incoming MSI controller early
 driver
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
References: <20240307140307.646078-1-apatel@ventanamicro.com>
 <20240307140307.646078-3-apatel@ventanamicro.com>
Content-Language: en-US
From: Eric Cheng <eric.cheng.linux@gmail.com>
In-Reply-To: <20240307140307.646078-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_202330_737382_C95E160C 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/7/2024 10:03 PM, Anup Patel wrote:

> +static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
> +				     struct imsic_global_config *global,
> +				     u32 *nr_parent_irqs,
> +				     u32 *nr_mmios)
> +{

...

> +	/*
> +	 * Find first bit position of group index.
> +	 * If not specified assumed the default APLIC-IMSIC configuration.
> +	 */
> +	rc = of_property_read_u32(to_of_node(fwnode), "riscv,group-index-shift",
> +				  &global->group_index_shift);
> +	if (rc)
> +		global->group_index_shift = IMSIC_MMIO_PAGE_SHIFT * 2;
> +
> +	/* Find number of interrupt identities */
> +	rc = of_property_read_u32(to_of_node(fwnode), "riscv,num-ids",
> +				  &global->nr_ids);

Will here check if the pass-in interrupt identity number is (multi-64 -1) && 
between [63, 2047]?
Per spec AIA v1.0, Sec. 3.1 Interrupt files and interrupt identities:
"The number of interrupt identities supported by an interrupt file (and hence 
the number of active
bits in each array) is one less than a multiple of 64, and may be a minimum of 
63 and a maximum
of 2047."

> +	if (rc) {
> +		pr_err("%pfwP: number of interrupt identities not found\n", fwnode);
> +		return rc;
> +	}
> +
...



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
