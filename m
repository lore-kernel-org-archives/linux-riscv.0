Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB5FD3ABFA
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qzgpChlw8/1yYID2hAewb5RQI4AxcdfGhh9EL0uK2Q=; b=ynpiphSP9UPq+Z
	eXZsO70eJUu+fNcM7SLycbnufk7hrUAR1QF4vGTk+DF5ST1YpytPSvuS7np+661cfdemxqx+gD584
	Mb0GBKp96Yy0b/LbsWszSFUtAneHmxjwpWQ2Dx1tMWWG18Q0oQ24E0bfDzvFrWcVKSWfInz7MErdZ
	fhEwnD0nRY7pAP8/WZ4G1AeCLhDLTyP0cuE0K66FsW7MzLgT4qrGt2OmJKzUrrLySvOlK++o0pQ9Q
	MyQNb86ONByKdDMGN1lZz2CQ34S9Vb6kUj2f1zyKE+I7pU6HlErcGcMhM1jdSXri4Bf0Cg7hHzxsM
	HyvW9dFHXcXq2w93r0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAchM-00000001TWA-1Z86;
	Mon, 11 Nov 2024 22:15:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbQv-00000001GCc-2nlB
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 20:54:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20ca388d242so49912915ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 12:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731358489; x=1731963289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCvJScsVwtSSPvsUmMz3Q3/hMnyxUHsF6MHlE4BY4IU=;
        b=hIBceXpYHAsmN17tL11TIR8wOBxAY+dF2pPb0Ca3ealCMZgSiB7krxioY936O1XFs0
         gGhDjj82+eauw8dOm7clzCBTLyyMWlpGiQJkP3UyAifEyNoBhXygALhHa+nTKYf+YcLc
         SnCR5swDRrcHTDUTZCOnvo69CCY5dKjSJ87p3E2qdR2/2vDLaiq8+o+tfFMIhaJB4Eg1
         +RrmdEoSMMU8xEQ9NscOTVVb9BogxASqGzMcNqTJTfdhbyE/fRriqiOzY3wiYSEIiEg0
         BEtmaJAWH1cAvqE/BOFz3WM0XeRgezoPlBlimjTKfYRuxi1BcjnGZWaHcMrERfswcvD7
         ivlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731358489; x=1731963289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCvJScsVwtSSPvsUmMz3Q3/hMnyxUHsF6MHlE4BY4IU=;
        b=RSFhzO6IzTzls193XTN+VQ0NMIs/qHaYWctieRnCjZISlH8ogv9FMkuSsnWUd+52e/
         /X87D0j2KVc4I4EsYVDtnuOQJxsPYbRKbBn14gUVs7mVNECj1SFqbTOSM8tmnSsaIFMW
         jTe1jFUYy/PBbhpD9PbEg4PmTpZGRHNzZFvh3C5hgmsVPX1fUgs0Z70UKuzstOeoHZkc
         XzoULOIKRP8ddGrzE4xQ2OsOHtMG5MiuM+ycDzG/Mof1TxH9tW0NZZlIR3xVXP/ppXn5
         syxJi5gdXQ7RAMy5WZnFth+jlHCtlvt7nzd3WFXJnkUrSunRKcBCvAG6Zm/70bWABAaR
         0q0g==
X-Forwarded-Encrypted: i=1; AJvYcCUdU/wZH6A8CvAPMd/nKNGolaNedAARtt66Pd6Nuycn8QddH4T6Sl7Ziqut4eI9vljnsl6ZMLXRQvFNpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzR49H11Jof4V3GI6waqMB72kDUbBvNwdil3eR/1zpfcxNT+eQl
	RnlFNHALdw65fuhDC6cXn5xw/x7zBi4HdgOBSFLuiA7/8Z1QIbR+L4ibh3SX1Tw=
X-Google-Smtp-Source: AGHT+IHDimCQOVgf3cz6B2MDVaQCn9zqN59aHOrw12G3nQFTvSfb8MPteRYBnMY91dT3qMMvMiS9YQ==
X-Received: by 2002:a17:902:d482:b0:20c:8f78:67be with SMTP id d9443c01a7336-21183e11a8cmr198773145ad.40.1731358489062;
        Mon, 11 Nov 2024 12:54:49 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1534sm9059974a91.42.2024.11.11.12.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:54:48 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 11 Nov 2024 12:54:05 -0800
Subject: [PATCH v8 20/29] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20241111-v5_user_cfi_series-v8-20-dce14aa30207@rivosinc.com>
References: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
In-Reply-To: <20241111-v5_user_cfi_series-v8-0-dce14aa30207@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241111_125449_826918_AD87C687 
X-CRM114-Status: GOOD (  11.08  )
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
index 226054db6c42..1aeb5c08a3c6 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -90,8 +90,8 @@ void __show_regs(struct pt_regs *regs)
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
