Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75A2C54E60
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 02:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4LQQKIrPLOwJIFzNBT7tnqp2LDDCIMM0kW6aY/l4/4=; b=B0gjq7LhD5RVlu
	aEWtjRsu0Q3qeDLgG93W3cepdpZ+EYTx9x4j39m8z75K2y7deIitzErxvnOFcUHhPyGuM9R5ZzZZk
	cZNHuJB3Y4NRJe/A3dyUMddITMC5lrejwCn99yPB6mAN0kAcKxGBF3kQ9P+TKKFeY2HT0Glgr2+28
	kg93u0FBqAnvykuN0VTigC9D+Mu8jPLc6CSfXGOdyIZhMaZI+z2Pftbi9ZZspybrrQAU4XdyIOa0u
	C8AEPmhMYaUf83pJWF1GkSn4IAQqX+S2AW6hLlSeC19TWCtCr8S4qeRbCdfeUBZ/c1PAnGG0NNEtr
	TgxGL+3KglnIkveMi6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxnW-0000000GTy0-2Ykm;
	Fri, 15 Mar 2024 02:59:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkxnU-0000000GTx6-2Bfl
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 02:59:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dee5ef2a7bso6320385ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 19:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1710471589; x=1711076389; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DF3u6fUKhDyXy3K2gFHmZ27anukGMBI1JFmpHSdBQdY=;
        b=m2P4pn+NKV1utA407j6qv8EtAyvH4W52UWy0cinttNO77JVKbkcLGl959OgXt1Fbmx
         WQEyecYk/diTYEjESR8N52x/Wu94SADabHDylcfBuYcMr3VQluzxie+eFMn5/2ltfaKi
         CzqovGhLZ+DRoxnKlIs0wDPTA9g5k1v0AVm3i5btJiLTO66F2T9jlQoeWtpzaoEaVCvd
         nhllWLqIrGb9cfORikKhe0AtrTRpp37MNKsK3mbmsw0371JosJWzFmk1Ga2TmmWke9iw
         akRnsRIMycmFF0dZ/8oCGeJZiIdgRLW5QjyN1hYlJnVdZW8tCFR9cuC2wNt+Ixd2hyqV
         Hrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710471589; x=1711076389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF3u6fUKhDyXy3K2gFHmZ27anukGMBI1JFmpHSdBQdY=;
        b=L8ouoZuGTOXnURJHZSkV8LUnWctspBaJ8jbtC5B+/PW4yRiS1Pb25Cn2u6N293/NS+
         SnXc0w1BOK5AxeUySKI3YmJ2WXd0lr0p0hXnHLShTsKaHOKM3F4HFT70MBRrIDdbqebs
         LeAOk6vWlbnhyuyF2EHd4YJVghZkLaq8Ez9WN6PM2WowoOuVRmzRT5cz7fSzQW6ea2fc
         1CgSrATFn8o/EcXkx/hmO7GD+UNJI/UJP88mA18ge9NmjfdZIqRJwtPUhcIn7BF3FvQa
         zWt3XSLBNY+ATmsU+LGn95IGJV7oMuKV0FBPVohK5nNFnf4iS/maGF2pRlP+10SICgPv
         hoXg==
X-Forwarded-Encrypted: i=1; AJvYcCV0o84kP0sMzWHDILQ9yO+4xEIgoEa0hyKmY8BWGjkb8Um3ufbeA0Z6rMO5XCjNUzEIavjCM/DlXG2VA99lPMsN4auEgCQVNl5b5ilAy2VF
X-Gm-Message-State: AOJu0YywdzlZtUfdxivsfemyZYHT5SxL8X99knGeUNcORHg+2fELaJZy
	31O6v6a/dnHNNLbHmuqtwUPDrOIv4PM7eyYcW6RJa/SMCgOpRMR4M/92FmVRhz8=
X-Google-Smtp-Source: AGHT+IFCcd+8CehiYUMhG/6taZofm4Zmag/eB0icU74TL0kdsU7vlKVvJ1lw2qGnNTk4BdQ6IicmvA==
X-Received: by 2002:a17:902:cecf:b0:1dd:d412:906c with SMTP id d15-20020a170902cecf00b001ddd412906cmr4971466plg.12.1710471588778;
        Thu, 14 Mar 2024 19:59:48 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:a790:ff9e:11a8:fac0:d063])
        by smtp.gmail.com with ESMTPSA id cp5-20020a170902e78500b001def18c0cfdsm112750plb.300.2024.03.14.19.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 19:59:48 -0700 (PDT)
Date: Thu, 14 Mar 2024 19:59:46 -0700
From: Drew Fustini <drew@pdp7.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 -next 0/3] RISC-V: ACPI: Add LPI support
Message-ID: <ZfO5oiVSVSmlP8eL@x1>
References: <20240118062930.245937-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118062930.245937-1-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_195952_812259_BCCBBBB3 
X-CRM114-Status: GOOD (  10.82  )
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

On Thu, Jan 18, 2024 at 11:59:27AM +0530, Sunil V L wrote:
> This series adds support for Low Power Idle (LPI) on ACPI based
> platforms. 
> 
> LPI is described in the ACPI spec [1]. RISC-V FFH spec required to
> enable this is available at [2].

I'm interested in trying out this series. Might you be able to provide
some guidance on how to setup a test environment?

Are there specific branches of qemu and edk2 that I should use?

thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
