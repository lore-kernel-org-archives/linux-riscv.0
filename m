Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5F0C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 13:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0cudqIq7zBZAaSACBdmKaNl1jfIXDWxMKehhM3IIn6I=; b=fVrgm3w2aBQypg
	pTQvYfpCHF3ZxQ96vVxJGCwgCZ/VYrYyGXMFrGH+e1NG7nz7om9m1Km/1sxH4B4vJxaeqoWewMtFg
	pY8DPS3d/yluNtW4FYsMknBJE9lROPiVcyWaiav1MFLMQTRGgq39xtDbOocjN6Dvw6rdCx7FjfRAm
	KoO1tYmzk5k4FYWp5d6bu8gIb99ALeFbJ5se4G1lnn2ZybMQtiZTGERlaTk/1xOn1hiXL+pROfIvn
	tvgs3/MmSCivm6aXrogIo+iFohUCr+35MJ7LWlvcBvx8vcoR5LUNlLAuR6ESMm47LL8YCZnLvTjcW
	4h0qY/EoowMPdKcb/Usg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMQv-00000008ULL-0Rfr;
	Mon, 15 Apr 2024 13:31:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMQp-00000008UI8-0yiC
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 13:31:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4187d5f08c2so1960675e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713187893; x=1713792693; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KE+Cpvnrr9PFeeWoK6ioKoV8XULExBLcSObfZiwRf6E=;
        b=AzLcR8YrFzjK6Os5wrhrLX6ehrDZv9MoMhu9e8xl7UZaF1PogfCwxh0L/EtEnjqZi/
         bA3WbY4cZ0IGhYHWjxBkcBT5cMVTxCz4v3kWQfMHYqnQI3kSbzNVvQeAkHa699VnSyV+
         2Y8MJaOHVBnsSXoQb8cx+C8CBjA6sYC1ivtBs5etIkYgT/gyh/BRhP6jg97Q9sOoMVUC
         eeHKeCFVhSR6ja4MLuqLS2DleYxpG0aC8tddirhuhapqSxlU3Z2vBoM1AFovvNvzP4Ir
         DRoIVNIxbT4jm5aSTMFu04OMoGWCEq1K/iplsxgVM/rxKkSR+grgdETREr6LuAvR1KPu
         /Ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713187893; x=1713792693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE+Cpvnrr9PFeeWoK6ioKoV8XULExBLcSObfZiwRf6E=;
        b=pvg1pRvoBgoh4AUbR1TJAq5Ijznrd5+Wr6+irG338iStE/ONhzYkOPMoAfLjgY8/TZ
         OXagPRcedTzNWz0nQpmxPIMo3RtjJYLZGJE/AeAyEX6C6sIzagKwq/GSF+Z4U0AfmESF
         vVl8d+gfQLc13UFXs2V8yBX+Mwjc+iA70R9uLny0CnvegoJ33ECF3Mk/PBxcVm3tilH7
         G6nqr9dImv8Xas7GftMyV61k3q9ld3KrjVsHExiCknVfv6El/Vub/jKXSOp998HJXtk7
         iYtsDBo5cMz2i3re4rLko+2T7b1McSC9b8rausKqxjdzPye3W0NB1expIFcIWTp2FOFu
         ShVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMSqRWiv6WZCzw7vT4bUrbhaHtTf/OquCzFaWvp5I45cJAsWfSz9qxqEt4qktzZioaLzQ8cuK04EP/rrBIZvqezT9TCcG8lBvdUnlbqGTe
X-Gm-Message-State: AOJu0Yx2E4EQ7ytezt8nWe0JCQMGgcWiZlk+xKPxd6SMSU3EljAGhomB
	zqDHJcYIYQN020UonRWHqr9CGSVUTM2GHR/GSVESATb0/qOM1IWhrv8dY2tPO80=
X-Google-Smtp-Source: AGHT+IEyD5MBvbEAjbw0tg7O5uE23K2svhSCaSMgsgY2nQ2IFrtDTCQqzK+yEHIFjtQaAGU4qZut+A==
X-Received: by 2002:a05:600c:3b98:b0:417:e00c:fdb8 with SMTP id n24-20020a05600c3b9800b00417e00cfdb8mr8462561wms.1.1713187893433;
        Mon, 15 Apr 2024 06:31:33 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o4-20020a05600c4fc400b004170e0aff7asm19061196wmq.35.2024.04.15.06.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:31:33 -0700 (PDT)
Date: Mon, 15 Apr 2024 15:31:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	x86@kernel.org
Subject: Re: [PATCH v6 21/24] KVM: riscv: selftests: Add SBI PMU selftest
Message-ID: <20240415-05af8386b8ebe9aecf37c1c8@orel>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-22-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411000752.955910-22-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_063135_420325_DE0B7790 
X-CRM114-Status: UNSURE (   9.90  )
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

On Wed, Apr 10, 2024 at 05:07:49PM -0700, Atish Patra wrote:
> This test implements basic sanity test and cycle/instret event
> counting tests.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/Makefile          |   1 +
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 369 ++++++++++++++++++
>  2 files changed, 370 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
