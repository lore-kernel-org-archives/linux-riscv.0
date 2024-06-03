Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5916C25B74
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 00:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huvqYN6KrrBGfWPV6s35Z0yZY9DLOmfZ+2eX9Z2Zchk=; b=ggJg0FL4hOfMW8
	9tHjfK+yI9sada2kR8SzF3rz97aaaqiwczyp2TtUt/odgWqRHZLxU8S4KGljdq/2AfgxbS5juqv1a
	4mWCFSd6jLReuFcigF4inOQRlkz6t4qcpzJxTKqH4N/GlKoVIVG6s05SmB/Va6HBUiAbArdU+ees6
	oxsqkBeyZwH9KCoFX5lWEl1z3bNOaL8SGqNEAoL2dqMtrJI058V5OvNSAeiZYuyPHNieRJ82+XIul
	9E0M5tfV582FhbAjnWzBdbwA+Gf+kash85OQZo5cO7p+6aR23GiKVrIugQ7inMcgAXf0eqTjTXE6e
	wcAjtmim+eDYfpPU/NEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDvlo-0000000FC92-3yua;
	Mon, 03 Jun 2024 00:41:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDvlj-0000000FC83-37Ns
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 00:41:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4211245e889so33735835e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 02 Jun 2024 17:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717375302; x=1717980102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B1o/b1gFrtS3NBgE2MlOGvvhrWq5km+KT0/u0XHiWDI=;
        b=YGlxPKFRcadcLnL8TPYDmqg//wSikk2FVDTZPn4dhywGYTuiGE83yXvINz3/GGAhkT
         yBnPKs+U0FWBKvrlUxz1b8K7S7tUTwsWCHVLhuNzjuc7tanSKriGb1A29OLoLcZ+LGHR
         aLT+B0hbkAPEITvaRXSfcgcwqX7EHWOY01Bnc2iA48GdQ95ytZGZQD2y9ctSlLxahk3/
         oknH8GfXFHza0kNtQmLlwcatLbQmYfU22IDH2SYZOKkHWrgRK2IkHWJUhQwWb3HJRhRM
         F0SbSKXNvCu/JMLMueyi4Jnv9HOjSMBmPXtdhlgtUr63+Gr5nEI57exXdGW5PJz8Ubzw
         E+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717375302; x=1717980102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1o/b1gFrtS3NBgE2MlOGvvhrWq5km+KT0/u0XHiWDI=;
        b=tQWFhcACJWCL0/7PnPM8P/NxabIKQF7w8X1MTwFHFZ0UWAtODHjEXittnVzeOXS0Bs
         AXKufYiFG0v0lmCdFIOQ5oSJouOEOwAqfOUqz49YBMZlEB7DcXYNrS2UK+PPbyBV1/q4
         y3Hx8JXDDo7XrmxRm34RYzSnMXlu5h0VEUgcZZto/fMgnAmk5RdHSmCaiMtX7GSsXjHi
         AFN/rrC2JTa8Z5rG0ukTtY70yXLoa5TH9F3cCMrVjHmKHEj/IEt7OHP/7CFzVdhaDOKK
         8Tw4V8gzW+F6XGg3MrgRIn7uRsEk516iDBC291yH6AF92om4x2RYwTuMhsUXLquhJbss
         DvEg==
X-Forwarded-Encrypted: i=1; AJvYcCXmjv203gikEh7DI81q5IWtFEyOBw5H7pSh9yxv/gEOiLcPC4CzYJ25DHTox5IN9ilGuNkcxTzkWgtMYuYIlDfrDPomlHAnEvOz0Sap2MoV
X-Gm-Message-State: AOJu0YxrHty/IqdzTsX2Dx/EtA1AQpYvgDEXrSuB1+peoN0eWDNNCn3S
	es/918yONYabVxW+yr1GHdkGrUOSh2TrRFwBP2nrMMezkKdAkbqN
X-Google-Smtp-Source: AGHT+IEKrFrvzelrpkV0lRgOFsb/p9GOQothVXAMqoQBPMn/xGvWBpPzq+U2wvFWRQYF+WD1KvBpmQ==
X-Received: by 2002:a05:600c:8a7:b0:41b:e4dd:e320 with SMTP id 5b1f17b1804b1-4212e09b9camr55984695e9.26.1717375302255;
        Sun, 02 Jun 2024 17:41:42 -0700 (PDT)
Received: from andrea ([151.76.32.59])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a6522d405sm470024a12.1.2024.06.02.17.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 17:41:41 -0700 (PDT)
Date: Mon, 3 Jun 2024 02:41:36 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 7/7] riscv: Add qspinlock support based on Zabha extension
Message-ID: <Zl0RQC4br7KoaGlC@andrea>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-8-alexghiti@rivosinc.com>
 <ZlZ8/Nv3QS99AgY9@andrea>
 <39a9b28c-2792-45ce-a8c6-1703cab0f2de@ghiti.fr>
 <ZlnyKclZOQdrJTtU@andrea>
 <CAJF2gTTz2H5McxgsrEcMeCNMnchS6sr3vRn53J=FWk_6HPoP6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTz2H5McxgsrEcMeCNMnchS6sr3vRn53J=FWk_6HPoP6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240602_174147_810691_3C1FA1B9 
X-CRM114-Status: GOOD (  10.39  )
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

> I looked at the riscv-unprivileged ppo section, seems RISC-V .rl ->
> .aq has RCsc annotations.
> ref:
> Explicit Synchronization
>  5. has an acquire annotation
>  6. has a release annotation
>  7. a and b both have RCsc annotations
> 
> And for qspinlock:
> unlock:
>         smp_store_release(&lock->locked, 0);
> 
> lock:
>         if (likely(atomic_try_cmpxchg_acquire(&lock->val, &val, _Q_LOCKED_VAL)))
> 
> If the hardware has Store-Release and CAS instructions, they all obey
> Explicit Synchronization rules. Then RISC-V "UNLOCK+LOCK" pairs act as
> a full barrier, right?

Presuming you were thinking at CAS.aq (based on your previous remarks
above), that all seems right to me.  In fact, the (putative) Store.rl
and an LR.aq would also do it (by the same/mentioned rules).

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
