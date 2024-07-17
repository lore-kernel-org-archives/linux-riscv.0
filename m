Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B58C3DA60
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rpy+4cKc+87Dsgod/EKbHWXLIrYRnIDrqcM69UyTfoU=; b=m1/juRc+ZT0J6l
	SwfqEH0mMo7z8uh2RkBTnWZHDvnGo6l3pyFIbtUNtsSLU87hl32Io2TVvLo+EsKrlu1bj6TtZKoqD
	M+NY7IV6GpCdbQnxnEwys+9t+exyuwk1qz+ct7fhryXeNJijTv7hhEv3PcV9TrhsKH4wTkDzdN/Qs
	RCgZHI5ESEDeQrv+51wrp5AjbXfOfR2YkUn1imuHQtutXvNSO9MNi0KS6qVodrkl0wv70u1u5f0Pg
	HqRf3QaUS1NCFfG2jTC6FY6R8rM8BgEEC3sq9BnYRaNWdU/yhiXpPlkb22Omzz3NvKlqZvw7dx2lm
	70A+OINXPMJ3xE5ih/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7XB-0000000EM2X-04YP;
	Wed, 17 Jul 2024 16:29:41 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU7Wl-0000000ELw6-1SRn
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 16:29:39 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5a156557029so92483a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 09:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721233753; x=1721838553; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pnyhXHGX9J34to8BXWeIBkKgNznQFH+294/77VN85Ck=;
        b=NTnifWXt4t0NubRPi3ScFOYGUoN1ZdtLVt/EplaahF38y/70UdwZgfARfOy1XGY5/I
         esUk/pkjxITwI92PVaJKc5+5OAvrCe3RdzKE4m0RhVU1G45uMsAA2uHNgndYmClIu8x0
         fJRiDTX0RvD77a50CCfBVGTUgG/O4Spy3HZ1wFEC1iSRLgij0O/KrlN4/H8gsKiH/R60
         ZhdF+kQ2feBYBOQsu3NfoUgne8nYR00jj6EGNlDC0wIcTLs5x4CAotah0g34a4fHqj42
         0W9ivRT+LN3t0HXtFzJbZcSjR0sn4NczXXtibCErrgmUqzZUikQQmMteDTyYb6l8+cnN
         rxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721233753; x=1721838553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnyhXHGX9J34to8BXWeIBkKgNznQFH+294/77VN85Ck=;
        b=N6xx32U1Fz39aIGCxERFKtI6+tkpkDDFZYIRLQSxRDCCE+cZn/ecIn+ZRqgQrKwy0f
         M5X1/r1oAoo7Ouon7qoiNf1etY3wHntOvzp+y4YlPgANwijP8iTFh7GRpqVs/kAQZNEv
         t5/ugYf137ybQGkDfKR/o0bUtdaDAXLCScpAexvIjPgKn1TPb5SjNvySzGQ7RLjzPvts
         0ucDt3QD2E8+RP4k3uCRKK+YMCCXbCqjIbjpPsoZUi3Tcwy9S/uCwCZ0mxPqB/Aq1/i5
         SmJeGeY5iZOQe6LaYd3cYSVpRpFCjEF1Bm51VhPD/XOEqVMLyk309+WWwG2YBw/FxSFf
         EcJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCHpvJHU4hBDDoMT/KBQ7wn1+DHP+hXJtDmHYHv9SFX0fB6pWitIftl5jHD0UPx/DCaQgB6qrmYTD8WPMV0JuHGiU/hIXsIbgWRlGyKz96
X-Gm-Message-State: AOJu0YxyhijRKhIOubyG6AV9nIGA+1QCipL27JVVSjdbag4QNqZsHdWd
	9AX6Hi2v2nR5KOymbu8XBP1NIxFkJD8CLnyjMHs6XQ6waLNSvSxT
X-Google-Smtp-Source: AGHT+IEiGOScEB11q2BazGjrBsyNU9lXDX/xWG9npgJidiQaGTVMjkHKOuzXX42R4QAigL+Etd3Dew==
X-Received: by 2002:a50:d593:0:b0:58c:6edf:d5d2 with SMTP id 4fb4d7f45d1cf-5a05bad527fmr1578661a12.15.1721233752500;
        Wed, 17 Jul 2024 09:29:12 -0700 (PDT)
Received: from andrea ([84.242.162.60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b255253absm7201108a12.42.2024.07.17.09.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 09:29:10 -0700 (PDT)
Date: Wed, 17 Jul 2024 18:29:06 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 11/11] riscv: Add qspinlock support
Message-ID: <ZpfxUvIx+0ClOqCc@andrea>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-12-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240717061957.140712-12-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_092915_413335_CB38832A 
X-CRM114-Status: GOOD (  14.25  )
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

> +config RISCV_QUEUED_SPINLOCKS

I'm seeing the following warnings with CONFIG_RISCV_QUEUED_SPINLOCKS=y:

In file included from ./arch/riscv/include/generated/asm/qspinlock.h:1,
                 from kernel/locking/qspinlock.c:24:
./include/asm-generic/qspinlock.h:144:9: warning: "arch_spin_is_locked" redefined
  144 | #define arch_spin_is_locked(l)          queued_spin_is_locked(l)
      |         ^~~~~~~~~~~~~~~~~~~
In file included from ./arch/riscv/include/generated/asm/ticket_spinlock.h:1,
                 from ./arch/riscv/include/asm/spinlock.h:33,
                 from ./include/linux/spinlock.h:95,
                 from ./include/linux/sched.h:2142,
                 from ./include/linux/percpu.h:13,
                 from kernel/locking/qspinlock.c:19:
./include/asm-generic/ticket_spinlock.h:97:9: note: this is the location of the previous definition
   97 | #define arch_spin_is_locked(l)          ticket_spin_is_locked(l)
      |         ^~~~~~~~~~~~~~~~~~~
./include/asm-generic/qspinlock.h:145:9: warning: "arch_spin_is_contended" redefined
  145 | #define arch_spin_is_contended(l)       queued_spin_is_contended(l)
      |         ^~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/ticket_spinlock.h:98:9: note: this is the location of the previous definition
   98 | #define arch_spin_is_contended(l)       ticket_spin_is_contended(l)
      |         ^~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/qspinlock.h:146:9: warning: "arch_spin_value_unlocked" redefined
  146 | #define arch_spin_value_unlocked(l)     queued_spin_value_unlocked(l)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/ticket_spinlock.h:99:9: note: this is the location of the previous definition
   99 | #define arch_spin_value_unlocked(l)     ticket_spin_value_unlocked(l)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/qspinlock.h:147:9: warning: "arch_spin_lock" redefined
  147 | #define arch_spin_lock(l)               queued_spin_lock(l)
      |         ^~~~~~~~~~~~~~
./include/asm-generic/ticket_spinlock.h:100:9: note: this is the location of the previous definition
  100 | #define arch_spin_lock(l)               ticket_spin_lock(l)
      |         ^~~~~~~~~~~~~~
./include/asm-generic/qspinlock.h:148:9: warning: "arch_spin_trylock" redefined
  148 | #define arch_spin_trylock(l)            queued_spin_trylock(l)
      |         ^~~~~~~~~~~~~~~~~
./include/asm-generic/ticket_spinlock.h:101:9: note: this is the location of the previous definition
  101 | #define arch_spin_trylock(l)            ticket_spin_trylock(l)
      |         ^~~~~~~~~~~~~~~~~
./include/asm-generic/qspinlock.h:149:9: warning: "arch_spin_unlock" redefined
  149 | #define arch_spin_unlock(l)             queued_spin_unlock(l)
      |         ^~~~~~~~~~~~~~~~
./include/asm-generic/ticket_spinlock.h:102:9: note: this is the location of the previous definition
  102 | #define arch_spin_unlock(l)             ticket_spin_unlock(l)


The following diff resolves them for me (please double check):

diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
index 4856d50006f28..2d59f56a9e2d1 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -30,7 +30,11 @@ SPINLOCK_BASE_DECLARE(value_unlocked, int, arch_spinlock_t)
 
 #else
 
+#if defined(CONFIG_RISCV_TICKET_SPINLOCKS)
 #include <asm/ticket_spinlock.h>
+#elif defined(CONFIG_RISCV_QUEUED_SPINLOCKS)
+#include <asm/qspinlock.h>
+#endif
 
 #endif


> +DEFINE_STATIC_KEY_TRUE(qspinlock_key);
> +EXPORT_SYMBOL(qspinlock_key);
> +
> +static void __init riscv_spinlock_init(void)
> +{
> +	char *using_ext;
> +
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&
> +	    IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {
> +		using_ext = "using Zabha";
> +
> +		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0, RISCV_ISA_EXT_ZACAS, 1)
> +			 : : : : no_zacas);
> +		asm goto(ALTERNATIVE("nop", "j %[qspinlock]", 0, RISCV_ISA_EXT_ZABHA, 1)
> +			 : : : : qspinlock);
> +	}
> +
> +no_zacas:
> +	using_ext = "using Ziccrse";
> +	asm goto(ALTERNATIVE("nop", "j %[qspinlock]", 0,
> +			     RISCV_ISA_EXT_ZICCRSE, 1)
> +		 : : : : qspinlock);
> +
> +	static_branch_disable(&qspinlock_key);
> +	pr_info("Ticket spinlock: enabled\n");
> +
> +	return;
> +
> +qspinlock:
> +	pr_info("Queued spinlock %s: enabled\n", using_ext);
> +}
> +

Your commit message suggests that riscv_spinlock_init() doesn't need to
do anything if CONFIG_RISCV_COMBO_SPINLOCKS=n:

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d7c31c9b8ead2..b2be1b0b700d2 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -244,6 +244,7 @@ static void __init parse_dtb(void)
 #endif
 }
 
+#if defined(CONFIG_RISCV_COMBO_SPINLOCKS)
 DEFINE_STATIC_KEY_TRUE(qspinlock_key);
 EXPORT_SYMBOL(qspinlock_key);
 
@@ -275,6 +276,11 @@ static void __init riscv_spinlock_init(void)
 qspinlock:
 	pr_info("Queued spinlock %s: enabled\n", using_ext);
 }
+#else
+static void __init riscv_spinlock_init(void)
+{
+}
+#endif
 
 extern void __init init_rt_signal_env(void);


Makes sense?  What am I missing?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
