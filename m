Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56253C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxCLfZ+Wd3IimyRBLrgkqmXoBVbfpA7352/ey2qjTaw=; b=uPXawOZYQRDHmj
	V1mbBOe3Lj8tl11EXm6VEsRpTeoP1df0yMb2XFouihYBMbu4WLlQkN2Yd/UtMQhN1yQGe0gxNBlAV
	GLQ6rWb6bfavL2XJsSsAmLn3GteRbRGbCQPH8XTdvr6xi0qOEdVX1bA/Z4dIYaXwH1PEkCFsMyzeo
	Rzjoy54qTvMccNOpMAyGkhj8V5Nbzm2lDmeA6YYNw0t5tqPojk+ojvmRr3UDijmXD2pfhaDchLH3f
	xh3kBoUwmfIyVlQhn0d4qUXmKGtvZzXdn2VWsAFJmixn6WPeJsbjGjPHtwxZFTsz/zrAy53+RFvU8
	C9X07eR0AnZUagQBWGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSQC-00000004dxm-27A0;
	Thu, 01 Aug 2024 09:48:32 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSQ9-00000004dwx-1IQO
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 09:48:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a7ab76558a9so332083266b.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722505707; x=1723110507; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BDG653oQy+GL48j0SxqopLPxRNvx49Ogi7ORA8x2yNw=;
        b=jl9kzSzbTdHqtk5fYAI0Ckaw7wyevZwtBdqEsyy3bsHmamVvm0JYdkom1w04LwfaMT
         Kvsl0gl69hBJpTsgQf7KHbZvVIBqpuC9zyVbjVz57aXiV8oZHA4CbWJtHhcCzZn7HYIN
         Q0EQHHOc0sYfoqPwlOzMJbrMASuqg6ytBF4msuwRkMSG3Zbk29rd6NsTlMKIwhhiJqOx
         9FGhhWTUENR+54qOYxrNzNZT7JkabHmPDzP3ldz2HRvVQeAASTqpr3grXBIbBqbj2kGK
         ahmCRLNxnz7CvRf1zuQSRzXhhA1J/0O0Cfdg6epz0o7MDPEEAv9Rz0Z1KjBSVNyQv7GX
         JhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722505707; x=1723110507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDG653oQy+GL48j0SxqopLPxRNvx49Ogi7ORA8x2yNw=;
        b=fsLVCtKOoP+TKtXOLrF/85WW88G7zDPyXxj+djSIldwwlpA6LFK4KhMNWK1s8Jb1ki
         yKACj1sBPn3Q2MlkSTH5HWpqcv4YVRsOxrwVKkHyrsv3UedKjq0XLwiB97hlxwwWwHFu
         G8WWybQzhIEKSNG5q8Ss2GbsR0MAGXTXPTf5ecehJoN0E9zn0G69WgFtiAkNMwN3lpc+
         Uc9WlJXR+ZtRTWUlDsYNdKqqKuze9+zQU+rVYASHp6xJK+++ze0TTLbAB/5/FbfEUBOF
         i9n9QcmhrrDfbr2GAnlsEY+C3PTxU6rcW+ZVU0GNtet4nRhJsK1f9W+T0tc0Dbmpk0fu
         1bnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRvRMLfFNWoE9oBYWVZj5W+RV1VfV0XyXt1auhyQwh3Z2IiSMVS3SYciGQWk94b7KRhlosjwS7IJfOqDOAAugde1Ldy5gyaN5t7iYzzAQ1
X-Gm-Message-State: AOJu0Yy0Br4lAaE9BjOciv42evGuDq8EB/1gfIBdMAjjbrC6hJN3Pu5a
	G9ZS2MuxbB5v11UqtuRzZY4nLIdCRASRKTd7wqenVrwV0KzyL4fo
X-Google-Smtp-Source: AGHT+IF3lwwawnwTWt8F/aGq/kCA5hNUzo/KaoRrwwZ2TsMiC/6Rwj5bGNPTZcyTVgVZH5sX8BBxwA==
X-Received: by 2002:a17:907:980e:b0:a7a:c7f3:580d with SMTP id a640c23a62f3a-a7dbccac77dmr72577866b.25.1722505706707;
        Thu, 01 Aug 2024 02:48:26 -0700 (PDT)
Received: from andrea ([151.76.3.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad414e2sm874500666b.127.2024.08.01.02.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:48:26 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:48:21 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 13/13] riscv: Add qspinlock support
Message-ID: <ZqtZ5V3ejYG6yscm@andrea>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-14-alexghiti@rivosinc.com>
 <20240731-ce25dcdc5ce9ccc6c82912c0@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731-ce25dcdc5ce9ccc6c82912c0@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_024829_374944_2D3F1C99 
X-CRM114-Status: GOOD (  19.66  )
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

> > +	select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS
> 
> Why do we need this? Also, we presumably would prefer not to have it
> when we end up using ticket spinlocks when combo spinlocks is selected.
> Is there no way to avoid it?

Probably not what you had in mind but we should be able to drop the full
barriers in the ticket-lock implementation, deferring/confining them to
RCU code; this way no separate treatment would be needed for either lock:

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c9ff8081efc1a..d37afe3bb20cb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -79,7 +79,7 @@ config RISCV
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
-	select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS
+	select ARCH_WEAK_RELEASE_ACQUIRE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
 	select CLINT_TIMER if RISCV_M_MODE
diff --git a/include/asm-generic/ticket_spinlock.h b/include/asm-generic/ticket_spinlock.h
index 325779970d8a0..47522640e5e39 100644
--- a/include/asm-generic/ticket_spinlock.h
+++ b/include/asm-generic/ticket_spinlock.h
@@ -13,10 +13,8 @@
  * about this. If your architecture cannot do this you might be better off with
  * a test-and-set.
  *
- * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
- * uses atomic_fetch_add() which is RCsc to create an RCsc hot path, along with
- * a full fence after the spin to upgrade the otherwise-RCpc
- * atomic_cond_read_acquire().
+ * It further assumes atomic_*_release() + atomic_*_acquire() is RCtso, where
+ * regular code only expects atomic_t to be RCpc.
  *
  * The implementation uses smp_cond_load_acquire() to spin, so if the
  * architecture has WFE like instructions to sleep instead of poll for word
@@ -32,22 +30,13 @@
 
 static __always_inline void ticket_spin_lock(arch_spinlock_t *lock)
 {
-	u32 val = atomic_fetch_add(1<<16, &lock->val);
+	u32 val = atomic_fetch_add_acquire(1<<16, &lock->val);
 	u16 ticket = val >> 16;
 
 	if (ticket == (u16)val)
 		return;
 
-	/*
-	 * atomic_cond_read_acquire() is RCpc, but rather than defining a
-	 * custom cond_read_rcsc() here we just emit a full fence.  We only
-	 * need the prior reads before subsequent writes ordering from
-	 * smb_mb(), but as atomic_cond_read_acquire() just emits reads and we
-	 * have no outstanding writes due to the atomic_fetch_add() the extra
-	 * orderings are free.
-	 */
 	atomic_cond_read_acquire(&lock->val, ticket == (u16)VAL);
-	smp_mb();
 }
 
 static __always_inline bool ticket_spin_trylock(arch_spinlock_t *lock)
@@ -57,7 +46,7 @@ static __always_inline bool ticket_spin_trylock(arch_spinlock_t *lock)
 	if ((old >> 16) != (old & 0xffff))
 		return false;
 
-	return atomic_try_cmpxchg(&lock->val, &old, old + (1<<16)); /* SC, for RCsc */
+	return atomic_try_cmpxchg_acquire(&lock->val, &old, old + (1<<16));
 }
 
 static __always_inline void ticket_spin_unlock(arch_spinlock_t *lock)

https://lore.kernel.org/lkml/ZlnyKclZOQdrJTtU@andrea/ provides additional
context.

But enough presumably,  ;-)  How do the above changes look in your tests?
other suggestions?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
