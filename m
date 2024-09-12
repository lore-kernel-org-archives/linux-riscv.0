Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2A3EEE271
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NV7aN6IFoZmdpr8O7J3AeTtstOCokVpy4kX1a0jtrJQ=; b=isOXNKHjB8Hy/M
	lzuJkr66b8RAOd1Y/ftHnW82k6glXtYVWu8uvCKnhbEm7lpAM/5gH4+TM5Gk7Y/g+pKfpShMamWtP
	+JlczxoVQYhEw0gJeD8nRxszJ6ooLa0cwsKJDzYi+hsgasdRlT83Uwbaeb8xedOhAamhLmTIFerFq
	oWsDRajePgeQTQbym2r+DF2AHYiP89w+eoLORGbBRMiCrc4Jyq5679oiwGrZwb03iQ34Lwy3QyMP6
	556fiw20y8blucpFzin1ByET+22td/PwsK6/DEt/TRD/jXi6CxIZo2bXWRj9I13VpLGD1M05TpaGM
	5CeNd2OluOmkfKcmjkGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot4Y-0000000ERWk-1RmY;
	Thu, 12 Sep 2024 23:17:58 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot4M-0000000ERLY-1M9P
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:17:52 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2da4e84c198so1123452a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183065; x=1726787865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4VD0pn+7fxYAYMmu2vkxqQSkT8TrKqfbPDKikIcbYI=;
        b=X5sipqn83ZP6Hz1nmhvV8pJPqSzCs9Un0byO6ozJuSpUwyJREmAMfUT/aSSEleGw12
         8W5gb6sts9kUvoU/N3rLDAeIXZ9O7xygQm7FY3DEB+TKHNo0ZK4bGqdnyo80fcWjOCCM
         m0oDrUO4NfOnMMk+jbbQjlYno0cjbL6EijEjUGdbr4XWePpEI2IxsY8civJyzS2/BqwU
         ebEVh9XoysYlJW5QC9ot5g6gX0lInllearUDeQzaj5GnJ9px8p7DRyEmZ4u1ZuyuJqyY
         giWGeGRQtwlM5bbRZok3tLgS3DN/904s/n7C24StVRxYwirnTdwOM/JKt70VlSwwwBbY
         G2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183065; x=1726787865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4VD0pn+7fxYAYMmu2vkxqQSkT8TrKqfbPDKikIcbYI=;
        b=p99uZtYQefPTs4q8losg8L3FWrCnddDwFGfGz53kj8JIaxeOV8Nne40e1FYuughote
         /iN+MaFbsZzs8dc8zZ0wU4jeApqfub7rQNwwi4kbE2GkAzVY9d8Vw00qVH+lLGRSBK+/
         M0C1ri1WVCQcZNRimvC5VjZDEocU2fh74axpV77k2iyef0GvXBP+vgQqDdNdsD1PJWw8
         iCgouoaFtK4tOLZDnIWTJ2+ZHxTMZLfU3Rmw2oO6EyAOttC2uu12UVjS1Z0y1vna4vl3
         EjRsUHQr+/E0+NZzejjBDZ3fQGw0xk03/rGRQvbXElLasiGUcWx/pFdwNEECCXUOrzFn
         6fmw==
X-Forwarded-Encrypted: i=1; AJvYcCWMN0mjfovi+Qzx+XXgwmxZAU5NVsG0I5ak7VvzKVrSl5vJTqBTfHhEhftNQ/TFkVWtep2M2VoL0zZZRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy56gIbJVTCg4JHnLvf+h/F5dxCinsP8f5KgxkhhqfOMxX1XV9a
	vttxcEIBE/xb/s03IBoCx/G69Yuea9q3br0b2G+lOYiRF8++edO6DoAvpIjhfZY=
X-Google-Smtp-Source: AGHT+IHE2/uUipG3AbFYQLbtsQ6XTH0oLyDxTmTJL8HOpmNqW0hVQmxkI0Zi8FntOLvceExzi1MfEA==
X-Received: by 2002:a17:90a:c10:b0:2d8:f7e2:eff with SMTP id 98e67ed59e1d1-2dba006821cmr4395000a91.36.1726183065339;
        Thu, 12 Sep 2024 16:17:45 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:17:45 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 09/30] riscv: zicfiss / zicfilp extension csr and bit definitions
Date: Thu, 12 Sep 2024 16:16:28 -0700
Message-ID: <20240912231650.3740732-10-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_161746_415140_1AA48411 
X-CRM114-Status: UNSURE (   8.20  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zicfiss and zicfilp extension gets enabled via b3 and b2 in *envcfg CSR.
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS
while senvcfg controls enabling for U/VU mode.

zicfilp extension extends *status CSR to hold `expected landing pad` bit.
A trap or interrupt can occur between an indirect jmp/call and target
instr. `expected landing pad` bit from CPU is recorded into xstatus CSR so
that when supervisor performs xret, `expected landing pad` state of CPU can
be restored.

zicfiss adds one new CSR
- CSR_SSP: CSR_SSP contains current shadow stack pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..af7ed9bedaee 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -18,6 +18,15 @@
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
+/* zicfilp landing pad status bit */
+#define SR_SPELP	_AC(0x00800000, UL)
+#define SR_MPELP	_AC(0x020000000000, UL)
+#ifdef CONFIG_RISCV_M_MODE
+#define SR_ELP		SR_MPELP
+#else
+#define SR_ELP		SR_SPELP
+#endif
+
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
 #define SR_FS_INITIAL	_AC(0x00002000, UL)
@@ -197,6 +206,8 @@
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -215,6 +226,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
