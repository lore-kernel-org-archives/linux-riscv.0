Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E2DC44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 00:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qm70jnouYc2ZDKzK55cHwwzEDkFzszZ6nv08CIkgzqs=; b=sYaiMq4h1HPcy+
	Fc7qTjEr/yyKRO/2bVgMoLImwjsPau7yEHuDbI9wP4AK+jXQvY1hHzOIPEq/N13XNqDpZe3Z1XfbX
	sVmpc7YZCnbP5FbLCMS6lOJsHEG62D3qzOE5veHiIOrQpUvh7PDVLSjno/sjiohEnf1E8AqEAWd0S
	QJTGafpdXIjtbPXYldesfw1gAYY6nghjA46ChVMpQStWCP7jb71wGqqa8cwzINXLM94NE6c70TiCj
	4ZFNU4NtIRXVuUvijyu+BNl9fNDxNA2fObT/Z8HmjqfoL+rc/eS0tuN6wo7LSrksBO+OyPFQVoWNp
	ZCJpda//w6XVPjeKbMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjRAI-0000000Abwn-0wiG;
	Tue, 14 Jul 2026 00:38:26 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjRAG-0000000AbwI-0vTA
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 00:38:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38e1a9d9105so81747a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 17:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783989502; x=1784594302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Df7F+7b6UYsij2lP0dBgse5bLUCiv5AkWmF+xVzQOSE=;
        b=NeSPHYB8lCxzlUOk38MpqnwzCQckZZ3B6Qsy8y8xziMCSDh5yG2QfM9d5jpik5W5Xe
         L5TYXedzAI7oqqKIIzqF8aI9NiXmpSbrRD8Ylf0R8rp88ZLqvR2QnG28VveD/4rvN8TR
         9qhhKwNofyLNM0us5+8q8cmcVFSAkT9+nBoHOUW+zHT2e2jqUbxplyABeZmXIHJLKujA
         iZMvHLirodfE/CpFjZMpA5G4+0mTlvF/9N6vKr4qU7PBPtk7AjL2dmEOqVl6SrH/DHJj
         l11DFvKvcZ6FWA9IaIMkvI6pEjn3Gi5t8EDu88vREZs8HJjMWWok4FZAo+21L7V/j9XV
         /syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783989502; x=1784594302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Df7F+7b6UYsij2lP0dBgse5bLUCiv5AkWmF+xVzQOSE=;
        b=iKyfr19LWNUe/WksSfkMqJcqicUnqurtF/9ezNn6snCu1tmWpLIOMNYx0Z+tiH5h3L
         KjmqiGMEXrO0s0mDBiQca0+j7sReW3XSuAYYAFq/lqwgPwXDfEE2Fw11TznwCgiqJR/K
         PzxwJ4WgtZ0FNRYVMCvj6/BKopzq4dr3rvSqOr8NjbHbT3o2I5lSsh4tsF3a5oEUlNT7
         a3Xt0tXJcZ6lKfFTbtvEOy5BSkUtslV8IxzkJ65g7Bh2ONBoke1h2zBak8dF1ZjQ8Nfx
         tfrtguRNEbxuLl6zQYtCxcRwMBqEu60VT/EIz59YcQQZuBgMeNo/H8KIGKKdORuoikcK
         OugA==
X-Forwarded-Encrypted: i=1; AHgh+Rom9zhyuhofcqBwk8HpliATHxF8iAfRTsC3IQf1kgPm0czNLstBxujhCrxl7wYPw4Wxm/3qN1q/9HD2Ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLnXA3cru5Y/f5CzG5IDGoStXQS66BhCR9RYRaS+qkBvTUrhpp
	8LFP7GviEUQWR8nsCd7zoN+mbGYt9qzkU3LZsy4p6x+I0YpN8l3wJcCP
X-Gm-Gg: AfdE7cmh9Si5mufHf54x/E85aGEAFKFWefbRiQFJeysK2oulyiwdwWZ5wkTDoz6Y2Ms
	c55yiXUaKRzQ0XQZMuJqXZYTLAAYR/Z7+XIYsS2Vd5hS5art8cm7Iusd1qjoHIKsCYVJ77XQRG2
	WrgZ5WNWpUS+y1JFJXGcjZ0XcniQRz5hg+RVtpEns7j00uCAfScJ/949QXWaE9uaIN/YgfGhGpQ
	+LXJnN6ODLrzhlbG0ioAgmfE2OgfCuyoELCVWQjNOlxPxkXwvD1cEFnaU0uw0n7ZndYZnyWlaHh
	czkXJ4kvHdkiwdHA95I2BkinBQdkNFxGeiUJWcHDbgi+lw3pN3erpJL97LDxK6J8NzMILanPFNd
	9YFbtDv5leIuqiR5o+Oa/xWzVWy15BHNJdQ3n3I3N2rvswQdDXt3iwqsqGhFwue8S3cxyyoMtsJ
	hoglBNpTc3X9n2Nr7/VeBWcBy5GDrzu5h+J7JbZWm1yg==
X-Received: by 2002:a05:6a21:1309:b0:3b3:1b38:d9c3 with SMTP id adf61e73a8af0-3c1106336d1mr12979621637.4.1783989502199;
        Mon, 13 Jul 2026 17:38:22 -0700 (PDT)
Received: from kira.gmail.com ([2601:646:9e01:94:5407:619f:bb42:316d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f72a6sm87768917eec.1.2026.07.13.17.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 17:38:21 -0700 (PDT)
From: Mark Harris <mark.hsj@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Mark Harris <mark.hsj@gmail.com>,
	Nam Cao <namcao@linutronix.de>,
	Michael Ellerman <mpe@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: hwprobe: Avoid uninitialized read in hwprobe_get_cpus()
Date: Mon, 13 Jul 2026 17:30:56 -0700
Message-ID: <20260714003056.73707-1-mark.hsj@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_173824_264680_F8C20397 
X-CRM114-Status: UNSURE (   8.49  )
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

When cpusetsize < cpumask_size(), hwprobe_get_cpus() did not fully
initialize its copy of the cpu mask, which could cause non-deterministic
results from the riscv_hwprobe syscall on a system with more than 8 CPUs
when the supplied cpu mask is empty.  Address this by fully initializing
the cpu mask.

Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
Signed-off-by: Mark Harris <mark.hsj@gmail.com>
Reviewed-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Michael Ellerman <mpe@kernel.org>
---
v2: Add Fixes: and Reviewed-by: tags

 arch/riscv/kernel/sys_hwprobe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 1659d31fd288..caf6762427c8 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -450,6 +450,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 	if (cpusetsize > cpumask_size())
 		cpusetsize = cpumask_size();
 
+	cpumask_clear(&cpus);
 	ret = copy_from_user(&cpus, cpus_user, cpusetsize);
 	if (ret)
 		return -EFAULT;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
