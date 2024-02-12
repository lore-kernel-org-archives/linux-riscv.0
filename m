Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45393C4829D
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 02:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noD8gSN13pNj6RVeZ9xzOJAyongLiFQK+L6dyblfSj8=; b=U+jHETSV/hLUdp
	ACXzEsNK6CkFQ0QxT7GtU5aK2pLZzTl3aWUt2V4I6UYZlZYNLW9B+znjZfS/FZAcDmd4BMog8WYTu
	H5OxxtER4b1NPeryEvSIwFyR8cBkGiYwokt+WJp3r38MGnfFjGbgwkams0tpom9YX86WYJd5rKBO+
	ONdSrZ4jnUJoCiAfNiDED84TRUhkO7SrQdWotSKVnSPxajNE8Q5+acEWNzyzuKvqbt5NHEiEaYjAB
	2cfQDkX2vZUh1EuouYS6Wqf4Iis1py1PHpP1ONjdjptvOJUTxw1+SheenBqWZwTj6amdCpGLhYjrd
	/bAMUDCkpA1aolir9XSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTr-00000004DCj-2guN;
	Mon, 12 Feb 2024 02:55:39 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTn-00000004D9g-2bIL
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 02:55:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d7393de183so17208365ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 18:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707706534; x=1708311334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lt2Zw8ci3FBMgsxbvxJ1Pjg/pitk5ttZsMbyNXtz18=;
        b=SQc1JM+fgMUwxP/ZD+eMA6+jpm/51RDTLeVb815Idqctrp8RmBgodnQWB849AHXDfY
         KZw0WbHqrkVv+SY7JLkr1P9QowV/r0Ik9WxqUk7mRluIZLArm8HU1KKCuFBCjLndwJBY
         EKl8lrb7XT+14WAliKo0lelHmuqjxWEmB7iVk1MNrvmtfeR9Sn+dTJhoTdvsijS/sTkN
         a9s29+/pvnFWo0NntInnVTslfVHx/qHlNe7SFksoANNx8ue+M0+wQCByfCX4CmZtZt6Q
         KbhiQ478wyH6o35E+OOqIoUZp2EX7kovji/Myq6Iorh/E4uEZhI7lylZd5zKCowvDVlN
         OpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707706534; x=1708311334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lt2Zw8ci3FBMgsxbvxJ1Pjg/pitk5ttZsMbyNXtz18=;
        b=i0jsRwwMkbNJ1IrreCSB0gDEdn4fhIs07fZ3KgQgj+QLCNB+gnZ/zf1tioekdhHty7
         IAtFuOaWjbSozBWuloaJqjXWyXES7wnKiI0WVJe2vl0P5BFW0aqfKl3NfgIcv/fHBH/w
         ln3LdEyCmX5v1/qmpYTK2zhBQcN+R/Zouwzen+Cr0YUnWbzIYuWQvN2z602pz2GbPgDV
         cxMXfcOJZJcdV+83oUad6W3464Yr0dZQD/N4tjJVH9u/OfiZjLIJWX0Ibh/GN0yjZw2P
         h9/jY05NrPffyAHLp7Dx6myphoYgCpty/f3FzROQa8mCqnJwgKs2aldzcw7GGx92GKWj
         Xqwg==
X-Gm-Message-State: AOJu0YzB0XMxHMfpgai5ZcQRuLs4Md/f0XhFYTyFc+dprfKe5zvDSWiV
	/v3Nu5mhu41lOicAM6gBoFEXupxH9ymXffxC4B16AbgUt72cSykKI+Q1KGPFbsY4g4HwQmT9R4W
	p
X-Google-Smtp-Source: AGHT+IHmG+CIpQJOL1eOAU1mMo3rp+EDyWfC1D+PpAxX+YwHAEt1nNZRP5QwPUg9G/1IMuX30R9ESQ==
X-Received: by 2002:a17:902:c412:b0:1da:2bd6:a450 with SMTP id k18-20020a170902c41200b001da2bd6a450mr2170203plk.32.1707706534554;
        Sun, 11 Feb 2024 18:55:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFMcthFL4l/bTCJyUVKIFRBG6Uzr3J1H/8KTDyjhZF+VEX0+59ZHlo17zAIHsqjff6iEJHbL5ZnLE1y5qPIbZtcNiH5g1S2cNMGOkIIb1/slKb0HWnZF9jNLbDe4rF1SmjOZQImKvG
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id lb3-20020a170902fa4300b001d9af77893esm4906443plb.58.2024.02.11.18.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 18:55:34 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 4/7] riscv: Simplify text patching loops
Date: Sun, 11 Feb 2024 18:55:15 -0800
Message-ID: <20240212025529.1971876-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212025529.1971876-1-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_185535_704860_C4F78617 
X-CRM114-Status: GOOD (  10.05  )
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

This reduces the number of variables and makes the code easier to parse.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/patch.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index bccd9ed04a05..7f030b46eae5 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -155,7 +155,6 @@ NOKPROBE_SYMBOL(__patch_insn_write);
 
 static int patch_insn_set(void *addr, u8 c, size_t len)
 {
-	size_t patched = 0;
 	size_t size;
 	int ret = 0;
 
@@ -163,11 +162,12 @@ static int patch_insn_set(void *addr, u8 c, size_t len)
 	 * __patch_insn_set() can only work on 2 pages at a time so call it in a
 	 * loop with len <= 2 * PAGE_SIZE.
 	 */
-	while (patched < len && !ret) {
-		size = min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr + patched), len - patched);
-		ret = __patch_insn_set(addr + patched, c, size);
+	while (len && !ret) {
+		size = min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr), len);
+		ret = __patch_insn_set(addr, c, size);
 
-		patched += size;
+		addr += size;
+		len -= size;
 	}
 
 	return ret;
@@ -190,7 +190,6 @@ NOKPROBE_SYMBOL(patch_text_set_nosync);
 
 int patch_insn_write(void *addr, const void *insn, size_t len)
 {
-	size_t patched = 0;
 	size_t size;
 	int ret = 0;
 
@@ -198,11 +197,13 @@ int patch_insn_write(void *addr, const void *insn, size_t len)
 	 * Copy the instructions to the destination address, two pages at a time
 	 * because __patch_insn_write() can only handle len <= 2 * PAGE_SIZE.
 	 */
-	while (patched < len && !ret) {
-		size = min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr + patched), len - patched);
-		ret = __patch_insn_write(addr + patched, insn + patched, size);
+	while (len && !ret) {
+		size = min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr), len);
+		ret = __patch_insn_write(addr, insn, size);
 
-		patched += size;
+		addr += size;
+		insn += size;
+		len -= size;
 	}
 
 	return ret;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
