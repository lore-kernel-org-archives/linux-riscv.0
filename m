Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3639BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 23:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3kcdDdF7XcyvGiiNpxl7vdZa7yhCTXJcTRcpHTUx9o=; b=QLBIwqm/4jKJnb
	9r2qIbzMZD+pTtTCqDCSTiRzc/+YMigXFgPgy0VevWehFKpFBzKHRz/wqtLHrMMp3BN1r9CN4Cfxj
	RM+rzxTkMsQKsYtPfN6rYcXxi7pxxXVDJueZyekmqco2AheS2mHujcIB+4Rr/TQAp7jUvwdbL3cH2
	sbhkZ0NSU0pHDPKUXubC6OWZfIVJGz0QXY7cpo6JSMcrTRho1Dj9AH+b/Y/Tbbm74KaHk3ZKaZoV8
	0GybX8q9qMwCp33j6V4SF9figsiarGsIS/1Pmw1g0VT9FuUO1y8Q1sw//fNqFoh1Jg0QOhI5Z5M+5
	d8zCzpjiFNa6HSGQ/Nmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu0lM-00CyOs-QX; Wed, 25 May 2022 23:50:00 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu0lK-00CyOG-93
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 23:49:59 +0000
Received: by mail-yb1-xb33.google.com with SMTP id x137so345671ybg.5
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 16:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2b8MlsVgy0PXNmTV8dy+TKz5ObSmm8PiUnaznemS1Kk=;
        b=RnE0k5m41tRreeyjV9rIBQp9IS8n51q9BWAAP9GOOssrHJTyMFtm4+pWqy0RYQfjxn
         yKed2IVryFnIF5xIWCU9MAdGEa/N9nXMxd6lVgHwZeq/y89d3yGfxFLVc3P7CG36Zp4Z
         KjivNcINMRfMiq3+Hz52iMRYUSqaAgCxB5S/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2b8MlsVgy0PXNmTV8dy+TKz5ObSmm8PiUnaznemS1Kk=;
        b=h9BSgLjKGZhM7buWtcI/aQaLse0yJ6I7EbJWmantFVnQ/2l72PYjNqgPg1DCwuVacq
         C2pvffqGmKOfPbfBqSri+e1VQAD0hxnqnpq396YuwVoOKu08LdJrwyyqa0PmGKJEhJ3o
         gYqyVYZZ+tjM3gtfIVao6YHk4WU55dABOFZG5BAngfPKmcdFx+FPXdWL+dVFRgXZK5WJ
         uepV0hl9Dy/zeMnjVrUBiiUWzVDGT6KplZ3Q6/wMzMV1AwjeTTt0/s0kYKat1ycZbu24
         C4XV9YAQlGqwXwWGqVc5k4MsJZW9OTQDiXHw8+8eqchvigdujxXua+SZiICoiFYDlp5G
         ocEw==
X-Gm-Message-State: AOAM530dnSykfA4VaM+Pe7ME2wAi38aoRHm47mWqeSB5OogxZcxU7kjB
	WceV/RDUGZ/8Ft9kvIUeu68mpWdgADyzpAXx8f2J
X-Google-Smtp-Source: ABdhPJx01HOcesLXja2nXoz3VGaZoBMY86NiLV8f653GkRtUx7ztDYWr3KTWHpdFIcaTk74gwDVwL9zVZHwKKB5bmIk=
X-Received: by 2002:a25:a287:0:b0:656:29f4:b0c1 with SMTP id
 c7-20020a25a287000000b0065629f4b0c1mr3996630ybi.598.1653522597025; Wed, 25
 May 2022 16:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
 <20220525151106.2176147-6-sunilvl@ventanamicro.com> <CAMj1kXFhEBv7MVCKZuXdx9=hZx3qWbkATdLDwXAe_Zn9Xyx=dg@mail.gmail.com>
 <1e90b15b-8c73-0de8-2885-1292923b7575@canonical.com> <CAOnJCU+r6KgR7bd2dx5QLmmVLjJX8GhETHb6rG65wq0e_m6FVA@mail.gmail.com>
 <5829932A-6E45-46CA-AADA-14EDD903C4AD@jrtc27.com>
In-Reply-To: <5829932A-6E45-46CA-AADA-14EDD903C4AD@jrtc27.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 25 May 2022 16:49:46 -0700
Message-ID: <CAOnJCUKbT88c+_PzEuchEtzjEtiHcMFvRH_G98z1AmpSdRH+BA@mail.gmail.com>
Subject: Re: [PATCH 5/5] riscv/efi_stub: Support for 64bit boot-hartid
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-efi <linux-efi@vger.kernel.org>, 
	Sunil V L <sunil.vl@gmail.com>, Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_164958_356093_E6F29A53 
X-CRM114-Status: GOOD (  35.12  )
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

On Wed, May 25, 2022 at 4:36 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 26 May 2022, at 00:11, Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Wed, May 25, 2022 at 9:09 AM Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> >>
> >> On 5/25/22 17:48, Ard Biesheuvel wrote:
> >>> On Wed, 25 May 2022 at 17:11, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >>>>
> >>>> The boot-hartid can be a 64bit value on RV64 platforms. Currently,
> >>>> the "boot-hartid" in DT is assumed to be 32bit only. This patch
> >>>> detects the size of the "boot-hartid" and uses 32bit or 64bit
> >>>> FDT reads appropriately.
> >>>>
> >>>> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> >>>> ---
> >>>> drivers/firmware/efi/libstub/riscv-stub.c | 12 +++++++++---
> >>>> 1 file changed, 9 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> >>>> index 9e85e58d1f27..d748533f1329 100644
> >>>> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> >>>> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> >>>> @@ -29,7 +29,7 @@ static int get_boot_hartid_from_fdt(void)
> >>>> {
> >>>> const void *fdt;
> >>>> int chosen_node, len;
> >>>> - const fdt32_t *prop;
> >>>> + const void *prop;
> >>>>
> >>>> fdt = get_efi_config_table(DEVICE_TREE_GUID);
> >>>> if (!fdt)
> >>>> @@ -40,10 +40,16 @@ static int get_boot_hartid_from_fdt(void)
> >>>> return -EINVAL;
> >>>>
> >>>> prop = fdt_getprop((void *)fdt, chosen_node, "boot-hartid", &len);
> >>>> - if (!prop || len != sizeof(u32))
> >>>> + if (!prop)
> >>>> + return -EINVAL;
> >>>> +
> >>>> + if (len == sizeof(u32))
> >>>> + hartid = (unsigned long) fdt32_to_cpu(*(fdt32_t *)prop);
> >>>> + else if (len == sizeof(u64))
> >>>> + hartid = (unsigned long) fdt64_to_cpu(*(fdt64_t *)prop);
> >>>
> >>> Does RISC-V care about alignment? A 64-bit quantity is not guaranteed
> >>> to appear 64-bit aligned in the DT, and the cast violates C alignment
> >>> rules, so this should probably used get_unaligned_be64() or something
> >>> like that.
> >>
> >> When running in S-mode the SBI handles unaligned access but this has a
> >> performance penalty.
> >>
> >> We could use fdt64_to_cpu(__get_unaligned_t(fdt64_t, prop)) here.
> >>
> >
> > It is better to avoid unaligned access in the kernel. There are some
> > plans to disable
> > misaligned load/store emulation in the firmware if user space requests
> > it via prctl.
>
> Why?
>
To support prctl call with PR_SET_UNALIGN

> Jess
>
> > We need another SBI extension to do that. The idea is to keep it
> > enabled by default in the firmware but
> > userspace should have an option to disable it via prctl. If we make
> > sure that the kernel doesn't invoke any
> > unaligned access, this feature can be implemented easily.
> >
> >> Best regards
> >>
> >> Heinrich
> >>
> >>>
> >>>
> >>>> + else
> >>>> return -EINVAL;
> >>>>
> >>>> - hartid = fdt32_to_cpu(*prop);
> >>>> return 0;
> >>>> }
> >>>>
> >>>> --
> >>>> 2.25.1
> >>>>
> >>
> >
> >
> > --
> > Regards,
> > Atish
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
