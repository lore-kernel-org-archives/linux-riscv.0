Return-Path: <SRS0=eDvz=DK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62061C4363D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 07:35:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3003206CA
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 07:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sdebDEWP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="TSSOyFW/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3003206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cO51t1PPDLtoBhbV5pumYC4GvLM4C3+7irf1zlFKGdY=; b=sdebDEWP26Vjuqzrr7GoHfdVu
	CQywV9vnSEaHZF8fRSRYuF+6CUItTv/Gn8EyXQnZG4qj0OqDkcRFI4NkO81Hp7Vfz8/fhp9tPvug9
	KqLEU1LiKVBRqyEF1p/ZKCvU0XQhYR0LAz0IhLIWKqswMtvFl2olaAPwOWUSaXKKV8TQkq2kcJbF1
	m5Ae4gH0G3YsBu6duHS1oOd1EbuFa1qDdRbyq0owLsxcYPYXIRTJumr/WsSZXCORhWSp3HoYvoNxB
	Ga75m1jjzkVP4cTlMxtc7jTIaV0WgGoUdqpAjUAipGkwR2mqiMOPvONzyfZJ1cBiSd4gOTvH4HllX
	6X/DBZQSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOc44-0001a3-QQ; Sat, 03 Oct 2020 07:34:44 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOc41-0001Z6-KC
 for linux-riscv@lists.infradead.org; Sat, 03 Oct 2020 07:34:42 +0000
Received: by mail-io1-xd42.google.com with SMTP id z25so3933178iol.10
 for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2020 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A/hFuD0pWxvAf/6HKfG9LqHPnlCk2KB4TQo/QrnDyUw=;
 b=TSSOyFW/OsE891vjDb7uTsAgAOjucA7X2yx49uUci+QgjTnsFLeKrFPpq0ohIxle46
 oyrDjA0jZtSrhkp4pFV5Wcio2uO/B/9+FhfechaHG/ooSQfldB6CV29GjZE0QtaX4rwy
 u6ogpq2v9R3nGD1Wqzy4jiuRkAvvRUlMAsuhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A/hFuD0pWxvAf/6HKfG9LqHPnlCk2KB4TQo/QrnDyUw=;
 b=UGtJVi2wfznhgpvzz0021H3dnMd9PI1obffGSbe/ADf4zVVvrQ0ZDZJv37Tby0jVXG
 pJZQZZX8BPngyzvqMR3yQ4S4IoQXmeR3oLyJuM+SDWzOqOFPSZwOua7u8/vYtLm3fcgT
 XF5sE26Bakc3PUYe4I/5rkYPJaYQMe8cQHi1C6mSqwmME094wDjb4qT+8w9MMwjmIMpg
 f5daYU7XVxG6y4bMJEHzGyVJdD5yfSD8+O4LZOm6gSRfC6Wb7WdJ+wqBQf/tHK78NYP7
 iVTmjEQirHWb6P8srOhNZLvqLgYx+1IFZT+eLgxcXv6GceevTNgo1chyS7Dzmbd2G/aF
 5SBg==
X-Gm-Message-State: AOAM531kRUZdR/vqAzWQNidfuPxoqSRtv51OllLWgj1l7H1gCVyU+fpr
 DtGAME//yIPAjSE+8KQvPEHEy5CL9UiXH2BduMJf
X-Google-Smtp-Source: ABdhPJzU47BomkLH2sgLaq0NqpKKKH1s8t8ZcNa8isBsZIYcpKdYr02MEDk1Z/exFcavbhjUVNek9sg3AM9Q6uxaIdA=
X-Received: by 2002:a05:6638:2b3:: with SMTP id
 d19mr5543487jaq.141.1601710477948; 
 Sat, 03 Oct 2020 00:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201003063725.8698-1-xypron.glpk@gmx.de>
 <20201003063725.8698-2-xypron.glpk@gmx.de>
In-Reply-To: <20201003063725.8698-2-xypron.glpk@gmx.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 3 Oct 2020 00:34:27 -0700
Message-ID: <CAOnJCU+kit2dHihTad9UPYUmN0+EAdVN9m97ibs=Jnu44Qe_LQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: admin-guide: fdt and initrd load in EFI stub
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Ard Biesheuvel <ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_033441_710745_645208D5 
X-CRM114-Status: GOOD (  30.90  )
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
Cc: linux-efi <linux-efi@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 2, 2020 at 11:38 PM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> Describe how a device tree and an initial RAM disk can be passed to the EFI
> Boot Stub.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> v2:
>         mention EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER (thx Atish)
> ---
>  Documentation/admin-guide/efi-stub.rst | 35 ++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/Documentation/admin-guide/efi-stub.rst b/Documentation/admin-guide/efi-stub.rst
> index 833edb0d0bc4..4965dec48af4 100644
> --- a/Documentation/admin-guide/efi-stub.rst
> +++ b/Documentation/admin-guide/efi-stub.rst
> @@ -38,6 +38,34 @@ arch/arm/boot/zImage should be copied to the system partition, and it
>  may not need to be renamed. Similarly for arm64, arch/arm64/boot/Image
>  should be copied but not necessarily renamed.
>
> +Passing an initial RAM disk to the EFI Boot Stub
> +------------------------------------------------
> +
> +The following means sorted by decreasing priority can be used to provide an
> +initial RAM disk to the EFI Boot Stub:
> +
> +* The firmware may provide a UEFI Load File 2 Protocol. The stub will try to
> +  load the RAM disk by calling the LoadFile() service of the protocol using
> +  a vendor device path with the vendor GUID
> +  5568e427-0x68fc-4f3d-ac74-ca555231cc68.
> +* Next the EFI stub will try to load the file indicated by the "initrd=" command
> +  line parameter if CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER is enabled.
> +* The prior boot stage may pass the location of the initial RAM disk via the
> +  "linux,initrd-start" and "linux,initrd-end" properties of the "/chosen" node
> +  of the device-tree.
> +

Should we also specify which method is enabled by default for which
ARCH and recommended methods?

For example, It's recommended to use the LoadFile method for RISC-V
and new ARM systems.
Existing ARM ones will continue to use the initrd argument as that's
the method enabled by default.

> +The first two items are inhibited by the "noinitrd" command line parameter.
> +
> +Passing a device-tree to the EFI Boot Stub
> +------------------------------------------
> +
> +A device-tree can be passed to the EFI Boot Stub in decreasing priority using
> +
> +* command line option dtb=
> +* a UEFI configuration table with GUID b1b621d5-f19c-41a5-830b-d9152c69aae0.
> +

I am just curious. Is there any specific reason why efistub tries to
load the dtb from the command line first
and loads from the config table only if it fails from the first approach ?

> +The command line option is only available if CONFIG_EFI_ARMSTUB_DTB_LOADER=y
> +and secure boot is disabled.
>
>  Passing kernel parameters from the EFI shell
>  --------------------------------------------
> @@ -46,6 +74,10 @@ Arguments to the kernel can be passed after bzImage.efi, e.g.::
>
>         fs0:> bzImage.efi console=ttyS0 root=/dev/sda4
>
> +The "noinitrd" option
> +---------------------
> +
> +The "noinitrd" option stops the EFI stub from loading an initial RAM disk.
>
>  The "initrd=" option
>  --------------------
> @@ -98,3 +130,6 @@ CONFIGURATION TABLE.
>
>  "dtb=" is processed in the same manner as the "initrd=" option that is
>  described above.
> +
> +This option is only available if CONFIG_EFI_ARMSTUB_DTB_LOADER=y and secure
> +boot is disabled.
> --
> 2.28.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
