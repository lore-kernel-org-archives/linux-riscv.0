Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA08FC433E7
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 06:15:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A03A2071B
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 06:15:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RC0ZlNj/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ejy7ckch"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A03A2071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fm2dWuK+xeG4c3WuObsC3zhmlvV9EGOLccLcfV7clTQ=; b=RC0ZlNj/fR9iRKIPBGk7oOyrI3
	Ltvaj/7n7JaQY8ZMklQpuhPAmYmyB9grIebyU/sSTsBy53Bd/3EJD99SrIomqmThlKCywq6gO7Gr1
	TxuJh+i+rTDecONmacaJuxBzTL6v0AbOzmc/QkJb1ssqYHKUF2HnvFxGyfL1JsrorehQ+zeMAek6L
	J5Lk+MjYwGDxDwoEJ1sa10TjyIrKdFMBO968XIKCPN9N9IAZNLk0voIoQWqm+8XgMT9YJl5z+yn9P
	xyg7ycZIXave1t+kr/MQC8DtCNU2ANF/ZUA5/YXpnYnN2bA0gGejtYu/kEixXDlqnw6yLZiqtIimY
	O98aOPJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvxBC-0005vp-RP; Thu, 16 Jul 2020 06:15:38 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvxB9-0005u2-L8
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 06:15:37 +0000
Received: by mail-pf1-x443.google.com with SMTP id a14so3196064pfi.2
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 23:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DVb9BqnCCIXJSwGWTgbhyZjM4qcTaOK8ILi1j32bGuk=;
 b=Ejy7ckchYzB4B/cGUpLwzSLs5SWO7j2kWIG+QyF6S7cM+STr5Pl4msE6B3g3mVMpuY
 Hm4YOy9h2ZNvTyTyoj8vV4ybhx+YAPjv1RWuNVOzdC6IP+Z7PfXGASj1v5jqWLxXgqRr
 eAyUauN1faGhfkiAKtK24NGVy4EXFFBUCxIujb+A3mjvHyc4ykYXS2RFZB44h642U87z
 IWZsDw/RrO6K76WIUZMaPzuBLAgkG5sB6+ntFDxPM/uu99ODtxdV4FeWDXBP2wsTXukt
 8F0A4Iitb8y8P8Z2KaD9gNq8OW6rWkBfuQUEG7WT0fVS7WpIan4dtegFoitWZJ74X7bQ
 Eviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DVb9BqnCCIXJSwGWTgbhyZjM4qcTaOK8ILi1j32bGuk=;
 b=JN5i9ly0Aeto6sp+cGieY9oVgSk1lHt7JtE3tubua8zH6feCYzIcLDnicLkfBawKcN
 iKK1FOIjc2vy6jTLrZfwQ0JfXMiMoCHyl3XEytNlTKVbnEVzIxmeQVhodFjx27cRRgk5
 6qOd47teiYLCKKdM4XWU0ey+oF0yqf7nrDq7Bj1QLPrRbD6u0D+zdU7bEmkGPtwF0imd
 vRYfPqlQIH0g4AVkxH29lF8018qU69QCTjdbI+GGOcKYChwNqSvZ1Zx+zS9nqeSRF/bg
 ziJXtgml27Bb+gk7e+JfSY+jGKc8vIUv6HHsDmoC/EmY/nbZFSu/b2ntyEMzDZLcnNjS
 afaA==
X-Gm-Message-State: AOAM533voFBBWEKhiYDrA2WvyZFOdMQ+Rg85TbpkNwhMstE2EcS87eaF
 Q7VPSOZ8RwxZV4FMKLTlPIcNgZ1MW3c=
X-Google-Smtp-Source: ABdhPJy4dj2Prxcig0aMdKJOiKAGjXoiqLvRtoIWGCfqYZeloqoaeRkaNEjF7GFc8mFQQ/QoRphcYw==
X-Received: by 2002:a63:b06:: with SMTP id 6mr2884850pgl.116.1594880131151;
 Wed, 15 Jul 2020 23:15:31 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id w20sm3669904pfn.44.2020.07.15.23.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 23:15:30 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Fix some build warnings when W=1
Date: Thu, 16 Jul 2020 14:15:25 +0800
Message-Id: <cover.1594880014.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_021535_964209_5F623C3B 
X-CRM114-Status: UNSURE (   5.15  )
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

Zong Li (2):
  riscv: Fix build warning for mm/init
  riscv: fix build warning of mm/pageattr

 arch/riscv/mm/init.c     | 2 +-
 arch/riscv/mm/pageattr.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
