Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D853BCDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TN54gXlY5LRDvF11Dmd30+Eome7r+HZiDo6PXZJdzw=; b=ZaXm98sFWL9fmz
	h5Seeum25S3+GrfL9qPJ0c3H23NlZLXg36WduiPzoXkP67dtTFV64m+X1c/sKPS3EiTMHL7pyIEjE
	yWMKfbNPfh3G8yLXGTDJTuJKsF44SzNy1z7Kxv39Y6gelboL5LHtShqbHoAIFXQf+eUSw1Iseks5M
	2Dv2BrQn86JfuvImx9WKjumyGzFtUzEEb1ArTi/Pbe6RWe4+LA3Ti9pwo3+fCpLgLZwyqaRiOKGjA
	vN7Oy3xwhjQVSTt5xLX1aEwt21iMn76w0dZPOX+UyCheoe8SAh+vUoD3CBkZFgABFx7iAUuBr2apE
	3+LvkP40r3jIgUbVvsQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qur61-006s0N-2j;
	Mon, 23 Oct 2023 09:19:37 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qur5y-006rzU-2H
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 09:19:36 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a6190af24aso485198966b.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 02:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698052765; x=1698657565; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OCckZKiavm/5db1JMZXPnnv3QX7n6P10MPj5nZzGxrk=;
        b=Obfly+b5T4V5vEm8bmx12ADQ9X09rB1jBXsURBkxHHSSXzfFF+M/WGk3kkr4QWmP58
         fmsElmjjW1Dn3h65ELTuHe8wyee5UhNfQtDqvg++pN8JB95/p8bro7LkY5OIK7wV4vPO
         jGUxwoY2jnqv2llf2HkXyjj8XuNrK6nO6aX4mOcclmG0+JUwpmUDLUrFQx+bgpxwsBHq
         0Omw0TAZ34gvX8bn5Ks3DWPIzABWLthlPUCLs8r5ratg3Jei3UqRO/DxUOj8QX6tSZwk
         FneenhkEhd9fKEvstR9hfYRITxp5BX671odG78q268IZOa6JeT8W4B+hQmKLK+/LTtsK
         BtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698052765; x=1698657565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCckZKiavm/5db1JMZXPnnv3QX7n6P10MPj5nZzGxrk=;
        b=VaRd2n77bdVUmJPfCCrR76Qg696t6CIJWwU1UUn4mKZLDmiLRCxDlRVcUFEM0mfeeC
         Nu/8AfBeAQszBwayoGX1bVjcx/ySA28WI7eNzOQQY5BgGr9e1N7010Hj1CjT2/qncfdo
         R9exsllpVPKfva7kGDGTaHr4IDWP779gIo2RzpQfayGyHFMW/7iQxfnYYvgwuxoYs8Y5
         kAf0Y3VERHEkDU7XVmpmJqNfHG4CdRsncrlbKlhmf+oGMU7kYWOP62ffMXXez8pVbR3u
         4IFonci9M30zjaM7BPw4qdRTDd2wZtaqfmb3SvLrPIMYSTQqO7KoOspmL5iu4VhbGujT
         dzeA==
X-Gm-Message-State: AOJu0Yzhely77V7OvxzKtCX+2K0lNpfzPDedKozj0ANLNcnLWfPVIylw
	3AzNFvptO7yO486Qr3tCv3KPUg==
X-Google-Smtp-Source: AGHT+IEYZ8FmgAtBUAoMw3wuvGj5PvX10JDPD6nRYIzq2tWu0Sl4uMwKk6kB0eX+9TR+4Lkx8Im9Ig==
X-Received: by 2002:a17:907:d86:b0:9be:b7da:72d6 with SMTP id go6-20020a1709070d8600b009beb7da72d6mr7079390ejc.63.1698052764885;
        Mon, 23 Oct 2023 02:19:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y29-20020a170906519d00b009adc5802d08sm6411655ejk.190.2023.10.23.02.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:19:24 -0700 (PDT)
Date: Mon, 23 Oct 2023 11:19:23 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] riscv: Script to autogenerate instruction handling code
Message-ID: <20231023-aa3f789ccb483afbbdd55b38@orel>
References: <ZRD8RzBeA2RMrcki@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZRD8RzBeA2RMrcki@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_021934_747788_BF11EFDF 
X-CRM114-Status: GOOD (  29.05  )
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

On Sun, Sep 24, 2023 at 08:19:35PM -0700, Charlie Jenkins wrote:
> I have heeded Andrew Jones' advice and written a script to generate the
> instruction handling code. It is still in development, but currently
> lives on a fork of riscv-opcodes [1]. I am interested if what I have
> produced so far is in line with what people would want to see.

Hi Charlie,

Sorry for my slow response. I'm glad to see that we're going in a
direction where we generate these functions and reuse an existing
generator to do it.

> 
> An insn.h file can be generated by running the following in the repo:
> 
> make
> python3 parse_linux.py instr_dict.yaml insn.h opcodes_config variable_field_data.yaml
> 
> I have pushed the generated files to the repo so people do not need to
> run the script.

I couldn't find the generated files, not even [3] from your references
seems to be present.

> 
> Each instruction has "variable fields" such as registers and immediates.
> For each variable field that appears in any provided instruction 3 functions
> are provided: extract a variable field from an instruction, insert a value into
> a variable field of an instruction, update a value into a variable field of an
> instruction. Update first clears the previous value of the variable field of the
> instruction. Then for each instruction, the script generates a function to check if an
> arbitrary 32-bit value matches the given instruction, and a function to
> generate the binary for the instruction given the required variable
> fields.
> 
> I was able to use riscv-opcodes to parse the instruction files, but
> needed to create a new data structure in variable_field_data.py [2] which
> holds the positioning of immediates inside of an instruction.
> 
> I envision that opcodes_config [3] would live inside of the kernel alongside
> a simple script to call riscv-opcodes (that resides somewhere in the
> user's file system) with appropriate parameters. When somebody wants to
> add a new instruction, they can add an instruction to opcodes_config,
> run the script, and commit the resulting generated file.

That sounds good to me. (They may hand craft the functions for a single
instruction too, by just using the other functions as templates, but even
if the script isn't used all the time in the future, the initial
conversion of many instructions makes it worth while, IMO.)

> 
> If this script is in a direction that people like, I will continue to
> fix up the issues in it and try to get it upstreamed to riscv-opcodes
> before I send a kernel patch.

Please send me a pointer to opcodes_config and insn.h. Also, since you're
extending riscv-opcodes with variable_field_data.py, have you found a way
to verify that all the immediate offsets are correct? Or were the offsets
extracted from the spec/tool directly somehow? I.e. was
variable_field_data.py mostly generated itself?

Thanks,
drew

> 
> - Charlie
> 
> [1] https://github.com/charlie-rivos/riscv-opcodes/tree/linux_parsing
> [2] https://github.com/charlie-rivos/riscv-opcodes/blob/linux_parsing/variable_field_data.py
> [3] https://github.com/charlie-rivos/riscv-opcodes/blob/linux_parsing/opcodes_config

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
