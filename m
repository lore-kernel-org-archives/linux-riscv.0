Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE7AC3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 04:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXqp1Dp63wbNcSjefIZRlCFt3DeroIJatun88xF6bJM=; b=uFRBdOhzOaT4o5
	NqnnM8wzCf/haFj1/n7S4bCpszOttoPeIAkH5070hpXr9h9iMYb0ek3/I0PnkLcnmimiPNS5T7IMq
	VKDj3uX1S+gpnPVpYvDFqfqa85TG+L8OV9cv1UPRTcVmZBNJmNcrZi9Gxd8L3nFDzte0uG0Augl1u
	TgBjJOz6BYzjIH7cWuyCBCdBNzV86oo3zvEON9Trq1Rtt8nz9mwX5x+pWLngCk4pCfIL8KBXr8XXA
	ys9lbCWzUk1l/dRW4FtX35IIiQ1TkY6NDkIzSVPZe568r5znpv3LLQjxfV1S18mXN0R+eTgMRyexe
	7Cl1xXP86JXeJEmHNEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOVDk-00000005WBO-3Eln;
	Tue, 02 Jul 2024 04:34:24 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOVDg-00000005WAu-3CIa
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 04:34:22 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e0354459844so3561754276.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 21:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719894859; x=1720499659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h4yh23E/AmlByOcWJD4eWcZh7D8p3BbXHSztKcWq0cA=;
        b=UPwlJdcG5j5fE6oJ2W5T8Xq457hVUTlWEhq7yyS/R+TOlcJFmTFCPEW0PNlFJSg5kR
         UBaU1jWx23YyUC8flb1S2HVKuO7pLw//JdfGduu7EmUz7wZbMHnk5M74VO3EK6t5a8bH
         +8xFhktudCoSfOolvJXVpsYkkfpkfKAPcoFbbPFqSsAJrbi/Uhg5ElCNjg1y0pjUfym/
         pEZ6H5LqtxQR7n+hnYIxmnnCca308FqUCwfBnv3YpAZHga99vHPEg/ewQ12I+tMUQJSX
         2j9PPTqVY/SIF+QlTgXSFqkjJ8Q7eDw94MHkXgeb4vHagqfZ+kr/XpsEZ/wb7W8YLdMW
         9JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719894859; x=1720499659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4yh23E/AmlByOcWJD4eWcZh7D8p3BbXHSztKcWq0cA=;
        b=IymkBqi58FYgipp65LS3iQ/V/zcNx1t9JgAcKoqQiCjGGsgWJ/rvqJBE59Bh38trhN
         UT+6QEkzzi2OE6rpGiMyFx4w9EVW5yLD0tKB7NgXc3KtIamMbtZ0X3Do6xHJ5RMMtoJg
         vF5ab1MN430XrFQf1ft1vd/vt9htimCGch0ZBlX7S8qM0A3VqRsZ+FfqQsNOOzr7ff4/
         zLuJml7AXDnn1R26p2kD06dQ77hT+JrXsJdlNh0wzjEMEVrnqUSUr/2R66ttVlnuWIWS
         4bTiLhd/4sAANHjZwoJT9LwZ9NsW65QQbguhUSVMVwaTQUi3Y4ZK0Fzy3AwOJEcLI/Bs
         ltaA==
X-Gm-Message-State: AOJu0Yyua6DxDQzQtAfLFUlbX2c+t5OibqgyKZBhICFlkQWZl2zQZwQL
	AOzpXuQHvxcEw3GFPioCkv2yHUD5AnH5o09qOyNi+aOzAb3eN1EBCgdQqS2d/HQ=
X-Google-Smtp-Source: AGHT+IFr7sVN2iw1k2zfGO5K3dhcutxzXrXIQmhw11TwtYUrAFSIAsviplllqAK0LOhKsh6tA8qHVg==
X-Received: by 2002:a25:53c9:0:b0:dff:4862:b0a with SMTP id 3f1490d57ef6-e036ec357fcmr8474625276.46.1719894859404;
        Mon, 01 Jul 2024 21:34:19 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:a569:328b:99ad:ce17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6d3efeddsm5826997a12.88.2024.07.01.21.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 21:34:18 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:34:16 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: zhouquan@iscas.ac.cn
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, oleg@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	andy.chiu@sifive.com, shuah@kernel.org
Subject: Re: [PATCH v1 1/2] riscv: Expose orig_a0 in the user_regs_struct
 structure
Message-ID: <ZoODSMYCRbNcZWaY@ghost>
References: <cover.1719408040.git.zhouquan@iscas.ac.cn>
 <a424caf3072d12ef6ba0c56c411789fb3282e844.1719408040.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a424caf3072d12ef6ba0c56c411789fb3282e844.1719408040.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_213420_824125_2A834470 
X-CRM114-Status: GOOD (  19.83  )
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

On Thu, Jun 27, 2024 at 11:02:46AM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Expose orig_a0 to userspace to ensure that users can modify
> the actual value of `a0` in the traced process through the
> ptrace(PTRACE_SETREGSET, ...) path.
> 
> The addition of orig_a0 also requires the following adjustments:
> 1) Adjust the position of orig_a0 in pt_regs to ensure correct copying.
> 2) MAX_REG_OFFSET should match the new bottom of pt_regs.
> 
> Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/ptrace.h      | 7 ++++---
>  arch/riscv/include/uapi/asm/ptrace.h | 2 ++
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> index b5b0adcc85c1..380cf54c1f3d 100644
> --- a/arch/riscv/include/asm/ptrace.h
> +++ b/arch/riscv/include/asm/ptrace.h
> @@ -12,6 +12,7 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +/* MAX_REG_OFFSET should match the bottom of pt_regs */
>  struct pt_regs {
>  	unsigned long epc;
>  	unsigned long ra;
> @@ -45,12 +46,12 @@ struct pt_regs {
>  	unsigned long t4;
>  	unsigned long t5;
>  	unsigned long t6;
> +	/* a0 value before the syscall */
> +	unsigned long orig_a0;
>  	/* Supervisor/Machine CSRs */
>  	unsigned long status;
>  	unsigned long badaddr;
>  	unsigned long cause;
> -	/* a0 value before the syscall */
> -	unsigned long orig_a0;
>  };
>  
>  #define PTRACE_SYSEMU			0x1f
> @@ -64,7 +65,7 @@ struct pt_regs {
>  
>  #define user_mode(regs) (((regs)->status & SR_PP) == 0)
>  
> -#define MAX_REG_OFFSET offsetof(struct pt_regs, orig_a0)
> +#define MAX_REG_OFFSET offsetof(struct pt_regs, cause)
>  
>  /* Helpers for working with the instruction pointer */
>  static inline unsigned long instruction_pointer(struct pt_regs *regs)
> diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
> index a38268b19c3d..3e37f80cb3e8 100644
> --- a/arch/riscv/include/uapi/asm/ptrace.h
> +++ b/arch/riscv/include/uapi/asm/ptrace.h
> @@ -54,6 +54,8 @@ struct user_regs_struct {
>  	unsigned long t4;
>  	unsigned long t5;
>  	unsigned long t6;
> +	/* a0 value before the syscall */
> +	unsigned long orig_a0;
>  };
>  
>  struct __riscv_f_ext_state {
> -- 
> 2.34.1
> 

Thank you!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
