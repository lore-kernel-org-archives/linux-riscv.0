Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BE3CA0EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 21:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAn0P9+LOt2qAObJwnnLKX+UyrlSvHve22dkJyQNPaQ=; b=iKjazO2/ivJqZT
	HVrkQxXQ2+lStDZySxGxaKCcM/HDSDmemxAbkQdW5zvLiBuYlPfzlfGCKxth/GHx+tnGDddCYn+KR
	r7YMirnEzcUsKVWx032ctSIFQCUhBnyGDWj+SS2jdMdqn0YuVAU2K8mdWsVLM85ID0WZI5c0BeEUg
	YfzcWAG6xqXokZ+4Khb4tvfmUvRxq2UomPMFghUGyeyhFzpESbA+l/u5zyPQ3TFyH/q428pxQJmKP
	01k2UOPvElCMB9zHUZt+oZscvQcR2vuvD5BBNHKuzMt7NsJ8B902WpSKG+LMIFjeXx8G40qAjxgE0
	w2H0lTFWhkJCprKWvnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7QQ-00000008k17-2njs;
	Mon, 18 Aug 2025 21:29:54 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6nA-00000008fDj-3zJF
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 20:49:22 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3e671afa78bso6850755ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 13:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755550160; x=1756154960; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yTx0AGgPrDbS3KcN6ga5NW90Vwf9DBfaoRIUpUUDTXY=;
        b=pWtzoege8PeURuZP1hNV/qOvekeq8/lCJCrmYrBesflWz2D+0Zw07us6kIKo5rhqlq
         oR4gSNMLokliKt7ByVHPlHFWydvpmvQY+OwVomIs6uCJfkMXYWlPwzBuYBoflej1OxjG
         MUqysoRhvjE9SmpocmyWmqiN2elClRi3wsx8z0rqoW2drq639oNXiqegYRFF9tMi7d36
         dC3AEf3jKGCwlH8spdynrjL8U3v+DTssmCLljRDWG5oEmFfCSa5vN/SzkdvArao4WIJi
         TndcSBSBk1eBcmKR5T79NqqdcIaqNgfk+WmhM880rqhOPA6OaM/VjvzBk2Z6cEYY+gIX
         kHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755550160; x=1756154960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTx0AGgPrDbS3KcN6ga5NW90Vwf9DBfaoRIUpUUDTXY=;
        b=DduBrQiSlVh6GRq1OtakvJV8agGnDgSFUV7MHuO3GE2ftzsqxwRZTVqYKtrY8T45tk
         Adw3RmILHSP6Zp4hiRF5YT6vml0AyLOuxW4wHR8A5nrPJkijpPpDhWsDOAw7fNcaXX5D
         P6ghX6JwptBzGmqNMeZwm7azNn5VmK7uxsS/YywXIp+/G6RSv4900SLp9EJd6WrgMGHj
         HJpTUSbWeBc1vjvA1ezYesIPYDHar6KTn1H5zoyqjJkOxLV9eqPNAgM5588UTCqoO3hV
         JgBbyMgHJn2wdXRCSTgcILjfUtY4a0jkan0jRVaWVncHsvRJDaONvgCfFgQTgZYMj6Ee
         f6JQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2rLnTbekZTQXvv4FucFWYb+sO1cBRs7P9xyTR25L3Cm3Km98dzC66ji88qtuFv0mUgNlE1c/TrSmrEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB9nbQnE0lEQKFhns2tPE/GaKA6dKrSy9c4tnmoXa61RlFdAqC
	8ye3dV7foKBO08W14fbBsBQMBz53HI3Xqzjux2Rw5OvkzFbyXxEz9zRAB38P1Ysq0hI=
X-Gm-Gg: ASbGncuB2kpi4d9SYN1qCRnPerm/JC2nTfWMGDZ+yit9awLs8sk5niLslYbGCK+StYI
	qkRhuXkf+wbqUK8T8VmcyyTL3l6Dp3QoFDTTq6HKGkQcxs3+R1gduxldjTghL2l1S2xuWDHMObk
	J1jVZznkjISRbm2TLcc0pURTf+p73BjnaC+kNH/QtALTC9+28jav360agTYAjLNqCSIkHr5verA
	dlnwF/pVwjlYtQk/GZef79/SYCY+ANQBzDxQRIlYiX/jQbvQakSSm5m30+0N9NIebz1b2nZbHoD
	Q9MxXQBn6X5g98jLeVfSXl15d8FKAh77wpLPRMmKNnGrJIHjs7kk5tqb4eCPLASfX0ay5DW/32+
	NgY/OzXW8o00nmV6ArrzTJbxrBG+24Dxv6uQ=
X-Google-Smtp-Source: AGHT+IHxcwWqm3fjBflzgEs6NvcilbQYpbaH0XAlN7Sox/42b5vyAZqiL/BamV9P4rahkCtx7tHI7Q==
X-Received: by 2002:a05:6e02:18ce:b0:3e5:6696:202d with SMTP id e9e14a558f8ab-3e67665caeemr2588935ab.20.1755550159855;
        Mon, 18 Aug 2025 13:49:19 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c949f68eesm2778428173.77.2025.08.18.13.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:49:19 -0700 (PDT)
Date: Mon, 18 Aug 2025 15:49:18 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: dayss1224@gmail.com
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v2 2/3] KVM: riscv: selftests: Use the existing
 RISCV_FENCE macro in `rseq-riscv.h`
Message-ID: <20250818-617bdc4613bfa02c291a6b47@orel>
References: <cover.1754308799.git.dayss1224@gmail.com>
 <7de4aedb44be3166a6568c28da70c0d2d4850571.1754308799.git.dayss1224@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7de4aedb44be3166a6568c28da70c0d2d4850571.1754308799.git.dayss1224@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_134920_988117_29801919 
X-CRM114-Status: GOOD (  15.13  )
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

On Thu, Aug 07, 2025 at 10:59:29PM +0800, dayss1224@gmail.com wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> To avoid redefinition issues with RISCV_FENCE,
>  directly reference the existing macro in `rseq-riscv.h`.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Dong Yang <dayss1224@gmail.com>
> ---
>  tools/testing/selftests/rseq/rseq-riscv.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
> index 67d544aaa..06c840e81 100644
> --- a/tools/testing/selftests/rseq/rseq-riscv.h
> +++ b/tools/testing/selftests/rseq/rseq-riscv.h
> @@ -8,6 +8,7 @@
>   * exception when executed in all modes.
>   */
>  #include <endian.h>
> +#include <asm/fence.h>
>  
>  #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
>  #define RSEQ_SIG   0xf1401073  /* csrr mhartid, x0 */
> @@ -24,8 +25,6 @@
>  #define REG_L	__REG_SEL("ld ", "lw ")
>  #define REG_S	__REG_SEL("sd ", "sw ")
>  
> -#define RISCV_FENCE(p, s) \
> -	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
>  #define rseq_smp_mb()	RISCV_FENCE(rw, rw)
>  #define rseq_smp_rmb()	RISCV_FENCE(r, r)
>  #define rseq_smp_wmb()	RISCV_FENCE(w, w)
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
