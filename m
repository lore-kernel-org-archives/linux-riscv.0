Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C3BC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 18:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIMdUAMxHYscO1GsXuYPo4PAM13Dw4VxJkN9IWQ5y74=; b=21LX70k/++LDXq6t3unqSZP/5y
	Y8s2UEBaaJ5jmc6SOQ1grK5aNrD5w5JQO3CHFCbgMmB1xqfKBXZRNog/ntMWjJ805tSYz2OqUdNZ5
	lS/IHq0Vu6JuAdV6F7itK9qTOKYUSOg9SmSEXdcXb4UPZwgzWd5PT917ULpMfNb4xo6yGX8iAPMJ2
	/n3d3QONhnMSYDj/pLNtHYRR27KrQ+LoGI6PTRnxO8BBONqj/rGvfz5wgcr9cNTsLdEvLSUlcAUkw
	oG4k6627z+AjWe97SiTZhmNqd8SuG4+kPcuAbXsSVp0jz/P33m3mOaV0miGnJIix2K9mkw+MRy1KX
	CSpTCx1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6aUq-0000000Dsjy-3D0A;
	Mon, 13 May 2024 18:34:00 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6aUo-0000000Dsia-0d5o
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 18:33:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1eeabda8590so33557345ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 May 2024 11:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715625236; x=1716230036; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zIieT11BAyr5eCbucIfDMPYSpqd8uK7xxfWKvzozEyI=;
        b=SBe3c/k4e0NvbVdJ0tOIC0K9I8PiLAwnG3hhTGM3p0Yn6/e1n8UZT86TdTJq53+Ezf
         npevsMz9Bsf3L4HqWHwM3byhujznu7S7b92uF+EKCPn3jDjvxW33Ry4+zt5wlNHCvEol
         REJAoZ8TC42tK3PHjZ+HK1oVijNBHa/r6I82YRfEAWqMvoye0NfOPOUbK4VMiVYSsXHK
         WY8Xg16BfdKNFTnHz9DDc2JIzTxUVTbe1oesdGYL6mCVbcf1BIXy7WpPK3l6QofusPMW
         5wxKUhcizXC10IkXatEWEjAu3ONiEEjrei3IY77O4oLPmipvndXnvtsHTediZFnofD1q
         AthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715625236; x=1716230036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIieT11BAyr5eCbucIfDMPYSpqd8uK7xxfWKvzozEyI=;
        b=CBBdLpOIWNpxVME3tDQ1OfunuEl7Te0A/vYto5xIuslsXm82FQx60Z80pvodPUBrcK
         KNvs6RyiipxoxBlZzucv+v2KLPj+U5qfqP9z/jH6zf8NsDjumit5ZrhXg3v4Gyzhz7r5
         u2JD2vhqBXWWtebtPsgwD5w6iHzIykcye9SeTohbhgnmohLy+LPfUCrhLLQlKAw14m/y
         WI98U/0bZOV8VWBugVbdxc2htl7ucjYFmsHVnJ4W3wqQHlXz5aS7h3ArnDnulIWiGgJS
         wLYf2awUZbiLZ4OXbqjZfYxMBY05CKdwW38+5b7aff5tomQFmPARjHqocSCsofH/+PZl
         CYjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmWJbhzf6mFXT86pPmEihjuQaOLGYcHPCGi3krPrae/Uu6DQSAFfZ2rEZnBFkqPXyMmD+3B7+cRNpmMuchNKACyB6xpQrn0M4LQSpopVNJ
X-Gm-Message-State: AOJu0YxUYfQHutLxJU0RnYmrGm2Mn4wE8Lw1kLtXHygAP/BYywFW/iD/
	a8ZkE7Zq24rDRDiA4tEAlJB54WYjI5OMugxD9qFSDD4hfAtT6WzzX4pHvHBD4tw=
X-Google-Smtp-Source: AGHT+IFnbLXicXE+Y/UKuSVClJLtlfBWO7CdnrEkpjnDppDvuoBtNhLdA/briBDaFchoAw9tI2ob0A==
X-Received: by 2002:a17:902:f68e:b0:1e4:c07b:a8e0 with SMTP id d9443c01a7336-1ef441a76fcmr123301465ad.66.1715625235664;
        Mon, 13 May 2024 11:33:55 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf32b4dsm84209665ad.137.2024.05.13.11.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 11:33:55 -0700 (PDT)
Date: Mon, 13 May 2024 11:33:50 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
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
Message-ID: <ZkJdDnfjm+DMzgEa@debug.ba.rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-3-debug@rivosinc.com>
 <Zj6gwFvj2gA04NJq@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zj6gwFvj2gA04NJq@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_113358_221485_BFA450B0 
X-CRM114-Status: GOOD (  13.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 10, 2024 at 03:33:36PM -0700, Charlie Jenkins wrote:
>On Wed, Apr 03, 2024 at 04:34:50PM -0700, Deepak Gupta wrote:
>> Defines a base default value for envcfg per task. By default all tasks
>> should have cache zeroing capability. Any future base capabilities that
>> apply to all tasks can be turned on same way.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/csr.h | 2 ++
>>  arch/riscv/kernel/process.c  | 6 ++++++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>> index 2468c55933cd..bbd2207adb39 100644
>> --- a/arch/riscv/include/asm/csr.h
>> +++ b/arch/riscv/include/asm/csr.h
>> @@ -202,6 +202,8 @@
>>  #define ENVCFG_CBIE_FLUSH		_AC(0x1, UL)
>>  #define ENVCFG_CBIE_INV			_AC(0x3, UL)
>>  #define ENVCFG_FIOM			_AC(0x1, UL)
>> +/* by default all threads should be able to zero cache */
>> +#define ENVCFG_BASE			ENVCFG_CBZE
>>
>>  /* Smstateen bits */
>>  #define SMSTATEEN0_AIA_IMSIC_SHIFT	58
>> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>> index 92922dbd5b5c..d3109557f951 100644
>> --- a/arch/riscv/kernel/process.c
>> +++ b/arch/riscv/kernel/process.c
>> @@ -152,6 +152,12 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>>  	else
>>  		regs->status |= SR_UXL_64;
>>  #endif
>> +	/*
>> +	 * read current envcfg settings, AND it with base settings applicable
>> +	 * for all the tasks. Base settings should've been set up during CPU
>> +	 * bring up.
>> +	 */
>> +	current->thread_info.envcfg = csr_read(CSR_ENVCFG) & ENVCFG_BASE;
>
>This needs to be gated on xlinuxenvcfg.

You're right. This csr read should be gated on xlinuxenvcfg. Will fix it.

>
>- Charlie
>
>>  }
>>
>>  void flush_thread(void)
>> --
>> 2.43.2
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
