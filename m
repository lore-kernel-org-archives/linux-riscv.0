Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96BAC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 01:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YXJJkxdz/QDNvDfuatj90kmRw3sTA/9tZE5YUdN2F/0=; b=4iC8MiXEGK+NEn
	5B0MqOqs/U5SSg7k5oHJRoMTh5nKUv8YlAt0+/iBZj30AvN+0UZgwDQ/yX0qEw27dZAxx6fGDlEWV
	TiI4xmiZLKDmtdu3Tq4QOx7+fe1xDBwKoISNJYf3uehYTSozDt3Nbod4i6m4PbKccNXZkOwMUAZUi
	heyNI4ZslK4xqNrVa4eHQlaQYdwcrFpBi3BT1R/rFDsjRZhRbIPJv6SMYZ3Py0DTK0+l+103qMAQs
	9xGHdouXD1C5n32DIuHPYH2MuE+H1s/OEBJjiZ6GPHX+RCFzJifcRRavyi9v0znrL9HM7Ze2amljK
	r26cj43FSm+1c3wgPcSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwXfp-0000000ARqS-2FYj;
	Tue, 16 Apr 2024 01:31:49 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwXfl-0000000ARpQ-2u6G
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 01:31:47 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-23335730db1so2269937fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 18:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1713231104; x=1713835904; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ1Fmu4Vn/bJTdN2f3Tpcx/PWLxgEkHvwqs2u4LlG6Q=;
        b=inFG7DQ8uC774uZHQM76856ueQuKcoZMEkiXn1lfLz567cmgA8JuoZl0zsbcCUsFUY
         1xEhMyDygK5N04Eat5MlhuWiqycTyZkzmZz/2Xp3dUy3+fe/boW1YpTsZM4O2SkZ6JPD
         OFIvGAn7ST28NsrBKHrWXxKw9inMFM14qpPQ+63jeKRIpQH1DyiEMzjvMsYMAtDEPvqb
         SghTGHePu7QCD24MLclgetR2UKVWkgCvhxFrWrMVhf3Y0aPgNEUlWk1h8ns+hQ8/2KFH
         4Z1mosTxL3I1DQjIpFR+JUjKjols4VeTuUzz8p24bvkJ+mB9PtBzhR36rw0xEhcJ/AWn
         m/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713231104; x=1713835904;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQ1Fmu4Vn/bJTdN2f3Tpcx/PWLxgEkHvwqs2u4LlG6Q=;
        b=l7b4xwU0kcJT/BUjmyqXZG5bejFAiNUy2lf95JNENEzdWia4xjQmmgbbyJKnfbH47L
         2RbPFNMiA8WpuPGH670IR/x2C4DZ9WZ7LPdEWvUy0MQKG0WfkC9KFy4o1uCQ03BcHF8j
         +fhBQLU8aN5FjYGR5f7ir1l1Mhdxs0bVYa38dFrkU++IbJz6BWRfEEv5F+rfImrHGE1B
         XgV6nvYBfgOMDPe0ulZdg2Yqy3lElRdQMv5q+DkYnYmlbgqdUhhSB8kXpI+GNo04eZvj
         k9RWWBi2/7zbzZMOo+vSxUoz8G/0nglzE1jJ6qMVR8Z6qXmTA3Tibk/f74HSPS3Ttm/g
         hBrw==
X-Forwarded-Encrypted: i=1; AJvYcCXdw5nP4fU1/UhEBtOAh1VYpapNmryl54NkM798Ch2yF7rS2IxApf6SVwilPaUJWbUDoxOyWr9GNrBmrqlaitimo4x/tMq4nzQ12dFZF7TO
X-Gm-Message-State: AOJu0YxBsR/dN2b9XIZ5zB60FiqPPpDszYeO+5TUs6YTpSNiu7+iRK0v
	+I0JsgYO95gkqcBMjpcpz0RUJJF814sPxnIlT1xCg+AZmmQLvbaiyeTMGmdlFvE=
X-Google-Smtp-Source: AGHT+IGV28aTXnJZCsv5QTO9arJ7Mejc0+P37jlL8ec2Sy1TLly7UFcUuc2+Lugf+lCiR8bqSzVsfg==
X-Received: by 2002:a05:6870:f61d:b0:22e:8a2a:2497 with SMTP id ek29-20020a056870f61d00b0022e8a2a2497mr13497999oab.45.1713231103843;
        Mon, 15 Apr 2024 18:31:43 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b13-20020a630c0d000000b005dc4da2121fsm7642525pgl.6.2024.04.15.18.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 18:31:43 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	schwab@suse.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] Revert "riscv: disable generation of unwind tables"
Date: Tue, 16 Apr 2024 09:31:38 +0800
Message-Id: <20240416013138.28760-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_183146_032600_47C8E3E3 
X-CRM114-Status: UNSURE (   5.15  )
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

This reverts commit 2f394c0e7d1129a35156e492bc8f445fb20f43ac.

RISC-V has supported the complete relocation types in module loader by
'8fd6c5142395 ("riscv: Add remaining module relocations")'.
Now RISC-V port can enable unwind tables in case eh_frame parsing is
needed.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 5b3115a19852..9216bf8a2691 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -94,9 +94,6 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
 	KBUILD_CFLAGS += -mcmodel=medany
 endif
 
-# Avoid generating .eh_frame sections.
-KBUILD_CFLAGS += -fno-asynchronous-unwind-tables -fno-unwind-tables
-
 # The RISC-V attributes frequently cause compatibility issues and provide no
 # information, so just turn them off.
 KBUILD_CFLAGS += $(call cc-option,-mno-riscv-attribute)
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
