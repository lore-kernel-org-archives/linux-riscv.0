Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CA1C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UNwR1BFOhdUSFqBxcNo5RFNiMx92O1vbaEIxjVqD0Q=; b=IMn4MI1oMzEgGd
	NSMHBDw+FT+ZwbowWWeobk/cg0TUEBTH2X2/hOBEIHznHHlfUtjAaG7aqV/HYIJ/ythZzTiCzefJO
	dxwANor85c4Dc3iDb70YNmwNl0a6R1jp/SbHPsTIr/k9pcGDqwtVd09MT7eltK2j6ojURFI2RG8FW
	gy4BYAZxP377fHir9opJBczMqUvmwsga7ci1xh4WirlwspXB3j0PnhSCo2VTKSJ5zS8yDfybCzvq5
	81XU1B+Sn7ty2lyWygPryYWN3TqXvFioIhk7z+6iGS5qlw27W0qy7E4dfH/FyYbOOQJLBcNJMDlEk
	N+jvinLC6m4GIfVmqJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZJt-002ncg-2p; Fri, 24 Feb 2023 14:45:09 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZJp-002nbd-Rb
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 14:45:07 +0000
Received: by mail-pj1-x102b.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so3115902pjb.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 06:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=coTtLh17Jcp/i0fKluv9ugDwM4AesfTvM9iAIYJCq2A=;
        b=f3JP3IfXZFoWmGVI+4aC5ZR6KytWd3/IEHl8NQy66xo+fh0HIm6MxedamJlxa8lmAl
         fPZCJigIQoFapyXsf34PLbN35QvacCathImrfrvcSwCQu3H/mXdgGvsKKvIDS7GxJcSI
         K4hISq8h9SDFlloVloSQcmKNkcY3+ahaPqbJwxZNGSgsfIqmdjIGe9ovGg8Py222kmjl
         zyvSr5nhPsrS30yHyQgAGQ2XxxjJy8kB1k2F4U86BXsVCd3c4kUCL0G4lrFkSklq3c25
         OyvtfK3ObB4PhLcCUuu+YrSO5foxebwWaxQ3UrcvkXuH8tl7RDskoyYWD/uNdmXFNdWG
         fp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coTtLh17Jcp/i0fKluv9ugDwM4AesfTvM9iAIYJCq2A=;
        b=seg3/3JLCBJWNtp5CM76ffkMef0+VSy5kVjeBka7TQe1L0JODTS1IK2D0XgYHlC4Dj
         0yUOeDBdNeipe/MuZeU3lCsWhYgVycvIO9wLWTGfCf2zxaishhcUK71BE3X13fJmEWyC
         wyoWFhq+PSdl7aNCNjHpTbGerdXuauCdz7VehTTlRHVIg/P5H3YCCP7cCVq2Ga+NZigm
         u9QrmuVAXXOrzuShgIV8Ghtu7YQ4kAW69NVqBjcPlw1PtVar7lnbAneX7C70zcR7KoVi
         N8tRgCHYi7eEW+Iq8aGbQ3hQUuC55t8y3ZVJqw2hUwryBoQi2c8HKKPrTlCCPLlUHq7j
         nGGw==
X-Gm-Message-State: AO0yUKWIE/ohMYlN5S5fpkZpsVjfkxlY4naRrgPsMBi2fhyp8XRuWW7S
	5RBnPxvMig1dry5jYST5gTF96A==
X-Google-Smtp-Source: AK7set/Iyjj7TrMe766Iwdl0u/OZcVJHX4ug1aHv9t/gLxoHo1hy6D3fQY4QTXwCFZqVNjl7iJMV7g==
X-Received: by 2002:a17:90b:38c7:b0:234:a88e:d67e with SMTP id nn7-20020a17090b38c700b00234a88ed67emr17691751pjb.34.1677249904318;
        Fri, 24 Feb 2023 06:45:04 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9103967pls.251.2023.02.24.06.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 06:45:04 -0800 (PST)
Date: Fri, 24 Feb 2023 20:14:54 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 18/21] RISC-V: Add ACPI initialization in setup_arch()
Message-ID: <Y/jNZg5k1UZ26i1X@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-19-sunilvl@ventanamicro.com>
 <20230220200743.rev3djzbaa2jcmg6@orel>
 <Y/ivRjQbIna7M4R2@sunil-laptop>
 <20230224130712.c42ob66ux5xhffbm@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230224130712.c42ob66ux5xhffbm@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_064505_917715_6D75BA0B 
X-CRM114-Status: GOOD (  19.92  )
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

On Fri, Feb 24, 2023 at 02:07:12PM +0100, Andrew Jones wrote:
> On Fri, Feb 24, 2023 at 06:06:22PM +0530, Sunil V L wrote:
> > On Mon, Feb 20, 2023 at 09:07:43PM +0100, Andrew Jones wrote:
> > > On Thu, Feb 16, 2023 at 11:50:40PM +0530, Sunil V L wrote:
> ...
> > > > +	fadt = (struct acpi_table_fadt *)table;
> > > > +
> > > > +	if (!(fadt->flags & ACPI_FADT_HW_REDUCED)) {
> > > 
> > > Do we also need to check for ACPI version 5.0+ when checking for HW
> > > reduced?
> > > 
> > We need to add version check of FADT once spec is released. Will
> > update it at that time.
> > 
> 
> I was thinking we need the version check already just for the flag.
> The spec has a footnote that says
> 
> "The description of HW_REDUCED_ACPI provided here applies to ACPI
>  specifications 5.0 and later"
> 
> It doesn't really matter in practice since no RISC-V machines can
> boot with ACPI less than a version that support the new RISC-V
> tables... But I'd rather we either document that fact, or just do
> the check.
> 
Okay Let me add the current FADT version of 6.5 which for sure
supports HW_REDUCED flag. When the spec gets released, we can update with
actual revision we need for RISC-V.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
