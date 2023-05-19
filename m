Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D8CC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MHw1oKaHP6TopAlacW6IXLN+3g+vGooi6sFhq/zY0s0=; b=BNTIY3xSWexXYC
	fK+dbmbnYQ9Zk7Mqz3X/JbV4AppPARD8OWwgLnSI3TpHOsXBVPSGiKXgLIgpJp90N8kH4f3fjgrvK
	PWiZi0GeQFCUJQys66MtFbRYh6yb6yKmW+DCifdcRpjVQ/QpDJSw81ZZqeh11bdqxHyFKLKZxeASp
	V8RA3AZqy4i3/zi8otWdasrqBIwri9APUBzq+M2odrxSsfqVSplHO+GpOCffa2BIN0oqxMsOv3Apm
	Hl2igqvHR6vtwbWrtGFEuNdZnzA9X88zIZK0tMWeCj0q+OyEIc8CZunerkjZPP6e4w4TpCNv9ReKl
	NLQLii11YmakXCYycAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pztIY-00FDno-2O;
	Fri, 19 May 2023 06:09:06 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pztIW-00FDn8-1n
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 06:09:05 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-528dd896165so1999670a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 23:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684476542; x=1687068542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=acsQIdfOS76XIGk2swzVCmK3bhSNOQiVKEd2nYdPHpU=;
        b=Z2qCGytiQpchdC6MxLuKGoEvkb2VfBPkRy2QsiC5Q1O3AOnOKHJw9in47cqEYkMy1I
         UPEYPuSkizH6nzxRp4OEjAUDHKoFHVK/io21UxMWJvdD2YgbVZiQmK4w4ntxX/i99Av1
         NwC3B7dkT63/FH02hZu2VNkDBWg3TRTVFbZduKLgPy3OijMuBjGU0eBtkzARLBCIpTy/
         ApmtnZNeI22IkxZM1GMfsBFwNTPEiahf6S9R1WHykTKppX3Afs8hR4sUWC4f4f1HE3/6
         bWmD7YMPpR2bAu5zaMs6o+HF13Dwhza2abnLD8ZPoOEnAtexriKADNnqPtBtTdPIKtDZ
         N8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684476542; x=1687068542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=acsQIdfOS76XIGk2swzVCmK3bhSNOQiVKEd2nYdPHpU=;
        b=M0GZt6e4iJZixaU7RByHooMc5F7txDce7Oajoefy5uf0lHdi6xTg/USDN2wkRQMbuD
         owTL48XZynx4ceOMWdK1NFMAiqRxVYQ5Rz3asnpz74JmcPC4acnE5LpMENM3kMRhZwkT
         4pHm6kXLMsbGn2KmFBuiuok8OPXrK9UY4bT3fTHIFuBMP5fU71ka8VdiobpwCkSOnJoh
         leAbUKPFY6gQSvsNERXDLNCl0+mcaJ4A03z0uHlpZ8/Ws7FzO0iMAYqYeH7eVXIQyUfN
         86H+kn+gBQtMUV2AEvU6zs0IvLOVsts016Vm5Ff3/DkiJGQ0RP/E2pzko7h2tN4zSUlq
         KdeA==
X-Gm-Message-State: AC+VfDxQCR6tzDNPOgFCi3l+3tgpm/LY7kwSl+pgwlLmE0buVr6E+7G2
	M5DY2gGW9o5BZSuKxO0gNR0=
X-Google-Smtp-Source: ACHHUZ6QvRaX1TLkAV5jlA5TIsRZxiJZnHkB7qA3Qv2B9/UdpMj2b2oN78KP8GZIw345iuylwsH9ig==
X-Received: by 2002:a17:902:e848:b0:1ad:d500:19d3 with SMTP id t8-20020a170902e84800b001add50019d3mr1989643plg.23.1684476542275;
        Thu, 18 May 2023 23:09:02 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090282c100b001a64a2b790fsm2508936plz.164.2023.05.18.23.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 23:09:01 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH] riscv: hibernation: Replace jalr with jr before suspend_restore_regs
Date: Fri, 19 May 2023 14:08:54 +0800
Message-Id: <20230519060854.214138-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_230904_598723_EE0003C4 
X-CRM114-Status: UNSURE (   8.68  )
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

No need to link the x1/ra reg via jalr before suspend_restore_regs
So it's better to replace jalr with jr.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/kernel/hibernate-asm.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/hibernate-asm.S b/arch/riscv/kernel/hibernate-asm.S
index effaf5ca5da0..5c76671c7e15 100644
--- a/arch/riscv/kernel/hibernate-asm.S
+++ b/arch/riscv/kernel/hibernate-asm.S
@@ -50,7 +50,7 @@ ENTRY(hibernate_restore_image)
 	REG_L	s4, restore_pblist
 	REG_L	a1, relocated_restore_code
 
-	jalr	a1
+	jr	a1
 END(hibernate_restore_image)
 
 /*
@@ -73,5 +73,5 @@ ENTRY(hibernate_core_restore_code)
 	REG_L	s4, HIBERN_PBE_NEXT(s4)
 	bnez	s4, .Lcopy
 
-	jalr	s2
+	jr	s2
 END(hibernate_core_restore_code)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
