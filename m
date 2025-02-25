Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646A0C021A4
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 02:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FgJObG88hC7LCtq6NZMFXjUEVipWbGUxL0mtvsRsO8s=; b=L3grQ8nV0hMhg7
	th0afp//jtouXUsnyt33NITvcxRtNP22bhDxiPxVuTVAtYL3YUTeQLjAFbchpw/+b4v2C7Gpr0ljs
	79EsKZVTGNjF/OJks4oQKdhvY/lYGdlntU1BiEA5uA3c1Z7bPmtptJG03nFxh2u3LU+3QN+KFwpRg
	a0WcpXJ0LS5hWn9LbXwm1GdcHlBGxvAsty/6IVJmZSAF/19cjE3fAvgEzvQZdZsTFgWNt6a9mK5TE
	qvcPOzpBEj20S4R9qzwaXaCKKPVziKBLQVlmoeRQgaVlL64gfI7pYE9wIiUUlX4BH0rx+nym5veql
	emVYK/QBFdGnRsTPyThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmku7-0000000FoqC-3F8W;
	Tue, 25 Feb 2025 02:42:39 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmku4-0000000Fopq-3drB
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 02:42:38 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2fcb6c42c47so7941139a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 18:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740451355; x=1741056155; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZanNtGerLw/d8sQjxfza/brPslbbPWAc0F+e/+SVZc=;
        b=sPWdGgbd8SjlGKr7RKCl6ceUYvlZcmNaG+ANs1+mlT+S+yeOG//Ly2tUsxmnY9Ewmx
         3KriW4ex0pn0TSoNmAL+LqzXzA7gTB6FDsDX4+JHK8NeWRlyxQ93qA6UG13naNuSXq6W
         Zber/KojkYGFE/rAuT2F8zPB3JHCZ59tGb2Kr+eveXDN68vw6QOJdcP1x6aeDfVD6vWC
         a09bU1LNQADQ4qDbnjb9C9Zn3nXpKzsLHgWtUcbFxhkgivqCmJcPx/HimknhBSDriJQ6
         DK0nPe3MbnU7X7+ChVnQw3OMD7NCxT5DfFxmi9s2z2BwgFvRFnZVzzfb+04OcUgurK1/
         esxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740451355; x=1741056155;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZanNtGerLw/d8sQjxfza/brPslbbPWAc0F+e/+SVZc=;
        b=m1u6a4/zno/ZpK7dI5Ak9iW8Lwz+Xtsr29IB7JFqVe5qorVaTrprucvhYdsfdFkSdH
         lr3P7bmJQmvYfWPHdFvhRAJCPVdlk6RLXrhVZat1je+MlLpa8flYqpbZWW1tvvuk16mZ
         aL3iHzYJl4nRTgQRkpjsvU/LRxWYUHjfiAtErGwAKGF7QGtp8OdoxIl/sizj3/iu8AEb
         CNjtddnqCKmtaDBQXULSVKzXAV/jBb2kM31VYSnE4l6yvkRHByPxAoG0QZ4fF7i+yYoA
         IV4YQz6RxxtJHDaaQ0yFEINUmlg5/6k1iE/eDrgqfW1FMOq5iQ3pJzTjjvJ6D8bdm9Jd
         fbqA==
X-Forwarded-Encrypted: i=1; AJvYcCWVCEdj5bEfAmQw2MAH24bRgclc/FQSmNiRo2KFtQTaPtHJtQPKkp9Y6Z1xG8eTWW4mWDWOsWRec32ixg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+ftwWlxExVmtnRFjr/ej7xjngblEatFAbGja+3mJAFhU655f3
	xi2Trpcm8tK6FmDWAMfmHmILeWPCA/YsNg74BrDaU/D7z6+VySVtBGDSfUMr+2I=
X-Gm-Gg: ASbGncufSS7jH1DzA/fgNFy4LMVZ+QSVggXXIMQx52gBFday8lE4eWDoltQCCfGEQTd
	rp9Z/hs7m4Q+z32ucBMp5SF2Uu3ur3xdfUlCxREUeG5aFBnZhVN5pSO/7Khmx73N9YLyvdWZOXl
	L4C4/DqW87+pnVc4CVXu2KDSTK55MT194omPzUuET+7CipvB5CTWHVufR9dGFPThv3XbMu4N/4U
	xstEjw4HV74YVpw+fh8CY1HtC2hvK266jp7bynKnUGTU32JRmFZuZJXbhvjqebcOUx+rQuccqLo
	Go4n7JJRhwabEDX8EAgl0eQd/os7csbCMjO6e42ocw==
X-Google-Smtp-Source: AGHT+IH9Mpxjv6YP2dwaBxfmSmdJtkTNXmqQrMZT7HWbkyf1jCK+dNT3UgG+ZQDzaPqR9bpDWYMqpQ==
X-Received: by 2002:a17:90b:56ce:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-2fe68ac9543mr2456297a91.1.1740451355356;
        Mon, 24 Feb 2025 18:42:35 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a09d819sm3163885ad.163.2025.02.24.18.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 18:42:34 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 24 Feb 2025 18:42:21 -0800
Subject: [PATCH] riscv: tracing: Fix __write_overflow_field in
 ftrace_partial_regs()
MIME-Version: 1.0
Message-Id: <20250224-fix_ftrace_partial_regs-v1-1-54b906417e86@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAAwuvWcC/x2MUQqAIBAFrxL7nWBSBF0lQpZ81kJUrBFBePekz
 4GZeSlBBYmG6iXFLUmOvUBTVzSvvC8wEgqTs66zzrUmyuPjpTzDn6yX8OYVSzIIgWPLPToEKvW
 pKOp/HqecP9rKXD9pAAAA
X-Change-ID: 20250224-fix_ftrace_partial_regs-eddaf4a7e5ed
To: Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2184; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=W8bVT3KdKXtHJWTSCayGdVWSdCOptjFaSdECSOxAXbo=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/pePaFXX7s2bp3zKU+I8VTyye6Hcs5ZQW55OV0N6vaia
 hpWz592lLIwiHExyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMBFnD0aGFYa+ihbXIxac9TD4
 9vNykqqDfbtqVTSP5KIzEwJEHk4QZ/hnnpNy6V9D9YeoQjaz4m0ray4lp765IDFlloPj0tglt+y
 5AQ==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_184237_167971_7D2D5D06 
X-CRM114-Status: GOOD (  10.79  )
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

The size of &regs->a0 is unknown, causing the error:

../include/linux/fortify-string.h:571:25: warning: call to
'__write_overflow_field' declared with attribute warning: detected write
beyond size of field (1st parameter); maybe use struct_group()?
[-Wattribute-warning]

Fix this by wrapping the required registers in pt_regs with
struct_group() and reference the group when doing the offending
memcpy().

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/ftrace.h |  2 +-
 arch/riscv/include/asm/ptrace.h | 18 ++++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index c4721ce44ca474654b37b3d51bc0a63d46bc1eff..ec6db1162021fbf4fa48fc87e7984266040aa7d9 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -207,7 +207,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
 {
 	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);
 
-	memcpy(&regs->a0, afregs->args, sizeof(afregs->args));
+	memcpy(&regs->a_regs, afregs->args, sizeof(afregs->args));
 	regs->epc = afregs->epc;
 	regs->ra = afregs->ra;
 	regs->sp = afregs->sp;
diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index b5b0adcc85c18e15c156de11172a5d7f03ada037..2910231977cb71dac3cc42f2dc32590284204057 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -23,14 +23,16 @@ struct pt_regs {
 	unsigned long t2;
 	unsigned long s0;
 	unsigned long s1;
-	unsigned long a0;
-	unsigned long a1;
-	unsigned long a2;
-	unsigned long a3;
-	unsigned long a4;
-	unsigned long a5;
-	unsigned long a6;
-	unsigned long a7;
+	struct_group(a_regs,
+		unsigned long a0;
+		unsigned long a1;
+		unsigned long a2;
+		unsigned long a3;
+		unsigned long a4;
+		unsigned long a5;
+		unsigned long a6;
+		unsigned long a7;
+	);
 	unsigned long s2;
 	unsigned long s3;
 	unsigned long s4;

---
base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
change-id: 20250224-fix_ftrace_partial_regs-eddaf4a7e5ed
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
