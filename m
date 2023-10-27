Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6233FC25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrXAl3zxWezVE6SXZ2thMFp37OfkzpdAVz44rSaGfCU=; b=V1KC3CPJWBGmFm
	MnAzV980uO/dVHg1dZlURdq/vS4F78cPB8CrrJ+ZzEpt8yHrbPxGlwhEBxKkugjhGPCWY1eo26B29
	wUk05DgjGmwgjpW3kgODoc23rOd1zeDv5eSIgqeGcvzsiBk1rK2kr7ZsgE2Arv6lzsJha+V/6EB4h
	No183Ucn0US383CdcFtQoi2VbDmBnrFj7J9POjDz9om/NF0ZSDvlvEUH6nafVCbzcSDd2VfPrihvC
	/Ka0URc9OuZuCPNgWGqYh4F0Um8Qy5SAoCRWHp9E/Rk0wiG9vAoCN2mjOzgMlWzpBSY43gagjrwMG
	EJb0z17HF1hLEnBQhGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwLQj-00GKxD-2E;
	Fri, 27 Oct 2023 11:55:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwLQh-00GKw0-1N
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 11:55:08 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ca052ec63bso17598665ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698407703; x=1699012503; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e5FujhKIaH/uwx0lIrEstVD0nII/dzmNIeNJ8ebqYu0=;
        b=nKXs9uUQeqkQk+KxuTjXkdSnYzxZfjmsnEKB86ITdo8Iykwcwp8BC1DrJaHCKpdI4j
         AzLVNysx3Ge+R3Gn/FON7Hz6UzI7bHEoL6goVTto2YMEC3wVjOfUAMMSKevYTDRGk00w
         /App5n6dT+86/h4XXVG3XgK+sVpg+OOmD4YRsQ6FXEq+vhALJCRtdmfaXjiquO7u9FAf
         mkA8ybIbrIMQvXYirXW6eWPpfxxxzGWWiBrQm5FV/12iwOp+dKwDlg1okXfbP72Lm1/6
         KdruLjEHKKI08WMiNazRUPkL2i7Xwt79r4RKsnM68tWn3jaEWx+2TMBkk/FXUwWRCdE6
         HZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698407703; x=1699012503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5FujhKIaH/uwx0lIrEstVD0nII/dzmNIeNJ8ebqYu0=;
        b=GdD2mcewBpQC24iEtJx5H3S1G8pc0SeyXK00l1HFryznKtV36XCcbsSDifLMkgmiBQ
         PdvgRgQ6rU9GdRdEimA0uZKUjZJvFCnSloM6J23cuc0E5jj2dDMjTu8rJYx39BLzYEqi
         U6dqUCII3P/4xW46TE9T/38qGbE4pn/RF+K35ZYxxktRXKNICPhNzdb72bUpLDxz7Pv6
         GXPFwVBIo42dOcj1pBK1KFXrSnpD9YL6JDv/EFKuKUeXCzjVqjC8wYVSD26nDWsGSo88
         xqMB1lgVNovVfAk9wVye1lzpmq3lp6xcc5vN1ciTJISSjhxEoh1YOqCGq14H9DeXVmNY
         HQUA==
X-Gm-Message-State: AOJu0YyPLHt1l3LgjIgxokz4ybo+BqxUCkQYijlNosi1ihTKYDujp1KG
	IGUkGeRvrrjszXAZXpdwfbwN3A==
X-Google-Smtp-Source: AGHT+IHUO3uODEbp/2xpVvuNkWZLUzFgyUmu6ctAkgCEdcwdjl1R6oJFy7lgIUS+r693E6SqK+uHMg==
X-Received: by 2002:a17:902:cf41:b0:1ca:7086:60f7 with SMTP id e1-20020a170902cf4100b001ca708660f7mr3256113plg.28.1698407703704;
        Fri, 27 Oct 2023 04:55:03 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902684c00b001b9f032bb3dsm1424132pln.3.2023.10.27.04.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 04:55:03 -0700 (PDT)
Date: Fri, 27 Oct 2023 17:24:51 +0530
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
Message-ID: <ZTulC3tUuTm92/Li@sunil-laptop>
References: <20231025202344.581132-14-sunilvl@ventanamicro.com>
 <20231026165150.GA1825130@bhelgaas>
 <ZTufD/InY/gwpE+Q@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZTufD/InY/gwpE+Q@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_045507_465559_C668F56C 
X-CRM114-Status: GOOD (  22.33  )
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

On Fri, Oct 27, 2023 at 04:59:31PM +0530, Sunil V L wrote:
> Hi Bjorn,
> 
> On Thu, Oct 26, 2023 at 11:51:50AM -0500, Bjorn Helgaas wrote:
> > On Thu, Oct 26, 2023 at 01:53:36AM +0530, Sunil V L wrote:
> > > The RINTC subtype structure in MADT also has information about other
> > > interrupt controllers like MMIO. So, save those information and provide
> > > interfaces to retrieve them when required by corresponding drivers.
> > 
> > > @@ -218,7 +306,19 @@ static int __init riscv_intc_acpi_init(union acpi_subtable_headers *header,
> > 
> > > +	 * MSI controller (IMSIC) in RISC-V is optional. So, unless
> > > +	 * IMSIC is discovered, set system wide MSI support as
> > > +	 * unsupported. Once IMSIC is probed, MSI support will be set.
> > > +	 */
> > > +	pci_no_msi();
> > 
> > It doesn't seem like we should have to tell the PCI core about
> > functionality we *don't* have.
> > 
> > I would think IMSIC would be detected before enumerating PCI devices
> > that might use it, and if we *haven't* found an IMSIC by the time we
> > get to pci_register_host_bridge(), would/should we set
> > PCI_BUS_FLAGS_NO_MSI there?
> >
> The check in pci_register_host_bridge() is like below.
> 
> if (bridge->msi_domain && !dev_get_msi_domain(&bus->dev) &&
>             !pci_host_of_has_msi_map(parent))
>                 bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
> 
> When there is no IMSIC, bridge->msi_domain is 0 and hence
> PCI_BUS_FLAGS_NO_MSI will never be set. Do you recommend to set
> PCI_BUS_FLAGS_NO_MSI if bridge->msi_domain is 0? Let me know if I am
> missing something.
> 
What seems to work is, setting bridge->msi_domain = true in
pci_create_root_bus() similar to how pci_host_common_probe() sets for OF
framework. Would that be better solution?

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
