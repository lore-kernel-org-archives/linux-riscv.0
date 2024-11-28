Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C0ED690EC
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 08:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=db8koJFrZs0HMjo2PYKQvANDYp2AyLO/QGyW9sPiV0g=; b=K7yFyir0lxEXCE
	b8kYhD1tutjalIzlBm1NElBfsqL9tNPhDAGz5oQKCWBUwzE0QvD5gdySwYlTwQCRZluhEsMX7L9AI
	i64VCvAlgclO+OoQ0RYDrPAiTHp9KC9Rqfylxk+2Z/eVILa0siLhFvzbCl2LwcZG/Y4TgOgBZChhA
	S6tCgV9veGwrtCZU3QawBWZkrIcej1Qfg7fT3bilaUpfawQRuW1svX3gCGj26cwo6Xu33az8csJp4
	qfpXqO/OuKjC/TFw5ayDszxDriWtxXjvZ73jKrn0O5OYdrkO8LKH1Wj8hly2Cw8cPuVGX1myf9IyP
	4JD9UcKgvvaJyLCuyMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaLc-0000000F5b0-3L07;
	Thu, 28 Nov 2024 08:58:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaIQ-0000000F4s4-2toC
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 08:54:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4349f160d62so4888305e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2024 00:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732784085; x=1733388885; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=taBVx576Mb1d9PyRzDmNA5pfsmrnP1DVnZEuUXxBBrg=;
        b=GdxPIs2xSXII0SvV4qO1IDbYD6ixOIsz8xpG+aluxFd2CmBl5Nh+bNXx49wWiMTkIB
         hLILxsMremUbtIFdBIOwnGYOktERLaNlyTAR1fRVQ9oI4iwFPShPpDxDU+dE1KH9QOx5
         YfMHZQgI6GWKgam+WgvVf0LdYo2ax7yTTgR/dfznWObbe0CMTq6wkYhqLH/Wx8v8r6y4
         iEVjuw1qhXwgkKUzem/TFZXGoZBY6sHwTf0YX11br0TtkMU4nsWMjvGQ4PoNZ2GZohbI
         bxYCcMqhQzXS5yjOfYVmL2ADShHmvRF3Cr/pLVFcLXw53piIoWtaqPbGbJFZL1B74ghm
         Rm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732784085; x=1733388885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taBVx576Mb1d9PyRzDmNA5pfsmrnP1DVnZEuUXxBBrg=;
        b=EK3Y/bkUMtQBzs7NWeGUNSDQw9L7JdNwUHx3g0nVbd5y9TALX47uNySbuX6+Y/RIyG
         NnC6g5X/xfE8TeaqkhD8ojXgvHae9/tj9SbUH7EwjWVoK927H8ZTz8sekD0c2qHc2NgU
         JUflJFmJMKIkgBjgCifxmqwLIzW9i3xcMXXra911C4KJFd5u/TDKquyEuUnPbfhpZ6lH
         AD5uRycLU+UdzJ1JwEfhI5z7MWmljH7KZYJ+6vPmo8y/2Ojsuy3uhT8oiRShHrCJALTR
         3mTG95VsWfNb1RU/ZpUzUVebTTfJvGI9vRfqYPF4JV5anrsLyUTVCrlBPLHwvPf0R7vG
         dOkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbozZkSrj7A5/P4vLXkic1gdOeIlycbOjMufaEG7tZDggBymEKJn3lxRarUera3bNA3wHszgi+/VD2rQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoKH8tfoX9NfiQ91uESXpbwRmIvicblzvHXnJDXuOYtoawnzVi
	yP7IoftgVzC4V/NRYXaYR+/CyuK4hAzXnUZ8uuzpajPRSFSyOJDogxita9QrJYI=
X-Gm-Gg: ASbGncuq98NF63ue8v9HDBcDYNlUHezA/Twotf2CiixvCRjTp+gcPxxIzhHOzlmxGjr
	HUqaHG730+EBxIt54pFwbwuRFzw4f/thzfjDaDBl3jpfa1NBmHe2QHg7gZUl1aBq5QUcQ2qALCU
	tmWymiWAjPmgA7sfoS0UfHwSCpO95hxf5TZVrVl3agqXFYuOPTyZbgk2gJP7qFvOAqZBjh4Rrmc
	dKCBjII19ma/vsgqON8NqtYxwINfv5x7zg6NXhy3/qMHyBDlR196G/f8jJqlXCsRQcvr8TPmB9+
	E4GLfTOI+PRecwG8PHn15cj2TeNskruLeL0=
X-Google-Smtp-Source: AGHT+IEntdOWnTKPyyviVSOvyKSQxfhN3cgjS0CqUnt2K/m/lFqUeDFCwz3Y0hrrEdviqAlNmfKsKg==
X-Received: by 2002:a05:600c:314d:b0:434:a75b:5f6c with SMTP id 5b1f17b1804b1-434a9dbea45mr66592635e9.10.1732784085239;
        Thu, 28 Nov 2024 00:54:45 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dbfa2csm15280125e9.17.2024.11.28.00.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:54:44 -0800 (PST)
Date: Thu, 28 Nov 2024 09:54:44 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 3/4] RISC-V: KVM: Allow Ziccrse extension for Guest/VM
Message-ID: <20241128-9f7234d55cedf2afd881f82a@orel>
References: <cover.1732762121.git.zhouquan@iscas.ac.cn>
 <77198ab759eb01ca490f4c2199910e778b57d372.1732762121.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77198ab759eb01ca490f4c2199910e778b57d372.1732762121.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_005446_726306_8C4C7095 
X-CRM114-Status: GOOD (  14.23  )
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

On Thu, Nov 28, 2024 at 11:22:07AM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Ziccrse extension for Guest/VM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 340618131249..f7afb4267148 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -179,6 +179,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_SSNPM,
>  	KVM_RISCV_ISA_EXT_SVVPTC,
>  	KVM_RISCV_ISA_EXT_ZABHA,
> +	KVM_RISCV_ISA_EXT_ZICCRSE,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 9a30a98f30bc..ed8e17da1536 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -64,6 +64,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(ZFHMIN),
>  	KVM_ISA_EXT_ARR(ZICBOM),
>  	KVM_ISA_EXT_ARR(ZICBOZ),
> +	KVM_ISA_EXT_ARR(ZICCRSE),
>  	KVM_ISA_EXT_ARR(ZICNTR),
>  	KVM_ISA_EXT_ARR(ZICOND),
>  	KVM_ISA_EXT_ARR(ZICSR),
> @@ -157,6 +158,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_ZFA:
>  	case KVM_RISCV_ISA_EXT_ZFH:
>  	case KVM_RISCV_ISA_EXT_ZFHMIN:
> +	case KVM_RISCV_ISA_EXT_ZICCRSE:
>  	case KVM_RISCV_ISA_EXT_ZICNTR:
>  	case KVM_RISCV_ISA_EXT_ZICOND:
>  	case KVM_RISCV_ISA_EXT_ZICSR:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
