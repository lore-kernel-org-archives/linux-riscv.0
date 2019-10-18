Return-Path: <SRS0=JNhR=YL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B926ECA9EA1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 08:09:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F5B321D80
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 08:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tsvXSAy1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UJ9qXKVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F5B321D80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0eutDRWKfUuPtgVgFizq/xkj5kacWEt668d5wT6gZ8=; b=tsvXSAy11dBZ/1
	rmMXMPJN/+DBR0LGypcJVr70YpbH9QMYFoIOPsj0mHFwtSfoXqOmztL8Tyww7GgjivfFVCMz5ZoCt
	6VHIntwhbPiVhXeadwzQybsIOYhBTiKUrxU7k8tIp0Fd/XwJUQWlVW4WNE/Xdr2fho4oEYTuy1J+N
	J4vRpnsVjcUG1yy1/3gSFamPExoGnJj1oJgQGlQ+Md/9N6cq0/iU4wVBgpfTZ+WQ7Jrjx6rrUIFSj
	AU/aF21fS0PAdmU9HRr4/3GGDjIZGlcBrXQmkGnBUoaRycF0QWHV882aki4kkaiOvzZu2auMWKkuC
	DzdilLzljwCIde8UA1MA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLNJm-0007sM-LZ; Fri, 18 Oct 2019 08:09:02 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLNJi-0007lm-9J
 for linux-riscv@lists.infradead.org; Fri, 18 Oct 2019 08:09:00 +0000
Received: by mail-il1-x142.google.com with SMTP id u1so4700697ilq.12
 for <linux-riscv@lists.infradead.org>; Fri, 18 Oct 2019 01:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JHZwkf7dJQb2ueiE6rWLqpiW0jn7hN3I7C8kvdgIRA4=;
 b=UJ9qXKVQp7oql8AsQGguKjXwT+hTgLgDIaxyocAICcWHqufSo5Rl6505mDxQF976/s
 JKA/0J3m3ItmfvNsvc4uMXi+eAYwwnCc7zOHv9Rr6YTiH62/vznrFmuwEbsJo5uV2vIn
 0dDo/aPaJ/LXpDH9AfPOZrlHCbFOhEwP3NO2XGxuTaI0D+rz4zlV9iEEb1frmiUqzPCH
 iBysNeitcop6mNpjpejximJj50shmGyWN24oSn20H9EwULK0nC3f7IxB89hS9ffBMjpS
 jwZi01tMUlo+Uo50Ly0E2Xyo2MJsgKbdPearbArqq55ymINO2jCJGEO6VZ9PDDNK3LvK
 8YYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JHZwkf7dJQb2ueiE6rWLqpiW0jn7hN3I7C8kvdgIRA4=;
 b=YmYfQYfJOcizTbVEYvQtt0b6Ep99Y78qeewyfgzQKoLVLEdvAO3rgtHuslzU+UyGHQ
 UB65uZZlmpOhFTzc6Y+Q2jRWeCXzQgdXp7ZfM4TPAoqaB7wwT2AYBqIEm+hCFf3+NhqQ
 9jhMz/Q4Y5sw5iBjU+uZBxmzzbuM4eIHplqCI2HF7J6+G8BzJg6Sola1xkCYqW7qBllB
 Rb8DDUgHzWQ9rT+k501lFjF2gAufZMq6qLnY/Ocj54hjPHwKku+S0tG2M1EbDjUsFLnn
 sGke9pUwv3wPwDQtqfrvpIMMJEKZ0k/i9Yjikd/JcOhNEJh82EXb11h3awcXQ19Nz5P6
 ALAw==
X-Gm-Message-State: APjAAAUcukklw7/dH3ekyJodHpcO8AGJQV58swyS1H2yQ+IDCtyt+dPx
 NThhZ/WIXQGbtZnIa8MQGE/jXOVZps0=
X-Google-Smtp-Source: APXvYqypnTHKh+VT4ykjNOiCGrkCEsaEqLiYx6kyKUi/C2fkT1SJiPurMENiBjDLOPtFVR6QBRrW7A==
X-Received: by 2002:a92:1507:: with SMTP id v7mr8013435ilk.37.1571386134093;
 Fri, 18 Oct 2019 01:08:54 -0700 (PDT)
Received: from viisi.Home ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id z86sm2121026ilf.73.2019.10.18.01.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 01:08:53 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/8] riscv: init: merge split string literals in
 preprocessor directive
Date: Fri, 18 Oct 2019 01:08:36 -0700
Message-Id: <20191018080841.26712-4-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018080841.26712-1-paul.walmsley@sifive.com>
References: <20191018080841.26712-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_010858_350274_76FD1615 
X-CRM114-Status: GOOD (  10.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

sparse complains loudly when string literals associated with
preprocessor directives are split into multiple, separately quoted
strings across different lines:

arch/riscv/mm/init.c:341:9: error: Expected ; at the end of type declaration
arch/riscv/mm/init.c:341:9: error: got "not use absolute addressing."
arch/riscv/mm/init.c:358:9: error: Trying to use reserved word 'do' as identifier
arch/riscv/mm/init.c:358:9: error: Expected ; at end of declaration
[ ... ]

Existing Linux practice is simply to use a single long line.  So, fix
by concatenating the strings.

This patch should have no functional impact.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Reviewed-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Link: https://lore.kernel.org/linux-riscv/CAAhSdy2nX2LwEEAZuMtW_ByGTkHO6KaUEvVxRnba_ENEjmFayQ@mail.gmail.com/T/#mc1a58bc864f71278123d19a7abc083a9c8e37033
---
 arch/riscv/mm/init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fa8748a74414..fe68e94ea946 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -339,8 +339,7 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
  */
 
 #ifndef __riscv_cmodel_medany
-#error "setup_vm() is called from head.S before relocate so it should "
-	"not use absolute addressing."
+#error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
 #endif
 
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
-- 
2.23.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
