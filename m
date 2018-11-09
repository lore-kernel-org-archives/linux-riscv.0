Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521F5C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 18:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251D62081C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 18:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PJxyqjf8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ns7BFJfJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251D62081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=kFFaZEn+a7GKrpo/JfsapgcAf9pq1jzFqM+65nJqEQM=; b=PJxyqjf8uhOUEE/qVgJHzZIYc
	VYNmJ4hDwKjjV+v7xlYXmkgNjxLeBq+OuvnALQLEOBi5d25P1ALlNEEP/eRACBX8mfoET0YLrmdE5
	F6puEyZEnwSkWI+v0YfBfCVB1aQSxN8oAipHImCEhI+kJyq3mxH6/xLQui7ZlvVj0gCnvG8wy2gOe
	9RUDa+hxBBW1z9+92z2KpirVlVgWfTCCa4CvUdy9QtQcuJNckuxjNFZAn5VEWiymS5Uxf/p+4iFyp
	ffl9kLs6ZQZhnOwihn0tMrFc6YL6gvxy7NtT60hOod/eYLI3fg/PPlNwn0fTD2DdH/r5b94WhboNm
	A58mF5AQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLBnG-0005cj-EL; Fri, 09 Nov 2018 18:46:10 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLBnD-0005bi-02
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 18:46:08 +0000
Received: by mail-pf1-x444.google.com with SMTP id g7-v6so1306267pfo.10
 for <linux-riscv@lists.infradead.org>; Fri, 09 Nov 2018 10:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vvHbhpCy678InfazlDZuMjGHDVImcw38UcNI4N/yahg=;
 b=ns7BFJfJ6C5yYBdcEFt2HqmTATpQaFb4HF+xU4aigMrCNBu6jKEgwpxTGWEpLt6MTj
 BRVPg48zrgq3R6EIRH6G5H1zXqAOYSlSMG3byQMQT2P4iyzit0nnINGZsETe9JBM16bE
 cG6+W8IF65f42wSgb6EdLVQQK3bWqNXcfJvHG8LJB5jYHNd9mnCOtQeErdvSZk/+1JeT
 qACQ8A5uTPQ8E021eeRB87TX5pw7V32GOR+p1FUbzLRgJ1KeUcFP3CAud3mVHAjfnxUt
 4NduTzSnPHzV3RvrWYYWHuCaILFrXUD6qx4VwQTp/txY+IYEVHxpy5jF7WYHh8/IP8o3
 L5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vvHbhpCy678InfazlDZuMjGHDVImcw38UcNI4N/yahg=;
 b=EGtuKDH0QT7OgRy5Zxi/QT0T2UOuSOWioDBktH+soDL5g+V+OL2o3DxecMIteR1pI+
 brhvFc7plrm1tm5W/J8nV0DvpdWOc2KywTKyoaoJHo5AesfyoBrrfgkUxVJ8iwFk5DM+
 bektFpzbP+JfV09/CsHb6Zgt+N9CdFxf6mPmYyE9jfJ0iIs2HqhbSHnVqw92+qCR4i8L
 CSktbcu+cQqV2hR2jnWO0mBpH3IXktdMKO5BvV+KQNMMGSU86BmKP2PBXluj0Z5wI8JE
 O53XvYz/DAL0YyiJEu/+xfnOUajrfiq4NxUD8Ad6xExokPZ98iMIhdIHVDRlSgoIz+zT
 5YRA==
X-Gm-Message-State: AGRZ1gImzJJ3d373c9c90lvKYQrxKM3R6B4hBXGeQJAcPIWofldFISIy
 rNPWAKGmtCnQpL3lAbcGc77bgQ==
X-Google-Smtp-Source: AJdET5dZM4EnNQT9KOuW+j14O1CdzgWVgASrArpOuEU5BPZ9wC6IZ7FvTdc3P4SFN3j6fK12zB10Ww==
X-Received: by 2002:a63:4141:: with SMTP id
 o62-v6mr7851005pga.370.1541789155537; 
 Fri, 09 Nov 2018 10:45:55 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id u76-v6sm9511558pfa.176.2018.11.09.10.45.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Nov 2018 10:45:54 -0800 (PST)
Date: Fri, 09 Nov 2018 10:45:54 -0800 (PST)
X-Google-Original-Date: Fri, 09 Nov 2018 10:45:34 PST (-0800)
Subject: Re: [PATCH 12/13] riscv: define syscall_get_arch()
In-Reply-To: <20181109031712.GL21511@altlinux.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: ldv@altlinux.org
Message-ID: <mhng-2fa4cce8-2365-4f36-a07e-5f9ad61cfb88@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_104607_038747_C60C18A3 
X-CRM114-Status: GOOD (  17.60  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, paul@paul-moore.com, linux-kernel@vger.kernel.org,
 eparis@redhat.com, lineprinter@altlinux.org, luto@kernel.org,
 linux-audit@redhat.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109184554.ef-NHS2KV5vtoAUSmv09Z0TKVpxssICecvQI_u1C63k@z>

On Thu, 08 Nov 2018 19:17:13 PST (-0800), ldv@altlinux.org wrote:
> syscall_get_arch() is required to be implemented on all architectures
> that use tracehook_report_syscall_entry() in order to extend
> the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
>
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> ---
>  arch/riscv/include/asm/syscall.h | 6 ++++++
>  include/uapi/linux/audit.h       | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 8d25f8904c00..7e1e26ca7317 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -18,6 +18,7 @@
>  #ifndef _ASM_RISCV_SYSCALL_H
>  #define _ASM_RISCV_SYSCALL_H
>
> +#include <uapi/linux/audit.h>
>  #include <linux/sched.h>
>  #include <linux/err.h>
>
> @@ -99,4 +100,9 @@ static inline void syscall_set_arguments(struct task_struct *task,
>  	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
>  }
>
> +static inline int syscall_get_arch(void)
> +{
> +	return AUDIT_ARCH_RISCV;
> +}
> +
>  #endif	/* _ASM_RISCV_SYSCALL_H */
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index c4c8b131af48..ad4105c602a1 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -405,6 +405,7 @@ enum {
>  /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
>  #define AUDIT_ARCH_PPC64	(EM_PPC64|__AUDIT_ARCH_64BIT)
>  #define AUDIT_ARCH_PPC64LE	(EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> +#define AUDIT_ARCH_RISCV	(EM_RISCV|__AUDIT_ARCH_64BIT)
>  #define AUDIT_ARCH_S390		(EM_S390)
>  #define AUDIT_ARCH_S390X	(EM_S390|__AUDIT_ARCH_64BIT)
>  #define AUDIT_ARCH_SH		(EM_SH)

I think this is incorrect: EM_RISCV has 32-bit and 64-bit variants, and if I 
understand what's going on here this is marking all RISC-V targets as 64-bit.  
Since this is a userspace header, I think the right thing to switch on is 
__riscv_xlen, which will be defined to either 32 or 64 depending on the base 
ISA.

We're also little endian.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
