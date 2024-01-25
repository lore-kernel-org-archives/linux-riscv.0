Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D85C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfdbrvXqBEILLrbxXxDoVfEELtD97HyeIX0giBZDGFk=; b=uaNSFo2PpsVwe2
	uJWB1CCCk/L7M8Z/JY8SMv6vItMGbj8AVM59w6SVw9lH06hv+9kYF9r4UaFIkdEq4/EagLHoZLiZ1
	e8twwLp5mBuMz+UrRpweoReqd99DSqZlBdpFYGcEoBT7kkfy7IakGe728lSJ/IS4DnJCIW+1P3o6X
	8k1q+/U+/v9y/8WhKAIv8CJnOabsDzC6nBH79VL8BDKi4Ma+k0mqwzYepCcQ3Rc3bziKgZYaQps8T
	xVtC4gwrlDsQtvPverkSOz3nMKD+2U7rGXi5+52OAGlTYV9RmQjgn/jHOe+KtMH9w+477GQ/zMcwZ
	0bLS/QWBB64KfRAXTaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStEL-006kgN-18;
	Thu, 25 Jan 2024 06:28:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStEK-006ke1-12
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 06:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ioE1LIRdb8UGU7iHQDrnlckX+FNXkyoBwT0Lgj/da5g=; b=cDJKKHp/V3Ep2P15enidarMD4B
	blH5z0fsnLJMi4X8DtkpcF25BK9LmFVLoxvlWKc05D7ODtm8c3Id5mLGN4hhfTvJSvZXWsKPTpYyZ
	bbEJeOKmx81E0B7hJu9m5MEwZag67rppd/qUD1gPPRTOsX6CI3D/qXl7+KDJO+PjzLe01JXgc5BDo
	36NlBZqu8DMRdfSOllNfCHW8piKUf3gwOXCVFc1Q6fdJphWcxgTOX5VSxbyo0Mon0QDHK74jR47ga
	gdNjCYRWVRSOA3Q+2qXnknC7RXSVYDkqjP2RsKiWIK1uLEZcJifNFItiWNqTSp/FyZZc9ushSsUKD
	1sllrKCg==;
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rStDy-00000004wRU-2U5m
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:28:35 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3bd3b34a58dso4020901b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164108; x=1706768908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioE1LIRdb8UGU7iHQDrnlckX+FNXkyoBwT0Lgj/da5g=;
        b=rMnl1Mk9Ua+jK4+zezubNW6GRzmVV7QIKCfe0b3NMmqhEbLMwYD9HCWcjax9lIlX4n
         nCoKt6gS+hhRHggkKNnAG5NMBHv0jewJjXiA3Nf5zEejOW3hyeMF0VsNRpOc9wdKzkTP
         Xo78QTALGNOedV9UwB5Qd/GhQ5Yz+36nRaVHTwtaDUaivDWe/ie6JXsKMV7uiKtC01Sg
         pGigSUFwyIAlUWCiVx2gjzeg13iLEltP0/JE4LOgO9pwYZnDAB7Bfe+YXdW/270LfvU2
         fOZ5dT8rBNGsZzjd3R/9aXPCfljVwUfRPNbzD/5cBP+jq0AVMYK61FYM5it15wyst+oQ
         QwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164108; x=1706768908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioE1LIRdb8UGU7iHQDrnlckX+FNXkyoBwT0Lgj/da5g=;
        b=XEt/Q+Qylxa/4wYppChYyZ2RI4uZw99Rtb/Sr8ioZkFFuoj5xCtHI29GJ+XRmTxspl
         /2EYyBgALkcH8OpkBcneYYymq//YLIBLuuteNfZcVgd9wEPQt2xGaR5tmiYY2an8oePS
         tqnbnRO7do/GoQPwntcTynDXZgqSZUqeGuSJTz9w5wyOOHWPErInnCAztF3Bqc0OGIuR
         9T8yfd8vKY0xfvyQq0AgmaSiK5Jz7+u9I8wo8dqUkmlV7sHI10jxvKpn6Pq5k3exJIDj
         iMK+U9VOhRW3Nj1MV+Vs+h23LQQVqyZPFSXKh/ktqPo0bcSLXrb+IxTgWbU69Sqs4t+A
         OI3g==
X-Gm-Message-State: AOJu0YwCmuoPlUOZ8e5Vx32EuUHFV2bRaN34/OU2MjxficnBNswlHTCw
	6JK7tR6iPjZqq9VDJUy+f6XCrhCMM3aDydm9xl+TlUcm7hSNZYINEJJOH1OP4s8=
X-Google-Smtp-Source: AGHT+IEDX9sIkxnHph4wuJVvd42o38950kc3fb8mUyOs60adtjswg3LDjUQk/s2QDj8rOhFBqYZqog==
X-Received: by 2002:a05:6808:159a:b0:3bd:7218:f318 with SMTP id t26-20020a056808159a00b003bd7218f318mr526373oiw.4.1706164108504;
        Wed, 24 Jan 2024 22:28:28 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:28:28 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 03/28] riscv: define default value for envcfg
Date: Wed, 24 Jan 2024 22:21:28 -0800
Message-ID: <20240125062739.1339782-4-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_062832_713743_DC9E6A93 
X-CRM114-Status: UNSURE (   8.79  )
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

From: Deepak Gupta <debug@rivosinc.com>

Defines a base default value for envcfg per task. By default all tasks
should have cache zeroing capability. Any future capabilities can be
turned on.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 arch/riscv/kernel/process.c  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index b3400517b0a9..01ba87954da2 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -202,6 +202,8 @@
 #define ENVCFG_CBIE_FLUSH		_AC(0x1, UL)
 #define ENVCFG_CBIE_INV			_AC(0x3, UL)
 #define ENVCFG_FIOM			_AC(0x1, UL)
+/* by default all threads should be able to zero cache */
+#define ENVCFG_BASE			ENVCFG_CBZE
 
 /* Smstateen bits */
 #define SMSTATEEN0_AIA_IMSIC_SHIFT	58
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 4f21d970a129..2420123444c4 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -152,6 +152,7 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	else
 		regs->status |= SR_UXL_64;
 #endif
+	current->thread_info.envcfg = ENVCFG_BASE;
 }
 
 void flush_thread(void)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
