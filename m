Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6168EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 06:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iit7Ds/K+76qG/8YctqOuVUh37WvTw6bBrn0837AkrU=; b=1fE2jMitk36JXB
	64AmJsia3G1MAkuD56D1ATwtWnGT1qWmHmrUW33fa07nKnd0dHPn6aTMZwuBVB0UdNkLJf1IFU6k+
	T02TJfTV39b6ZSJpqu0fk7Rsc+Ph+h+hwubBs6H+QItFFgI66vYF8kLAFIDWE1hHjpndgejqSaR85
	oV63eUlp+gsxk7QYmsR+m8TUyUCt3CYWdbvYJtmB/NG1TTdWK+rH4NQGrPA0B4WSPhkbiHUXarh/o
	yfVxuHIR2CWdrU42zVvpPS6N2q/918ab5pge8HvjfaZAS4Gf2dxIRfjf+jwr08LD2msLiURYG3Ymb
	dYrPjzgsgQ0OGQ4k54pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ6lo-00Drhv-0r;
	Tue, 11 Jul 2023 06:22:44 +0000
Received: from mail-oa1-x42.google.com ([2001:4860:4864:20::42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ6ll-00Drfv-0h
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 06:22:42 +0000
Received: by mail-oa1-x42.google.com with SMTP id 586e51a60fabf-1b7233e594eso1511545fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 23:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689056557; x=1691648557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oAOhq9P07eLDplhtLTT1tcsIlFj5k7H1L3tXJlOgLCo=;
        b=d/u6KhCWa+HbTlst+lD44hjx/uPE6mkYk8t/U1cgZQ+rG8uR0vspAyOXTJytNDgvLu
         MKkpktIPWohmTYwzXkUYnCPq9FhZePT1kmmrcT2gnKLqlv2V9Xq92sAeI2OaW38wT/BT
         qCCcNEiv9xmMr8ANRmAwl8Li/Eqd/xvnolI9r64CY2cF9Rtsnc2zu7mE/7MvlMnXnz5J
         CMLUKgQJ/0H0z/OeOj3P9EEDixuEf/yupESXVfYvVJ1AXgTb+pqRAAvLjQNlEHplPnZa
         g3pPbSzasjHeQW1LmR/V2+J4sbYSnJW0+riWcIurE0vuIx8JLtXgYbkbRQNuoeGx8wDy
         B5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689056557; x=1691648557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oAOhq9P07eLDplhtLTT1tcsIlFj5k7H1L3tXJlOgLCo=;
        b=U6ePoVGK/s28Iu4KPxtBw2ZrXUBMvxm4abWpF8e8Zvb4hFSK23HgBUzZY4HZmo+Qak
         yVbIJPxUASadTPhmSVcaLiGmseTxT6l380kVWMh+jtJ6yJXK5UT8C01CJsq96gxg3vW7
         tS3jpp+qPJXHNgl076LbyH1Nm/pWEY7wGbck2vQZJxhXPk1Zh+2+2l9nA3PP4oMo1H+2
         Xxdzipr9ODJtsVUx4e2Zefxx6r87vMlSf1m59+yNkPeH/woBnH+1j7ppMLFdd+SyYbim
         ocF9+a4JKqolvkCykrUP3nGBie46HkGSZ2M9ETxt1muWbCbOZkO+FeXyPdghGT4JbO7C
         thDg==
X-Gm-Message-State: ABy/qLaDmPWQlI0quqf3BBfuC/0BgDX8Jk8jwv+z4U9tRyAYAbI8cWmi
	66QVNY2N70y7RQukfny/D5Q=
X-Google-Smtp-Source: APBJJlFhEu3/+l2Bh3HqICI1LhF877BOhGd5qBNEfGuzvLWsezxC7hd4093W8ajADVsZYNQII5ZQ7w==
X-Received: by 2002:a05:6870:b48e:b0:1aa:f3:5b3b with SMTP id y14-20020a056870b48e00b001aa00f35b3bmr16428956oap.17.1689056557536;
        Mon, 10 Jul 2023 23:22:37 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090ae50300b0025edb720cc1sm968558pjy.22.2023.07.10.23.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:22:37 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Celeste Liu <CoelacanthusHex@gmail.com>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: [PATCH] riscv: entry: set a0 prior to syscall_handler
Date: Tue, 11 Jul 2023 14:21:47 +0800
Message-ID: <20230711062202.3542367-1-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_232241_256513_84C73B81 
X-CRM114-Status: GOOD (  11.96  )
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

When we test seccomp with 6.4 kernel, we found errno has wrong value.
If we deny NETLINK_AUDIT with EAFNOSUPPORT, after f0bddf50586d, we will
get ENOSYS. We got same result with 9c2598d43510 ("riscv: entry: Save a0
prior syscall_enter_from_user_mode()").

Compared with x86 and loongarch's implementation of this part of the
function, we think that regs->a0 = -ENOSYS should be advanced before
syscall_handler to fix this problem. We have written the following patch,
which can fix this problem after testing. But we don't know enough about
this part of the code to explain the root cause. Hope someone can find
a reasonable explanation. And we'd like to reword this commit message
according to the explanation in v2

Fixes: f0bddf50586d ("riscv: entry: Convert to generic entry")
Reported-by: Felix Yan <felixonmars@archlinux.org>
Co-developed-by: Ruizhe Pan <c141028@gmail.com>
Signed-off-by: Ruizhe Pan <c141028@gmail.com>
Co-developed-by: Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Signed-off-by: Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
Tested-by: Felix Yan <felixonmars@archlinux.org>
---
 arch/riscv/kernel/traps.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f910dfccbf5d2..ccadb5ffd063c 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -301,6 +301,7 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
 
 		regs->epc += 4;
 		regs->orig_a0 = regs->a0;
+		regs->a0 = -ENOSYS;
 
 		riscv_v_vstate_discard(regs);
 
@@ -308,8 +309,6 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
 
 		if (syscall < NR_syscalls)
 			syscall_handler(regs, syscall);
-		else
-			regs->a0 = -ENOSYS;
 
 		syscall_exit_to_user_mode(regs);
 	} else {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
