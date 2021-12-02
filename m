Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146E2C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 15:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Pgcs9SNdYuYKE1keeRExmXIYFaPpOcxM3z3fNVpmdg=; b=O8j61/lhsAnDER
	s97gQmmBWkjOgXE0LPPlYAQZMCbwBqDAAoDn0p2FBag0PSkEMzQOET0oBSInLEG0AOI2kMDaa1FBp
	/2NEO8iOe5n9a/zVA7IU0vV8VEDHUhXeUHTUMZwFoXmNDTHSUkgS/GH+gtljCJfYXwA8YC9I8PiFS
	oZ1vsJe8DkOGMsChvC9222P9TKSingQQ0AqGm3z8hOno7AdQRiyIzAg+as34noNOod+9+oZZXuHcl
	c7TmqX0HcyVgVMXSStFec3RG++cV1/3l/La2p+RGezzSHgGS/6Cen/abuFB4sXnmk1Yqnb1UCspcp
	BpSatkdELefGDN2ciSeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msnq1-00Cig2-L0; Thu, 02 Dec 2021 15:17:33 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msnpy-00CifY-Rf
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 15:17:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id r130so28294250pfc.1
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 07:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ou+gqBpt5wxXNXkzQ6Z381TwicQKtCQ09UiK1Uxuyoo=;
 b=fY0yKFZLMzCXPgZp5soAQIBoA5gEYZaOTLj6QvHimMqRkHHfIwebSV8nZZ/NYR1Qtm
 EvtyQwfTavlFmGN7rRkJLgFfXM0F1fdSPCGjWfOSeI+oF8LyPxkuMbORVai01m4rzTjp
 SCMU5s6p52he048nB850ZLGUcbnUxJOPlGmg4cCZa7DC0A2ER6fNQHuoFPsRZQYk0/4D
 kS4JVakoT9Td3PUxhVuuaZ8uOPM7SuCcHBPQDfo1GyZuvijTyN3o/7RyCZzPkL4ey+tM
 M9/vgxo8aUgaJth4f3kE0iGIsdecZa5rY9SivLoa8RPyQoWCv9pvFePdZ4H+RNww3Atw
 Rg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ou+gqBpt5wxXNXkzQ6Z381TwicQKtCQ09UiK1Uxuyoo=;
 b=fZwcm6QVRiH4fMuTy7KIyJKi2EQ6QUSS8gT0tB0pbt1TU1wf2ZRaR2p7QxdZk+Hw5a
 7B1m19MYNfmOVkQFibRhyt/tgW8RUycFYRVbxKJjaz/hEiA9Sez3ZCVd9LidEWw1PGy9
 YiOH0JmzNhZg9QTyfRcp5utZOc/EJKhHROUQPXOP8GB9nCmcgZsAg8jbhzNGKBmkaPgV
 9YKIBBCcQLuDs4ZQlRrNjfVW+5Y++11pNxWhpY+2S/xF7PfqePCl2qFXXZbQbveGe8B1
 R4rxzEIn8kVfxlQQfMjLdDcobAgGmdsrs6hG3KoQrxftqdYaXhgphYMh2BFmGAhhh4es
 ZUJg==
X-Gm-Message-State: AOAM530NvNR4eRo0tzQS/Xd+6cQucelMsSiDNxJEExEfDFy+9O/yJ0t9
 nLZZDF/UFMV8kLdz92bXaEkdcA==
X-Google-Smtp-Source: ABdhPJxAkBf57JAkDJQw4bDm5mXAemlvPmNeCQ2tdanoVWXKbM/8AsdE7C24dnvUwpZFD7+uLrbmkQ==
X-Received: by 2002:a05:6a00:c95:b0:49f:c8de:9ae7 with SMTP id
 a21-20020a056a000c9500b0049fc8de9ae7mr13261603pfv.30.1638458249621; 
 Thu, 02 Dec 2021 07:17:29 -0800 (PST)
Received: from sunil-ThinkPad-T490 ([49.206.3.187])
 by smtp.gmail.com with ESMTPSA id t131sm19245pgb.31.2021.12.02.07.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 07:17:29 -0800 (PST)
Date: Thu, 2 Dec 2021 20:47:23 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: sunil.vl@gmail.com, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <atishp@atishpatra.org>,
 Abner Chang <abner.chang@hpe.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: Question regarding "boot-hartid" DT node
Message-ID: <20211202151723.GB97518@sunil-ThinkPad-T490>
References: <20211202150515.GA97518@sunil-ThinkPad-T490>
 <7e978e9a-344c-42dc-786f-8f21854ac316@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e978e9a-344c-42dc-786f-8f21854ac316@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_071730_924200_94D497FE 
X-CRM114-Status: GOOD (  24.42  )
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

Hi Heinrich,
On Thu, Dec 02, 2021 at 04:09:34PM +0100, Heinrich Schuchardt wrote:
> On 12/2/21 16:05, Sunil V L wrote:
> > Hi All,
> >     I am starting this thread to discuss about the "boot-hartid" DT node
> >     that is being used in RISC-V Linux EFI stub.
> > 
> >     As you know, the boot Hart ID is passed in a0 register to the kernel
> >     and hence there is actually no need to pass it via DT. However, since
> >     EFI stub follows EFI application calling conventions, it needs to
> >     know the boot Hart ID so that it can pass it to the proper kernel via
> >     a0. For this issue, the solution was to add "/chosen/boot-hartid" in
> >     DT. Both EDK2 and u-boot append this node in DT.
> > 
> >     But above approach causes issue for ACPI since ACPI initialization
> >     happens late in the proper kernel. Same is true even if we pass this
> >     information via SMBIOS.
> > 
> >     Do you have any suggestions what can be done in ACPI case? Can we use
> >     a UEFI variable with RVI specific GUID to pass this information? This
> >     will have the advantage that it can work with either DT or ACPI.
> >     Also, we may not need any UEFI spec update. Do you see any issue with
> >     this approach? Your inputs will be very helpful.
> 
> What happened to your suggestions in
> 
> https://linuxplumbersconf.org/event/11/contributions/1099/attachments/781/1602/LPC_2021_ACPI_RISCV_Sunil.pdf

The challenge is, the EFI stub part which comes very early even before
proper kernel starts. If the information required in later stage of the
kernel, we can use ACPI tables. 

Thanks
Sunil

> 
> Best regards
> 
> Heinrich
> 
> > 
> > Thanks!
> > Sunil
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
