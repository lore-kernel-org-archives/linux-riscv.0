Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3323EC4706F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 14:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffuoEMdrovxyufjQG4HqGe2hJknbdY6C1xKF209n7Ao=; b=25jJMdln1WuY9z
	vgtsHAiuA+uTp4dTWj2mjRywsoWbDat4kxkcT/J4s6FDzKAVaBXjZ5ochfsCmc9nKHAypmMyQaEwW
	gi+6arkpXBU6S/2rncnWQkfkcHxoXxz/By+xHizoyg3WU01GmwtZJO4BgSZU0Q43mneURcHz/NfGa
	fen+Dx2fiqEsGcTlMdRMcy9QO8afzlp3lDcx3OFECMO+ZStXRAV/1FCP3di2OcVQFwAw+9iqgI7aK
	5XqxKIQbH8cq59gg2BPIvp1ATK5LF9a2torPl4E3wPJ+kDAndrlP8HUyECDpYbq/N3kVveojWIlMF
	cbQdovai24Z2onrn7jkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDzj-0012zm-31;
	Fri, 29 Dec 2023 14:37:51 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDzh-0012xe-1X
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 14:37:50 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5cdfbd4e8caso3892299a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 06:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703860666; x=1704465466; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ObLV7T59RhMl1ztHBcJYna8z6xraXxN5eXN0lzHnI0=;
        b=OMqu/p6jlM9OEc/y/9uHePaqXJI42bSpmlY2BjbYUSeffEYtOdG0Zsg8E2qlPqPaId
         5n4EiaJxm+Vw+SIgEX2Z3uRz6GmBNWo42RxvB4teqDiAsU7bv3zJdv+W3lSzmENEDIvy
         At2RT2OUVr8ovCChiVFTdDpT9YAwEWqCDXKnw464V7iq1t05T+4t0W8Cwl+bfxoBrS97
         azTs+uqorI/Z0mWLHArV0bHcYExo9cWK47s7nEk/CwxYDebl7hp3bHTQOxiX7DF7eQjc
         uuKvxZz0pEnLzrEWjZFybhEVaUUhQZ6nFmIqxirHGZwWHQlHtR5bO4AYODTNfrbMSOCB
         TK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703860666; x=1704465466;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ObLV7T59RhMl1ztHBcJYna8z6xraXxN5eXN0lzHnI0=;
        b=WrOa6oRta/xl0bykFxy/ARScUdqYfZ2MH8TN/FdWVSI7RUCM2LpIS84LfR0QFm1Uht
         1K8OUJUT05NTz0dPFa9DcBOXadoIfjfDF7430pvlHrJ4nyLqIp9aCijJETl2qaHb2iLE
         QZ03cfFN1JZrZrxLyM2Py5mru1ce8o7+I50rC+nBX78jc1nLluMgxkiXI/LvMPd5alwq
         /j36fqEWRualxUDLOgDgdUEVZ2IW1wv9nuIXq7C5wip8AOOfMuee5dZSiCZa+ccvzpPW
         myXS1cCiahSiSIC/otxZH5MBWQ9mzkfMH1eDD2yh3puANTnE/IBfzXR9z1vY63g2ZEND
         XBCQ==
X-Gm-Message-State: AOJu0YwAbOyC0SAIOiR7c9ILjf3pz+27dntTGib7li34mFF4sZg9Jy1k
	aTnRJHyK4jY1fzvo09NumsKn9Awg1Lx0HXJxdIcCOnRjUjHvmrbEKwjMm2111g0PSnu7AN6S0G/
	c2fqAEB9LqUN+cbr/DBz19TvOujS+I/O3EicoLvAknR0z7H30Gtj6brJshHUVUYE6lhcB3APVqM
	2k7emRhLp1ATf36RECSOXt
X-Google-Smtp-Source: AGHT+IERAfaWIZbVx7vrYsKuOkhL8zwGuFluV3OfH1rmhMG9L2R3JQ2nPrdIWr7XZhkKT15pvB679A==
X-Received: by 2002:a05:6a20:7fa1:b0:196:8eb2:43a2 with SMTP id d33-20020a056a207fa100b001968eb243a2mr639856pzj.113.1703860665513;
        Fri, 29 Dec 2023 06:37:45 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y16-20020aa793d0000000b006d99c6c0f1fsm11544727pff.100.2023.12.29.06.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 06:37:44 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	peterz@infradead.org,
	tglx@linutronix.de,
	ebiggers@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Xiao Wang <xiao.w.wang@intel.com>
Subject: [v9, 06/10] riscv: fpu: drop SR_SD bit checking
Date: Fri, 29 Dec 2023 14:36:23 +0000
Message-Id: <20231229143627.22898-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231229143627.22898-1-andy.chiu@sifive.com>
References: <20231229143627.22898-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_063749_514007_1C7EA1A9 
X-CRM114-Status: UNSURE (   8.66  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SR_SD summarizes the dirty status of FS/VS/XS. However, the current code
structure does not fully utilize it because each extension specific code
is divided into an individual segment. So remove the SR_SD check for
now.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/switch_to.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index f90d8e42f3c7..7efdb0584d47 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -53,8 +53,7 @@ static inline void __switch_to_fpu(struct task_struct *prev,
 	struct pt_regs *regs;
 
 	regs = task_pt_regs(prev);
-	if (unlikely(regs->status & SR_SD))
-		fstate_save(prev, regs);
+	fstate_save(prev, regs);
 	fstate_restore(next, task_pt_regs(next));
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
