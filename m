Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC50BC67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdIvtd7lrwDauwwOqX9Ma4SXeRgu4VAE648troM/z7g=; b=ZXs6rHbdtCHv8u
	5f+kAaP3QN4zUdw2TPECpkMIMsc083C315XfFn9whDfvfiHokzIoQKZw3BpUsXVdGbzJeNymwpaEN
	erPnqB7KZxLrzWqkC+nGcWAyuSJk0XR/giwU/MIExMlDBX5PMoe8vY9ou62aaMaF9v0g4AgTYC4Qk
	m0vfCww3AwZKps0fHUA5E1GMvJAfQ5A54maywYNEIeYH8hnMQrVHRvOuYZZwQ1t0buinxCSFTaoWH
	ACqiLOtC4cOo4VxTlUB4h3zaWKvgrNrw/450xXaw78iqU98apxJ9ewctdUyjjdyh4pYg7O3q9iUns
	/7HF/oZiDFPZT3ypaROw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iX-00000000W0c-2hDM;
	Tue, 09 Apr 2024 06:12:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iJ-00000000Vm7-0Zl4
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e4266673bbso15469545ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643119; x=1713247919; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcuZpfGRgGO4PsnKOQvZ0/6LAFx/q/APYxPAcu5uNV8=;
        b=Vd37PgVGI7+q7xUWdvCnDjawPSzOTZFkX4itpLUuCK4BdUZ7ztUu7Xo6rAWPblik59
         HXW4MWgswzOETFn3OppC7HmC9pU9/pflSeKgUUqHe9GkbT7PQsJ3jxisrxV2qI9ktDH4
         7F5o3HGI/Pjn0a5thST53w3JxocBqWEk/mnTYXci2t3gCQ5Q+c7wL3LYag8xngjaBvGo
         v5HhG4lPIB+1t9J38yDfCRwUZi3tcWyCj2tf+nAs0YwuVFHZz+D2Aa7e+IHMSiChwxdM
         uD4C2ZGCmPkm4t4NTRG/npeMDheKsusT3fC70XFoa9gAAgRIRb82JE4GTyxhuFjUf3cj
         sEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643119; x=1713247919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcuZpfGRgGO4PsnKOQvZ0/6LAFx/q/APYxPAcu5uNV8=;
        b=YicQbdQo2dP7RJpB3uW4TzKmY2hGwpn/+qqikePd4zTpASg1e2SaD6+d/OMdeX/1i5
         Fj3Rm+i5Hs5AnMKlW4xqcB8uEXUQN4OOhMTXcALCFotaIXtp3LXzu9IcqH4wnVKNz3au
         kTY2BG0sKbcMKslVSYdq/TeLkDdAKGP6Q9fZU1hh1mnB9TpEQPN4GNtm7JVDPYnV4ARB
         rR0MpWEx8TboemT/FjGFjJMyJhK+TYE8ouyajm3Lp9e9hfDgX3qGC0LSWhJ8uvQjE3u8
         IqVmL+mcxkLIiqPXa5Nvj/D+1Cg8y4CL5AKoIAuF40TdFUvzOD0/5Og8WkF0OuWG8uIV
         MoiQ==
X-Gm-Message-State: AOJu0Yw40bsIreQ1BCmhAb8oKyHqkseKwUoMnuQLbOY+1tnR73KGmywf
	mPoNzQPxqw5KL8chV9aYyCq7tP8YQnr6heSsAm/SRKCxnrMIDCAP+F+nadM6jGgq6sB0dOTgkc5
	k
X-Google-Smtp-Source: AGHT+IHz5LLDJm9L/ug/kMuH50Vd0ygUg9H1jlsD50c28BOoXEgFzWtj54FZrZCvoiYay1yGeroD0g==
X-Received: by 2002:a17:902:c401:b0:1e4:6273:bff7 with SMTP id k1-20020a170902c40100b001e46273bff7mr3872287plk.25.1712643119038;
        Mon, 08 Apr 2024 23:11:59 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:11:58 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 01/12] riscv: zicfiss / zicfilp extension csr and bit definitions
Date: Mon,  8 Apr 2024 23:10:32 -0700
Message-Id: <20240409061043.3269676-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231211_198675_C50F4269 
X-CRM114-Status: UNSURE (   8.42  )
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
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..9f2b2722b67c 100644
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
@@ -196,6 +205,8 @@
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -214,6 +225,11 @@
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
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
