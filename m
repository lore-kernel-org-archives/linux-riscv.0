Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99853C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 23:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XT5wiIRln+ruWQerv/o6ImzAtHNrJQ9afj4jKLVJVNI=; b=x5Hpsrv+FKNXaC
	BAGe7br9Uvpa5Qsftyt05ZSBpmUqKwRFuiASyULXXVc9a2Pcd3wPDRB0yKCS6RMYAr8VAM9lc870t
	muOpgDuW00muCz8bGT8O2YGdgjYxtAXFZ6Z48lRMYEAHDdIejwF1gQ5SOZ5Sh3ZwgpAj9Yuaw4osn
	SHno/QLYSS/0oN5Yq1jOgavpqKjb0vhRm8Morj502X3XvBDrJrMVeCvzS+zJ1c9f7Lf2yQnYDnm11
	mBvVu58pimTnchMHE4hO/DiU4+jf+MK5f/eTPwlnzONjPeCGHh83xMI78wTObkohtbVXpHGhqja2W
	XhHnDma4/rWSfG2RAcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRKcW-00000008uo3-2oBg;
	Tue, 09 Jul 2024 23:51:40 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRKcT-00000008unC-17fE
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 23:51:39 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a7527afa23cso720210866b.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 16:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720569095; x=1721173895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nB80/jNPAo2TOKBslokBr5EVRDZovXrVO3U4Gd3724I=;
        b=h847v8BQvoo6u3NXnEciZRMT9+fYSAhxMo82xhX8hhNJyy/xTFYYgzYwcjwyjbOzj6
         Qc2XBR0+JHdU1A0yHbCAKdA9jQe8weKnbste4iGF4vvdjmTrTi4eY3Vtzirbx7Oz4mIu
         ZpJLdNHFzfVlXx2PYX5zZGzt+z8cl8PUbDm4+iCEEVebkiaCQqVQXFAy3gn/zwAvDsnk
         blBDrzyRfhogi4O4Se7BsFNUDqNtk8gpQqIHgFjnKWA1PzNXAYAuWc/UP6xNDk4U6o+K
         mdF396rO/RXGaC1EKSjUgJbVrnWgY5H/hePzmTC98NSJb3teiGNaLsjNyAZedOjN+CjS
         /5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720569095; x=1721173895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nB80/jNPAo2TOKBslokBr5EVRDZovXrVO3U4Gd3724I=;
        b=W3x0s+bevuhzyKKYDy9lse7zUdRXXKFiU1ibeP/9lyl10eIQoj7SlZ0nK2VXiUzTej
         HNInss8AihRGsBsrKiyCZoHI4l1YQkSEWGkvFpmR3mcrgFDA6f4db9G6T2iTRVGuosr3
         FWR5qzQAd/uDt4dlQsaMP4/AhBpu9CBtJd30nGxGF44lJ8YE2tmKSbAr7ZrmSL2709T2
         +NFKyRX867Vjb+eKKs1FMIiBFifAATEUtM1h8+n9T6wBJ2qIqHY3uDXWEYXKx+q+BGpr
         6K6Apc0d2seQG6lipMzwAh2SNfPXCwmcvPxD82Xl+yjXqth7JJxL3XpFJB/AcMAy5ITl
         0J+w==
X-Forwarded-Encrypted: i=1; AJvYcCVMNHBS89mDlxewQgW05NwmbPNI7k8kRhGPnN0ww3gyKqbg3XPZk57wio2MTQlnSW+40H7X1lCoQGbUR+mJ/0KygsDAfpwmqENa9Q4+wB0H
X-Gm-Message-State: AOJu0Yx/gfH9XqUeH9GC8ynAzSKTj7nx6qj365gPAPSlUyvh0SGQBSpV
	AMJQZthr24q2Y0GPz3ywoSbtc/lWYR/6X7DC0JnU8v4mGrSajm1C
X-Google-Smtp-Source: AGHT+IERo/xgDrSK200bxqmR2c3Sm004d5DwR5IVGhXm6Nz9ihnXROLaZHmA+7eaORxPCJKinnytmw==
X-Received: by 2002:a17:907:7e9c:b0:a6f:e3cf:2b8e with SMTP id a640c23a62f3a-a780b89dd3bmr375371966b.76.1720569095026;
        Tue, 09 Jul 2024 16:51:35 -0700 (PDT)
Received: from andrea ([84.242.162.60])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a7fef9dsm115320266b.99.2024.07.09.16.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 16:51:34 -0700 (PDT)
Date: Wed, 10 Jul 2024 01:51:32 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 03/10] riscv: Implement cmpxchg8/16() using Zabha
Message-ID: <Zo3NBHUEMMec/6uD@andrea>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-4-alexghiti@rivosinc.com>
 <Zn1StcN3H0r/eHjh@andrea>
 <1cd452af-58cd-468c-9bb6-90f67711d0b0@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cd452af-58cd-468c-9bb6-90f67711d0b0@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_165137_327064_A7A29B8F 
X-CRM114-Status: GOOD (  12.55  )
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

> > I admit that I found this all quite difficult to read; IIUC, this is
> > missing an IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) check.
> 
> I'm not sure we need the zacas check here, since we could use a toolchain
> that supports zabha but not zacas, run this on a zabha/zacas platform and it
> would work.

One specific set-up I was concerned about is as follows:

  1) hardware implements both zabha and zacas
  2) toolchain supports both zabha and zacas
  3) CONFIG_RISCV_ISA_ZABHA=y and CONFIG_RISCV_ISA_ZACAS=n

Since CONFIG_RISCV_ISA_ZABHA=y, the first asm goto will get executed
and, since the hardware implements zacas, that will result in a nop.
Then the second asm goto will get executed and, since the hardware
implements zabha, it will result in the j zabha.  In conclusion, the
amocas instruction following the zabha: label will get executed, thus
violating (the semantics of) CONFIG_RISCV_ISA_ZACAS=n.  IIUC, the diff
I've posted previously in this thread shared a similar limitation/bug.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
