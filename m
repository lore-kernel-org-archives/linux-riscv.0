Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E605C433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:12:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E7820855
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hGPZJyXu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Cq0nErZd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E7820855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zGBb8CF0lMhhC9HrBf1FsIvKYQR+rdNbAgdWq0akjqE=; b=hGPZJyXuNfKPFjs5/01WobZ6+
	13KEP/Mz62jkMVGAGntv8XkTDEnSAOGvQDyjkPv7Y1ELO5mNQfD2dKN/6nz++3oZ3xZi5wmTvKuit
	PG+DzyAyAZY0j4M4RHkBvAVq/Mq6pBTxNUdntpFRUysHlsKDPRrLVCbnT0uk+cbj8MYUmZdW3KUm8
	T0v4v2NRyYgk9rn7JzVVYtxmOetR6O6ey/xRQmKV1MRamu8Dfm6MjFOKaYegK+o5/YUez2CkZL0/x
	SI70vcHcqFLJEUXtcuvgVUGXt1h/2k3ntk1z1nCk/uajDqmSl5n1S7zLNuv23KKEkIdg8O5Hyo2zG
	cviZgz7dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhD-0008AL-PS; Thu, 10 Sep 2020 08:12:43 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhB-00089X-20
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:12:41 +0000
Received: by mail-pj1-x1041.google.com with SMTP id t7so2641711pjd.3
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44trK1+mp6acGCAyJDXufHhioxG2IhBJmkTpcqeajCw=;
 b=Cq0nErZdYPGc+wAuLEcPow5AKaE4CEaydecrT+24rUO21TCx0VSHei2JJyanMsVxZG
 h8ArP6bjGCYAcMJc6fMfrBg72m9cUAZaUkT2P0uDAROB4I8FisHJKRWAhheAOrpJ3j03
 /OOZm3PWq5AozKLX4QGeytxLeK8GC3Pysy7L/whH0K5LXriRC+vdhVjG0GUIzmsSKhRk
 8FEBEdZ5mbaeABeE1oOeqXRxzyhLGOhYzGoUg7vLTnNoY13tnCg5NZK0MU1x4pQLS7qi
 cg3MJm4WYFmftj8N6J5mCIZs9dLDfOnKrPLMlUDtfnrSX+G5qoUUknZpmCrEsiYMj1/4
 U9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44trK1+mp6acGCAyJDXufHhioxG2IhBJmkTpcqeajCw=;
 b=R1wdWrtF3kdcFfNB87zlpwM977WuDMfYWKbflF1rm10ZtgP4sLdrpGsEmUnAJjn+y6
 KZ29IsofAzXMVaUjlY7P5+V97rV3btQwkUIonfaojkLWfti9vaCMSPXps2lZb0ZR4bSo
 x2eQhrxyhkbDZpFSOOkFywNyPM7MkOGg3YIe6GsINKjwreXESUZ47Rin6avj703zBD4K
 uf1SXAaB6jhTnxz83r1nNISjUaOaDiyMUM6rdNapFAV/Xfnr4M6wkWwtnwjEiMQIDqPw
 fx1CW6st1w/XPAujNPclRdY1Fnkay4yUUMk1lR7VFB46GUj3ZUr4Tgvx9n8rYqgwrQCh
 SE2A==
X-Gm-Message-State: AOAM531CMTWooHNjblZkQlHqb94G1Yn1adzae/wIJJ4/VriDEySn1U/m
 PEKZd4aL8kyug8kCKMovHsKyeg==
X-Google-Smtp-Source: ABdhPJwRpiaO4sJw2ldjNOPiEaMaHc93aWXd+XlpwavaSzOpsugZWky+iNfgHgwVB4ZNZvlDGU6inw==
X-Received: by 2002:a17:90a:db49:: with SMTP id
 u9mr4210890pjx.90.1599725558979; 
 Thu, 10 Sep 2020 01:12:38 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:12:38 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 01/21] riscv: Separate patch for cflags and aflags
Date: Thu, 10 Sep 2020 16:11:56 +0800
Message-Id: <2bd207c3d0da6a5d632ef0a931395d45f088ae7a.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041241_113183_46CD8189 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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
Cc: Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

From: Guo Ren <ren_guo@c-sky.com>

Use "subst fd" in Makefile is a hack way and it's not convenient
to add new ISA feature. Just separate them into riscv-march-cflags
and riscv-march-aflags.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/Makefile | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index fb6e37db836d..957d064bead0 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -37,12 +37,18 @@ else
 endif
 
 # ISA string setting
-riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
-riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
-riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
-riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
-KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
-KBUILD_AFLAGS += -march=$(riscv-march-y)
+riscv-march-cflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
+riscv-march-cflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
+riscv-march-$(CONFIG_FPU)			:= $(riscv-march-y)fd
+riscv-march-cflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-cflags-y)c
+
+riscv-march-aflags-$(CONFIG_ARCH_RV32I)		:= rv32ima
+riscv-march-aflags-$(CONFIG_ARCH_RV64I)		:= rv64ima
+riscv-march-aflags-$(CONFIG_FPU)		:= $(riscv-march-aflags-y)fd
+riscv-march-aflags-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-aflags-y)c
+
+KBUILD_CFLAGS += -march=$(riscv-march-cflags-y)
+KBUILD_AFLAGS += -march=$(riscv-march-aflags-y)
 
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
