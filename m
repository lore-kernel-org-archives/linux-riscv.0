Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF7CC678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 01:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jrDiaVLkXncUKg68LgOzR8a3LzFcSD4hEbq/K1Bv3s=; b=JqG1wCRbFsyWUG
	cpLwscmcc8fdMZY7BMksWiIxR2omvDMFolWAjjIRRdeD5yGbeM53lxdgU0cUYyVnXOIKBhRo6miAf
	DyqL9RFhaPzS/Ibmf33ouWn2C2+0HGh0sIff4K6b8NUVRzPoMepQhkOzuD1Z3/FXTsez3QkpJpJjj
	b2wj3vy3LoLHSMhMWHuDgu19GJZcyzGuLwp7uo40V5L47jUftv6jmez+mZ6WAQAr/sV1kgv+HdfK2
	Y1nG4T9Eq+ujPXer5/06dtMMLOcCgsDFaOnmbkmOncZBjb25fScgyvrtsqXMQLPnlb8Bied5EFsU3
	lsF/Qh8+IgeZjOL8toIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZiBc-0032Du-LH; Wed, 08 Mar 2023 01:01:44 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZiBZ-0032CH-Np
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 01:01:43 +0000
Received: by mail-pg1-x52a.google.com with SMTP id p6so8780121pga.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 17:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678237298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6YvH7/30oaOoEw0fJZgjxisk6g6l9V1q6jEfMHBBZ7g=;
        b=m+uxGQ+9tXNfzy4WRdbu+myuhDshXcyXzBV/FL60bIqLgA5QTO4BIDu49QVcNlWQoX
         HXEtkAaPHt4BUHysRzgeG291T94nnA0iUWevelUjQWY4cpOU05Pw4PQjwmaQRMDCqgk7
         gH9m2S+xbn0elKjpA1oT/24qcT57wvBjT0JRPtliohA108MIQbfXI4KVPyPnPdM2VDbe
         LgD8sRdSSHSYW5qFKK7aDSXSjKqXHkZwnsbjWz1fHtfReenMRihXPJoc7woFq6c/gbRt
         m0er4erQ1I8cKacpdck6Zb+lWyzC5oDFpWh0Z/Z+BbNA+sMCRFvfZWaX3wVNciB07Bpw
         r+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678237298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YvH7/30oaOoEw0fJZgjxisk6g6l9V1q6jEfMHBBZ7g=;
        b=y3uOtsG38P2+mgWIIwAkpo9K6xLuvgHiStQDPNpRVUCm/LOwQI9Vvo45yBgZWHkAfb
         pY9LPXq0XNG5R8id76ZsvwtFzt//xPDTQ0qbVAkfJbBuOomPb+mFcrcu/N9TrKKALMp1
         XFlyURfFlKcPRQsAmcgeGuSGTc69UQxNya8Xt31iBtEBtCA1YIMqFS3MMX+0euOXSFnj
         eBFmmYGlFMBcKXXzy1gnDepnds9hqjsuSNCFMvpwsf0upCVoAjAa0i8bRzO6+WGDXlYE
         2VkwoO2lUyCqYMjhVYa8VwGRvtOl9MGIj+ZsYg5FLaQmA1OxZiLmXorUC0ZfJLN3IS0J
         y1Vg==
X-Gm-Message-State: AO0yUKXvnguok/HY3hS8um1JMKGxtNYfAllNOfk9HR8nX0txR53KQVne
	ME6Yx47INAA0u9IZsRDE53bmwA==
X-Google-Smtp-Source: AK7set+510meSm73kiGWTkbA6xQr4dpohbcmAGKW4EbRmVSRTjthYftiUey8GAHEowaibQaODVyMKw==
X-Received: by 2002:a05:6a00:9a9:b0:5a8:4c8a:2ce4 with SMTP id u41-20020a056a0009a900b005a84c8a2ce4mr4710038pfg.3.1678237298469;
        Tue, 07 Mar 2023 17:01:38 -0800 (PST)
Received: from sunil-laptop ([49.206.8.117])
        by smtp.gmail.com with ESMTPSA id a5-20020a62bd05000000b005afda1496c6sm8401705pff.31.2023.03.07.17.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 17:01:38 -0800 (PST)
Date: Wed, 8 Mar 2023 06:31:28 +0530
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
Message-ID: <ZAfeaO52pnYhiyLN@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <16007014-c5f2-4b07-baec-e19952236aa5@spud>
 <ZAbGSA6F0kfv9YYw@sunil-laptop>
 <E7FB4927-1FE6-435A-914E-9615C2AD9D34@kernel.org>
 <a9823561-2e32-49e8-b6c9-73e4b8f8cf8d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9823561-2e32-49e8-b6c9-73e4b8f8cf8d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_170141_804466_7C5058A7 
X-CRM114-Status: GOOD (  30.64  )
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

On Tue, Mar 07, 2023 at 06:44:35PM +0000, Conor Dooley wrote:
> On Tue, Mar 07, 2023 at 06:13:22AM +0000, Conor Dooley wrote:
> > 
> > 
> > On 7 March 2023 05:06:16 GMT, Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >On Mon, Mar 06, 2023 at 09:51:09PM +0000, Conor Dooley wrote:
> > >> Hey Sunil,
> > >> 
> > >> On Fri, Mar 03, 2023 at 07:06:27PM +0530, Sunil V L wrote:
> > >> > This patch series enables the basic ACPI infrastructure for RISC-V.
> > >> > Supporting external interrupt controllers is in progress and hence it is
> > >> > tested using poll based HVC SBI console and RAM disk.
> > >> > 
> > >> > The first patch in this series is one of the patch from Jisheng's
> > >> > series [1] which is not merged yet. This patch is required to support
> > >> > ACPI since efi_init() which gets called before sbi_init() can enable
> > >> > static branches and hits a panic.
> > >> > 
> > >> > Patch 2 and 3 are ACPICA patches which are not merged into acpica yet
> > >> > but a PR is raised already.
> > >> > 
> > >> > Below are two ECRs approved by ASWG.
> > >> > RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
> > >> > RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
> > >> > 
> > >> > The series depends on Anup's IPI improvement series [2].
> > >> > 
> > >> > [1] https://lore.kernel.org/all/20220821140918.3613-1-jszhang@kernel.org/
> > >> > [2] https://lore.kernel.org/lkml/20230103141221.772261-7-apatel@ventanamicro.com/T/
> > >> 
> > >> Building a clang-15 allmodconfig (I didn't try gcc) with this series, and
> > >> Anup's IPI bits, results in a broken build, due to failings in cmpxchg:
> > >> 
> > >> /stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error: call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BUG failed
> > >>         while (unlikely((ret = cmpxchg(&c->value, old, new)) != old)) {
> > >>                                ^
> 
> > > I am able to build without any of these issues using clang-15. I am
> > > wondering whether the base is proper. I had rebased on top of the master
> > > and couple of patches from IPI series were already merged in the master.
> > > 
> > > Do you mind verifying with my branch
> > > https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17_V3?
> > 
> > I can check that later I suppose.
> 
> That's broken too.
> 
> > > Or if you could provide me your branch details, I can look further.
> > 
> > 6.3-rc1, with both series applied, sans Anups applied patches.
> 
> I've pushed my stuff here, but unlikely that it makes any odds since
> your branch experiences the same build issue.
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ borked-acpi-surface
> 
> My build commands are wrapped in a script, but it's an LLVM=1
> allmodconfig run w/ clang-15(.0.7) etc.
> 
Ahh allmodconfig. Thank you very much!. I can reproduce the failure. Let
me look further and fix in next revision.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
