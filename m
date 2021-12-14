Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0ADC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UplZ0ylZswuOZdrMIDCoZcuszzOcp2KOemeGuuR1vF4=; b=KbDRoW/1UGwDyxP5p7/ktCgNPw
	QToimqqz3M+1uN145K5B31+T4SmS17CZWSBEBj2nfbykJ54vxaWNgWMKIuW5fMt1FmiaWE4gXJimI
	mdUsAB+X31Zhvv3NmcP4NJUOxU6+SzP3HNYlinXTU3GqySnzUINXQ0mIDdh1/7eDUT7B6B3G+F17J
	uo2V2MblDLAW4Dj3t3DzT55y9cRHNsmHG7VRrHtmvZcm8mT66MbdxCacyCZnTlJBvfCiDdkzbzn9a
	FkoCsoKsP9qC+sR8a3PWe8iTrXmKijBSIZYvho6IkPFi4XoScr8obEwngmkng87BH9gMkJVYBz9KF
	iHZCfQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAgA-00EsKw-52; Tue, 14 Dec 2021 16:29:26 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAg5-00EsIF-BX
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 16:29:22 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 oa5-20020a17090b1bc500b001b0f8a5e6b7so886848pjb.0
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 08:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fayYzjKhb1ITyWmmaWz8uvl0NT3hSIICX61WlJhr3bw=;
 b=3npQRSPn3WOiUQhrf9MpV8DLsDL9s6gJNk/Znn5i59UJLylHLEUrhypvJQsHEEac13
 uDWA9mKNZTLaCv2cR86VpsIhTXy6JO/zem/hiZWYl3lvyrIA2VowEgJRs9DZ0GDdBWDD
 S97izKBkUaCTl5P/zwLEdsexrP2oH0C9JckZqv0Er9/7b9ydHzXxXqyndDupoLgTM2y6
 +Uinrk35kZ5MeXwq1iFKWL+zEuZzfXQnOSMEqK2GEkIHrFjuR5fxlLqZQ1tkt0AX14Nv
 dxDgSFJqA4/+8NEFxsMFuaj+izi1bMESZoWqVLusU5GgRzEP9Hqv3t1CrsAIzihJKJyc
 ot9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fayYzjKhb1ITyWmmaWz8uvl0NT3hSIICX61WlJhr3bw=;
 b=EhCNunP+es767w732KITsZylrd9fDS7WBKpdyIWd3wG2iM9wI/dCub/1IpU8cFdvMF
 q5scPFZdElw70MjJAALAYd7hMLCkqGsDlEGZSMVLOy09irOW88gV999t1rTNheOiSGC6
 ZjcHP8n9+WZXueH6d+FQ9bUZHEmfO2ovOO7pLYLVH5LL2D4lj3dL8OePbd8XZ3A9KNMR
 JJ5RntJS23Z5Gvt2NrV7VshmXfeEAqNldHP5HxNqYpGQ5eU4Ayfds7CnLj+yr3VXH3En
 5qn4/ujv1wONK/k+OWLMDyDO+5sbO2vcQufZdxdYEp2IX7aAQEc1Xw8YYn92/07aMwiW
 gZig==
X-Gm-Message-State: AOAM530xI/GwnnSZ3uGZboyEHYyqrUrOfK0Aptnh+5HgXY1+xl9A+zhM
 myQuQrVwIWuMPjxHYyUMJSaOSg==
X-Google-Smtp-Source: ABdhPJwOgS8e5HRf6pPdJmD2U49z8CKChwO98Niai4ReRjn+TLf4LCgi205EvPKkH6nWiCeu+uu0HA==
X-Received: by 2002:a17:90a:4142:: with SMTP id
 m2mr6812300pjg.80.1639499360077; 
 Tue, 14 Dec 2021 08:29:20 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id m6sm291037pfh.87.2021.12.14.08.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:29:19 -0800 (PST)
Date: Tue, 14 Dec 2021 08:29:19 -0800 (PST)
X-Google-Original-Date: Mon, 13 Dec 2021 18:17:52 PST (-0800)
Subject: Re: [PATCH v9 02/17] riscv: Rename __switch_to_aux -> fpu
In-Reply-To: <8e02819b9f8220f64ca43c330192c20594903ba9.1636362169.git.greentime.hu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-ff1d6a4b-a332-40bd-afab-f0d176b03164@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082921_427632_78132942 
X-CRM114-Status: GOOD (  18.24  )
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

On Tue, 09 Nov 2021 01:48:14 PST (-0800), greentime.hu@sifive.com wrote:
> From: Guo Ren <ren_guo@c-sky.com>
>
> The name of __switch_to_aux is not clear and rename it with the
> determine function: __switch_to_fpu. Next we could add other regs'
> switch.
>
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/asm/switch_to.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 0a3f4f95c555..ec83770b3d98 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -45,7 +45,7 @@ static inline void fstate_restore(struct task_struct *task,
>  	}
>  }
>
> -static inline void __switch_to_aux(struct task_struct *prev,
> +static inline void __switch_to_fpu(struct task_struct *prev,
>  				   struct task_struct *next)
>  {
>  	struct pt_regs *regs;
> @@ -65,7 +65,7 @@ static __always_inline bool has_fpu(void)
>  static __always_inline bool has_fpu(void) { return false; }
>  #define fstate_save(task, regs) do { } while (0)
>  #define fstate_restore(task, regs) do { } while (0)
> -#define __switch_to_aux(__prev, __next) do { } while (0)
> +#define __switch_to_fpu(__prev, __next) do { } while (0)
>  #endif
>
>  extern struct task_struct *__switch_to(struct task_struct *,
> @@ -76,7 +76,7 @@ do {							\
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
