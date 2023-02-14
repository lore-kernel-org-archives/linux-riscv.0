Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ACDC61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 20:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rI+Z11Li9918nPYIHVVAknCBF7DgAsb088nDMlsjZJ4=; b=sVCvZt0BOeqB8t
	pJTOzdliCTvLtiOqbbHjqxP8nDnlqYPy5ayxOI42WtSGboKni+HELbMjrlE6pcFNTKBeRSnJgQpHx
	13t8oqqskXxDTgsWhydBj/KCXx8ymxQBV7KE3sgrJh8J3H/JEwErxV3Slv7CV9IMTqZcE5yfa200y
	6Vx5CozCRdqn5xDp1bEpAZJ8PnlNG2PiPnIQQJS9QhNIUKGRjIHppISCAFmj7jCEuwN1tbNAQ9sD5
	9be3WCTOalSUa84Y3l8PrW3uq4N2T1W3le8X56wwQdJOImzWg9ygwQIWoXjhM0Weh6hhAzPQAlOdJ
	Y4KiJqX6W43HCLTMehTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS1gy-003Mp0-CR; Tue, 14 Feb 2023 20:14:20 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS1gv-003MoP-FR
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 20:14:19 +0000
Received: by mail-pj1-x1033.google.com with SMTP id mg23so9623225pjb.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 12:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=gWWQU2joSfJ+7DAhbchsiZA38tjaGItXSOgX+bKpGCs=;
        b=EK0m9I2acoVSAJfB8r/z5xfKSFfMkQoE/mDldXZhkB7LhQBYF3TXrrw0OBym8MAt7V
         JapJDbGhhmut/R9FNJ4o+XZhZmHqJr1jViue1T9DpIH5dWvCewLMuKDaYLg4ovwVgJ7+
         2UAes32P5KYC7oBBWk2Zc0eqdGhu27regW0Nwrg/EB17K7+7DeZXpJQmo0OhSwC405dR
         CUOToqI8mPgBWg+vc7JBy6WUdahJwjI8cVagEqmPUTH5huxQBjATz14ZJvxUKQIqQIwy
         K2hCQFgC0n7+mABXAdzNciCvSCAfn+HULWCOFYS3yZ1INRPyKiIo2MlEWxIuriThwGWL
         opGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWWQU2joSfJ+7DAhbchsiZA38tjaGItXSOgX+bKpGCs=;
        b=GBHi36NuZ56dsx4Eypod+GOxYL5jW/SASCKlviDd1FN1ywxG/rNzRrY5vj0ubgZaut
         MPmZbtwFzf6huAz+ILIBY0wTrJQ5+4xY/PMn8ddtZp7nVg8AXISUru3wZtHISZK1QYIv
         SCE0Abc+p3ilGMNrv4G8SKnRFLY50JrGGnsnPLVo8V5FKlGY6NA0YgAg83nOYmg9l2Ix
         8hkkAzo1gxTKazqxn2u36bAZx/Lm32s0XiP+bSPG1a/DEaWMukE79Nc7iqUFM36NeV5v
         z65pHgYFS7FIzuzt99Yb23IeJX+dZoeZxu25WtjH/3bCbKBRI6uBqR5MzWgYul229Ie7
         4fng==
X-Gm-Message-State: AO0yUKVLZN9lKF1S4ajmEgFKM6VRks3hc+b1e3XjCificIEKQcwQH5Sk
	cxKopnXmVTfFN525kCKGN4+nlMys8e+J8Ru5
X-Google-Smtp-Source: AK7set99M+cO/J769Jf9e8CztjK1rNO/zRsh02uGghmzOH0wCxSmAiJCx/vs4TPOB9sZY5kkAD8fYg==
X-Received: by 2002:a17:903:120c:b0:192:90e7:41d5 with SMTP id l12-20020a170903120c00b0019290e741d5mr4046441plh.52.1676405653949;
        Tue, 14 Feb 2023 12:14:13 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id iy1-20020a170903130100b0019a9436d2a0sm5666211plb.89.2023.02.14.12.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 12:14:13 -0800 (PST)
Subject: [PATCH] RISC-V: Guard alternative asm macros with !LINKER_SCRIPT
Date: Tue, 14 Feb 2023 12:13:58 -0800
Message-Id: <20230214201358.10647-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_121417_751869_60373DF2 
X-CRM114-Status: UNSURE (   8.95  )
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

Without this I get a handful of .macro related directives that trip up
LD.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I'm not sure when this started failing, but I recently tried a build on
my local machine (with crossdev-based toolchains) and it failed.
---
 arch/riscv/include/asm/alternative-macros.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index cc6a81c00f2f..afc87528cf71 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -6,6 +6,8 @@
 
 #ifdef __ASSEMBLY__
 
+#ifndef LINKER_SCRIPT
+
 .macro ALT_ENTRY oldptr newptr vendor_id errata_id new_len
 	.4byte \oldptr - .
 	.4byte \newptr - .
@@ -53,6 +55,8 @@
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
 #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
 
+#endif /* LINKER_SCRIPT */
+
 #else /* !__ASSEMBLY__ */
 
 #include <asm/asm.h>
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
