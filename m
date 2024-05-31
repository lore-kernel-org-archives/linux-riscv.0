Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0D1C25B7E
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftSE47L4uoHxu+dZ5LZFKQJn5t4fYibiOdF9TqDMOiA=; b=zk/+7IuS6cO+/0
	IQVcPD7m/3uRN0gZ2YVoTRiIGNoNyAvmaed0jlmm9iCEShA5pR3da+wpQhgIpb0gsKILnxxOMt+A9
	WBQZgGkeiiF4Qw61vHe+Uj7rcyRdBqpcm8/zoPxq89e+5kfm7PMrCxk0FF0E96KinAigZt0Cm9j6X
	YMQHHhNTgdxz/Zig8Uw3s0MeYIDBRJuGQLcM68bu+a2PVUDn61syde24UsCiep1iVfXDxIrtxVZh8
	AZlSATB+D0HHQvNt2iDaI2auGeSQJaBDZNIPRbJLUrpAY+PAzcGLr2tg8RgSWxuAYCCvBo8eOjBlw
	ifezCu0dVEWuCeOCFFqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4YL-0000000Ajyy-3MZk;
	Fri, 31 May 2024 15:52:25 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4YG-0000000Ajvp-31kk
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 15:52:23 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5785eab8d5dso2543620a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 08:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717170735; x=1717775535; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B1+QjxjxBPrIugYD0OZnRQMiPTgmwtCBI97ys8OyOiU=;
        b=kGRV2nvM6wlEmGQlb/XPHr+Hb3yDG+Z3tzxsOb/KBxbOyfLuzNLQzVoESEw52RlQ1g
         loeCw+Fvz7hhk+m9SjnJFC9ade0pWo63RdLehUqOEeVH0TzCfaczFC4BAH6d+xVQUSJ6
         OioLoc8O90r84l8kZM42zvsZ+L7LVr2vYYFSlr/nKwBW3V1WOp5t9ReaHncBVS1A8m5N
         Fg/+6PLDVSxMKdWdFWoJ0XvZL5iGXIJ00efQ21YkXTrtnzAEBSCILtOyU0SN00ttufeb
         pzz9gFnshkIBmE2xaLHYmOKPUkaklgJR9B8MF2sKMlrOegj0Ziez+eksEXmG4KbyxWXf
         PiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717170735; x=1717775535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1+QjxjxBPrIugYD0OZnRQMiPTgmwtCBI97ys8OyOiU=;
        b=BGGSdiTCstAVtPsAhEvdNlR5dk2Ip/8tvIe1QTGnCMHqTSKozO2mPoZ36INepLWO3V
         2Hkb+jmdFYu6OI15IVLMXkFWfmAyc+u+nTR0esUx7wwo0REaUWB0ymTaYdrAUtz0DkqM
         gBbU+iNL/aQnjZ9eBiGSRHHZN7BtCiVWp3eA74eCTZkB76xUDQmbN4H1X2+JXqdl4t+U
         d1m9BfpWPkGcc3NBJ8ahWTdZHdDMpJHpEkmup4Dkf/wLYlA6x+FRYAFlcy1T8yTLsX2n
         Tf5PrMLw/77/M1dx8Oi0D9qKclnZjkr4BHewvPa+CWI1jjgwgyYlERbZpPMYimD4J9wc
         W0Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUHsp84Lj+tnFOMvp+sXxyQoO1kalxwOFrhi6NIJwXjQgOMyO5w4iZi4XvxQlyBy3re3piblx58M8ftPOkA9puARQCWOhKdtdD8iSBtQ9FP
X-Gm-Message-State: AOJu0Yz7oJqn7cWgE1ue+lXBK5PjjITBiyEvimk4zI4A1QvzG+2fjvC+
	WPHUEwgef7JnrtQaPQyRgDXY6dy184ykCgufPlx4/hFMgOppRtRW
X-Google-Smtp-Source: AGHT+IGbfRp1452zzCRnB9sJc29htGrbuzhsS6g6C0EBQQxO8KLQ7fkvTbV09Id0Zo9VJiu87sACYg==
X-Received: by 2002:a50:d4d2:0:b0:56e:99e:1fac with SMTP id 4fb4d7f45d1cf-57a365a0b9cmr1818306a12.39.1717170734692;
        Fri, 31 May 2024 08:52:14 -0700 (PDT)
Received: from andrea ([151.76.32.59])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31b98e01sm1135963a12.16.2024.05.31.08.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 08:52:14 -0700 (PDT)
Date: Fri, 31 May 2024 17:52:09 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 7/7] riscv: Add qspinlock support based on Zabha extension
Message-ID: <ZlnyKclZOQdrJTtU@andrea>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-8-alexghiti@rivosinc.com>
 <ZlZ8/Nv3QS99AgY9@andrea>
 <39a9b28c-2792-45ce-a8c6-1703cab0f2de@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39a9b28c-2792-45ce-a8c6-1703cab0f2de@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_085220_872851_3F8F5184 
X-CRM114-Status: GOOD (  14.68  )
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

> > > +	select ARCH_USE_QUEUED_SPINLOCKS if TOOLCHAIN_HAS_ZABHA
> > IIUC, we should make sure qspinlocks run with ARCH_WEAK_RELEASE_ACQUIRE,
> > perhaps a similar select for the latter?  (not a kconfig expert)
> 
> 
> Where did you see this dependency? And if that is really a dependency of
> qspinlocks, shouldn't this be under CONFIG_QUEUED_SPINLOCKS? (not a Kconfig
> expert too).

The comment on smp_mb__after_unlock_lock() in include/linux/rcupdate.h
(the barrier is currently only used by the RCU subsystem) recalls:

  /*
   * Place this after a lock-acquisition primitive to guarantee that
   * an UNLOCK+LOCK pair acts as a full barrier.  This guarantee applies
   * if the UNLOCK and LOCK are executed by the same CPU or if the
   * UNLOCK and LOCK operate on the same lock variable.
   */
  #ifdef CONFIG_ARCH_WEAK_RELEASE_ACQUIRE
  #define smp_mb__after_unlock_lock()	smp_mb()  /* Full ordering for lock. */
  #else /* #ifdef CONFIG_ARCH_WEAK_RELEASE_ACQUIRE */
  #define smp_mb__after_unlock_lock()	do { } while (0)
  #endif /* #else #ifdef CONFIG_ARCH_WEAK_RELEASE_ACQUIRE */

Architectures whose UNLOCK+LOCK implementation does not (already) meet
the required "full barrier" ordering property (currently, only powerpc)
can overwrite the "default"/common #define for this barrier (NOP) and
meet the ordering by opting in for ARCH_WEAK_RELEASE_ACQUIRE.

The (current) "generic" ticket lock implementation provides "the full
barrier" in its LOCK operations (hence in part. in UNLOCK+LOCK), cf.

  arch_spin_trylock() -> atomic_try_cmpxchg()
  arch_spin_lock() -> atomic_fetch_add()
                   -> atomic_cond_read_acquire(); smp_mb()

but the "UNLOCK+LOCK pairs act as a full barrier" property doesn't hold
true for riscv (and powerpc) when switching over to queued spinlocks.
OTOH, I see no particular reason for other "users" of queued spinlocks
(notably, x86 and arm64) for selecting ARCH_WEAK_RELEASE_ACQUIRE.

But does this address your concern?  Let me know if I misunderstood it.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
