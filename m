Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F35C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 09:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nb25p8hWFE275cQKCO5SjYnDujn0TBXdGATjcy/vu8=; b=mFeyVYh+KasyR8
	OUqpmfk3xJyNlyv6/VdtqNRCKMi2G7UOnyvRA58ql3WxNL7vioutxXZTMsK3HZPHrJWv2Nyjx9RrO
	eWvx7INsamEv1hajpdSbVNjyDWaAmDjMC0KFM/q1OwaI9EyakgeAonQEWPXi68GBM7QV49OpgaLly
	NmKJ19wnXR+PHuUxjHxeFbAax1LEMjLkt9YMou3FZiBSt8eQK4Pep4Ol9zXWmTzTCSqtP1Evof3Y5
	6r78/F6begwJSq4mTA3MHRVGX9fzOl/4w9ZZwF+Vfixp6Alr+/oZvhzVO+OQ+DaM9oRTULymG6FC7
	JEavtpj51ObTv9b3fYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2T6-005QLd-PG; Tue, 13 Sep 2022 09:44:36 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2Sp-005Q41-SF
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 09:44:21 +0000
Received: by mail-pf1-x42a.google.com with SMTP id y127so11213074pfy.5
        for <linux-riscv@lists.infradead.org>; Tue, 13 Sep 2022 02:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=saRR/6nCOIgqLHYGWZSQr8tWkj1zq1lFUdbeWGIHYAE=;
        b=FuRwd57OR4uVBNCsS1+0wqWCJYb1Dc0kXsqg7Im4uv2U7N49miVwHQS5eRCL0k3jVR
         vYpmveJdgKnF99rF3iwVdfmlg2Un0OmMk0ydTwnPiQRG2s4ZXz17MYFEz6CY8AW4ptAD
         ClzkiL00jWgKUR2zXt1JURuDx+uHB7yPUjLajuRlFJZTh3A2I92dmE8HJu6HMJFu1yFZ
         oVqkB4HBCX2+s8pp+DqR4HyII7HsW3zOoB97/PkjT5/iayWw3pNGCMlehSTFGgwAwg6H
         vwE4LKT5kG3diP3ihji4/8ZWeJ95vs1vb+E+rfgtjeBW9Rpq5jss7DPv4mwpHuiX6m0Q
         UOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=saRR/6nCOIgqLHYGWZSQr8tWkj1zq1lFUdbeWGIHYAE=;
        b=Vux2ENK2ITM3YSkmZ4a99rrDbWYneV+2wTAReRwesFA74slRH0DKQwt1Uydn+CKons
         e7mpeUa9r+KjJK6YOv95AzfzpZf/FHdbZtsrJkMsEB8HFZtKHPUPQpaZnU7HQE6Qt+tC
         h4RjMH8lecF8wSc3AIr8QnmWy95jZqWYRaoA9ZlI8V+rCnOJrFOWJK7dClbeE1vDjfUW
         U22gjTpjjwJfW/kOC7Ec01Ee0mZDrXuW8xWPJUL2u7Za1Sd9oI+BLMOF9D8ygYln4uPg
         CJoRfpV0UILYpLpArUupFRP/cGcG1AXU2WZNotLMIuRf9V7GCxJo0PJa6ho49MQhW7Vs
         Ulqg==
X-Gm-Message-State: ACgBeo1Nxu4sauVF42+y8TyR7fVO23CZWRt/S71U++ON14CjEYob/Dmu
	XrVPNYWvOiwZZ6euErGH+0jTpg==
X-Google-Smtp-Source: AA6agR5xfrOA/BRCowAysZrwp5Icf3jksyPBxN2Z+wbqdA96jBQN9AiwM84Sl7XFiehU439WxEVeXg==
X-Received: by 2002:a05:6a00:88f:b0:530:dec:81fd with SMTP id q15-20020a056a00088f00b005300dec81fdmr32433752pfj.64.1663062256904;
        Tue, 13 Sep 2022 02:44:16 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y28-20020aa79e1c000000b00543236e83e6sm4904428pfq.22.2022.09.13.02.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 02:44:16 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	ardb@kernel.org
Cc: greentime.hu@sifive.com,
	zong.li@sifive.com,
	andy.chiu@sifive.com,
	guoren@kernel.org,
	kernel@esmil.dk,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch function
Date: Tue, 13 Sep 2022 17:42:52 +0800
Message-Id: <20220913094252.3555240-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220913094252.3555240-1-andy.chiu@sifive.com>
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_024420_009515_C316FFE7 
X-CRM114-Status: UNSURE (   7.64  )
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

runtime code patching must be done at a naturally aligned address, or we
may execute on a partial instruction.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/jump_label.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
index 38af2ec7b9bf..729991e8f782 100644
--- a/arch/riscv/include/asm/jump_label.h
+++ b/arch/riscv/include/asm/jump_label.h
@@ -18,6 +18,7 @@ static __always_inline bool arch_static_branch(struct static_key *key,
 					       bool branch)
 {
 	asm_volatile_goto(
+		"	.align		2			\n\t"
 		"	.option push				\n\t"
 		"	.option norelax				\n\t"
 		"	.option norvc				\n\t"
@@ -39,6 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key,
 						    bool branch)
 {
 	asm_volatile_goto(
+		"	.align		2			\n\t"
 		"	.option push				\n\t"
 		"	.option norelax				\n\t"
 		"	.option norvc				\n\t"
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
