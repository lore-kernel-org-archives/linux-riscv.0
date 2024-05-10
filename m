Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05464C25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 22:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umGLElI3Oy3OkPU2dH/E4+RbWJkBDt9gPoY28WRDmGA=; b=Zw7Tgw94J8D7QX
	vRvVU2Y8pT/ocrqETkJhQ79joQHiijOcFXpzsWUWmYfhnHq+0KPjOGMU3qbOFen7KmCH24EizUMHR
	ER+yBmnGuThPZEZduMqhyr4dyBk/Tfl1TRjmYw/aT/e74Hb4oY9e6vB9Z4k7jI6trYuY8K0ERChRS
	7qvwemowrFZWVUWCu3p1CEYwgti7WRPYIvDBX/oB8drWi3VoLWdn00dpiTMPc0zBjZodf4ZNkzN4L
	au2PC3qlg9Y2qj9sIy4NTaeHbkoeLzLFM3ZZ2OV4aw4SwsdKBhrUsB/cyjOysvVAMgH0MNdq2RomR
	iul6LjPsg7L0OT/MWtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5YoF-00000006flP-2JZI;
	Fri, 10 May 2024 22:33:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5YoB-00000006fkV-2YWN
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 22:33:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1ee42b97b32so21345195ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 15:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715380421; x=1715985221; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx86BKf20oqqJvvyTkwVjgHBFBglkui4kaaauK5EOTw=;
        b=rPbqkdmvU4F0khTh8nSLwYotygm1xiOAO6AzlNRVlf5TZ17quXKKSNMlPWY6HCKDC3
         W0dxT9T56SqPZkaw2nQkCb0ymIEsoREKp3xaM6vMQjkyQnWagChSf4/L7YLjrlXkNKuM
         Lpi0h3geQ8/kzvYJRz4wbincLCCnObLCKTPBYTV++JAba25pUmnLwB+lTbXirAsVyrnz
         g93hxAVKSrgNlcvXIVbpCRmhugH/3cQIedkHUniv8uwYNiNdBMydn5ATbpAgDHZ2F3PX
         1BobMlvVEBKPSnbcER/ymSZQ2UW6x2MI3E8B/nv3Qz1/qGkM082T8lJBGWcrgBOjDZdY
         USdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715380421; x=1715985221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx86BKf20oqqJvvyTkwVjgHBFBglkui4kaaauK5EOTw=;
        b=oGgjZoJZjKKPJ6NkhFaAoSr0kA4s0lZlYx9KWrgdNYz+ZP60od0s38Tx0/TF9tLDUE
         gU6hyxYFxgtPcPOYk4KBInnzFKRxN56BRJXjWMFp27AdN5s8BzooHdiiSg26Uy730wDZ
         I2aGYMECDgP/CY5uXvBmwWwhGUwxlTClEnqw2qlTcc5bMAAL6OlGdI/aXMP1MoUSnoih
         ldZ25qpNhOtu7hjXLA1VMT95ltALxHcnSFiTfVd7C6LVwXAn3qqkKqFGFiB2VBg4lX7U
         1sDKxKx8WsIwhvLFobx2H7L0xrqUoCW9KJfAbD33TRcnmcM+vwolmBqArnJBhSPm1zdC
         C4dA==
X-Forwarded-Encrypted: i=1; AJvYcCVoBmWgVGCtak4MJQUrmeY1+sBNu3I4iEX4RkKMux4h2l/F/dF5YoZ9mejPJDHBS10M4nutjI4PKTNPIY0OgF+DUx6+8rTQYmOQTQCgQfa3
X-Gm-Message-State: AOJu0Yyw4U3r8PtY46zOXRnKmdYRSdMGb6cNXQJpd2mXlBUxfSLQb4Wg
	PYtHFP8Tzkc7O+wrQS9p11k1GmNTDOkMtWIPMkGr7cmkEtizqzMhZh9Ej5W6Z0Y=
X-Google-Smtp-Source: AGHT+IHCbIPqYj/CMVX+dpcmx2/ThEVPaXPHBWvK+JEhPYkGjzop6fsJUs8nt4PjI1Rtz6v88FXlIQ==
X-Received: by 2002:a17:902:d483:b0:1eb:57cb:4c69 with SMTP id d9443c01a7336-1ef43f4d1ebmr53974765ad.45.1715380420958;
        Fri, 10 May 2024 15:33:40 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c16093fsm37221825ad.281.2024.05.10.15.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 15:33:40 -0700 (PDT)
Date: Fri, 10 May 2024 15:33:36 -0700
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
Subject: Re: [PATCH v3 02/29] riscv: define default value for envcfg for task
Message-ID: <Zj6gwFvj2gA04NJq@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-3-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403234054.2020347-3-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_153343_709473_0C237F29 
X-CRM114-Status: GOOD (  16.80  )
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

On Wed, Apr 03, 2024 at 04:34:50PM -0700, Deepak Gupta wrote:
> Defines a base default value for envcfg per task. By default all tasks
> should have cache zeroing capability. Any future base capabilities that
> apply to all tasks can be turned on same way.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 2 ++
>  arch/riscv/kernel/process.c  | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 2468c55933cd..bbd2207adb39 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -202,6 +202,8 @@
>  #define ENVCFG_CBIE_FLUSH		_AC(0x1, UL)
>  #define ENVCFG_CBIE_INV			_AC(0x3, UL)
>  #define ENVCFG_FIOM			_AC(0x1, UL)
> +/* by default all threads should be able to zero cache */
> +#define ENVCFG_BASE			ENVCFG_CBZE
>  
>  /* Smstateen bits */
>  #define SMSTATEEN0_AIA_IMSIC_SHIFT	58
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 92922dbd5b5c..d3109557f951 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -152,6 +152,12 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>  	else
>  		regs->status |= SR_UXL_64;
>  #endif
> +	/*
> +	 * read current envcfg settings, AND it with base settings applicable
> +	 * for all the tasks. Base settings should've been set up during CPU
> +	 * bring up.
> +	 */
> +	current->thread_info.envcfg = csr_read(CSR_ENVCFG) & ENVCFG_BASE;

This needs to be gated on xlinuxenvcfg.

- Charlie

>  }
>  
>  void flush_thread(void)
> -- 
> 2.43.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
