Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC63EEAA51
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/j0YoKgay5tx3SxgdMZIU+MyETLfTTDwprp9Vbk1JKc=; b=2MEd0NpzO+GomB
	kDPe4H+DkxAChHf/KuyaXvtI1xZk1gcwGZ34O0BkLTnG6x7CfjFJ5yxDIZsudce0XwAH/xgUBlM/2
	mXy/GiZY9s7OtU1VJrBwfHVfomShzLg8lJD15T8gy5DxSgd+h39tAwfGim81spsXzEPTq6AhSnNnq
	vR9vgfPM5j0K4/NV8AtRkVDShYJGFdRX1foOnsDJm6jzbogjwy2/UEA0t+b9Wtf+c5dwtv77stDKC
	jaL456PfrHuRkA7xEi37dkKX4Yvn5MUWHw5fEtD1WD0YxF+w/3p4SjC2eFwdYUS2Z1pWigMU5+EwY
	GC6iAXtXK58Wh+X6os7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgoMd-008nqm-2G;
	Thu, 14 Sep 2023 15:34:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgoMa-008npX-3A;
	Thu, 14 Sep 2023 15:34:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4868C61DF1;
	Thu, 14 Sep 2023 15:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE9AC433C8;
	Thu, 14 Sep 2023 15:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694705679;
	bh=TC5noj5ktH2x7QwQggxt68bg/J4n39+D6FUOyZfzpR8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VhZ3lpyNJ5JBnKIJXQOzqzyIyRP8YcFLhoDiqbK4XOP9op/up4vR9RzbsJ7Pv804p
	 1KFaej6Kan7MvEO6Pff3K4+JM46O38+EbToWV3Bm57EFMSKdtyiTKP8sGrZqGcoNdp
	 CZVXZ7ghIgZvbiwLSS2efunPvRGUYvHx4DmsMMhmbogIs5mrsYaG/1ZVOjhrE2UAhz
	 Tn0tyQ2lp9STPxG+fwsM3Aw/uNkTbUagLsBC1h2k74xzjTz5o/s0LCn+IvEaZY/DjV
	 QdWtANlmUc8rNkMzESluMKsL114Kx9zJGiTuZMwgoFyXLwvPd/RJc/dXHmUviwA8Eq
	 xR45CY7Bl5RKw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-502d9ce31cbso1875868e87.3;
        Thu, 14 Sep 2023 08:34:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx4nRu1lGMOY3YC/YyhQi1x153Gewb4DwUzfRhrMC+uS3EtXTF+
	nEWavuaoVo8h+PggQrat2lscf4lP2N8I7syRGPU=
X-Google-Smtp-Source: AGHT+IHQWhXWk9WB76jsul3E8BXF8FIj2XgeZXziogZ8+9RlZta9SMLLLzxXno0++LBAsD2vWnMl44SVOfg370+hAkA=
X-Received: by 2002:a05:6512:452:b0:500:bb99:69a7 with SMTP id
 y18-20020a056512045200b00500bb9969a7mr4588249lfk.14.1694705677877; Thu, 14
 Sep 2023 08:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230913163823.7880-1-james.morse@arm.com> <20230913163823.7880-28-james.morse@arm.com>
 <CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com> <20230914155459.00002dba@Huawei.com>
In-Reply-To: <20230914155459.00002dba@Huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 14 Sep 2023 17:34:25 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFquiLGCMow3iujHUU4GBZx2t9KfKy1R9iqjBFjY+acaA@mail.gmail.com>
Message-ID: <CAMj1kXFquiLGCMow3iujHUU4GBZx2t9KfKy1R9iqjBFjY+acaA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields [code first?]
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Russell King <linux@armlinux.org.uk>, Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, 
	justin.he@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_083441_105883_E04BB575 
X-CRM114-Status: GOOD (  28.64  )
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

On Thu, 14 Sept 2023 at 16:55, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Thu, 14 Sep 2023 09:57:44 +0200
> Ard Biesheuvel <ardb@kernel.org> wrote:
>
> > Hello James,
> >
> > On Wed, 13 Sept 2023 at 18:41, James Morse <james.morse@arm.com> wrote:
> > >
> > > Add the new flag field to the MADT's GICC structure.
> > >
> > > 'Online Capable' indicates a disabled CPU can be enabled later.
> > >
> >
> > Why do we need a bit for this? What would be the point of describing
> > disabled CPUs that cannot be enabled (and are you are aware of
> > firmware doing this?).
>
> Enabled being not set is common at some similar ACPI tables at least.
>
> This is available in most ACPI tables to allow firmware to use 'nearly'
> static tables and just tweak the 'enabled' bit to say if the record should
> be ignored or not. Also _STA not present which is for same trick.
> If you are doing clever dynamic tables, then you can just not present
> the entry.
>
> With that existing use case in mind, need another bit to say this
> one might one day turn up.  Note this is copied from x86 though no
> one seems to have implemented the kernel support for them yet.
>
> Note as per my other reply - this isn't a code first proposal. It's in the
> spec already (via a code first proposal last year I think).
>
> >
> > So why are we not able to assume that this new bit can always be treated as '1'?
>
> Given above, need the extra bit to size stuff to allow for the CPU showing up
> late.
>

So does this mean that on x86, the CPU object is instantiated only
when the hardware level hotplug occurs? And before that, the object
does not exist at all?

Because it seems to me that _STA, having both enabled and present
bits, could already describe what we need here, and arguably, a CPU
that is not both present and enabled should not be used by the OS.
This would leave room for representing off-line CPUs as present but
not enabled.

Apologies if I am missing something obvious here - the whole rationale
behind this thing is rather confusing to me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
