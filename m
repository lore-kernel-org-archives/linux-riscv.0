Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEFBC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 06:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBoi3TludzXQKB4y5mbYXIWz1RaUEj0UxOrD0WXy9GU=; b=wx1nNzo/tga2qs
	LRuw5Zs+zVRm8cAMQv33jSRqIV/N3sp6dOKw+njmz6yBuE3xNYFIa8NiPvL25CWFd49++XwereDQf
	xPD/o3YCmF+ibwcjdyxUgtkvAQvfMhOBX6hDvn7ljbi9WoIeRMylCPL3mg3HW4Rpf+diHQ7Km0yBP
	ReZt8uilJRgrm3suz/aW5OHFFLqsFltRamLt0kUMLea1OMvB/Oe5KMI30OS3UdezR9h8XdQIGQX5f
	GCC3SyLAs92ChCpjUNja19bRkSnUmP20Be2PB1H3tdBRDoUL/U8yw0cYvJmJuGjo9qkOBfWhnIl+P
	O3Hy0d2sxVKbIm7gdX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG1p-007qWn-0N;
	Mon, 15 Jan 2024 06:00:57 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPG1l-007qUr-0t
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 06:00:54 +0000
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-595d24ad466so4739663eaf.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jan 2024 22:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705298450; x=1705903250; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=bXF+toU2MoS0KKkyJuhWpreG+X00SoASTsHaDWfKLbF/PmBED4/4RtNGBtr7XlQdxa
         grN90aFvJhc15ushD9XYdKeVJhuZh+vIme9gpBWgBIRGC4/B/cfkR5qPSRwwxfNhEOHY
         1Ib+txuef8WOw8mJri8NG/IyYolfwkzfxKn2PJKNkBVb3RhdsBhjV0AA6fpH662KVLRY
         l7bZUr9GHN3oAZv2AQYRoNqsO4t2wFvgAJvWUI44IZyy9FHTNZ9gQCF4/j5RHOJKQVZx
         oK8xV48D5URD9aQB4YbTBaay8glIpkpFuO3xDqJMgIFymAJj0w8b5IclBioxcS05N3tH
         4ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705298450; x=1705903250;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=wVkQIqpBGg5qb5ooAJrYs5JOdkUV7J1ru+fJmHLyKRrL1YmSTOUWhv9RzUm1znxvHF
         EjGU19p3aZCmRuLPJXtM+6jd9C7KMcLe4YkPBy9aQq0h0TanbdPqia2oYD5GkFzvSFkW
         7jHDT5fRZhMy1xnMQS6tXRlwZkdlFx6dQ3AEku3FFsvtI4Qfqmf0NbO2mjMtoNYkUY8+
         viGYXJLi9eWjcn1lMZ8w6Lh+/AF+srldXhv7A077bU7Hc3MRhy80KXOSFIO/pnXWQUBj
         4wYN1LRiIOKoLEsCSkZLrZzOo8rwUdEN/y48aPgd3vayAPL2D+Bor88hBW7GhpoOK3tx
         Yd8A==
X-Gm-Message-State: AOJu0YwVtMLVTDJgTtm6qIU2up/eFCVHKcZhWYy0qhZ+lrHhuXN986qu
	aTT3GtvDhx7TBCLZ2sL9SD00AX2JBOUGlbUGOqdmn13ZVhHBLStOd3zGy9q1B7IKtK1nLE1aKtR
	kJHto4EMy420jSrmJGmMU+tTOhRAPvIvfh5IBLrro8/ZvpuKKzRc6zxP3xBzkWWoLdLvIF6p82r
	bVM622CoQV0fKKt70rEIZm
X-Google-Smtp-Source: AGHT+IEn7xU6IC+M/5r6sSIWu4YSO95H2j5r3MOp4KcjXEWtIIZuD7gRtbox/7/r1kJguGHn1J/Qdw==
X-Received: by 2002:a05:6359:3516:b0:172:ea55:1ae2 with SMTP id un22-20020a056359351600b00172ea551ae2mr3693788rwb.37.1705298450327;
        Sun, 14 Jan 2024 22:00:50 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o18-20020a637e52000000b005b9083b81f0sm7392988pgn.36.2024.01.14.22.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 22:00:49 -0800 (PST)
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
Subject: [v11, 08/10] riscv: vector: use a mask to write vstate_ctrl
Date: Mon, 15 Jan 2024 05:59:27 +0000
Message-Id: <20240115055929.4736-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240115055929.4736-1-andy.chiu@sifive.com>
References: <20240115055929.4736-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_220053_315420_8A9D102A 
X-CRM114-Status: UNSURE (   8.72  )
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
