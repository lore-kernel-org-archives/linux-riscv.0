Return-Path: <SRS0=E2Nt=XW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B98C352AB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 05:49:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5920820872
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2019 05:49:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GF4gzSKx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="yYUj7D4P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5920820872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJ8z/bPGbq6rRNHZ0meHMyy2kVd330gQQ9ItYyb2lDM=; b=GF4gzSKxQykn65
	AVOv5+vlGsBR1t0yA4GHbP1Bh7gOX9Sj4uvQras5qKPFhYy8zZPKWA5EQFlXxEABinrYFL7gGTQ4Y
	6WYnv51AcBKt4P7xGmYEMrrZlNxYUYr7CbkJFNRTTxNLPhhi9KvVBYwnI7vwoOZYxbCVF30AnhRhh
	TaK6V52yw19qlljiT1AjJfeRjCc9t0CnPAfjchgO/xBDTlVUqEe9If/lP+u84BpiQTFFiiZ6wdhwT
	oLy5oxBeh1ZVrh+ti8fV20XBsQvN1ALzGQSE4CyEuszjIa3NkgQfETgegd7YMF+RmPeqeRJZtkiAT
	8++VLLiY8E+FTONHTFIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDj7r-0001DB-V5; Fri, 27 Sep 2019 05:49:07 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDj7p-0001Cp-4I
 for linux-riscv@lists.infradead.org; Fri, 27 Sep 2019 05:49:06 +0000
Received: by mail-wm1-x342.google.com with SMTP id y135so8123727wmc.1
 for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2019 22:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UboR/3YoY3uTd5/yIfcblxD1BtRwPtrq5UhbmXqOZRE=;
 b=yYUj7D4PSMFA1n+LtIatN5JEcAhdVXpZv8gEi6XuagNF1rAWPeLPjX7zE3JOzv+asu
 wX0oPV5zu8J5L/m2/HMwGsz63ARQtjxB5sjqcmAmlkUCLeIvSngTIRjn3PS5BtGvcxha
 9cUmW4n7owYW1KZY4R5SlD7rkqrtoHyp72KMXpO2lkvjcpnqdYyQkbvp4r0cMtk3I9bB
 NiRfU90eGTTMro/NLsCPfoncmhrg/fBG522aQO6Ms1hHd6JaC3tpOJ2SE775hERPK3Iz
 8MDMB57p8gLH/Es8dWfv18J5m1iRTNcvVj7onrb5KYYGnEuSiPGGfSYh4jUIkwmIf6F5
 /cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UboR/3YoY3uTd5/yIfcblxD1BtRwPtrq5UhbmXqOZRE=;
 b=GVEIrgljhZgZCDDtffK6rhORplmJQsKjHiPIJsufKGPUDnu5IoTIv5W3+QCE05OKzp
 srQnvHontltIWJrIDlIGc7AdRFxeD3zX4oSPEYBnxo/3kFWqCWpIRUOYsWhJxQNeuH5M
 AiCIKJZGv0XnvdIXNpvnUejrec5RTcTZaHcopzIBtmj6dASYNI7C2/y4rNUQnDlkK70g
 zpzO9WiBoBpRSyeYxxFtL3/8134oqmlYQNmM0gKzEQA83jyd/O/7KLrChN/l6buUvu55
 gG+Vjly5wGoDW5cKiqRV5eOYjN6R9odSzkD1gQg4qBpXzvQ1rNo1ZlWprFxXZFRPFEHL
 wfyg==
X-Gm-Message-State: APjAAAWhYjCsxkNLwbfj3Ey26VAGZaMIqJfO8dIwYQ2mIWsy5YXyj6Ke
 WIOqhYBHEWdUG5IpCaNgoc6ncoI4dFuqepl4FzHYfg==
X-Google-Smtp-Source: APXvYqwrgS6X27cpmFXFQT8dGHRdLPSw5ysJcsErb54qaLGxHup3jGQ7yvxxDx/9gzIBnh756Yl5NpcBmrfXGTnHxKU=
X-Received: by 2002:a7b:c84f:: with SMTP id c15mr5891041wml.52.1569563343446; 
 Thu, 26 Sep 2019 22:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190927000915.31781-1-atish.patra@wdc.com>
 <20190927000915.31781-4-atish.patra@wdc.com>
In-Reply-To: <20190927000915.31781-4-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Sep 2019 11:18:52 +0530
Message-ID: <CAAhSdy0u1_oBgH2o56BC7V_kJcqmYE9a7oyENnuGf18LiwjnLw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: Move SBI related macros under uapi.
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_224905_170005_02525580 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 27, 2019 at 5:39 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> All SBI related macros can be reused by KVM RISC-V and userspace tools
> such as kvmtool, qemu-kvm. SBI calls can also be emulated by userspace
> if required. Any future vendor extensions can leverage this to emulate
> the specific extension in userspace instead of kernel.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/sbi.h      | 37 +-----------------------
>  arch/riscv/include/uapi/asm/sbi.h | 48 +++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+), 36 deletions(-)
>  create mode 100644 arch/riscv/include/uapi/asm/sbi.h
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 279b7f10b3c2..902b83041111 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -7,42 +7,7 @@
>  #define _ASM_RISCV_SBI_H
>
>  #include <linux/types.h>
> -
> -enum sbi_ext_id {
> -       SBI_EXT_0_1_SET_TIMER = 0x0,
> -       SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
> -       SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
> -       SBI_EXT_0_1_CLEAR_IPI = 0x3,
> -       SBI_EXT_0_1_SEND_IPI = 0x4,
> -       SBI_EXT_0_1_REMOTE_FENCE_I = 0x5,
> -       SBI_EXT_0_1_REMOTE_SFENCE_VMA = 0x6,
> -       SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID = 0x7,
> -       SBI_EXT_0_1_SHUTDOWN = 0x8,
> -       SBI_EXT_BASE = 0x10,
> -};
> -
> -enum sbi_ext_base_fid {
> -       SBI_BASE_GET_SPEC_VERSION = 0,
> -       SBI_BASE_GET_IMP_ID,
> -       SBI_BASE_GET_IMP_VERSION,
> -       SBI_BASE_PROBE_EXT,
> -       SBI_BASE_GET_MVENDORID,
> -       SBI_BASE_GET_MARCHID,
> -       SBI_BASE_GET_MIMPID,
> -};
> -
> -#define SBI_SPEC_VERSION_DEFAULT       0x1
> -#define SBI_SPEC_VERSION_MAJOR_OFFSET  24
> -#define SBI_SPEC_VERSION_MAJOR_MASK    0x7f
> -#define SBI_SPEC_VERSION_MINOR_MASK    0xffffff
> -
> -/* SBI return error codes */
> -#define SBI_SUCCESS            0
> -#define SBI_ERR_FAILURE                -1
> -#define SBI_ERR_NOT_SUPPORTED  -2
> -#define SBI_ERR_INVALID_PARAM   -3
> -#define SBI_ERR_DENIED         -4
> -#define SBI_ERR_INVALID_ADDRESS -5
> +#include <uapi/asm/sbi.h>
>
>  extern unsigned long sbi_spec_version;
>  struct sbiret {
> diff --git a/arch/riscv/include/uapi/asm/sbi.h b/arch/riscv/include/uapi/asm/sbi.h
> new file mode 100644
> index 000000000000..2e09ee52c346
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/sbi.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Common SBI related defines and macros to be used by RISC-V kernel,
> + * RISC-V KVM and userspace.
> + *
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + */
> +
> +#ifndef _UAPI_ASM_RISCV_SBI_H
> +#define _UAPI_ASM_RISCV_SBI_H
> +
> +enum sbi_ext_id {
> +       SBI_EXT_0_1_SET_TIMER = 0x0,
> +       SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
> +       SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
> +       SBI_EXT_0_1_CLEAR_IPI = 0x3,
> +       SBI_EXT_0_1_SEND_IPI = 0x4,
> +       SBI_EXT_0_1_REMOTE_FENCE_I = 0x5,
> +       SBI_EXT_0_1_REMOTE_SFENCE_VMA = 0x6,
> +       SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID = 0x7,
> +       SBI_EXT_0_1_SHUTDOWN = 0x8,
> +       SBI_EXT_BASE = 0x10,
> +};
> +
> +enum sbi_ext_base_fid {
> +       SBI_BASE_GET_SPEC_VERSION = 0,
> +       SBI_BASE_GET_IMP_ID,
> +       SBI_BASE_GET_IMP_VERSION,
> +       SBI_BASE_PROBE_EXT,
> +       SBI_BASE_GET_MVENDORID,
> +       SBI_BASE_GET_MARCHID,
> +       SBI_BASE_GET_MIMPID,
> +};
> +
> +#define SBI_SPEC_VERSION_DEFAULT       0x1
> +#define SBI_SPEC_VERSION_MAJOR_OFFSET  24
> +#define SBI_SPEC_VERSION_MAJOR_MASK    0x7f
> +#define SBI_SPEC_VERSION_MINOR_MASK    0xffffff
> +
> +/* SBI return error codes */
> +#define SBI_SUCCESS            0
> +#define SBI_ERR_FAILURE                -1
> +#define SBI_ERR_NOT_SUPPORTED  -2
> +#define SBI_ERR_INVALID_PARAM   -3
> +#define SBI_ERR_DENIED         -4
> +#define SBI_ERR_INVALID_ADDRESS -5
> +
> +#endif
> --
> 2.21.0
>

Thanks for considering KVM user-space SBI emulation.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
