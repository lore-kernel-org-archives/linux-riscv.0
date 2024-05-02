Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E06C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6g6AryghTffwHSV6f9UXzqhQEYsG0HRORq+gZUeI7yw=; b=JYnf1x1Ks+635o
	6xoDi6ZtbPj06SO02a2Widnlzdl3YCc0yE+HuCNXHK52Is6iCzbu0+wVOXlqtgQKRmlqBfx8pUrad
	UshfuLW4HZtLgzzMuAJmRTocFlM/N9Vp0bfs3ccJaaLHsX3NaBn5YNKfhKHTSdKYnTbjnLOd5MWhV
	vcRW1zzPr/V711RVyKOLIuoHNphgU1OTfWCLRVxM6KpnHAcjZBQ6EXqdF+P6T3bUuErUMv9fz11yT
	Y0bFAXnb9eIjj4hkYk+grGcQUjy/NPGN9oCNPhFvMYX9jpseCC0Ci3CHZxciynk6HKaKbVFHmXS3p
	XqW0qbNuo565t3ujLmcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2T9s-0000000CETO-49hV;
	Thu, 02 May 2024 09:55:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2T9p-0000000CESD-2JQD
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 09:55:19 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e50a04c317so42647375ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714643717; x=1715248517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NL6wf55BXPa+yyuBuN45neIFKGEebMs0pSULB1fzRIU=;
        b=gVoU7+/h1TyOvA8az9cJo1l34Sgk2ZVUApTW1DJZWAe4qIl7+LNWlGKBQ67fnzWTNH
         qI/PdHVCdBZa1jAvY09PRFmjh/1dujwQSPyk4aJZvKD6nPJWto2gV0PB4MWzF3WHRuDk
         IdDGtdoknLFoMuGwJTPH6NrtWIymdu2UdTzgGhCKIGyrk0R2RRo4TtDS25JhMNgMvgSr
         nOxzosbzIqqJ4Ne1InHSPKyqA/cq6Oms9PwDXLU1Fw3LVtF8lWauJ0eCONLvhaJmLvkZ
         AorBtRXfA+YyYHCFEv8KWMX8MdXf3ejwb754ZWn1BjFc/jWniwuIJl3QF4bUjXzSosKh
         1efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714643717; x=1715248517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NL6wf55BXPa+yyuBuN45neIFKGEebMs0pSULB1fzRIU=;
        b=VwEn/tWayqhXLUA+efujlbonO7m0feK6iDbuCRLjDujb/nVylhEj5CloXSNVQc4Ics
         emEccvAa7CVeUF0bkLvJSjzmNZcYo9MLwtJ2+of3l1zXHwXwg5LdEbVXd3lO/2lCGvXZ
         S9fFxmwqxhMDXKzSMylP1NgBGwYgn85lZFiB20Ujs74bwb6JFLqC1eZSiQGG1/gm+s3f
         qyH8ZXEeCTH7+qQGkYMN1R+44Hyad+peN06JOLpUfxe1v0+z9ggp7WgTZLthzqrrW9tb
         p0VEzDv75aQrTMEekj+OQsUBfBp4nt5Dkh9Hyp688FtpU8yECcJjiwqVQkTYss8GyAVb
         0VWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkN/j363GLrVitji4tBhTuBsXwEX8qptqiugmn3a/D1UyaNuZHscyCBuRPn59aVc/4ad4Kh3Hk6D977qI6niuuAp5E6lJsR8AZyA2wbuHy
X-Gm-Message-State: AOJu0YzxccqTcLRr59U8b5CVkvLmET884A0D7zwma+uZ0ivUcA2WOgKO
	AKlRxr4fF5xOzUlfTp7GDRaX/We7mlLk5Bjc9mwDftp3T2LFiOkIaouWJrUWo/Q=
X-Google-Smtp-Source: AGHT+IFpK3bIq8mezuHv2XyP6jnQjh19B8eyQtbmKS7Jf/SgRv411rIyzxq+sdALFrGRrZq6EWk8mA==
X-Received: by 2002:a17:902:e80b:b0:1dd:c288:899f with SMTP id u11-20020a170902e80b00b001ddc288899fmr5793344plg.18.1714643716808;
        Thu, 02 May 2024 02:55:16 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.19])
        by smtp.gmail.com with ESMTPSA id jv21-20020a170903059500b001e0e977f655sm867362plb.159.2024.05.02.02.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 02:55:16 -0700 (PDT)
Date: Thu, 2 May 2024 15:25:05 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v5 04/17] ACPI: scan: Refactor dependency creation
Message-ID: <ZjNi+QaVZUX0Ntiv@sunil-laptop>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
 <20240501121742.1215792-5-sunilvl@ventanamicro.com>
 <ZjNaxvh2ZSfDcTa8@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjNaxvh2ZSfDcTa8@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_025517_611425_AD9F6E6F 
X-CRM114-Status: GOOD (  13.53  )
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

On Thu, May 02, 2024 at 12:20:06PM +0300, Andy Shevchenko wrote:
> On Wed, May 01, 2024 at 05:47:29PM +0530, Sunil V L wrote:
> > Some architectures like RISC-V will use implicit dependencies like GSI
> > map to create dependencies between interrupt controller and devices. To
> > support doing that, the function which creates the dependency, is
> > refactored bit and made public so that dependency can be added from
> > outside of scan.c as well.
> 
> Side note: If you haven't used --histogram diff algo when preparing
> the patches, do it from now on.
> 
No, I didn't use. Thank you very much for letting me know. I will use in
next version.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
