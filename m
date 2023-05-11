Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF1DC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 22:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=YNjMQloHpm7+YRaNll+UUSxpLvaRuiyCFs+hY8JZd68=; b=h5p8UQ0cybISG0wiDO/uk9pDAr
	12LJalZsW98DMq+XuaDfk7g5PiJ+exEr5jiZkCxhog7rx4ie7kByrlBJ3SvMbkM/tTnWkTOfj9Oea
	lnlUWJD75YMrC5SqBrtXt/oGR5s4wl/yqMrhbSkOpNkfn2YoMobubpFJWiux2Yulkh+bjHHXaDOTO
	k2WRTc/B37T7MHFDmdaopZqwjlXzLtjGu70l9rTTiqKg+nk64n7mUmVr9sEslE4y7GSKiVlLhwROt
	ohLS8nM5aMB7g7gAjYsU3Dr9XHb7xW3hdj8+pZX1xwAxlKTV+qrihjwwxvd/mFhMbz+krEMsanbQc
	4Dp+5Z3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxFDD-00AGax-0j;
	Thu, 11 May 2023 22:56:39 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxFDA-00AGYt-2F
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:56:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-644d9bf05b7so4731987b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 15:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683845795; x=1686437795;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MA1nswhDybe/fzweVUsYHGyIgEVjExjicpJMHqrU66E=;
        b=NIVna15OVrvGXBv6dEhCTFGd32wBt2X7OtlAKwkKBbn399+G2TJW7noXJCJYBs5eYg
         BHSwa+Tql6RDR7ui0va7rZbQ6B2YgURvGhe9VrjJOeMiH8DfKc93hnzDLOySuLTo47jV
         pPg1I7xOOQz5HWKiC4rxTYV7kAX4+YBikhNXvjHjOxJ3s5hjf18Pxau2jbIgwDjbgP6l
         AZROf/paCxflYrGboRuAfdTz8tddgNgnN3g+m76zV+L9Be5ubMM7U2q+RFFydkBCRF/+
         S2QK1kuVI2M1VbZ0DgnfTn7FxYA2NqYDoxpwX3vumSnF3KC72Y+rL5UO4Mf1qJihVpBa
         4w2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683845795; x=1686437795;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA1nswhDybe/fzweVUsYHGyIgEVjExjicpJMHqrU66E=;
        b=a7UqPjm5r0xNkhQ86RPpPcjGUNCrq/sF1xsYil1mOAnXccdQRtaoxheuIaOLeCGX3/
         xiXHmnkqpe5H8UXKkWqmoiCizfukRopNxYN+JaYDQKioxdhO1Wzsvpl2km98ZFttbUSp
         cLh9gg6AJLynLvhDMAa/g4qeIdHlngXaqMNfhPqwEZSdEeoJDxPOSThceY3iivCcfC7e
         3JX+cGpu7J9QnmnI6ZsBno79Wyv3hz88+OCohdhHXXdasUhi6bcd0pj3Dji+Dh6OHRz9
         DvYhi9f9EcIFPqYl+nDNA12I4M6H1nLT7WMUrB+gCwMH8j9QmI+nkwKLzyrR5YdDMsxt
         GOBg==
X-Gm-Message-State: AC+VfDz4cEOr5OygOkK9UaigIHzcy0r53Ax8Fxs7ec8dNCXZ9+Mguf8y
	cAUA0d/z+6t1gK4o1owAGnqocdswKFjZD0LSYDw=
X-Google-Smtp-Source: ACHHUZ40Y3W6oug6oNeWAtZ+sD6wlkkIGjUUG0QYhcZI220ckWSrNtffjMK1bDVkVTbQjHiktnAR0A==
X-Received: by 2002:a05:6a21:3284:b0:100:9a80:2e90 with SMTP id yt4-20020a056a21328400b001009a802e90mr19820400pzb.59.1683845794654;
        Thu, 11 May 2023 15:56:34 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id r185-20020a632bc2000000b00528af015a8dsm5452388pgr.14.2023.05.11.15.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:56:34 -0700 (PDT)
Date: Thu, 11 May 2023 15:56:34 -0700 (PDT)
X-Google-Original-Date: Thu, 11 May 2023 15:38:26 PDT (-0700)
Subject: Re: [PATCH -next v19 01/24] riscv: Rename __switch_to_aux() -> fpu
In-Reply-To: <20230509103033.11285-2-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org,
  kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
  greentime.hu@sifive.com, guoren@linux.alibaba.com, ren_guo@c-sky.com, andy.chiu@sifive.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu, guoren@kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, jszhang@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-b8482399-b363-402b-b095-ce1b1dc1fe71@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_155636_734622_5FADD52A 
X-CRM114-Status: GOOD (  17.79  )
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

On Tue, 09 May 2023 03:30:10 PDT (-0700), andy.chiu@sifive.com wrote:
> From: Guo Ren <ren_guo@c-sky.com>
>
> The name of __switch_to_aux() is not clear and rename it with the
> determine function: __switch_to_fpu(). Next we could add other regs'
> switch.
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/switch_to.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 60f8ca01d36e..4b96b13dee27 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -46,7 +46,7 @@ static inline void fstate_restore(struct task_struct *task,
>  	}
>  }
>
> -static inline void __switch_to_aux(struct task_struct *prev,
> +static inline void __switch_to_fpu(struct task_struct *prev,
>  				   struct task_struct *next)
>  {
>  	struct pt_regs *regs;
> @@ -66,7 +66,7 @@ static __always_inline bool has_fpu(void)
>  static __always_inline bool has_fpu(void) { return false; }
>  #define fstate_save(task, regs) do { } while (0)
>  #define fstate_restore(task, regs) do { } while (0)
> -#define __switch_to_aux(__prev, __next) do { } while (0)
> +#define __switch_to_fpu(__prev, __next) do { } while (0)
>  #endif
>
>  extern struct task_struct *__switch_to(struct task_struct *,
> @@ -77,7 +77,7 @@ do {							\
>  	struct task_struct *__prev = (prev);		\
>  	struct task_struct *__next = (next);		\
>  	if (has_fpu())					\
> -		__switch_to_aux(__prev, __next);	\
> +		__switch_to_fpu(__prev, __next);	\
>  	((last) = __switch_to(__prev, __next));		\
>  } while (0)

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
