Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE37E69187
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Nov 2024 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lPJfRrjQhbzpuame54ZdwF2HPR/jgipuchkRuafxIc8=; b=sadteq8omWF+VU
	qSqDHJuNk2B0axyISclCdBH5OgwxdzK456PW/Rz87B/FuffvTYfJ8xyF3PWJuXOjRZ6g/4e7w396T
	iCUSGT9p1KiaAmaYojDctjZVzrzOMq0fjmjbADkpVqPeFk8Epjq6pLQ3c8OHtUeNSz3A+7RqwsXL+
	fca2bSiEsnbVyfWjNPyLVYlzIhdXM52ooqK/rw0e1GdAa6Y4SDe/IKGtEOZGYXJv/r4QGcl9NXLDN
	QJXUqj3uWLZYnvnvbQfPjb0wmsSltILmzvaOvzbTrlgEa6m36b2b1IYj/EyDOrxgaXRCioXCOJVZj
	MGnwMSzRLs0DgSX4Ft8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFKsx-00000006hAU-3aig;
	Sun, 24 Nov 2024 22:15:19 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFKsv-00000006h9o-3ePI
	for linux-riscv@lists.infradead.org;
	Sun, 24 Nov 2024 22:15:19 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-46101120e70so28427921cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 24 Nov 2024 14:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1732486515; x=1733091315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AoCz/NHoJ9MNwkbztrznoUUGmYlxHga44YuBKiYrkmM=;
        b=dUVppPu5mw8P9W2mu8X9YpwbXezy0kax8bOecB7upaRFR9Ct2H6Plr1w3PS+Y9G+Hg
         xKjn5t9CvbI3GVfdme6ijQGdqmVX6ZRUR/0+qMqMM6HbnY3bpskeFEMtAAgjca9u9Sl3
         CRUYzqcfPilPnNmtjWtbHh8KhL7UbtCFoUyPncl7QlKlEkP98xKLW6w2S/tiFhOjlA2u
         E/c5eObnwBb/aWC66eJH1ASs7AB5J/RnezdUBzkqRpijkHpK4lnxAnGrU7nxAIADwXtJ
         JDrptedMwu2gn8VuSBAgvLWB7XvdJdiIgDabPJrLa8hguPQy8/IGkGKgZUCTM6ABB/Gj
         Ag4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732486515; x=1733091315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AoCz/NHoJ9MNwkbztrznoUUGmYlxHga44YuBKiYrkmM=;
        b=dvDSlLmVZXzTls14E0XJPUrlAnTU+OJSo04ahOuQIdzhE4RGM8he3KciyLzwDVEqy0
         YADo1LjzTPY9K0F5Mbe/v7/02PdyZPSbRXRH1ze8cLGKBet5yeVr/LameCr352xzh1Aq
         jT/1qaPemB7JBUWTx+dH0mNBvgydjj1ckYGzWN9n6au/vp6dHki0XWOsReEbbTXisfs3
         sv163Id6mr6YebyzjrTgxHwCAcc7h4GNoMyvMAyvKgtt1CAnNJCwpEjOpEPEBvDO6xmJ
         QLasLqeW7Kosu0YNjRgJKsLH15XnW8FnIl/WasYGIrI6uC3I0B6H7x3bwkTvg1TLQSI4
         ufrA==
X-Gm-Message-State: AOJu0YxRrEGnyc6M0pqYbT/hzLgaq3hvB1WXx14D5ITA9wpQxy8HTCXr
	DT/CANA5dVwjc4/QAh8eKS6mulq6wVBXBGzBuNcIItyyMt1Ca8WRRSOGfqs+Iww=
X-Gm-Gg: ASbGncv9UVzVQ7nK1o+hGy0Aedn4lPG65EyuW51Aj43gmg5mvlmm02Msn3xUZHasivY
	Jy4ZiIwBwwkdbGWkr6Np+CgBppp1KV6EXzzGSW++am4XVUNCgaX4N/AKDnE5LbJ2u/HPcu4ru6I
	1LzVXVr/LNEIRKGJ7//y1Ldgq1wN9H1f/IwF4ToPw/48by1qgLFAt4b2ulzkFFmDtBCJ3/7n0SY
	sGIquLNq1hU4zg2THChKFex7a43vMQQNktLaFZJQkzA/yZviAeX++djGdJKJHA1phTxTrWpCu6L
	tQLMS9gU8QY=
X-Google-Smtp-Source: AGHT+IGcTShMZFhzOvUyddACYJm4B/igCOHKOqjdvOFOiZIKBbGE0ZK9b5jP9lHAeNlpC9LdfWo0pg==
X-Received: by 2002:a05:622a:13:b0:466:9671:bd7e with SMTP id d75a77b69052e-4669671c06dmr6951831cf.42.1732486515349;
        Sun, 24 Nov 2024 14:15:15 -0800 (PST)
Received: from ird-aus2.local.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-465b0d5c7e9sm35033751cf.59.2024.11.24.14.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 14:15:14 -0800 (PST)
From: Michael Neuling <michaelneuling@tenstorrent.com>
To: anup@brainfault.org
Cc: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	mikey@neuling.org,
	Michael Neuling <michaelneuling@tenstorrent.com>
Subject: [PATCH] RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU overflow bit
Date: Sun, 24 Nov 2024 22:14:58 +0000
Message-Id: <20241124221458.347464-1-michaelneuling@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_141517_919861_3304D476 
X-CRM114-Status: UNSURE (   8.83  )
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

This doesn't cause a problem currently as HVIEN isn't used elsewhere
yet. Found by inspection.

Signed-off-by: Michael Neuling <michaelneuling@tenstorrent.com>
---
 arch/riscv/kvm/aia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 2967d305c4..9f3b527596 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -552,7 +552,7 @@ void kvm_riscv_aia_enable(void)
 	csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
 	/* Enable IRQ filtering for overflow interrupt only if sscofpmf is present */
 	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
-		csr_write(CSR_HVIEN, BIT(IRQ_PMU_OVF));
+		csr_set(CSR_HVIEN, BIT(IRQ_PMU_OVF));
 }
 
 void kvm_riscv_aia_disable(void)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
