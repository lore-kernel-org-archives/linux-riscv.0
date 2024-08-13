Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02629C52D7B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 23:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xJVIR5xpGKhwhPvF316jQs68qv2eh397LltXwAtPlgI=; b=S0+ouBYzp4X4n2
	ZTZOxDEY3g9ttbQOswkFx/yEDb29okw5VRttilJaCp6wCwh/IB7kGiyKVbJqT2EZPAF5ZcVPySqEf
	kaaLU8dn6KYYJmltCE64GOtBJfOuk40j8GjS/2IilVOED9jq821MqmzUY2yJog49IvfuAVna0izZR
	S2jFIr6fkJRGjZLUwnEre6RKNZeu0vRAx103uTGhuGeyZtRZlXt1MUnipEc1HtkxSuzvSrGsEa2KV
	jg7eS5mn5OI9a4TI3EkbkCA9wh48bdOD18ipusEQqSP6EE15hfSbzttXrt0ueNiqaNMeGWCrtkNsu
	kx8pNEKAMhbXxa0Zcv+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se0Xv-000000058iY-1R4R;
	Tue, 13 Aug 2024 23:03:19 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se0Xe-000000058cw-3zXD
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 23:03:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fd640a6454so46593255ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 16:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723590142; x=1724194942; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQV0MiEWzTrgzO2mz9iNyCN7xzYIt4no8L46cKq432o=;
        b=A0mFCJLMKv+vexGh88+LpRTFYRcuCusyFHaQtUfgPush1yTOm4t2UAZpia1nmBo9BK
         nXQdqt0gdG8dAzuSvThG46vwtrNB91aflcmpkEJKzoEOuffrQFZvEP28nqojTEfbIKJX
         IND8yd1LvoLQoKbubq7uTRBPIuGIJPmzenNtaDHhcfkB8qBwanKT1irO+MkmPlKzaOX6
         wjni1TFtC2jv4Q9gMh+Dw4nSP59pOZea8gd7na9Q+t4/WhL822r5XEPQDBGIuK3T94I1
         k8756qph63PfdUck4ixqWWp+QuunwYDzx5+Z8TCL/Lo0j1vSIdhGAqvR13amGXK2uP2P
         y+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723590142; x=1724194942;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQV0MiEWzTrgzO2mz9iNyCN7xzYIt4no8L46cKq432o=;
        b=MwGvhEyFbuCel+8uwSiZKvElxBDzcSdddPbUh+2BxsrnM3JTSx/k4NeuGFVIKQ50YE
         R/WUQOyE5YifDe0IlcRD2g9L6K6n1ruiWEFPl8ppvpHDyz0g0hbyFsnXYNB4UXWV3Qjl
         jIgSM7Wy7GJ1X2TmQvaCj270rtxXIF5SZNwtg7HJJFuo1v13hwq8zgDzucQctHd/WKNL
         9r8YhXBHFgI0yHTZRzO0B1Q7Rg+QO5mHrWM89ZYG/nA3IY6cN6DixXjmR4eKaTSATWjE
         1sTISvoLC6gQVPeAk4pt0ps9dAa9QxyzM69ShfcdfQocEpDoLRhrSOkX/fpGWsdMeEB+
         Oe/w==
X-Forwarded-Encrypted: i=1; AJvYcCWoC7R1+w83kEai4BPAMLNL9/z8hqMahlRuCuPqoy9SzL0yYNcTR8aWa8PvHhyehZPCru0SutPWLAcO0tOiLiJs8vRfISsxZUz0KRkNDFyQ
X-Gm-Message-State: AOJu0YxgJ1yfcIuRbdA5knSpa8frjbVoOtejSEcMnvFldHrS4TEuUtv/
	H4AdGamHAH/yK4SLvHRgEVqW0/4IdQJ+72feKDf//NB6WxA25bUGimIJ5wOu65E=
X-Google-Smtp-Source: AGHT+IEg0CEgUALnAgG2Oa0GOQsbhFkD+FfOfT8UYpKAYuMjCeALF3gqTWEdHtfs4BiTRKmqmTRH9w==
X-Received: by 2002:a17:903:1d0:b0:1fd:a264:9433 with SMTP id d9443c01a7336-201d63bcb69mr10901115ad.29.1723590141834;
        Tue, 13 Aug 2024 16:02:21 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1e0659sm18522475ad.297.2024.08.13.16.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:02:21 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] riscv: Fix race conditions in
 PR_RISCV_SET_ICACHE_FLUSH_CTX
Date: Tue, 13 Aug 2024 16:02:16 -0700
Message-Id: <20240813-fix_fencei_optimization-v1-0-2aadc2cdde95@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPjlu2YC/x2MQQqAIBAAvxJ7TlitIPpKRIittYcsNCIS/97Sc
 WBmMiSKTAmGKkOkmxMfQUDXFbjNhpUUL8Jg0LTYa6M8P7On4Ijn47x459de0qjG99o6g9hhB1K
 fkUT9z+NUygdPKwdEaQAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrea Parri <parri.andrea@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=XeL6GWit/pqjHiJc/lAmWKHdjpGQ7Hay1LB5z79tDoE=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9rup7+jX5jK+HTHn2h1NFjOsFy6TvLxppccbIU/Xh0JX
 HowMPdDRykLgxgHg6yYIgvPtQbm1jv6ZUdFyybAzGFlAhnCwMUpABPpV2Nk2D51+xbPPfvqiizf
 mM2972bc/v9e9H6rOu/SXXccH250s2P4p6nypyLuR3PSrhV/Oi/OmeaiF/dAZtbMnBaTktWs727
 d4gIA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_160302_997833_3076A7D7 
X-CRM114-Status: UNSURE (   6.84  )
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

There are two race conditions possible with
PR_RISCV_SET_ICACHE_FLUSH_CTX. The first one can be seen by enabling
DEBUG_PREEMPT and using this prctl which will warn with BUG: using
smp_processor_id() in preemptible. This can be fixed by disabling
preemption during this prctl handling. Another race condition is present
when the mm->context.icache_stale_mask is changed by a thread while a
different thread in the same mm context is between switch_mm() and
switch_to() during a context switch.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      riscv: Disable preemption while handling PR_RISCV_CTX_SW_FENCEI_OFF
      riscv: Eagerly flush in flush_icache_deferred()

 arch/riscv/include/asm/switch_to.h | 19 ++++++++++++++++---
 arch/riscv/mm/cacheflush.c         | 13 +++++++------
 arch/riscv/mm/context.c            |  6 +-----
 3 files changed, 24 insertions(+), 14 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240812-fix_fencei_optimization-3f81ac200505
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
