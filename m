Return-Path: <SRS0=eDvz=DK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1007FC41604
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 17:17:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A60C2064C
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 17:17:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rvzT6yMg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="eIQ2T+P6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A60C2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C13e9PsSoqym97QO4TuyxvFonOXvigVw9HA48Q7YdgQ=; b=rvzT6yMgQ4MDMP1CuPbwAHrb0
	Yqp/qDcA4smMTNOJSLUjaEZRETO2ZGNMDraOiIdZAnojELD8LGddpmIK1hc2+kWwkPh87xJsX0KjB
	L9dfdlLqaBcAJChh+1iSw0qs9jf7rOKU+0wjtyBSAovJlGFcbhptmpdNHvyP+hrg3vCEvrho9lE8E
	CoGezZyJzDpay4OrsgVRDJsrIClCx3EeCsXmvWHUsDKuJEfdN6d8wBq9MA0DuPKLqQ0X+eGMMFkE4
	/4AWl9npbzdCN0X3QUJ/wXRxDMxBTFlkA4qAjObC6w0CaxkjK1qSv9y4rTD+3I8OY7EKgdOYaK+1g
	jNZmTdFuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOl9Z-00080x-Op; Sat, 03 Oct 2020 17:17:01 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOl9W-000803-ED
 for linux-riscv@lists.infradead.org; Sat, 03 Oct 2020 17:16:59 +0000
Received: by mail-io1-xd41.google.com with SMTP id k6so4885062ior.2
 for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2020 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8XrZQLqnNMpD94S1G4sNZjRBettAl+4T8HbFLiItGrM=;
 b=eIQ2T+P6x2QPcxs1/JG3GsHnHMYI/bX1FzFRKyAKsYiwwbsyWTEZkpzIEiO4+6gL2y
 WAJlRooHf26F3JF2p9IYXC9Cs7nt5COQRcBYhJJRBHIW7Ap6QDsjGm7aFjkXzfmk6jp3
 0yftHf4IDDNCqkPXtgxTYjWX5S6bSvzH5SXgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8XrZQLqnNMpD94S1G4sNZjRBettAl+4T8HbFLiItGrM=;
 b=cMxWDRVvxvL0fwLgTeMSpUNuzcyvVJb1fYAas5fU2PCDJ0nMBQldJLF8w7wrJw4FI4
 VhEr1o6Fb3MNpKyp8zPSH3vTELSuz7pamOv/2H8/4dOCnDRasvyhZfvByC2xNiOZWlcI
 tHzZ0p3JkBsdkn3zL+pGYv4RSSDbSmqLI8IRSM2D8rCHIE9t01iACJOQfwlHcah6kuw8
 d9B2Df+QcZxAq2DJpXI7TLrkVI65N45U3d4mMmC37cRJYHNKNAeQG6Odcr9+eitiHMuG
 9dKDz2U6cuWE+VbLiG6m3jLO/grFEbb9RVm3H2yakmbL4Yq8ZTSbXZbFCgmRkUZMWdMZ
 24+g==
X-Gm-Message-State: AOAM530nZrLR4RMsPzhmQzOKNst+DiPxcZz+nZiiYuog522try5vdigc
 vJRxRBBj0VEosxSMJb753fOGEIXfpUkzEIL7UDY0
X-Google-Smtp-Source: ABdhPJw08RqpDULJ2XMeNRLoZk91UBhQgs+FPEYURdxrpoIj5OTTH9GFtO38kLkwuVFd5mZ+O05/5mnyG4xmbEqI/k0=
X-Received: by 2002:a05:6602:18a:: with SMTP id
 m10mr5793676ioo.174.1601745415299; 
 Sat, 03 Oct 2020 10:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201003063725.8698-1-xypron.glpk@gmx.de>
 <20201003063725.8698-2-xypron.glpk@gmx.de>
 <CAOnJCU+kit2dHihTad9UPYUmN0+EAdVN9m97ibs=Jnu44Qe_LQ@mail.gmail.com>
 <0c654506-9bb9-9aee-876e-8c1b8619eb67@gmx.de>
In-Reply-To: <0c654506-9bb9-9aee-876e-8c1b8619eb67@gmx.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 3 Oct 2020 10:16:44 -0700
Message-ID: <CAOnJCU+1vOk3AkGPBah8gPzwf1V1PXUfdxq9+Y17P=F_rOp9hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: admin-guide: fdt and initrd load in EFI stub
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_131658_859094_B8045085 
X-CRM114-Status: GOOD (  43.11  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Oct 3, 2020 at 1:29 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 03.10.20 09:34, Atish Patra wrote:
> > On Fri, Oct 2, 2020 at 11:38 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >>
> >> Describe how a device tree and an initial RAM disk can be passed to the EFI
> >> Boot Stub.
> >>
> >> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >> ---
> >> v2:
> >>         mention EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER (thx Atish)
> >> ---
> >>  Documentation/admin-guide/efi-stub.rst | 35 ++++++++++++++++++++++++++
> >>  1 file changed, 35 insertions(+)
> >>
> >> diff --git a/Documentation/admin-guide/efi-stub.rst b/Documentation/admin-guide/efi-stub.rst
> >> index 833edb0d0bc4..4965dec48af4 100644
> >> --- a/Documentation/admin-guide/efi-stub.rst
> >> +++ b/Documentation/admin-guide/efi-stub.rst
> >> @@ -38,6 +38,34 @@ arch/arm/boot/zImage should be copied to the system partition, and it
> >>  may not need to be renamed. Similarly for arm64, arch/arm64/boot/Image
> >>  should be copied but not necessarily renamed.
> >>
> >> +Passing an initial RAM disk to the EFI Boot Stub
> >> +------------------------------------------------
> >> +
> >> +The following means sorted by decreasing priority can be used to provide an
> >> +initial RAM disk to the EFI Boot Stub:
> >> +
> >> +* The firmware may provide a UEFI Load File 2 Protocol. The stub will try to
> >> +  load the RAM disk by calling the LoadFile() service of the protocol using
> >> +  a vendor device path with the vendor GUID
> >> +  5568e427-0x68fc-4f3d-ac74-ca555231cc68.
> >> +* Next the EFI stub will try to load the file indicated by the "initrd=" command
> >> +  line parameter if CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER is enabled.
> >> +* The prior boot stage may pass the location of the initial RAM disk via the
> >> +  "linux,initrd-start" and "linux,initrd-end" properties of the "/chosen" node
> >> +  of the device-tree.
> >> +
> >
> > Should we also specify which method is enabled by default for which
> > ARCH and recommended methods?
>
> The user relevant configuration is not the Linux' defconfig but what the
> distribution maintainer has baked. I doubt mentioning Linux' defaults is
> meaningful here.
>

Yes. But some distribution admin may think that one of these two configs
(initrd or dtb) are not enabled for RISC-V by mistake and enable it in
the distro config.
Ard had suggested that it is best if RISC-V doesn't inherit the legacy options.

> >
> > For example, It's recommended to use the LoadFile method for RISC-V
> > and new ARM systems.
>
> GRUB does not implement the LoadFile2 protocol yet. In U-Boot it is only
> good for testing. I am not aware of usability with unmodified EDK II.
> Why should we recommend anything before building the ecosystem that
> makes it useful?
>
> What is best may depend on the use case. There is nothing insecure in
> passing the initrd via "linux,initrd-start" and "linux,initrd-end" if
> you control the load options.
>
> The EBBR (https://github.com/arm-software/ebbr) might be a better place
> for a recommendation.
>

Agreed.

> > Existing ARM ones will continue to use the initrd argument as that's
> > the method enabled by default.
>
> Only if if the LoadFile2 protocol is not available because that has a
> higher priority for ARM, x86, and RISC-V.
>
> Should I consider my i.mx6 Wandboard Quad bought in 2013 "old" while it
> is running the U-Boot v2020.10-rc5, Linux v5.9-rc7, and Debian testing?
> A distinction between "old" and "new" systems seems irrelevant here. All
> are treated equal by the EFI stub.
>
> >
> >> +The first two items are inhibited by the "noinitrd" command line parameter.
> >> +
> >> +Passing a device-tree to the EFI Boot Stub
> >> +------------------------------------------
> >> +
> >> +A device-tree can be passed to the EFI Boot Stub in decreasing priority using
> >> +
> >> +* command line option dtb=
> >> +* a UEFI configuration table with GUID b1b621d5-f19c-41a5-830b-d9152c69aae0.
> >> +
> >
> > I am just curious. Is there any specific reason why efistub tries to
> > load the dtb from the command line first
> > and loads from the config table only if it fails from the first approach ?
>
> As we disable dtb= in secure boot it would make sense to turn the
> priorities around for non-secure boot too.
>
> But this is beyond the scope of a documentation patch.
>

Yes. I was just using the context to ask the question. I will send a
separate patch
for that.

> Best regards
>
> Heinrich
>
> >
> >> +The command line option is only available if CONFIG_EFI_ARMSTUB_DTB_LOADER=y
> >> +and secure boot is disabled.
> >>
> >>  Passing kernel parameters from the EFI shell
> >>  --------------------------------------------
> >> @@ -46,6 +74,10 @@ Arguments to the kernel can be passed after bzImage.efi, e.g.::
> >>
> >>         fs0:> bzImage.efi console=ttyS0 root=/dev/sda4
> >>
> >> +The "noinitrd" option
> >> +---------------------
> >> +
> >> +The "noinitrd" option stops the EFI stub from loading an initial RAM disk.
> >>
> >>  The "initrd=" option
> >>  --------------------
> >> @@ -98,3 +130,6 @@ CONFIGURATION TABLE.
> >>
> >>  "dtb=" is processed in the same manner as the "initrd=" option that is
> >>  described above.
> >> +
> >> +This option is only available if CONFIG_EFI_ARMSTUB_DTB_LOADER=y and secure
> >> +boot is disabled.
> >> --
> >> 2.28.0
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> >
> >
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
