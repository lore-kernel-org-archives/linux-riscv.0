Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26403C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBoi3TludzXQKB4y5mbYXIWz1RaUEj0UxOrD0WXy9GU=; b=kBH6DqoT6VkQQe
	uTgo+fQo9SWULbfa9pNGha9+ae6l5c9TInbhqxCZZkyWmo9LhKYkEEKFW8wrO/flzLowKZUmcPMg/
	nycKO/5lQEEcHRqcP2YqeDGVNEwJ9X3wGJ7vZlR3peYLCruxQDAjwmQnwOa100QucFv+Q5E8lNqdz
	4epDqaJ/E6GRJgl9S9vsgBgcVj22Fqgfl65pG3aN51h1H+m+rH4z6CWcjlNcUXQn5p1RBUvX9F8vH
	A8tm9cFGRbpUB6ssBJOduvHlPGFRVYcznfRTJvQa/1EJJHOIBmJ98v7wUNH7RuEnb9jptPv6ay8ZW
	MEZprX0sAsU66HY20hMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJM6-0032EK-0I;
	Thu, 21 Dec 2023 13:44:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGJM1-00328j-0F
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 13:44:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d408c2908cso1975415ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 05:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703166285; x=1703771085; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=kJ2wDGjNNg1QF4hz5KEXY+FdPMKrii0UKXFqQU9L1Ct6DP3V3EmrQ1yhET4nDP0kP9
         tmfODtuz96hztv8WYPN7MqCYrgP1csqWeyg9DhHVxBKNUcbC2GNrGFNyCvABC3d7BunN
         5HPgmsJmhNTHCqNat4xQMdSYXQMzpax1eYQK4rorV2z7JI/gU+bhxSBWREl3JaVhJl4O
         nJLnp1OdLtoZ9TYEehFEsM57Xioh3vcjaPJwbSburRAzjUPtimpZhnli4eiBnAhkpG+2
         jI+dYBIBK+Eynq8xrLFjrczTGSenatbuE8ypCbWe9cbUvvqY9VWk4XnPNLJEkOeGBiIc
         Mexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703166285; x=1703771085;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=VQJFDpLWibG/s3tDWS9Ag/SyYgM3g1206HGXteQWkkh8GO81lfYnjsxj3KZ/8oo5RB
         WIr3UdsIJqtUmDOrHLRA1Wroz2Y0Wz8idHsIJZkI14X+so+mIJz+7mqQiycjI1Wdf9X1
         6GnYheztnrx232xmZSzh1M15wcdTCv3deJXOdlTJPDQPK1uXxwpuInq366L0d4SE/kWu
         PMF4anaQTKAzuh7HxDwyI5a4C8hvBKVthQWqmxGrF1XmsCOIRkfwTg5LXm2LDVlQEXSq
         ucgLeChgw3s7OSQNtbG37GcDgR2sLJIdkOczc3RMDH28S/uadmAYDXKLQZao2ZnZe2Zy
         AFqA==
X-Gm-Message-State: AOJu0Yz8EuG/Z+sOWXqKRXGvOLpjAWn/EyYHGTA450Ca0C45w1TaHUiw
	DXmS6mCQKYOc4S/Sjz1eLXpqNr2upTnBi9zMEFOIDYfCTepGMyZk7K6sPw4bHmjCaZ9FWSnvuQp
	3SRxzdfP8oCUKBByqU/OIeMMVzdHE/DQE8Jr5imnWozW3vrfu0lQ8NacTqnmZlz9Eo2a2IqsZ1a
	yGDtzDL+nBeePd
X-Google-Smtp-Source: AGHT+IGdEEDxX9XiN91ul6kDEy9PC3LCHGUGQUp/Fa1/M4436qZCkmQl4zofx+MeelR8gw4cIorBjw==
X-Received: by 2002:a17:902:74c3:b0:1d4:5f9:d3d7 with SMTP id f3-20020a17090274c300b001d405f9d3d7mr669796plt.127.1703166284909;
        Thu, 21 Dec 2023 05:44:44 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b001c72d5e16acsm1646001plb.57.2023.12.21.05.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:44:44 -0800 (PST)
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
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <j.granados@samsung.com>
Subject: [v7, 08/10] riscv: vector: use a mask to write vstate_ctrl
Date: Thu, 21 Dec 2023 13:43:15 +0000
Message-Id: <20231221134318.28105-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231221134318.28105-1-andy.chiu@sifive.com>
References: <20231221134318.28105-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_054449_112669_56C936AF 
X-CRM114-Status: UNSURE (   8.07  )
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
