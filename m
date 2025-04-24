Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF1DC369DC
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Dwmsng6enzeMV5uKhD9ImzBVOCL0rLM/8P4S+DQxWo=; b=IyoOHCdtEPBMov
	34di+YZ3+lA5721cuCbmuDl8kqTBFoL9nE40vpqabuGmRl1QDmogYCT8ni7z4Fwhfle5areb5PNI0
	Gykgf3yTZyu7Zgh4H/TeMcvL+6dIL+5m26d0ljbLf6q7YEEMeifh0QXoR7GBm9bXpXpm3K5CDDXcJ
	09qOesotKt266ItLlEPg1k92kFDh11n8MMmjlVOW2E/zd+fZiewmSeaTCnOQkMchpUNH9ONLnr37h
	swj7LlLbVVC6OnF9lU4F1PPOe1HT07GMQUBzCxun9Y/zZEzd/MDPv8MH7rrcC3PAokhm2fdObRB+o
	6NOkRHvFBuQA7yy+pBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t1F-0000000DWhX-17au;
	Thu, 24 Apr 2025 09:37:21 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qtk-0000000D8Hn-3NOa
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 07:21:29 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22423adf751so7082695ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 00:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479288; x=1746084088; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eeH2xWhp7150dL05xNnwhOrsm/0dm8O4b6IoAKLk28=;
        b=qKUEvZIDFwENVVgyv1Ofr1cGXYZF05+smk2APEdrhbSekejmQbunQuyc5isLUjxhxt
         ynQ/MPal5lI36ovGlYG79bcupw0AnPw89gXIqjbO1Id55qnnD1i7jOSQ+cS6VEG4lmpw
         JZFuDCRp6bXyrZMvcHgaKNa7xGsYDGYy7pA4MNQW4QVxIyozSCUisySeMaHnUzWOlD7j
         0rLsZJTOjPkwcH434toPMLKMkPrwYODkTjVh8yzIN9McpX+xt9cGJe1C7GFdWcaK1jdT
         pD0tfOASbqPzvQyz+yKt/aSWVMoQ09QDCHae7wCDoqRwxqksRr4YkRqT247AfO6Avapt
         FeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479288; x=1746084088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8eeH2xWhp7150dL05xNnwhOrsm/0dm8O4b6IoAKLk28=;
        b=IfBPlX8SlB8QjyTcvNlKjTlYhbyR+uKJH3W1O6atjMp/XKxUcAw0co+DUpmV6AU8Kw
         JWHcN9ebWSeWEl68CcZfTKQw0SFi9Z8HEinfFRzsKl6c/YG3QU7mMzySELY8sfD+tqhw
         q4po3rKzYvoR2iOBNb8bLH0p4iHOsR2IhBZSf38zCYFrviyKp+hMEO0b4g0gWx68oVQI
         LsOMEc4wAqiKEyauzU9MjGY5uSAr1xkfaxNZx7y60bRnj8UCH5S7Lhtg131SHgy2Tfe2
         +3FrW0wXhfIUtksXSLosr0OTLP5A1HT2tcQ38v/j5/1EZRwyxkzy+hn5OvoLj9OnC2PH
         HqTw==
X-Forwarded-Encrypted: i=1; AJvYcCX13XfACoRv2P8xbebx/Bd1vVmigR8hWGOn8Wm/Iy+SqD+pTVR+LcKIfyO2h68YzvehdNMNjUvV00VkmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwD4+E2eXQCEZcsdC/TsHhid9PklwBL6iiFBh427pwuK9I5hVrS
	/rddlF99oefqcxztiai9Lhs4yhsMsnJ7bu8vYpIKQIX1eL8HP69E15UnwfoGGcY=
X-Gm-Gg: ASbGncs+I1Px47HfiIeIQnpR9fcHaAjSL9QcAk1cdUSiY+83+ie1etJv2vr+TmzOgQR
	hR6Jo/oyh18ZvI+BkE68kEm88d2g4Z07wcHN/fIjX3eqDX6TYCZ+rPdrld44aoHx+AEskkPty0X
	dqy3j5YiaaWwujtgGXpOLgJDbZfk3DXNTwifCPUI5XCchqg+IgH/bV4BEOu7rjQr14BVtAK4J5m
	jEaKb1yExxshE/P/0KqSCuwMycxuxQl2VDK74sJighmfIWjVdPP8ArQQKtKbqzobl5CAaMW+dZ4
	yXwXkLu4IjsJk0bKAS6BL0epFb6+Px+QnSpksG4e4I68UHCyXBz8jIb3oh9neA==
X-Google-Smtp-Source: AGHT+IHQaPNWR8AWB4C6qrLbgpXQ/uCnelvpmMXGyE7SN/TZw8kP+Kpttxym0RazMvhkr34F2t3brw==
X-Received: by 2002:a17:902:f64c:b0:223:4537:65b1 with SMTP id d9443c01a7336-22db3d99508mr26205085ad.36.1745479288201;
        Thu, 24 Apr 2025 00:21:28 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:35 -0700
Subject: [PATCH v13 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20250424-v5_user_cfi_series-v13-20-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_002128_857539_1AB7CFB9 
X-CRM114-Status: UNSURE (   9.67  )
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index c3c1cc951cb9..c1b537b50158 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
 #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 50)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 51)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bcd3b816306c..d802ff707913 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -108,6 +108,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
