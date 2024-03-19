Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87942C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 02:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPF2u5pRVAVMgTOan40FRt2VP+oj2JDSiqFKF8QM8oA=; b=AC0h/EZK/4/WiV
	2yX/Mq6zLYJasnEyJsbWcnlXt8n7SDsLjjJ/n2Va6odOEI2a+rSUKQxgZnfBGJDGU9z2qNGpNJ8P8
	WDLYzKlQW4IFs5RddD/xxd7cJ6bTreog7cfxUd8QkYhd6L1A2s8C8AHgDYmQ40To9h7F+bkPimxI5
	blUVTysBkpvcz2Y54SWOeSw5NdSEf0YrJwOj76PqzfHw3vZoQl/06BZVCKHmBfCT9rRyDjWebtPlV
	NbvurTruH3dT0gDTbkOYfl6iJOzgnCNhOzv6I9t5DrEvdFBkIr19LZZKtwc9kuTS9pKwTxa7ch2n+
	+9BbaUXAC0dwIg9eUIjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmPCb-0000000Av49-1FQm;
	Tue, 19 Mar 2024 02:27:45 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmPCV-0000000Av3J-3hs7
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 02:27:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1dee5ef2a7bso33554025ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 19:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1710815258; x=1711420058; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5aSzY2VJWDittzpsS5JFj/mmLGexq9XYEbkvVBzvnJA=;
        b=Q5qOFzZzLa1a1wLxtnlKxbrzyb2p7O1/tySfEq007APxd1noSLg7D/OQn21HjxCJb9
         BN6Cjk3sDDhMNwLBI7vzbPGlakehDC43u6PgOlGxe8KGcD58S2kOp/4Nj7pyriftYDtY
         qno0Vcm/zL9+/Bzd/9/MB+Ndgx3Dapm2TLLFL3lmEBvHXSXvpAtqBnrF5IZ+rYYWduXA
         MjjS9gigELx1KExeHjxWa7YONg9WDuQgCQsC6C43oGJB2IcKcGNg9YbixMuvs/Kt0NP4
         JlQpbWAzqynTlc8gIvzUzytwWfJd5xk/giXgnUdQ0CrXEGhkgovXBSQYLSTqsmh2sNCW
         UCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710815258; x=1711420058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aSzY2VJWDittzpsS5JFj/mmLGexq9XYEbkvVBzvnJA=;
        b=plq/FSRiFNU+KhCmlv8H4o0aMGqJvMEMv0xgT1LZ+kha6jBOZ/QO2b0T84gyFJUaq6
         fIfWJgCZMs+iTdyGEtW0aE7wZ5sbYNByvoNkf6dLR0+HdNKpW5RDTjJARqKL3IhH2wV3
         jYZ/KU/TsJhK3Z7VMOocR0868LXXQdSv5AmvR9JuQN2Km2hSlH7A5jGf80K6eQVfiS2V
         RXzxmTei2Xla2c9gC6h1YjLldfXw6S14MINLNJGcfXm8Y0vE61igWR+VMTW3zf0pmNpv
         FFn7xqqVrjZtKXIi78qLo5/Rukw+59iq2WOQkN1oEJfmL7W2ESuGv+UTbOHzjDc08IXv
         xYGQ==
X-Gm-Message-State: AOJu0YxtBj1Hua+EJyQmXrMEnuo2dLAcSjiaHnM6hPlbv7NYW7Sp6FMd
	Sfu2A2D7oV6Ft/sNgJLUFZHl8CyU2ZF24XNIVAkjQa0hSgsRwFVxpoQ9Z6eVeoo=
X-Google-Smtp-Source: AGHT+IFn1GD8CcESCvZXxz6GgRez+vUiJL1aI027U4ZrLO0sqXw9+T+YegJmcdj3OkfCqIw1NPTw+w==
X-Received: by 2002:a17:902:ce81:b0:1dd:a8e2:60a4 with SMTP id f1-20020a170902ce8100b001dda8e260a4mr17768006plg.42.1710815257730;
        Mon, 18 Mar 2024 19:27:37 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:a790:ca87:56ba:58b7:a676])
        by smtp.gmail.com with ESMTPSA id t5-20020a170902e84500b001e02d9c05d8sm2323576plg.103.2024.03.18.19.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 19:27:36 -0700 (PDT)
Date: Mon, 18 Mar 2024 19:27:34 -0700
From: Drew Fustini <drew@pdp7.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq
 support
Message-ID: <Zfj4FnG5vAPP55ri@x1>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
 <ZfiKooxO88h1nj35@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZfiKooxO88h1nj35@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_192740_172711_FE5F38B6 
X-CRM114-Status: GOOD (  16.48  )
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

On Mon, Mar 18, 2024 at 11:40:34AM -0700, Drew Fustini wrote:
> On Thu, Feb 08, 2024 at 09:14:11AM +0530, Sunil V L wrote:
> > This series enables the support for "Collaborative Processor Performance
> > Control (CPPC) on ACPI based RISC-V platforms. It depends on the
> > encoding of CPPC registers as defined in RISC-V FFH spec [2].
> > 
> > CPPC is described in the ACPI spec [1]. RISC-V FFH spec required to
> > enable this, is available at [2].
> > 
> > [1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#collaborative-processor-performance-control
> > [2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v1.0.0/riscv-ffh.pdf
> > 
> > The series is based on the LPI support series.
> > Based-on: 20240118062930.245937-1-sunilvl@ventanamicro.com
> > (https://lore.kernel.org/lkml/20240118062930.245937-1-sunilvl@ventanamicro.com/)
> 
> Should the https://github.com/vlsunil/qemu/tree/lpi_exp branch also be
> used for this CPPC series too?

I noticed the ventanamicro qemu repo has a dev-upstream branch [1] which
contains 4bb6ba4d0fb9 ("riscv/virt: acpi: Enable CPPC - _CPC and _PSD").
I've built that but I still see 'SBI CPPC extension NOT detected!!' in
the Linux boot log.

I'm using upstream opensbi. It seems that sbi_cppc_probe() fails because
cppc_dev is not set. Nothing in the upstream opensbi repo seems to call
sbi_cppc_set_device(), so I am uncertain how it is possible for it to
work. Is there an opensbi branch I should be using?

Thanks,
Drew

[1] https://github.com/ventanamicro/qemu/tree/dev-upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
