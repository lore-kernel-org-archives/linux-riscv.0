Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F96C2BD05
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ber9JWXMBSGMZn02s6Gmr28mQ6q4uz9oGD5W7Ub/Y5Q=; b=vwwcxJenKtRzTk
	JJbxvziGvSAftnBSgmZK5Uqfv+2GxmkvAN0HfCKasTvHy6ONKdCxmhALQKoI+ypqOmkXTVpB3TQ4f
	jDXYNNzGnPsvuBQKqewwB2gkkPHWBS+qYMdITpCggbYG0i5WFjlK0/ygi0E+sfew51TYUzXTEruTo
	NqgVht8SKMQKsGYSE/vtpvuvnuxogBpCUnDOQVYu27QLd6QLITEcQeUxxxKFOIz2FvdivtsleSYE+
	R7QaEBwz91FYASMUX8rYcOhzJzP0mDVGVMiTIahpV6yfXtyZa6Q5rjTLgbvWM0XfhESnpH7eK5VmB
	7sqQ1XJZl74zkXw3qOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLexT-0000000G129-3Kau;
	Mon, 24 Jun 2024 08:21:51 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLexQ-0000000G0zS-1t2o
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 08:21:50 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a72585032f1so55941266b.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 01:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719217305; x=1719822105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZ1i8mi9BqNSECU2gQQmd4hyYzq+GyjZ8nLWHvP5TDw=;
        b=sZBj7q7jfD+27Ygdv8HXgAwqaaRswn4PuLLXUtNkSN2oTg7tNVLPMtmxf3q4PVoPgx
         MSG1Z2B7V5bCUvnCNOklFi1CYQzCpGdJ5nlwscBwsisk2TauGNiwuMQwQAl6nrCFjdIL
         qHXuQ5GfUcGNNZgU4ZobSFloWRRoXFPfGGe36xLnEQruBdX/NE1kG/7hHRxCFAB+kK2J
         J1NJAbRZM+REw5+b40th71CCChI5Gg4/5HtRF3B1YeK1G0jo5siPP8nTpGpDFJdkOkWF
         IWc2r6C0OqU/YBlbDxyg3/E6KC+Ea3ZBHYqP22FvaJbhIVSIYh2u6SJdv6HuHM4Y4qPT
         j/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217305; x=1719822105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZ1i8mi9BqNSECU2gQQmd4hyYzq+GyjZ8nLWHvP5TDw=;
        b=KRythdCNLceD7sQhkeDNfv2RYegrQRdPNo5/f2h9KIbMz1BvqKgfmXmGA+YhV7rwZ5
         wSVpPoJ2qoIgo1tyDCBtxjg5IT5eURQeoDFIpg5hghM6GsIYV/R6UictqOxlzTCqggOM
         jfkSQcjFxqiAoJqroMCrMjKC8P6Xh8AgYJvt5zgyOYdpEw+Aebuclhg8H3zDdQTdmA8C
         tqGwXeUAjGgWg78kG2Ewwn4LAqmIBAt74+fu8GfmwPSc2am9cfF3YlrdMvhtfMoH4ogn
         DF3Toxey7Pa7LqDsXF+MeLpzmb9xqUnpAwF+P27bpyUjBZzx1UOkoC1BZXC1jfdTYRYK
         Hzig==
X-Forwarded-Encrypted: i=1; AJvYcCWl5LPfwNUQpjv+NN/TdqxWlGEuocf/GlCA0Ld1gHQVoiETy5U1daVhH8cIxbbSeTZYn/Aiy5wFkdLTBX7ODNu5sc/aHbdCWKDsuXH8budu
X-Gm-Message-State: AOJu0YzFg9SrK2Kzlarwk1PBJyNGDAXtpyTthF2uOf+LpiqOOzZUF8J9
	9g1dytR0P8GmwWqBlaVxSw1K3DOP+X9MsDgLu5g+QvCzX907HYZZQEFqmo32MUE=
X-Google-Smtp-Source: AGHT+IGBH8KsRxnkr+7B5tqjabfbteV9WIQqVq8let6lqDrgcfIE+H/7OcoN0EbyyGuJFz1zez80FQ==
X-Received: by 2002:a17:907:c281:b0:a72:5e67:19dd with SMTP id a640c23a62f3a-a725e671ad7mr48004166b.6.1719217305317;
        Mon, 24 Jun 2024 01:21:45 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([89.207.171.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf428c18sm385774466b.24.2024.06.24.01.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:21:44 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH -fixes] riscv: patch: Flush the icache right after patching to avoid illegal insns
Date: Mon, 24 Jun 2024 10:21:41 +0200
Message-Id: <20240624082141.153871-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_012148_676201_B0DD320D 
X-CRM114-Status: GOOD (  10.49  )
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

We cannot delay the icache flush after patching some functions as we may
have patched a function that will get called before the icache flush.

The only way to completely avoid such scenario is by flushing the icache
as soon as we patch a function. This will probably be costly as we don't
batch the icache maintenance anymore.

Fixes: 6ca445d8af0e ("riscv: Fix early ftrace nop patching")
Reported-by: Conor Dooley <conor.dooley@microchip.com>
Closes: https://lore.kernel.org/linux-riscv/20240613-lubricant-breath-061192a9489a@wendy/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/ftrace.c |  7 ++-----
 arch/riscv/kernel/patch.c  | 26 ++++++++++++++++++--------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 87cbd86576b2..4b95c574fd04 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -120,9 +120,6 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
 	mutex_unlock(&text_mutex);
 
-	if (!mod)
-		local_flush_icache_range(rec->ip, rec->ip + MCOUNT_INSN_SIZE);
-
 	return out;
 }
 
@@ -156,9 +153,9 @@ static int __ftrace_modify_code(void *data)
 	} else {
 		while (atomic_read(&param->cpu_count) <= num_online_cpus())
 			cpu_relax();
-	}
 
-	local_flush_icache_all();
+		local_flush_icache_all();
+	}
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 4007563fb607..ab03732d06c4 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -89,6 +89,14 @@ static int __patch_insn_set(void *addr, u8 c, size_t len)
 
 	memset(waddr, c, len);
 
+	/*
+	 * We could have just patched a function that is about to be
+	 * called so make sure we don't execute partially patched
+	 * instructions by flushing the icache as soon as possible.
+	 */
+	local_flush_icache_range((unsigned long)waddr,
+				 (unsigned long)waddr + len);
+
 	patch_unmap(FIX_TEXT_POKE0);
 
 	if (across_pages)
@@ -135,6 +143,14 @@ static int __patch_insn_write(void *addr, const void *insn, size_t len)
 
 	ret = copy_to_kernel_nofault(waddr, insn, len);
 
+	/*
+	 * We could have just patched a function that is about to be
+	 * called so make sure we don't execute partially patched
+	 * instructions by flushing the icache as soon as possible.
+	 */
+	local_flush_icache_range((unsigned long)waddr,
+				 (unsigned long)waddr + len);
+
 	patch_unmap(FIX_TEXT_POKE0);
 
 	if (across_pages)
@@ -189,9 +205,6 @@ int patch_text_set_nosync(void *addr, u8 c, size_t len)
 
 	ret = patch_insn_set(tp, c, len);
 
-	if (!ret)
-		flush_icache_range((uintptr_t)tp, (uintptr_t)tp + len);
-
 	return ret;
 }
 NOKPROBE_SYMBOL(patch_text_set_nosync);
@@ -224,9 +237,6 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
 
 	ret = patch_insn_write(tp, insns, len);
 
-	if (!ret)
-		flush_icache_range((uintptr_t) tp, (uintptr_t) tp + len);
-
 	return ret;
 }
 NOKPROBE_SYMBOL(patch_text_nosync);
@@ -253,9 +263,9 @@ static int patch_text_cb(void *data)
 	} else {
 		while (atomic_read(&patch->cpu_count) <= num_online_cpus())
 			cpu_relax();
-	}
 
-	local_flush_icache_all();
+		local_flush_icache_all();
+	}
 
 	return ret;
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
