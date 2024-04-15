Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0241BC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 15:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rmaNvT8yOh9itV0qpByb2W9kDqYKinrv1LOE3RJvO8=; b=zE46fAuLd9mFZ9
	AnNW+aqSf0HLwXXi2AMnSNlaLFalA0kZSdy78W+Zt57+lpRaF+uJsTHwA0nP/6C/CgHOAoVgYkouF
	4xUZSuwpY8x4xNJTvjeQXyFg2+vZuOO8iv57R2jihdwE4O7HpAR8rw/8Yfi4lJS0aGUVXvBlSkszJ
	nu7hW5oEbomcTzocpENJ/ztNx/n+UMi0EUVZLzQk1PLl1XJOG+0et9DaWzFAY3G8hiY9HjUvUPww6
	krcssYYQvACfzjhdZvyJdK1/DTWPFdAAilnKocHjlgDmZddeRGVbVqE7Rgc00RqcMoGJdFKNAjPVK
	gHjglg0Qvr5hKi3qRtTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwO6m-00000008rHh-1vNq;
	Mon, 15 Apr 2024 15:19:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwO6j-00000008rGJ-1k6x;
	Mon, 15 Apr 2024 15:18:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2166B60EA5;
	Mon, 15 Apr 2024 15:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE42C113CC;
	Mon, 15 Apr 2024 15:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713194335;
	bh=agH1QFbrpHLd4P7Yhw6r5jXXFiQAUi7FPPp4+GhP0bY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DSVNw0UbFKxqoh2GEeK2HFHJyJaffLDLaHegX9E0tRzDkcePRAfy75AwnWChVDgZT
	 tDzvva7dTej6Tm0ATOWRsJHyaFxiBW0EXF2fIlJjGvxgwObBswZXbuEw5tdcbSjnAi
	 1Bdd1IdsNwOokSkMsPVf1UG7knfcqxvJfZZoONtjROKCEvnUuAkMc0wnw3abXZM2rX
	 UlvEh8+8SCN9gcjEpBD8JTtINQK9BTt2rBuQ46FB4AYWvAtHFH08YlPgOlexC0VS5n
	 ymP5StPKDDBl3AtYd5gCZNDxZ8YcZzvtD3JL+Yy4ePX8SfL0IqS3aTY4aESA9cfDar
	 vQlhS7Li0bjwA==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5aa327a5514so579654eaf.0;
        Mon, 15 Apr 2024 08:18:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaArMB3HebcoINUwc+mhnPDgEY5k3UMKD49LY87O7sjqKXdUM79C33jI9ANda++iOiKKpYE8+q763ZynK6ogjiiP1WHMUD/Jx0G9REYLFbjhFKRb3iYYgVPbKcOLfFNw1OBUD20d+M13xsmGF70YNW/8lkoTo=
X-Gm-Message-State: AOJu0YwUUI1G0+qo/nhV+6kbrd0SQxhXeFiCx/yVOzpD3esgyGaFfZpr
	aTqLnSBOyHayP7N8zwxqEUqhOGJdzuhy4kKhIEgizIw7uppI3OaVXVPujCXtBxI3Ei45dJ6ZRoA
	lARXUNaiC3qhftGQw4rh6TgLW+6Y=
X-Google-Smtp-Source: AGHT+IHNTzq4Yb0TKkeCmMYOKrAxQ+jbCXApmkiq1lJmh5rmpBwPeGhF5p/B9EzrmQ4sIfC+uclrpB01Ll6n/qIAs6g=
X-Received: by 2002:a05:6871:460a:b0:22e:d06b:5d8f with SMTP id
 nf10-20020a056871460a00b0022ed06b5d8fmr11682662oab.3.1713194335221; Mon, 15
 Apr 2024 08:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
 <CAJZ5v0j6Veze8xDFKTbVZ5=WAfmLdeJ8NXRnh9kwCZgyaDdgew@mail.gmail.com>
 <ZbiQ/tO/odnJCBD1@sunil-laptop> <CAJZ5v0gnH0uPEM0q9VzJOg2Z_7bOP9XdQbOttpRtnkLGej45Sw@mail.gmail.com>
 <Zh1DP8YnjPlie4+S@sunil-laptop>
In-Reply-To: <Zh1DP8YnjPlie4+S@sunil-laptop>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 15 Apr 2024 17:18:44 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0icHu1hv_DQDRFh54nD8gde8CfQUERAO=dyasnfp5qO-g@mail.gmail.com>
Message-ID: <CAJZ5v0icHu1hv_DQDRFh54nD8gde8CfQUERAO=dyasnfp5qO-g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/17] RISC-V: ACPI: Add external interrupt
 controller support
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Bjorn Helgaas <bhelgaas@google.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_081857_660130_2E6C582D 
X-CRM114-Status: GOOD (  14.11  )
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

Hi,

[cut]

> >
> Hi Rafael,
>
> I found that _DEP is better than fw_devlink for ACPI since it works
> during scan itself. For ex: the way PCI host bridges are scanned in
> ACPI, PNP device handling. While some hacky solution could be done like
> I did in v3 (pnp_irq() changes), _DEP way seems much better.
>
> So, we decided to go with your suggested approach and defined namespace
> devices for PLIC and APLIC required to create dependency mechanism.
> However, there are concerns that every device will have to add _DEP now
> and whether it is intended for this use case. Also, actually the
> dependency is already available in the form of GSI number mapping.
> Hence, instead of explicit dependency, we would like to create implicit
> dependency. So, I will send RFC v4 series with those changes. Please
> help us with feedback. If you could provide quick high level go/no-go,
> that will help us a lot since we need to finalize the spec whether to
> mandate _DEP or not.
>
> I request you to provide some high level feedback in the RFC v4 I am
> going to send.

I will, thank you!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
