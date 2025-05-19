Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257DCC3ABD8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 11:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRMpyQMALUibv5C6vaHmXcCbL0kI3lAkwod9KhqfUiw=; b=JWWxeHcqIiyQ5j
	gZ+xroXyNFFCOmVJPZyqz8AXIGMXWtefyfhPMQhY0QNTAsdfPHDe9P/khu1XasQMrm30t/dJWYj/3
	c9zpBzTZBZRvILlFIkBqcZ7gi1WoRERD3TFrCO0XGJrUJo+DEDtBXxSpTIKcjfrkipaVNjS5zD6lC
	YbzP4vDlEniajfTuhPwvgKidAkVrFSheIzx3rWTgNMQEgmm/yFoUXY4zZrAhZMMfq/iNpehgeuabL
	GYpqsw3aNyA2zvcCY2agHgVEsVWvHfwRK0bDUafuGgEM0KgzPxy2XM9f1oRyNYF2aLS/bw1mFBVCm
	zLSNl8pfFHmZGnpOq5fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyv2-000000092wQ-1g68;
	Mon, 19 May 2025 11:44:32 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyuU-000000092q8-32Wc
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 11:44:00 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6f8c0c8da93so38513786d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 May 2025 04:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747655037; x=1748259837; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DdHsq5COThnaz/kT2PepDjGRRqibq5HBjdI+te70JDw=;
        b=ertCrBIYHo60qTvviG17WwqGzo1/i6kFJ9fK2TTx3mmdCwPkMz7D6Cw9lUj0pu+nvf
         qrQAjX1PbhdbAraKV8jLjfczNDjp5Pp9ROK5pNLO3MXmaVBCAIBIP1HCINDvbueqecc9
         GMGoboBdOHbOjhyz1hXDNX8GiCo9hryqjSxvYCGoY1K+cNT2yiVeVi5KWd7ilZfTBqoV
         T4ecBr3GtP6gUEXITDk/3mraFVo+toC19Anm5Xm14lggLIKCDGAdgec2cRzVBRy4ETdN
         Hq7tw1VSXSkvgdZfKvfmc+61RWj9Kt8Ujv9b0cXGttBHRLQSwkoE9xHib9jeX9BE7Gnh
         515w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747655037; x=1748259837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdHsq5COThnaz/kT2PepDjGRRqibq5HBjdI+te70JDw=;
        b=c35ZA8n8FHkJ2YodS/zLeu/gPkuTXnpG3hl8E14MTnE5O+3fQH8A/WlQuXaPanMoi8
         pdslvxz2bUwLMi1+Xy7vEV6GxH+73Jwrxn9t5MbxwRfu8l06uzkN1MYGwj0wBWfqng7d
         Q42NToVzMLF+Ng0xXKDYbY035HmsPNpySN8e6jmPxawUTQfzMsgdrgoB6l3EFzOyqY3A
         oQ/ivoXqhUc7mvhKx+1hW3a6qcv3BKKBKSKxFZpJgHL0dXxzP+wVBk9eXCM/8p8vIwC8
         0xuwDVWassrpCvpwek4ag3F8mQTWA/15wno8CFFy0kTWy2e5XAQuggufzGosyF7mbAVc
         lanA==
X-Forwarded-Encrypted: i=1; AJvYcCXgqAN64T5abuovYr8CLyCfZLf2630Q+f4ru1p+h1NaK0ulvmEPqGRRSlB7Rw+XvMHGewixBVB2YtC6tA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIi4gWD2kHt4y8oWcCFQY7Rr861pj0wdkduw8gtzRFbvLedbF8
	X7KLfYOXZzTiI/coGxX9zrfSxNzzEZa7oI/baue+byZu7m8AlLS3hm2R+2EYz+I+
X-Gm-Gg: ASbGncvjDLEA5dm1Xus6tWR17RmeYHDFtgxZvB/Op+CqItxoaGU1B1MinHTRPbM55+L
	oNU74eWGpbmRbr+J7JzeyuKYP0jiYLLx+vsqTuJymFhXv7hJdVweNdrYGfPehiLkQ58Ood9esaX
	UGTKKi2MKDFuWdMFbbq01CIfZJBEv41jxNSaTAhApF2hRk/BrsmUkt5ybH+zjJYXqUtf2qG0Jy/
	Q9JBBGhdiNdmU2scSKd+KHAJyBELS0e2RVWJOjcxDI35vwVOnvEVVmPrmQqVrqiTGFeF/UaNoL6
	2lWFt6brroFImTZqWYC6WORD8RRPCJKG4gfWqQ==
X-Google-Smtp-Source: AGHT+IHzi+wH4LTGbbgm7Y4TjS58PZ5Nah+7v2/J250yJ8XpMnfpx1miscgVUqmQCndfLGxyKsFvKA==
X-Received: by 2002:a05:6214:2344:b0:6f0:e2d3:66bb with SMTP id 6a1803df08f44-6f8b0887e10mr173576876d6.43.1747655037154;
        Mon, 19 May 2025 04:43:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f8b097a0absm55522516d6.100.2025.05.19.04.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:43:56 -0700 (PDT)
Date: Mon, 19 May 2025 19:43:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Niklas Cassel <cassel@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Shradha Todi <shradha.t@samsung.com>, Thippeswamy Havalige <thippeswamy.havalige@amd.com>, 
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 0/2] riscv: sophgo Add PCIe support to Sophgo SG2044
 SoC
Message-ID: <77tip2z2mmuucsi4ackwubfdbyzgg2soaosmvbyrfl3iwrmmp3@icjunp4bsske>
References: <20250504004420.202685-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250504004420.202685-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_044358_762787_0C0E864F 
X-CRM114-Status: GOOD (  18.51  )
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

On Sun, May 04, 2025 at 08:44:17AM +0800, Inochi Amaoto wrote:
> Sophgo's SG2044 SoC uses Synopsys Designware PCIe core
> to implement RC mode.
> 
> For legacy interrupt, the PCIe controller on SG2044 implement
> its own legacy interrupt controller. For MSI/MSI-X, it use an
> external interrupt controller to handle.
> 
> The external MSI interrupt controller patch can be found on [1].
> As SG2044 needs a mirror change to support the way to send MSI
> message and different irq number.
> 
> [1] https://lore.kernel.org/all/20250413224922.69719-1-inochiama@gmail.com
> 
> Changed from v2:
> - https://lore.kernel.org/all/20250304071239.352486-1-inochiama@gmail.com
> 1. patch 1: remove "|+" for description
> 2. patch 1: apply Rob's tag
> 3. patch 2: remove empty irq_eoi and use handle_level_irq as the right
> 	    irq handle function.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20250221013758.370936-1-inochiama@gmail.com
> 1. patch 1: remove dma-coherent property
> 2. patch 2: remove unused reset
> 3. patch 2: fix Kconfig menu title and reorder the entry
> 4. patch 2: use FIELD_GET/FIELD_PREP to simplify the code.
> 5. patch 2: rename the irq handle function to match the irq_chip name
> 
> Inochi Amaoto (2):
>   dt-bindings: pci: Add Sophgo SG2044 PCIe host
>   PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
> 
>  .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 +++++++++
>  drivers/pci/controller/dwc/Kconfig            |  10 +
>  drivers/pci/controller/dwc/Makefile           |   1 +
>  drivers/pci/controller/dwc/pcie-dw-sophgo.c   | 258 ++++++++++++++++++
>  4 files changed, 391 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
>  create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c
> 
> --
> 2.49.0
> 

It is a long time for this series without any comment, I wonder
that this patch could be picked for 6.16?

Regard,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
