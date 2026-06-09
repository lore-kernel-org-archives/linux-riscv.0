Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9585FCD8CAD
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MEoa4eKyX21WYGRivLpv0f37MOPbVwSJY/B3U7LD3XA=; b=xJT3Mn2SiCQqHN
	7IFBroP7a0WRDu9OQQyfSAuhmtD24xksliBVhU3z69UUAP8Me+5JVZ+NdLYWTs4pj8S8eE5hxuvfI
	AtGlE/K+qqHuund1xPuYLx5RY5Vv3XTgicDXCO/b+8U1fbCHPPYvuHI69AtplzqmT3Sj6a5R2gi4v
	oI9wnusMDavHIIzbzN3m5MhjnFIK7Gtr8441gPeq7Ka4Ai0Vk5cyBwj9SAn6KYQlRZnnhRQ/geyWT
	AjJ/66JHNTZFEFtytZ127i70XPcH1ZtFA2YNWil2EJkZVu4oVxTpy5qy0nm5QPLetMElSViO+myvb
	cg2ut5wZ1mZhsxCduL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1Gf-00000006CW4-2O71;
	Tue, 09 Jun 2026 18:33:41 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1Gd-00000006CVm-1KdF
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 18:33:40 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-30749947917so357615eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=junsun-net.20251104.gappssmtp.com; s=20251104; t=1781030018; x=1781634818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoFwsPuUo0tpXKvTOb6TDu0J/I3c98IEqfWjWbJZNkc=;
        b=NIgiGLwWYgdOO7VH4GbMpGIl1gxIaeMFlsnsei0IoAnmaPku7+bJP5kvwOnnOykwBu
         IrTSjAJizq/Asp69AKsHUWq7fBeBIo/5yFp32PqsW5RlmNfP1vQJ1yFT3CMMlLAk3VfW
         D1R20hJVK/E4hCpSzO0coDtr7cYprWamDY/xGkbYoZQQlwJOSPKn7vUxis+D890qstXt
         5arbysxwzZ2oC2W6jLNErJY37p5cEcKQk2QZ10CXN/65HiQrrBmZKnHSD3lsyec1fBoF
         mIPbO3wAx/qzwHAYTfwSrO97JReO/TOakKlDWXyMqKdd2+N/5XXwhDlqwXU0yC5XVMhb
         5ANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781030018; x=1781634818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoFwsPuUo0tpXKvTOb6TDu0J/I3c98IEqfWjWbJZNkc=;
        b=d+JjFEnhZjSIZ0q1iXgT7L/aKgQh5E16vevwVhB5TORpePXkvYCR4slSXdZdM5l1Ml
         qD9S+fz9kvM3dfkT0+0irTVfihzgcr2wFrSeVq02p/UsNPjz4yl6kX90YJRrf7vd0tUN
         qgI5fQuuy47dOpNmgwzLQWCrsL+x27ubibzmx7iX5cZc+Cz/AzM+dfHbXDRWwfUaPqvm
         98NIq7tu+zR1iS0PY5jex7a+D1nwDpd4GMFQ7DVcXyi+DrpnVjHXSCWA1DITEFF8PjCt
         6DuLsT45XL+HJIoIHalqMlLGmePwntZapClQHP72xdVpZnrstWNuuAjSCwZB8tVCFjiS
         59RQ==
X-Gm-Message-State: AOJu0YyPzZ6vSriygLAESLeSPGk7FtR4KeOJK07kTSZmLmOlHXHbEzFj
	yz4HwNE9VZGfUcrJ7swjMwaVzns9AlcfozNZYRyyESMjZPMiFATxtz9A/PBCmUoMsxG6TDnSFyN
	uqCRYxA==
X-Gm-Gg: Acq92OGjdjuhLXdEgX/NxkLR9vXiTwF8ZKRnsNVFKHUbKnTHHxGivyZ8YoZcqMrMZxi
	QuFREu2bbec6cdJttPU1ZZASYU7vUKqzFGz/yZkLqq+8AkgkofwlydTEmCkdfhDNi7w7owwQJRd
	onEhznX5/OPO0ftnyfVUYNj9q0LuDy5GDUi3B3b2kN0aJKgbValL2tjYTeeNvumAgtug4zhJyYa
	nJxmOewmhNud5RKjyhNiOKZDMCcdTM9l7G3HT7MCXSKnkstyLjL8z6X51olT+vPzZ2b8jd7oJ4k
	cBc6fhiKD3pqH/shrsOeKVBR1Sj2np//pcun2BFCI6LBHF+KKgATLd4I7nUFlXrhTnfFf4StN8x
	XNZMIK0OQL4xe+T4RCkNqyioVfsOcbiEZ5tvN11UYdg5nKBaWmH3+WMGZEiKpmq0aBkeqCVXpBi
	B3tQWKjKJi3kKqFPqnSbfrimp/YuR6ws+k/2lnAsA5/sRaVoI0FKq+d6y7nLSpO8x7efAmJIgak
	piHi1JDrC5KS1AbcitoG/W280EXYjOS5qQ=
X-Received: by 2002:a05:693c:37c3:b0:304:df0e:9db0 with SMTP id 5a478bee46e88-3077b442d88mr16239842eec.15.1781030017795;
        Tue, 09 Jun 2026 11:33:37 -0700 (PDT)
Received: from ThinkPad-T14s.localdomain (c-174-160-255-66.hsd1.ca.comcast.net. [174.160.255.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcad34esm32003018eec.11.2026.06.09.11.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:33:36 -0700 (PDT)
From: Jun Sun <jsun@junsun.net>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	junyan.lin@spacemit.com
Subject: [PATCH] riscv: cpufeature: remove _RO from use_hcontext for KVM=m
Date: Tue,  9 Jun 2026 11:32:50 -0700
Message-Id: <20260609183250.41892-1-jsun@junsun.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_113339_489650_785C9CE5 
X-CRM114-Status: UNSURE (   9.67  )
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

use_hcontext is in __ro_after_init but only referenced from KVM's
__jump_table. With KVM=m, jump_label_init_ro() never sees it, so
it is never sealed. Module load then tries to write to the RO key
in jump_label_add_module() and oopses.
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 903e27cf908f..3a68d20156e8 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -49,7 +49,7 @@ u32 thead_vlenb_of;
 atomic_t hcontext_disable;
 atomic_t scontext_disable;
 
-DEFINE_STATIC_KEY_FALSE_RO(use_hcontext);
+DEFINE_STATIC_KEY_FALSE(use_hcontext);
 EXPORT_SYMBOL(use_hcontext);
 
 DEFINE_STATIC_KEY_FALSE_RO(use_scontext);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
