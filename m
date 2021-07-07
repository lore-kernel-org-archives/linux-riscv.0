Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6FDC07E96
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 03:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8276961CDE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 03:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8276961CDE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hAQBbPvymAO4WO9rfyXMePrKNgoNzenw7ymudniAwPQ=; b=UsFDix4ZngBu8u
	kG0fsCqivTbZtrslK+U9OCkak7xLlTTqgOcndUTgrv8uPDOV7t9uDxnKixquFWtqZc/RNobwZ1ic2
	cU1q/M91HhzyYK6a3eguP/tRZ+uTMzKZzX7Qy2P9FpFf43u90a0k7Yvs1nu1DzkpxkXHOFXxfqv0t
	G3X9vJ2wnM421yXKPurBuV5xqxFbS4KjTM8tL+qBahHaDpekot67cwH4f1xLGmEjHU5ZFMRsoN52V
	N8iCQoHLbO64djBmVIHlpS6FO3CtSB0/mJ5tFnU5Cz63w20nQk4e2xhPI7KwVo7LBi3uAiqyR5026
	HO/G1uvkheeYEkbsR/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1L54-00G1Qu-Di; Thu, 08 Jul 2021 03:52:06 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1L51-00G1QZ-4V
 for linux-riscv@lists.infradead.org; Thu, 08 Jul 2021 03:52:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id p8so5660444wrr.1
 for <linux-riscv@lists.infradead.org>; Wed, 07 Jul 2021 20:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=duMlAvykKtJsd1YyxKA8stEOfpUjQ4ZLog6TaI0hHCQ=;
 b=VUUXccn1x1bPJmxS+l1ZGcBft3knuFXtb9bL6VTB42ta7crZCYR2qLrHYQ6r0V14il
 5EpGqSTGZ70YuPKT3+69ZfvzQRfIrqk7GwZw72aQEPtIeng50mXiqXGZrxrzjtck4qtU
 n/RCbhL9NDJRIFFaY1gpcN9dYtW5Z6PsnNnBkppqCtyMuZjzoBQvQFKMdbKHoJUNGd2+
 mDF2m9FhRAaOTSlWAlAq7kitJQoMfjYZRq0z2JVk1o6eoSZniODz0EswikwHVD1u/WZU
 EtmdNa5uLhkTNfXrjI5Pj4EZctNSy+/Skf1zmhIMVwAjHT2nudxKZwtYO4ofKb0hD2kZ
 +nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=duMlAvykKtJsd1YyxKA8stEOfpUjQ4ZLog6TaI0hHCQ=;
 b=oxHfHng/VPx0E9b2fjpP+XhHUHBNvW8Hf8dNXeldNWtPHmA6TrKGXP1GrvHyYXgskI
 7IlSj04BZWb6eXdia6HNlRB+YgWIXuBkWkxpYPTUY8CEdtumDZeLQM0eAr8ox6l5E9du
 97OnCy8uK56tTyriNIs5AJv4jEBBwTQhD6aypd4dYVaGnREfi5KoVNBOVkg1QA9FSsAy
 9iT4Kb3hmHrgpCpDjDoHui2yKGRZRvyjfOnpO7L8sCPXo+g6zF6U3SiWvI+OuXKZf6Ft
 W2ebcKam1syfGTzifPBWTfXMCr62EBFmumT6tCQl7te3Wxj2MmK+CndTbcLORvpuH/LC
 eRKg==
X-Gm-Message-State: AOAM532916O0ofDCDtdalcqTB/KtIZYOj8/wxxA+4Pe2GseUYfOJY9zQ
 Bv/RWTyj7KyE8OxZENiDkrMkcEW2ejWPu50I4i4cUg==
X-Google-Smtp-Source: ABdhPJy1YpF8rafiUI7/iw1GjU67ogfuTO6JIWE6V8Bp6LLJMFIngdHJNtQzAPFvXBi71daTyLbohMmteyX9oPwCsIQ=
X-Received: by 2002:a5d:4d4b:: with SMTP id a11mr7735425wru.325.1625716320438; 
 Wed, 07 Jul 2021 20:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0=XANwm4Vr5qbpvJdqwYNCfDRNTDf3cyAOGp-NuqF_Ag@mail.gmail.com>
 <mhng-b2af24ea-608a-4e2c-af51-6dc7e415bf30@palmerdabbelt-glaptop>
In-Reply-To: <mhng-b2af24ea-608a-4e2c-af51-6dc7e415bf30@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 Jul 2021 21:19:46 +0530
Message-ID: <CAAhSdy2TcESa_zfO28VGPuOH6+7T+U-Pa25G959LvMCmU49pJA@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] RISC-V: Use SBI SRST extension when available
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_205203_273099_B55D2CA9 
X-CRM114-Status: GOOD (  30.38  )
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

On Wed, Jul 7, 2021 at 1:57 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Mon, 21 Jun 2021 21:46:46 PDT (-0700), anup@brainfault.org wrote:
> > Hi Palmer,
> >
> > On Wed, Jun 9, 2021 at 5:43 PM Anup Patel <anup.patel@wdc.com> wrote:
> >>
> >> The SBI SRST extension provides a standard way to poweroff and
> >> reboot the system irrespective to whether Linux RISC-V S-mode
> >> is running natively (HS-mode) or inside Guest/VM (VS-mode).
> >>
> >> The SBI SRST extension is available in the SBI v0.3 specification.
> >> (Refer, https://github.com/riscv/riscv-sbi-doc/releases/tag/v0.3.0-rc1)
> >
> > Can you please consider this patch for Linux-5.14-rc1 ?
> >
> > The SBI v0.3 spec is already frozen and this patch has been
> > floating on LKML for quite a few months now.
>
> I didn't realize that SBI-0.3 had been frozed.  That link is to a RC,
> the cooresponding v0.3.0 tag isn't in that repo.  Can you give me a
> pointer to the frozen spec?

Here's the link to SBI v0.3.0 tag:
https://github.com/riscv/riscv-sbi-doc/releases/tag/v0.3.0

We treat RC tags as frozen in SBI spec because no functional
changes are done in SBI spec after it is tagged as RC. We only
do typo fixes and clarifications on SBI spec RC release.

Regards,
Anup

>
> >
> > Regards,
> > Anup
> >
> >>
> >> This patch extends Linux RISC-V SBI implementation to detect
> >> and use SBI SRST extension.
> >>
> >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> >> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> >> ---
> >>  arch/riscv/include/asm/sbi.h | 24 ++++++++++++++++++++++++
> >>  arch/riscv/kernel/sbi.c      | 35 +++++++++++++++++++++++++++++++++++
> >>  2 files changed, 59 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> >> index 0d42693cb65e..289621da4a2a 100644
> >> --- a/arch/riscv/include/asm/sbi.h
> >> +++ b/arch/riscv/include/asm/sbi.h
> >> @@ -27,6 +27,7 @@ enum sbi_ext_id {
> >>         SBI_EXT_IPI = 0x735049,
> >>         SBI_EXT_RFENCE = 0x52464E43,
> >>         SBI_EXT_HSM = 0x48534D,
> >> +       SBI_EXT_SRST = 0x53525354,
> >>  };
> >>
> >>  enum sbi_ext_base_fid {
> >> @@ -70,6 +71,21 @@ enum sbi_hsm_hart_status {
> >>         SBI_HSM_HART_STATUS_STOP_PENDING,
> >>  };
> >>
> >> +enum sbi_ext_srst_fid {
> >> +       SBI_EXT_SRST_RESET = 0,
> >> +};
> >> +
> >> +enum sbi_srst_reset_type {
> >> +       SBI_SRST_RESET_TYPE_SHUTDOWN = 0,
> >> +       SBI_SRST_RESET_TYPE_COLD_REBOOT,
> >> +       SBI_SRST_RESET_TYPE_WARM_REBOOT,
> >> +};
> >> +
> >> +enum sbi_srst_reset_reason {
> >> +       SBI_SRST_RESET_REASON_NONE = 0,
> >> +       SBI_SRST_RESET_REASON_SYS_FAILURE,
> >> +};
> >> +
> >>  #define SBI_SPEC_VERSION_DEFAULT       0x1
> >>  #define SBI_SPEC_VERSION_MAJOR_SHIFT   24
> >>  #define SBI_SPEC_VERSION_MAJOR_MASK    0x7f
> >> @@ -148,6 +164,14 @@ static inline unsigned long sbi_minor_version(void)
> >>         return sbi_spec_version & SBI_SPEC_VERSION_MINOR_MASK;
> >>  }
> >>
> >> +/* Make SBI version */
> >> +static inline unsigned long sbi_mk_version(unsigned long major,
> >> +                                           unsigned long minor)
> >> +{
> >> +       return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
> >> +               SBI_SPEC_VERSION_MAJOR_SHIFT) | minor;
> >> +}
> >> +
> >>  int sbi_err_map_linux_errno(int err);
> >>  #else /* CONFIG_RISCV_SBI */
> >>  static inline int sbi_remote_fence_i(const unsigned long *hart_mask) { return -1; }
> >> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> >> index 7402a417f38e..9a84f0cb5175 100644
> >> --- a/arch/riscv/kernel/sbi.c
> >> +++ b/arch/riscv/kernel/sbi.c
> >> @@ -7,6 +7,7 @@
> >>
> >>  #include <linux/init.h>
> >>  #include <linux/pm.h>
> >> +#include <linux/reboot.h>
> >>  #include <asm/sbi.h>
> >>  #include <asm/smp.h>
> >>
> >> @@ -501,6 +502,32 @@ int sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
> >>  }
> >>  EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);
> >>
> >> +static void sbi_srst_reset(unsigned long type, unsigned long reason)
> >> +{
> >> +       sbi_ecall(SBI_EXT_SRST, SBI_EXT_SRST_RESET, type, reason,
> >> +                 0, 0, 0, 0);
> >> +       pr_warn("%s: type=0x%lx reason=0x%lx failed\n",
> >> +               __func__, type, reason);
> >> +}
> >> +
> >> +static int sbi_srst_reboot(struct notifier_block *this,
> >> +                          unsigned long mode, void *cmd)
> >> +{
> >> +       sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
> >> +                      SBI_SRST_RESET_TYPE_WARM_REBOOT :
> >> +                      SBI_SRST_RESET_TYPE_COLD_REBOOT,
> >> +                      SBI_SRST_RESET_REASON_NONE);
> >> +       return NOTIFY_DONE;
> >> +}
> >> +
> >> +static struct notifier_block sbi_srst_reboot_nb;
> >> +
> >> +static void sbi_srst_power_off(void)
> >> +{
> >> +       sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
> >> +                      SBI_SRST_RESET_REASON_NONE);
> >> +}
> >> +
> >>  /**
> >>   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
> >>   * @extid: The extension ID to be probed.
> >> @@ -608,6 +635,14 @@ void __init sbi_init(void)
> >>                 } else {
> >>                         __sbi_rfence    = __sbi_rfence_v01;
> >>                 }
> >> +               if ((sbi_spec_version >= sbi_mk_version(0, 3)) &&
> >> +                   (sbi_probe_extension(SBI_EXT_SRST) > 0)) {
> >> +                       pr_info("SBI SRST extension detected\n");
> >> +                       pm_power_off = sbi_srst_power_off;
> >> +                       sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
> >> +                       sbi_srst_reboot_nb.priority = 192;
> >> +                       register_restart_handler(&sbi_srst_reboot_nb);
> >> +               }
> >>         } else {
> >>                 __sbi_set_timer = __sbi_set_timer_v01;
> >>                 __sbi_send_ipi  = __sbi_send_ipi_v01;
> >> --
> >> 2.25.1
> >>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
