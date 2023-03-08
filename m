Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5223C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 09:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjPS4T2VKI0IrzNLy7bnBghe0cDRwl8u6MfAfd+/5n4=; b=xPGkmndOUTjFRU
	rWyHnvLjAwDBGwCz4cXkT8wOLmA18/FbPjcFAzTcFNRNyp1XbO9gdzpTbneXzEIILm8TBJN7euL+v
	rmae4jZZ4mN1FtYNhkRH9AKVchHc1V5UlBqQZLxL13MKGFNvKZE5AW75ABnGiZv9gH2NdmA9dHeV0
	7QwwAjRE2Yjtg+lnlpLRC7exO9vJdVkINwNVs4BL4VVgG4dxl8PQd3CHvQD3qXSrozTxZt+J461XX
	W7gxzJCTiGqs8ALBd6FUApIsRLf8z48pS7QZc3mW5D4tt4FMEWJ1Oohc0Gn/jRY9g4CijnEsj5UcU
	eClgHSXGWpcm8HICUSxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqJe-004Eo8-BE; Wed, 08 Mar 2023 09:42:34 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqJb-004Emz-QD
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 09:42:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso1696276pjb.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Mar 2023 01:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678268548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WeyXTaxIbnTtJMJY1WVjvmFvuqO6VxWCdTywZ3qjmjc=;
        b=n19N1ItnjPvh9iP26Vx0UZP/KArrNNMG94GZuR8mS/tDTeBG74rDgw9u7y5NSKMAxa
         N8T7/pad1hrGdZPAkFYO8BWjvljobo4Vd4pnJgaFW6hph6NxN9zq13ilOudxDglUgLXh
         fk6nXHin/D4RH1o+SbYagfOu0R4+mVsxr63AMC9VlrhQgZ0nhQEtPW2vnUK79r1ooNYr
         aeIUhoSQXDTY+W7XRR0O/I2FMM2gthmpiiErv/IDsTNyMimqr0eYyuXQdaNnugSRfERa
         HmIM3CFVGZ35HDm7jiGcmQfl4UQ1ugTd96CRoBQIEZUudgFC1g0e2AFr+R10a0Ew3G83
         upFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678268548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeyXTaxIbnTtJMJY1WVjvmFvuqO6VxWCdTywZ3qjmjc=;
        b=VJslpaJcAFG78MeIbp3nHQ1CK9AR8B6NRziThR9p8A6F4VpkH+jho9r9M0/XhyYXzJ
         HSM9EXiBK8iA2jP9Y0IdJJuF3RyKk/gs/ft+Fw2R0VFFhMK0yHhJIdufM7sAvvsnVApR
         TH8a/ik2ptOe0WDTgTxxdCcFoddA6UQRot0fHdOzcTS59AdxSkFhGYZGrOID/rkGb9lZ
         tdLU8oCvAuNZ/mWJKQFIFAzNou5Em9ENp83lU7zVJZYseeiqoYWYNdafJF9dvNGuLz4W
         gs0FAYhNiAyE/sbu4Uacpk2Sbeh0itjost+yFyJWaonPntm9/jdU9xUz594QsxhfI7Ej
         wGMw==
X-Gm-Message-State: AO0yUKX30bZnsJxLHkhYP/lK8X9Q23gCDMrQWSpmaabir25gOmwPHH6N
	ZD2W6tfvL7cVNzXydE3QYDQo8g==
X-Google-Smtp-Source: AK7set8V5GISDP4tsHoQrXeDFegGCmaiNN9OIPiKSFZyFFeqKHd6Ec8vSl5y8GKubvU3UDmDbFUQXQ==
X-Received: by 2002:a05:6a20:8b21:b0:c7:23ad:63eb with SMTP id l33-20020a056a208b2100b000c723ad63ebmr14871284pzh.10.1678268548257;
        Wed, 08 Mar 2023 01:42:28 -0800 (PST)
Received: from sunil-laptop ([49.206.8.117])
        by smtp.gmail.com with ESMTPSA id g5-20020aa78745000000b0058a3d8eab6asm9082552pfo.134.2023.03.08.01.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 01:42:27 -0800 (PST)
Date: Wed, 8 Mar 2023 15:12:18 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 18/20] RISC-V: Add ACPI initialization in setup_arch()
Message-ID: <ZAhYeuCmdYAnanNv@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-19-sunilvl@ventanamicro.com>
 <b38179fe-f1b8-4146-ae22-11e8bbbd500e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b38179fe-f1b8-4146-ae22-11e8bbbd500e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_014231_875450_75E28286 
X-CRM114-Status: GOOD (  23.69  )
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

On Mon, Mar 06, 2023 at 09:17:34PM +0000, Conor Dooley wrote:
> On Fri, Mar 03, 2023 at 07:06:45PM +0530, Sunil V L wrote:
> > Initialize the ACPI core for RISC-V during boot.
> > 
> > ACPI tables and interpreter are initialized based on
> > the information passed from the firmware and the value of
> > the kernel parameter 'acpi'.
> > 
> > With ACPI support added for RISC-V, the kernel parameter 'acpi'
> > is also supported on RISC-V. Hence, update the documentation.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> 
> > +static int __init acpi_fadt_sanity_check(void)
> > +{
> > +	struct acpi_table_header *table;
> > +	struct acpi_table_fadt *fadt;
> > +	acpi_status status;
> > +	int ret = 0;
> > +
> > +	/*
> > +	 * FADT is required on riscv; retrieve it to check its presence
> > +	 * and carry out revision and ACPI HW reduced compliancy tests
> > +	 */
> > +	status = acpi_get_table(ACPI_SIG_FADT, 0, &table);
> > +	if (ACPI_FAILURE(status)) {
> > +		const char *msg = acpi_format_exception(status);
> > +
> > +		pr_err("Failed to get FADT table, %s\n", msg);
> > +		return -ENODEV;
> > +	}
> > +
> > +	fadt = (struct acpi_table_fadt *)table;
> > +
> > +	/*
> > +	 * Revision in table header is the FADT Major revision, and there
> > +	 * is a minor revision of FADT.
> 
> What is the point of this part of the comment? Isn't it obvious from the
> below code that you expect a major and minor revision?
> If feel like you're trying to make a point in it, but the point has been
> lost :/
> 
It just highlights that major and minor revision fields are in two
different places. Let me remove this comment since it is part of the
spec anyway.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
