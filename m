Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E30C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 22:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OswibWmdNTdpSWqIYKikccaeqPBdM5FZFXn0gQbx/nM=; b=W7xJXecMNr0hyL
	TOV8K8KI32SklKxUSB3JoVpGYUBZO7kEt1/TV7H3z3FiPm5RYSTmANl448XcDntSKr+SxRCqrtCuW
	ZycRmya+lnJ6QuFNQbTkGWArfCXD5vft+WphfAwqcS8WnPEkoqmXcz4k+F+Bu0UkkbhvXcmZZ17Fc
	4pQmVhMymxUGYGeR8JpalPbKB+iybXU/gIUg/rBQlnmDBxFJRcnj+1IFxJ2gx4rCxS5SbYUwVZeT5
	koON44IF8i4mwjo1Nfc+tMRNZr51xd5ltOR3bBKN6aRrnra9nodB+GEHZ4xxZBxQUzR1jRe6+wnWP
	5P5G83j4ZFih0G4SPsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5YrO-00000006gJE-1T2l;
	Fri, 10 May 2024 22:37:02 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5YrJ-00000006gHX-3evG
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 22:37:00 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6f44390e328so2377472b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 15:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715380615; x=1715985415; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zS7lCbzZkns2fdQ69wn4m037nt1gQxHyRlvOKblzJbQ=;
        b=HADizMis9eh8TyuFS0GjzfM4rmaBhj+PBY6mifite/wtqDaMqxF6sKJ1g8s+Cm8Y5X
         aUJnN+0zQ1GgpRa6f2m38+eQ0E2oVnwbuWk8mD18UGaaNenZyNYPhf5+rrI+r7/bxhGD
         ix3I6F+lTbPW3+dZpd7SgYGG6eyglW/dC9hUkD5rlCFgHkruw+wJcvOki0ErUjsH3pwq
         3UVZh8wNK/OjwZ3PIjDOUbmdcn7JhBKoWRDW3X9EvIbsauC4XWd9q3c4WcSGl+l8PzJA
         Il6tw41BFZTu+nHivNcze099fMuJsMY5sI6PMOD6gH7W9UtYYoS9j0+jjWE3dxm+BApC
         lT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715380615; x=1715985415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS7lCbzZkns2fdQ69wn4m037nt1gQxHyRlvOKblzJbQ=;
        b=kU9xJNF9LKwVEBzSbA6VXAtpoahP9tcwYDtLt9iRdp03Qr7PiiRgI+relscs+6X1Ud
         8Ql8WaitcB0Jih891UrNWsdhkU/ceQ/T+F4tJXKbu7D61x+oG1UJWIgBL86hSIFcK7Pu
         HEq3L7CPfR24zQZgQRabOpmT1OwTt5+BToU592ky4G4jZFPmxKYaooT0z1nHgXSSYGhC
         0v8U7uyBLwh6DmouaYMwHOYbvAiTngxeNxrarDpUG6E4Vapu6OpsfCTihdi5bT1WmU5p
         UPGCkEu0nUSxf5Nnqp9DiFv9Jcp2T9jo6+K3MROwJ132RuX0bDh6R09ZFeIkXdheHms6
         BW9w==
X-Forwarded-Encrypted: i=1; AJvYcCXi3vW2PApIM0WfnbN2YrjPXknUuP8E/wStPNbhna0u3K6UrgUtbEDD+QgdY/Duyg8suV6HTM8w4QFMHt12hbGXwxi3Y4TELUQjNqF8sEdo
X-Gm-Message-State: AOJu0YzQJrUbgKjlpHvHWqNr0KyAkyPn/xuEbQkzr60MRdG+COntuMDr
	hlgZm12o/ePz/rCuv8GS11SiJ/2mNk1mNHTFdXRXvmYRRVbbomq5yZ3BGr+vkQs=
X-Google-Smtp-Source: AGHT+IECyJ3HLUBNJc9MInaH+TnpeoZ9uVPxr9owDU+2eCIW7wv4pKs78C2KGMvMq9oXNwmWHlzw3Q==
X-Received: by 2002:a05:6a20:3206:b0:1aa:5a22:5eca with SMTP id adf61e73a8af0-1afde0ecc61mr4558503637.31.1715380615067;
        Fri, 10 May 2024 15:36:55 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a83d3dsm3438933b3a.65.2024.05.10.15.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 15:36:54 -0700 (PDT)
Date: Fri, 10 May 2024 15:36:50 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: paul.walmsley@sifive.com, rick.p.edgecombe@intel.com,
	broonie@kernel.org, Szabolcs.Nagy@arm.com, kito.cheng@sifive.com,
	keescook@chromium.org, ajones@ventanamicro.com,
	conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, samuel.holland@sifive.com, conor@kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, corbet@lwn.net, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	apatel@ventanamicro.com, mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com, sameo@rivosinc.com,
	shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 03/29] riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
Message-ID: <Zj6hgrXzuxFdr3sl@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-4-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403234054.2020347-4-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_153658_189824_CDC7DF85 
X-CRM114-Status: GOOD (  14.89  )
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

On Wed, Apr 03, 2024 at 04:34:51PM -0700, Deepak Gupta wrote:
> riscv will need an implementation for exit_thread to clean up shadow stack
> when thread exits. If current thread had shadow stack enabled, shadow
> stack is allocated by default for any new thread.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/Kconfig          | 1 +
>  arch/riscv/kernel/process.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e3142ce531a0..7e0b2bcc388f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -149,6 +149,7 @@ config RISCV
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
> +	select HAVE_EXIT_THREAD
>  	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index d3109557f951..ce577cdc2af3 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -200,6 +200,11 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
>  	return 0;
>  }
>  
> +void exit_thread(struct task_struct *tsk)
> +{
> +
> +}
> +
>  int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  {
>  	unsigned long clone_flags = args->flags;
> -- 
> 2.43.2
> 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
