Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47257C48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 16:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VT9z5ZchHTfMcKEmIGvNazodDqIWZOA00ICrY8a+36o=; b=kdUGahmdre1bL6
	L5IGB5d4bb359RACwAHoC5FCSgyo7BmK832c/AMzT9Vl308XvgBaN9cIIY5jlY9BOxOk7jdjEIM6E
	9jQ4pvnqB0vb7zAXhSZXLg+TsBRXmkxwLJwXL2ERJyN7oU4eeoqZ62VUYpXkkBmfYIINe5MdFVWCf
	Y+moZaNoVmsSl4TMeP/3hJmvpicKuhFuNGCSkud/Ch/8ZinPdVptfQ/DZODGXuc9JUcckIreDaN8l
	XFwGDJPAC83lzy79MATyhMS/h4uITEypvfdrRtpU+3pXgkMQHP3Ps9C0ATyiPM151RWMoVuCVeNze
	+/GZvIoXIFfZ1+ULgiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc6aQ-0000000BMkr-1dhf;
	Mon, 19 Feb 2024 16:33:46 +0000
Received: from out203-205-251-27.mail.qq.com ([203.205.251.27])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc6aM-0000000BMkE-3TCR
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 16:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1708360408; bh=ZGHZEFqQm5ii069pXVu8uHpEdaTRPxHpvYKhXylSm+0=;
	h=From:To:Cc:Subject:Date;
	b=eGG+DMSHWO06hi6ZqHXrWeVLlKhCA5w6DM5Yi1r7wKNab+l+IhwV1IvBBUbl3cxTy
	 +c/G9xvjhwGuKDU5kvtyFCVP6vmSlmXmRg8+ZqCmIQfdp8fwko4P+mJD1p6hWfssOJ
	 xF0LurIezIr+gR2IlXvUOFyvlg4EyKysq0v0Ku30=
Received: from cyy-pc.lan ([120.41.143.226])
	by newxmesmtplogicsvrszc5-1.qq.com (NewEsmtp) with SMTP
	id 84D282EB; Tue, 20 Feb 2024 00:33:13 +0800
X-QQ-mid: xmsmtpt1708360393txzobnay0
Message-ID: <tencent_594131AD216D8DE97CCC8265DA5D8E45B808@qq.com>
X-QQ-XMAILINFO: NQJsl5QovJ//eLvw2JJgdmcwPOSJL1qkd4HHS1NZK4NGT7s7HUUx1M4MXyn4pG
	 Ag2mmtS5aUgluorgeFA6d5Eo+BrrTdEbQm3neq2qggX7OctTbVnFKNMoFwpecGUdz1NIeYfSCMrC
	 djfCcPr0FnxxHf0NTCrptE+QqzRXi0zTNDBud8pp6TVdKzthgTWFlzOaIJhZ6v7c0d6Nq+pZorQy
	 rtDhoEMeRXsc5lGgP3HMAoPRhpymE5l2+Y2R0VdY+oTsKNUYo4FpJ4YqUXCU0kUrWEM5iTOBfKBV
	 Paek32e1h8//B3LMqYQz1jHONeM2/UHtV5U2hI0gFKa942L1PIeJMkK6Ao+ZpJLBQ686HieMRgEm
	 cg4fkhcPuF4oHUutK98VSA3ceJ9WC4n8bblHfJ4wfyDWsSSkYmxWwUOUwiygUGIrt47hpUXhPaBo
	 UOa4nYGjAhEzX5xx/JtOx6X72UaQgHg4XjOKYqTcRf88/XzvA9cOXlzR91UNaITIaad/Txuw7PrV
	 RCiW5dBVS3m2NrMimZO2/22WJEnjUvylMH5yBUcyhdnY3viPI7eGiVxpD04xTnTSGXrS3aU//E6P
	 4d2GGDz1hSX3NF/0dt4Zb0XHsLm++qIgx1y5E0ZmLxHEPu/oNHcEAHCEM8SRkFpV+hvRpue5xXav
	 iWEwpdRpViJ6C2Os2c8I4HD8MLAgdKidk1v43jAmU5a++qIPcabZRxGAHG3jeseedrUWHaPi9jGv
	 ED0PLQRt9IbE2SPTyeQK+gmJ2WMdSegjeHM/MpcfIN6qCvl6udHUVR+LG83iLydv+11aaf8G+r+W
	 Tx8LSvPCiCzOXz71ZK5f/5+IlHxZUWLUhZA14OEK38jNF66vFoHGw/UvfBkpWQjTdjeSbXK2aL3y
	 orfNKD51/jVgmcp/s3rLuNti2TnDWgapl9VW7HjycQkqcHPl4P/JxIpHHxQcyg2C9rBsVBRcgyHx
	 00bgd5Z119/AW2UFGdd8BG5uKR3OrV3XJEt4JZSAiwbwfOeVdrsw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH] riscv: mm: fix NOCACHE_THEAD does not set bit[61] correctly
Date: Tue, 20 Feb 2024 00:32:09 +0800
X-OQ-MSGID: <20240219163209.2285719-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_083343_422094_B12EA0CD 
X-CRM114-Status: UNSURE (   8.89  )
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

Previous commit dbfbda3bd6bf("riscv: mm: update T-Head memory type
definitions") missed a `<` for bit shifting, result in bit[61] does not set
in _PAGE_NOCACHE_THEAD and leaves bit[0] set instead. This patch get this
fixed.

Link: https://lore.kernel.org/linux-riscv/20230912072510.2510-1-jszhang@kernel.org/ [1]

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/include/asm/pgtable-64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index b42017d76924..b99bd66107a6 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -136,7 +136,7 @@ enum napot_cont_order {
  * 10010 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Shareable, Non-trustable
  */
 #define _PAGE_PMA_THEAD		((1UL << 62) | (1UL << 61) | (1UL << 60))
-#define _PAGE_NOCACHE_THEAD	((1UL < 61) | (1UL << 60))
+#define _PAGE_NOCACHE_THEAD	((1UL << 61) | (1UL << 60))
 #define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
 #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
