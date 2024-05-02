Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637E7C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkxqqXTJPkQMR5YFKDc9nZ7y+2NctYmkJQf7zhNt9Jk=; b=amCJIspFGE7gjb
	QrnPfY2TMWRhedvGP6g1EIlut95mwtcVoG+knPN84KyksdtWLsibtXKWkcV7GY1tQo5w5Go46gs45
	hctB99K92KLf4MBaoQAGpfoow06HbyLked6QgDGqZfc7ssaQZo/Az7nemn+xXI0gnbM9DFiGRBbjC
	jjSer1m2CghXVgbKChdWO4s17AMq9MOxm7AuVW+/WgtBO2UcSOLKApDi9gcbSzgVcUz+YalGyF3wR
	MNlb3ah33jO9jVJtJimV6/1Xwl6wMnvhKkQ8/lR/8S0tEms1KIckXtVIB4vSavUq7E/iGKiWvYsGs
	2kLV/kxxz+/c8EZXG8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UBg-0000000CRPQ-3IKZ;
	Thu, 02 May 2024 11:01:16 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UBc-0000000CRNi-0Cg3
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 11:01:14 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-61be74097cbso34325157b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 04:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714647670; x=1715252470; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjTLbsaK8lFll8/qZ6Wbe+KOojRpVIeEGiQdgeTUV/M=;
        b=Zt/isbTb3NcGtq8lvlVhC3WUOi4/kC9+NhmcybBdkYLXPBOSLXq2aPEa/8uOCvs9bC
         Kcg/sleMU+3pZFsFsFkXdmJq+kwv9BtQxtPTctDLtfqUAFu5yAMA5zgPIIHobRcGfzsE
         9i6exTlkfj2gHNV+sMv0rereK4h+kXufxw/B/1xcdlYVupmbBdRVGXuvGdj1g/h4l0PM
         R7Zmw0qTb+G/7A7PFF0xAFUxlO8ysEgBRuekI5DKXAXL0Hl3NlMceRCeGqg39A9PfK4+
         nM8/g6Q5inD7iUKZqNe5RWG7nHrsvlFG3CZYPJheDiiGkXrEXXJNZbzkOoryfzwZEiQe
         N4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714647670; x=1715252470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjTLbsaK8lFll8/qZ6Wbe+KOojRpVIeEGiQdgeTUV/M=;
        b=W1L9Iw6X22x1YDT23dY015D7//EhCxHE1UR2b0t9HlT0iOrcTwuIBKNGqLt115PNJT
         pDfwt8+vG8TMSCqAF7NdyEdRDe/3QggMaoU3zgl7TnjLSpTTozWQdV0Q5+jjLylgwyWW
         ogoD46EVP8mWWhE30grgX9gEFmGr6VpagJZn3rkhyyEObcmChI/Iqje/bJwIambU+jpw
         LvNWBX9WK2aFFTStiUh4JIcE0irwLtRtAdEj8FuxGxeIkSOhberWvRlMNDo6ei35quKm
         iJhlwdcQhDjX77WaESPpIgHsAas06G7b6TIXJ0PjiPH2cyumhv5HzLpdiC9c7efb6ICq
         uPiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDSa28tjP9xEyUnKfIwaQXrPRKkDYQCOyEZRhDSdBrq85Y+LYOO8cfQcmQK9NVIzaylFHHtQHPLlhL63jv1FrM20CCD/Aiycu6HwdKMuKB
X-Gm-Message-State: AOJu0Yz3Jh5NySYEIOTXVE1eFPeVvqnMZhiLc3Qk2oAPXrBKhtkilC5Z
	/yGzq0F3GIB57ROJOfQs9if3yfVoqCQ32zoPMOoy8waHzSUhhYkb7fCvECX2LUw=
X-Google-Smtp-Source: AGHT+IHfkJrlGnon/mEX5fWtLywYkDj4de083FrQTvrfO2XC94gdhaKM/ttBrgT+XJ2VbkvvaIQxaw==
X-Received: by 2002:a05:690c:d88:b0:61a:d2d9:5488 with SMTP id da8-20020a05690c0d8800b0061ad2d95488mr6160180ywb.7.1714647670339;
        Thu, 02 May 2024 04:01:10 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.19])
        by smtp.gmail.com with ESMTPSA id dg17-20020a05690c0fd100b0061adfb01cc2sm147882ywb.90.2024.05.02.04.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:01:09 -0700 (PDT)
Date: Thu, 2 May 2024 16:30:50 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Marc Zyngier <maz@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Andrei Warkentin <andrei.warkentin@intel.com>,
	Haibo1 Xu <haibo1.xu@intel.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Subject: Re: [PATCH v5 03/17] ACPI: bus: Add acpi_riscv_init function
Message-ID: <ZjNyYkgpyAa47F4b@sunil-laptop>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-4-sunilvl@ventanamicro.com>
 <ZjNbvlUoCfa5UUHF@smile.fi.intel.com>
 <ZjNksbTQF1lMQ0k0@sunil-laptop>
 <ZjNnG6JqFCZGj1qv@bogus>
 <ZjNoy6KLtOCTe52q@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjNoy6KLtOCTe52q@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_040112_211810_C2FDFB1D 
X-CRM114-Status: GOOD (  23.52  )
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

On Thu, May 02, 2024 at 01:19:55PM +0300, Andy Shevchenko wrote:
> On Thu, May 02, 2024 at 11:12:43AM +0100, Sudeep Holla wrote:
> > On Thu, May 02, 2024 at 03:32:25PM +0530, Sunil V L wrote:
> > > On Thu, May 02, 2024 at 12:24:14PM +0300, Andy Shevchenko wrote:
> > > > On Wed, May 01, 2024 at 05:47:28PM +0530, Sunil V L wrote:
> > > > > Add a new function for RISC-V to do any architecture specific
> > > > > initialization. This function will be used to create platform devices
> > > > > like APLIC, PLIC, RISC-V IOMMU etc. This is similar to acpi_arm_init().
> > > >
> > > > What is the special about this architecture that it requires a separate
> > > > initialization that is _not_ going to be in other cases?
> > > > Please, elaborate.
> > > >
> > > This init function will be used to create GSI mapping structures and in
> > > future may be others like iommu. Like I mentioned, ARM already has
> > > similar function acpi_arm_init(). So, it is not new right?
> > 
> > Just to add:
> > 
> > This is to initialise everything around all the arch specific tables
> > which you will not have on any other architectures. We could execute
> > on all architectures but the tables will never be found. The main point
> > is why do we want to do that if we can optimise and skip on all other
> > archs.
> 
> You need to carefully write the commit messages. Some kind of the above
> paragraphs has to be in there.
> 
Sure, let me update the commit message on similar lines.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
