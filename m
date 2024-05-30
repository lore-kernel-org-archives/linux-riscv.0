Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17B9C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 11:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9OoYHzXJb1wRRYD7jPzxHw9fMTICQoSQyrJFnfLAog=; b=qPxZF/s8OQ/JsQ
	t5vw+qmPPFDtTdBlgLj6Y1Cc4LdZLmheTCiz9eaoX2QeUyqoUdEo+CnLHdTPUnsExe+eLKx6PjNCZ
	ePxQ+B3ZzcyYWzeBXfOZWHp9ZCzU3va3Yq772GDQgVlhWuPKL+zTubh4TaHYdHpaZY9+aEka9TSc0
	UqI5KCItQJ2B/OnLPM3qxgzYXUYfqO1tsSSx/HV99ozRa7h9jmzK56NPwkTKfKhvtmLNiExMZO0oT
	oe4jugHc9NQ7eGe1xyFcx+ZvdMF2cvgYBmsU7ZBOGj70U5tT468ZT5x/a63zNJRIoaPfJYLmPPiwg
	hX4uJ4kEQNSgqT3lNCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCeMx-000000079jD-0r4O;
	Thu, 30 May 2024 11:54:55 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCeMt-000000079hp-3Zlw
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 11:54:53 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-57a20c600a7so632621a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 04:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717070088; x=1717674888; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E9rKDBmL9soASvcn3puSMSoNCTN/9xOU0/NVh1/cveA=;
        b=PX8xej+qvEWSMwN6my7xZPh7THEqvYHOaAX5Tz7tIt9XsksaVd+B8b0QYJIRGbIUVH
         gBbLxlkj7daIljem10ppNjMUPXNYmf26DocsspbqWfvPRG8uAkJuDlhrg9qxMrZ7ilZ3
         ORhH6A6PBKlthzd7+FgS6Gb7xGxtJl2L6DuLTWgqmapwKY1JzUhHpPge+0QYq3nBwtVi
         OlYhi0gpXlZVYl/BCnWU1L5x20adFnKifPGeX2KDSbgjKaMqLoKbNqCndJ3Ddi3dyV2P
         v3Y1aW6yQz7Iw0TqqskiUz+9357BfdQVwyO8RVXCprGTPAgcGiFPn4vNf4tjiJRUTab3
         hdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717070088; x=1717674888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9rKDBmL9soASvcn3puSMSoNCTN/9xOU0/NVh1/cveA=;
        b=aezWSZJoKFTWZVmX+Zzze2RtD4bTO8rZsvNiyBoVneOS2SFuOgr7e4LB/Asn/ZONYs
         vfFqNjGw0TbJ1aULEhn78X9ptjwJQuJ6R/nSHrOpVDu6LeV7gjVkr843IXXhnk+pzc7e
         TRc8pVG3kJ6JkbB6hs1YCaumaZQRXTErz2LpNrj8w9ifeTd8LH1x3OQqmFoME0VZfzSG
         IFPLmSqq3MxvAGPv5m9p7If4DljpcrOZsLK/n49rI2/ph+IdMOnGvcHeWT/3xfXco+Ua
         +HDOFWTtis5dhbH6l15B20Ca5QxdWsymETslBguDqmM7ua4CX7iRAPY1z2Ohd25Ia9ND
         nC4w==
X-Forwarded-Encrypted: i=1; AJvYcCVdrOmaYOh/W96bbPvVMze8lUG7Aa1eybBzhlOevzCMHgRjD7x6WbYzhhl9KqUM+PzadPDl6z/E6H8s1Pktaa498iJp6NT9h02wdJEBPLs3
X-Gm-Message-State: AOJu0YwtPZzSfXAhpXw2G5NnbYX5br5oM4GHzGyc8L1b/Xhs6kszbLJQ
	5sur3zBK2sNahNYGqXaVkYaVsggQpvJ9dYopsRWEubdmPZ6mApUh
X-Google-Smtp-Source: AGHT+IHcrkRsHVuOzDKSWtKoLJ2lTeSArPw9M/N0SicJ+VQ9WKMaL79ZGbhBaK1qM+IkwbeVnJAhzg==
X-Received: by 2002:a50:9e05:0:b0:57a:1d5a:9cfa with SMTP id 4fb4d7f45d1cf-57a1d5a9f0bmr849627a12.38.1717070087662;
        Thu, 30 May 2024 04:54:47 -0700 (PDT)
Received: from andrea ([151.76.32.59])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578f47126f0sm7346919a12.91.2024.05.30.04.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:54:47 -0700 (PDT)
Date: Thu, 30 May 2024 13:54:43 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix fully ordered LR/SC xchg[8|16]()
 implementations
Message-ID: <ZlhpA9NsgI0z6t/E@andrea>
References: <20240530075424.380557-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240530075424.380557-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_045451_931128_E93B967E 
X-CRM114-Status: GOOD (  10.00  )
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

> -#define _arch_xchg(ptr, new, sfx, prepend, append)			\
> +#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend, append)		\
>  ({									\
>  	__typeof__(ptr) __ptr = (ptr);					\
>  	__typeof__(*(__ptr)) __new = (new);				\
> @@ -55,15 +55,15 @@
>  	switch (sizeof(*__ptr)) {					\
>  	case 1:								\
>  	case 2:								\
> -		__arch_xchg_masked(prepend, append,			\
> +		__arch_xchg_masked(sc_sfx, prepend, append,		\
>  				   __ret, __ptr, __new);		\
>  		break;							\
>  	case 4:								\
> -		__arch_xchg(".w" sfx, prepend, append,			\
> +		__arch_xchg(".w" swap_sfx, prepend, append,		\
>  			      __ret, __ptr, __new);			\
>  		break;							\
>  	case 8:								\
> -		__arch_xchg(".d" sfx, prepend, append,			\
> +		__arch_xchg(".d" swap_sfx, prepend, append,		\
>  			      __ret, __ptr, __new);			\
>  		break;							\
>  	default:							\
> @@ -73,16 +73,16 @@
>  })
>  
>  #define arch_xchg_relaxed(ptr, x)					\
> -	_arch_xchg(ptr, x, "", "", "")
> +	_arch_xchg(ptr, x, "", "", "", "")
>  
>  #define arch_xchg_acquire(ptr, x)					\
> -	_arch_xchg(ptr, x, "", "", RISCV_ACQUIRE_BARRIER)
> +	_arch_xchg(ptr, x, "", "", "", RISCV_ACQUIRE_BARRIER)
>  
>  #define arch_xchg_release(ptr, x)					\
> -	_arch_xchg(ptr, x, "", RISCV_RELEASE_BARRIER, "")
> +	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "")
>  
>  #define arch_xchg(ptr, x)						\
> -	_arch_xchg(ptr, x, ".aqrl", "", "")
> +	_arch_xchg(ptr, x, ".rl", ".aqrl", "", "     fence rw, rw\n")

This does indeed fix the fully-ordered variant of xchg8/16().  But this
also changes the fully-ordered xchg32() to

  amoswap.w.aqrl  a4,a5,(s1)
  fence   rw,rw

(and similarly for xchg64()); we should be able to restore the original
mapping with the diff below on top of this patch.

  Andrea

P.S. Perhaps expand the width of the macros to avoid newlines (I didn't
do it keep the diff smaller).

P.S. With Zabha, we'd probably like to pass swap_sfx and swap_append as
well to __arch_xchg_masked().


diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index e1e564f5dc7ba..88c8bb7ec1c34 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -46,7 +46,8 @@
 		: "memory");						\
 })
 
-#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend, append)		\
+#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
+		   sc_append, swap_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __new = (new);				\
@@ -55,15 +56,15 @@
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
 	case 2:								\
-		__arch_xchg_masked(sc_sfx, prepend, append,		\
+		__arch_xchg_masked(sc_sfx, prepend, sc_append,		\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
-		__arch_xchg(".w" swap_sfx, prepend, append,		\
+		__arch_xchg(".w" swap_sfx, prepend, swap_append,	\
 			      __ret, __ptr, __new);			\
 		break;							\
 	case 8:								\
-		__arch_xchg(".d" swap_sfx, prepend, append,		\
+		__arch_xchg(".d" swap_sfx, prepend, swap_append,	\
 			      __ret, __ptr, __new);			\
 		break;							\
 	default:							\
@@ -73,16 +74,16 @@
 })
 
 #define arch_xchg_relaxed(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "", "")
+	_arch_xchg(ptr, x, "", "", "", "", "")
 
 #define arch_xchg_acquire(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "", RISCV_ACQUIRE_BARRIER)
+	_arch_xchg(ptr, x, "", "", "", RISCV_ACQUIRE_BARRIER, RISCV_ACQUIRE_BARRIER)
 
 #define arch_xchg_release(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "")
+	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "", "")
 
 #define arch_xchg(ptr, x)						\
-	_arch_xchg(ptr, x, ".rl", ".aqrl", "", "     fence rw, rw\n")
+	_arch_xchg(ptr, x, ".rl", ".aqrl", "", "     fence rw, rw\n", "")
 
 #define xchg32(ptr, x)							\
 ({									\


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
