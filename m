Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA11CF042D
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 22:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diTKGxhXYP/61tczLm6KqYIXrkKZVqX3lJ7bNn+2kEk=; b=qIn5kzPXycu8oJ
	Sh3Fb61bbYmE9Gh5dtBPfoia37cRSB8zKgIQS5AWxPrko5jymANIPEipSf/lOV99SszjBC38yNs4l
	nc2EdL/YIYejtncWPNwIK3CJ3ohbRSD/gX7F2MPM9iBKeW3RncxpsGbmfbEzIpGp1p4G8anAE09v9
	t8mTausuJadvFYehOd5B1CxRWA53AUp7pearkEHOTNlbwIMRRvUZQBLl8rtYdUo1QFvwdj1WW5jqK
	nyDK+3Qxky5vUSVao4LtucwWliCaiXoSL7fmvN55TdkFLEF7kQzvm0bRfB6QXcDl8RJEr7Zr3eKkL
	JVjQioC+7z/98x5+IFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syIrQ-00000007JUk-438n;
	Tue, 08 Oct 2024 22:39:20 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIr1-00000007J62-3XtY
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:39:01 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e1a715c72so554898b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427135; x=1729031935; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDZ6InrT+eerMmZ4qSLMUgeWEoIog/HDXgAiPQQVAR8=;
        b=USdb9F8NTlb3ip6Wzi/GyC/FuU9DJ9JemrIXQNvaKMwI2xjXoNZFFOUUD7CE2feVnr
         fnDh1uSE7fWLrQzpej8sR6kdic5TZM00NraIjZNTkzXNjxcrVdz88xuKPOZlw4345V8K
         1qaMZFbn/dUPjZvCuZPbHzNjaQvD/1LUiqKeO5G1CEvnEYWM/Kg9JTyxU/pnrypN7+lW
         UnxbDJXCpz7iRB8NQ3hNyBrMSBr5hqhAIeAaRi0KUbX27FLvVWTF1tlYhCgpWr2G0AI6
         7QA83hOfdQX4q5tnMUonmAZgzxI3g246ZZEn78FP3IsgVcypHYz4Yg31qZ2eQ25In8CH
         lG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427135; x=1729031935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDZ6InrT+eerMmZ4qSLMUgeWEoIog/HDXgAiPQQVAR8=;
        b=klWOIRofeHS7JzLdI89b6g86ViYDKjdbTnxhsiHx5Fc0PIRCKpqhKAsC1w3trOX9PQ
         ihCYrkddL6GSt3FNx1O0VesGbHORy7zMEfXtYtSMYSLeVADpjPqIIzHUu1P8ufdAgXT8
         53GFpChPt9l04Glgzm/h0RJV9nSiSgl/2dfl3Ux/UIvnfCOkZGJHc782oo0Bl37zHG/Y
         u9z7cv0YRYVU9sZ87eYf+NYkDShm52BW8AHH4lXw+O2ejctYxUstoPZbTvgboLbqAsso
         GlfFEgisqCkQ34XxeBGCUXuYHx7Zn4M+z8NSrZ6i4BgLPEIgq+XlqHPjb0pBwhEu38W1
         5+pA==
X-Forwarded-Encrypted: i=1; AJvYcCXArm1g0A8sW3W0bD/swKfdglmzM+ilEIfRXDSmfE8ONOuP4QN/lP6Tu2loLbDMLGjwTdMxUit3B4pEzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/BtHl5VNkEG5MuleyWjU0MIUW4c/UxVeXRLY1U93BQSEpHrBM
	ocu2bCld6sa73/+X9GmN1zgaOoNgzZPBHp0r/jIVcvcMPBbBBcPrrv4tZB809P8=
X-Google-Smtp-Source: AGHT+IFzhCfWL4XbvpqcLHDV0XpzTcXk+O5rvrW6YFnboaoUbbqBOGRh/OM2xOQqx+du7y1kOQQxZA==
X-Received: by 2002:a05:6a21:78d:b0:1d2:eb9d:997d with SMTP id adf61e73a8af0-1d8a3bc3334mr715893637.7.1728427134747;
        Tue, 08 Oct 2024 15:38:54 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:38:54 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:37:06 -0700
Subject: [PATCH v6 24/33] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-24-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241008_153856_383544_D940BA33 
X-CRM114-Status: GOOD (  11.51  )
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
