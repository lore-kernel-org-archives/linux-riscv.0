Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D5AC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouudiRHdDqYhRJyMVqjr7OGs7TIswItqnBrrQh+2J7c=; b=Xk6qPmSxZruv8s
	g5QD383mTdLT8gAPmC6FkLSrgL7eCy4xVyC+jKtdGKR7uaeULqzDjJMs4pbJPLfUowTBTpwRkBe95
	A0SWBkI4MJmqKwuaSR0MxHNrhMwxWaWMpYboFigUD3Sfi4xyu+sDwjZDqM7/S6RgdJ8n78JckXHJB
	TL+Hbs/UeYY/R96oYGzIGyEkH2bKNs546W5Mx8V4X77YIKNFgvsPeL6mgQt42cCI7fE/wl4vJGyE4
	AD3Fo8sv52gsjXpnfQALpySMGKJNB55TAYyuuXTQCHagLBsblHhPx/ESWm/bKZA+1AOlXKefEXOo5
	qzgGo+F1OkL78hVr14jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhSe-00Ddzf-0f;
	Thu, 18 May 2023 17:30:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgMY-00DQqO-1q
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 May 2023 16:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=; b=no7QIhnv+pstQv7T13kmtlc+FC
	JRKsXqPFClGegPC/OHHqJrJKX/WBrdMMmAyZocDIopKZJ8ZRUuFNwo/q1L8WxO7fkzr/r/iP0HRo2
	XbmmJuGSXMXmsn83jeyJge4DDxBIY01hLPU/6U9tH1mqo5Xj9yUCWyL3aZp3DrYstgHEpZKzSncHs
	X0G6Ir8IP2zp4gPB1aMtlm7F5p8fn8uezoTKyy03S7NhdhiEpWXCKTQW52wTStqTiadEdwzNGY2vL
	lBtuRlOq2Bomxy3cqSB7RSCHUIst6b9VZQaV33RedEmVVJjkGiScKMnurBnKlLc6MZcZRkoayzDk0
	BEChTHfQ==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgMV-00ErIW-0Y
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:20:21 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so208905b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426813; x=1687018813;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=gEhgqju2wKcCZblFZ8N5g54ria8NkU2Jrsgh2HBQGp1B76OifXlhO1uLHApY5O5kRL
         JgXeGtEK+yBT3f196jJibssDuX0BZNoMdmDYyzKG57miQI76MrZYtHf/Hdej1odY0EQF
         H+gt+Wp63F/cMyYkBpPWKNs5G8/uhRWkmPKiabu33P+e00RvvF4lUnd2MRunJYWkLbRr
         Hj7VtF7r5cdTKk0Hbe7hnlU02gQ7WZv3EoJUJfNOxfgvMD1M5+Ww54ZODZbVJ+nyos7D
         +rHJgLWHxZcNpuL8QHIu5pL7EH9QCKNiXxUYpKxXIRFKJbD1zXGZw0ggmfrcbxdzAnz7
         sLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426813; x=1687018813;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=l4kUT5IdvyvzafIwH/EhI0U3Qzuuu2Dhtr2JeWFrGCaV+E1jwOIA6VW70LempTRBvv
         OM4S2rBW3ZWO3pvuW5u+s2rdcbOwvAMF6ZavWfu6W+YXR70LVq3uc7VaxS7uDfVlluxp
         oWwUM1jqNCYy2osSxENHHsE2eXAV8xOqYRVV39dyc/kWgMiAakvVKNH5okO7g2V8/lxR
         Ccyj1QM/tSCJbYDj1h08nLqUmOUKK67URsiWbzyfeLBdHV/H6PfiFESwETAf30O6MIUP
         ko0emGltjihx4kZuaKnn4A1pGa6EOJZ7oKpNCim/hSBX2K3d5CgFj1YjfKA5XNwagltS
         Whlg==
X-Gm-Message-State: AC+VfDwrhcYMQ0Xn9EP5sb7TfY/3jb5Rn9TyJYO+VK2pbqA4Lewgqo3D
	RJK8FrkRXqVff+8OKT2vMp9UdtHwXc03jsgReHXS/z1495rNPLlPm7GeKNBdovrzTxP3oJrEAEW
	ACI5hjgh5kC1j/QAnldffTM67Xt/dNFvut3b5g/rNiq9Mv9M2OmlApRU8VQm/ZZYvNngN+OpDMN
	wHzqnBnDhn46zVRso=
X-Google-Smtp-Source: ACHHUZ5WSoRIzD52+jf7cC9k7jLjwXrMwTQkVVpxACYNriXgtThbxraiZXQUJAzcqiQXme89jFje+w==
X-Received: by 2002:a05:6a20:9d92:b0:100:49d1:6fc7 with SMTP id mu18-20020a056a209d9200b0010049d16fc7mr208625pzb.34.1684426813385;
        Thu, 18 May 2023 09:20:13 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:20:12 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Guo Ren <ren_guo@c-sky.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH -next v20 01/26] riscv: Rename __switch_to_aux() -> fpu
Date: Thu, 18 May 2023 16:19:24 +0000
Message-Id: <20230518161949.11203-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_172019_333715_799B164B 
X-CRM114-Status: GOOD (  10.55  )
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

From: Guo Ren <ren_guo@c-sky.com>

The name of __switch_to_aux() is not clear and rename it with the
determine function: __switch_to_fpu(). Next we could add other regs'
switch.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/switch_to.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 60f8ca01d36e..4b96b13dee27 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -46,7 +46,7 @@ static inline void fstate_restore(struct task_struct *task,
 	}
 }
 
-static inline void __switch_to_aux(struct task_struct *prev,
+static inline void __switch_to_fpu(struct task_struct *prev,
 				   struct task_struct *next)
 {
 	struct pt_regs *regs;
@@ -66,7 +66,7 @@ static __always_inline bool has_fpu(void)
 static __always_inline bool has_fpu(void) { return false; }
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
-#define __switch_to_aux(__prev, __next) do { } while (0)
+#define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
 extern struct task_struct *__switch_to(struct task_struct *,
@@ -77,7 +77,7 @@ do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
 	if (has_fpu())					\
-		__switch_to_aux(__prev, __next);	\
+		__switch_to_fpu(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
