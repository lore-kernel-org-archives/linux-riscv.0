Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4023CEACEA
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGAnxL0u3hW8lZOJgf3tL9oT7gmnBQdYX44JCH4/bFs=; b=KT3y0M8KkBChyf
	tVzicDAOTxCAgYMXlQirKbMpUoUR2BqUNl7u186zqTuG6j9VA6HXKVIcqJoKleib1z+AwYczylU1n
	adCiVhtQgpg0h40yRrBbh1PUeM4d3txytoQ3yhf7JxA3LdmJxIMhnitaMUvEXeSHxfG3IVHWlXO8Y
	ycCm1yZoVE7c2kwVOhPbkj3yxjROjgTve9/uQOgj4VT8+Gswrnbo+aPNUj6ctVQuD7wQYe83RNSsX
	1ryL1Lwji0gDrFrZFTMjZqE823ABYhpFRVOI87iKzTYRSvAdkCIZLfx7RABrqA08+Crc7hVtNMsbx
	xzIMb3twjpqxsrUmkjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfbb-00000003VQX-3efN;
	Tue, 01 Oct 2024 16:20:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfPC-00000003Qxy-3x6L
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:07:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20b86298710so22452755ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798838; x=1728403638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtNVXjjPkEHV4V6z1fTmchaZwC5pGCKRUL8HB/rDqj8=;
        b=z4o3tUdkj1jvzjAwnM/Bw66nMVGELejjciXnHs7nYGkM/9A5e4VgTl4UEThvElLyZI
         bZ5Ik/O7SHIyOsos2mmcRvqoGUEKw/vAwrJ5fe7u34H9oVdPvNfA0n/j+187D0CfXhLU
         uhsCDDUErUzUd3cUrEqcxmOi4UsOPH4sYhGM5lvj9Jfbn9h674v7tMxIcwYPMJSg/2MN
         AQofJLI4gEK5ebjvQepd26viJ63wSDibpaf8plHGVT3PQcM3f3gto1vJoKm3PjWNNkpx
         bWxTJY550zTnnXOOXt8E2RMa6/ecSpE08aocpMTZoHLcAjy1PP+m8kYaqLe9ALiC9Lxx
         H7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798838; x=1728403638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtNVXjjPkEHV4V6z1fTmchaZwC5pGCKRUL8HB/rDqj8=;
        b=e+N1k7tgbTKyI+4M3I6xUGggTasya/Gguxg9K8wd2mwEQulQDX1mWq9Xc3+2W/op05
         Ntuqn2QRLkoEZSK2PAk5C1/oe6P10zjZNouknffOLCr/YmV4g23LQ1JA6EB+DLglOBK/
         bqqw7S46pM5/ulZpdFizV5NqNIL10tmawWM16h9Y+X30+cYKOJy+6M1KsB+z1wKfiymr
         Gt/Tba02kSVyQaRTAezITDfIk5JCrNvf/arJCoSkxsBlIYGDADHSETyz8K5y5lqVD3hD
         ijwWVDKAvJBUxu+kX4AfMUjvvCTomG8LZ/DmafyWy6smo5yXa/hHaEzw77GAcrC2TIyu
         SJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCVbekH8efFkAs+lKZPBNFgNiE3cf+CmTPiIMXi/p4GnX97+0q1OboZX4X1MdaWvRttvMMsZXDHycD0MDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcg8823NXAAfsg4/209/OySsqWIANbu52ft1ugEjEvaOKlJCur
	+BQMikcZpalCKGxpMlWfePWMz4iiGr9Z0uzK2ssR01HQvAT/v4tL7yHiR/vKlSE=
X-Google-Smtp-Source: AGHT+IGUHiuJzYzZ98ttT4VkP6ZUowafZttsMI2A0s9DSSKJP7pFR0E95zO3sMygBlOUl3biGdauQg==
X-Received: by 2002:a17:90b:94e:b0:2e0:ab57:51e5 with SMTP id 98e67ed59e1d1-2e1846bc39dmr235253a91.23.1727798837693;
        Tue, 01 Oct 2024 09:07:17 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:17 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:12 -0700
Subject: [PATCH 07/33] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-7-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241001_090719_047685_5B3430C3 
X-CRM114-Status: UNSURE (   9.87  )
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

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2cf2026cff57..356c60fd6cc8 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -368,6 +368,20 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicfilp
+          description: |
+            The standard Zicfilp extension for enforcing forward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicfiss
+          description: |
+            The standard Zicfiss extension for enforcing backward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
