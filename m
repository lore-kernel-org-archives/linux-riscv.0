Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315F606A322
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MoyNP7ix;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uG/UI1Du
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RwIffzzok7rO/73G3Yb3jywPjRi9imtchY8AbG1VIbE=; b=MoyNP7ix6uCxEePfez7aPRvlFX
	gxyMdVXOZEv/EvyZAqDrkIP7k+OCRA5Jarqnp4YRLVrGTnmXmW300LdJk7EXFTEFFKV8bdBqs52/B
	DnLg7xzExzj6KCVnT3wXeuRWiYhMntGOD/vvw0PaSAlMy8jwGAknWEXDtf660/xc3vUqQtuhlo7+H
	Q+HOA99Kk0YQfEmA4IzRfHd5dS1x/768PcLtXE07UyzCUMUsq99a1nDFSvR3DrhwsbYL3Q1P/kugH
	JmvEDm1JKCJcO4BqSwetVaQ7M1l1w7/GLyQ7QGKzfjyKhpOm+tP/FC65bI8dd+/VXd74pvcBoAOrk
	HTsHofCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3ZE-000000072Qh-0Y1d;
	Wed, 28 Oct 2026 13:19:48 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3ZC-000000072P2-0sML
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 13:19:47 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso3167936a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793193584; x=1793798384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wr/bf4ddaLfe4dUuERT7xlpqqtK0FHujYgWWBDTQd8k=;
        b=uG/UI1Du1UyJ2xsyFklTOpht2v2AVcTI5teyvWMFJvjZytQQ8g2W8CLRy0RRWFbmaQ
         7W0R/dD2nwzERiaV8o6aJsTm4Vn+/ocSWwHGqEGJKadUjqN/AOu/W1y1Qxw+XPk18yX0
         5Wc1LqVRXak1CMW3lFdnYAeoiDNYvCwfCBvVVzqvYNzPyEf7PwuV0dStujXN9hhd2xXe
         krmtSj4IDuzjMax92QTT3DoC/1d8i3SswTu3xH0rO0Mvxylt5BG0wM9MIY6HukG/1aNk
         9POJ6zUkyGWLIoELFbZbBDWpZCynMrYMY/hPJn4xwCDWq05UTg/SlYLzKwHgKS4RiBSg
         SUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193584; x=1793798384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wr/bf4ddaLfe4dUuERT7xlpqqtK0FHujYgWWBDTQd8k=;
        b=pbSZtPQudqKEj4BbnzpyDoYgZ/jt+rR4AKWNGQbqDfCyKdp+OThSHoIvvb6ReXKHPO
         01GG+nLfPnmIPo0kwimj8BFy9NXZCQL4hpYeXp35ia+mr0gXlMoTks7duXYf65K71lml
         F0qYdvtozzr/TaTGPmGyFbv6TwMmH3Trno3YUd5aD+pEpBf+enIWUl84aKcjQlPN+cAQ
         AhSO2AXRNH6gjbT0yYg1jOWOaIaDN0u2T3BYiNIsj1jBcNDmptc3oDsFw17HJQaWSmQn
         zPkbtJjajNWWR9EFybqK0CB5Ug+W5BCzW4z5BZANPVTxyKn6Jwpm/hPJNzMIiRzcSCT6
         is3g==
X-Forwarded-Encrypted: i=1; AKwUvBz4I46S7+gHjpT7OSmqAyS75NsU6TxrIkFBLD5rhXWwHUdbRxGHCXXk2aGwxy+ytvoaWqlARNMWoEQO/A==@lists.infradead.org
X-Gm-Message-State: AFq9FYLvwYsdWSTwl+9EpwLjruYfkgMh0wNsE8PpXXQUBAoTpGWw902f
	HA28y6F1ZNmnsAcohYRdvkVULx9u3khBdT7tya+a0bBphSdejmfCWz1m
X-Gm-Gg: AYBFou1fP4knCuqKYO1YWHlMgKNcHIdcDidumobVANlVVnpqnup2+k/XEJNSR9ZiaDD
	bnj7VzFQxI/DsWRn1G3Wmd7H+AKGl7irxQMZFuBhmW/jYeGq5sxAi0pi3I4AcYN41yISPtxhWo4
	xLjFPkXLMZPePHR0RMH7Dh26qo0ylRmPpqqjJeOG8GO+ZbadxlR8OoCqjzqjBIRfNI1arKPAjQJ
	lk7oARZzYViXBHtoCr5vx8gJWlKExm671Iut2ZVns0efBMOdQ3pUlWKUv/kurhaMCEFtqkwJm7J
	PnFNnDsByKcD0Aa79v7w+MC91MzhbYibt3DtM4RyP0QsuoV6pJDDGS5FnYFN2ODLDtoIzCNqPy1
	HuLTKW1pKU67usG6Y9FOPQr9AB9JICDFLLICTxxtJnirZl12fl+lpca8d/5d0lNhxx8sYL54r78
	aIndwOaBZEjPAQOGhxvCfmedHxxi9xr/lDi25n4JWdyybACPcOmrltwY0g8Oadg0Iv1SOvLAIrl
	oqMgffhgNvYDb1hdILWaBS7ijcxcVgAgQ8mx4Sg4LLCPgl8AtHG7AYbfqSU/A2M3yKkjSGppfQG
	bLiWHQKiPKsTSc/V24jmWcMwRdOCZkcpGaVexQwPS1tA
X-Received: by 2002:a17:907:6d20:b0:c3f:153a:864e with SMTP id a640c23a62f3a-c49a7425a2dmr540243466b.22.1793193584242;
        Wed, 28 Oct 2026 06:19:44 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:47f1:8a3:6e76:cd9e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd790afasm597041866b.68.2026.10.28.06.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:19:43 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] cache: sifive_ccache: skip disabled device tree nodes
Date: Wed, 28 Oct 2026 15:19:40 +0200
Message-ID: <20261028131939.1014720-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_061946_255943_5EA83F4C 
X-CRM114-Status: GOOD (  10.71  )
X-Spam-Score: 0.4 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sifive_ccache_init() uses of_find_matching_node_and_match(), which also
returns nodes marked as disabled. The initializer can therefore map and
access a cache controller that the device tree marks unavailable.

Select the first available matching node before accessing its registers.
This also handles a disabled node preceding an enabled one.

Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/cache/sifive_ccache.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 71d3f94987fa..02878d54381d 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -297,7 +297,9 @@ static int __init sifive_ccache_init(void)
 	unsigned long quirks __maybe_unused;
 	int rc;
 
-	np = of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
+	for_each_matching_node_and_match(np, sifive_ccache_ids, &match)
+		if (of_device_is_available(np))
+			break;
 	if (!np)
 		return -ENODEV;
 

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
