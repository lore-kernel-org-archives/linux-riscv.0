Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C315FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 02:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXGRwszpbrdL7WN6Dg+A084ww63eMOx0uzVCBEuQGGs=; b=KCf7DU2cL24+Cb
	oOsCCQlOh61rnQMzQYlekCwhhFEevV+8D8fzxeOKmcZ2Z/t0jPl79osCLpvyMLVij/Ijp61n/Tc/M
	QMAQLfzYeiM2PidM/lpKJI8UBZrxgg3pegHLi8bTcokl5rNaN9lj6VpU2e0XUeywmhtbGLeLYaOTs
	zy3UAdLxtC/lRKPSRIvVYW6/ajbKoEuPiZf6K7+lq430CE5hiIaA/dUCKehuj6cSpnxstXTBP1+aL
	ssxBqsZBaeZ++NJ77GGDbuo+gOf5Hp84LhOUbJ/CsA+kzH2qNkbepUKEy0b8crjzMEBYdTfLij2l0
	wM5f9FoAHY6G9BsnaUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxe3p-004O9f-0m;
	Tue, 31 Oct 2023 02:00:53 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxe3m-004O8t-2X
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 02:00:52 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-565334377d0so4115763a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 19:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698717647; x=1699322447; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ysFHtwfLEtis2HEwrxQHDKnfNsPImE2g/7GGtzNp+Cs=;
        b=iQNlFbq95vGgT7KImt/rh0dd7GSbC3Wpa+BD5mEZCNnXFFGV8QRaLJg48ScfBcj8VL
         16pbDAz5Kl8EtL4voGk2O6/4B1Guo5FjW8Itii3q9lAQulPiby+HlEaDfx28c3PR5CFT
         Pd9E0lb6+PovjVCn4IHI0at5syI5KFe6MFEboTY8jnMvJ1Jy/2a/hOoMk/n2tNhBfsTj
         pH2ahWm8Z5FKHpuoYwGlX7/ftOZOUvIvAKJgwylKnltQ55oEuWmDjSXfjEvSEFtI7Ysg
         QOQYjjB8NuNZbjWXsppGjgEztrJ+FWk5OAjdGSPDT5n0RoR9w9ludz1o7dlc+Bm2NoQg
         eJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698717647; x=1699322447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysFHtwfLEtis2HEwrxQHDKnfNsPImE2g/7GGtzNp+Cs=;
        b=Mf0z9jMHH78TPQHAza8e/WiTUVZGGoFXCmHccQZEeSabrtK910O8cYN8bWOlYQInjb
         mWay/PVXEwX0u1C/zuiOoNLMMFcVwBIWXWgI/gRg3O+jyP4KzP4q4JQbEB4KKBGP+uXj
         8qYQEujxc3keLTVJNj69fQIJaqeh/g4Ds++uB4z4vNoA7OIXUV7pbnyKVRgvOyi2a4Lr
         k0+aWID+w/YRv7TurbXlrkDLV+tSYSo2+V7aa/siU3uIXUrIaIHgWul7Xu/eUDywmrL1
         ZIKLFw30g+iJDe/kGSOpAl6ii50t9vPX1rTEHYvyv5z/R5+AIXDNPmrrgrQVk3d1fvyX
         kwnw==
X-Gm-Message-State: AOJu0Yyzks1ItIZ6HYS/vlJFBnsMbxpBNStuNYdFwGOliMKSLvQY7JIu
	xOCs8MJAJbX477ZikkWbtjj1lw==
X-Google-Smtp-Source: AGHT+IEf0KaLXQATJy7Y+aQfRDpTBjnOxd6k1XM+fNDmCwu9+0PAZyGarOs4HgtrLS/PIbK2VfXdgQ==
X-Received: by 2002:a05:6a20:a220:b0:17b:e0a3:f6f4 with SMTP id u32-20020a056a20a22000b0017be0a3f6f4mr9170362pzk.25.1698717647083;
        Mon, 30 Oct 2023 19:00:47 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id b17-20020a056a000a9100b006934e7ceb79sm159585pfl.32.2023.10.30.19.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 19:00:46 -0700 (PDT)
Date: Tue, 31 Oct 2023 07:30:35 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Haibo Xu <haibo1.xu@intel.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC PATCH v2 11/21] PCI: MSI: Add helper function to set system
 wide MSI support
Message-ID: <ZUBfw2vrzc+GyAny@sunil-laptop>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
 <20231025202344.581132-12-sunilvl@ventanamicro.com>
 <87a5s0yyje.ffs@tglx>
 <ZT/t0UY5rbudhjfH@sunil-laptop>
 <874ji7zz7a.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <874ji7zz7a.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_190050_827640_10F51A47 
X-CRM114-Status: GOOD (  20.89  )
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

On Mon, Oct 30, 2023 at 08:29:13PM +0100, Thomas Gleixner wrote:
> On Mon, Oct 30 2023 at 23:24, Sunil V. L. wrote:
> > On Mon, Oct 30, 2023 at 03:28:53PM +0100, Thomas Gleixner wrote:
> > Just noting related discussion :
> > https://www.spinics.net/lists/linux-serial/msg57616.html
> >
> > The MSI controller on RISC-V (IMSIC) is optional for the platform. So,
> > when by default pci_msi_enable = 1 and the MSI controller is not
> > discovered, we get stack trace like below.
> 
> <SNIP>
> 
> > So, what I did was, by default call pci_no_msi() to disable MSI and then
> > call pci_set_msi() to enable when MSI controller is probed.
> 
> Your taste sensors should have gone out of range ...
> 
> > But I think Bjorn's suggestion to depend on PCI_BUS_FLAGS_NO_MSI may be
> > better idea. In that case, we need to set bridge->msi_domain to true in
> > pci_create_root_bus(). Let me know what do you prefer or if I am
> > completely missing something here.
> 
> That's definitely more sensible, but as I said in the other thread, Marc
> is the one who did the PCI core/bridge setup magic and he is definitely
> in a better position to answer that bridge->msi_domain question.
> 
Thanks!. It looks like Marc introduced bridge->msi_domain in [1] for
exactly the same problem we have with RISC-V + ACPI. Let me remove this
hack and do similar to pci_host_common_probe() in next revision unless I
get objections to that approach.

Sorry, somehow my script didn't copy Marc in the series. Will make sure
I copy him explicitly in next revision.

[1] - https://lore.kernel.org/all/20210330151145.997953-12-maz@kernel.org/

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
