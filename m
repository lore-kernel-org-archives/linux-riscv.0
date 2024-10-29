Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CFAD7494D
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTOUpke2IsXLjsAAeb/TbWqzv3Yn8UL5LwX3FyfKlNQ=; b=uZcnsDPw/MW+9Z
	ctk4QWfMhrAqGq7LS0i9mWvVkbJhrp0EWEFialZzDsDJTKdm0iAH7PgUhYdylIkDlmSaprJWa/Bth
	ctKCxQkh+NluFG10yS8ptQHXcHjIJR+qUcUIibuQovRRk7CYnthpiweOmqOxLLfhzWf9R1ni0CPF/
	EUWvLBA8RhpToLnNAnUnjRT6SFnCz3y4m/n4rzGaKCnAvwAHyPdBr26nCUrTLZ3whOxuwftXWRd9+
	KhY1TV4QsoDrqsKNEgWEkQtvwLzCUguWSvb3Hjx59jtt9cuxR6o1rolk0s8HP0Raq++WWlbkTUeYi
	9TlzTvJnVzuyspOSXsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vue-0000000GEo4-3LPg;
	Tue, 29 Oct 2024 23:46:12 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtq-0000000GE4c-2PPJ
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:45:28 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71e467c3996so4617807b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245521; x=1730850321; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kn/sn+D1z+93mY85aikbkRt+t3FRvwF0B8Ok3zV+OA0=;
        b=ztYABLvL2AjBlTCv9l02PJEjy0CBjYkwcaHI6MGZCkNukU5SG6InYgslu2EFquUk/p
         Hz/v+55pvAwTLDQ5Q90o9ypgDwoAzySVZdGXHTXg29Sv1ZwMpZxEX6uoMv0ThQ/U3A14
         z3b5tyQjWTsmg2+FBGwuwAEzAQwmPcwvTvZJ94BbNX9rbZN3UFLNt0S/uiMIqAKOS+ED
         uGfi702Pc0d2xnDUac5hHcy5N+4FnIy9RFuwVxLxH4QEFEv/FixpgHnQUeabfUm2DSQY
         MBwIqDHgmaa4kirMYZtKQDkB6KqzlsIwnz5PfqelOYcR1cKAUvayOAnDZhCbHiBmGhPA
         Zr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245521; x=1730850321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kn/sn+D1z+93mY85aikbkRt+t3FRvwF0B8Ok3zV+OA0=;
        b=Cs8yeGSdRnqIsw/Qck+BNjOo3/ML4J24yiis39mumuu8cjISkzeZA7BLtnUxmVFeXR
         ySLTvEwoxq3MArDePIxxxFRJMa1XmVCa8uWoAl1CVdRR0TPhM/EmqndVoJZjtesc+J37
         XkJrWZYcxLDDBebI0fnJ6dp8aAo23Z7q7L9jozY7Q3md3iKAs0EkGRjZZHbtESrR0rP6
         IGyp2qWfGB9i1Jn1aqANxuA27TADmpIyl/Nf4R5gQWtpMOkBaba9VIuRBz7LMUHSG2pZ
         +Ts2PHL5zO6TJ3eFQrap6lL8r5dX3kTaHRJDZFDW6UM2Gu/lismAy0JUzuj0P0pLbmyd
         UwMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrZMhSfhbzO/EATOgft48soQdxbJrRqAm3nfiAODbElFLzb90tRttsPVfHhjTvmZMSz17MBGZnv9HAnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI7qvaCKqSa7EmGb8iFKcJs0MWqYoQMEovNARtHlZuKK29i25T
	4UYYqeaQPFU+r1c1I2hX0YvAKOXgRGoWXFsIdOPcv0QSUcIhWECPV4aQ/clEo4s=
X-Google-Smtp-Source: AGHT+IFSRRwDJwzMEik28WuiCu9TazkISCRtSEmteAY39kMNDbrF9hMfjaoxtBbs1QyHM1hw6YiZLw==
X-Received: by 2002:a05:6a21:e96:b0:1d2:eaca:4fa8 with SMTP id adf61e73a8af0-1d9a84d9df9mr21491704637.35.1730245520903;
        Tue, 29 Oct 2024 16:45:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:45:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:25 -0700
Subject: [PATCH v7 25/32] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-25-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_164523_068958_D27A2AC7 
X-CRM114-Status: GOOD (  10.30  )
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 1e153cda57db..d5c5dec9ae6c 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -72,6 +72,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 50)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cea0ca2bf2a2..98f72ad7124f 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -107,6 +107,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
