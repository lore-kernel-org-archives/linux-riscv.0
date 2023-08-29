Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005A2C83F12
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P/vuaMmBNNBrC8UiVgKqiqoNwcb86e37PiYdNdJRHrE=; b=B4UXreVwRd4Yf7
	7CFXyNKLZ3zULrASeROAu1ojz9CzD2BcdeNFWsb6aDuDoHTs+twTQ7bystGXHvYDzJzK8xzyRFlVk
	vgTh/rYR8ulrU036NAQHv8Kdrg4JYMc+witQLGI8T44At/xWdR7vbATUqtNy4i4+n9rl5NrXKpMnm
	s87LUTGxV7b9sEojm8zwE1f7Gklvf3+5xoHmxLFBt97P89guL1Q8jdQjGSAZ+jzMuTyHR8Vthl1nP
	fgazMGko0yIsAykCLW1sZNCQ4bpjpAS2tDM6RYg3/U3OAnwoXst9McdsPsmgNQzxQnob4/ptD/+Yz
	EBvm3ABbFsIOXYq9aNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb3Ow-00C2m9-3B;
	Tue, 29 Aug 2023 18:25:18 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb3Ou-00C2lm-0V
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 18:25:17 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-986d8332f50so613141066b.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693333514; x=1693938314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9wJKsxPPAwU8P0xFe6s5m7FtWYcJnzstIMaUssxows=;
        b=USmTA0Zpnd39zNwCscgDhVmJfdimtkHk5M60JfbR4NeG8idAyycBdRUJ1DnrSNSWy5
         d/TcIOMuxuZ7Y8tSH/7W+LBOE6px3hkflXWSzYmbdy6sddLkq3FPZ88L2jZTOJ5rxPte
         t4JU2zKKw+hb1Q40geCpT1x2Q/DeRIkSYOMng6Q3W5cwB5fVZ6yYCNPcOF7bfvQjjDZL
         ilESCvGar1donrPd8nsWESwyiH1w96XibWBDHI2q5+UESwBags9bLKpXqWrdUFvyBroa
         Z+IA4W0euR01ZMNWvo8jmF73KyD5GYbnfFSdpVOla+Kudlzq+fHkf4aYh2tuwWaeGE8Y
         CQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693333514; x=1693938314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9wJKsxPPAwU8P0xFe6s5m7FtWYcJnzstIMaUssxows=;
        b=dbZKaq5bFJ8ZdActU30AmnMZDSpjnxBaDoplmQ0tNKFIIQL4cxdlZwNn51IaXJKY5h
         i9ZLWELShKmQiF6RO+0/NbUqGuJ/dbnc80L6bVz8N1Ukj/3TfJgFRNOpVmBDo8sY0gFi
         17+xMeGPzITj11yy1LELMCgNGsC0hMTmiUVEPi+bBPiQ7mhXbzyWYM4iIxK/S2eaEYWK
         L/WSLf3facgHMCmL02VFd5wq17qRl6BeuE5WdPxoiS2/r145rGoOjATFAatoHfTl3kV3
         QAh3oIExMmL27+QMtsDGSsprzN+PaSGfVsOsO8lPSHUefEJDZBXwmO0w+3blvgVv1SiP
         4itw==
X-Gm-Message-State: AOJu0YyvBMp8k8On3iPDGJodnbHz39/mTlKYwiHA54Q73bayByy+M11N
	RWmYTwPbAD+FJCSCBko3Kwk=
X-Google-Smtp-Source: AGHT+IG09DLRH/DAaKEwd338k1tCj81ilV1q2bHbiBzkYx6c3tqUpN3c8PbENbHA3Hr5CoeQqX0aMA==
X-Received: by 2002:a17:906:2009:b0:99b:dd38:864d with SMTP id 9-20020a170906200900b0099bdd38864dmr21889620ejo.23.1693333513740;
        Tue, 29 Aug 2023 11:25:13 -0700 (PDT)
Received: from nam-dell ([131.155.246.6])
        by smtp.gmail.com with ESMTPSA id v24-20020a17090606d800b0099364d9f0e2sm6243333ejb.98.2023.08.29.11.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 11:25:13 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: guoren@kernel.org,
	Nam Cao <namcaov@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] riscv: kprobes: allow writing to x0
Date: Tue, 29 Aug 2023 20:25:00 +0200
Message-Id: <20230829182500.61875-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_112516_736676_9E638881 
X-CRM114-Status: GOOD (  11.07  )
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

Instructions can write to x0, so we should simulate these instructions
normally.

Currently, the kernel hangs if an instruction who writes to x0 is
simulated.

Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
Cc: stable@vger.kernel.org
Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 arch/riscv/kernel/probes/simulate-insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index d3099d67816d..6c166029079c 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -24,7 +24,7 @@ static inline bool rv_insn_reg_set_val(struct pt_regs *regs, u32 index,
 				       unsigned long val)
 {
 	if (index == 0)
-		return false;
+		return true;
 	else if (index <= 31)
 		*((unsigned long *)regs + index) = val;
 	else
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
