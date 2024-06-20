Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7085C27C53
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 01:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejRFvgt3tSrxxJilc4TsvB2cMagKjFChDaFNuj6lRXo=; b=lISaNffFCeFSN3
	9bQA9+YFdW3Lw+0DmG2xrJL1T/QhCO2AWdW5ovwWio2C/0WBiL7AkyTS1bCB7aMr/7to2/7KGa+mb
	7pW672MvTvyYGG5Y6ItvduRd0PZm7M266TamqS52dmkpzbJKjxWjgDE8vbT/3GaB5ALFOQdIRZh/h
	FAlAqJaY0VQF5WXFnfsGwskzM14Yvc26ADJkitLAJUuFcG3Hbw40vN/smWHXPp2jcQNx5RATEtcTn
	vq2yJQ2cx26EK3RL2NDS2ydzE4IFhc6/eQN28IhlFNoxMCoAeFDHG8T+2X8H2VAHpAo/iE1Mly3Dz
	MSuVtS77JakykOWKOmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK6El-00000003DAN-2Qrj;
	Thu, 20 Jun 2024 01:05:15 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK6Ei-00000003D9o-30O7
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 01:05:14 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-70df2135426so244809a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 18:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718845511; x=1719450311; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lTj093P79K2ULCRNhl2VLvyYHssujM99KgD8c+1HoEo=;
        b=EhvKMvB3UA4q0rsptQq7bSTu/WCMLdTkdZUFh5B4cRKbRVrI9XUCdIroioBWQfDfKR
         os3AHTYNupA9DWCoDlXDTnlkxYLg8w1Ki33qxDoCQo9V7QxkyaeOsOiGsBmJb7O3jWGl
         m/JPDG51Bx1Rqar1lng5Yc5vFa76cNmHYxpRntFSRaaMt59qIGccKt2oE1LyhiwLjcpY
         s+lr3O/fy00BgaSBjbB4MeNImN0vY85msQ/IMTYrCduWCF383hkkYxvL7fWUF+1gGlbe
         Dl+0+kRaFc4DWCMJ7mLfwoSpvQPcTr7ougN76vls1Ffvo60OaVTiQto6cbKp51NFbQZk
         Jgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718845511; x=1719450311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTj093P79K2ULCRNhl2VLvyYHssujM99KgD8c+1HoEo=;
        b=eyA+3TrM3Ow1qWPmB9IxVXj/PhmBj+BnIs4/5V1AVlNIeBLY7g1U8GIGyF3TwLlOKg
         HTNayY1O3jdCM0JoMX/otR9/hBRDlOMlD0z+g8m3JGR9j14zy8dyNnF183R/YCbrbByp
         sXqTV2iGwNmqNU7SnReqlXqf14RCmku1PUo8ZoaQDw0TTd/xJFEx/6gyJMLiwuJ2m72s
         qPT4iAuwHQgDHV+E7CGn3H6PnSa1tNnXQ2LtMOwGN6y35lGqtn2WLjWla0OhXIsR6QCU
         mtqoVaCWdCaOvOYnui5c1vDA23SUqdpYkscRB8WdXGOjvuBS87IbmudGIQfFE0wS4tma
         ME8Q==
X-Gm-Message-State: AOJu0YyjDSeADvjS6/O+M6+6cEUcNSOYxbgdMCAh/T6MBKejSe+GmYFo
	zYUv1Dd+LV9rCWOoAv7/jObODyarU+ZPKiY5mousGt636j28F2cegbAFVVwUTrI+hJ5J5xw6KL+
	Q
X-Google-Smtp-Source: AGHT+IFHG2YtBQ7dbN3z7grTnecoiBOyImNaiLDLLK/3MPitmfNNntYDhXLJZlDFsG7HRSOmDZO/YA==
X-Received: by 2002:a05:6a20:3c8c:b0:1b5:d00e:98d7 with SMTP id adf61e73a8af0-1bcbb5a8acdmr5418879637.24.1718845511409;
        Wed, 19 Jun 2024 18:05:11 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5ba93sm124827385ad.3.2024.06.19.18.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 18:05:10 -0700 (PDT)
Date: Wed, 19 Jun 2024 18:05:08 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: zhouquan@iscas.ac.cn
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, oleg@redhat.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	andy.chiu@sifive.com, shuah@kernel.org
Subject: Re: [RFC PATCH 1/2] riscv: Expose orig_a0 in the user_regs_struct
 structure
Message-ID: <ZnOARMA1I0yRoNh8@ghost>
References: <cover.1718693532.git.zhouquan@iscas.ac.cn>
 <d4c7da80b72375c75836303bc744e4db9eeec218.1718693532.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4c7da80b72375c75836303bc744e4db9eeec218.1718693532.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_180512_935143_36712C2F 
X-CRM114-Status: GOOD (  19.64  )
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

On Wed, Jun 19, 2024 at 10:01:27AM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Expose orig_a0 to userspace to ensure that users can modify
> the actual value of `a0` in the traced process through the
> ptrace(PTRACE_SETREGSET, ...) path. Since user_regs_struct is
> a subset of pt_regs, we also need to adjust the position of
> the orig_a0 field in pt_regs to achieve the correct copy.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/ptrace.h      | 4 ++--
>  arch/riscv/include/uapi/asm/ptrace.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> index b5b0adcc85c1..37f48d40ae46 100644
> --- a/arch/riscv/include/asm/ptrace.h
> +++ b/arch/riscv/include/asm/ptrace.h
> @@ -45,12 +45,12 @@ struct pt_regs {
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

This is a good addition!

Since orig_a0 is no longer at the bottom of pt_regs, MAX_REG_OFFSET is
now incorrect.

Can you adjust the value of:

#define MAX_REG_OFFSET offsetof(struct pt_regs, orig_a0)

in arch/riscv/include/asm/ptrace.h to be:

#define MAX_REG_OFFSET offsetof(struct pt_regs, cause)

This is something that is very easy to miss. I think it would be
valuable to leave a comment at the top of struct pt_regs pointing out
that MAX_REG_OFFSET needs to be adjusted if struct pt_regs changes.

- Charlie



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
