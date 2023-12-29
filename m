Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECB4C46CD3
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 14:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBoi3TludzXQKB4y5mbYXIWz1RaUEj0UxOrD0WXy9GU=; b=p0Np05bAaHKzXj
	SDgQuA5oUy7FkGxO/oiqvGmBj2M0G1g3MKQtDsZk5ZiyTw8Wo0umTD3CFLICUJtYF4kO0F9J2jY2u
	RliYHbC2liG4+ZiP+kv86p9mU2glyEc/GwG86dxZ/+hp2+vyIjaZ0iDFmFZtwTFdgw0XuYgxyJCMz
	A6limvrf/U54NFoO5+LwuG1H8ytdPRAbQrfo5+9x2zbtlFACIk4t3vLXePxTLAc/YaJ+wJ0YcUEEb
	FoCj3Cf5LeHHvC5Yt/buQHx38Gj40X2p3oQAH4rWQuQruk6dwfw/avkVUSS60I7TDVuJ6UmQrQO0A
	xqhWe285mWQc/ADJe0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDzz-00139M-2o;
	Fri, 29 Dec 2023 14:38:07 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDzv-001356-1j
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 14:38:05 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6d9b267007fso1505247b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 06:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703860680; x=1704465480; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=ZAHVGIzYcld82P9wvgk6s02G+QSu3XRRT3GBW8nCSDV4WKSk5A8lWluIgZlLCwasqb
         dbku65x/zS0il3NHd/x+2QFuxT2MuunhK1v9/dG+ctl/75rkyfF+FMk//w0U6NKAJDsJ
         PSrJZc7vlVL0EQIeiNAFsvLWschpGiulhfaWcCKN0KqJH4Bzc/zEspkyR49m6bDvBmp/
         qmr7E+FU+CO/90xt2odGyXwJEchu82B13qVzLik0efeL1SeDOZ0QQJ3PukspttcjUVAJ
         SKli43FNFDC5EVZ53wlqq8McoXfHFJaGU2ZsIkGX7lNLBtj4iGnK9sj3sWfsY7obQO91
         A6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703860680; x=1704465480;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=jPQBGJOjIpSasUMBLT2cs5Km4OorSElV6WQlXnIraT+b0ODbf20nVrSuxrCWAMxt08
         GjKMNT+S6lGiAZ8NKkkApeY3PAWjiyoWVvN2MF29/dStF2sudbh9RaIvBS+iRJVn7JmE
         vO8sTNcZf7cdVbmcCUX+PxABtnSuRC6qIMIQ//nFRJJKv0v7+0rejGfpem7dn/Ozw6C1
         w7U61wEFi7dNj0hqsqAsiMlnzRLJ2y/Hhuj12olL7HYN1MLeENZ1tsYMAtOJoL2SJ8E3
         jeKCGB8t3MAYy4oAANZFUczp0eo+jgAAnTStShIpZwlGZNn3icSOnZdXTupYm82aZLZB
         L/aQ==
X-Gm-Message-State: AOJu0Yw8L9eoJ3y0QkjZHBfw0Ii3dag7kE+ORm2b9Y3ytnxFM26rNazl
	u/DT9n8sWij8Stoh4T2k6OyvkkwI+/ytzA44A/E31AP3ObQ2gqZ9z06rf0eJBAdnXr+Juzqcf+w
	7d92Db1n9tBFpVajTzJ5l/o6PztDW1r9QtmZxa2ynns91GwyRLKAFwOAhgVkUF1UK7iiUwnNhSp
	JzYK/6iRyhFsF7tNyZh2RU
X-Google-Smtp-Source: AGHT+IG41ytGn7VITPy8bf2YNNnKQHG3TCNTTLkGR2XfGytSSp3X4wHm+SmUglrCJRjRU2Y1auGS/g==
X-Received: by 2002:a05:6a00:d0:b0:6d9:aa6d:e3d3 with SMTP id e16-20020a056a0000d000b006d9aa6de3d3mr4183497pfj.66.1703860680401;
        Fri, 29 Dec 2023 06:38:00 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y16-20020aa793d0000000b006d99c6c0f1fsm11544727pff.100.2023.12.29.06.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 06:37:59 -0800 (PST)
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
	Vincent Chen <vincent.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <j.granados@samsung.com>
Subject: [v9, 08/10] riscv: vector: use a mask to write vstate_ctrl
Date: Fri, 29 Dec 2023 14:36:25 +0000
Message-Id: <20231229143627.22898-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231229143627.22898-1-andy.chiu@sifive.com>
References: <20231229143627.22898-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_063803_577894_AD85211E 
X-CRM114-Status: UNSURE (   8.31  )
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

riscv_v_ctrl_set() should only touch bits within
PR_RISCV_V_VSTATE_CTRL_MASK. So, use the mask when we really set task's
vstate_ctrl.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v6:
 - splitted out from v3
---
 arch/riscv/kernel/vector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 66e8c6ab09d2..c1f28bc89ec6 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -122,7 +122,8 @@ static inline void riscv_v_ctrl_set(struct task_struct *tsk, int cur, int nxt,
 	ctrl |= VSTATE_CTRL_MAKE_NEXT(nxt);
 	if (inherit)
 		ctrl |= PR_RISCV_V_VSTATE_CTRL_INHERIT;
-	tsk->thread.vstate_ctrl = ctrl;
+	tsk->thread.vstate_ctrl &= ~PR_RISCV_V_VSTATE_CTRL_MASK;
+	tsk->thread.vstate_ctrl |= ctrl;
 }
 
 bool riscv_v_vstate_ctrl_user_allowed(void)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
