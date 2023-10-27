Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A957C25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRwls9con7O1sfOW5CKn/Hj+vkA2ifJGQ1r9M71Y/fs=; b=KjxzS688/TRwz6
	V/65rqHudfANKVsbcxcl3EulxlaNskPC2/tv892O8OXII9LGadqqP3ncKsXqsa5rPuVrmQVPIaYne
	fUieV3xcdRBgYLkqyOsbBLoXKbRqVUbQ7c6/iIYH9tDn4NUMbLarJRgx4Lt7BBOHHOgom9r7oOxy7
	atmEBxuD5SgSkc+vp56KU+E8H22WJfQs96tDXpYzhvdryS1anWbQeWwHtFYROee++BvavqKaxwzYa
	SbsWzMyvo4RCVGB/QwFL3V9HPMwAzpl8+xfOuC6hV7/6ABrZ1KMe32WGIK3DSv6MEwaX2BZymUNqW
	n4gzvT7F0tWsC1AwLEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwL20-00GJZz-1q;
	Fri, 27 Oct 2023 11:29:36 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwL1x-00GJYt-2b
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 11:29:35 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-280137f1a1bso247883a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 04:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698406172; x=1699010972; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vI28YtitrNIniIpGPiCXYWH3fIICBsHFcX18SbMwXaI=;
        b=URv2cqqhxoeXBT3k/DKvDcOWQP3U5fDXFKnzULyoqDoSqhk9grhWu4ICgDrN+q11dt
         RYbopTyCfvUX+CduL+9+wqOx2Kk1KE9gxplpJE0Vamy0lyuio5RMJoUvl/7qwDhwCjKJ
         +7lc2e5s1bVUfOlwl2jSJ7242+504/kw6FHNqNOvy9yBmw8fE0uPHxNWfJxHKjsNP4ae
         7svNbkCDm/cwINoeiCcwIItG/rALDPHOZ7VV+SVc44OwFkQZi3/85WM51fnKvdRU3/OP
         iwNq5KKJ6U2gvLNCx337hWdUe1DwgxbrL/To9YuDpHd2ALn9AgRF0vU4mWPa04PJ4T03
         nULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698406172; x=1699010972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vI28YtitrNIniIpGPiCXYWH3fIICBsHFcX18SbMwXaI=;
        b=mPg/KkiPzgSUd2BaBHPKFVJAr4fvIrgkOWo3wu+7YViZ8z+j0lQruPYowjulrMx2vh
         ohMAXKNSt5gKcoG+5knTulvoMa1oYWJfmoN2d+ueY6q+0zPngAkrSMzyojec8F/eb/u9
         PLUcGreHTeoBMbDTtL3gh8l+hA8rGOA/bYYNWX1yzNvuElcxVFAR/4DKTBv/u9oKLGXA
         vmyrvsCKSGBGDDnopoHgWUVnNRS72RRin5cC+KP0Z0a9VXuCX4LedYbN23pQG7i+yxiE
         quEqEjn9JcxVb7btgxU6MQb56hOitQhqt5jCRSo/0IkIZP5D2jPrKR+n1mFDX+Rf76E+
         OxBQ==
X-Gm-Message-State: AOJu0YwnoY19iCDI+PJiQ2ykXYSnmWdqB7o3+gQEOLFWS0U6orPkstVr
	LetXUgoVz9I/8a2HkFdAW9CuVQ==
X-Google-Smtp-Source: AGHT+IG13tL5qlADUCcZnk0Slm9dLAj/0ICfwInuvtA89OSHyk/VCX3hGHfCAQFvPk1ScgHB/OgdWA==
X-Received: by 2002:a17:90b:100b:b0:27d:1051:83c4 with SMTP id gm11-20020a17090b100b00b0027d105183c4mr2196967pjb.12.1698406171798;
        Fri, 27 Oct 2023 04:29:31 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id r65-20020a17090a43c700b0028018af8dc2sm252642pjg.23.2023.10.27.04.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 04:29:31 -0700 (PDT)
Date: Fri, 27 Oct 2023 16:59:19 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [RFC PATCH v2 13/21] irqchip: riscv-intc: Add ACPI support for
 AIA
Message-ID: <ZTufD/InY/gwpE+Q@sunil-laptop>
References: <20231025202344.581132-14-sunilvl@ventanamicro.com>
 <20231026165150.GA1825130@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026165150.GA1825130@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_042933_846977_E92AABCF 
X-CRM114-Status: GOOD (  17.61  )
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

Hi Bjorn,

On Thu, Oct 26, 2023 at 11:51:50AM -0500, Bjorn Helgaas wrote:
> On Thu, Oct 26, 2023 at 01:53:36AM +0530, Sunil V L wrote:
> > The RINTC subtype structure in MADT also has information about other
> > interrupt controllers like MMIO. So, save those information and provide
> > interfaces to retrieve them when required by corresponding drivers.
> 
> > @@ -218,7 +306,19 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
> 
> > +	 * MSI controller (IMSIC) in RISC-V is optional. So, unless
> > +	 * IMSIC is discovered, set system wide MSI support as
> > +	 * unsupported. Once IMSIC is probed, MSI support will be set.
> > +	 */
> > +	pci_no_msi();
> 
> It doesn't seem like we should have to tell the PCI core about
> functionality we *don't* have.
> 
> I would think IMSIC would be detected before enumerating PCI devices
> that might use it, and if we *haven't* found an IMSIC by the time we
> get to pci_register_host_bridge(), would/should we set
> PCI_BUS_FLAGS_NO_MSI there?
>
The check in pci_register_host_bridge() is like below.

if (bridge->msi_domain && !dev_get_msi_domain(&bus->dev) &&
            !pci_host_of_has_msi_map(parent))
                bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;

When there is no IMSIC, bridge->msi_domain is 0 and hence
PCI_BUS_FLAGS_NO_MSI will never be set. Do you recommend to set
PCI_BUS_FLAGS_NO_MSI if bridge->msi_domain is 0? Let me know if I am
missing something.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
