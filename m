Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C31C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 18:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nzN2KIV/1qvalGKEH3hTowbrFDHYFv4Pi6AcN8G9cc8=; b=2jzlbcMytqC4XV
	+RBUvtlAxRzsMkgkdonvfkkYBok3GD/mkhoG6bCQ0MVwrC+mHq3uFTdx8JXS71Ot8BfGGMRynljjw
	ZOA6maG3QkBjl/TkhhDDaGGHywBqQShKy5dwt8jkPRDSGpgR+2YWZBmEkYMfq+CLrY0pP4Rh5jaFq
	qFbxurxidrKjHPbf78E63Cn/CYnru7oRBNUFjhaZv07Iz46BzPqMkK2OCWUyiVw7KQa52yiZTNmGM
	q9VQQHweP3yP588bpqR5jp/wkyaaziXJgz3s0tYzOFzCvTal/GlS5sQSXvvyncVxarVFq7l22FE4h
	LjVgtYT658PQoxSio8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCmU7-0048MQ-3O; Tue, 03 Jan 2023 18:58:03 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9zJQ-009AW5-KQ
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 02:03:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672106590; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dxExnhimXstWK9eLeZZYR41AYy3ljuAKVeFxS7g+2eBSByX1nbOqtJ7W6fCEt9qdizXhfzkVtWR3H4JynZbE9o7lh8DoMS6PW3vfY/hRZuSiZipQzChlS2EQq6OSy6xCrC2JYo9rh/K+MQbgi/DePPKxzYH1iSeLwTAXBs0hxdA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672106590; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=DPEEmCdEsxsvYMpo0CHfExkto19g7AY9emje4zXFAcA=; 
	b=aino3Mvg5JXkXwCD+yUHlDKw5Xq+/hYAlN0/05uJEgBXA3fjVzVoEVA0d8dA0KFHYroq14m+415OLvfblSVrxfdAcm2qHmUh8yk2GsBwpzsauWnDOqjrhdtNX0QCKvrsdpiAChhij8yggfaNFS6JGTU8jgQ3wOjD67g9I/x9jH8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672106590;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=DPEEmCdEsxsvYMpo0CHfExkto19g7AY9emje4zXFAcA=;
	b=Wx69jIB4S3u5MiTtZP/hf7qXem2z4oEis/bmJT9C7jnheh1Mu8gHXb323eDqWiai
	2C9i066qbqjCMdooFEErGNCMR9ufEQ0RXu/eQjRIapPgZRikYidsWH1MYZ9qt8/mgHz
	Ju3jbjZkUYX63E7Z4UAP7bEcmSKTUEI7wPwTOg8w=
Received: from edelgard.fodlan.icenowy.me (120.85.98.209 [120.85.98.209]) by mx.zohomail.com
	with SMTPS id 1672106589594367.22451234243124; Mon, 26 Dec 2022 18:03:09 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/2] riscv: errata: fix T-Head dcache.cva encoding
Date: Tue, 27 Dec 2022 10:02:57 +0800
Message-Id: <20221227020258.303900-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_180329_204315_209535A9 
X-CRM114-Status: GOOD (  11.02  )
X-Mailman-Approved-At: Tue, 03 Jan 2023 10:21:58 -0800
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

The dcache.cva encoding shown in the comments are wrong, it's for
dcache.cval1 (which is restricted to L1) instead.

Fix this in the comment and in the hardcoded instruction.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
The code is tested on a LiteX SoC with OpenC906 core, and it
successfully boots to Systemd on a SD card connected to LiteSDCard.

This change should be not noticable on C906, but on multi-core C910
cluster it should fixes something. Unfortunately TH1520 seems to be not
so ready to test mainline patches on.

 arch/riscv/include/asm/errata_list.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 4180312d2a70..605800bd390e 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -102,7 +102,7 @@ asm volatile(ALTERNATIVE(						\
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000001    01001      rs1       000      00000  0001011
  * dcache.cva rs1 (clean, virtual address)
- *   0000001    00100      rs1       000      00000  0001011
+ *   0000001    00101      rs1       000      00000  0001011
  *
  * dcache.cipa rs1 (clean then invalidate, physical address)
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
@@ -115,7 +115,7 @@ asm volatile(ALTERNATIVE(						\
  *   0000000    11001     00000      000      00000  0001011
  */
 #define THEAD_inval_A0	".long 0x0265000b"
-#define THEAD_clean_A0	".long 0x0245000b"
+#define THEAD_clean_A0	".long 0x0255000b"
 #define THEAD_flush_A0	".long 0x0275000b"
 #define THEAD_SYNC_S	".long 0x0190000b"
 
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
