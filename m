Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931EBE7545C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 18:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6fC5p+8eeT3G1TqqA3nH89SiifWHhj9NKlv5VIsuqek=; b=gx/ZHgTIh/ukiG
	kHPAngKHyKIZBayfDycBLDaPev6lbZgY9f80Dz94wfF3NrUifW1g0qPQJCQx1sVjcnxFctjEPjOnr
	WLmQ5VZa+VG7xz7H/Bn74OnI7gYvgZhcTw37qjybAY2wKSgNdrg8slNhWLC7w2ITvMbbID0gPddLh
	x3kfyy4/qNSmhsgluIepJ9wJZQ7HnQSO3m2N9J4joGL/hoYDUhH7CplxkEPAIArbm+6ayXREkIgsF
	vez4VhYoqF7F8bnScYLn9Y6fl+SfO9c3e7MT30eFb7CpFh3T4XdgQjnkHiQ4UiATvml86+cGaHIi0
	EiRcw5QeLwDbb3uXDB6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnk49-00F6sl-2g;
	Tue, 03 Oct 2023 18:24:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnk46-00F6rj-1Q
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 18:24:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-406619b53caso11789535e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696357450; x=1696962250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fq2RfR39uaAULbR2hK0DPNGxa1+1fryXBa+jVce0es=;
        b=Y1pRfXuplChDvmSQErVvalvkS4jb16hcRW+qYuTPwMr+uyXnAqZCqQP54Uuwyfxgtf
         40AYnh5L75WNyhXrIcMeFf3X+tHwHhr0YSIGbrrvy7xIRMPdfVnMuX9jMrZRrD/FrOY2
         fUHRbLgdkyt7kHFs0VGXbMigsP4Zu5ECfFm0xJqDVQzztPWe3oifbyL/9NjiG/JIdUAJ
         1j5y7mzqlOrIa0ZeNjI2nBzLvziZ4N9jpB9IOlSTkd6oWJ7LgWxqhG2asUzhP/3pJDne
         q+3Shd3+46l4LuU4Lr4UyUiqsSubd8tkOf9yq5/cfjpe1vh3UmafIBZ8sCtIaTwOBV66
         47hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696357450; x=1696962250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fq2RfR39uaAULbR2hK0DPNGxa1+1fryXBa+jVce0es=;
        b=gCOVoYmunZl9dlm4jnLKBrr5FZWDJ+d8JMg+jrt2aSDRFtSm9pmHEYoJCCOjY5Gdk7
         /owRdM4k4g4zFQOigk28Z9ebIIgnfYNdC0tKUsrQs0katr75Tv0eiU445ULHtATZerEd
         yjCRh6JCwKufVZCo08rVdPqBKJ4yYkknriVx/dr596rdo6x68U+L547/CZmNk9O/XL1f
         PKpExK2A5vFajaTUE9efjYZvViX08KDQ7wfEe0OSSW4fYQkG9Uf2AP/qsD69HVVtjF0N
         u8OwfijQa7+Bgwg8SQrD4+Hs3QyqtPEK97FntlzfaIw2BpDvwUO6wUBrGnPHu3qZXqoP
         jOkA==
X-Gm-Message-State: AOJu0YwJ8ChApln3WI4Lw9M3Uzcu7LEjCRbv7OryShhAM6khvbwrEjyn
	3Wc7vk7ir7i8xs16yN0Yav/QjQ==
X-Google-Smtp-Source: AGHT+IFST40dAkMljajKV3st91h8lo8KqjiqMch0O4WAUPvcsQAwJnwqFiLD2Dq6fOcnD3TpdoY4xQ==
X-Received: by 2002:a05:600c:22cf:b0:401:4542:5edd with SMTP id 15-20020a05600c22cf00b0040145425eddmr187257wmg.34.1696357449779;
        Tue, 03 Oct 2023 11:24:09 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m24-20020a7bca58000000b004063977eccesm10001349wml.42.2023.10.03.11.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 11:24:09 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes] riscv: Fix ftrace syscall handling which are now prefixed with __riscv_
Date: Tue,  3 Oct 2023 20:24:07 +0200
Message-Id: <20231003182407.32198-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_112414_664545_CE40C57A 
X-CRM114-Status: GOOD (  10.53  )
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

ftrace creates entries for each syscall in the tracefs but has failed
since commit 08d0ce30e0e4 ("riscv: Implement syscall wrappers") which
prefixes all riscv syscalls with __riscv_.

So fix this by implementing arch_syscall_match_sym_name() which allows us
to ignore this prefix.

And also ignore compat syscalls like x86/arm64 by implementing
arch_trace_is_compat_syscall().

Fixes: 08d0ce30e0e4 ("riscv: Implement syscall wrappers")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/ftrace.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 740a979171e5..2b2f5df7ef2c 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -31,6 +31,27 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
 	return addr;
 }
 
+/*
+ * Let's do like x86/arm64 and ignore the compat syscalls.
+ */
+#define ARCH_TRACE_IGNORE_COMPAT_SYSCALLS
+static inline bool arch_trace_is_compat_syscall(struct pt_regs *regs)
+{
+	return is_compat_task();
+}
+
+#define ARCH_HAS_SYSCALL_MATCH_SYM_NAME
+static inline bool arch_syscall_match_sym_name(const char *sym,
+					       const char *name)
+{
+	/*
+	 * Since all syscall functions have __riscv_ prefix, we must skip it.
+	 * However, as we described above, we decided to ignore compat
+	 * syscalls, so we don't care about __riscv_compat_ prefix here.
+	 */
+	return !strcmp(sym + 8, name);
+}
+
 struct dyn_arch_ftrace {
 };
 #endif
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
