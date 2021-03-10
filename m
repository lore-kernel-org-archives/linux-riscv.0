Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E1AC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 03:02:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E32F64FE8
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 03:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E32F64FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:CC:Mime-Version:Message-ID:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=npapax5nEQxshC+pOhRq5z6+4+aiVEeTlUCjgXUF7fI=; b=oIepuXx/YWcYInrFssr7bHviE
	h0o+lGyibKzsSrbrjy7EOfHxBAU8Yb6+cAiyqqgbYJjEUz0uGqepVHZTvl81fk40lAF9/FULDITn7
	Wf6ioAZpqYvoR/Arv93GfHaEeTuBs/PMeo9HQvXWxeDatbnO4YMrOO6RIeHZ6C4U6NuI6Ob/ZQ6nI
	gyk9iOOV3TpwFDThPieL6STwHJyVCJABLLvMIi0qk35R8dkxReg77j2g9eAvfVAxklO/367COhHdU
	BtIa+C80IiwPuxZpkK1EFLqJ+aX9Te9VjpPY0inpdtMOPOUoXrKxQ7josqhj4hP92+gpBbixlzwRn
	46NtTU79A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJp6g-005rM3-Ti; Wed, 10 Mar 2021 03:01:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJp64-005rJr-B4
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 03:01:19 +0000
Received: by mail-pj1-x102b.google.com with SMTP id gb6so751312pjb.0
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 19:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=8ZP2HVKbYi+Y10nVIbvi77JIzLBHg2GFfYw/jvz9nU4=;
 b=HWk4x7xaB1lwOzTLjTgKmtPxBB0lsvsoqwBjk1bUnU+2A7Dkm6o6Ffy2lRC28K2zQE
 PL6RiidPja1TzGHZb7Ss/QZqoOy7qlMF49EfVEJeYFphxJkCd110vBcrioL5q/LmldjE
 KvxUg5z39Ius5HG3bAxNIvIo4HepVmhJbV8f9f8nh7YBXWr/oWNAJ3M4FN9LOMEYE13I
 zZGl25rZ6kfianm9C+OKJqltA4Jgaqf9lsxohEhxCy6/pSNEdUgzcu+fBSbb5SGwwcgM
 umMZfhZYRPmGZF2WCI/4q8SbkCFscBny1+k6Ecag6bUBjXs2+oxQqvJ/whE00Fr1Y4Bq
 N6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=8ZP2HVKbYi+Y10nVIbvi77JIzLBHg2GFfYw/jvz9nU4=;
 b=Hfwe3fHehKi1INt3f9R0S7Zuf8aCsbVQcB1ZivDCn1vZyITuJuRL8Omcp9CaD24Cmr
 wIfb8pMQSjp5LGhojsnhP/F8rl/hFcLU2ms9RYhhCS4nWhKfKmyH5DBDnU6TQxNhGSzW
 LvYNj5uOtvw3Vh4dg5Sbrlk4JAxo8cntpmE/tev6U4ekJBq2UbdCA8mrhSHd5BA728Ie
 5DCOO5lZA4a9rO+vDkiUZcsEaubhrEt+kt7ehWZgo2uaCCDfwPyETDoDkjpSrB3J2PRG
 wluU31EEbV5KLV797fjDEVnmSf2kqbP9LdqKTF+4+uAiVKxgZuJC+NAeVZaNJOKFXESZ
 a/2g==
X-Gm-Message-State: AOAM533HukCqccqPBtKrymCLxNgHUJuXiK8kzY7vLPRZlIEbOayR8ruD
 KAJZig/KQa4c3dZdVNcu15tkmA==
X-Google-Smtp-Source: ABdhPJwlrFUz5y2Ushm3kzAPDAXqhmg/f+CCEg2gDMmR+lBzz/HU1JK7K9CY2eGgr7eU3dV+waoWUw==
X-Received: by 2002:a17:902:c952:b029:e4:89ad:fae2 with SMTP id
 i18-20020a170902c952b02900e489adfae2mr901071pla.14.1615345274537; 
 Tue, 09 Mar 2021 19:01:14 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b14sm14327844pfi.74.2021.03.09.19.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 19:01:13 -0800 (PST)
Date: Tue, 09 Mar 2021 19:01:13 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 19:00:14 PST (-0800)
Subject: Re: [PATCH v4] RISC-V: Use SBI SRST extension when available
In-Reply-To: <20210301115833.382364-1-anup.patel@wdc.com>
Message-ID: <mhng-c42c46e0-4715-4630-9a28-02a1515dbcb0@penguin>
Mime-Version: 1.0 (MHng)
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 anup@brainfault.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_030116_548606_EE3BC835 
X-CRM114-Status: GOOD (  26.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 01 Mar 2021 03:58:33 PST (-0800), Anup Patel wrote:
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
>  arch/riscv/include/asm/sbi.h | 16 ++++++++++++++
>  arch/riscv/kernel/sbi.c      | 41 +++++++++++++++++++++++++++++++++---
>  2 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 99895d9c3bdd..8add0209c9c7 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -27,6 +27,7 @@ enum sbi_ext_id {
>  	SBI_EXT_IPI = 0x735049,
>  	SBI_EXT_RFENCE = 0x52464E43,
>  	SBI_EXT_HSM = 0x48534D,
> +	SBI_EXT_SRST = 0x53525354,
>  };
>
>  enum sbi_ext_base_fid {
> @@ -70,6 +71,21 @@ enum sbi_hsm_hart_status {
>  	SBI_HSM_HART_STATUS_STOP_PENDING,
>  };
>
> +enum sbi_ext_srst_fid {
> +	SBI_EXT_SRST_RESET = 0,
> +};
> +
> +enum sbi_srst_reset_type {
> +	SBI_SRST_RESET_TYPE_SHUTDOWN = 0,
> +	SBI_SRST_RESET_TYPE_COLD_REBOOT,
> +	SBI_SRST_RESET_TYPE_WARM_REBOOT,
> +};
> +
> +enum sbi_srst_reset_reason {
> +	SBI_SRST_RESET_REASON_NONE = 0,
> +	SBI_SRST_RESET_REASON_SYS_FAILURE,
> +};
> +
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
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
> +	sbi_ecall(SBI_EXT_SRST, SBI_EXT_SRST_RESET, type, reason,
> +		  0, 0, 0, 0);
> +	pr_warn("%s: type=0x%lx reason=0x%lx failed\n",
> +		__func__, type, reason);
> +}
> +
> +static int sbi_srst_reboot(struct notifier_block *this,
> +			   unsigned long mode, void *cmd)
> +{
> +	sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
> +		       SBI_SRST_RESET_TYPE_WARM_REBOOT :
> +		       SBI_SRST_RESET_TYPE_COLD_REBOOT,
> +		       SBI_SRST_RESET_REASON_NONE);
> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block sbi_srst_reboot_nb;
> +
> +static void sbi_srst_power_off(void)
> +{
> +	sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
> +		       SBI_SRST_RESET_REASON_NONE);
> +}
> +
>  /**
>   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
>   * @extid: The extension ID to be probed.
> @@ -577,22 +604,30 @@ void __init sbi_init(void)
>  			sbi_get_firmware_id(), sbi_get_firmware_version());
>  		if (sbi_probe_extension(SBI_EXT_TIME) > 0) {
>  			__sbi_set_timer = __sbi_set_timer_v02;
> -			pr_info("SBI v0.2 TIME extension detected\n");
> +			pr_info("SBI TIME extension detected\n");
>  		} else {
>  			__sbi_set_timer = __sbi_set_timer_v01;
>  		}
>  		if (sbi_probe_extension(SBI_EXT_IPI) > 0) {
>  			__sbi_send_ipi	= __sbi_send_ipi_v02;
> -			pr_info("SBI v0.2 IPI extension detected\n");
> +			pr_info("SBI IPI extension detected\n");

These aren't really part of the reset stuff and should be split into a separate 
patch.

>  		} else {
>  			__sbi_send_ipi	= __sbi_send_ipi_v01;
>  		}
>  		if (sbi_probe_extension(SBI_EXT_RFENCE) > 0) {
>  			__sbi_rfence	= __sbi_rfence_v02;
> -			pr_info("SBI v0.2 RFENCE extension detected\n");
> +			pr_info("SBI RFENCE extension detected\n");
>  		} else {
>  			__sbi_rfence	= __sbi_rfence_v01;
>  		}
> +		if (sbi_probe_extension(SBI_EXT_SRST) > 0 &&
> +		    sbi_minor_version() >= 3) {
> +			pr_info("SBI SRST extension detected\n");
> +			pm_power_off = sbi_srst_power_off;
> +			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
> +			sbi_srst_reboot_nb.priority = 192;
> +			register_restart_handler(&sbi_srst_reboot_nb);
> +		}
>  	} else {
>  		__sbi_set_timer = __sbi_set_timer_v01;
>  		__sbi_send_ipi	= __sbi_send_ipi_v01;

This is fine, but I don't want to take things for draft SBI versions until 
they're at least tagged.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
