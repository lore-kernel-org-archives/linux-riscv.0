Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4081C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 01:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FRTL3AoMVXz8tUARX7IEY+33ityLnPjjljjqRNoJToE=; b=J/87jMzSAwQ4oQ
	12xsCEB1Z/FOiUvvCwqKGfcX30LULk8sBJB0jtfyQ+X0DdvmRn1s3QsJskV/ZiqNKERaVQHaKoj+y
	U2XOsXxrrKYf/5Z/6RtS99SVdXBFfn79UA1CEJOVWtqs5FFAZ2Yiha9IwSPqP6auOlMYjEKQt9JaE
	usUBWAdjQO9uULrh56/Snf6/CPvdCdp0ZSjoESmSXw7otM1tE1ekfr44guu9U53DZwmEb4BXtCZJX
	kfBYJWrMPnkUQq67aBcnTQlTYZhraKimerqZG9umPjlimFNNzSr00IrU6rytHOZT5CwDf0SoyM/Bz
	yBT/8v9P0kOpHeeFK9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwrqu-0000000AjTD-3nb9;
	Thu, 20 Aug 2026 01:45:56 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwrqs-0000000AjSs-2jot
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 01:45:55 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cc11a30a259so1446815a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 18:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787190353; x=1787795153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcbmxgCXq1Ai2lvtBMwQpFOstE3BYsfTfvmqnVMkCrA=;
        b=gAnnlcxBGS8YVK9H7LohW2ovQo+dasOHvco6kaEiSZkNb98u+ifHkgk5xZg1cv6Wtq
         SN9+5v83aSzfiLJvRbN8XwdrfzKf8BBhjpHEObSxm7yapyxkH4HxPv3BsoOmC53EaWky
         b7diSFD7poR4An56HuBohQwaR9xuec5yaMZEK6QPho3/9Y3CL/+YMwpROYO80rAXr59H
         DvG8bwqzkeY9i3IkDTCcJeUO75j4/YtMBLPaISl0sTwSkCTtqGdVZ4/v04N6Xmjjeyfs
         cRqFjunkYZ/p343DuZKG0OBfNpWVmHdZpQ5Zl4aDuRZcG5OBqIoyIEGAvqDIyqGHgAgT
         NR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787190353; x=1787795153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcbmxgCXq1Ai2lvtBMwQpFOstE3BYsfTfvmqnVMkCrA=;
        b=QxXhwgkbRRH/IHRZFcYmC8aZwXxCNhzIMNrqMig+29ap2H9y0h/HdJnk20zOgMP+Yr
         dlY99cj8iSBk1wvKBd+DOy9Z1o7vCseugX78rJ5032TuUcw4SlHoE/JHgTHTvpmcOcQF
         EePH03hbXGabA9mDhKPoGekFxoJVKUR1/dOQY4pYG2d7tKtEKMDYSco+azilJQ9lT02D
         3xaATs7MYcBX+ycK1tiBCpspIWXbyWBaYT9zhwsYk+SSPrbQ9Q9ENyI06eO74LZrbqkm
         HTtKg1vSQ+qzP+4XxZv+2lzrXbDVStmuFeua+YKYxLYFpLHO6Gku/VEDZCIHGYZJDGHq
         uQcQ==
X-Gm-Message-State: AOJu0Yyxd14kFyB6ayoC+78SralygxTMAvHt+5SVMln7bwqaa/S6AN85
	6ZWdpeLxzGqCNUX+wB8iETOaOf43l4EmvZeBurnJlo+SvImbjXZ+TLGF75P6GiEwO8I=
X-Gm-Gg: AR+sD11sK8duIsWyuYwiX/L0ST3SW/r42gtB1ocBC7AmOpQanWQIrjuhXEBQBo2rZDF
	JI0YF128ogffDuLoQ5XbSmV6IhjxEXpwkN7V5QejHqs1cVoUUxcN5G+YOyT5NAPSo+6jZdhOmHF
	aIH4wbkLVW82mVqAIRZFfkoJMTrj5UXpTb5PuIXsJ8ZgpLwJxr8ZL8QW/VpWaldnOhb9rE5PSYp
	KFjN1Lf/XsVd47B0u66Y3Muheg2wLNqPS4FAfcl8lyh3KE11tnpIdGxF+kKouVD6AHUbpB3+Orw
	uIcyvXORR/xyCrUGcEWmLEQutb1juxp/ZRpMG4dU1KwT312fYOOvWjAu4EwHeTC9yttjSwRCsTz
	ebhAfOJMF9bxWPSpy0UAx3wnCaCKCDP9aFuVueqKNngRh532trZprGFMpTKW719S07PznZ19oSV
	peMML8Fg+7Qb6bIIDHvEU9LpEyQt0WQST2cyJOIrqknmIMlTRKL1qbF2AA+cmuxWD6kG9iBbZiz
	T/kFp+LrCuIvAtlJ3aJ
X-Received: by 2002:a05:6a21:6b0f:b0:3c3:8c91:5da0 with SMTP id adf61e73a8af0-3cd012342ecmr16884819637.15.1787190353142;
        Wed, 19 Aug 2026 18:45:53 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c946293dsm5052389eec.22.2026.08.19.18.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 18:45:52 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Paul Walmsley <pjw@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	Zong Li <zong.li@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set"
Date: Wed, 19 Aug 2026 18:45:16 -0700
Message-ID: <20260820014551.1979772-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_184554_708869_CAA60736 
X-CRM114-Status: GOOD (  12.09  )
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

This reverts commit 3033b2b1e3949274f33a140e2a97571b5a307298.

The reverted patch is userspace-visible behavior change, not a bug fix.
The two variables here (pmm and pmlen) control two independent features:
pmm is the _hardware_ pointer masking mode that applies while executing
in userspace. pmlen is the shift amount that the _kernel_ uses when
untagging addresses; PMLEN_0 means no untagging occurs, so the kernel
does not accept tagged addresses in syscall arguments.

It is valid (as documented and tested by the self test) to enable
pointer masking without enabling the tagged address ABI. This separation
is necessary to allow userspace to create an execution environment
similar to what the kernel supports on arm64 by default, where TBI is
enabled but the tagged address ABI is not. (On arm64, there is no
equivalent to PR_PMLEN_MASK because TBI is always enabled.)

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/process.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a5..7cc5a6a5c0206 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -349,10 +349,8 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
 	if (arg & PR_TAGGED_ADDR_ENABLE && (tagged_addr_disabled || !pmlen))
 		return -EINVAL;
 
-	if (!(arg & PR_TAGGED_ADDR_ENABLE)) {
+	if (!(arg & PR_TAGGED_ADDR_ENABLE))
 		pmlen = PMLEN_0;
-		pmm = ENVCFG_PMM_PMLEN_0;
-	}
 
 	if (mmap_write_lock_killable(mm))
 		return -EINTR;
-- 
2.52.0

base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
branch: up/pointer-masking-fix

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
