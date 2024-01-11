Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311F2C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBoi3TludzXQKB4y5mbYXIWz1RaUEj0UxOrD0WXy9GU=; b=rNcfB2gmY2Pdno
	rtOG0adUu9/PoWlq8mXJwciwwIuhwrYW2aIC6tgXmoZWjYFxdo7V/mg62+O+pxxMdtNuMn8qVrLsP
	p2KXspPfHbtSd2UQuNBHyGzi8h0ZuzmIUM/8y0ZrVWEdkvJPZpFU7JjgV8qoo1naNIkWoFrrv1F9a
	t1BpLsVEJnrBwFW9s4V8hljSOKtFeFHWYIWWaXY2zWt+gHWKwlEdFThmoN+FOGAKCQY0y8KclB4VA
	2EG5yzyKBNGY5LBypjQVFuXHYn1SemMLIySHaJzkK4O/zUXe8hoJslMkTyFbMZUFB0BMTS97LAmFx
	z+RYU0PNRl+TwrdIohPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuw1-0007eb-2V;
	Thu, 11 Jan 2024 13:17:25 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNuvz-0007d3-1k
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 13:17:24 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6ddf1e88e51so1177429a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 05:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704979042; x=1705583842; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=YvgcdhN+lP0gqAzlZfS0/bBh477B/ZHBdVKqt8Dc0bc3uBtMrauCJb2iqtpxE5MgmW
         8X6Uu1ngY1XLNaimgqVQk1fm5xUJZBqxaz7170fRI+BqD/VM06lPDWfuP4KPvevYWA5H
         aTCF+7pRNcxhw0XyY+JhnsXJXyekweO2PbtanFKj2FAlLT2Dqf3es30HFkyHExFELvx+
         NS6cej1jlEAIaO/YAQq5AIky7ELVLB8p3pB/7QXGJxb1sLr3pU+T/2xJa5fOKYurLMXB
         U2yIYyU9sdNEnBEhK89QeRXmH/SKrYpFW2zemFjgAtkzsbd8EThF2F3OAjyTxRSDLzpG
         dQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704979042; x=1705583842;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=AHKB7wg4WTiFIlImUnZFliptdyXC8VMXA8aGaXyo0VC2kpkxTAkRqIcF7hCno+y3eh
         uU23TDh8EaJWjSQEKO9y4QMgc39RfMpS5JY3A9+j+ssAhRdCml1Ob9EG4UZNPq7fWlyq
         rUQVKwEXfCCRsbr6GlfoiwZw36zJ93fmUQQFQo+GchI3C7fuJBtgZnhkMlH4psk45RH9
         li4dDJEmmMtmY2xnWvSY+0UTeSBrsVf6u5Bcl2vfVtxRlm9JZ7+nZ32t1+nuZMenpLYC
         IBWZNCBpgzUAjwLZ1tgOgPx9vpdFO/M04MexE4nmbiOxxzJleUZwUtbaMmt+/oDEJ1W9
         M86w==
X-Gm-Message-State: AOJu0YyOdDVh+gm/ecI/nUI2BT0l1lBTq4v58sTXpUZ+Er5UNbKpgdVp
	U1viIWP9GG4RxaoXo46//+QMMsSd2BtOD+lTotN6tTBQqGTtdqAgXr8vgIEzMy/eNcRYKX+PxH4
	woe0RhrEZuAUKovSROnlkm1rdrGMjeCNZ6IKAgQUJduKYJ2mMQ2/idzdHOiKVX1cisyzek28L45
	KzenZOJOo14AhcDEOzPnuF
X-Google-Smtp-Source: AGHT+IH20B6OJLyV4Fc4z5Qwcbn9HrAlFxW2MVqFnc5BThW7i1ZMIH9gFO+j9lbnzGtpAWaOWc5Qaw==
X-Received: by 2002:a05:6830:20c5:b0:6dd:e1cf:221c with SMTP id z5-20020a05683020c500b006dde1cf221cmr1406864otq.70.1704979041773;
        Thu, 11 Jan 2024 05:17:21 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id ei30-20020a056a0080de00b006d9a6a9992dsm1103202pfb.123.2024.01.11.05.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 05:17:20 -0800 (PST)
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
Subject: [v10, 08/10] riscv: vector: use a mask to write vstate_ctrl
Date: Thu, 11 Jan 2024 13:15:56 +0000
Message-Id: <20240111131558.31211-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240111131558.31211-1-andy.chiu@sifive.com>
References: <20240111131558.31211-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_051723_577134_85A75018 
X-CRM114-Status: UNSURE (   8.44  )
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
