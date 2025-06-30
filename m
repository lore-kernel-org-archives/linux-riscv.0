Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDD9C8302D
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 18:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lc2tOFs/nfPs2kR1+NWEZvoN98pTndNbtUSk3k9YY18=; b=nHYsUBnPCvjRNE
	6+Hg+36eQ1sstSTdA2CcRgGdlkqGeOOlO6vmB4Oebik12PTq8qhqSAwAASYnnrKcQcZou4pi0/LgT
	mgy4ajH9Rn6bmILx4xvAdvlG86Z4AMiG9GxYloSXPUoVO10SgBkvf4yyfOdeGc422Zh90w6HOiyKL
	Ey2IT1KE2tKO/8Pzndh4jwrrM8hOkHW5hzarRoeGDy+LA3jp4tNmlFYR4TXgDvHJOlPnR0hkMe1u5
	b40wYw0LMG0Ifh9epw9g8ARi96LF3NFnsgB+Flqu3H3Y+eFwb47yRqcLPe7YWiavZbJohMtk6r68h
	xTSam+LAAS2D195NarXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ1R-000000039bS-3BgP;
	Mon, 30 Jun 2025 18:14:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH4M-00000002pj4-0lnt;
	Mon, 30 Jun 2025 16:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE3BC464BC;
	Mon, 30 Jun 2025 16:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258CAC4CEF3;
	Mon, 30 Jun 2025 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299761;
	bh=UROoErFHCYCaDPqAxDhc4AhSGoASaVjnImGlpaYhSWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lFhWefsH1fRXhIkYKGeZupotUIuzQK0mHzeRtMkQRgdXPsGlkhpPRKQobnQvGKuGT
	 7PnPapOh93KHn6MH4/WuOrwHL2xVOcpK28cyBs6+yH63i0K+m/eh3SvOmAcFeq4kxI
	 ytKgB/RYasfDuHhowfiLEeDwE87VFQr62Fm8GOL/0SHcZODK/rDekuBg57dxIvGfRV
	 nhfM4qJVirbVxiqe2/U+pyUjo6po/3IlrnKZeXL/oo5RjjQ94CZbiYjI3Vrm6Q8Qev
	 NQVMh2AOzs2cg7eK1PcomkfvEIHncEcPRawm+yQBRlbaqBJ+ws+8cn9ct24/SMfzFx
	 rTjzEXS2tfbtQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 02/14] cxl/test: Simplify fw_buf_checksum_show()
Date: Mon, 30 Jun 2025 09:06:33 -0700
Message-ID: <20250630160645.3198-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_090922_239474_AC044007 
X-CRM114-Status: GOOD (  10.50  )
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

First, just use sha256() instead of a sequence of sha256_init(),
sha256_update(), and sha256_final().  The result is the same.

Second, use *phN instead of open-coding the conversion of bytes to hex.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 tools/testing/cxl/test/mem.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/tools/testing/cxl/test/mem.c b/tools/testing/cxl/test/mem.c
index 0f1d91f57ba34..d533481672b78 100644
--- a/tools/testing/cxl/test/mem.c
+++ b/tools/testing/cxl/test/mem.c
@@ -1826,31 +1826,14 @@ static DEVICE_ATTR_RW(security_lock);
 static ssize_t fw_buf_checksum_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct cxl_mockmem_data *mdata = dev_get_drvdata(dev);
 	u8 hash[SHA256_DIGEST_SIZE];
-	unsigned char *hstr, *hptr;
-	struct sha256_state sctx;
-	ssize_t written = 0;
-	int i;
-
-	sha256_init(&sctx);
-	sha256_update(&sctx, mdata->fw, mdata->fw_size);
-	sha256_final(&sctx, hash);
-
-	hstr = kzalloc((SHA256_DIGEST_SIZE * 2) + 1, GFP_KERNEL);
-	if (!hstr)
-		return -ENOMEM;
-
-	hptr = hstr;
-	for (i = 0; i < SHA256_DIGEST_SIZE; i++)
-		hptr += sprintf(hptr, "%02x", hash[i]);
 
-	written = sysfs_emit(buf, "%s\n", hstr);
+	sha256(mdata->fw, mdata->fw_size, hash);
 
-	kfree(hstr);
-	return written;
+	return sysfs_emit(buf, "%*phN\n", SHA256_DIGEST_SIZE, hash);
 }
 
 static DEVICE_ATTR_RO(fw_buf_checksum);
 
 static ssize_t sanitize_timeout_show(struct device *dev,
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
