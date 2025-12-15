Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99467D5B16F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 13:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eHyGw6UnVMl6AO7AXjH23CL6NtgqY5SEu6BnBMdehc=; b=K/Oo4slacahElV
	M6XiQxUOkOOXxOpLwbK2/0bvNpxjQCFgsyUBb/Yew4nJm4dhKaqQZbY7dPq3c8SU+gNV/8SsTnwry
	k11JXZzDUNwj6t30JiVmZFXvBilei+srhGSR/A5l7Y7Zv7XRNbl2Iyv7XGXuQdJSjfs0ROKm+xjcU
	y0rpwoM06py7/lHi84QftAUWjXKHlFJXRlaWRy3R5Iqsp5G2cW+vkZcTyvcGsYE0QR4aCEkmtAzEo
	ZlNmcWpe4RkGSJy1n5aeSaWj22oNC2lWgAaXsbB+vBSWLCXLWduTBt+3emBk+GtiyqbiFUKdo4Ujn
	gFYpAdWRY5qs2cwJTXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8LL-00000003fu3-09QZ;
	Mon, 15 Dec 2025 13:10:27 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8LI-00000003ftO-2kcc
	for linux-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 13:10:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7b9387df58cso5160170b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Dec 2025 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765804224; x=1766409024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM/PVPr4BUoxQ98yubiOVvCOB+UxL8diHIpcrjRnF1s=;
        b=QhEyP70cbwUqwmeHaSSeB5+arEYAYv7ePUm4x3ygA9MybwxX0BPnEVHqZzqOAiDzUv
         zdtNCwSuYExeIqA3R2gzGpvBVBAGrYBfHFbtr9CeV66cSomasvskPA+eBxPesZwbGGqx
         noJ5PuviZZ1rF1UkHtPlhzUYHqjqnsCz3AX+NkPaXDT/HAowdNw7PIXZjH6y36kGYUPH
         6n49cGU/sT1/EFChbFsG1o0ScJGGHOQVbZQdkQMNkhS6c1LmaU/96tsxIly73mhzjWKh
         TUyjcK3ZKb5Rz3rvuZu5GRFVUTDOaQ5vDXimdeMSjPei7CUusO3KvepAlV0ER90PWCkV
         41qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765804224; x=1766409024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BM/PVPr4BUoxQ98yubiOVvCOB+UxL8diHIpcrjRnF1s=;
        b=ZTCo9lLd+P/xUtkTZhHyqDAj1ySrKGYdsiYiwtH0UJQA+zJlR+vn6oJdH78ZW8HCa7
         56WOxEcgG5FXivSh2YzV82C1YHNWTPcCd6lZpSmzBzFDrEcNVLGcUaIyrPer5OxyHMI4
         c1Zt8Mfspdbef3MLE5tR2G2UOr7nhxSFf6IzAtuZtU1Dp9mmGeH7rgeFZOeH23KoS/Oi
         vBCice4venCaEW/AzbaU2Jmjh2f3WQ81SIonPWzD1pBJeXmmhNdUlkgc1KgswLgICQ/3
         BAxVckslh9Kp+jt1hNVlXbZzZO1IaI5o8x3p5l/FIzXA/KV9d4P+jvUdf5UFHZw27sj1
         YdOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNFECHu+iyTbMM6tTCcaBQVRuYY1jkL9ZWgsYsnUoz9CKbIFm2GehMNiwPZzyI9ZrNQxczYV1h7xCHtA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Jh++7aqD9/cqn6tUHo1UBP+nT55Ws5JoWPhYy6KAx5uJEU9N
	RgIP/n5qKNVRtxZOYfkNt1+Y5KN6DpnmlLn9r24g2/5H4wPQ4lWzrff6
X-Gm-Gg: AY/fxX6M6vSVRdDUFlhnilpNecDEXLxkx4PgVyc8xAP/eV/L/T/3N5QJ2WOgwJZ6aZO
	4ttByeUxIT7mYWyKy/CnhX4acBHM6V8TmygPfiv54E8JRkiRRZPa0cpVbeJ/hIxoumawEAtXekl
	NDnL5i9vOa0GsPbasMUwwh1M2wMyktwsOKL0dLOUb6rhzS19M9LYXEYMwNN4OLAJfFJrW/GGlKy
	WTAfl4iBvPkIqMC9oELHpHFOCex/oXOKSIRhBpLB7wAwPhYcz2dR4itdPDufTE76y4u5cajui96
	Hb5ARg4wqHb8nRIlKjd39CRL0pKEtyQAPI54llSgzWc+kloQZsn6GLvweJ1kzL1c/gwCVY+ukAr
	jbzKlodWgbOGXwyYdQ5oE5mDZ+Ul8/PGwjPls0nVNbf5UneqcKL+ejx0eOuKdL1V0qUzAakUijt
	6x1w151j9repg9IPXLpAcZeGmqUNczejY=
X-Google-Smtp-Source: AGHT+IG3VwDpkA1WmQaMbo19+RTJgzIpgUIvYpPpKARDCY4wBFScDx5yKp0n9nH8m2HxqssodBKlAQ==
X-Received: by 2002:a05:6a00:b904:b0:7b9:d7c2:fdf6 with SMTP id d2e1a72fcca58-7f6679326b4mr10674588b3a.24.1765804223544;
        Mon, 15 Dec 2025 05:10:23 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm12761222b3a.3.2025.12.15.05.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 05:10:22 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	peterz@infradead.org,
	riel@surriel.com,
	segher@kernel.crashing.org,
	david@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	akpm@linux-foundation.org,
	acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	anshuman.khandual@arm.com,
	aou@eecs.berkeley.edu,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	irogers@google.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	justinstitt@google.com,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	svens@linux.ibm.com,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 0/3] Optimize code generation during context switching
Date: Mon, 15 Dec 2025 21:10:01 +0800
Message-ID: <20251215131001.1021-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251214190907.184793-1-qq570070308@gmail.com>
References: <20251214190907.184793-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_051024_702654_D14D19DC 
X-CRM114-Status: UNSURE (   7.40  )
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

There is some additional testing information that needs to be
supplemented:
1.
On Mon, 15 Dec 2025 03:09:04 +0800, Xie Yuanbin Wrote:
> 2. Testing config:
> x86-64: `make x86_64_defconfig` first, then menuconfig setting:
> CONFIG_HZ=100
> CONFIG_DEBUG_ENTRY=n
> CONFIG_X86_DEBUG_FPU=n
> CONFIG_EXPERT=y
> CONFIG_MODIFY_LDT_SYSCALL=n
> CONFIG_STACKPROTECTOR=n
> CONFIG_BLK_DEV_NVME=y (just for boot)
>
> arm64: `make defconfig` first, then menuconfig setting:
> CONFIG_KVM=n
> CONFIG_HZ=100
> CONFIG_SHADOW_CALL_STACK=y
>
> arm32: `make multi_v7_defconfig` first, then menuconfig setting:
> CONFIG_ARCH_OMAP2PLUS_TYPICAL=n
> CONFIG_HIGHMEM=n

The above is the config for performance test, when testing for size, the
config is: `make x86_64_defconfig` first, then menuconfig setting:
CONFIG_SCHED_CORE=y
CONFIG_NO_HZ_FULL=y
CONFIG_CC_OPTIMIZE_FOR_SIZE=y (optional)

Enable CONFIG_SCHED_CORE and CONFIG_NO_HZ_FULL to test the modified code.

2. When testing with Raspberry Pi 3b, in order to make the test result
stable, the CPU frequency should be fixed. In detail, setting in
config.txt:
```config.txt
arm_boost=0
core_freq_fixed=1
arm_freq=1200
gpu_freq=250
sdram_freq=400
arm_freq_min=1200
gpu_freq_min=250
sdram_freq_min=400
```

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
