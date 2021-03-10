Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44305C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:20:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C272364FE8
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C272364FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dXVP6em/ZD6dpNJ4ZYfr3SrmD9H4/w2RWb9BnAxfGe0=; b=kMNlgmoD5gSuy00IeArMwK12X
	fqQhIoz+0We1qXpwcWSgTDlrvJafGJ6Z+33dUENK6uCnOUETKdXnjIdj+S3Quug3QNj+NFqn7NeZK
	M2bfbNCtfVSJhyJZG0384QC/lV8A5Ge4YIM9mA/EdEqKg7GkA6iYsSx6gY2RLsLeOn5trGs0GI8n3
	0hmlonO7L0Nr1R479UBiPmtBUBx/JTjZVj6u/0W17Uz/hvqmBw9Qu759P04hdvxSJL/K1ZQ6OLMxt
	tm85IP+hZes4RDjm/gNsHkB8hxCF0IfF82/hcltQXoxOgznwZgmdYEJlj71bHYkShsYkCsfRuEG5a
	KpEDpqnuQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJqKC-005zn2-SN; Wed, 10 Mar 2021 04:19:56 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJqK1-005zmD-0d
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 04:19:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id u14so20867987wri.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 20:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/p0KuSPe4AewqG1pG39BWFzJEi5DTd/uGT8+3t0pQ4s=;
 b=wzSOWnFqoa+NuVB4+F33FDM9Uy0WyHMqhhjElM7FyAAMNWbxEnRiRlsoY5O7Et2eBL
 CSV5hAf3l0XTGGv8dTwGo/Jk+f78zd0x/7X/X6pWgRHSmg/+zVyBCU+o1T4cq8yhvw0z
 3YdHIXKOQS6MqSuVZ4Gf/DVGX51+OSlyuETJUkt186kvPJ9xhGRrEeOLHroxnzAPVaKN
 598UwszJRzw+F16sTqUnW7c21eW/QQe+qjZouLl832JJ8VN5UzApGL/6I71D0kZEOscP
 XDP+6MS+rXaBN9h3vPzdlrWGRWfGAa4MjMTKNhZ95VNobjHRSHn0av4RIF2uXuitE0Vl
 JBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/p0KuSPe4AewqG1pG39BWFzJEi5DTd/uGT8+3t0pQ4s=;
 b=Ax3AsMsBwANkeYWRl7Thl0sbC0k6shzhMFlj3NYxXFXL/usZD/8EDijwVWVCCjB3tx
 KrIWYSJiv6o3pCiQ+NqrwOm+5mXjfM/8hyOO20998ExqPyIWzRxuFEyPJczn1vUlYhss
 /bYjx7FtAUqUgvGFA3kTE6yVuksQHTWVKIEJ6lAMbEKN8lMqjqX1v0Fnzs9apowxmLte
 HzwLVbwfVRVQ3wL6JItYojYubR1lLkaG4vsv8k+5cPvm3JRUYpk2r9rBXE+tkyHUV8nx
 KytLG5lGvf2/9g8ubZpb8wvQIUlzV6akcNYsDFZVnc/NuTWpkn7qnW51aNdK4DJrbHpN
 Sx0A==
X-Gm-Message-State: AOAM533uYUZcHLh5gLBmAQSNeASWxIFaMA+fY3/PU6ca5IzegWOLkJGN
 vwlX/3Y5K1/TJr3uzDqYXPENZ0kpTJMS5Nc+dKC5Lw==
X-Google-Smtp-Source: ABdhPJwuCSK4f2a+l4f8GIZ/CJCl/ameu8S9lv1R6o/2kFPYQA/m+ZJ9odXGzgKg/6WMvkhYdb53GzUPC2qkrJ+N04k=
X-Received: by 2002:adf:8545:: with SMTP id 63mr1197067wrh.128.1615349983905; 
 Tue, 09 Mar 2021 20:19:43 -0800 (PST)
MIME-Version: 1.0
References: <20210301115833.382364-1-anup.patel@wdc.com>
 <mhng-c42c46e0-4715-4630-9a28-02a1515dbcb0@penguin>
In-Reply-To: <mhng-c42c46e0-4715-4630-9a28-02a1515dbcb0@penguin>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 10 Mar 2021 09:49:32 +0530
Message-ID: <CAAhSdy2EHpbXXzA_7C4kvdmkkfX=G2jarARv3eimp3oQ+ywUvg@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: Use SBI SRST extension when available
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_041945_250497_A1F4270F 
X-CRM114-Status: GOOD (  25.68  )
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

On Wed, Mar 10, 2021 at 8:31 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Mon, 01 Mar 2021 03:58:33 PST (-0800), Anup Patel wrote:
> > The SBI SRST extension provides a standard way to poweroff and
> > reboot the system irrespective to whether Linux RISC-V S-mode
> > is running natively (HS-mode) or inside Guest/VM (VS-mode).
> >
> > The SBI SRST extension is available in latest SBI v0.3-draft
> > specification at: https://github.com/riscv/riscv-sbi-doc.
> >
> > This patch extends Linux RISC-V SBI implementation to detect
> > and use SBI SRST extension.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/include/asm/sbi.h | 16 ++++++++++++++
> >  arch/riscv/kernel/sbi.c      | 41 +++++++++++++++++++++++++++++++++---
> >  2 files changed, 54 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 99895d9c3bdd..8add0209c9c7 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -27,6 +27,7 @@ enum sbi_ext_id {
> >       SBI_EXT_IPI = 0x735049,
> >       SBI_EXT_RFENCE = 0x52464E43,
> >       SBI_EXT_HSM = 0x48534D,
> > +     SBI_EXT_SRST = 0x53525354,
> >  };
> >
> >  enum sbi_ext_base_fid {
> > @@ -70,6 +71,21 @@ enum sbi_hsm_hart_status {
> >       SBI_HSM_HART_STATUS_STOP_PENDING,
> >  };
> >
> > +enum sbi_ext_srst_fid {
> > +     SBI_EXT_SRST_RESET = 0,
> > +};
> > +
> > +enum sbi_srst_reset_type {
> > +     SBI_SRST_RESET_TYPE_SHUTDOWN = 0,
> > +     SBI_SRST_RESET_TYPE_COLD_REBOOT,
> > +     SBI_SRST_RESET_TYPE_WARM_REBOOT,
> > +};
> > +
> > +enum sbi_srst_reset_reason {
> > +     SBI_SRST_RESET_REASON_NONE = 0,
> > +     SBI_SRST_RESET_REASON_SYS_FAILURE,
> > +};
> > +
> >  #define SBI_SPEC_VERSION_DEFAULT     0x1
> >  #define SBI_SPEC_VERSION_MAJOR_SHIFT 24
> >  #define SBI_SPEC_VERSION_MAJOR_MASK  0x7f
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index f4a7db3d309e..49155588e56c 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -7,6 +7,7 @@
> >
> >  #include <linux/init.h>
> >  #include <linux/pm.h>
> > +#include <linux/reboot.h>
> >  #include <asm/sbi.h>
> >  #include <asm/smp.h>
> >
> > @@ -501,6 +502,32 @@ int sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
> >  }
> >  EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);
> >
> > +static void sbi_srst_reset(unsigned long type, unsigned long reason)
> > +{
> > +     sbi_ecall(SBI_EXT_SRST, SBI_EXT_SRST_RESET, type, reason,
> > +               0, 0, 0, 0);
> > +     pr_warn("%s: type=0x%lx reason=0x%lx failed\n",
> > +             __func__, type, reason);
> > +}
> > +
> > +static int sbi_srst_reboot(struct notifier_block *this,
> > +                        unsigned long mode, void *cmd)
> > +{
> > +     sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
> > +                    SBI_SRST_RESET_TYPE_WARM_REBOOT :
> > +                    SBI_SRST_RESET_TYPE_COLD_REBOOT,
> > +                    SBI_SRST_RESET_REASON_NONE);
> > +     return NOTIFY_DONE;
> > +}
> > +
> > +static struct notifier_block sbi_srst_reboot_nb;
> > +
> > +static void sbi_srst_power_off(void)
> > +{
> > +     sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
> > +                    SBI_SRST_RESET_REASON_NONE);
> > +}
> > +
> >  /**
> >   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
> >   * @extid: The extension ID to be probed.
> > @@ -577,22 +604,30 @@ void __init sbi_init(void)
> >                       sbi_get_firmware_id(), sbi_get_firmware_version());
> >               if (sbi_probe_extension(SBI_EXT_TIME) > 0) {
> >                       __sbi_set_timer = __sbi_set_timer_v02;
> > -                     pr_info("SBI v0.2 TIME extension detected\n");
> > +                     pr_info("SBI TIME extension detected\n");
> >               } else {
> >                       __sbi_set_timer = __sbi_set_timer_v01;
> >               }
> >               if (sbi_probe_extension(SBI_EXT_IPI) > 0) {
> >                       __sbi_send_ipi  = __sbi_send_ipi_v02;
> > -                     pr_info("SBI v0.2 IPI extension detected\n");
> > +                     pr_info("SBI IPI extension detected\n");
>
> These aren't really part of the reset stuff and should be split into a separate
> patch.

Yes, this should be in a separate patch. Thanks for catching.

>
> >               } else {
> >                       __sbi_send_ipi  = __sbi_send_ipi_v01;
> >               }
> >               if (sbi_probe_extension(SBI_EXT_RFENCE) > 0) {
> >                       __sbi_rfence    = __sbi_rfence_v02;
> > -                     pr_info("SBI v0.2 RFENCE extension detected\n");
> > +                     pr_info("SBI RFENCE extension detected\n");
> >               } else {
> >                       __sbi_rfence    = __sbi_rfence_v01;
> >               }
> > +             if (sbi_probe_extension(SBI_EXT_SRST) > 0 &&
> > +                 sbi_minor_version() >= 3) {
> > +                     pr_info("SBI SRST extension detected\n");
> > +                     pm_power_off = sbi_srst_power_off;
> > +                     sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
> > +                     sbi_srst_reboot_nb.priority = 192;
> > +                     register_restart_handler(&sbi_srst_reboot_nb);
> > +             }
> >       } else {
> >               __sbi_set_timer = __sbi_set_timer_v01;
> >               __sbi_send_ipi  = __sbi_send_ipi_v01;
>
> This is fine, but I don't want to take things for draft SBI versions until
> they're at least tagged.

Sure, no problem. The SBI v0.3-rc1 release is quite close so hopefully
in next 1-2 months it will be tagged.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
