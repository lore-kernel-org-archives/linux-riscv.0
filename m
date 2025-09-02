Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2F7CA0FFE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 05:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXVsQXky2KP8+OX5dUD74o1e0dZeY7Ce8V/K0LL3koE=; b=QJ9N8jKnWtJq+2
	3FXdlR8SG5PIenFFCkSkCEVFrN8N+uI2G/0ZZOFP63mmdpG9OfKWKO6UY9XQlWlBAHDqhf//TyKDp
	ycew0Vif5B+wKjvYbuiZpUynYXkBGnq6bS0Pq2peu4ksxzL3nZb2BaqXhFjApiIeotq57azxC3ZXa
	64mjm2aMBymt++r9F6qqf3IDT2DQGNvW4O2WU6u2tRGB6vzg8skywRl/U80iAm2GZuRY/c7aqTw/9
	2aKnHLct4f2HqZ1sie1EjOuNh9dT7AgGT9HDKvdi84sZaWAkUwteno7Gy1JQK38q+IR14sQdkXCMI
	6ULk0ZaPgSDoV+/1ZGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utJLP-0000000FI26-1VYR;
	Tue, 02 Sep 2025 05:14:11 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utJLM-0000000FI1M-1Nuv
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 05:14:09 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b4c9a6d3fc7so2788357a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 22:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756790047; x=1757394847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbpx4ScsQnybdTO3kp2Rfx+rkLjFhStVTs6nr7auk/0=;
        b=FRCdIWGMvtCDdwF47ek4NjRXlaItR0InNUM7F4tbNNOKUXuNaqnjSLtWhTkMKl4FmR
         hKnSbYwMjWAw6/NTenBTcR8ujxrlJApZJLGIwZ54Lyt/V930avHZTUuMSuFguWv77rEK
         CmS6jNf4raacUA8SyKWccNdHHEk8Q1o8iYh1FJqtkRxylOYWEs+sFNOPNki+P9NIo0pQ
         XeEStrLNoMGsF6KRjGwi9xe6VyracM21VOGQYCSUyOKZwAfduF7+G/ryD/MxlzcDce4u
         8R+f/Xo1IQV2bq4lucxGQ2oGo9sElBOf/6Sq4yPIBnmWHe9vqSoV3d1dNrel+4INexxS
         DJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756790047; x=1757394847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbpx4ScsQnybdTO3kp2Rfx+rkLjFhStVTs6nr7auk/0=;
        b=v7/loYTzLqRgNBK03BsZkgYFCQpCnWo0IqCZIyqdOpegKUrEaCAMbQ5as25Mr8JKKm
         lpCmMX7EYAwGRRv1lpO6+j+EbKWhAR88bsEuBOCvP4C+unrSJzO6H/CDzce3t/qfHpiI
         WtfGUn9QG6bQkZu0T4v2kkfLNzUX6C0oAJQarcDEogKoIt7AvE39uDzgWz6z9VgNFfPU
         sUe57bVjPWyWBRiaI4MOS2hSexag0diKmYXye+HYrZ3BwjuY5PkmA7qXLv2LkKxgGbmQ
         Qoc78WMFYCZzw40Iv8W1OJojaElLjYNlODq6vOXbcB/piRnQN76onvEcy5XrptZeJ846
         7/QA==
X-Forwarded-Encrypted: i=1; AJvYcCUQs+KnzB/Dqd/fUCVRpSJPGipE4qYckOxEEPuEWzZ/71zRKN29hUpa7CJyyq+gwnBdKKtu4UFg4Y9hlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGpFaLZ3Cj8NJNVrodKv2lmGipmLPs/o/E18D853pj+BVOW8+J
	Ep200K9Bq1TrS1k07QLcOKFXT86sHzHureak5H5KN1wsdaWx8JAculno
X-Gm-Gg: ASbGncsSnubn56R6V8ngFsItw4wR3lD8SxjMjINjXWHO14jtbOebCYpoxSbDgAAe8e4
	HFBDkay9RivqOEbzA2mNt9+83g9oupVw1n6cGFtPoLDNwjuyYhnPCkxgZ5ZragYizZaS5ZsBxF2
	MU9Ui/prf0CdzDbicctB44NtkDXb745XRoW1jinh2MfTw8xuYSaVowOBw5a1DTBXPMh20U9ZhbF
	6Gu7Wq+7TUwk2re7Qqncc09AwvRWMz0cU55k+GWNcS33ExqpyoAvWGv0CIKFekytOi76SuG4mG2
	xTazy7YP1aiz9gQGzQNxfB3biA88/FHKFWJGHQyknJVRKzCb9kwwjQNYLIr3GgfQYrpfhTXOSii
	1fKIaeIYfjx5YKI0=
X-Google-Smtp-Source: AGHT+IFuHo6l2ig5Wjql4h2AooDEhFl0y/v3XlO3IRwDflHdbmC2N/qlZXzQe6jvCKxQiC2fHzN2PQ==
X-Received: by 2002:a17:902:c950:b0:24b:1585:6363 with SMTP id d9443c01a7336-24b158565c2mr11578025ad.8.1756790047255;
        Mon, 01 Sep 2025 22:14:07 -0700 (PDT)
Received: from gmail.com ([223.166.87.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da479asm117731845ad.73.2025.09.01.22.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 22:14:06 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Jesse Taube <jesse@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Nylon Chen <nylon.chen@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 4/8] riscv: Introduce support for hardware break/watchpoints
Date: Tue,  2 Sep 2025 13:13:12 +0800
Message-ID: <20250822174715.1269138-5-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822174715.1269138-5-jesse@rivosinc.com>
References: <20250822174715.1269138-1-jesse@rivosinc.com> <20250822174715.1269138-5-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_221408_370879_13078DB1 
X-CRM114-Status: GOOD (  13.39  )
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
Message-ID: <20250902051312._y2w5xTYZZbJG8-xQH5-XpNCMGxFfisAIeBqp7efGN0@z>

Hi Jesse and Charlie,

On Fri, 22 Aug 2025 10:47:11 -0700, Jesse Taube <jesse@rivosinc.com> wrote:
> +static int arch_smp_setup_sbi_shmem(unsigned int cpu)
> +{
> +	union sbi_dbtr_shmem_entry *dbtr_shmem;
> +	unsigned long shmem_pa;
> +	struct sbiret ret;
> +	int rc;
> +
> +	dbtr_shmem = per_cpu_ptr(&sbi_dbtr_shmem, cpu);
> +	if (!dbtr_shmem) {
> +		pr_err("Invalid per-cpu shared memory for debug triggers\n");
> +		return -ENODEV;
> +	}
> +
> +	shmem_pa = virt_to_phys(dbtr_shmem);
> +
> +	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
> +			SBI_SHMEM_LO(shmem_pa), SBI_SHMEM_HI(shmem_pa), 0, 0, 0, 0);
> +	if (ret.error) {
> +		pr_warn("%s: failed to setup shared memory. error: %ld\n", __func__, ret.error);
> +		return sbi_err_map_linux_errno(ret.error);
> +	}
> +
> +	pr_debug("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
> +
> +	return rc;

rc is uninitialized.
You may remove the variable and just return 0 here.

> +}

Regards,
Qingfang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
