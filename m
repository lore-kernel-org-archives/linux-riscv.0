Return-Path: <SRS0=b61k=IA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37B1C43381
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 04:10:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 708BC600EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Mar 2021 04:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 708BC600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MRed8STWWV4KQBcDqnukV1fPnDoZ8FkoRpPWpVRmgno=; b=SvIfrxkmiXM88Cdhu4U0SqlD4
	aMt/KoEXhC359uhqK6enU4awQ6CuxGxzlTzviJO+EeBOZ6LzHOXBXZcYCswlH2fP7nL/CVIWDdY85
	PGziR1i8WrEn9cLbg9Tj57X2KD7YKMtJdUAOCv2GCRmedXaOGRs3Ffc6zRRILVSgDGwv0bZZ4+F6a
	c4y7C5iZVxwBo0dWHW2N//6OM9IvKWYEx+MD7kpTm2PJ3oyOAnBKEG+PxKq5j2OqN/v22HofnRmfs
	MfB0cJGsEBJCHo/+NJHDeCWwq8YXkwAAL65mTKdSwbkosguiIzmeQdJ02fUafz+WORapTx5mB8TU1
	GuS+Gq5Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGwLv-0005BY-Q7; Tue, 02 Mar 2021 04:09:43 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGwLs-0005B3-QF
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 04:09:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id v15so18395650wrx.4
 for <linux-riscv@lists.infradead.org>; Mon, 01 Mar 2021 20:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UCeThmfIe2FMGTwXvgjfzTMdkfhIc6RQTvnKJCcY5ww=;
 b=LNxuVnPiqlYI2Cx/+1uZU4/zNU60ZGkrfkAKcoAm5JIJhyLMktvkzk0UxUxTLTcI62
 xTW87eL1gCXwBvU8WDbErA5qHRvowXR7ujNi/lM/n6mlzvIO3o9KaMxp7qd/D+BtbQHs
 5ewCRTCf3QOfcHSjynbUjqyHxHAXq/n6v8/MuI64uA/mxJ60ocIY4nwzN76+h2sOAQP1
 wdIlaVF/tWe/GR0RWvBDiJ8WwPkqoH9JuOIvZ32liz1vup8CKghAWtwQv+Ibsjh74f3c
 1NZgpFMCZSxhTADVjoKdhBo0kPIeh4okPjgXsMDbrK3eoDdgDjkonbeEZG4huVSs6viL
 W2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UCeThmfIe2FMGTwXvgjfzTMdkfhIc6RQTvnKJCcY5ww=;
 b=ssrlK4mIPkBNPvz/xz8RkPpTzOGyPFL6+wTCSH9UM/tQdsShCb6+rtDqDfdDlyALMB
 E3R+dcRgbV5MnDlnoGjCMhUaCPy3dNcOI1gQBNjcFz+bEaVifkqjV1haL8loQ28LKhDf
 ZsXLcCZqlulYy+g9PYbWBnCsmH3ZT8h1byvYEvlFDn/VNV9vmBB2dQPU93OawmzBfGTQ
 piEGQ4wqq7a5NYFoU5G6aE2vFM9BysMO+xabeNrDxNrT+yqgW4c76xRVuTZlF9qHwKgm
 nIw8kwwlSYFazA1WSFaOdWsMgcLyjWchyTHXwfIEyV1webAfBYlgpEPA2+tjpaAVq2KR
 tbmQ==
X-Gm-Message-State: AOAM533TDiaep/ef0j5C2Cjb5iAxDb0ORnD6VUbS+gYNFQ/0Z+segaPP
 2gXllMmpJVpQWGouieQSkkPo6X3iCOecAEaBsVvmjQ==
X-Google-Smtp-Source: ABdhPJzijNchW1FMIfoiLAJ0Ttpyzpbys0MHDzxBDPZkoOMnfy4ukVWMfctUZImukgxlah95MvrEo9XOk88RgshTCDg=
X-Received: by 2002:adf:d236:: with SMTP id k22mr12735707wrh.144.1614658177426; 
 Mon, 01 Mar 2021 20:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20210301115833.382364-1-anup.patel@wdc.com>
In-Reply-To: <20210301115833.382364-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Mar 2021 09:39:26 +0530
Message-ID: <CAAhSdy1hR8v6UL_sLo367M90AcxVz8RXt03ccBdvqByTbt3qfw@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: Use SBI SRST extension when available
To: Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_230940_976698_2D67DE17 
X-CRM114-Status: GOOD (  20.57  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 1, 2021 at 5:29 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The SBI SRST extension provides a standard way to poweroff and
> reboot the system irrespective to whether Linux RISC-V S-mode
> is running natively (HS-mode) or inside Guest/VM (VS-mode).
>
> The SBI SRST extension is available in latest SBI v0.3-draft
> specification at: https://github.com/riscv/riscv-sbi-doc.
>
> This patch extends Linux RISC-V SBI implementation to detect
> and use SBI SRST extension.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---

I missed adding changelog here so here it is ...

Changes since v3:
 - Rebased on Linux-5.12-rc1
 - Check SBI spec version when probing for SRST extension
Changes since v2:
 - Rebased on Linux-5.10-rc5
 - Updated patch as-per SBI SRST extension available in the latest
   SBI v0.3-draft specification
Changes since v1:
 - Updated patch as-per latest SBI SRST extension draft spec where
   we have only one SBI call with "reset_type" parameter

Regards,
Anup

>  arch/riscv/include/asm/sbi.h | 16 ++++++++++++++
>  arch/riscv/kernel/sbi.c      | 41 +++++++++++++++++++++++++++++++++---
>  2 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 99895d9c3bdd..8add0209c9c7 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -27,6 +27,7 @@ enum sbi_ext_id {
>         SBI_EXT_IPI = 0x735049,
>         SBI_EXT_RFENCE = 0x52464E43,
>         SBI_EXT_HSM = 0x48534D,
> +       SBI_EXT_SRST = 0x53525354,
>  };
>
>  enum sbi_ext_base_fid {
> @@ -70,6 +71,21 @@ enum sbi_hsm_hart_status {
>         SBI_HSM_HART_STATUS_STOP_PENDING,
>  };
>
> +enum sbi_ext_srst_fid {
> +       SBI_EXT_SRST_RESET = 0,
> +};
> +
> +enum sbi_srst_reset_type {
> +       SBI_SRST_RESET_TYPE_SHUTDOWN = 0,
> +       SBI_SRST_RESET_TYPE_COLD_REBOOT,
> +       SBI_SRST_RESET_TYPE_WARM_REBOOT,
> +};
> +
> +enum sbi_srst_reset_reason {
> +       SBI_SRST_RESET_REASON_NONE = 0,
> +       SBI_SRST_RESET_REASON_SYS_FAILURE,
> +};
> +
>  #define SBI_SPEC_VERSION_DEFAULT       0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT   24
>  #define SBI_SPEC_VERSION_MAJOR_MASK    0x7f
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index f4a7db3d309e..49155588e56c 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -7,6 +7,7 @@
>
>  #include <linux/init.h>
>  #include <linux/pm.h>
> +#include <linux/reboot.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
>
> @@ -501,6 +502,32 @@ int sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
>  }
>  EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);
>
> +static void sbi_srst_reset(unsigned long type, unsigned long reason)
> +{
> +       sbi_ecall(SBI_EXT_SRST, SBI_EXT_SRST_RESET, type, reason,
> +                 0, 0, 0, 0);
> +       pr_warn("%s: type=0x%lx reason=0x%lx failed\n",
> +               __func__, type, reason);
> +}
> +
> +static int sbi_srst_reboot(struct notifier_block *this,
> +                          unsigned long mode, void *cmd)
> +{
> +       sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
> +                      SBI_SRST_RESET_TYPE_WARM_REBOOT :
> +                      SBI_SRST_RESET_TYPE_COLD_REBOOT,
> +                      SBI_SRST_RESET_REASON_NONE);
> +       return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block sbi_srst_reboot_nb;
> +
> +static void sbi_srst_power_off(void)
> +{
> +       sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
> +                      SBI_SRST_RESET_REASON_NONE);
> +}
> +
>  /**
>   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
>   * @extid: The extension ID to be probed.
> @@ -577,22 +604,30 @@ void __init sbi_init(void)
>                         sbi_get_firmware_id(), sbi_get_firmware_version());
>                 if (sbi_probe_extension(SBI_EXT_TIME) > 0) {
>                         __sbi_set_timer = __sbi_set_timer_v02;
> -                       pr_info("SBI v0.2 TIME extension detected\n");
> +                       pr_info("SBI TIME extension detected\n");
>                 } else {
>                         __sbi_set_timer = __sbi_set_timer_v01;
>                 }
>                 if (sbi_probe_extension(SBI_EXT_IPI) > 0) {
>                         __sbi_send_ipi  = __sbi_send_ipi_v02;
> -                       pr_info("SBI v0.2 IPI extension detected\n");
> +                       pr_info("SBI IPI extension detected\n");
>                 } else {
>                         __sbi_send_ipi  = __sbi_send_ipi_v01;
>                 }
>                 if (sbi_probe_extension(SBI_EXT_RFENCE) > 0) {
>                         __sbi_rfence    = __sbi_rfence_v02;
> -                       pr_info("SBI v0.2 RFENCE extension detected\n");
> +                       pr_info("SBI RFENCE extension detected\n");
>                 } else {
>                         __sbi_rfence    = __sbi_rfence_v01;
>                 }
> +               if (sbi_probe_extension(SBI_EXT_SRST) > 0 &&
> +                   sbi_minor_version() >= 3) {
> +                       pr_info("SBI SRST extension detected\n");
> +                       pm_power_off = sbi_srst_power_off;
> +                       sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
> +                       sbi_srst_reboot_nb.priority = 192;
> +                       register_restart_handler(&sbi_srst_reboot_nb);
> +               }
>         } else {
>                 __sbi_set_timer = __sbi_set_timer_v01;
>                 __sbi_send_ipi  = __sbi_send_ipi_v01;
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
