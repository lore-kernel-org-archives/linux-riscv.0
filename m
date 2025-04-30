Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6742C369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIyTGvBYVBmaFvf+AkVvBqYMY1J/Q/nJXj5P4rGXsiE=; b=N0GeJKxA957dX2
	cCDlqHCAnlPNPuXB/IQP1YUgdKOfiBJ/f5ZNxwsj1FsOEEUB1XRmOJEFBvQvaZXySGd4NLEYtd860
	p7RilquJmns4GCqGZHnt2XF/hW/78zMm8qZ0kAJw36VDLuaClwjLdkQmnIAa/2+2hsB+RI8knG+1M
	prgoWAaGdMfRDI8aCOKEsxIV9rPLGwDtH7sWdW7MW8JJdUsL9sz/XGBG1kLuWpaCD1WkvUzUHNCKN
	1YNGx1udGtwCXP2f2OMuUW8zjaFVICLnzYN9iwAXHFu+R8H1hWF9FO3+TLl71TDNp/dbebqnPOBWg
	d5y6w6r2EhgqUWrCROQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v7o-0000000BFwV-1A78;
	Wed, 30 Apr 2025 00:16:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v7l-0000000BFuq-3LJL
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:16:31 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2243803b776so111464855ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972189; x=1746576989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SkVK3bviqHN/t8JmfUhzYvFjjtQu0YyYqPmZLVGI/TA=;
        b=ZrvCs0ble0xUfZtRi2t0aiS0BEQNTBZl9ics4IuTSQcT+7mUdyI/gYB5O8MKdYp+/E
         HZLEugnLjrRqRt3JhBf/93oZpBgXNBn8oLkN9a4ndm3t2LPLA4QDjomgQLjpc69vs7m1
         DIujYZx/qPy5P6tSnCd0fFCyG+XvPspy8DRdyT/MfBGgnAqzO02/8JJ05EHfdAiKFAXg
         8wrkwrAWN/SbOkCcs/YNnDWJaBKJaub32z3mtJcU7uXBvKpQwQvSHphUV3AzjTQYa39a
         9W0ISQ7o24n5aC3BpT7szL2dsqip4p8S6z+XielG/ULdry+B3wj9W2FeuPdgU25Z66Sw
         b4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972189; x=1746576989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkVK3bviqHN/t8JmfUhzYvFjjtQu0YyYqPmZLVGI/TA=;
        b=Ts9caV4jD0a6gu6bdbtHStyORZr4m1fB5xruKn+Xjf9ZQfj8+maQNiwoCQee0+B1WS
         6fznJU+mO77fU24tIcL+u7zQeIybLCWYFqR0Yz/zGFccNCVWu8zgGGG6NFdX6/sJzc/e
         XSgInzYTb7N7IaV/eaARk9MYZhCuyo6b3hOXdevuXWbtgCD9w+OHqzhTuHLXKXzLj8P9
         F53GosBHLxw/nxH9F7euxM4ijG2dEpwpFB9+LX3A/LCcSm1DrHlKyUYh+K9PHuExDBZa
         nmIWHLpXnu247Kdj6oH6qjk2hPGyCf9qBFxlSSdVQQPpYAPgKZxQuV9yleU85iSxlKyf
         hCKA==
X-Forwarded-Encrypted: i=1; AJvYcCVAZ0hsGhcOrZc8ggN4ci1jhbi7sCzIsKwqeZPPq1Mxsz4trFSJbCCVuxe4/T12WqzZFL4nVUrKWvkDZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl+yticwxu4S48LsUN+4QBMM3gb4wvXJu4AER+cBaJy2gWGgL8
	9WX0TYHme4kqCojmfeUpTdgKE+1ta0VMcLrjUEEXHUMwyDSevhBPkbvoVAnMJRI=
X-Gm-Gg: ASbGncs1cjyMdifpCLlPoX5zW34VdANE9NZkArv7XzmbSS3Ad6w2HjRvdbLrB9e9cL4
	DnNmX1dkSzuO+wKnEEfH6EVnv5HeZlpSYmLmtRCFyz9w+3SU4g9Ml3rTU5wmJPdV+lBcOJQldzS
	Lft3l07x+UMXgrMKGDedO4CaDlXHe/K48Uk7zctv8xOU80YEkqeNSNjD1nMUK9mGuPEY+ww5zF9
	QYghfavuW9BMQ1UHZnwsCY3fJ2dtp2oTYK7Mk65y8VVoSHE4/V8B6KQklB2IKZXQcTSuHrWuwzJ
	0zbRadTtpVOp31hL00XcVcszNUG+0i411hiof94sNoBbtlgN0ug=
X-Google-Smtp-Source: AGHT+IEaCOo3UdLjB/YDRvV5wqIWEkwy6tQXnBD9FT8T9fOLPTePyGUVcVc/ygroOS4hwPE4lcSyLA==
X-Received: by 2002:a17:903:1983:b0:216:644f:bc0e with SMTP id d9443c01a7336-22df35192a3mr22839375ad.24.1745972189106;
        Tue, 29 Apr 2025 17:16:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:16:28 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:18 -0700
Subject: [PATCH v14 01/27] mm: VM_SHADOW_STACK definition for riscv
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-1-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250429_171629_836439_72F8BA54 
X-CRM114-Status: GOOD (  10.27  )
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
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b7f13f087954..3487f28fa0bf 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,6 +352,13 @@ extern unsigned int kobjsize(const void *objp);
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
