Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0263C28B2F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DG2PMWHOiw+t5mesXyLs0bpc7OqzendbWeXYeAxp7s=; b=lNjoOVRVwadTCx
	XdN9R5tdiytvu+DcN2FhuWVYKWhOQQ1kZSzGQPdbHSThFELudELY/5eLnRykuUJsRIn0OZn5QgyD0
	nc7AVEsWCHvFVUNFXP+b7P2L9h7t9wu9o++7T1jVhzJogWUTmF0tQZQydtw5wsC1L0ocwHBYwPFF2
	6C59zfxuu08kcgzzqkWfhE+L7xjskiqbK8sRWxEKrb09c3+MFURiBEMvn+H+X602p+/yqyPSMXn34
	dNMLcY/PIHSzkiZlpv17kMFnWBeaZU1uQUOC1HxjojZDUIMCaH6fkqhgYuft6pHYoSQrQfdSEwL3G
	lGsWDxfZQjeOlswqbbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMXY-00000008cvE-1DyV;
	Wed, 12 Mar 2025 13:54:32 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMKA-00000008b5Z-0aIX
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 13:40:43 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6f7031ea11cso69427067b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741786841; x=1742391641; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hhrcmi0xUiqdLtVh1GRjRH+/GSXbagDIYdSQNFjxy8U=;
        b=WR/QKwrGvkMbq+E/FAg2Bd2wFOMYLExjAEwoqrIoJ1I5qQye/QdamUwyHyScJBoELz
         VdF/5kgtskJXz/BYk72zGHv/LbRmVHVzPIZZMpgqtY3rkTEcE+w5qiZB88H7CKdsmhc8
         z7L3TxRLvIpBqFUfPipCPeF1iJU7e8PhrINJnvIr1KAFSKyFbVG4vR6RGIF9cA0PlF47
         CRpFr4X19XlUwn2tFPCrwOlxZdnyNzbloh/J//kRXirLcW9+tS7EmWFidTCS72KAfdzU
         CUm3fsSQ/70AtxehL/cHv4PALI0wv2g842XmjVdtXvzm+KKaclrdk9PdGWgUnbIfhUoi
         qbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741786841; x=1742391641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhrcmi0xUiqdLtVh1GRjRH+/GSXbagDIYdSQNFjxy8U=;
        b=t3D4NhyLdqWF4Objo9QxeqOOkKyaO0ArHRhQzKxoOe1pHSW+kfvewEKy2Rpp8L+wNc
         aobrqOZf8H9VnnMds2zpzol8j8IAsHxgMc48DI/Yab8T8dMN5m5coiUOZwclqQrXSrDF
         6N0PpEN4PCscHMd7vnaTfIFp3x3RpSDzdDts31YeJ1+IOThr99G3FoqZzqtAXEuZ1ZDd
         Q8DcpPNdYw2mmx3r9boB0Sc5TBd8YYJKsKlEjf9v+r3Ea1EvAc1c9u8Z3bzpm1jcto8A
         3+OYLbzvKhbwZsIXeHqb8G5corVrnxZEyByS8xXxjtEfZypxBq2xhVQdj6GYM/7Nqvzm
         dnbw==
X-Forwarded-Encrypted: i=1; AJvYcCUhWzhWd8Tk9AV3iqcQ4IOWVu8kc30hHUsb3Al0VMZ2BFPIB5oLLTaFIXK+xW5122uclAg+q6FskvxcLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxL+HHghKX37o2VcxI+dOqtwcEH32s0dvnJJK5H7uPBIywq4zZO
	o+2bv255smlDJEzsuOsZpsxkIEOCgiEZ5Y/LomfOYKCvGlhCas7xDxRNr2/x5fOxuXJiSilDjQH
	Q/cDgE4IFJ0nx43Ss30kVG3+u8GB5l0Bf47TzWQ==
X-Gm-Gg: ASbGncu+pcL/Mu4o48q5Oqc2kXZNXYbigGwm/HY+TCWPRNlXPOG2y61sH9TlfO6qexN
	ONubuTxt42NhOI9o1bxzP770JfFq0p1wQTNQsF6siMCvvymUWHnwKj54PsMMO9RAgHransplawB
	Qq3kDipyXpaidyo1mRC6i4wdYsHaM=
X-Google-Smtp-Source: AGHT+IFJ9p7pfUX7m1bGpDLYs3TL7z5/+KD/9z9ZtEP9BAG4rG+GTMpPFeCO8lp57V6p2dDYRRGpZH8e4zc4/N9bcM8=
X-Received: by 2002:a05:690c:c01:b0:6fe:abff:cb17 with SMTP id
 00721157ae682-6febf383ea4mr321056757b3.26.1741786841208; Wed, 12 Mar 2025
 06:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250311172030eucas1p12dda42760f751174e774b8d1a3d3f4cd@eucas1p1.samsung.com>
 <20250311171900.1549916-1-m.wilczynski@samsung.com>
In-Reply-To: <20250311171900.1549916-1-m.wilczynski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 14:40:05 +0100
X-Gm-Features: AQ5f1JoLxbwoXOsAUDISdJHHCDW9bcjCEK99ID6-ayNeElpEQf9KOoIgkdPs6Yo
Message-ID: <CAPDyKFqeaq5xVNA=0CpMWSt_78qXJsY6+mpE1CSmLrVMQazAjg@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] TH1520 SoC: Add AON firmware & power-domain support
To: Michal Wilczynski <m.wilczynski@samsung.com>, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, jszhang@kernel.org, m.szyprowski@samsung.com, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_064042_182731_B193FC7B 
X-CRM114-Status: GOOD (  23.60  )
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

On Tue, 11 Mar 2025 at 18:20, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> This patch series introduces and documents power management (PM) support and
> the AON firmware driver for the T-Head TH1520 SoC, as used on the LicheePi 4A
> board. While part of a larger effort to enable the Imagination BXM-4-64 GPU
> upstream, these patches can merge independently.
>
> Bigger series cover letter:
> https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
>
> This series is versioned to maintain continuity with the bigger patchset it is
> a subseries of. Please find below a changelog for the AON & power-domain:

I can pick up patch1 -> patch4 via my pmdomain tree, assuming I can
get an ack from some of the thead-SoC maintainers.

Patch5 is probably better to be routed through the SoC maintainers
tree, but let me know if you prefer me to take this one too.

Kind regards
Uffe


>
> v8:
> - add proper cleanup in the th1520_pd_probe()
> - add "suppress_bind_attrs = true", since there is no need to unbound the driver
>   during runtime. This simplifies the code by eliminating the remove function
>
> v7:
> - add '#include <linux/slab.h", due to kernel robot issue
>
> v6:
> - split the firmware & power-domain patches into a separate series
>
> v5:
> - changed the AON driver to be a set of library functions rather than a
>   standalone driver
>
> v4:
> - added workaround to disable AUDIO power domain to prevent firmware crashes
>
> v3:
>  - consolidated device tree representation by merging aon and power-domain nodes
>    while maintaining separate drivers internally
>  - power-domain driver is now instantiated from within the aon driver
>  - fixed optional module dependencies in Kconfig
>  - added kernel-doc comments for all exported functions
>  - implemented th1520_aon_remove() to properly clean up mailbox channel
>    resources
>
> v2:
>  - introduced a new firmware driver to manage power-related operations.
>  - rewrote the power-domain driver to function alongside the firmware driver.
>    These nodes in the device tree lack direct address spaces, despite
>    representing HW blocks. Control is achieved via firmware protocol messages
>    transmitted through a mailbox to the E902 core.
>  - added new dt-bindings for power and firmware nodes.
>  - ran dtbs_check and dt_binding_check to ensure compliance.
>
> Michal Wilczynski (5):
>   dt-bindings: firmware: thead,th1520: Add support for firmware node
>   firmware: thead: Add AON firmware protocol driver
>   dt-bindings: power: Add TH1520 SoC power domains
>   pmdomain: thead: Add power-domain driver for TH1520
>   riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
>
>  .../bindings/firmware/thead,th1520-aon.yaml   |  53 ++++
>  MAINTAINERS                                   |   5 +
>  arch/riscv/Kconfig.socs                       |   1 +
>  drivers/firmware/Kconfig                      |   9 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/thead,th1520-aon.c           | 248 ++++++++++++++++++
>  drivers/pmdomain/Kconfig                      |   1 +
>  drivers/pmdomain/Makefile                     |   1 +
>  drivers/pmdomain/thead/Kconfig                |  12 +
>  drivers/pmdomain/thead/Makefile               |   2 +
>  drivers/pmdomain/thead/th1520-pm-domains.c    | 218 +++++++++++++++
>  .../dt-bindings/power/thead,th1520-power.h    |  19 ++
>  .../linux/firmware/thead/thead,th1520-aon.h   | 200 ++++++++++++++
>  13 files changed, 770 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
>  create mode 100644 drivers/firmware/thead,th1520-aon.c
>  create mode 100644 drivers/pmdomain/thead/Kconfig
>  create mode 100644 drivers/pmdomain/thead/Makefile
>  create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
>  create mode 100644 include/dt-bindings/power/thead,th1520-power.h
>  create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
