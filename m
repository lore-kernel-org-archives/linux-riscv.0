Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C36C54E55
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 00:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGcAYD78BnsYOQtIcH5dpFm0P9WnsbgNEsPMB9mDHT0=; b=yY9LjIFqy52ram
	JCkaaSWkohQeiQUVxTteUnyI2rmjfF8FEMX2v9Q90hFqXN5LOKynAPvTyuPqoH8JbDPnRPJtpS2GR
	dTGH6XbIskCB+ijlaxjBqFxq9+G9af+t/D26XmzUqoTC8VlNdU6XzVtA2Ts5S0v4T5nLM13rKtcTh
	7iML2gezqI4R7IlgMQ0+M0GVbWl1ghbVfEmAMJ2icHdmdFXTxbkazhU2jDVcSFxSgGxnouWnisk1W
	+IwiV7sR+1yjzuDzM4hTWeOtCNQHf/acOgtKKt4xobNCsYR66d46waEG/0tVjqIgCAt1ByVVFQe/8
	vc+rXLI2VTfC/bAvVO5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relSe-0000000370k-2QDG;
	Tue, 27 Feb 2024 00:36:44 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relSX-000000036yB-2ch5
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 00:36:38 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso2867125a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 16:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708994196; x=1709598996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DgT08L+OHu5JWWVgI2Bop+R/swEzoI3UepBE4dcuzQ=;
        b=JYk6113O/rpXaB2MxzfzcCNV+yWYmLYpztUL7LCfy8P2owjL9hZ6BLjb9y8+C6ru7C
         O1pjofTx64qI+fHF6/WaRQGvNyOE1UyKUHhZRtGDTKjuBW27aY8LSj4JwqSsPSLVDq13
         11NYrZID5pUCvKqREyeCN+HLDl/3+ehrDgXok0ACl9vVSx3K42JS66JPdoflA7kl00xm
         ExUCwdO4QoyFOdmYvwqXBBRIQz8dqrexHvyWjFLOcChyUzz/SR+leMZuZsvgdxTQVaaI
         /Q3tNuO86LQmm3jTZq2Ohf5Jgq8pjs3TZVs1b73LfSOUS+fyn8u3bBbpMUBc9gww4W7Y
         yJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708994196; x=1709598996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DgT08L+OHu5JWWVgI2Bop+R/swEzoI3UepBE4dcuzQ=;
        b=cdGkKra7bowq+PAdY5N+beaI+/un28kqzkZ4uJVhH6yIidsT4qhpFj74jaLe54dhOC
         ZCVNzm3JmGoYy4MTBqXUtRI6uldltsB6qYM11mKKHk+k25OBKf7+OW4pp0do0uAiD2jX
         scfnbqbJsGps8HWkyzwIp5kVsSVira0se3a4ifcQ3dD7+QItw9qL2cMLbUcIrmbDramy
         ggDrHokKDXygk4KMtiBfmrhnusvNTXTABnX8Nlh6Bdpz3RwDwvTaAV0NMHpLpMfMMjwg
         RLCkUwhJffqqzunQL4qjZYpawLKBU2asifpORdyHEviAWdujOWBolL9QhaW/+aLwxMNT
         YHSw==
X-Forwarded-Encrypted: i=1; AJvYcCUI4HrG02Q5L7pZ0r9NAuY3vPbK3nk9OUbFDdrsfZJLYPEtSE/c5yYQ/EUFregNPyNwV2DbWIqL8AmZo1JOWzWTMBhF3VQg3FvVVrCxyX08
X-Gm-Message-State: AOJu0Yw6cSVr9/XZmV8oX/lARkda1h/MJuZ1bqJcceoqoxNhp66nAQ01
	j/bSbtzPxuVK86SIcxWHp/YxFODSHyqzzHYbrUVOMP/IImGE/vz7mx53w1EBd1E=
X-Google-Smtp-Source: AGHT+IHpBABr/kwuIBit9b2KbLax70vI2KtrkrHOQQ7ijJ8O9ipFow5FWGR8xS5tvdhxrGR/HHYC6Q==
X-Received: by 2002:a05:6a20:6f01:b0:1a0:c3e6:3135 with SMTP id gt1-20020a056a206f0100b001a0c3e63135mr907151pzb.28.1708994196622;
        Mon, 26 Feb 2024 16:36:36 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020a631919000000b005dc85821c80sm4504117pgl.12.2024.02.26.16.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 16:36:36 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/4] riscv: Remove MMU dependency from Zbb and Zicboz
Date: Mon, 26 Feb 2024 16:34:48 -0800
Message-ID: <20240227003630.3634533-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227003630.3634533-1-samuel.holland@sifive.com>
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_163637_684490_C9DBECEA 
X-CRM114-Status: UNSURE (   7.97  )
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

The Zbb and Zicboz ISA extensions have no dependency on an MMU and are
equally useful on NOMMU kernels.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a068..ef53c00470d6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -581,7 +581,6 @@ config TOOLCHAIN_HAS_ZBB
 config RISCV_ISA_ZBB
 	bool "Zbb extension support for bit manipulation instructions"
 	depends on TOOLCHAIN_HAS_ZBB
-	depends on MMU
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
@@ -613,7 +612,6 @@ config RISCV_ISA_ZICBOM
 
 config RISCV_ISA_ZICBOZ
 	bool "Zicboz extension support for faster zeroing of memory"
-	depends on MMU
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
