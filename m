Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CD7606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 05:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fjR3EgTA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vc7fkX9i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2ejoY3uRkdlw/ruekOqSz1ezqt+9sTLImLf41L7XZFw=; b=fjR3EgTA11fHjl/Cv3fiSbgiMv
	ONTlb2drrHrjvLRizSznXUHdwt67Wm/+QbIBQfOXzItD1+NLzWZAgvkJIMpNnIzbyz1qgXNwWDTHT
	6ul3uZF3bZSEV8Oj6Xoq4yanBf1BzyKuv5xi3KjyCDp3ROkP9y2celam+vZPsgfHYxT6x1ZGHw99N
	yTnQaMit0Q2tIqXttWt5ia/xZnCE71FrxXbzquQH6tiHKpAh/XJLUio2xv0hgrxGKwbiiki1dtkSq
	UMXp62Hs7unurMG+wSc3PppPfONGdqfPjk22fif8tNlL3Y88KhztlQGtHPxM6J/iGHKMf9kICX4IF
	Y09sjj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYOX-00000007l8Z-1W5m;
	Wed, 18 Nov 2026 05:39:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYOU-00000007l8B-0Wnb
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 05:39:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8b600fae14dso277869b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 21:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980381; x=1795585181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OnTUX3RjpiKuBl0z2oMbfZLXj9pzVhSggONPVZAXlX4=;
        b=vc7fkX9iG1qERyU3fGe0WIkrWeN7tyVKXANXTwamKR47dCdrHS5rqjlIgUW4UXNBQ4
         xgVGf/KEqN9o5coXRpaVwT5tqP91cbhYBlFT9OM40h1xITwNMJHg65p2TPYBKshBu0RP
         ZiiNts7V5KCKdHic+sHguwfX+gZAgYhSJCNZmN5U3t63gs4P0E8aiivC1ze53iioAae9
         4n/xGEAUCtIvszaN26iRj/AMP0fPE3Oyur030+B2hAlR2xDRZ0G/VKXIZR/cfKo0q0ja
         1qWm+tJSTlyZer7Th6uWIUR6Nsk9m2UXvnB3z2QMed98oFaN7hjii6oCvZyWr91tlqTI
         BHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980381; x=1795585181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnTUX3RjpiKuBl0z2oMbfZLXj9pzVhSggONPVZAXlX4=;
        b=KOy9ArBDZ4Mb1pkkhdQ3Mgx+uTmEUfFODhM3xFgK4jRm1cG/Z2tl9KMLy7jOIeFvAf
         HpGzdH6pNCgRzxr4NIopUnrCVe6m7AnHCIv9KrmB+mSexhNIIUCum8A/BdD1oA/XcnMP
         n5kCt90amD/04v/ErJ9xEXFgjj/LKr9CTLhg9DJeFWEA2OjjNDeTsS60alAoxt2I23aL
         FOlsm17W+4civnjTrAbLIt4nI8cAIpJujeNhX61VQO8LYRZtwbcVZE0Mz1Gf/JcDfDGY
         metzNLlAINvD8FHuP4ytp7NSJz0dSz4134b3Af7ZdLxjHOgap9IL7GWI0P4HwK0fcXnI
         6ckA==
X-Forwarded-Encrypted: i=1; AL+hErFVBkjRSB1cE9zP0kbhwr85Hti2NOZ+CwODZDEuiIwPxH6INHiXys/xc9mcr2rOl+xGhchcoTui4GEzdA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8tVUfH6Jt7IjFG5gdUhIMB3kNDIX/la6fRjkbpuDuEtd6QOyz1
	sbkihOltuIVm8cmmXU7VKmTMXpsjAhSxebeA12klwMO8hYEd41FNznAl
X-Gm-Gg: AYBFou0EFC7ZPVE9QFGb/a2SSoBoWGZJ/FHtTsgVCbuAS3isifY/Qfeib2IUMNAOv+G
	ZFJv4PJCuDg4dHaKwaUJPEfD6zcSx1k1eyoJSLwMrHXxIEXn3JsbdLJfa+2wc6MHPROR24wTDbr
	miowtOP1udJhFVN3ogPwl8RP9sjLEEVeab8N30YG0A91pfE/qSCWrRgKlGVZY/rgjui7zwp59vs
	ywP5RmBa7SnMVAjgA4N+ak0y0B25gllb5DHc8+tupkRkaRHhVycBD2Ow7G1TpjiHwSbWbQJgpKY
	QH66whlqHXIkZRsn0Y5e2m5MQnprt9WJQzsSjtB+Hou839DKY14hGPuNpX+77qYt9esRylO33cH
	S5UFbdktbMa5q4EGiXar8z+896eMXi99nSqjD7ebgFoWyQy5fiPGmrXjWYBRb+POZos3XYu3ZuC
	nyBr953ZJzadd+ITfq0a6kLUi4c0r7bSDOQOGqLh0lRmC4C2pTUxgwEB2JA3Gf4ondskErzJl3G
	0eNbpR/wAvQ0VzobozsXFpQs2IfF4LZ5I81Pj1U/jvhdmO02T5S3O+KRiwNle6VlGCaB/y9hAUv
	6gsBFuZgjm97hqjPcECKWhHVPGVCEASfa4JxQ284s2AUygTC
X-Received: by 2002:a05:6a20:430d:b0:3e1:9071:acdd with SMTP id adf61e73a8af0-3fe976e2b70mr1561308637.35.1794980380746;
        Tue, 17 Nov 2026 21:39:40 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3c4a314dsm503249a12.22.2026.11.17.21.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:39:40 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] riscv: ptrace: Initialize cregs before copyin in compat_riscv_gpr_set()
Date: Wed, 18 Nov 2026 14:39:26 +0900
Message-ID: <20261118053926.845109-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_213942_221678_12D487C7 
X-CRM114-Status: UNSURE (   6.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

user_regset_copyin() only copies `count` bytes, so a PTRACE_SETREGSET
request with a short (or zero) iov_len leaves the rest of the on-stack
cregs uninitialized. cregs_to_regs() then copies all of it into the
tracee's pt_regs, where the tracer can read it back with
PTRACE_GETREGSET.

Fill cregs from the current register state first, so that a partial
write only updates the registers it covers, as riscv_gpr_set() does.

Fixes: 4608c159594f ("riscv: compat: ptrace: Add compat_arch_ptrace implement")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index a005574..32227b7 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -584,6 +584,8 @@ static int compat_riscv_gpr_set(struct task_struct *target,
 	int ret;
 	struct compat_user_regs_struct cregs;
 
+	regs_to_cregs(&cregs, task_pt_regs(target));
+
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &cregs, 0, -1);
 	if (!ret)
 		cregs_to_regs(&cregs, task_pt_regs(target));

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
