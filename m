Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26327FF885A
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 06:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=494V5UmD0lratW4RioSWJz3Em7MwXKBxH61llSnyd6I=; b=OFKRNtQMdxqtC3
	8eZ35I/zdUf29MKUnfIMKOFIVH9Qgmurlj3Q1yPB25rYK2w61MoOrhuU/29Dk2lm2on64Na2H0iRQ
	bFVo3owog34OKLkuEkJHMmWj5bew7mFfKa/BteX9UxS3XEDn2DkwpjXv/A9mEX2fCrp1VkmBAb2S+
	VKfggsKtj8B63ssNnf+Yg3wLyEGJ+9p/UcDpRH9vhPBPrbqTECBUtL5pTxMaKgloz27o1kSoK6BpM
	XU29kbGfmqOxouMdmAbQGVXVt4NiY8jai5DhwKuOq1wZUAnx6Kx4az4cOu94waAw1gPmY+TdVNe+L
	WpHz0WBHlnFMztQZvY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIhHm-00000006Pte-1DQX;
	Fri, 01 May 2026 06:23:38 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIhHk-00000006PtF-0Cen
	for linux-riscv@lists.infradead.org;
	Fri, 01 May 2026 06:23:37 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7dbd23bc684so1127715a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2026 23:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777616615; x=1778221415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmd88X/w26xtSKxfgjt+pkfxGFHUfVGxFukWfHdY3Z8=;
        b=eLLVkwjQwGdhkYUsT97h3XzJil1IipHMG5h4WVA+kJCCAPCnjU7r6dXlgN1cvj7YDC
         iEVrlch6sY45zRZnDMyD8G8aXbQ/1U2QAfNjsKSL+SWZEuJha9O/d/9dcHlx8k2/holh
         0V4NNRwkJXfF/+ZwTxPdOO5LsLxBDJZ0nARaRkpEGNU8IvNBhplYk50NFV3yxzFRVumd
         SxVpAqMz5u/jidyxoOwTpcTsGFD8h2YbZzHvAF1XmtKcdnNWhlHVDdGMcQoF/YEZqk/B
         PQo2PLzaK3RXMqtpNVrDjUpNUONTzHBZDl6UWiBZ9NTVsOvSuzn6eWaEY4iANBRIif5X
         5LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777616615; x=1778221415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmd88X/w26xtSKxfgjt+pkfxGFHUfVGxFukWfHdY3Z8=;
        b=SWHQRIsjeG1NU2UioqVm83xBG/IVCQcb1tYtdSlbmoMcOHyODHavsqAPtjt11r6ekR
         uux+H6aeUDNiVCJ2k0OcWblWSMZJ2zn/b6P3DcLL2OCypfosbOnMKaDt0Dcj/nOZcAp4
         XiWE5NZeEFofS3iqnwd7bMAKeSV1TcOI84UangEWp8g4JiEZ9ejnofgh+RUmmGwEUvfQ
         HwB+sjUObRRkEEYe6n/aVwVGS9kyqz+09PefO9wUdmnYv9Eff3riHdROR+A8n068T6FL
         PP1vTMnrqcXtav2RoW8MI9kHZt9USjFW7+GQP0kDyT/UsTbAzT6dbeHU4hFzI+u6BIH8
         A2wg==
X-Forwarded-Encrypted: i=1; AFNElJ9FcwQ0LJzG8pevkpyRG6+w6Z25HPy5++saNBkydeb25ACAFHG6paPQ3n14Ds71Z+0nzV5PGgkY2/kHwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyP0FoHvyWzw9kzNAIUBck5HrXMdQ5SdodEz5kCKxiOH2y+Z61x
	mjwoC9yAmeH18WL3xlOHsru8h9hZU2uKa5ez/rTHasirIYiNbFNgb2U9
X-Gm-Gg: AeBDievKpPjQHSeD7tMXgU4lH6xzOVpd75ZvTHk1pacIEcGb3gQ6qpwjgirZC528TEw
	C5duuYPloNwtYw+7g6U5CsQmu44VG2D4rqMg29U+zpFfE72UQ5sCPz9GS/wWDSjXd5yEZp79Vek
	QlMvZbz1B+X7KEewqxPYndFGn0XMPFIsw6pqiQpmH6pksesWUBTVqVeb6oVbqzgnT3n+mqZp5Vw
	kxsTXvqRn/IDiu37wUZC92xfCfzZOse3Q1ZZg/PsZlLkHScAcLze8oQxleT/eUmyfqMaVpDgIyB
	cE2Oe5lX8Lhp0lmk3Wy3BeZ0uiaWJhBKeemWkjbSI6UQGu8a2JfCupNWM3M/cGvjvsqX3z1ENl9
	JFFI4aUtif7inFOgyezM9P5req9ylmBDQJnUM9N3jYR8GIlBq27mvwiwfp7iLjPTkJsZMEbB7G6
	WvVygRp/p0gBnOEawBEmufXhES9gbH37kOzTEIIIxvHz3o
X-Received: by 2002:a05:6830:4411:b0:7de:495a:cf80 with SMTP id 46e09a7af769-7ded0a380f3mr844419a34.16.1777616614670;
        Thu, 30 Apr 2026 23:23:34 -0700 (PDT)
Received: from ird-aus2.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7decadc350dsm1457174a34.22.2026.04.30.23.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 23:23:34 -0700 (PDT)
From: Michael Neuling <mikey@neuling.org>
To: pjw@kernel.org
Cc: ajones@ventanamicro.com,
	akpm@linux-foundation.org,
	aleksa.paunovic@htecgroup.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	arikalo@gmail.com,
	arnd@arndb.de,
	bjorn@rivosinc.com,
	david@redhat.com,
	djordje.todorovic@htecgroup.com,
	guoren@kernel.org,
	junhui.liu@pigmoral.tech,
	kevin.brodsky@arm.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	ljs@kernel.org,
	mikey@neuling.org,
	namcao@linutronix.de,
	oleg@redhat.com,
	osalvador@suse.de,
	palmer@dabbelt.com,
	panqinglin2020@iscas.ac.cn,
	rppt@kernel.org,
	rvishwanathan@mips.com,
	vishal.moola@gmail.com
Subject: [PATCH v2] riscv: Fix register corruption from uninitialized cregs on error
Date: Fri,  1 May 2026 06:23:20 +0000
Message-ID: <20260501062320.2339562-1-mikey@neuling.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <78b4e931-9ec7-14b6-1487-906652a65ce8@kernel.org>
References: <78b4e931-9ec7-14b6-1487-906652a65ce8@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_232336_093867_99041335 
X-CRM114-Status: GOOD (  13.14  )
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

compat_riscv_gpr_set() calls cregs_to_regs() unconditionally, even when
user_regset_copyin() fails. Since cregs is an uninitialized stack
variable, a copyin failure causes uninitialized stack data to be written
into the target task's pt_regs, corrupting its register state and
potentially leaking kernel stack contents.

compat_restore_sigcontext() has the same issue: it calls cregs_to_regs()
even when __copy_from_user() fails, leading to the same corruption of
the signal-returning task's register state on error.

Only call cregs_to_regs() when the user copy succeeds.

Fixes: 4608c159594f ("riscv: compat: ptrace: Add compat_arch_ptrace implement")
Fixes: 7383ee05314b ("riscv: compat: signal: Add rt_frame implementation")
Signed-off-by: Michael Neuling <mikey@neuling.org>
Assisted-by: Cursor:claude-4.6-opus-high-thinking
---
 arch/riscv/kernel/compat_signal.c | 2 ++
 arch/riscv/kernel/ptrace.c        | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/compat_signal.c b/arch/riscv/kernel/compat_signal.c
index 6ec4e34255..cf3eb33a11 100644
--- a/arch/riscv/kernel/compat_signal.c
+++ b/arch/riscv/kernel/compat_signal.c
@@ -107,6 +107,8 @@ static long compat_restore_sigcontext(struct pt_regs *regs,
 
 	/* sc_regs is structured the same as the start of pt_regs */
 	err = __copy_from_user(&cregs, &sc->sc_regs, sizeof(sc->sc_regs));
+	if (unlikely(err))
+		return err;
 
 	cregs_to_regs(&cregs, regs);
 
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 93de2e7a30..793bcee461 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -577,8 +577,8 @@ static int compat_riscv_gpr_set(struct task_struct *target,
 	struct compat_user_regs_struct cregs;
 
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &cregs, 0, -1);
-
-	cregs_to_regs(&cregs, task_pt_regs(target));
+	if (!ret)
+		cregs_to_regs(&cregs, task_pt_regs(target));
 
 	return ret;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
