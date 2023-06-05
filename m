Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3105C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouudiRHdDqYhRJyMVqjr7OGs7TIswItqnBrrQh+2J7c=; b=MLV5hmGa0RKJ09
	gM+7jsNYz3eck10NepzIsbsWqp8tWN90qDvm0Rxx6ukJT0C5H1ymg8vylbly62iHUMPxzAUrFvSfL
	WEsBFaYzgg9cBc4jjfUqKwiYZStj8pRjkGS66qiPEglAH7P2AVljIPQ8UPgtKDdLK9xNyvnuQ5llt
	2Bc8TqlvJLiqDnKnp8gY09CUI3aW47mWyzeCQvEZ6lRWdr8c1/1eg09Z4cvysj0MS6WScbHXLAUwR
	d3jLCjm6ovapJaF1ppkF1ePo6he3bgTzEGZ56v4+KK87/+8Hfm1GzQ5gywYxScFlqs2JyHFUAXBq3
	9xPVzL6XO0xfbIMAWfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJ9-00FyWl-2C;
	Mon, 05 Jun 2023 15:39:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CJ6-00FyUl-1u
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:39:45 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b02fcde49aso25135045ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979582; x=1688571582;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=ThHvOBpo59by52p4+jOSX8l8hNtU/M+FRtpBWS5wO9S1Ftj+KDeHvoi4qxb6y5lLlA
         klRc1tpT6wmq9fEsliWnmRX6vlH8Kc+bCJRFfGkoRHshaIALNsYdCc2xbs2FlgkuVE+a
         9NtsfsFMHlAHzOxpaytXXVIKMf5ZnmvEqVZr3WNtAXnIt8o5kGu12PeWcnv4ioXbSMuf
         jN/C83ZeDQ0qQxTYfKWRRByNKh5d0S+3cEsHH8UKRVCG5lbq8T8G22yixHNLydlJssXu
         xa6hUsw3HQ2NufRvFPAxAU702WJccbvy4Ho1ymVAmBN/78Xpr0SiOoVA+8OmGWfUUcX3
         cS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979582; x=1688571582;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZD7AFVtobxh1FGjEKQD2QW8IDIT5bzbSx/S1GQl+8U=;
        b=LjzOXTYc9VtYb2icF+KgBeakoQRbqHyaMakbx68P6iOkkJr8uKS6vPc3MKIiiVbGAg
         mfLKEAxVmiY8LLvBztmOB3QDL96Qdt11bUWTscfd/YI0wmVd1zqtRc6+WtRyXSg4IgpQ
         f/QF2p9ms3Fdm7FkCu4f+Aa6fhb8AB+la6NWN8TSFZHv0Q1Xs/KVr0xBIVe4CViVb1fG
         QFtw/MuQRMsUdjeOpjl/VghOh15BtdZ+9kLd2vyvkQkrZio21hBYcs+9akCIEm1afz0k
         +ODhu6+UwUfkUJUASqq/MQ64recq+iBrkmUrwjcxxRpQXxKl6gIyAqWBRJwXCkO4djg3
         QJpg==
X-Gm-Message-State: AC+VfDx6zLsp71WjxOFyqxRBE7BC3WaegyL1gQSJAcYqS/VcUWT2pkAF
	btSL/gA8jtPCTfWvZnTg8KXESb+Fvv/+ztPL/TDdp4Rlw3P99BiMijF6kvBm83l7LvHLrRTD4VP
	cMvOjMsHi1rOBGjz5CIafFSz8X/1Tz4VRoD6gzb/OS9eMejePPW4lzqinj6073twnxwxfv5+AlO
	zl9eUrJ7NEBlb8EKo=
X-Google-Smtp-Source: ACHHUZ72dieQPrM1WO2qg0OnZlgNQI7fj+3mSJL13ptwQ3koIpZJKneVebsItPgSW3CMo5AGhAYPcg==
X-Received: by 2002:a17:902:f68a:b0:1ae:626b:4771 with SMTP id l10-20020a170902f68a00b001ae626b4771mr4573871plg.36.1685979581841;
        Mon, 05 Jun 2023 08:39:41 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:39:41 -0700 (PDT)
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
Subject: [PATCH -next v21 01/27] riscv: Rename __switch_to_aux() -> fpu
Date: Mon,  5 Jun 2023 11:06:58 +0000
Message-Id: <20230605110724.21391-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_083944_635241_E20DC604 
X-CRM114-Status: GOOD (  10.51  )
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
