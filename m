Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8840AC25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 22:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUsc5qOSZvhMMTxFurZVqwOfjAdve4LCWYLenBIKHiI=; b=mBk7i+7/Hjr971
	00r0qWtAFnM3OjMyQ5ZDgVBOSLiIofURZZf7LMXxxBng/P379D3PTFTDaFJ9yfo7VFX9LJq2mysyu
	gd3XTVwQ21IEefzDJWmIs5DsAGZADcC4NhcbtEhBJXfhnkldbhULBxhKWhmTO3slTOYNSmu2Gg9aW
	yNklRw06gFV4ZtV3tKW0uw1ubpQ08NsUYRzWRULxHYCNOaPMlZ0tKtua8ukC2s3cdq40YTQl6oGRr
	GuHmygnfjL/PCBJZSyvqVWb89OGrEBYw+4ZQyywkK0kyrVNAmsheWLtTuA4ssqmiLJVKYYk3XQL4C
	JcGOHH8+Ce6U2hzDJk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Ys0-00000006gVZ-1m7O;
	Fri, 10 May 2024 22:37:40 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Yrx-00000006gUN-3vwW
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 22:37:39 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so1715900a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 15:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715380657; x=1715985457; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N1oyif5LMXmv9cfSzvfL4iA3+1faWOlQLzQAOhWAAfQ=;
        b=o/oBL+LnJ2e9ikhMU3yXqInr1qfIRXHXv4TZb7rjm9T+Isnd+FvpVdKQ7zqfZZ49iz
         PeGdOMXJrp150t+VU6CO1qQ66nE+21lnYj4JmxjoLLLnE36gI/4z9VumkBiDl4uTGYeC
         tKa+IeXQu9OV+eVCZ1FQGeI80QDOF1VH5ci3TIOOr56QGKVKDxdZcLhupiHNNtaml9nv
         8BhwSMOZmqx3wPqXU2+BaVaS5JA+W7RCGvsn0B1s8n4z5TxZ1CVB6sIvQNj3rdbtfgX6
         zWYs6jKTo5fgnzqrbvrLuL9jEsK5pCaleTOvnKQm/MRaFZWmMyCmlNRyAKTWCMesIHQq
         Jj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715380657; x=1715985457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1oyif5LMXmv9cfSzvfL4iA3+1faWOlQLzQAOhWAAfQ=;
        b=A55tNZN0vjdFEcv4aDtfUIkOKCc+DS4vGJMlnWazfJALgCdDzqrTVWTZvudV5WKzSi
         /TQDBAa56QR+F8LXo6TmbmJh79xF1HOYYYLpeUONKKD7egqE9my6LK9MtwD6VnrP61B7
         R1M/m6SdStRgsZYM/K4KSgIVJSrWFZJKNSRSP/mdZC663w6Ltk3T3SG6icOteEAto206
         V2Xbl8n+A7Qvu/Nx7p66gbRuEZS5MYmgpHceqqxMg307f/nG7OGgl7EyUMmmndIZcnKF
         j3vppbK+M1U8mUaeFYIOTP2RaHhyib3EKYNOD53FdI3KUM9WbueJtmdxefoy2AVCSFH2
         wfTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJL8PC0Gpux+stbQ/Ep5d3dUSnEczVKy4iCv0PBtG5oTHe9hL61Lm46x7TD0IyxgPHoRx4nWYLy8BvPRHiNtONWvp7eOk7h73d+m6HQ+eR
X-Gm-Message-State: AOJu0YxMvYA4H6jD5rkGqoHz76ehq5ICANU4PTItwTu7Hl1Dj5VdXLLE
	3G3Co1FEgf3XfO9hJ074qN7IqXq/1N9HfTwublXkwoYnVlemz2SFhGxaDITZFZQ=
X-Google-Smtp-Source: AGHT+IF+cB/VeeNmDI2ko+dsDxMtMfecI39OIzLFhWWIUSbrZvt3Adce25QglCrrCpHnBQogkCEnLA==
X-Received: by 2002:a05:6a20:1053:b0:1a9:22cc:3ed4 with SMTP id adf61e73a8af0-1afde0a993fmr4462882637.6.1715380657060;
        Fri, 10 May 2024 15:37:37 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62886b72fsm5609203a91.31.2024.05.10.15.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 15:37:36 -0700 (PDT)
Date: Fri, 10 May 2024 15:37:32 -0700
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
Subject: Re: [PATCH v3 06/29] riscv: zicfiss / zicfilp extension csr and bit
 definitions
Message-ID: <Zj6hrE30e3yd0bf4@ghost>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-7-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403234054.2020347-7-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_153737_999158_42170928 
X-CRM114-Status: GOOD (  15.85  )
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

On Wed, Apr 03, 2024 at 04:34:54PM -0700, Deepak Gupta wrote:
> zicfiss and zicfilp extension gets enabled via b3 and b2 in *envcfg CSR.
> menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS
> while senvcfg controls enabling for U/VU mode.
> 
> zicfilp extension extends *status CSR to hold `expected landing pad` bit.
> A trap or interrupt can occur between an indirect jmp/call and target
> instr. `expected landing pad` bit from CPU is recorded into xstatus CSR so
> that when supervisor performs xret, `expected landing pad` state of CPU can
> be restored.
> 
> zicfiss adds one new CSR
> - CSR_SSP: CSR_SSP contains current shadow stack pointer.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index bbd2207adb39..3bb126d1c5ff 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -18,6 +18,15 @@
>  #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
>  #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
>  
> +/* zicfilp landing pad status bit */
> +#define SR_SPELP	_AC(0x00800000, UL)
> +#define SR_MPELP	_AC(0x020000000000, UL)
> +#ifdef CONFIG_RISCV_M_MODE
> +#define SR_ELP		SR_MPELP
> +#else
> +#define SR_ELP		SR_SPELP
> +#endif
> +
>  #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
>  #define SR_FS_OFF	_AC(0x00000000, UL)
>  #define SR_FS_INITIAL	_AC(0x00002000, UL)
> @@ -196,6 +205,8 @@
>  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
>  #define ENVCFG_CBZE			(_AC(1, UL) << 7)
>  #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
> +#define ENVCFG_LPE			(_AC(1, UL) << 2)
> +#define ENVCFG_SSE			(_AC(1, UL) << 3)
>  #define ENVCFG_CBIE_SHIFT		4
>  #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
>  #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
> @@ -216,6 +227,11 @@
>  #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
>  #define SMSTATEEN0_SSTATEEN0_SHIFT	63
>  #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
> +/*
> + * zicfiss user mode csr
> + * CSR_SSP holds current shadow stack pointer.
> + */
> +#define CSR_SSP                 0x011
>  
>  /* symbolic CSR names: */
>  #define CSR_CYCLE		0xc00
> -- 
> 2.43.2
> 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
