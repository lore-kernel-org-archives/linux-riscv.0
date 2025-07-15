Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93985C83F22
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+spbOUSLp/3rJCvGMuR2dVWDiMYJnVGoo/PNzKAlFk=; b=Ca0yP2giaBa8Lv
	xWEqEMe1d8ttWo1cxLnFL+BAHGMhnX7CxIRM03JGy09nHjP9tO/ORmjujrf4Vz3Q/HeDqQ+1PI7pC
	8krtuqMuTDHQX22WSA9poaIL8NlZQZ/WuJ54I7uEulMu8UbFbnDSx/vXB8QkXxMPsc1IiOZdJqSrq
	wwhbMwcbVD3dC9ENVt7KcCxScD6NkJbd/yWTmUdwXN8Tzzhu4tP9GuWiQ1RNKxM1ycsBGXKqfLCoL
	FGr06NFoZbdr9UIp00wi9jgRoTZI/L53n4xy6Xw33fqIXb0shgp2MTkufNQejE9jwHvbR8r0Lqwgv
	Q3twUzmJuzRUf+tAQl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiSV-00000005jzU-0Xwh;
	Tue, 15 Jul 2025 16:24:47 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubh7P-00000005USY-0xbB
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 14:58:56 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so4547122b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752591534; x=1753196334; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mvahs9K3Kwf003Xrbc0oMQlkzIbQnUN8rpvZVnAjj48=;
        b=OTVgHedHz7ApKt5vKUKHM/ukVHiU58rBbVL3iYQfYXfIdzCpHf3KW7QEP/kibS+5zS
         2lSW4L0O2HAk0loQijzlEut28AK+AnBSnF/LQDwIcgeNqyEG6h2tdm0lamBn26AFReIh
         n8M9qGOfGe7KoHzYZ8STaWKa1j3IU154fFdsIxmOv9BbYKp5ZthaMOKn8ULF+748gPXG
         GyHSSAsREPE3beGhvwuA7qo2xBNi9sQ475a3RCmguVWrDi2XTalbCi1G2owp4EXLiwZc
         Awy00MZRJJljTqmBTOCqG2Xr35Ph7BXolHfrf/rUitIeMwXdPKfeGmyxtBOwtrpCjbG6
         /uWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752591534; x=1753196334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mvahs9K3Kwf003Xrbc0oMQlkzIbQnUN8rpvZVnAjj48=;
        b=eCL99GFOyKUEbbe9PnTKbFaR5UDHxv3GnL1n+fEY5gQg9uqi9VyTJEU8C4ctN8fKL/
         gVkguxXRyh2o8kevxB1Z4kX2G/uVH0tQAzNXpmcouajxeB8HElC/QV8UXVY/aoGufOBX
         uqbQeEWyvacp1z0QmX/cnsPJ+2Gl/AerTni+6z89c1krE147dHjFw8pygsfag5XifNkR
         7FzgV7XC+aiFDsaxTHe4afYEvCzjdlFVh3Kv5jTaJhBgnk0KS2bvdt8dKO2f/cw95Vxq
         X1MKOtJdF9IS6Sa0PeQtYN00C/mbxO4M/5aF5zkSNqsakajycxtoxMYHuFIDlur0OVCJ
         IJ6g==
X-Forwarded-Encrypted: i=1; AJvYcCV7aJ+F//5dlS5ou4vFsS5pshN05+63g6FIO4sLWXSfLMbluCD5ZUlEpyQagH1sJY8RXc7hlo2MZSZnAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY8HHjJVyBdMaPkr6LcUyTa043twoiEpiQlvRT//20eWHMIkyL
	MBFdKysIB8x/U7CYDE4VZkYQdq7f08XcZcCWq7eHPTa/jPIfrGwlyN74Sl9b+xnMGOc=
X-Gm-Gg: ASbGncuKJhTgnM6IbbAZl4+HJd7FaXxzWgufeXM8VO8vmjatGcfKaCMA6yKUpHxGqoJ
	XMVb34cj5yD6cmKhkabT4kG0d8sIljlL7nOI/+GkTUhSQBbRUXNdj9L2vdGTE/q0e6F8KQjPzsW
	nq/PwyURMu/mE5GZoor+DQkRpZ4kvHEyZbtWiid4EddaPSbNyHZxS53kGMAY1cbo6EXs0exEji1
	5UjEYRBLUec3XBYuwitzyCkM1Kmcqc1xlOkfzYdSAw3GPDWkRkcNRfUC3j9JGMks524mhVo86LC
	PrKuTTMKjaYKhgzR8NA7yguEzsggb3J2KL/6qU58B4z3MzmeTjYtNFpJVgbpMGnYwLQWTaX2uC4
	tHqEMlKYcN9HdaFa3xKw/O4M0DJN2Bw==
X-Google-Smtp-Source: AGHT+IGWqmTNcmPppTn41XmZxoBqwnqg0u0bN/W4bU7UhI4lYpV4O4cn1UsFVwKVvFBue7Ekoyiq4A==
X-Received: by 2002:a05:6a00:ad0:b0:746:195b:bf1c with SMTP id d2e1a72fcca58-75584eb932emr5340905b3a.10.1752591533903;
        Tue, 15 Jul 2025 07:58:53 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b6fbsm12327709b3a.84.2025.07.15.07.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 07:58:53 -0700 (PDT)
Date: Tue, 15 Jul 2025 20:28:42 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org,
	linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] Remove unused EFI runtime APIs
Message-ID: <aHZsohPoxLYML___@sunil-laptop>
References: <20250714060843.4029171-5-ardb+git@google.com>
 <422e2a72-972f-41f4-a0b3-d69a6cb0c2e2@canonical.com>
 <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXEXpBF8hPaVMU0sDgNysYT66MDRmr3JHO4Lg1sJB_Yteg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_075855_270385_46507335 
X-CRM114-Status: GOOD (  32.75  )
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

On Tue, Jul 15, 2025 at 01:29:15PM +1000, Ard Biesheuvel wrote:
> On Mon, 14 Jul 2025 at 18:11, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
> >
> > On 7/14/25 08:08, Ard Biesheuvel wrote:
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Using EFI runtime services to program the RTC to wake up the system is
> > > supported in theory, but rarely works in practice. Fortunately, this
> > > functionality is rarely [if ever] used to begin with so we can just drop
> > > it. (Note that the EFI rtc driver is not used by x86, which programs the
> > > CMOS rtc directly)
> >
> > The main problem I see with firmware offering access to the RTC via UEFI
> > services is that two different drivers, the firmware one and the Linux
> > one might be trying to access the same busses or registers which might
> > lead to unexpected results.
> >
> > Recently there was a discussion in the RISC-V technical group for the
> > server platform specification where the same issue was discussed
> > concerning SetTime().
> >
> > As a UEFI firmware should not care which operating system is booted, it
> > should be up to the OS to disable EFI access to the RTC if it has native
> > access.
> >
> > Could we disable all the EFI services for the RTC in Linux dynamically
> > when an RTC driver is successfully probed?
> >
> 
> I don't think this would be the right way to do it.
> 
> It also depends on whether ACPI or DT is being used to describe the
> platform to the OS.
> 
> ACPI does not support describing the RTC device, so it should provide
> the EFI services.
> 
Hi Ard,
IIUC, TAD is defined for this purpose, right? 
https://uefi.org/specs/ACPI/6.6/09_ACPI_Defined_Devices_and_Device_Specific_Objects.html#time-and-alarm-device

> DT can describe the RTC device directly, so I think it is acceptable
> for such firmware to mark all RTC routines unsupported in the RT_PROP
> table, and just expose the RTC device directly.
> 
> The OS shouldn't have to reason about these things: it is up to the
> platform to describe itself unambiguously.

I agree. But I think even with ACPI, EFI GetTime/SetTime can return
unsupported if there is a TAD exposed with proper _GRT/_SRT and _GCP.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
