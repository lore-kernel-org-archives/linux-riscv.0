Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9B0CD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4sxCWavVMJPnHPoEiSVhhwQJpsF16V2rCpYzAPbwVU8=; b=gr+XEJ8gfm0ygN
	lwHVc7FFv2cNrPYuZhG5gcFFv6EUTenWrreg1beFYW4nuBekZA1WEF8HPmSv4xT1mXX2tIDgIO9vT
	rg1q7W+T2rDsw2EgwIkXl0OoJIyrWRk/iYeBfGeGbpZ/LFcfmjP8s7sBtTgHlvrJr2S5Y3xOviIU2
	WOqiX89t920qFaxvJ63G9L4CYkoWU8m0h5XIWy2hKIeSvHdbY/dFcXkAWCUioC1tJvQd2LypBaRF5
	dzptauNXUDmdit9dSn0N6JL+C1yKip4dmRh6G+waiRy90le/6K9rZJwC4LLIwFaAG9RBFN9LEcyub
	2gtzSuEpdo9qXcy7hLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHYS-000000067FH-2xtT;
	Fri, 08 May 2026 09:31:32 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHYP-000000067EY-2OZX
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 09:31:31 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3352796eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778232688; x=1778837488; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VDMazkU19xo6aeg8uO8FYpNwjaVlN14PTDXh6w6kmHk=;
        b=gMm5rq0tgEr7PUXwfUgN7R7YjnwiNWeRHKTQcx5FY6KcqtDVF6uW1bfMaSdh1kIAQO
         9trPa2/EblLj4lnGZntkeUTs+GLULPCM3s3/SPPIvhcJTFkRYdSGCK7ZoP7RUpwJ9ULj
         dnIvQOVKU+uCovBnYD5CX+dZFqVszBIP7IcOjqRkTSfl2FX+eli0q06Hxz+fXe+qQ/uW
         PFCLkydBqr3aYmrsqVLxrJYCX4t7qOtbyQ7W9tuDMLpfX8J0jXb7yp8VafbzWjSTMVcs
         mc0IMOJXbEGQrhXTRnnLAJSU6JK3ovgc/KOE1Fn7D6qVXGV3BstbGNXF/7btL+Y1cN5L
         eQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778232688; x=1778837488;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDMazkU19xo6aeg8uO8FYpNwjaVlN14PTDXh6w6kmHk=;
        b=P3cHE0qfV2dvzdOWPCtd5quok/3Qy8/hsfe8Ies/6wGAkFJVlOZkKLNcZMzaT/RHHm
         3CATeChzt+VHmhpfQl90bzMBumoj5kiRCDAED60eBM7zJYTtpxF8IH4ITB4cTLONAsTo
         BFFJuuFEr+7yT1NPhfUE0hNibTv2uScChS2QnwKc+7oOwmACCWYvKFCeER7AOUrGa0qy
         rcXWI1Yu6wuFd8tYfeIiohIjbxmFpdV7ImtSrIkhU2GO9rgPKTN80rj2mP9bbdyM0Cvz
         w0iEBMjlXcP6NtGfHYXMYnfLdy7+PoMEsZ6J6OC+L9OSYpdUsbrUsU9heNY5Ay+lThAa
         oqiA==
X-Gm-Message-State: AOJu0YxrXeThiS+D98v2bkUbfGXYOXwZTGn0UY5oApwhgMoJdcYynJh7
	QXsxDwvwAkQ3jpchxzdprYAxZv+Hh0C6il6MtY6momZcN90IxLcDgcx6GO/aP/8wpnw=
X-Gm-Gg: AeBDievY0tYRlgTOknHUHA4N0rMkFWI+IwxKnYUnO/ygEndfuCsBL/tGQW5lzpOMN4H
	PrbiM08DgXx7QTEeVwYYjM+5XGxgDFh1Tb9PTFNu0HDpHCbvqO0CWNPeP4LBo5Yk/yRD9V3Vl/G
	GViKlzi9Fjet86uxHp5oh3RTBW6SvhEheX+BcDDZYHLwHzTYZMmE4Y9xSVgP6Kt3oFJCSNGQnff
	UzGGs1aO3wZp3xGF0PO9+a4UIFBsLHkFSDo9NDmu+DLLbGM2UfhaNpAtKnEtAPIWmFoUg10gAWI
	+pkomjSHlDRpBMD0Vf0NQ6g50nuYXpaNIDVhTHuQYPKSHrZA14wd2jXDCJBRon9fLUbTNvCbp/n
	0QYl4JBy1agSGdPVBUZd+w2IS8taM2ZOrRKwSKTL2PL9S28vOG2XBPtC87Xx0A9mhAd78R5wEmi
	Dp/hAfI1y84sD50/24nMOdmCWA+bA36RM2q2uvS5utfQ4=
X-Received: by 2002:a05:7022:251f:b0:12d:ca32:59f with SMTP id a92af1059eb24-131969d414emr5780690c88.11.1778232687194;
        Fri, 08 May 2026 02:31:27 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13277bb2b14sm1978374c88.0.2026.05.08.02.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:31:26 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 08 May 2026 02:31:21 -0700
Subject: [PATCH v2] irqchip/riscv-imsic: sync-up state before CPU offline
MIME-Version: 1.0
Message-Id: <20260508-imsic-v2-1-e9f08dd46cf5@sifive.com>
X-B4-Tracking: v=1; b=H4sIAGit/WkC/12NSQ6CQBBFr0JqbZseGIwr72FYQFFImTCkCzsaw
 t3txp3Ll7z//gZCnkngmm3gKbDwPEWwpwxwaKYHKe4ig9W21IV2ikdhVF2l0RQltlWuIbqLp57
 fR+de/1he7ZNwTeNkDCzr7D/HUTDJ+28Go4xqmotzuu0Muvwm3HOgM84j1Pu+fwExv8LUrQAAA
 A==
X-Change-ID: 20260503-imsic-d70c156cb740
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778232686; l=1599;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=Mnv7DpO9+oYPGvgz11ygXzOtsg1VjNX6w1Z503dFEw0=;
 b=JObsgD+146rdng8X5Y+IatcEapo0L3mgv/Prrqfc7hebQ5/JH6ghkGrOu28eQDUxjawpuLjMU
 RXL6dFHJ9laCeCKbJcGW5FSM4uSLmLi7j8Um6i48qpNKZZTmTS7gA3y
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_023129_736515_E0BEC191 
X-CRM114-Status: UNSURE (   9.86  )
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

The "move_prev" pointer in struct imsic_vector on the new CPU is
cleared only after the old CPU has cleared "move_next". But when
migrating all the interrupts out from an offling CPU, since the CPU
is already marked as "offlined", the IMSIC driver skip to sync-up the
interrupt vector in __imsic_remote_sync(). The "move_prev" pointer of
these interrupts can only be cleared after the old CPU backs to online.
Therefore, the affinity of interrupts originally targeting an offlined
CPU cannot be updated.

Clear the "move_prev" pointers in the CPU hotplug offline path to avoid
stale migration state on offlined CPUs.

Fixes: 0f67911e821c ("irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
Changes in v2:
- Update the description and add the fixes tag (Thomas)
- Link to v1: https://patch.msgid.link/20260503-imsic-v1-1-aa8330bd1c34@sifive.com
---
 drivers/irqchip/irq-riscv-imsic-early.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index ba903fa689bd..a7a1852b548c 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -158,6 +158,8 @@ static int imsic_dying_cpu(unsigned int cpu)
 	/* Cleanup IPIs */
 	imsic_ipi_dying_cpu();
 
+	imsic_local_sync_all(false);
+
 	/* Mark per-CPU IMSIC state as offline */
 	imsic_state_offline();
 

---
base-commit: 9b3a2be84803cf18c4b4d1efc695991f0daa153c
change-id: 20260503-imsic-d70c156cb740


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
