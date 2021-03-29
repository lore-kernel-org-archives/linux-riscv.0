Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C63C433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:12:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E19F61981
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E19F61981
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jiuyang.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D6HWn6vm/ff++MlTkJf4IfKcifw1ouhRAjqjtan/Mho=; b=VX4L1Q9ga4pO6laOMqG1PhMjF/
	EUFsI3GSraqYXNF37vd1CHEQrrvAPKd8+XmIbOsS4gP07SEe8Y2iAsDLTuIAHSUV8SzrxhQzd7dTl
	bofGvuJGaAR01ahL/oEZC70XzZZQIV7rqxcb2O84ck8VCpGWxM51ZBa2DrAodztV7E5dQ7Eo5rWhP
	rI/UtjFLFDlSBqwEz9Hx83UpPLzL9CG2KWVqbB5B4BXCEI3gXGWKLGhyCb3W4NQZn88GljUyHiNxo
	62cv8pCWxIYXdSE7tlutg5nJl244xIgShqa/HpNjHVFl29bV2AEKiC5UIJ1RqnUYjpNqAOa4TA1Kx
	B1b8sk8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxIb-001ByP-Ky; Mon, 29 Mar 2021 19:11:41 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQq6Q-000cOm-VU
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 11:30:40 +0000
Received: by mail-oi1-x22e.google.com with SMTP id i81so12754608oif.6
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 04:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jiuyang-me.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZpbsboO00+NGpd7nPfABOl4VUqqJUF8OMrvGKrRJGlk=;
 b=DNY7oU5AuNEygQnIMijS7RCHjJwRewCPsfUSQFe2h5cCOuJ+ifFY8DW4QRTPk93+If
 bMHPE7IjFB2U6W+c2yzimU9uZt5TfHUjRGaUvDkm7npWoRMfZGKNzDIf6xDMUX5bu6oe
 wpl/fN+0Q+n2ziyPey6y1Noy3ufYTE6y0a88c2J322sjbuMaPrr4UIvVI1fHpQaFvcDZ
 POjsafTleR+VKvsssby9efnaPkcq66PSyONjY23mW37FtglEdAMacem4urvS6iWN7Bfs
 YfjIjm80E6/m+aMwFYPD0FvKecvaGJEarz8dNzhv0aY4SNsq+aUeLZQFdhWMZUoKgq3c
 AyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZpbsboO00+NGpd7nPfABOl4VUqqJUF8OMrvGKrRJGlk=;
 b=NZl1ueLwelCdnXC6C26FirYGo1IzzpLjjmyJWadQw3uqINIyBKhRYGBjE7j26JBWSZ
 qanfLOP2FTX17Ev6rVJnxmMirKsO8SH5ms34ICSeC4P0w5TWYZbTjTnWzQCDS3Pw41Xy
 5aRH0MvgBbAPgBFJMiqtxjYwUfIDwLTPZ60zDKrWQy1lo0s4ROdedD6lUM0HGIWz9dX1
 9TduFvvKVYFVWoM6eAWe9fd34T7mJZSj+XShHuHKTzReVcSBzIC3u1CMHJAUkm4s84MR
 xlqih+06oLF1gprLG160gP7UmNO/wZSr4TrwRe6gjpA/BHcMNJMaj5tXyOD6iO6aOFpV
 k4Fw==
X-Gm-Message-State: AOAM532rjadfoHmtToD03K7kaunZqZBpeuHrS5fc270iRri6D5hIu6Ey
 4+Yg5BMSs33kVmQ9zoA6bTxp6rzgSr3OhvRlwxKhrA==
X-Google-Smtp-Source: ABdhPJxUl/aFR80aVf1TQMBBpMuXPSOYnn6M6PkezmdoM4iqg409vk+JH1z0TKOcUvtNW4LNoXO2gw==
X-Received: by 2002:a17:90a:f98e:: with SMTP id
 cq14mr23359357pjb.60.1616982983564; 
 Sun, 28 Mar 2021 18:56:23 -0700 (PDT)
Received: from nuc.. ([193.110.201.196])
 by smtp.gmail.com with ESMTPSA id x11sm18202652pjh.0.2021.03.28.18.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 18:56:23 -0700 (PDT)
From: Jiuyang Liu <liu@jiuyang.me>
To: Alex Ghiti <alex@ghiti.fr>
Cc: Jiuyang Liu <liu@jiuyang.me>, Andrew Waterman <waterman@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] implement flush_cache_vmap and flush_cache_vunmap for RISC-V
Date: Mon, 29 Mar 2021 01:55:09 +0000
Message-Id: <20210329015510.44110-1-liu@jiuyang.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_123039_161114_FCFC0624 
X-CRM114-Status: UNSURE (   9.81  )
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

This patch implements flush_cache_vmap and flush_cache_vunmap for
RISC-V, since these functions might modify PTE. Without this patch,
SFENCE.VMA won't be added to related codes, which might introduce a bug
in some out-of-order micro-architecture implementations.

Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
---
 arch/riscv/include/asm/cacheflush.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 23ff70350992..4adf25248c43 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -8,6 +8,14 @@
 
 #include <linux/mm.h>
 
+/*
+ * flush_cache_vmap and flush_cache_vunmap might modify PTE, needs SFENCE.VMA.
+ * - flush_cache_vmap is invoked after map_kernel_range() has installed the page table entries.
+ * - flush_cache_vunmap is invoked before unmap_kernel_range() deletes the page table entries
+ */
+#define flush_cache_vmap(start, end) flush_tlb_all()
+#define flush_cache_vunmap(start, end) flush_tlb_all()
+
 static inline void local_flush_icache_all(void)
 {
 	asm volatile ("fence.i" ::: "memory");
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
