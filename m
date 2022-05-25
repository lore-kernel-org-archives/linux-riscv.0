Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18989C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 15:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9GXnzIVA2947a/fECsNZfYcx2XCJ/Ocv38AFm4Ch6g=; b=JqD+R4CUtvvWxJ
	YatF1NWnVemYm0yQZ2qweU2Hkr37hUVVuYEUcI/3AOhAFxAgFpsdKQsG9pIWYfdn9pa/3dc4uVF+T
	nSr0Yxg1k56gCLiGF9yS6d7N7gEPAH6dmOkMscRTVygTJTd5MVOkidVsyIzjPXBD51jDGcZOa1s5l
	/e1A05dS375M/p2B3jhL0mtoXlWQCZV0ASxEtsrIHHQZjGTLQACWbg6NakWIwW5rHViaJqyknWsX2
	CozE3HBN6sQ499V0BvKM4fKtOGuK40N5GARJJ00ck16foEpEZUIc7Z+unJ2/Eh4ryQlu+36ppa37k
	xXNJ3nQYz2JpxCVp/H7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttG7-00BfYY-OT; Wed, 25 May 2022 15:49:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttG4-00BfWw-IW
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 15:49:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 370A261503
	for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 15:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C0B9C34113
	for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 15:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653493750;
	bh=bIicfEgP7s139tN40AgWtxDRRKGzaemz0C3u+wU/Nvo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zu8BQxKJOgVnmy8Qd3W+MW8TvMDQ4wUY7ngpChp1UIxpfL9uhVVt7AmSxzd4JIRVd
	 Ji9Fvgy6dUznbLvDkTxuqwrkO5N7YL3xCam3jVmgNGnydVKb7hVhpqCCXJaY7c495S
	 IK4G2F7g3ZgBjVctlZm9TIRCP9vZV1JsLkp2fRDU1hboXSIUN84t7Nb6eaTzxLV96M
	 xCwTTFvnvBJK/rF95CRD2qVJIwbKIbdK51cwThSzPRV8W/CONMHH68ymqCYCZlTxhw
	 V6V1EZWNU/vpu4HuhVdZQUAROSli/+9QCCmq4nQ6swrCPMkGtanlvLnh4Ln9j9oqoP
	 N7khJpD9nlwlg==
Received: by mail-oi1-f169.google.com with SMTP id l84so8160017oif.10
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 08:49:10 -0700 (PDT)
X-Gm-Message-State: AOAM530jSrlMszN77khdxZ7o3EoesGpGcUBr3Wh4X5ibQ7TV8S31ULUD
	Fp/O+CXotLwLdFNAPX+4yGe14uCFFp0n39PWzK4=
X-Google-Smtp-Source: ABdhPJxnXJzrIyy8yO9mGD/gM/HbAak5d4lmmJ0bhfehuzIYYF0oUNCap51EuqhgtyNx3s2OqxWIqc1veKX9La0GSYk=
X-Received: by 2002:a05:6808:e8d:b0:322:bac0:2943 with SMTP id
 k13-20020a0568080e8d00b00322bac02943mr5701111oil.126.1653493749757; Wed, 25
 May 2022 08:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com> <20220525151106.2176147-6-sunilvl@ventanamicro.com>
In-Reply-To: <20220525151106.2176147-6-sunilvl@ventanamicro.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 25 May 2022 17:48:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFhEBv7MVCKZuXdx9=hZx3qWbkATdLDwXAe_Zn9Xyx=dg@mail.gmail.com>
Message-ID: <CAMj1kXFhEBv7MVCKZuXdx9=hZx3qWbkATdLDwXAe_Zn9Xyx=dg@mail.gmail.com>
Subject: Re: [PATCH 5/5] riscv/efi_stub: Support for 64bit boot-hartid
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-efi <linux-efi@vger.kernel.org>, 
	Sunil V L <sunil.vl@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_084912_731710_829171A2 
X-CRM114-Status: GOOD (  21.50  )
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

On Wed, 25 May 2022 at 17:11, Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> The boot-hartid can be a 64bit value on RV64 platforms. Currently,
> the "boot-hartid" in DT is assumed to be 32bit only. This patch
> detects the size of the "boot-hartid" and uses 32bit or 64bit
> FDT reads appropriately.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/firmware/efi/libstub/riscv-stub.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 9e85e58d1f27..d748533f1329 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -29,7 +29,7 @@ static int get_boot_hartid_from_fdt(void)
>  {
>         const void *fdt;
>         int chosen_node, len;
> -       const fdt32_t *prop;
> +       const void *prop;
>
>         fdt = get_efi_config_table(DEVICE_TREE_GUID);
>         if (!fdt)
> @@ -40,10 +40,16 @@ static int get_boot_hartid_from_fdt(void)
>                 return -EINVAL;
>
>         prop = fdt_getprop((void *)fdt, chosen_node, "boot-hartid", &len);
> -       if (!prop || len != sizeof(u32))
> +       if (!prop)
> +               return -EINVAL;
> +
> +       if (len == sizeof(u32))
> +               hartid = (unsigned long) fdt32_to_cpu(*(fdt32_t *)prop);
> +       else if (len == sizeof(u64))
> +               hartid = (unsigned long) fdt64_to_cpu(*(fdt64_t *)prop);

Does RISC-V care about alignment? A 64-bit quantity is not guaranteed
to appear 64-bit aligned in the DT, and the cast violates C alignment
rules, so this should probably used get_unaligned_be64() or something
like that.


> +       else
>                 return -EINVAL;
>
> -       hartid = fdt32_to_cpu(*prop);
>         return 0;
>  }
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
