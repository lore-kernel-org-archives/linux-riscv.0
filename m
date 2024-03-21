Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC6AC54E68
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 04:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFephPlztFNK1JXj2BoOKgjlsNyhb0Lgb/jetGCcbT0=; b=BsgWHxkuQp1zjL
	bznfwDYNnfbUVVygjF8YI/gWSAxszDLrBuf+OgzOg8E75rJfP64wiekKuT1fxfWY8tp+haoHQn4G/
	hcU5OjD0Ewf9gtu0OIcmfCGxSyBavpv4tdm+b2aUu0eaa2IZ4DRHtlNTMcfqDDg5Uhi/i074Cfuvj
	Gp1I1cfls5xxqUVhn7Z63UN3ko6wvXRAIL2cmxZ9ogCX9XzbzXfJFxHEz4DmB1UPdGDuhLVBt5KRu
	e/t9EuOP1ZZ2ZjqwHdbmGs0qzIn2MqfXHUQDRwnAkT5X71PWmB+Rny8R9LM9DIdmN/HHMOCMyKNAC
	KJP2LZuxI2y5PEmVMZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn9mw-00000001n1E-42wA;
	Thu, 21 Mar 2024 04:12:22 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn9mr-00000001n0O-1mh3
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 04:12:20 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-222ba2a19bdso343199fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 21:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1710994335; x=1711599135; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kduO0x4spM88iFaD5FhSFW1gMwV+o0hY6zrL+nrtm8g=;
        b=ujUTew26L+NnHjC8Zv32GFyuspAqSbgNjCCQMZudxbxLwd8VtvbXdg3xiwSaF1mOgj
         aVsk10IROG9j8OjjhNSXXsqLuDTSEv+HhCm0QCp+SvPh8medw3WC/AISQkl58hoCCgLX
         UjvAYzO0FRkY6Mu3skrfvvOhPXmqNexSo18xnm9bwZx1gH4h2DJ35cyBIidQt0fH5i/W
         pZ0PAvtDlijmnOKlIxHZ3C2ywMR9/6ejhc5O9vCfmeA+V0liJDvDlJ9YDup4pI8DFClw
         2PzS/lBhFaxme9nwIlFEvOIkH9T6HAUcN2ALmF58HFQkMoLZNrWKudT7fl7yMRSX9RT1
         ZALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710994335; x=1711599135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kduO0x4spM88iFaD5FhSFW1gMwV+o0hY6zrL+nrtm8g=;
        b=Jwv5yQvkieLmVzp12awvrSv5aNHelajbpwLL4QvCFMBeN0Wtie5z15L7rnR/A5k+y7
         GkaiCNu/ato7nE9AZX+vKlkxE4RbcyjmQO+Oohi8SthuQ2abxct0XemRL8dnw1GXIXvz
         GYPey5f6KGuqwWOUofYNSEfAZwjhXFAbmam37Fd8AgWiRsP+BJWtDLRZ8WXl0c5RV4JU
         KeEmIThmGA6OGuAeJSEnw9dfZQLy3vd0+pr+gJiddxccrKMjyNFVelHc282h1MHhXWgC
         mf3I9gmlZt33qGFRrRAVpfi26ctqCT5VRqXzfYX+gY40iJH8aaUo1TgWYo0+V69fPbW1
         v0mA==
X-Gm-Message-State: AOJu0YzsjYrH5l31vZ0RiEIWnSQDmx61B8/iuHCtRm5uB/Um6duEWZr3
	QVdrmbkqHxh59rx7PvoNQ04GWkGhiH7N9x1b0iVQtcWOhEGN98m8jPQzrYcV00U=
X-Google-Smtp-Source: AGHT+IGx3642CaswuSrx68/XcrK8Mgl4EVGL8+vIwCPFuG1X2sbTQHUJ7i2/MAIw0/siJ9d9NovCiw==
X-Received: by 2002:a05:6870:36d2:b0:222:7273:a0a6 with SMTP id u18-20020a05687036d200b002227273a0a6mr1054226oak.49.1710994334868;
        Wed, 20 Mar 2024 21:12:14 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:a790:e494:c435:a45e:14c9])
        by smtp.gmail.com with ESMTPSA id v18-20020aa78512000000b006e6c60aeb21sm12582842pfn.70.2024.03.20.21.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 21:12:14 -0700 (PDT)
Date: Wed, 20 Mar 2024 21:12:11 -0700
From: Drew Fustini <drew@pdp7.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq
 support
Message-ID: <Zfuzmx/bvJZjWDx4@x1>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
 <ZfiKooxO88h1nj35@x1>
 <Zfj4FnG5vAPP55ri@x1>
 <Zflm5cje/+rnZ7HH@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zflm5cje/+rnZ7HH@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_211218_917129_0F572B4E 
X-CRM114-Status: GOOD (  27.16  )
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

On Tue, Mar 19, 2024 at 03:50:21PM +0530, Sunil V L wrote:
> On Mon, Mar 18, 2024 at 07:27:34PM -0700, Drew Fustini wrote:
> > On Mon, Mar 18, 2024 at 11:40:34AM -0700, Drew Fustini wrote:
> > > On Thu, Feb 08, 2024 at 09:14:11AM +0530, Sunil V L wrote:
> > > > This series enables the support for "Collaborative Processor Performance
> > > > Control (CPPC) on ACPI based RISC-V platforms. It depends on the
> > > > encoding of CPPC registers as defined in RISC-V FFH spec [2].
> > > > 
> > > > CPPC is described in the ACPI spec [1]. RISC-V FFH spec required to
> > > > enable this, is available at [2].
> > > > 
> > > > [1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#collaborative-processor-performance-control
> > > > [2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v1.0.0/riscv-ffh.pdf
> > > > 
> > > > The series is based on the LPI support series.
> > > > Based-on: 20240118062930.245937-1-sunilvl@ventanamicro.com
> > > > (https://lore.kernel.org/lkml/20240118062930.245937-1-sunilvl@ventanamicro.com/)
> > > 
> > > Should the https://github.com/vlsunil/qemu/tree/lpi_exp branch also be
> > > used for this CPPC series too?
> > 
> > I noticed the ventanamicro qemu repo has a dev-upstream branch [1] which
> > contains 4bb6ba4d0fb9 ("riscv/virt: acpi: Enable CPPC - _CPC and _PSD").
> > I've built that but I still see 'SBI CPPC extension NOT detected!!' in
> > the Linux boot log.
> > 
> > I'm using upstream opensbi. It seems that sbi_cppc_probe() fails because
> > cppc_dev is not set. Nothing in the upstream opensbi repo seems to call
> > sbi_cppc_set_device(), so I am uncertain how it is possible for it to
> > work. Is there an opensbi branch I should be using?
> > 
> > Thanks,
> > Drew
> > 
> > [1] https://github.com/ventanamicro/qemu/tree/dev-upstream
> 
> Please use below branches for qemu and opensbi. These are just dummy
> objects/interfaces added to test the kernel change which are otherwise
> platform specific features.
> 
> https://github.com/vlsunil/qemu/tree/lpi_cppc_exp
> https://github.com/vlsunil/opensbi/tree/cppc_exp

I know the opensbi branch is just for the purpose of testing the kernel
driver. However, I am new to ACPI and I am trying to understand how a
real system might work.

The _CPC register address encoding in the RISC-V FFH spec enables the
SBI CPPC register ID to be specified. But how would SBI firmware know
what physical address corresponds to the CPPC register?

If sbi_cppc_test_write() [1] was implemented for a real system, then how
would it know what physical address to write to for a CPPC register like
SBI_CPPC_DESIRED_PERF?

Thanks,
Drew

[1] https://github.com/vlsunil/opensbi/commit/e23cda47158626f96e5992db00efaaac5dab31b0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
