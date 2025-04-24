Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B622C369D8
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 12:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhRlt6V+eDw1yRuuZRmoH197b/Zjf5ZugGDrPzsx6Wk=; b=4ZqthAMUH2loHJ
	DvdBHql+HFiOpx7+tWM3t644wld8cWeJpNIUK9DEwWCHlHCw4eRZFvREvn64LfWeF2Cq18OeHeXd1
	xBsZ/V5HPcYwyNNiCiv7IEJumsoeRvUJRaBeHiSEEBO8MR1vo+YnP2r9Yx/GflMtbsYwCs+pd8isD
	2/3OTdwHUYmxlJjcAjWe69aIzEnDW3b7Os3M3hCCMv6YJRaVMGkmI/8jDyRWMkNfBeZ7l3L994mA2
	fDDzQaMIfq/MlSdnn2ortn/TJqKwgz7f5rly32LifT1TFpt0PLCCnrD0tEMUEhpB3Smkk5F6UZ43K
	a82ErwOCLqGbn0opFXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vQN-0000000Dyl0-01w6;
	Thu, 24 Apr 2025 12:11:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tvk-0000000DhcL-3Es9
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 10:35:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso943672f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 03:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745490943; x=1746095743; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUR+h4PX+3NwGH8BQZC0fWxB3CoxerSbNXDHvlU8Qy0=;
        b=ar4zz4Nq6PtwLJYcRR4iX2G7GNnhekTCDiia0loCzS4GdL72cVOYqD6IQzG/2O5hG/
         bn2Ut163Jn7udqPkg9zQD+zsWsIFBzNfeNhXMQlb0HPrnGoUygOBvMapLF9eIMlvT4ws
         kx+sBTbdKSRWqyn2okXkGM1gklIu6DnGYTpIiER/XxEuqxmd6XYSP3sQnAsU3+dph/ek
         gTUEMe8xuOSioVFJ5MSUeQw9j8/YpaPt+vIkTU88RxrF4iHr/ZO802o6JJguxsKtrE+z
         un9/IBFqbUJBYqFF2sRApHOBqt+FI8z6NdYMoD6K2t0Oiy8JEdE8uinXzW7a10fTYph0
         5Q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490943; x=1746095743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUR+h4PX+3NwGH8BQZC0fWxB3CoxerSbNXDHvlU8Qy0=;
        b=Tcr1FEPJhicb7RhkM0tc6eALnSFqaFPt135m0JkO5rlXPU6AQqxe92SVKIm811kW5s
         dUrOjMkL6JMD9FFdKMriCBwlbyg3axvnCYZDLtiqdyF8PAF0IEi1Ajmn+TLWL/9DPHq2
         tZdanEsGVWt56o3NGY/V96IdXgYsS73btfwuuhOVgN/r8zLqsqirzedmrKomB/rka3tw
         f3MB7oV2DxOGxzKCG/NPv7xsKFidlDy6i0nSrs86P6zQaE38ErUsAPe19dySg1qKnqhF
         Lnl6yltf7Sinc7OYMkWTVkOkB7DhStMJtEkuNIdjvXd1UBNBKQ71g3VTevj4WjWkXc4N
         8tLg==
X-Forwarded-Encrypted: i=1; AJvYcCVD+IllAdM4v6daQsUYHrNs3xhwUlWhJvNiYkjzxtBhyUaHTDtDHPNjV+/Yk2zadrBEgtrFj3NIaFjg0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRMTQ9PVPyGmTrefU2A4fTRAts8hTSOg5jvhxC4K2gbGBMhQzM
	9KjlUAY+wveehlKiWycs7D6n0dLREBMCNZnC62FySmw5EouMOef0Vee2Lv/Hhd0=
X-Gm-Gg: ASbGncsPm6fYZADgAtWJTRwAcvNB6v9+oFQk7cXl/ChMxHCT8B6lvue8K3Y042fAbny
	XGP35alVKSmgF8j8wvNxMexezhJMq6bSjWV+jZnEfHlGyAYbQ6iaoHnAchC0MatmrG51YBItJYt
	0RWMpTFBiq4VTT0tKzoYY2RMiRrEl9bbxHwBepASEn0GiJtj+9XP2SQYMTNGZSsYGKzkGWpwOTS
	dr7wTv+dt6ZUPgdQk/wEshowJKWUrZbf1Fv4C9zZWCc2YUJkd1eO82pj0N4vLa+bbMlHwxXPT+B
	g1g2iJkD4so0HF/2VN3o7kQNADad
X-Google-Smtp-Source: AGHT+IEMMNUAVFSZJW72EDWo3VFnQwnHK3P23aJgYipjy3Fyv7YBKouXm/RCEBGe7MUaHxg7wn5VXw==
X-Received: by 2002:a05:6000:4022:b0:39c:1f11:bb2 with SMTP id ffacd0b85a97d-3a06cf5ee5amr1527452f8f.22.1745490942932;
        Thu, 24 Apr 2025 03:35:42 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c30ccsm1653633f8f.49.2025.04.24.03.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:35:42 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:35:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] riscv: Fix typo EXRACT -> EXTRACT
Message-ID: <20250424-93c64fdbb15c142ee458d857@orel>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
 <20250422082545.450453-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422082545.450453-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_033544_803057_0D97452B 
X-CRM114-Status: GOOD (  14.13  )
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

On Tue, Apr 22, 2025 at 10:25:43AM +0200, Alexandre Ghiti wrote:
> Simply fix a typo.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h | 2 +-
>  arch/riscv/kernel/vector.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 09fde95a5e8f..2a589a58b291 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -352,7 +352,7 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
>  	({typeof(x) x_ = (x); RV_X(x_, RVFDQ_FL_FS_WIDTH_OFF, \
>  				   RVFDQ_FL_FS_WIDTH_MASK); })
>  
> -#define RVV_EXRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
> +#define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
>  
>  /*
>   * Get the immediate from a J-type instruction.
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 184f780c932d..901e67adf576 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -93,7 +93,7 @@ bool insn_is_vector(u32 insn_buf)
>  		return true;
>  	case RVV_OPCODE_VL:
>  	case RVV_OPCODE_VS:
> -		width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
> +		width = RVV_EXTRACT_VL_VS_WIDTH(insn_buf);
>  		if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
>  		    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
>  			return true;
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
