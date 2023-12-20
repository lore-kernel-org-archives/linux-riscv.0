Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33550C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBoi3TludzXQKB4y5mbYXIWz1RaUEj0UxOrD0WXy9GU=; b=Y+D7xRbFztDOuz
	VZ7P1S8WZou5uIS/Agl2EA6oQmGHslEBmUv7DjrPHxdwwaUhwrgJkAjLuaRenRTWGTTnDC2p8owIf
	FmYCkHRqoxtaCgE6wYNXdVABC8BjBIIyu5zvFG/3nyci7rpeXvAjELmGHfbCQCBGoLf50QjW8eO7+
	loM1xe/CTsv/5UBH/UXsHVhYkOEiBe5xHHVIZmol+wm202+bm2Oa00vT+fWSRtiUe/ELAcJWgUZwa
	VdTX+YupWytfHRCh1R2Dl/ob9MsYt8UBPeDSJB5o+MSEUH0CS02cyJFFvKtVxs92LV8n5KaxbmZbm
	nSBLzTwXz0hBYVDpvI3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrTL-00GUu3-0p;
	Wed, 20 Dec 2023 07:58:31 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFrTI-00GUr8-2a
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 07:58:30 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d3ddccfaffso11356425ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 23:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703059105; x=1703663905; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=P5Cxj4sYn/DUqYRmscS0Hi8QTiyLCMucfAQpAUL42TnZFrnExtv89wAHyWaKA6K9lS
         JSSnP7J6jAbDpLyyroOXGhj/L24/DcH2gQUbErSwVAbG6Z3kmAweahbLXv/Lzrno7hsC
         mOAU/GBI1nCjf4zZui7dPcSYWau9i82HcLEJo93EkahVjQMHpP12VhKatTplgFN2Vp23
         0u0SR9VkmeLX79QZuRoJl8Zm2oytlcOTZZvU9vbOUY+w6BYkU/pLcdq6uUcMdv2f6ulm
         STdaO6my3avU9o5y9F+IRx5eD5+hz++tIpCup93mmCstJmvpx2zXICHKbVSsxcq3YKH8
         aUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703059105; x=1703663905;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=FcnGV7UblCxWu0yPmt5286YnlIQqkkLn4u7l2K34mVhX2DuIn5N+NHJXupiKTZFmVP
         16/Va3N3FOFdTI7E5jdZuNynLCkZ56Fq2UaXPBi1BjNOfdju/v1JX/Z5h6VsGnJyx7yS
         anD8fXuW8/o/3J34O1yq+6a/EXNfc6DJV48cNKcLnDuFNCr1tT1Gf0Zvvn73hrHvfDZ8
         n54HULEqCqXqLliXVNPyvGeX2Cqmj0IAuqTFWIhqL9eRqaVfP7TUAlfUCnjqpTe3a8Bu
         8QZic2jum0QRwR942/sYJINo+xuSwW0P66u28keKq/8kTwsfq7tbwQ5WYx2phZPIls+/
         mGPA==
X-Gm-Message-State: AOJu0YwERRKwfee84HUMcg2yH6lX6ysIfCKJvtoxwIuLsDiCMfftrIu7
	4C9pYSOKXP1YfxXMmIq9EDH4resJjrzuq1Jruwy0tfGW8LqAXg4p1RFK6KWgJWNI+dCYBMHyxfX
	kricxJFIh4pMZZxcboYejVcFn+ldqABINCNZk6SO5EuiGRoQB63BrohXo1KHE1B/Vj3gi5tkio+
	f4KTvMzU4EDTQq
X-Google-Smtp-Source: AGHT+IEqLdd4681a2XlLts0MEEprcq7bkwekiWYtJkmDWco/5+ierGWMWhhE5el7ppd9a/m4JCQCiA==
X-Received: by 2002:a17:902:6547:b0:1d3:eca1:91b8 with SMTP id d7-20020a170902654700b001d3eca191b8mr730511pln.46.1703059104684;
        Tue, 19 Dec 2023 23:58:24 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902789400b001cf8546335fsm3441453pll.5.2023.12.19.23.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 23:58:23 -0800 (PST)
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
Subject: [v6, 08/10] riscv: vector: use a mask to write vstate_ctrl
Date: Wed, 20 Dec 2023 07:54:10 +0000
Message-Id: <20231220075412.24084-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231220075412.24084-1-andy.chiu@sifive.com>
References: <20231220075412.24084-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_235828_838036_B5B618DE 
X-CRM114-Status: UNSURE (   8.48  )
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
