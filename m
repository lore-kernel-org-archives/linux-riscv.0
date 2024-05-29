Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBC7C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 00:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+3YrII1wVzYMVuEjejO08CkS0G1gaLkuQf40pFrRKI=; b=IvI43B/rMRuzur
	Fq+r8nHURP8h76/TCO0oap60h4Yd2VjBoBEq1GCJfd3FUndSXjkUWnlVbotaWDvJKVXSsfbp6vghP
	QGqIxXqsyFYq0hIz4bdif/1sLE0Zi+Qc8pAQIPnl9c9u4sKZOaySoa5wQ8uwSdEEqcT7Xyjqm06Ui
	IpdUkW3hdrrapuo11tvR4yhRQy7f7++wIg82h3eLgRreB7ha3IaRiuDMF61ojVdJr8fsfEKnKfIbD
	6KXz20kRODKX7LEmB4Q5mUEAxcFv8ldzGJYFPlWtIRXPK62MDH/YfV67RHFdnx1kLUfqEhp7cznv9
	3xKh8BbVo0RI+D1WqndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC7bO-00000002SIN-10KE;
	Wed, 29 May 2024 00:55:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC7bM-00000002SFv-1LG8
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 00:55:37 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-354de97586cso1779134f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 17:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716944130; x=1717548930; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2bC53XzM+uy8PiLd8YOyk6YbyRBUin82pX9N2ZdNewo=;
        b=Rc1GbAktfb3FJQAexn/cVuSHpvFJ+uXZ6AvzmgX71bbCTQvusDRtWgCZShs/R5ZArk
         vhcVvuWOJksU2ajWOXCizNI7uY1xFoAQge5NKtBDwT7AwBQ0SaUN/x2m9a/d237GKTjK
         2oSVUbChZL4P3v5BUpqobvEU6trNuj6V7iFk7dkuFhXJnrts1lE9/UFbGyFg2j76Rhdd
         g54aeKNDTjBM6Z+UfaQbu1+l581zVtK8VuEvZ0NHXR6oM+C+XCgyj4EklWwowRYucc7q
         HLyeNNU5BmsB+blvivrCI0pnqE00FtHBr6/wWqJWBeZ0BxW6jEvaQjphhJazrI6U2lD9
         U1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716944130; x=1717548930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bC53XzM+uy8PiLd8YOyk6YbyRBUin82pX9N2ZdNewo=;
        b=SweVrWbHIWSM/YxmkmkNSXGRDJrlMddDGRFvZmma9t3wts9axGc/c0B6+B25QH3s5z
         XN+SVFKYh7S9brHVuDIPUuln123OitAkrBREJTcCzZNe4qNQ64NrQuXpzXTtSHi1YpFx
         F5bL4sYVKktAmVE5pEdSRz1FBGps/tEiux1Yvl+rd+aaF0DNZXUJbDAue0a+zLg0PPlp
         D1kN6/9S/0uUkk4zg+6uAdW53C0rNZba07uCl6I1YPF3S7nzDPK+VBPIRWE1Fn6fbMDI
         7ZymwnGRJvcCCvPdhQqRVRwUejGR03qqSgxiwCqdbut7kDpUoUTOyuOS8ZpqY2scs7Iy
         im+A==
X-Forwarded-Encrypted: i=1; AJvYcCWggyt0l613ABOJYkxJnScIwzyLGXmQFljaAX3dU5PGDb//etn6cDwtQ3CzhxOCruCf28OmW20u688vh07sWlvoTr0JStWf6KpREZJij8Zy
X-Gm-Message-State: AOJu0YylrYuBUMlb+ozmZ9EsCrQ6oK9WZr2qshLbQWZyBcXgqf/1pD0u
	cFY6xhrOR2waqqgKVj1vpI79LrrHVjrpQeJ1NB0dzuf98usBSj64
X-Google-Smtp-Source: AGHT+IEvUEkslbEuJ36n5fUNNcqqyx4kLtZsPYT6w2lhIJyJzqT2Uw+KYtCXxmqNpjL+xf8GkG/5cA==
X-Received: by 2002:a5d:4f04:0:b0:351:c7c7:985f with SMTP id ffacd0b85a97d-3552fe19145mr9586169f8f.53.1716944129495;
        Tue, 28 May 2024 17:55:29 -0700 (PDT)
Received: from andrea ([151.76.32.59])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6328c97eeesm175282766b.111.2024.05.28.17.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 17:55:29 -0700 (PDT)
Date: Wed, 29 May 2024 02:55:24 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
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
Message-ID: <ZlZ8/Nv3QS99AgY9@andrea>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-8-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240528151052.313031-8-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_175536_416367_6EC177A0 
X-CRM114-Status: UNSURE (   7.47  )
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

> +	select ARCH_USE_QUEUED_SPINLOCKS if TOOLCHAIN_HAS_ZABHA

IIUC, we should make sure qspinlocks run with ARCH_WEAK_RELEASE_ACQUIRE,
perhaps a similar select for the latter?  (not a kconfig expert)

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
