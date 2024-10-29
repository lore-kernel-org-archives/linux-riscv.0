Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD44D7494F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0B0JAhGLEAlGJxD/KrYuQdEqhot6apED5UZ5kTltnk=; b=1oRLzPi9KNgPL9
	GUqP0gGEZCWZa/Tny18aPnASvv/5OGq39Ujv02K4kipLoOz8rchlyYsb65Bl+lb6JJwDUSwIlktEA
	bHMLY3z0X3qoYIr+v6BSgMkkYjD7Q1cAtMnOXY5J0vYNBuumW/AQQYqAcqVoas0e3HsTQ5X3fsFD9
	yT/8VSIwtY/NhKnf2OKvfBVkQrsi60eKqoxIQVUuOu4KSxPq11CrN5a6I2iKdYRaN5+i118+LjDKf
	/gTI9zhiqccRhnJ0AivLtY5gip/hRjz39+s7Bpgl/BxZFeCqrYxS9ae09wamIKUTUIQKkIGxkm6HE
	YA6adNprzMbAaRSLxeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vua-0000000GEkZ-2YQI;
	Tue, 29 Oct 2024 23:46:08 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtk-0000000GE0E-3KoB
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:45:26 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso4330529a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245516; x=1730850316; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2F6Yb7wvkADRBV85CoJaexMx2ZeCvBhuuEpWc4ZWwJ8=;
        b=j9akrDMZPmejl+KNj6zmP0q5h4NrirbdlfdjynE2KRpeZCWut0ZpejhHtrTgY3r5lT
         bTp4Rl3jjWliNzj7FGEfBNuhmiKP2Ljcb6GBirINfdhjeUW6l7q/u0gS6JZ7r4GI6AGS
         KKOSVhknmqT8Dll4eCQOvwkmKla5G5LzeIuRmqNOyxTJH4xw7SX82x0JdLhIcBMQg9zy
         CDTaGx8yg1dFZkJbFg3vLhAekPFCwiLbBksNWAbYkiZ50XwsfVJVYVhHaldYpn3f3Lhd
         /kgge8mRo4LGQ2B5w5lL/DgShzesETrEt+md7gn5o/I4eINUYrM+n/2KTh0e6D7YRMfN
         RSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245516; x=1730850316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2F6Yb7wvkADRBV85CoJaexMx2ZeCvBhuuEpWc4ZWwJ8=;
        b=FT5SnKyXFIURlXGDPgc12Gryu/DdOFw8ROVOTQKlhUc7Crqz3j8Oy2/zirgg02WZ+m
         +q9xgKS8Mib6ZsXmcEMTiB5uYpGuldXh6GQ5+56XFbPmo2GPDuGTzSdhfABRCO0pgmjc
         BKVcWA0QRKZOdpRvaZoPz28giBvflQ5f4gBh7mXBaWwQ/TY0478E1f+gQYE9Rw83YDYW
         A74sFbfe6/4bl+yyuc/HbUrVaziAMkmyj7LgJtwdmbTOWuWoy4AOVMi7Yb1L0oIA67+c
         +qLTWpT4SpPswJeWZ7a7CnX3q/FsCrIOGAOWXx8lJDi6Y+gVdjxu6RMaHF9UQ1aYHnLI
         ZyDg==
X-Forwarded-Encrypted: i=1; AJvYcCX40JpiHJldQC+segelrtHPPyh7JXPDT6lJv7GM4B6ImXFlgOUWR4tdDNSfwGjN4Y21bn/5aHtVC0RNDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPWmeQ0jGp+ALZVFZ93SHEAMk0RilQNReoxWVt/CyQlA2fMEVs
	I/URdiDOqeGzfAtPO52v1jqedi+dFn5IgHho7Y1OpA0BMrdCmqAKjgvy+Ra59QM=
X-Google-Smtp-Source: AGHT+IFymY57Q4keJ+3CC+aQlV02UPkTqGn3YIXKiyS+cNgyPpergOLYnge8dObsMTdwpbmiiUHDiw==
X-Received: by 2002:a05:6a21:3a85:b0:1d4:fc66:30e8 with SMTP id adf61e73a8af0-1d9a83a6524mr18658257637.10.1730245515950;
        Tue, 29 Oct 2024 16:45:15 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:45:15 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:23 -0700
Subject: [PATCH v7 23/32] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-23-2727ce9936cb@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241029_164517_108990_4F4E011E 
X-CRM114-Status: GOOD (  11.41  )
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
index 013bc3805afd..6eb4b8e0f07e 100644
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
