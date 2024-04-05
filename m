Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98B9C67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 12:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPG9a9TMP2Gpi0+HGnBTP6Ux/ZJBqAA3aAhOl0cUyQY=; b=JJFeYp+5LBdASw
	6AvDRVUvxdoMqlUlbU5qOqvnt/vomjtqwnUyDZa5hcDacGaD2EfgLjMEQddDqbtEPZv8UflQw/RPu
	LVkvWt1cYQQCKa9NvtUcLh/RDvk8NWkzDbOTY+Iy0uPz2UntPjEsas4bz5myrfx8maQ5KQ/b2u5ZJ
	2PPMwE4OFyaHXKEf8e5EgHI4xI1VB9NXh9rSjD7Rv9o5PtTa9JFZs5bHfXs472mbReUEGdSsy9uvX
	ZNkRbqDGVorP1MtEZVkMpSirIp7emV4PgQQZybhBaZ0/KAAw3/whhPS7vdoArJXpVZsGcCzalm67e
	rkEgPAyrqX1Y7KgOS3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiUq-00000006sHR-2FQt;
	Fri, 05 Apr 2024 12:16:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiUl-00000006sFw-3OBU
	for linux-riscv@bombadil.infradead.org;
	Fri, 05 Apr 2024 12:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YIBbg/0Gkc3vc8eXQdCLIpelrpcjO2owsNnM3FfwOWI=; b=k1IlusTphtP5kmV/rTB5UUUBTw
	9FM0EvS8s60xZ+Lq0NFgIRQfGcqclVDmmASSXC2jFtQjklntei3etBiaR/ODgZrL78ajfTpISr7S6
	FYGm1rt2QBoIMPg1JSoq3/zHJgJFd6O7UkZ9dFS+PsuBy0wK7tfVAgHr3UKu1xswGuNFoarLLDRQj
	LjzVNI0SQrz2bdWZ7I+yXG39Zar/E4ImzuXKqI/ItcIUeJRRDntJsC+NgUYlzLa47IMzICUZEE2hz
	fVFXrT3rNqO5Vp8JZKYorqN3lXYb7I4GKF5K+c61C+gnloAvghQc14E4RudgsJKG/NLvguOEn3cFp
	QWNvb1mw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiUi-00000005bP1-0WeC
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 12:16:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4162bac959cso11869505e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 05:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712319390; x=1712924190; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIBbg/0Gkc3vc8eXQdCLIpelrpcjO2owsNnM3FfwOWI=;
        b=choItFPx0DtknB3wX/QMoNul8vr9woT0AJPh7oxPEN7eTxziJtFkzStRRNi0N0P0qp
         aClbMCalJmsiEM7cIbUf1aOGkxbR136egrhdWR4d+/AtahcYgIS89V2BzCYk1Hd3NgQK
         st+CTe2cybEU6ybzarKmNPbSsa4De2wF324OeRAa29ciIJZhDQUqZH3LJ8+nJmLApH0X
         3Z92p6nRGS2fu3i0M8HjpiFjwxSXVVfowlUOnqKlpbENY4nwyMn1cVsNgPQ8blCmdQXb
         mdwKq53l+zW0ZGZZ5LviJ9NV83++Gbyp6sN+lvTRqMM5lduRN34sAiCfKBqmtVoZgLlo
         ZJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319390; x=1712924190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIBbg/0Gkc3vc8eXQdCLIpelrpcjO2owsNnM3FfwOWI=;
        b=rs4+SWXzHGZmoqU1+IT4D0pgxKtbuvu9cIMdNK9v7T6ukEw8gmLckZ2wJNESWJW15N
         63LklAVBLEWA+C09HlNISdQRHeTbdfp9qVw95aj8QNcen/puOUJX79IIE4H1Z738kzCc
         3WkNxMUz0wnOLh/JFZjomM23En3w8IReIPkeHb0kp+SYr/kZ5AxmBxeL3jPphINFHNFb
         k4EggRwsqIMgIDBc0KpQys5CtFjwa5XDSJrJmoscm4+CDh/OTenOxjvBh/2CzNqjcWdv
         KE7ILeeTnokLry2B+vWGech2gry1+gCsFh+NOBbkE0RlIR+yWFtlYeI9wC2gcXrAkIrz
         0XXA==
X-Forwarded-Encrypted: i=1; AJvYcCVgtm+kUHCVhWwrh08IYB335pI+ncm8iSP+m7OsGffRPyo3OhmVXNcfKpBCOZQ1bT/tjOSDUiaULd0XafrdLSoFCUdjbeS30t/16kGv9wgS
X-Gm-Message-State: AOJu0YyWV+/fYjIXrnLfu99vbApm/uBSVmQkrV1zCGJHv6CkrVi0sawm
	21dOivqaqML4dq1MJOA0h2pKkKcGlZT5YajTqxKGPZcDheTGwpqatl0qKR4fWxw=
X-Google-Smtp-Source: AGHT+IHWoJ0SVigRSQdE8aAqZ9Ahbq2SNfjubKUhDIh9/SPSG+4VJxdmaUN4mIX3yesibcIkwnQlKw==
X-Received: by 2002:a05:600c:4e0c:b0:414:250:ccaa with SMTP id b12-20020a05600c4e0c00b004140250ccaamr1142350wmq.12.1712319390374;
        Fri, 05 Apr 2024 05:16:30 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id fc9-20020a05600c524900b004162a9f03a6sm5867007wmb.7.2024.04.05.05.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:16:29 -0700 (PDT)
Date: Fri, 5 Apr 2024 14:16:29 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <akaher@vmware.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <amakhalov@vmware.com>, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 16/22] KVM: riscv: selftests: Move sbi definitions to
 its own header file
Message-ID: <20240405-a09f9ed26805b6988179132c@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-17-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-17-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_131632_641464_D8C49D32 
X-CRM114-Status: GOOD (  19.37  )
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

On Wed, Apr 03, 2024 at 01:04:45AM -0700, Atish Patra wrote:
> The SBI definitions will continue to grow. Move the sbi related
> definitions to its own header file from processor.h
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../selftests/kvm/include/riscv/processor.h   | 39 ---------------
>  .../testing/selftests/kvm/include/riscv/sbi.h | 50 +++++++++++++++++++
>  .../selftests/kvm/include/riscv/ucall.h       |  1 +
>  tools/testing/selftests/kvm/steal_time.c      |  4 +-
>  4 files changed, 54 insertions(+), 40 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/riscv/sbi.h
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index ce473fe251dd..3b9cb39327ff 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -154,45 +154,6 @@ void vm_install_interrupt_handler(struct kvm_vm *vm, exception_handler_fn handle
>  #define PGTBL_PAGE_SIZE				PGTBL_L0_BLOCK_SIZE
>  #define PGTBL_PAGE_SIZE_SHIFT			PGTBL_L0_BLOCK_SHIFT
>  
> -/* SBI return error codes */
> -#define SBI_SUCCESS				0
> -#define SBI_ERR_FAILURE				-1
> -#define SBI_ERR_NOT_SUPPORTED			-2
> -#define SBI_ERR_INVALID_PARAM			-3
> -#define SBI_ERR_DENIED				-4
> -#define SBI_ERR_INVALID_ADDRESS			-5
> -#define SBI_ERR_ALREADY_AVAILABLE		-6
> -#define SBI_ERR_ALREADY_STARTED			-7
> -#define SBI_ERR_ALREADY_STOPPED			-8
> -
> -#define SBI_EXT_EXPERIMENTAL_START		0x08000000
> -#define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
> -
> -#define KVM_RISCV_SELFTESTS_SBI_EXT		SBI_EXT_EXPERIMENTAL_END
> -#define KVM_RISCV_SELFTESTS_SBI_UCALL		0
> -#define KVM_RISCV_SELFTESTS_SBI_UNEXP		1
> -
> -enum sbi_ext_id {
> -	SBI_EXT_BASE = 0x10,
> -	SBI_EXT_STA = 0x535441,
> -};
> -
> -enum sbi_ext_base_fid {
> -	SBI_EXT_BASE_PROBE_EXT = 3,
> -};
> -
> -struct sbiret {
> -	long error;
> -	long value;
> -};
> -
> -struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> -			unsigned long arg1, unsigned long arg2,
> -			unsigned long arg3, unsigned long arg4,
> -			unsigned long arg5);
> -
> -bool guest_sbi_probe_extension(int extid, long *out_val);
> -
>  static inline void local_irq_enable(void)
>  {
>  	csr_set(CSR_SSTATUS, SR_SIE);
> diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
> new file mode 100644
> index 000000000000..ba04f2dec7b5
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RISC-V SBI specific definitions
> + *
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +
> +#ifndef SELFTEST_KVM_SBI_H
> +#define SELFTEST_KVM_SBI_H
> +
> +/* SBI return error codes */
> +#define SBI_SUCCESS				 0
> +#define SBI_ERR_FAILURE				-1
> +#define SBI_ERR_NOT_SUPPORTED			-2
> +#define SBI_ERR_INVALID_PARAM			-3
> +#define SBI_ERR_DENIED				-4
> +#define SBI_ERR_INVALID_ADDRESS			-5
> +#define SBI_ERR_ALREADY_AVAILABLE		-6
> +#define SBI_ERR_ALREADY_STARTED			-7
> +#define SBI_ERR_ALREADY_STOPPED			-8
> +
> +#define SBI_EXT_EXPERIMENTAL_START		0x08000000
> +#define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
> +
> +#define KVM_RISCV_SELFTESTS_SBI_EXT		SBI_EXT_EXPERIMENTAL_END
> +#define KVM_RISCV_SELFTESTS_SBI_UCALL		0
> +#define KVM_RISCV_SELFTESTS_SBI_UNEXP		1
> +
> +enum sbi_ext_id {
> +	SBI_EXT_BASE = 0x10,
> +	SBI_EXT_STA = 0x535441,
> +};
> +
> +enum sbi_ext_base_fid {
> +	SBI_EXT_BASE_PROBE_EXT = 3,
> +};
> +
> +struct sbiret {
> +	long error;
> +	long value;
> +};
> +
> +struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> +			unsigned long arg1, unsigned long arg2,
> +			unsigned long arg3, unsigned long arg4,
> +			unsigned long arg5);
> +
> +bool guest_sbi_probe_extension(int extid, long *out_val);
> +
> +#endif /* SELFTEST_KVM_SBI_H */
> diff --git a/tools/testing/selftests/kvm/include/riscv/ucall.h b/tools/testing/selftests/kvm/include/riscv/ucall.h
> index be46eb32ec27..a695ae36f3e0 100644
> --- a/tools/testing/selftests/kvm/include/riscv/ucall.h
> +++ b/tools/testing/selftests/kvm/include/riscv/ucall.h
> @@ -3,6 +3,7 @@
>  #define SELFTEST_KVM_UCALL_H
>  
>  #include "processor.h"
> +#include "sbi.h"
>  
>  #define UCALL_EXIT_REASON       KVM_EXIT_RISCV_SBI
>  
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index bae0c5026f82..2ff82c7fd926 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -11,7 +11,9 @@
>  #include <pthread.h>
>  #include <linux/kernel.h>
>  #include <asm/kvm.h>
> -#ifndef __riscv
> +#ifdef __riscv
> +#include "sbi.h"
> +#else
>  #include <asm/kvm_para.h>
>  #endif
>  
> -- 
> 2.34.1
>


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
