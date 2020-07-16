Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB34C433E8
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:06:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19EA3207BB
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qMKKEqKi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Z3YpDI8x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19EA3207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l9oySLSB+ahBtKnWHmH3m1sFTD7wHO3hKfuiuMNoWkY=; b=qMKKEqKidTXvdgFE06GEcCGxPu
	92lOeHRmzkq0QnQIhCyRSZmt6Mj/tOfqCJDb8/qEVZm3whvbK8a7s5jbwM6JvmY+3pIXnFp3mpVS/
	HzbVhDCXgsG9FSXYsl/Dwkg7tG/6h7s4vaW4H3V0uuvI24AVw9FT09D2s/+yrApTdS5s153RIIjmM
	qBMaof4CGjCaHd3i5JECssV4uD/mhhhwCzc4ri5mE0AnSEoHBrTpXXbGYtjJNR317THELlse7O82H
	9SH3AFjKBOGCQPpSZA9FWHPPGYnbG3v1keZTt/pU/SGBNeqOpYCRvnqiytET3NoY6lUZ4XjLRpFDR
	hOEIGerw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw3aG-0005OC-Id; Thu, 16 Jul 2020 13:05:56 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw3aD-0005N8-0T
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 13:05:54 +0000
Received: by mail-pg1-x543.google.com with SMTP id k27so4829947pgm.2
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 06:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MHe4h5tXPNZHs87zVRoJ5H1MBCfFmTXIJuQzb/CTGuc=;
 b=Z3YpDI8xL98JLZJH9yVrpL7//a1wAQAdhcDOchyJO6Kq5DeVT3kv/JUvnoCy3SOGE+
 EOdqTWprjhYeoCedKBw7VLDXvMGA79WxdZVhOmXT0I6bctYg7ejnGIs0jm1PgeabTw7H
 xjm2+kTIUV7P1JrwJoBEPT/l4qnf8EGE3Jm/JDN3WXzAc2yS7ou8nUSulYEM3gKx3TiW
 tK2burAVyccTy7qFpcCzu8K7t+aVMZeVYDfrCutPhLRbbqqbr4pWFUwyxati0UUgFFuj
 PWeT2N8xFwypdvPHh34XmwVeBzwhXnIuShzMXZpttyYmzjXSgTVEDs8dtZ9oOWuzIljg
 Fs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MHe4h5tXPNZHs87zVRoJ5H1MBCfFmTXIJuQzb/CTGuc=;
 b=fHoItQR5uIINY3WvZe9R85JKdSX5XTs14BLpBeP3VVI58kSqYvDZCiL6FFdtI330u4
 cPFPtvI5Zc3FoFL1DabpuI7KfHhIeniufJFazW2IvJM+3y/dBMxm9LgI/h6u7nN8S2rq
 qINO870A1TyrYlmRkk7TGdx/pYG0n62ex0Z3F/wey9HdxHksorHtgxa6YFBlLxF7+ly9
 rLvjH1oWafm6hBpVnZSQ501laSKnd9BRj6+G+VYHEcAOs+gwWnYtEC4722IFG649uM94
 q1h79VBLm2V5FzT4F3R0D8rHZUZOphlB0wD8hXv1qFJiadveWhAgx3qwIqEQ07mf9/v/
 g3aw==
X-Gm-Message-State: AOAM533T1rQ5bkCUaLYVy8/dW7a4cLQW6BLfhqX+YzAqhYvuZfRAGhKr
 t8ZvnOTbmw3pnkOg6mjt9ViWhQ==
X-Google-Smtp-Source: ABdhPJx3LQGxUAT58kn+mBWd710J1coFKijbw42x0J/6OYn3EfVPcgv0cOrwVGj7YyiOkTcHGtuCkA==
X-Received: by 2002:a63:3d01:: with SMTP id k1mr4025292pga.71.1594904750647;
 Thu, 16 Jul 2020 06:05:50 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c134sm4770203pfc.115.2020.07.16.06.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 06:05:49 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Fix some build warnings when W=1
Date: Thu, 16 Jul 2020 21:05:44 +0800
Message-Id: <cover.1594886530.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_090553_327995_924962C2 
X-CRM114-Status: UNSURE (   5.74  )
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

These patches fix some build warnings when W=1, the most of warnings are
missing prototype as follows:

arch/riscv/mm/init.c:520:13: warning: no previous prototype for 'resource_init' [-Wmissing-prototypes]
arch/riscv/mm/pageattr.c:130:5: warning: no previous prototype for 'set_memory_ro' [-Wmissing-prototypes]
arch/riscv/mm/pageattr.c:136:5: warning: no previous prototype for 'set_memory_rw' [-Wmissing-prototypes]
arch/riscv/mm/pageattr.c:142:5: warning: no previous prototype for 'set_memory_x' [-Wmissing-prototypes]
arch/riscv/mm/pageattr.c:147:5: warning: no previous prototype for 'set_memory_nx' [-Wmissing-prototypes]
arch/riscv/mm/pageattr.c:152:5: warning: no previous prototype for 'set_direct_map_invalid_noflush' [-Wmissing-prototypes]
arch/riscv/mm/pageattr.c:169:5: warning: no previous prototype for 'set_direct_map_default_noflush' [-Wmissing-prototypes]
arch/riscv/mm/pageattr.c:97:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]

Changed in v2:
 - Modify the patch description

Zong Li (2):
  riscv: Fix build warning for mm/init
  riscv: Fix build warning for mm/pageattr

 arch/riscv/mm/init.c     | 2 +-
 arch/riscv/mm/pageattr.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
