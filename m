Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B98C7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 03:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5YK+N/qu8o2iPq3vxZt+4PMJNiC1QuRXRnSEguBfjo=; b=3f1IqfPu972Wq8
	uevwV3rx4InMyD+Fk7VO22OrhJ0r8ye++dr7xc0ez6/JEz9yrolbm+Ln/YmSUiDeeWD3Xokp1xJe7
	+8UCIymc6eD6HeBkQ6o0LA0ErhfPNVgfetZBzA4CxrpGvHs+s0JbWPLWiYabUJQoMgcy9rsPyHhh0
	Xjutj0DI8AkNYl88uLYCBGhhyd2xdTE6Pm3cri6zbeo49NwmlNL+PYiJw2iojZGMcfO7lP94D30Gw
	OrvO2uLTsPqukUlnTp5dTU5FekEBek7SxRupWnnc1dpXgdcAMU0ZpVhZRF2XXtqC8sxfVxnHCQ40v
	PmwdQFVoPrrMsHjHZoWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5YR-000000019un-0eON;
	Mon, 30 Jun 2025 03:51:39 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW5YM-000000019tU-3mYz
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 03:51:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7490cb9a892so2865799b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jun 2025 20:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751255494; x=1751860294; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UED82EXPvvwcKwvtCpX0i6qazNmJqZIAw5hRVMYvLpc=;
        b=bWVthyZUbo21hqjos4QQTyo45k/kNfokYB46O1IQHNdoCQnIaNN0RHmJnljkthgGci
         hmFNe6E3qNGidIMwknvWcuoTbD4zzrka2Zcjmr9i/fWWt2fAHjlM20lMzcsJestv9Hoj
         CVpBbB2M9NbMfiVmgiSMlS2XCO0JY3lso5VIjdgYv8RnMa4PagFs43kf9DeQeHee/99U
         t0Tf7KnN/wIrUaHHCkfqjR3fxLfBMaWdmtpCBYgcneGp7O7a/wkPwdsgi6j8cU05B+S5
         2Z7glqtNxscl6RtxgpFZDwLL/vs8vv4Lsan2E+6zD8HhSTvOrhqcQBscUCNHEVv2q/lo
         3SUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751255494; x=1751860294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UED82EXPvvwcKwvtCpX0i6qazNmJqZIAw5hRVMYvLpc=;
        b=axmRIOEVuKD/xTY0D6j7LQItFaH15UJjgMlDav5N+BIz+xdmVpcZXTjRUQVxJq1x4y
         DMqIA8wT7nOY3pkvfDJLWHnxGVbe6wuCawgtG3Z0g3RPWxZpOncnM1K3JLG/co/cKI0a
         YZmKIyi4734r+DndcZwp+doS50nfmy+DhiYIBHwpK1yKRzYTBOBVQ9bLFdOw0UQ3z7XD
         JuwUsPVVBygXnsnsHCgmMbItENjMA5CIeIVtEkaJIY+RAaBqFsY24MM053nTUkyb/vKx
         IdNniP3TISdiEuNEVFaXllBg+bpZzR+nrvZhPEDQizdzk7ijzNtaAl64UbPq0thyS+Qd
         n4mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKvXaLBNRoN5sQFNtgn/AoNTJIxmgEg7ouknThdUY3fjHmiy6W/A3Wls2dkAhy5VS2t6nHKChpMx1UfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPu+oNRAIggJJ5vyz2k3PMnX2hAlg4KQVUYh8E+f/C5sNQ90B+
	kTPQRs0u3O0DMU9SktXO0369g6cnEv/1m2JMmP9/bnF+QT2jSw19/nuh0Arw+0qrzjg=
X-Gm-Gg: ASbGncu6kXxkl0lwgUQ+YhtU4A48vTiEirIkQNBRYvixdcVimXuiKKBIpcT+TDHXSQw
	+RXYe6UjrYPcK5aCFjqCeHn/xjDevymQOX+c1YOnYVaLx6OYv1WAGobuZ5a6W6Lj6wjEaENLgt3
	2nLH3Q9gc+uxSoP7A70l3APmT5IE6xZLGaRFgtxhxhkE6eEhEF+RTH44ZmF3r5xYW7Y44uniOl4
	FWB2utojoNKuR0DMD9O9OggvrbdOXZdb1CwcVoUe8ZFUR1JeyYBJhVVsH8VQc6RgsQ1CTzSmfNo
	01U1V0mIps/rxiFA1B31ee/3o7fdRuftEGSTgBZz3CXXQXF7VMTQU+0JTP+VdEzg90X3tQ==
X-Google-Smtp-Source: AGHT+IH50RyHuOnxZl2ccwGVqZn5SetEZq+s0+V/7t4N3nC29VesI3/CLLW5Bs7mTAzZWQEnHHyh/A==
X-Received: by 2002:a05:6a00:1704:b0:749:bc7:1577 with SMTP id d2e1a72fcca58-74af6e6618emr15035867b3a.9.1751255494141;
        Sun, 29 Jun 2025 20:51:34 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557b5c8sm7808043b3a.83.2025.06.29.20.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 20:51:33 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:21:22 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 0/3] RISC-V: Add ACPI support for IOMMU
Message-ID: <aGIJuiSuZs17DSiM@sunil-laptop>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_205134_944192_E8727334 
X-CRM114-Status: GOOD (  15.77  )
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

Hi Tomasz,

Could you please help reviewing this series?

Thanks!
Sunil
On Mon, Jun 30, 2025 at 09:18:00AM +0530, Sunil V L wrote:
> This series adds support for RISC-V IOMMU on ACPI based platforms.
> RISC-V IO Mapping Table (RIMT) is a new static ACPI table [1] introduced
> to communicate IOMMU information to the OS.
> 
> [1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v1.0/rimt-spec.pdf
> 
> Changes since v2:
> 	1) Rebased to 6.16-rc4
> 	2) Removed Anup's SOB and link tags added by mistake in v2.
> 
> Changes since v1:
> 	1) Rebased to v6.16-rc1.
> 	2) Dropped ACPICA patch since it is already available in 6.16-rc1.
> 	3) Added Rafael's ACK.
> 	4) Fixed few issues found by bots.
> 
> 
> Sunil V L (3):
>   ACPI: RISC-V: Add support for RIMT
>   ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
>   iommu/riscv: Add ACPI support
> 
>  MAINTAINERS                          |   1 +
>  arch/riscv/Kconfig                   |   1 +
>  drivers/acpi/Kconfig                 |   4 +
>  drivers/acpi/riscv/Kconfig           |   7 +
>  drivers/acpi/riscv/Makefile          |   1 +
>  drivers/acpi/riscv/init.c            |   2 +
>  drivers/acpi/riscv/init.h            |   1 +
>  drivers/acpi/riscv/rimt.c            | 523 +++++++++++++++++++++++++++
>  drivers/acpi/scan.c                  |   9 +-
>  drivers/iommu/riscv/iommu-platform.c |  17 +-
>  drivers/iommu/riscv/iommu.c          |  10 +
>  include/linux/acpi_rimt.h            |  26 ++
>  12 files changed, 599 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/acpi/riscv/Kconfig
>  create mode 100644 drivers/acpi/riscv/rimt.c
>  create mode 100644 include/linux/acpi_rimt.h
> 
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
