Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F128C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 04:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBoi3TludzXQKB4y5mbYXIWz1RaUEj0UxOrD0WXy9GU=; b=MYs3MFxO/lTX6B
	aYYf2S3r911hSk6AjWgSUUGrFmXTXtPviW1YB8gQvCwpqmstue28sVmCJqqKwgHnROY6a5ZPZ6k69
	ze+vkRYdqgiNgI3zlNo7KH62jkdsgZ7bPn/YtgdlibgCKEzf8AMWWt0sN2VUl7PNvqyhiOaakRMqK
	Rdvw22kUfSnewHIiBGJAEpMIcES6R2EvTp6xvwNRF0XZW2aKDpl0YD5G6St3zl9c4rnPYBj511OJM
	aqZHeYkWGA1ctgOqzKOmqt2Dut9+FzkuUMXyZ3fPV8YKj4WER4FYNOOepYhY99OQVH4C+MERrcqvN
	OgmNM5jeyKfqopbvj9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtf9-007MJq-0P;
	Sat, 23 Dec 2023 04:30:59 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGtf3-007MDE-2p
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 04:30:57 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-20389f2780fso1724182fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 20:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703305847; x=1703910647; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=dh7H7ARpn2TcSk6+7HwMOXHnxMzuem1IXoo5d0H5KpjVj7QnSZHs9t6tnTX9gsd1cK
         yxqOFDtWqJKFdGqEQCp7CvGwDyaqxty3MQCtv7yq9HPUaTu/EMr7uzwYdijJxK7NaIXJ
         sf4ApVBS4ZQpCd/pp3iPhruDuSKt1gFVHlM2fG8TIJ61IiXlJ9qleVEzqCQYQEx41wsU
         tPKQYKfBsKiJ+QQ9wAZlqGRRY6zTNoRay91dhfRHON1V704mlaYEc3Gt/L6KBz7J8aVk
         pjU4TK91L0MIKwGNMl0eUjdgr12L5QArrhdqdWWjXNm0pi3w78++oHPhopvqNkdAMlwD
         00zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703305847; x=1703910647;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MSU8pZMg99K/bCQ2FBfCGwDj7GvbS21JTvN92FV/sE=;
        b=cS/G+iBR0pTyMJ9uM0kC4ZtDTDecbH/xWyrunzGS4s/TXqYzcVkFnA00bvybcoQPNz
         L2mgJyTeFLMjwxL/J196jwhIjgGWbFpT2nboYrP2Aq73rIY3dKBs8Fl38lbRFtXp/JO0
         9dpi4KRDqLHEJ4l+oSOyYl+/U48NJqAGyVv76AUlvw8ykGduharIaTtxmm6sxRJ6UmsF
         u7zGMOpbPeqMyQwrNxQW3SdQemKAY6S8eZvLy6LzBfYaa2cHoaGftTekwIJFb5OAWJ0a
         Z3/DKadAYLQE6rG3FHQRAjbAcu269HzR6vQNTh/6vDSWtDDEckFtAiHt6ENbXCUJsWmO
         9Jew==
X-Gm-Message-State: AOJu0YyBmL1CTa/oGpMCMEPzMKwevhD4YGek8KGBzunliZaDrE9nc0jG
	vXAw7E1kzL7Wn+kEk5U9ngvLzgPND06pYpIg+eatNoHTE7X8vWhcL/YdeocuJrZnxqgYLicnhAT
	V6twhOLB/vQdkAtJxor4NP4zOQ+vmOIjV1R/g6b2PJMX+F19SuZeNaoehtRFiHRgfnfWiw1fM6E
	fm8tMZsZIIbi14i6CBvwdN
X-Google-Smtp-Source: AGHT+IFwm14iXktHdrYHpS/tkMosMLHYiE9mIhqIgQC/pck5rK1jaqeZZEd0QVM+q4DYaUB6zwmSfg==
X-Received: by 2002:a05:6870:ac06:b0:203:b7d8:ea2f with SMTP id kw6-20020a056870ac0600b00203b7d8ea2fmr3526192oab.4.1703305847457;
        Fri, 22 Dec 2023 20:30:47 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm2623397pjb.33.2023.12.22.20.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 20:30:46 -0800 (PST)
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
Subject: [v8, 08/10] riscv: vector: use a mask to write vstate_ctrl
Date: Sat, 23 Dec 2023 04:29:12 +0000
Message-Id: <20231223042914.18599-9-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231223042914.18599-1-andy.chiu@sifive.com>
References: <20231223042914.18599-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_203053_915367_5842D973 
X-CRM114-Status: UNSURE (   7.90  )
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
