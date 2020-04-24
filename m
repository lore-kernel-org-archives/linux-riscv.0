Return-Path: <SRS0=rCLW=6I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83F3C55191
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2020 11:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D89E20728
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2020 11:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NvT6NaM9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jnj5SANo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D89E20728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=av7dTh2ElNVV8YpwaW5sHDUFfVcuanj1A2AFuwlhev8=; b=NvT6NaM9tM1xbtxVpM02JNwiW
	DGMWh55KVKL706g6W82xK9Q/ZdNmTMdBAKkPFQHp12HWgOYaq5XTKc4Hi16wWMtu9nAftYjWdgur6
	bmFfwLF3RiCnd94xvluSnb+tkn5udyTIqXYIuwvVT05P6uOqQrMCx7KmOLFCcQ99AhYOFKlG/sLlV
	PcJYe3X0dlDoJDxAMXaPsR+1vL7YJs679kMLr1aVoYTSjK42C+788WEiGLpGyoJRQH+kWMGGVnnq1
	xbVEhqMAmV6xO+7jOlPUWeHlofMcq1r7BIBkjxmhlJDmnG7emM5bDHmUS5rTcw8GdDbmxeKWvKIE4
	ij+cDwubg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRwCO-0001PP-2O; Fri, 24 Apr 2020 11:08:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRwCM-0001Og-9b
 for linux-riscv@lists.infradead.org; Fri, 24 Apr 2020 11:08:47 +0000
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86769208E4
 for <linux-riscv@lists.infradead.org>; Fri, 24 Apr 2020 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587726525;
 bh=MnUmGYZCMAXrwd9Wl8Sg0pLyPh749CA1ljHIriACt2A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jnj5SANoBUUeCorqverdDXBjg8t7ipcS+zXEo3s1XcduJGjFq+j2TTNd7Apqwivbc
 btfinDDDCWuikp/WDLyZnC6TvgyJCrKDpqtVMRmwcZxM24IdU88/kdfCIYQ3jcz2Rh
 pq5wWGZOyJiQXLZB9+58rSy9T5zm27Nfiermab9o=
Received: by mail-io1-f52.google.com with SMTP id o127so9941715iof.0
 for <linux-riscv@lists.infradead.org>; Fri, 24 Apr 2020 04:08:45 -0700 (PDT)
X-Gm-Message-State: AGi0PubcG42pDcGIZR/A+SeEogpuap2Gul1YlyWTW6cCBOtYX3Q3UT+l
 y+SAhQguZksEDFR1LHarGDEUOaK/vw6qzov+HKE=
X-Google-Smtp-Source: APiQypIUnt7TFxeHpKI1zpEX8iuyWx566eOngxlXKi72BOdbKYjwid5POj/g92SUU/MXl+TlKDzTYjGpWkLDD8VP3TA=
X-Received: by 2002:a02:969a:: with SMTP id w26mr7461115jai.71.1587726524678; 
 Fri, 24 Apr 2020 04:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200422172414.6662-1-ardb@kernel.org>
 <mhng-f9b51803-74ca-494c-8433-59911c657b2f@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-f9b51803-74ca-494c-8433-59911c657b2f@palmerdabbelt-glaptop1>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 24 Apr 2020 13:08:33 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFSKoK8CqzKkruGsne0Ht9xz1cfdyWGY6vu7Z1w7JcB=A@mail.gmail.com>
Message-ID: <CAMj1kXFSKoK8CqzKkruGsne0Ht9xz1cfdyWGY6vu7Z1w7JcB=A@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Add UEFI support for RISC-V
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_040846_360078_4458FA46 
X-CRM114-Status: GOOD (  13.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-efi <linux-efi@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 24 Apr 2020 at 00:43, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 22 Apr 2020 10:24:07 PDT (-0700), ardb@kernel.org wrote:
> > This is a rework of Atish's series [0] to add EFI stub loader support
> > to the RISC-V port. The purpose is to split the code in a way that makes
> > it amenable to being merged via different trees during the same cycle.
> > While at it, I added a patch to disable initrd= loading for new ports,
> > given that it is deprecated and replaced with a method based on a
> > special UEFI device path.
> >
> > My changes are logged in the individual patches.
> >
> > I propose to take the first four patches via the EFI tree, and expose
> > them via a stable tag so that the RISC-V maintainers can merge it before
> > applying the remaining patches. That will ensure that both trees remain
> > in a buildable state, with working EFI stub support on the riscv branch.
>
> Works for me.  Thanks!
>

OK. I'll resend the final versions of the remaining patches (with the
ISA_C tweak added) to be taken into the RISC-V tree once the first few
patches have landed in tip/efi/core

