Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95004C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 17:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZe6QgpVF/SWo0BXA/tg8LcVlUV4N97E63oq3D1YN+E=; b=yQTo61rPrkr2kE
	aDjhUr6IgRBLVyzZoBDJKwqUcdzwPJ4ueDR+6FTFY5ap5RWVkPo5bR+QCexhCmLGJGHkVVwvSAt6L
	+Jxj3+8JYulwY8EGNBnHoDPXl+TEsaboXKSUb7os26FNy5MkUmTX2qH9KWIKKu1MwT3YkVgEPvIKA
	kaPY3ClBK62DIshNSBKK3eFWB0+ogFtUf8rdVbdjHc+qQMk3VIE5GxiQDtFDnQhRv7wUei8JXzE+T
	h9lGiEJkOPapBHBmsIjaAMbGvb0EG4w38DxHIdpxN3Ouvl+8K9BFc+hEtNQIjP8OIk/Qs/cSmnHsi
	WKo71ekhG5ql+AXAT6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFOA-00000003Aub-3EKY;
	Tue, 09 Apr 2024 17:36:06 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFO7-00000003AoK-3M1e
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 17:36:05 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a51addddbd4so475885666b.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2024 10:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712684144; x=1713288944; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oksDrDeNBIi1C7DVLaC+ql7QPqJVNO5mhvekClGdtck=;
        b=baEZQjQl0Z1lhDj0A1w6qGkBfn3UPXYRL5KL+GtVaLegplHmutrOfQiZPzuqSUQbZx
         9jILVlCjmQ3kqOkliEZi6v7/7s1LbQgcM2quIrI4fztUugO6G8DwNqA1RdbNqGNw+zNJ
         qdXmXadQp8UmA/lyFLZZDrczhL9SekfAr2rjF+iTYC/eAyY/wYOCmRLR5sGZIHHn8g08
         augO+LylYQLU2TW5OaSYA02zC4y7WOB3eOln/HUzs82F1A+KzZP9DeuXCjTQCIRDM4VE
         SPvBjm08aRo9r8qzy8Gzc+QlH+Gm9wlruaoehH2bdbQUcIOi1ogSq/u81TN3Q3vYFBnu
         eyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712684144; x=1713288944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oksDrDeNBIi1C7DVLaC+ql7QPqJVNO5mhvekClGdtck=;
        b=cLnEjBfWewCxX6oGd5IjWFVZWnWZJKk0bRVSqrHX7P8IdVlclqml+FQzfYpaIgZGXF
         FROpci5x+efyN4WWDPn3b+sA6g+AEaLZTq2ObuWyxWa9aTh0KE1yKBufl4z/mfWLDgAY
         V0ld1AF5jJ1Rg0bS+COfIKF/BukO2YvKzUDHl/l8yPnpnY8W0qycYTIatnLkFUOVjupO
         UNSsbADaXq6/dlTswN8tb622VHuAuLVBDYEOZ+LdhdVlx1SN36/C6fPV8BdAcn1TplAo
         OJW0FPN+s/zkQ8Jsl0vIhzvkpyFepvZWauF8MWM5uvCPgOIrQWMxdLgQX8wvT3I66xgM
         q6lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV8zGrlrhDOoi3TumZQz5PB7tzdx5yHDc2kdRuzgOh9uk27o/DGI35Z8DD4InVH9+6PW9fkPwrosXVM40uM65OVAHXgc12wEYnWqb+XgRC
X-Gm-Message-State: AOJu0YwKLNWdjFFlghukGaVj8ykHk0lxJi1AuFVIc2XDKlTZ2JSXow9O
	0hAXuhfiRXC7U234rmIZ9+ZVkOGCwzbV65O1q+FrNn14fCjBsHDY
X-Google-Smtp-Source: AGHT+IEO/dT/EyFhl/Hqi0+rJYkm0yyrxPm+XU5vxXcOVNbNzgJ6NtA5sncFdXAPNsxKDtLVFhSDIQ==
X-Received: by 2002:a17:906:6a10:b0:a4e:3715:7f4a with SMTP id qw16-20020a1709066a1000b00a4e37157f4amr93587ejc.71.1712684143973;
        Tue, 09 Apr 2024 10:35:43 -0700 (PDT)
Received: from andrea ([31.189.89.249])
        by smtp.gmail.com with ESMTPSA id sa10-20020a1709076d0a00b00a4e6582edf8sm5855812ejc.102.2024.04.09.10.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 10:35:43 -0700 (PDT)
Date: Tue, 9 Apr 2024 19:35:39 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	elver@google.com, akpm@linux-foundation.org, tglx@linutronix.de,
	peterz@infradead.org, dianders@chromium.org, pmladek@suse.com,
	torvalds@linux-foundation.org, Arnd Bergmann <arnd@arndb.de>,
	Yujie Liu <yujie.liu@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH cmpxchg 14/14] riscv: Emulate one-byte cmpxchg
Message-ID: <ZhV8a+pWAnJQ3Ljp@andrea>
References: <7b3646e0-667c-48e2-8f09-e493c43c30cb@paulmck-laptop>
 <20240408174944.907695-14-paulmck@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408174944.907695-14-paulmck@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_103603_869088_EAA8D20D 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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

Hi Paul,

> @@ -170,6 +171,9 @@
>  	__typeof__(*(ptr)) __ret;					\
>  	register unsigned int __rc;					\
>  	switch (size) {							\
> +	case 1:								\
> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
> +		break;							\
>  	case 4:								\
>  		__asm__ __volatile__ (					\
>  			"0:	lr.w %0, %2\n"				\
> @@ -214,6 +218,9 @@
>  	__typeof__(*(ptr)) __ret;					\
>  	register unsigned int __rc;					\
>  	switch (size) {							\
> +	case 1:								\
> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +		break;							\
>  	case 4:								\
>  		__asm__ __volatile__ (					\
>  			"0:	lr.w %0, %2\n"				\
> @@ -260,6 +267,9 @@
>  	__typeof__(*(ptr)) __ret;					\
>  	register unsigned int __rc;					\
>  	switch (size) {							\
> +	case 1:								\
> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +		break;							\
>  	case 4:								\
>  		__asm__ __volatile__ (					\
>  			RISCV_RELEASE_BARRIER				\
> @@ -306,6 +316,9 @@
>  	__typeof__(*(ptr)) __ret;					\
>  	register unsigned int __rc;					\
>  	switch (size) {							\
> +	case 1:								\
> +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +		break;							\
>  	case 4:								\
>  		__asm__ __volatile__ (					\
>  			"0:	lr.w %0, %2\n"				\

Seems the last three are missing uintptr_t casts?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
