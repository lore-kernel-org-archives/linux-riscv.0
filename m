Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939CAC3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 09:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj95xlZzp1SBAar2gMv34Lca/syTFfUeneXMR0FR988=; b=TY4h2zld/GH9Ge
	xIFYMd8NxVtqYHjA8cf63oRyzR5qHQDxnu6RrjD0cSn92ruVXC96fcXP+prdNx43MVcfIP64MdS3P
	wbzh8Ns7gEEWqvcuW/jTY+6i3RDiwahsDQf751sLDG/FxA3hg/pU5aE6GYZxO6ELXV3V69YTKEvXf
	pbr+rNlgifePZhMAVyTTBUbJlCZ4gV6KBF4Sol9OyuQ1bJ6vlvYZsKV1ccCsgj/Pqyp3+dqEXlhQg
	hibxXFLgWGZcuSOu6gQgkE/41ZHhfXl2dKFG7N2mLDdmwzJL+W/dzJoQWULtN8gho5++jXD9hTKLI
	j7zcmDK6Q/pdB62n9PHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrpr-000000034Hn-3bbo;
	Fri, 16 May 2025 09:58:35 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrnz-000000033w1-03r2
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 09:56:40 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so3581272a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 02:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747389397; x=1747994197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti4ZqP+Hl0JDcB2DFZd59wj7uwh2SBcukM1irTJ/QT8=;
        b=YIRQEk3OKTMn5R1eGEIYEm69RGCQ1/mpFnAUupyclnLffIa0hCeDgbEKtR7/5WuoyA
         EPUqS/xpNeZWtnv33cD3Sm9wnc6fAQqvwM6/7j8YXl73mvvQXc0NCUIkjF8yzvz4VHvO
         TsEUEgNiRNHEVuiJz9mtL0mdGZGKmoD1dl5jRTyqJQH86+ZojFclY+3wlyCAjj1i65iZ
         lbIjCcKHkUBDDBb1t21CvDtjNvlWp4qR0c8s7xUAxfXY5A6BmYiaBYzi3VHcBWK8ggEv
         f+Ow4LOrZFEsliq5Dc6iuHREeV7tHHufUPRp44pwA2luQo+5CimUM0OLRoZ/igzmymnq
         r+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389397; x=1747994197;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ti4ZqP+Hl0JDcB2DFZd59wj7uwh2SBcukM1irTJ/QT8=;
        b=iRfoEzKaN9wfG03vNHFg+zdWFS68EDXosj2k+ff2p5ngfv7uRcO7tPYNW4GmvSV0UB
         AgEsks7PkZxBhMysEy4TJsb2EPiF1alcgbLIMlD8PbVwIuSSPxCP7UNPu7wN7aD3ya+E
         nMGCK8ISkyp9EnQjW6XEN/pRUMFJ9oayMI0V8mi4TwX+oho6qYXh2bBuFvml4naPMoGk
         Dnqyr/GTja12PupwTDC8pJF0T5IysCuaETaNMjTHEfPju+CNkW5vAxpGkVOxEgLJnC/E
         S9yrQ6m4L1gtmNBk1pVYoBMHbvjzIyzm0STfIasJIAQJeRhTFXt9xCnV97YEjCkTaYPg
         yoOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkPe2ykrH4skvx6Dt7d1aaScGftI0DTyhwqw102/s8qoG8gQiC/igv3vUV6dK47BZJ6WYY3zkEs1GwIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrEtvfY0BQcZkp0KH6ra0meUDxDXtI3TbNupyY7bkbZHp1JgCh
	/SVswQKo8ku63CWxv2dvIsKRW+lleKo8ws7zlQLEXIgBt0lsp9Y1HowPNPXIO66Ne402xdClq5p
	rmK/0tYkarw==
X-Gm-Gg: ASbGnct5AEW54rM7fR1NWzGBRugWxwlRK340HTTmzlWfxGvIhNM3Zp4y5kg1BbL2GKx
	A+I0xlac0UsVTW9YXFQ/5bQidMCNGOgfkLUFRWJSvTMj1fpzcPKrxh1gGnEu2DuE+HB0pQTPhC/
	yknflMZmxJW4fWVFc6k1tJfTBkuJuQOUMW+buU/N0/I4n97baaHutus8hBcJIljbjAlyHDJMZ+K
	ifaZyd475NwmE7gdHAaW0EgB6RPrELOu1LAlUcU3N37/2scsoJkYjWJRffv8lFqGnYKZOg5lp+R
	jyT2gjwrM70QshTHsKTYMxDkZ5pWD8qWtDipKh+OZ8g+pSwVBBQeNaxPiKd+4wIhAow2
X-Google-Smtp-Source: AGHT+IFh2zAJl1Uj5Dr32GIK/RqZ9T0owi1RiR8KLA1E0llsHrNCCqszm3h/QZEbyvFvfkdXsmjKfg==
X-Received: by 2002:a17:907:9624:b0:ad2:4da6:f573 with SMTP id a640c23a62f3a-ad52d5ba810mr300923366b.41.1747389396719;
        Fri, 16 May 2025 02:56:36 -0700 (PDT)
Received: from ?IPv6:::1? ([2a00:11b1:101e:447e:2959:9e3d:ac05:c19d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d490789sm127955866b.130.2025.05.16.02.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:56:36 -0700 (PDT)
Date: Fri, 16 May 2025 11:56:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
CC: kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] RISC-V: KVM: Remove scounteren initialization
In-Reply-To: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
References: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com>
Message-ID: <C74B29B0-FB1F-4E67-AFDF-FAD7C86FB329@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_025639_044307_CA3F38BD 
X-CRM114-Status: UNSURE (   9.89  )
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

On May 16, 2025 1:11:18 AM GMT+02:00, Atish Patra <atishp@rivosinc.com> wrote:
>Scounteren CSR controls the direct access the hpmcounters and cycle/
>instret/time from the userspace. It's the supervisor's responsibility
>to set it up correctly for it's user space. They hypervisor doesn't
>need to decide the policy on behalf of the supervisor.
>
>Signed-off-by: Atish Patra <atishp@rivosinc.com>
>---
>Changes in v3:
>- Removed the redundant declaration 
>- Link to v2: https://lore.kernel.org/r/20250515-fix_scounteren_vs-v2-1-1fd8dc0693e8@rivosinc.com
>
>Changes in v2:
>- Remove the scounteren initialization instead of just setting the TM bit. 
>- Link to v1: https://lore.kernel.org/r/20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com
>---
> arch/riscv/kvm/vcpu.c | 4 ----
> 1 file changed, 4 deletions(-)
>
>diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
>index 60d684c76c58..9bfaae9a11ea 100644
>--- a/arch/riscv/kvm/vcpu.c
>+++ b/arch/riscv/kvm/vcpu.c
>@@ -111,7 +111,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> {
> 	int rc;
> 	struct kvm_cpu_context *cntx;
>-	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
> 
> 	spin_lock_init(&vcpu->arch.mp_state_lock);
> 
>@@ -146,9 +145,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> 	if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
> 		return -ENOMEM;
> 
>-	/* By default, make CY, TM, and IR counters accessible in VU mode */
>-	reset_csr->scounteren = 0x7;
>-
> 	/* Setup VCPU timer */
> 	kvm_riscv_vcpu_timer_init(vcpu);
> 
>
>---
>base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
>change-id: 20250513-fix_scounteren_vs-fdd86255c7b7
>--
>Regards,
>Atish patra
>
>

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
