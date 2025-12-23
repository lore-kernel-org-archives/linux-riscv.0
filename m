Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F39E6B26F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 02:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WCNNHgwRr3I2zvs8lWElEbnF7S2McslcODtrA45+Mqk=; b=2rdeor9KNMb91m
	TZUKGKVk/VqeQhuo/uRTw1NV5+Zc6yYfILCBPOMCJogsKi+6oaQ8++lVTALwRNEecgwT1mZWxR3Ki
	TmM0shWKQ02dwbeZvjiJpJmAvWYJWZmiMhKjXcFG577wLFm7QI7kk+Osdx9avUBRUsVI1TxPTHrWG
	yTRNjbF4vjSeUw205XH9Birt3YKe+pN3i2XoKt3V+2XTV1fCmrYF1qMjPvQgJHm9iiJAJGHMhBGqN
	QMzHQWrbzjZPVwu6YfViRl/SctfzPvAimFKvFR7CR16FCPKuS6ER0CtqkXqAX36o1H8tGrpBAemXW
	X58aSofI1CXAkjH/DJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsOH-0000000ERcQ-1WqB;
	Tue, 23 Dec 2025 02:44:49 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsOF-0000000ERc4-0fn5
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 02:44:48 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso4567057b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 18:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766457886; x=1767062686; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nUF/hoFyojyL16/BAIvBMBzPHtMZaCpOp9VnM7T1kwY=;
        b=RzCsOfVd1p59ZX+eTim5ZRMcsqr5izyfRiMG6TNHXZQe+5/DMhXzCxFsgwFWCLatdz
         wrojbCN8nY6PG4q8GEOzh7c2ZptZ3o9OjIu7/P92BUaoevzIylM+8a8LDbFbMLpjxMu5
         MgljGPpYjo0VmgHE/RpbolYZX4JkRC1VVW0bF+kJcBW5bOO/ETWliriNRoZo0UlGHUOQ
         beoAvldpaolSRlG/FmkZv6FtA9Im6HopCduJyaS67bk32/lgP7qgTusVuMdCqD/a9dHU
         ovO2wwa5+XjGv/S5lH6ueSdn8UJA5P6rtmHfMdPJO1zCGnC8eQLMfEevbjisZoJwfFHv
         ewUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766457886; x=1767062686;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUF/hoFyojyL16/BAIvBMBzPHtMZaCpOp9VnM7T1kwY=;
        b=rRKMzHfTI9dcjqOHCKSJ97sL0zGyft0t/kaZSvgvBkX2q2SCG6+dm7Akd25mZX6ent
         d4LN+wHoWR0T2qpuTZdUCh77iHtidO5IWtNYH/mRh9Hf7vcLuhbbkksUdhn+hx6AaY9t
         efcU0/c0Yhpf5jmBe3V9yeGNQuHyJ0XrJ2qxsPNFUNF7gE1b80IYhBt/nTVupBT42IRG
         pUw55wkhY5UpwuI2K0btI4VaTz7R8RFYwaPTkTgKbA3kAGazlemPR83ZvIjEaVOq/KpT
         ElTxlnTcFPw6nlYXtQe6uIHKLKjvM8zZX0hvvSjYf+xfA1bJzvGhA3s3AfX4IGFvXnrK
         hUyg==
X-Forwarded-Encrypted: i=1; AJvYcCWilvkSHsxcghZK8UxlZfN3cG91Z/Kl5yGnpg7aXPipenoDt4LWxAybq0YdpaHA+sZAXXJTcO0ykad/0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxEmYoF9VxotGXRmFcoebst90UjCMBKYH3dAe/08QRqs7NcrJs
	D4Uvr1RpUVOUuDkzmqYnoaM7HC52EZ8sB7725km/aBHNUknp9j1BHIAD5/lrlyjF940=
X-Gm-Gg: AY/fxX4kE1To1o3siZdYx+ozc08RIORzjUkVF8LxEnll4k5Ey+oSo6XjpaVugW8trRe
	Wfu2IkO86a4FQHPvMIL/NML99n5mVOQV2FkhoTarOHxuf2DKPDuJWV4wa07AkBE90SqESRQ8aKL
	pDRYhx0TsxubJQzpZcMmkUxDh+0HiNXPbbmfm6aQehCM7f0d/3YZDiKUllokuNWaSSZT8szB20v
	O9bHkIioUgkZXGAyqIg5RKCms9uqMFEZ0MLnCZq7W3hNxGQFI/u4lT1bptSQlaXtqH2dcmsrtFi
	1dyFRROJBrC6ak2u9gnEYmCeOCOwQHBiLaNauM3Jut1rl1YX0+iy52bXKZRf9I9DkafJUjSR+Q7
	b9JEwEtOR6E+R/c041KQFzVk8nuuNVZHdlCDXA1MP9SRThoePyf+a3eKRav5OTyJJ/NL19NYIOF
	hyOrQmx4qlhV8K114B6cZ2Ud+KBdHeoQI=
X-Google-Smtp-Source: AGHT+IFPJvIYUmiOO2w7I3dtZwVUs0BwDcfnBNjmLePOXNfxB9CP88VzU8dMVUem1SKKIF7IePNpYw==
X-Received: by 2002:a05:6a00:4219:b0:7f1:4c9c:782a with SMTP id d2e1a72fcca58-7ff648ee056mr11439556b3a.26.1766457886201;
        Mon, 22 Dec 2025 18:44:46 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cc1csm11789387b3a.65.2025.12.22.18.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 18:44:45 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 23 Dec 2025 10:44:27 +0800
Subject: [PATCH] riscv: cpufeature: Fix Zk bundled extension missing Zknh
MIME-Version: 1.0
Message-Id: <20251223-zk-missing-zknh-v1-1-b627c990ee1a@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAAoCSmkC/x2MSQqAMAwAv1JyNqBxA78iHsSmNYhVGhBR+neLt
 5nDzAvKUVhhMC9EvkTlCFmqwsCyzsEzis0OVFJbEdX4bLiLqgSfMaxIHTnHtu8bS5CrM7KT+z+
 OU0ofaJcxvWEAAAA=
X-Change-ID: 20251223-zk-missing-zknh-262ffed774d2
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_184447_468407_A6E5AC79 
X-CRM114-Status: UNSURE (   9.12  )
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

The Zk extension is a bundle consisting of Zkn, Zkr, and Zkt. The Zkn
extension itself is a bundle consisting of Zbkb, Zbkc, Zbkx, Zknd, Zkne,
and Zknh.

The current implementation of riscv_zk_bundled_exts manually listed
the dependencies but missed RISCV_ISA_EXT_ZKNH.

Fix this by introducing a RISCV_ISA_EXT_ZKN macro that lists the Zkn
components and using it in both riscv_zk_bundled_exts and
riscv_zkn_bundled_exts.

This adds the missing Zknh extension to Zk and reduces code duplication.

Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
Link: https://patch.msgid.link/20231114141256.126749-4-cleger@rivosinc.com/
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/kernel/cpufeature.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b057362f8fb5f92d9a608b223666831d769a805c..f5855af0453d5ce206f8c8201ad108dfe4d300fb 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -279,23 +279,22 @@ static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZALRSC,
 };
 
+#define RISCV_ISA_EXT_ZKN	\
+	RISCV_ISA_EXT_ZBKB,	\
+	RISCV_ISA_EXT_ZBKC,	\
+	RISCV_ISA_EXT_ZBKX,	\
+	RISCV_ISA_EXT_ZKND,	\
+	RISCV_ISA_EXT_ZKNE,	\
+	RISCV_ISA_EXT_ZKNH
+
 static const unsigned int riscv_zk_bundled_exts[] = {
-	RISCV_ISA_EXT_ZBKB,
-	RISCV_ISA_EXT_ZBKC,
-	RISCV_ISA_EXT_ZBKX,
-	RISCV_ISA_EXT_ZKND,
-	RISCV_ISA_EXT_ZKNE,
+	RISCV_ISA_EXT_ZKN,
 	RISCV_ISA_EXT_ZKR,
-	RISCV_ISA_EXT_ZKT,
+	RISCV_ISA_EXT_ZKT
 };
 
 static const unsigned int riscv_zkn_bundled_exts[] = {
-	RISCV_ISA_EXT_ZBKB,
-	RISCV_ISA_EXT_ZBKC,
-	RISCV_ISA_EXT_ZBKX,
-	RISCV_ISA_EXT_ZKND,
-	RISCV_ISA_EXT_ZKNE,
-	RISCV_ISA_EXT_ZKNH,
+	RISCV_ISA_EXT_ZKN
 };
 
 static const unsigned int riscv_zks_bundled_exts[] = {

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-zk-missing-zknh-262ffed774d2

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
