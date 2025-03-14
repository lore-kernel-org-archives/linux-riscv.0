Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774B8C35FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 21:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tk97CLjujx8kLXhmHiYf6VqelQvRtdvO2pydQZE/S7A=; b=Qu1wqlrs0EBbp4
	vOCJGrJBM+Pb1YIMiGdZLVmk495lQoQREr7CR0eNHoWlxCelUAtuN2eQ4w0F5A1PsBbjqVqeF2RWH
	DWD+9KdN/VHcacE44PqIwylhKpCa4VX3IhonGrXY046RHRPsTRQidZSkVBAND2I0ExdzidWuIIhzu
	01JaJ337aaKVJpbKzEUBhMk6rdVRAWCsQQmgPB6AGiQlbv5igd0BRwzY1jQiPy+qLiXwfwiWsSILK
	SCzfI8WqBZDyf+ReyCkk/QSzFE2whSS+HdNTvDmsjIsSnWP5fQkKcmTC2Q5iQv0KLBEloV/bFMJAk
	nUSo4qL8ByGyuBGf/1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCkf-0000000FKDB-3kuC;
	Fri, 14 Mar 2025 21:39:33 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCkc-0000000FKAa-31j8
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:39:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223fd89d036so53920155ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988370; x=1742593170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDDw4jYk8ElhORayLnctVQ+77ceNByh8dqs8gmZ197w=;
        b=0PoTYUQwPwYvx7z6lz/bHqD5zBhwtQZ0OjrIE6f9jbrlOcgj9vpR+sS23shAe00Zkx
         dF1KeAE9yFG7GoHCuHkUB5291RAhPt8UaAHzI43PCceXzzrHUR/TI03/sCLXRx9iKg/r
         p7HIZ5IN27kbM+ASL3wz6H6NwjAp1WfDZPRxzh+lTj+HYSruLwONWcL4HUrRRhe81PTA
         RPa8cZAxJxYGw1kNtNxea6hJaSF2hWXwzwu9reJ25eWSQObYb3yCtbJURguWwBucSf4F
         594xqNqou6yYmPuk7oF9fyNw09Mm3dk7XlSAVl7gLjML2+7nbv98bWFB6ygYhGl9DMhx
         di/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988370; x=1742593170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDDw4jYk8ElhORayLnctVQ+77ceNByh8dqs8gmZ197w=;
        b=LHdVQkf7l2I8yOMDvGkdG0BPsL623phHaUJqlDcSKWVcWijSLxiPxWrSip+sdmtZWL
         sVEttMgDe/vTOaYZ0GBr0jI+38zbntCPAd9FVw+K8g+4ABgeFVZE9akPTmQGWy2yfPjV
         DU+UElEjjZ2pAkgiPvxwKBwVjzj1ldm1X+Ca+oE26i7nv7BeNLYOuQLVMaM7FfHupqOl
         NdewM/ez657WYGHrnADd6PoRDq9yHcTSSPdsTdajTZfJwvx5LuzRa6yVSFsDcnIDtOCP
         OE9afyoFt+dA8GOf1xIvtR/G0pFHWZ7YGsRWgIcy27mHU/rgPmDCwa3zjeEjOQAOb7ne
         oyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqFqHc7CxCp+49Uf28Uj5h0qFzDBZok73l6HB7YMg2Hyu9CnfCZGPMZ+OqtAF40bZiyGsAGRt2TQpHFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRUj8LPAGO/0B7a+FrxefYqIbG5VoGRg/Y6bR0NiUfpjlFMSU3
	Y6hTbx+eDxVS0LzQTcXo++wvCWARYktAQxB7B6xD0Rf2uEav8yVkI+056ULsuQoHNUxikJilo1Z
	T
X-Gm-Gg: ASbGncudF0R+F8UdmnYiKJUkP8eHeDP8GPnUI4088spCZX8o9t5hblqx1MHoB6j0gzs
	JmQO7ERERnUcdyLBLzSXhQXGSMSxHzSSxKy7iqDJRSkuXaQXELOCL81xTFfwomL6/eW1f1VFAuy
	9sUt9KTle/s2Xss2OXuVH1xY2ycBTVibO03HzLoBLq7Y5bktzYVlF5iyCZAVgyOIX3OBT++o7s2
	CdhDLjx2XxueLJeFr+XQcdRPkFkuaVT0Xxu//9EBnuY4S7iv77BQT4LGAHQ+4JgnJ7rnjwJkyyt
	AZO4h1JEmfme/Ob1g4OvsEE7k2o0CyQ73F73mVcw/4vuYub/p9FgduVt7ibD83yQAg==
X-Google-Smtp-Source: AGHT+IFpg7z+OE/2A1gqmKjw7jqoEU+X8gr8RuneE9Exr7j30nKzCtL2OnQx5eLIT+ktDst/E1FOnA==
X-Received: by 2002:a17:902:db04:b0:224:8bd:a482 with SMTP id d9443c01a7336-225e0aa7e06mr46126855ad.25.1741988369862;
        Fri, 14 Mar 2025 14:39:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:39:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:20 -0700
Subject: [PATCH v12 01/28] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-1-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_143930_764006_B25D9CFE 
X-CRM114-Status: UNSURE (   9.47  )
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

VM_HIGH_ARCH_5 is used for riscv

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb7..1ef231cbc8fe 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -378,6 +378,13 @@ extern unsigned int kobjsize(const void *objp);
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_6
 #endif
 
+#if defined(CONFIG_RISCV_USER_CFI)
+/*
+ * Following x86 and picking up the same bitpos.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
 #ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
