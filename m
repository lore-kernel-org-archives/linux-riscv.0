Return-Path: <SRS0=4NHM=NW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFFFC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 11 Nov 2018 21:21:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87AE820871
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 11 Nov 2018 21:21:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IC4q+Xnu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="P+NpAvTd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87AE820871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=fDz/zO6b65HMn7F8/LMNo+DXrmcg0vV7sLdkJM3mcUc=; b=IC4q+Xnuwov3dgWPRI8IeCvkc
	VItXZIGymeMED7J1Y+bkSWI05NTDxoS2WJp0rIltmyaWGSe7NpYWsRW8CA0wOPPWx0/iuxc5TRyr4
	oNs3aVphS3hmjZrAVGZDjyCxEzRgQ1iT6GwzxYPhumMohQsySxTCrEIRWfOuKDfrdTSi/U+xXzqrs
	pXNsYLtNVga/lOVAXCJIeMY8ozHoQeo2LNsPd748rDHGuplqbzh0Bqh/JEniAM3GWbrywKpzfmi1r
	OLm9sad/xkuKqJBa0aOarOEC45r/eTeAbkQSnFb1ViIs/PYPcz9D7nRXenUDMBD5G6SoTe7xhRl+d
	ooFN8+hag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLxAq-0002K8-Hj; Sun, 11 Nov 2018 21:21:40 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLxAn-0002J4-85
 for linux-riscv@lists.infradead.org; Sun, 11 Nov 2018 21:21:38 +0000
Received: by mail-pf1-x444.google.com with SMTP id b81-v6so2786714pfe.11
 for <linux-riscv@lists.infradead.org>; Sun, 11 Nov 2018 13:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4ACm6Uzc4H59VdfPYRJKhXWsdkoS01SqiW1/mSyC0ZA=;
 b=P+NpAvTd2nQNneNfHDrjIwgakcylAKJmk8qD2j+ayfZat2gx3ylCz9nB79OZIP0ejv
 2dI1yAFke5FNjjGWsnd8Gn7t1dSVzT3swfv22Y3w0Aqk58JqvdQZ9wH+Z4DXamxtvMXh
 RY9BYEZutmyKW+fUgnk2z9oN21RwBeU0fTRaGNA/f1YWFPCz0QdRYZSggSJLY+Ca8jMY
 1WCKBoBb+FijPu/AbZdrCHu216bji89oE/ugZdETvViwPJgbtMVAA/VVIFJD07jH9ZLe
 m8YFEBcAnqpdCsEUCUl3vSAceZIYbC6dqzA3psUzcIlQIPEIeyYHdA3TjFpbPVh5lCz/
 3xvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4ACm6Uzc4H59VdfPYRJKhXWsdkoS01SqiW1/mSyC0ZA=;
 b=NzfNKQ0OfCo8yWImNsrOvhS8xamZF6mu/IAg3y6sSWIMTr3pPmJJsyKN6aVeqVXNgf
 NFfRAGiiFa+n7yzvT4lwx0vJKFCdnZYHkvLYLDBwQZ0Xu1xCNXiEWYlF2ZAFtszJP7WP
 09k7xpAO+tB4la09vGgkCKHcHJwXcqcmH6lhEZzanhmipZApTJKdf40PbNVUR/IAb48S
 GQM5Aitn7AVBlcVapt2cphLMowbu1bk2ggJEDd+0vGKaaklPyB5zKcJ8djz9LBPKt5bm
 180QpDs3/fHOolXoTTmUFKpxczAglJsQiyye17tyvaJst8XGcXnXRS6B7JUxP5BVcksm
 HhMQ==
X-Gm-Message-State: AGRZ1gJLT+iM20MqjMxaSWZB6oUP2tiItaB1GA5T0/99BRiKyScSr+YV
 leBHUqtiUlzVmKn4eCoyYDNBXA==
X-Google-Smtp-Source: AJdET5c+Z+E9zcyAWV22Q+Mwz05yjZRUfMQ0EYD/teQJw9PMwU4zvARj8i+GuQC/JSedec3GabGpeA==
X-Received: by 2002:a62:85:: with SMTP id 127-v6mr17404886pfa.24.1541971285447; 
 Sun, 11 Nov 2018 13:21:25 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id j187-v6sm15853836pfc.43.2018.11.11.13.21.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Nov 2018 13:21:24 -0800 (PST)
Date: Sun, 11 Nov 2018 13:21:24 -0800 (PST)
X-Google-Original-Date: Sun, 11 Nov 2018 13:20:33 PST (-0800)
Subject: Re: [PATCH 12/13 v2] riscv: define syscall_get_arch()
In-Reply-To: <20181109224833.GA2710@altlinux.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: ldv@altlinux.org
Message-ID: <mhng-11f5dbf6-0aee-4f6e-b184-63536ecc3ac5@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_132137_291693_14C1EF8F 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: aou@eecs.berkeley.edu, paul@paul-moore.com, david.abdurachmanov@gmail.com,
 linux-kernel@vger.kernel.org, eparis@redhat.com, lineprinter@altlinux.org,
 luto@kernel.org, linux-audit@redhat.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181111212124.FrxoZFRyzfmOCq1UWO5VVKJE7EdeMSWaw0IEPfRSPjw@z>

On Fri, 09 Nov 2018 14:48:33 PST (-0800), ldv@altlinux.org wrote:
> syscall_get_arch() is required to be implemented on all architectures
> that use tracehook_report_syscall_entry() in order to extend
> the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
>
> Based-on-patch-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> ---
>  arch/riscv/include/asm/syscall.h | 10 ++++++++++
>  include/uapi/linux/audit.h       |  2 ++
>  2 files changed, 12 insertions(+)
>
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 8d25f8904c00..bba3da6ef157 100644
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
> @@ -99,4 +100,13 @@ static inline void syscall_set_arguments(struct task_struct *task,
>  	memcpy(&regs->a1 + i * sizeof(regs->a1), args, n * sizeof(regs->a0));
>  }
>
> +static inline int syscall_get_arch(void)
> +{
> +#ifdef CONFIG_64BIT
> +	return AUDIT_ARCH_RISCV64;
> +#else
> +	return AUDIT_ARCH_RISCV32;
> +#endif
> +}
> +
>  #endif	/* _ASM_RISCV_SYSCALL_H */
> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index c4c8b131af48..1b199a77a6b9 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -405,6 +405,8 @@ enum {
>  /* do not define AUDIT_ARCH_PPCLE since it is not supported by audit */
>  #define AUDIT_ARCH_PPC64	(EM_PPC64|__AUDIT_ARCH_64BIT)
>  #define AUDIT_ARCH_PPC64LE	(EM_PPC64|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
> +#define AUDIT_ARCH_RISCV32	(EM_RISCV|__AUDIT_ARCH_LE)
> +#define AUDIT_ARCH_RISCV64	(EM_RISCV|__AUDIT_ARCH_64BIT|__AUDIT_ARCH_LE)
>  #define AUDIT_ARCH_S390		(EM_S390)
>  #define AUDIT_ARCH_S390X	(EM_S390|__AUDIT_ARCH_64BIT)
>  #define AUDIT_ARCH_SH		(EM_SH)

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
