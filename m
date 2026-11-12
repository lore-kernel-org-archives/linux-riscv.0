Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D92606A8AD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MgQ9Jryf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MDfo/vgO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zKf+ZycWj8VBgRVj6MVh6XjtwkJmLntLm+VCbhEVTVI=; b=MgQ9Jryf9r0xppaLum5cF3NYn2
	fkFmklLoTvqXgxkILv/i5Xd7mVg9oAnKziGPCQEhi0jYreK2BQEdKTyy0v1nRvG8jGPHsTAAEruZS
	dT5sTuRj3+tvKlCdis4U/4hD78NGptQs88czEb0g5iX/t/8JPqEPx/jiNX6dtmboqbjU9/iSaUqXS
	Y2LAsGRvAJ1RZirWXSz/L63PRYKolfNhIYOaW3tdPEHw65yHgGHiayxbBPBW8QvzTgq7EdbQ0galA
	MMHJwqcYmS7B/peKZz098H3+ajc1BYd7eDWThcGx4Kz0/00TSt9BNRJ25talO1ThIjShHoM3XVPRI
	DyZRbd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV4O-0000000A7nb-09XR;
	Thu, 12 Nov 2026 13:42:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV4M-0000000A7mx-34GP
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 13:42:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43A6B4221B;
	Thu, 12 Nov 2026 13:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F33E1F00A06;
	Thu, 12 Nov 2026 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794490946;
	bh=aib6Hm+ujUboCG2A2/egmpnhtp1eRYPkFTf7G8C56mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MDfo/vgOeIeckTKqRhHyXQqshvy6mWJslcJ+lmykZeZzkP2cy7s9pVGmm2TN/4Nvs
	 PKzMjpqHf2IBWoepSvTczMJOs0Z/a0J/oEYRucWjpMUlo5pfPwVjuOpp5vj+2BSLjB
	 2RQSbwAqxwMbMV2+Vjy+NEBMxXgnecDV4+1/LrtKxgWSqNLpwL20JT8l9RXazPNcQn
	 O+1tEgmPwTfLeyWelgbcLmgvemGhqZEHQX3rdwUmED2Ubj+r+04cx2y5TWye4JwjFV
	 /IsGns/gd7JSeKTUOPGkgcJ6sQzZEcSetl1TmZl/5YweuUpX1d4P5svKF38JHG8ujm
	 5DxAiKIYep4og==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 12 Nov 2026 15:42:18 +0200
Subject: [PATCH 1/2] riscv: do not make the linear map alias executable in
 set_memory_*()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-fixes-riscv-v1-1-1caac19897b5@kernel.org>
References: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
In-Reply-To: <20261112-fixes-riscv-v1-0-1caac19897b5@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Mike Rapoport <rppt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.1-dev
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

set_memory_*() applies the requested change to the linear map alias of the
range. For set_memory_x() that makes the linear map alias of module text
and of BPF programs executable, although nothing should ever execute that
code through the linear map.

Keep _PAGE_EXEC out of the bits set_memory_*() sets on the linear map
alias.

Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/riscv/mm/pageattr.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 5b3cf326455db..b138113755359 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -271,6 +271,10 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 		.set_mask = set_mask,
 		.clear_mask = clear_mask
 	};
+	struct pageattr_masks __maybe_unused lm_masks = {
+		.set_mask = __pgprot(pgprot_val(set_mask) & ~_PAGE_EXEC),
+		.clear_mask = clear_mask
+	};
 
 	if (!numpages)
 		return 0;
@@ -300,7 +304,8 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 				goto unlock;
 
 			ret = walk_kernel_page_table_range(lm_start, lm_end,
-						    &pageattr_ops, NULL, &masks);
+						    &pageattr_ops, NULL,
+						    &lm_masks);
 			if (ret)
 				goto unlock;
 		}
@@ -318,7 +323,7 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 			goto unlock;
 
 		ret = walk_kernel_page_table_range(lm_start, lm_end,
-					    &pageattr_ops, NULL, &masks);
+					    &pageattr_ops, NULL, &lm_masks);
 		if (ret)
 			goto unlock;
 	}

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
