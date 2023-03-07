Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB766C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 05:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yskaXeD9qCiMUaUW+rq3kKWV8XoNfrDP1fH5Ph5D1B0=; b=DUuRZeFmc6/myR
	WdGxzc7h5Dhvuon7UMkeuVg9JeFQxn2lYyvv8psMSxr9oPEY6cuwWyOrp/JGwgx3VdlTAz17eW5SH
	NIC6bZcMOUx/fRG0aPJCVzZISPUuGP8DzgnJeqSGirQjNyGGwBiD9pMEvCBGKbuh1AaVB6IEwMI+A
	u0MWW1JWoYDSLW1MVup0DhvcK/8kPL3lBUhB5/CE7nEtIE+ChkKegAluCnRiwqUZxR4vupfrZ4tDs
	Ez++1HRPOUM8SAYr6AdZkt04R8ZaJFIf+S8HS42FVMIFr7MCBSWKvbMG93n9D7zuFLBYEZKZoP78I
	zDeq/IHXgPf87zZVDUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZPWy-00GFZU-Le; Tue, 07 Mar 2023 05:06:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZPWv-00GFYF-4i
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 05:06:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id x11so8359459pln.12
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 21:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678165584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ncIZQ84lksEd9kxqzUc4pmHzurSPn3jNUdkAVBVakM=;
        b=ZDrVtKw9CQtz5i5Rktk/5VuDFClMgI+RB514CO50h6TX40umhQQXF+3Al7jnCCXMPJ
         hrdzIs41xbHE6KDgEtj/FfBi18Vz5YkbagBEP6N1wmOxeuTjjivdwCKZh2RTzJE6loC/
         lzhACyYDd0OCcrXkO/T81CHBNKACaz6nsAf6E15zew/yj3OMUhPwVatN5ZAb4hrVTWYV
         PukVc2HJaWAVSRfl24P98E1EoRxJbXH9KoIQB96TlLPVCFVN7/vgZuRVwQuMwdfUf7zx
         Es9WWh7t1O9vTOsoSAQUcyz/3cIxhnas9VN7Q9VWGaXwdBAaf6eSR7rTquhMN3wr/6YP
         skLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678165584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ncIZQ84lksEd9kxqzUc4pmHzurSPn3jNUdkAVBVakM=;
        b=Z1RzseknCFNm+km+zC5DtiXwQninFeXCijuxjw/P0e+8sgh1kGHIZWY3U9rU+yc4cO
         IBr5OHpNdJvSspBGPffA9bubZ3q3a11jB4efEAZXtExZB3mOFun0Jq9aY6fNyN4rDQMz
         DO035UgQGh9AHvHxtEUAi2/JFATD8Tm9ZLjILQSHZyQKAMS4xiwCGedpsGcczFAqguFn
         ZyQbb2nxFuoq7xKhU985NiSM2tmH2ZixiKg5zJaZjBkzyKYZ9A2ANgKTArHlKDYWXE42
         Xy7/s9bwQ0SeTDdKC83O7N0saTcvYo8e4KItRus9EUh5WX0mFgZIJxWs1iez4xrHoj47
         Rlog==
X-Gm-Message-State: AO0yUKXHg1PWVQoZktbohx0YATxzG/f/nMYUXqyUN/eoWbvxr7B3dvE4
	CE6UDPnUN9WQbFCrZfYmL2/mpw==
X-Google-Smtp-Source: AK7set+lsGeOZJEFKPysrv4y2Wbb94M1eNKlJPEGR3INGjRdcW5GKTB4n9YlJ3volc2UF6gUqL7yYQ==
X-Received: by 2002:a17:902:f693:b0:19d:e11:32de with SMTP id l19-20020a170902f69300b0019d0e1132demr16517253plg.34.1678165584256;
        Mon, 06 Mar 2023 21:06:24 -0800 (PST)
Received: from sunil-laptop ([49.206.8.117])
        by smtp.gmail.com with ESMTPSA id le3-20020a170902fb0300b0019edf582a95sm470363plb.20.2023.03.06.21.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 21:06:23 -0800 (PST)
Date: Tue, 7 Mar 2023 10:36:16 +0530
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
	'Conor Dooley ' <conor.dooley@microchip.com>, llvm@lists.linux.dev
Subject: Re: [PATCH V3 00/20] Add basic ACPI support for RISC-V
Message-ID: <ZAbGSA6F0kfv9YYw@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <16007014-c5f2-4b07-baec-e19952236aa5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16007014-c5f2-4b07-baec-e19952236aa5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_210629_205272_44C2A5EF 
X-CRM114-Status: GOOD (  21.05  )
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

On Mon, Mar 06, 2023 at 09:51:09PM +0000, Conor Dooley wrote:
> Hey Sunil,
> 
> On Fri, Mar 03, 2023 at 07:06:27PM +0530, Sunil V L wrote:
> > This patch series enables the basic ACPI infrastructure for RISC-V.
> > Supporting external interrupt controllers is in progress and hence it is
> > tested using poll based HVC SBI console and RAM disk.
> > 
> > The first patch in this series is one of the patch from Jisheng's
> > series [1] which is not merged yet. This patch is required to support
> > ACPI since efi_init() which gets called before sbi_init() can enable
> > static branches and hits a panic.
> > 
> > Patch 2 and 3 are ACPICA patches which are not merged into acpica yet
> > but a PR is raised already.
> > 
> > Below are two ECRs approved by ASWG.
> > RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
> > RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
> > 
> > The series depends on Anup's IPI improvement series [2].
> > 
> > [1] https://lore.kernel.org/all/20220821140918.3613-1-jszhang@kernel.org/
> > [2] https://lore.kernel.org/lkml/20230103141221.772261-7-apatel@ventanamicro.com/T/
> 
> Building a clang-15 allmodconfig (I didn't try gcc) with this series, and
> Anup's IPI bits, results in a broken build, due to failings in cmpxchg:
> 
> /stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error: call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BUG failed
>         while (unlikely((ret = cmpxchg(&c->value, old, new)) != old)) {
>                                ^
Hi Conor,

I am able to build without any of these issues using clang-15. I am
wondering whether the base is proper. I had rebased on top of the master
and couple of patches from IPI series were already merged in the master.

Do you mind verifying with my branch
https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17_V3?

Or if you could provide me your branch details, I can look further.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
