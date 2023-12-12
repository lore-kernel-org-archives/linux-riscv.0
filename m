Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC1BC4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 23:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wgjKWd6YiBgidmGM0u5QggxiDTmDSIqmXyAvY0RNNe4=; b=BmLhXknqTjmzX3
	cRyRSIjTrlwKVqYmwlzxnbI4eHy8l9XcoN/D7l2k4EDJsudKv6LvBf8LOSf3AZDMgcXc7jkP1SPTg
	Y6/z5OvDCuhlfLe6ZObF8PSgK1p9oI5hcCAuXSOA/2Em19ReRTO42HH7SXFHClynANwH1dqwyHWBa
	H63UKM5CFx583R537ZIIutvFyFnid558wVhO3ts3jmdT5ePcu4zAjEcrntCZbh8JFLgE/MfNTzWOR
	EPvVNmT+smA0jmXHFrt440Ufe9HaEW08QWVm/ftqy4Ksl6IH+tYxA6pFaVGdQ+0pD7XE6GOzM60KA
	iDJ25/c/q/IQsCJUe7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDCWg-00D4rJ-1V;
	Tue, 12 Dec 2023 23:50:58 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDCWd-00D4qZ-3A
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 23:50:57 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6d9e993d94dso3743116a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 15:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702425054; x=1703029854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bp9tJj1SA2bMEiEs1rPeqlO2QZ9OUerkC/ZIE58TG2c=;
        b=swmW3MEUKCxZ3Eb6g9hlzJHnteuYg1qNk1OOkoP7FR1/M0M9+IqvvVeHg+mSj3GsiZ
         ifgpgqf+CHdS6HobjYNXUe/OjrSUEVtCGrlixSJ+EdYWCvh4dacPYHpxSqRTE0VB14Uc
         +3Dgb0sE06kN/Wls63IjTayif83HWv7Y059IeIm8jhDzqk/vIea1xFQ+Kyt4YKa1ElAk
         iZx3RZfj5QFMLrsZPhGV+24kBvGB33CyhxvZqe7lOWUNteNppuCCdAzw3e6Svb51QQZU
         rQtD6x9/tKl/7OWJpOdTw+6SFeUrTutoMO/O0uPc38TKyY0DYXdwdpE+hM8aOIOtSTb/
         PkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702425054; x=1703029854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bp9tJj1SA2bMEiEs1rPeqlO2QZ9OUerkC/ZIE58TG2c=;
        b=EtUeyTMp45M4HLfUtOD+fgvRjknbj4PSapS8Yypwnw0U/rdb4InzKfm7+L3+e3JtpW
         tqLgS7PKY9LJbt3wET+SptvQbAQOoNJ7koYMyNLKodrQLJN57dDfqyxAVW0AmDi0aYY/
         VPGLe4KADS5BTFIjD9wMbNZxOLCozz7Pcz8mh2hDN6J7CZpG8pfb3g8SEkdXvs3U26zo
         KHor1UGnyWoAQlosV6/OycSk2lmHO557ssRI69L3zFRBpPXqUrHGfeoS7TkmcZTppIki
         8KsbX+9b8wO1TCUksmcn/49Oa16YKCrrNUtJvTo8Ku4khQXhKah+cMmEeH9qCUK8PZxV
         j4Yg==
X-Gm-Message-State: AOJu0YxPhRCE4Yh1glZ76HI4r+NrLQ70A9tTNmV8+ZIU2Jb+IwRnoXLY
	CIIuCk6xX4QYBBSm6FTopKh5hw==
X-Google-Smtp-Source: AGHT+IGh85uH463Iu9D54CRbtbVHNWF3hVBSci6l6H9BBvasbfpo2uUNVt4CcgVWpqRZVCZKUM7zRg==
X-Received: by 2002:a05:6830:1e04:b0:6d9:a337:b639 with SMTP id s4-20020a0568301e0400b006d9a337b639mr5749974otr.60.1702425054446;
        Tue, 12 Dec 2023 15:50:54 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id m19-20020a0568301e7300b006b9cc67386fsm2487295otr.66.2023.12.12.15.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 15:50:54 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: 
Cc: Deepak Gupta <debug@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Evan Green <evan@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] riscv: abstract envcfg CSR
Date: Tue, 12 Dec 2023 15:49:26 -0800
Message-ID: <20231212235003.2036221-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212235003.2036221-1-debug@rivosinc.com>
References: <20231212235003.2036221-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_155056_020261_AA1D8A35 
X-CRM114-Status: GOOD (  10.77  )
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

This patch abstracts envcfg CSR in kernel (as is done for other homonyn
CSRs). CSR_ENVCFG is used as alias for CSR_SENVCFG or CSR_MENVCFG depending
on how kernel is compiled.

Additionally it changes CBZE enabling to start using CSR_ENVCFG instead of
CSR_SENVCFG.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/csr.h   | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 306a19a5509c..b3400517b0a9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -415,6 +415,7 @@
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
 # define CSR_TVEC	CSR_MTVEC
+# define CSR_ENVCFG CSR_MENVCFG
 # define CSR_SCRATCH	CSR_MSCRATCH
 # define CSR_EPC	CSR_MEPC
 # define CSR_CAUSE	CSR_MCAUSE
@@ -439,6 +440,7 @@
 # define CSR_STATUS	CSR_SSTATUS
 # define CSR_IE		CSR_SIE
 # define CSR_TVEC	CSR_STVEC
+# define CSR_ENVCFG CSR_SENVCFG
 # define CSR_SCRATCH	CSR_SSCRATCH
 # define CSR_EPC	CSR_SEPC
 # define CSR_CAUSE	CSR_SCAUSE
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3785ffc1570..98623393fd1f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -725,7 +725,7 @@ arch_initcall(check_unaligned_access_all_cpus);
 void riscv_user_isa_enable(void)
 {
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
-		csr_set(CSR_SENVCFG, ENVCFG_CBZE);
+		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
