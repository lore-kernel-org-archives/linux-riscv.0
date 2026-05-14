Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC5BCD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FG/X4F09cBakhtwyTdYG6a3SiW1l7oJIO879Ve5h5ig=; b=n0684H2gkCCxQg
	w5lOVeir+4kRWegMUIqOZHDwYXUyqL1QOljKrTJuA9auc7yiY8u6aN7hJEzRGnhb9NeyE/LIMFGuE
	bnEozVqfc29gW8InRKkLS0H3NLOptwbAR/eKzSupshqkbjl+9bd591tBL+jiBWUptNHg76iTaIBVn
	HdpMBWYojSRRzC2PLRqbHXnsKULEyr3T4+sdnIOg097BOEQ+hBW4ZFYRQu1/NtDVjxhF17+Ff+YU2
	VN7JKhmtXgN3cHKHVTMlPkjUTFDP5YIXB9AbyaqU6n2YAgiFghElTn5wo3r4KVuNEDysaIQOX7opm
	+0/5nGEnPWprgtnK5FfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZLS-000000067v9-1wFe;
	Thu, 14 May 2026 16:55:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZLM-000000067uM-30uJ
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 May 2026 16:55:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rhs4rPnXJOnQ0TMkpeTOhKZgfpfxJZD8kt9kby3x2Ic=; b=A585R7QwtfQD0J+ISL0nYGjPGL
	ZuZC1tFwPvhNacsF5+Jtwgh1OS4e27NzwrobvyM6cQvMT9KZE6kOYBHSvFpckSIUoRdTL/zYzLr7U
	hU2JMnsWdq1sctlIwQ16bys9Z+4Kv8mpludNe2NIRLs13zRTerC6rwLmPP+KP1xVzhzSNn+xumHZU
	iFXRIk4LR2n9IXM9aMU5stBVVKD1ifEQVzdLuL1+h/puOstTZvwRPSDpyG8ih4joFmX2M/rKgQbyS
	CiYTvfMhr2ctzu2NIVfD9RabzYA+5N1cbvf7Xk/A3ipwN3fvzwvGlKkCFeJ1QLo/xxAbaPOUSU+5v
	Qpe1hhxA==;
Received: from out-171.mta0.migadu.com ([2001:41d0:1004:224b::ab])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZLI-00000003RxG-0cME
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 16:55:27 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778777715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rhs4rPnXJOnQ0TMkpeTOhKZgfpfxJZD8kt9kby3x2Ic=;
	b=fSUXlmMwCdhNDt00FA+dopT9YjAk8uWWdF4LImcZAEuaHI3dKCRNmtztsJlmWZSUraLtEc
	kaW84RLkrlaZdKcevJ1Sn9b5ITooevsWxZ+pVLnuevJtm1nPmA5sYXHWU4dq7CW/rsnrMB
	pOAjq4MYGzV8d87vrf+Dkob67/v2k9I=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: riscv - replace min_t with min in riscv64_aes_ctr_crypt
Date: Thu, 14 May 2026 18:55:10 +0200
Message-ID: <20260514165509.527721-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; i=thorsten.blum@linux.dev; h=from:subject; bh=v7o5JznVlPNo7AD+88VwjdqH7OaDNTvDjI3KRzcUXw0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFms//Ke3XPp1V5QG+v/tPrUyZJu6y/ed/v7X4rZzPY3f y+6yZmjo5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACbS5sjwT8HTfOFK9gPTr3/f rlr23DHw4bufvxLeLD73b1mHuKOdrjwjw5XdLU4LPkodMLrcd2bL/8XTPtRGb/30p4Xnm/m657e /iTADAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_175524_526206_942A616C 
X-CRM114-Status: UNSURE (   8.94  )
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

Use the simpler min() macro since the values are unsigned and
compatible.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/riscv/crypto/aes-riscv64-glue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/crypto/aes-riscv64-glue.c b/arch/riscv/crypto/aes-riscv64-glue.c
index 8bbf7f348c23..bbd920c9e29d 100644
--- a/arch/riscv/crypto/aes-riscv64-glue.c
+++ b/arch/riscv/crypto/aes-riscv64-glue.c
@@ -19,6 +19,7 @@
 #include <crypto/scatterwalk.h>
 #include <crypto/xts.h>
 #include <linux/linkage.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 
 asmlinkage void aes_ecb_encrypt_zvkned(const struct crypto_aes_ctx *key,
@@ -266,8 +267,7 @@ static int riscv64_aes_ctr_crypt(struct skcipher_request *req)
 			 * operation into two at the point where the overflow
 			 * will occur.  After the first part, add the carry bit.
 			 */
-			p1_nbytes = min_t(unsigned int, nbytes,
-					  (nblocks - ctr32) * AES_BLOCK_SIZE);
+			p1_nbytes = min(nbytes, (nblocks - ctr32) * AES_BLOCK_SIZE);
 			aes_ctr32_crypt_zvkned_zvkb(ctx, walk.src.virt.addr,
 						    walk.dst.virt.addr,
 						    p1_nbytes, req->iv);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
