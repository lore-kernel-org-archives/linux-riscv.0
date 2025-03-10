Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC692C28B2E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1u0VIQ4NIUXAEjzatnUQcz/1UrmCmOCCedYEOwwYYk=; b=Twi0cHhPsuAs1J
	dAhc3EfSPCLwhL/0CqzMeX6ceVVYiRT3D6O2NxNVDeQ3LHjtyWSL+3AZZRxBhynLoNB7GOj39UIWW
	+DJ7836Bw+GplZYwp7zI0Mx2WlUW10SDD0xHhdo7gMI1Y7uW/vPkpFmbGFjJLw38FmZ2difLUVF9g
	HpYTepubtK43ZQrv1JAp17/34tiYupWgX2s/QAZvTexrH2mR/h0giJeuv82xHWumSu7zjd6TIyhW8
	Hl8zcg/hIPZ8BfXCbZsH5BOVkD02jMs9Mc7r25Cect78AVTuFskZ1YjxQ0NqOPtKHzANc1mXCoqJd
	lUo3MdJjmN2UjnqKXHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfHA-00000003DmC-3mjm;
	Mon, 10 Mar 2025 15:42:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treVL-000000031ql-3Ez1
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:53:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22334203781so95792065ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618399; x=1742223199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEoq6zqSeLFMaXOoiuM7yp6ZSaKHVlNR4X3PvApIHRU=;
        b=iqrBJdukIaYCx039bRcMFJ0Yz+7b2vI6+bH4DPZyAmBZNbPlnNRQ50BJ3bOrXW5pdN
         OsuqUaLVd6tP48JGiqjM5ymvCc1o/f/3TOptoX6mHplf2oMf43AJC8MMVMJ0q2rp5UP7
         puaTEPDBp30PC3Yr9cGIwLL8gTt71OwJzUSwWVthRsbfeKDlVfV4LEmOPuwqQSkRDI7/
         32TAPD9HuhmtM+EOK+PtbXxLGyZYl+ZmVztBMl9I2jGmcuazohtT5RDPsFVQB+L+S4n7
         FqIBm7xu027afJ2X4sszIZ5yUaeY0cokufM21kZ9jR1sNIlHcgt/TSfjy1nmVJLL+yVg
         BlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618399; x=1742223199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEoq6zqSeLFMaXOoiuM7yp6ZSaKHVlNR4X3PvApIHRU=;
        b=F8dhB4Rc/7TpLZIRcmHEbY1ZcFWbc/NKmjC5dnfxAJ6LvggXA45HzqMsVXkGIsKwRk
         QP0tGAhqsNoRpp6PZNSP6O5Hst21SVGNoFTQrBZ+YjJp+PcBSDc1RTTXoXd5D5C0XQYJ
         o/NCLDa/egiV9jbVYhvoUNxPGrqGqTtNizied2jIp0p/kA59iHDu474wH+vVhZ4+/zer
         0kRphIK6rTTb4eH7Bx/Nuockb1iTl3iTBR4RNy4F/LRC9j6AompitpNAW1rUUwc6uCUp
         AZGfPW/cXyU0rjbpkAKNBHfeLHq77PG7nO5tcbq2AueNyDXMBtO+qD3AKiV5DukIAl5n
         hvsA==
X-Forwarded-Encrypted: i=1; AJvYcCUbJOGybHuDHqUzAjpS0JAyWL39dfwFQF2to1jj3swz0bsoHrEUNyvcNIDapareyDGyBhWVxdo9qmJ5Pg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/PN1Qw9QzQDjbfsl3JbpVxb1IP7HBCvWf9lxIwM/eijJnTO5D
	5chGlw/gq/PlzmY+kJIJ6w0PxI+/jQIZZp7/8fylL3P/vkgHg9lUUgkMj5pWMzc=
X-Gm-Gg: ASbGncu27jiUaDUwhVOzk+vXFKzjnRktBvYnZZuq4ip/Vsj3llzVKpkD/eayCrSrabm
	NXbyFUv8/kq3YInaLRYfij9hKBU/0a4jQ06RodkcWSWTDmiRg3YbkixQiswLA9Tyta1OCtxAMqb
	E1+ZoGvIVpqziD3LsGQgjMJBp048tzYDcuTRngksBKNn6SD34++mwtWg5uChSndQDr8ckuoSYgN
	1yESWmyNkvBJkRy/HeTt//ssAedQMW8abW+/J4AGuq5jQByfrzpkhPPSIf1albm7qnvt3DOy3Zv
	e38Aux9srPHxo++pamkzPaFWPznebXfDkcbMIj5gXqW0t+KgdBspdNk=
X-Google-Smtp-Source: AGHT+IEx/P9VhGmpM9Qve+8fxlnJz5OWfBkRKBtIDANK/IPRQR8t6D11CbRKG5Xc1EPx3A5RF0LL1A==
X-Received: by 2002:a05:6a00:2b4f:b0:736:b923:5323 with SMTP id d2e1a72fcca58-736bc0fb12dmr15850983b3a.10.1741618399230;
        Mon, 10 Mar 2025 07:53:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:53:18 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:41 -0700
Subject: [PATCH v11 19/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-19-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
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
X-CRM114-CacheID: sfid-20250310_075319_806413_9916CE2E 
X-CRM114-Status: GOOD (  10.21  )
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index c3c1cc951cb9..c1b537b50158 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
 #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 50)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 51)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bcd3b816306c..d802ff707913 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -108,6 +108,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
