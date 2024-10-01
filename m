Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17605CEACE5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diTKGxhXYP/61tczLm6KqYIXrkKZVqX3lJ7bNn+2kEk=; b=gKLnMPBbOYUXaT
	7zeSzOoKG0bdxt0EJlZY+eR+aEtiZ3p/t8nM47BLaWQkuFyQS9QPH1kvBBVd8zwH6+lpEMEyfTqOz
	WE4zCmUPMkB9ecYF/NBTFgen4IdpwLxhdupYJSGoohMkzsv95UAG6IdATRLQ+r/NwHfDPtwquQPEJ
	8oMH2QmclouytyygkOXSKWP9UYEXCxa6aMY0AcAxeiccg9u0rmqNWQLl9OXkkuOxDi/kH9LxJ5mQS
	O1LEjeLzAbo/nJtyaFJhdVpwM9bikZUXCX8lxspO2O0xAP8rF2uaNdjjUjUjxGDD5cW4ogo6FIXES
	q9Nh0dtNgYaAyzcxFMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfcb-00000003WL8-3SA7;
	Tue, 01 Oct 2024 16:21:09 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfPx-00000003RSU-00HP
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:08:07 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e091682cfbso4247988a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798884; x=1728403684; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDZ6InrT+eerMmZ4qSLMUgeWEoIog/HDXgAiPQQVAR8=;
        b=yB8VMeot65DBzsg4FqJ/TL63arb/qIMQYYj4ji7aiARj8SvGHtB4AjLOgIg5kNMrFH
         l51XBpGdlZ9w+A7G6pc5dRKraHmmmHkLhzCMsjgOTYj3oHZqt2jbRe30Yvs/qOt7Yn2W
         jjJfNe0kgIXycSH0GbneylcIQXijwPGFVggfmwd9wrRk4k6VBPtLrGkjopBAQmk3NgC/
         zomuTmgrUBY3+6Ipx8oSpsZDSTm5Ls1m2PhidM2LAm8gPyR0wBbsA5aknWF7Zuf2B7qs
         cX7w+S+JyoIa+ORLX/fj8u0+3z6JVb2haRepmuiOx2MpyTtpChf9DEo0Rj52zBXB2kbo
         3ZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798884; x=1728403684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDZ6InrT+eerMmZ4qSLMUgeWEoIog/HDXgAiPQQVAR8=;
        b=GLm5rTlLnUnhLvAvsWlCoT7MS1ElgQOuh+qogilV2X93N4k+HvM/aoCI4t1h3CBa97
         F2DBSKcHytCtL4IKCmohdb+H1CVH+64p1Q03A9Zl9XPXDnc/qNtwtBeKRmfzEP+0LqBv
         iohXnrnk1DBIanBaEDeq6E3+c8ehNsq+wJxpqUblsI7MDebPO+01DZDe8gCS0UZpVPKy
         F2WHvTVlm4VZvTRmHAYtKnoUhbulzc82wD54TjQWN1hZt4JfoXEI1XLZuUtEGi0KUVAN
         pUJ3Au02w8OzCAYZRMoXAqJxmB/JuW/D4H/LGz9UO1wMZZrfay8QnUwN2QYyO2bELoYm
         DDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNyckuM1q1h/4fOgCTS1eIJeujxQnyGHk3maOQoVcNl9JqVU8cbIxYwJ7MwgraCuIPqtEJc3g8elJtFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHBg/Axe3YyQyLhTNzVfxy2+K3ME3RvHQq9lVXpmuotNXH/stp
	3SsGjtRVrGsyw5YMlVVwiP9pmsunm7svW6P4hCRjMic52XeS1mGrqKY6+SuDljk=
X-Google-Smtp-Source: AGHT+IHXYXQ1OwFDd1dtv/2VxG8PWP7+nvRdzMjo+9YOaXZGTPtIIOVqtoUXrRFuXQYTqOg0fWXwSg==
X-Received: by 2002:a17:90a:4607:b0:2e0:8bf4:f298 with SMTP id 98e67ed59e1d1-2e182cb9256mr279683a91.0.1727798884295;
        Tue, 01 Oct 2024 09:08:04 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:08:03 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:29 -0700
Subject: [PATCH 24/33] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-24-3ba65b6e550f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241001_090805_104116_CDF5C521 
X-CRM114-Status: GOOD (  11.79  )
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

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 5207f018415c..6db0fde3701e 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -89,8 +89,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
