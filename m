Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0A3C4743D
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 22:12:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF7CE613CB
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 22:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF7CE613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q4PCZ2C89NNQACdekttaO3+f9gBB+Sg+/nAqWEGA6Qc=; b=PyJ9m8CIAX6CFO
	w+XSpdUCK61x1KZJWR+w6+xdnObJFF0nF/ygl0GXJstM12WvJzz/uB2iCLfWZjjxksYn+RaYFv2sF
	PBLflkhxveSOK/+8RmEwcUW55I3a6R11BZbJj5/jFuydBKA/5vFTrnsMh9S/RP6tYbIym4CGIxjLF
	YEUe5Yns+ScY4FhcJxrHvo70jWWRAI5Bf6HYTfOOUjgllZyZ92oQjxcs8JFIPKbwj4cmSmQltHdFn
	pvLhufYg9CvPTeFvGeVcaWsa5+I6otNbJbu2EMV5bLbwPXIy+KaNsgceUAvY2aVZWHmvL0wsDQszI
	cMuilDRJR81t0VptXbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq0zl-000tju-Av; Sun, 06 Jun 2021 22:11:49 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq0zi-000tZF-Gu
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 22:11:47 +0000
Received: by mail-pf1-x42a.google.com with SMTP id q25so11663239pfh.7
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 15:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uZVlhV0DsP4SZD+UaUOcRxulahCDj57tr643l0d0lvQ=;
 b=ks8Z3eUOEX1jRlfk6kFaPLPsrvUYrm1n2pNWUL51QQkSf7JXuPUR4vcIHhdvc2o5AF
 UiYqeVajOP0F+NJ8ci+p52WQfmpQzUH7ZxC+uXU6Z/95WpN1tjyX7DZzT9GMTbUP+JID
 5CGPXHViVuhCfsdisiSNDDRTVNKwC0ncoSZzj+fLmNenL9JpLCP7d/eTCWpX0BMbaS5R
 shYM7RqTcTZrRSzmQ7nSO0sTcuaN+iRq/fYHBlG1aSo+tbahEz3uFO0hvh5t16ceW+K2
 ZXfPGLNkBgJwFnKMIJPJazmx9EEa1yYuB2nj+tleMozoBjHykJanwQTBAncx8BZIZ6pX
 iR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uZVlhV0DsP4SZD+UaUOcRxulahCDj57tr643l0d0lvQ=;
 b=ccwrrMYRpXGKl6D6PCk8LyPWS8Xmxuf1az9hDXaj+4BXGFf8h6XDynFeAGllId5IIj
 UuXwCf4f/IjYIScOPKFqn2UQ5G7n9xyvKAxdnZ7vt7jIgCVsjec5zr6hZ14JcEmWj209
 hZcu75+mdDOieKl0nhTqe0KbpJmR+lrrGKbzPNrrfRq0wJcuFq9lfOS6csLSplfxLX4k
 DVhiTOPFtFX9AG5NB6ccs5unAd7C+xbMTlCPCgNAH19od3pGbSEjyN46NhTAvmzXhbr1
 Ydpaq0mBhu1UszYTjVgDzPApfRxYgxYTr3pf6qU/RsT0XjzOQGvpxMaNQU+3r23rlWpa
 2ZfQ==
X-Gm-Message-State: AOAM532E18xOmQHhKw6mQgPhi7hgdPlvFRQByKZ6zoZKUdNdNiV+Yu2h
 ZW5NUZ5G4pbopv974orESOZSwQN/AeRQEg==
X-Google-Smtp-Source: ABdhPJzRyFtxgo+XWyS2pn4n9JyQdsUNB6ToZze2L+6YgdBu0o4SYCEVsOCYu2+CUURoKnWGaby8QQ==
X-Received: by 2002:aa7:8058:0:b029:2e9:ee0e:b106 with SMTP id
 y24-20020aa780580000b02902e9ee0eb106mr14785092pfm.4.1623017383683; 
 Sun, 06 Jun 2021 15:09:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
 by smtp.gmail.com with ESMTPSA id x22sm1855468pjp.37.2021.06.06.15.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 15:09:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Khem Raj <raj.khem@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv32: Use medany C model for modules
Date: Sun,  6 Jun 2021 15:09:40 -0700
Message-Id: <20210606220940.2494315-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_151146_586994_A08255BF 
X-CRM114-Status: GOOD (  10.17  )
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

When CONFIG_CMODEL_MEDLOW is used it ends up generating riscv_hi20_rela
relocations in modules which are not resolved during runtime and
following errors would be seen

[    4.802714] virtio_input: target 00000000c1539090 can not be addressed by the 32-bit offset from PC = 39148b7b
[    4.854800] virtio_input: target 00000000c1539090 can not be addressed by the 32-bit offset from PC = 9774456d

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
---
 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 4be020695428..99ecd8bcfd77 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -16,7 +16,7 @@ ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=8
 endif
 
-ifeq ($(CONFIG_64BIT)$(CONFIG_CMODEL_MEDLOW),yy)
+ifeq ($(CONFIG_CMODEL_MEDLOW),y)
 KBUILD_CFLAGS_MODULE += -mcmodel=medany
 endif
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
