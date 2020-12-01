Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B6BC64E7A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 07:41:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 676CC2085B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 07:41:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NuRPnoaE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="VE/EnvMu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 676CC2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ay7PUrTWVHslVYS/py/QdFrXxu9xo9es+BcKlyPjpuQ=; b=NuRPnoaEvYizQHJNTAiQmivvy
	kTbMME51VWu4Wdsz9Kyv82N+vHfHfKr7sGQ83ZbzkKKYQolOP6074fBf7BKwb48vOfX1NwHzACBT9
	CZKenoY6IXC5I7nmIGBYkBjUOzAoGO3F5ygJ9x8cX2PmMqadgh51ea/SYYt3dsi/IQTSrdAZNrEuv
	rKIosRnHGmgLqp+qYEvntT9ABkn5WegFexecBOajsTprskXYbI9Pt1J+4e2HvhlChMCUKCMxg3iLN
	CU5xlGQT1Huc7//HeOhJdb0pJbttKSqIAZ2JGO7MHP9LFC0+uFqwGsm0mFVR9Mdo17FzcnHgN2ZpI
	R2t5LcZsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk0I9-0007fY-4G; Tue, 01 Dec 2020 07:41:41 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk0I3-0007eH-NM
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 07:41:37 +0000
Received: by mail-io1-xd44.google.com with SMTP id f20so639882ioc.12
 for <linux-riscv@lists.infradead.org>; Mon, 30 Nov 2020 23:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I4x+7bX+90aM2/6MhSIys1rmKK1XZrhcw7vhfqYqSRM=;
 b=VE/EnvMu20AqpeZwugCON8r/nG8CseB0YevYYyK2hwvh4vyAJ5CutGWvZYbFciFE8S
 pjymne5+KN8QCYyBsnkJEZXkZOu8h9cAbclBVagZzSbTbOD6ZsCWNVJ7c4e/dQocdq7r
 fbQl54KC0etlFpK1mO4fLxE01eWt9Fzhg8yj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I4x+7bX+90aM2/6MhSIys1rmKK1XZrhcw7vhfqYqSRM=;
 b=tSs2h441ClEd/nL9q0HQu3y+v2lR3eKsyg53uqgyS5g6d5Oe5SB/m3NO5ynCRDRUkt
 QzXqxnjZshgof/kmGvTMzmWJGhMoIUPofxOnJcCD5qiTHh7nMSdO9T5HDX3GrP78CMw1
 Rk8Ee5gQle2zJVq9hC4QQfaHb0Ieji113rgq/fWxhEaNL5Y37gTp0ANtxfX2BXFZ1Rkg
 O7o9vFh2aqP8wfkgK5fAZ+P2IKb/HsmzBf20Vr5LuW38dJQQoWwSn7eFduy/yRGvnJ86
 gkkKwzfF3CmTUs5wGqpcWgh2RhWnNm73Rq3KkKFt+povnYtHBmtsGsmEQc9ZmSFz5bHv
 I1VQ==
X-Gm-Message-State: AOAM533BzQU6F8BzmL4qQXCO1v6ky9qAk76temg2atp+yKVZVFjSJnmG
 a7a02JS/Uv+wQOHxpZTIgZe6F/BaDaveochjrHFB9+03EaYpDaY=
X-Google-Smtp-Source: ABdhPJxcEuJGRXd6NBzZxS5ew9eeBlD64P/FotTqpfaXlYxTjifB7TUfPwPafBleYMiQxj3q2+vDSTZfS8frTuxEZHA=
X-Received: by 2002:a5d:8617:: with SMTP id f23mr1420643iol.174.1606808492370; 
 Mon, 30 Nov 2020 23:41:32 -0800 (PST)
MIME-Version: 1.0
References: <20201125051752.295572-1-anup.patel@wdc.com>
In-Reply-To: <20201125051752.295572-1-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 30 Nov 2020 23:41:25 -0800
Message-ID: <CAOnJCUK-sffDYnLxQ2ERNHCaQELxK0Nu7haBAEtYFS5qSpe2GQ@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Use SBI SRST extension when available
To: Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_024135_924611_D6230AAF 
X-CRM114-Status: GOOD (  24.39  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 9:18 PM Anup Patel <anup.patel@wdc.com> wrote:
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
> Changes since v2:
>  - Rebased on Linux-5.10-rc5
>  - Updated patch as-per SBI SRST extension available in the latest
>    SBI v0.3-draft specification
> Changes since v1:
>  - Updated patch as-per latest SBI SRST extension draft spec where
>    we have only one SBI call with "reset_type" parameter
> ---
>  arch/riscv/include/asm/sbi.h | 16 ++++++++++++++++
>  arch/riscv/kernel/sbi.c      | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 653edb25d495..5b2d6d614c20 100644
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
> index 226ccce0f9e0..33b834ecd195 100644
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

sbi_system_reset may return the failure reason as well. I think we can
print that in the warning message if present.

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
> @@ -593,6 +620,13 @@ int __init sbi_init(void)
>                 } else {
>                         __sbi_rfence    = __sbi_rfence_v01;
>                 }
> +               if (sbi_probe_extension(SBI_EXT_SRST) > 0) {
> +                       pr_info("SBI v0.2 SRST extension detected\n");
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
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Apart from that, it looks good to me.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
