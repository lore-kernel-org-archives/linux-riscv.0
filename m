Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3E3C3DA45
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QB++Gl9ZZzdvtMHYQtj+/Zj/1rFt0vUqtCkAgm/cxLY=; b=NNSDT79HVLWJ0h
	L/zLQUqyifOtS2mWyx4XKqjW1jhGp2ppJD1xN7rrK3zEpj6cfAYrKRhjO2mQBKGPwhBeGTBIhifgp
	roGzZs0dv3PAJchuPR8Hr+d+e1/BnVn6Mozjt5wpcNsxVCY0ZeXZxzkXJep+ZmRmYheH51IASYGqp
	FYNWQqS0d2ywKXRcF6xsm6UAb1TXXwOoZ6BWmyU6C9oo2tYx3V7Bupuk/mQ79SgKF4sXOZSMbX0HH
	ciqfJLzfCV7++XJTB3VulCSR0QLy5mikgf1g6PLeHXUYRSC4faNLeDe3x6YKjCquKYhzfBGpKMCK4
	Qqve1IGeTGDehwq1dBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREoc-00000008CIx-2sqP;
	Tue, 09 Jul 2024 17:39:46 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREoY-00000008CF9-2mPw
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 17:39:44 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-79f1828ed64so103346285a.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 10:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720546781; x=1721151581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bs+9F/AX0q+LBs1CELfWwb/nqSLPDtCG32+ZAsR7dQo=;
        b=sQ8uG7lFUxTQsnfQ7Uxzm7m0ns8aIX3hjezEMn+prKt0L0108CAJpsndfsQMIscrgY
         xypmfcAbk3jTLtdY8xOkq9PpcNmFqEANCUe6Ut/kGwKwm7Qls9kPkeOkPYxPF2Qcan8b
         RVjJF4Uq/M+oeCZwdX5Xe6ly4RKrMMCWQK8lm6pa0wsW6y3pv9NP0RoBZFoy2W+0U9y2
         XQzWOQ6bDvfZf6sqapwcSkdQBR3Cd+7cnCpOinYxFa7yuKGAGIsOurj10TZC6VN0tFSA
         l+97SLXx5kVAu5RNjZvhWDieJKZSq2ygpPujtGYF0CwsqGJexRolKCJDxrwhqn8fIOpV
         XMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720546781; x=1721151581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bs+9F/AX0q+LBs1CELfWwb/nqSLPDtCG32+ZAsR7dQo=;
        b=eerhd7jLcZ5ZBRgDhGw6Z6WbrRSNdDQ5B6oIcL1VGkE+Tq9pqJ/MwyGR5fEBtv2aSF
         Mb4G9dKhaaaqajlYjWyLcsKcpVsjXUb1c9HbtfylmIk0lp2PoZeDGTkZzelpMy699GUX
         6++MPdCcxBfM0BvqsCENwz/xdFUx6EugAJgiBdX8IjNNClUHnaa0x77N4U9F576/qRXu
         tPpdCEjhNDXTcjf9LJjIDTwlSxr8yCmRPjlqhJ/av0bEZtbGt1IBbLFr8/UxT6shKk++
         8ZKzB73z3rWcDCTgvuIaPHvnK5w4qA2JkiKbxGAuryE2n3y66e03a/dFKwpc/6qdG71V
         PGpA==
X-Gm-Message-State: AOJu0YxUIT1lm4DGxpSxQyqck1LxWot3pkMZdyItrnNXU33p8jtd8euz
	BGFWuSwvm85cubHhqjJOr4f0idrMt5YFSafonnbXhkami09X+s5KEB0nlWVitAiHfD+49BxsKvU
	3
X-Google-Smtp-Source: AGHT+IF5vRwH3MAJLaUEo4+iqmQHIG8YR3UCz6IbvA0rf0+v0uyHD1q0n/vo2ks9owSgX2DYVwobqQ==
X-Received: by 2002:a05:620a:3b89:b0:79e:f7ea:2df4 with SMTP id af79cd13be357-79f19a5fd69mr325013085a.19.1720546780865;
        Tue, 09 Jul 2024 10:39:40 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff6762sm117547785a.10.2024.07.09.10.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:39:40 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 2/4] RISC-V: lib: Add pi aliases for string functions
Date: Tue,  9 Jul 2024 13:39:35 -0400
Message-ID: <20240709173937.510084-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709173937.510084-1-jesse@rivosinc.com>
References: <20240709173937.510084-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_103942_744192_53317996 
X-CRM114-Status: UNSURE (   9.89  )
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

memset, strcmp, and strncmp are all used in the __pi_ section,
add SYM_FUNC_ALIAS for them.

When KASAN is enabled in <asm/string.h> __pi___memset is also needed.

Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
V2 -> V3:
 - New patch
V3 -> V4:
 - Fix duplicate the in commit message
---
 arch/riscv/lib/memset.S  | 2 ++
 arch/riscv/lib/strcmp.S  | 1 +
 arch/riscv/lib/strncmp.S | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index 35f358e70bdb..da23b8347e2d 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -111,3 +111,5 @@ SYM_FUNC_START(__memset)
 	ret
 SYM_FUNC_END(__memset)
 SYM_FUNC_ALIAS_WEAK(memset, __memset)
+SYM_FUNC_ALIAS(__pi_memset, __memset)
+SYM_FUNC_ALIAS(__pi___memset, __memset)
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 687b2bea5c43..bc73325b2fd1 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -120,3 +120,4 @@ strcmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strcmp)
+SYM_FUNC_ALIAS(__pi_strcmp, strcmp)
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index aba5b3148621..b36325a57f6a 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -136,3 +136,4 @@ strncmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strncmp)
+SYM_FUNC_ALIAS(__pi_strncmp, strncmp)
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
