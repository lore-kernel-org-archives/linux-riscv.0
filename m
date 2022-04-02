Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C83BC43217
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 05:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmxlJ5I2AZTfybRI7T0XAvdsrpfzE58uYgCxBSCfy78=; b=KZVugrcedRCFYC
	92HACLOp/9H4cIdP490sPfA9V6NtJv30Wq9A+8khjLCohcFVoBAzIxRdSStbOVM3fVeL9iuTGSPDk
	8xBnu94DW7FbN7ZS50OzUh975l2435fokK18XES/FvsiWX9+oX5lLe+1izTYmpvNl5UajiO1AqtTo
	l9EFFO/aCkD5svY5kQDxcyAwbgm8Gg6XWNSK6VQMHOiP3k0KDrJv+4kaR/LtA1ZX0RJoywIfJiKFq
	TXguzu0DhPrUhNT7RtmVEQL8EXzkwQ9h03IFUe66J0HbgEIEEHEWWXt9IF5t1VX+DDfbfMQEwuTPr
	51jmfYnX9EPaIIe1xgJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naVve-007zg8-JE; Sat, 02 Apr 2022 05:04:02 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naVvY-007zc3-9G
 for linux-riscv@lists.infradead.org; Sat, 02 Apr 2022 05:03:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id j13so4092564plj.8
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 22:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=2KqF8ajkBngCMtpzPUC01p5VZ7+wZvwkah/zYpqeQ7Y=;
 b=jsNsMmae2jOLgaWCtQBOMysvxCiEvJeN3Kqt2gLkzFoNtfya5LhsAFrcOn9mTRKUcG
 7QHMl6wtxR1gnHlglQxBLt59F4AVLKRlMsZXCyVK5Sqcf3OMz6RQ2TGbK0mU6MlyYoev
 qjwn8G+g3hs/D9dXJRYm6BZkCmYzmOECRwYyleE6fMaT6Pb1qffhQ/+N5uqS2PbXGTiY
 mEjFsG7rEFduksDbrHWg+H7a2SN/GVY0BoSw4i/0+acplxKV91bS0Gz8IkzFosonzMrK
 WojUMu7DAuiMnRFCaIbsCGNHuWkfaflcR9DTjju4nB3z2/zXOe2x8DwklNo5aMaL1HvC
 Xx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=2KqF8ajkBngCMtpzPUC01p5VZ7+wZvwkah/zYpqeQ7Y=;
 b=C7M2CaxyM7NYs8IngbutuY4eCFL7KkwjE9yA145GvriV1CFLpeCHGwUhYj2cNeEXhM
 /G0MunRTNAb+z5Z1Lbw36xktBF+BFYZzazNszYIxE/4lQrB8jL1emxWo+VDFcHh7hSoQ
 urvOhUiVS8hrdJZCRXZiE45GGnbKMMSGvv6CVw57mMvfN3Z9qlWp1gWi+4s9zKTswKWQ
 QnTo9Uz62zi8anO9XDBghXzzBf65POk5hQ0ZOiyUi7Ig0YOe2eLXCZElgy7ap37iyssU
 f30abvY7UcbOK52QESNtBxiwRcxy1fXKzZNapXpHIRxw8hvyD+NuswTo89yVeV0I6CFU
 yCKw==
X-Gm-Message-State: AOAM533eS8T26ITKs/ZBs1Dri/0P8jru1iOfLlBh8x0gYd8k/ci7Keyh
 3CUhshq9LbuDv+rnv/RompQGiw==
X-Google-Smtp-Source: ABdhPJwdkaakkxQ/XfHz+Vtz6Vw/XxCDC2112+bF4XSWnK3bNFCY8bZJf6lZ74ZtFui8xscFnZBM4g==
X-Received: by 2002:a17:90b:1bca:b0:1c9:b76f:8d76 with SMTP id
 oa10-20020a17090b1bca00b001c9b76f8d76mr15609934pjb.46.1648875834815; 
 Fri, 01 Apr 2022 22:03:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 p3-20020a056a000b4300b004faee36ea56sm4750517pfo.155.2022.04.01.22.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 22:03:54 -0700 (PDT)
Subject: [PATCH v1 2/6] RISC-V: Match GCC's semantics for multiple -march
 instances
Date: Fri,  1 Apr 2022 22:00:37 -0700
Message-Id: <20220402050041.21302-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220402050041.21302-1-palmer@rivosinc.com>
References: <20220402050041.21302-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 linux-riscv@lists.infradead.org, mkl@pengutronix.de, aurelien@aurel32.net,
 Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_220356_358999_D27FE2FE 
X-CRM114-Status: GOOD (  11.94  )
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

GCC's semantics for "-march=X -march=Y" are that Y entirely overrides X,
but sparse takes the union of these two ISA strings.  This fixes the
behavior by setting, instead of oring, the flags whenever a base ISA is
encountered.  RISC-V ISA strings can only have a single base ISA, it's
not like x86 where the 64-bit ISA is an extension of the 32-bit ISA.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target-riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-riscv.c b/target-riscv.c
index f5cc6cc3..494c08db 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -56,7 +56,7 @@ static void parse_march_riscv(const char *arg)
 		size_t len = strlen(pat);
 
 		if (!strncmp(arg, pat, len)) {
-			riscv_flags |= basic_sets[i].flags;
+			riscv_flags = basic_sets[i].flags;
 			arg += len;
 			goto ext;
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
