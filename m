Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D8DC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5PfKmFu0DqsvEOlYvNIGZGXLVEwvwNfVurW1iOrsQo=; b=R3WHD9Ye3jDf78
	Fk7M1hwxUIX2h9lQjogwVUCjJuQIBje8fikB9LATTHwnqdahjQ8C94EZCSG2ap+xyN8wqly7Pn3ef
	MdYyTEkfvEx2i/3Lqbp+cd3OY1EpcN/g+ste606H9tLoU9e+w2tFlHfxodVXF1Db7ZqRNpzC44dB4
	fldHpnTbEvD5XsqXKIitn/xP/OAhXq9DKqth0LRxOz4oLAZaDIcgys0NakR4WMQsuegc7zkcLrwBM
	01XDJtO4SBhtdZxxffPTEU6HKfcTdUOniIPj1bO2EbRDRvdUlzRW7XvA+BoUQR0b1HhkpnyECSAZD
	yNtlmD0UpNMSrMwBGukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq47M-0000000GmyU-3OSU;
	Fri, 29 Mar 2024 04:45:28 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq47K-0000000Gmtu-0kyU
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:45:27 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e88e4c8500so1391750b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687520; x=1712292320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HlYvLaJr4l3bVtwLdV9ET8gn8bkDD3ErKtF/Cp9Ezk=;
        b=waljC8dw7Riws/y6wY/8J2/6Q45BD02vD/QqjFuJVl6C45+dAcDkzNy/rq4PParlBL
         MVLX5yrDX+mHy7GiFSPgYkxHS/52Gl9JTm+pqohCkDkurWMpYELCVcGY7v487UdekmpI
         swsZccumKgZAw7jcIOEzgKp7kH1Ey3i08PXcIwLicHi9jb9ObpmGaMqPYQgrSDl0rneH
         BSuZ/e8Kc1B9leObQj1JVtEKsdiT8f2jMccE3veg9puGHUZdi0ZiJgynobnbyAScBVoA
         vqBUJP47iYKEWcyvavu2/LQtxzwb1GrSqZZHmYF3VkA8YjviQkZOkMZwcnUgP3kJkfIi
         9NzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687520; x=1712292320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HlYvLaJr4l3bVtwLdV9ET8gn8bkDD3ErKtF/Cp9Ezk=;
        b=UKB5gHQ+FPq7GUHoEUAZemzTebfBHkD3oPrQVv6Lr9Q9au4vnh50mJ3G7X8W74FNUQ
         wWJnholcgg3HIMExlBMARavAIzxGJeh+2H9doCg/Azm5ykoZshCmB1i7j1KaZS+W+UM/
         aOSzOa5B+GiGVjirassRrXMIGOLZTJEZhKfx9lFm05+aMwQxyUiC7fri60+/nc/doNXO
         o6wDYxw20ZqfG9GgfTkXfRSFqonsha8O2WGwyNW0z4gq/zv3qE3bVbdBnZPRZepb6xfs
         96SbiVWZCOS+ccl0OFzRbSfgrsFDDAGELHSCsX1YuUSN2ERJUwG86CMyeJTabkMCgkIQ
         +W9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK+/9S9RPkHQxzGk+QALdPSBujZIZcbISYSZkDQtJU0S74xdqvDqGv85HofWeurLbabbpgtMu8kT/0MsqYvLbkQwjnUI7D12vw7jD8pWgi
X-Gm-Message-State: AOJu0YwO09j5iLTiQhg6gnX943LPweTDKdf4oNIwg+9BXDm1UnxSKTZi
	GOqpv3m2hTKaWEseo+SB5VUcSulzGn9xYDaLwl9zXFgzEMBREWrH8Q4rsSLo7zw=
X-Google-Smtp-Source: AGHT+IFTo+txCMZKEE06IZ+V4dIOgngRem/aEEKbckfraBrrpL/AYZj752mW4B4fwSBOz0hRyqWgfA==
X-Received: by 2002:a05:6a00:1c85:b0:6ea:c7bb:187b with SMTP id y5-20020a056a001c8500b006eac7bb187bmr1078563pfw.5.1711687520251;
        Thu, 28 Mar 2024 21:45:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:45:19 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 02/27] riscv: define default value for envcfg
Date: Thu, 28 Mar 2024 21:44:34 -0700
Message-Id: <20240329044459.3990638-3-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_214526_291001_F147F8D8 
X-CRM114-Status: UNSURE (   9.98  )
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

Defines a base default value for envcfg per task. By default all tasks
should have cache zeroing capability. Any future base capabilities that
apply to all tasks can be turned on same way.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 arch/riscv/kernel/process.c  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..bbd2207adb39 100644
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
index 92922dbd5b5c..9a85c9d4c902 100644
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
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
