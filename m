Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57131C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 22:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oDv2/BX4oqX4INBGb3VMMloayXUdeaEZOtnwwsaazks=; b=tEq0ricI7R6jxi
	SgmIGd25/A03NYwmoP24XjrU3lP5mAL9PotsrbJ50MUi/Rfn7EEgM8tXMwknXz6YudDL0+MU6o9FM
	5AOYOasxXmRy7FXbKoNeV9MwgMAToOHPjkrm4YomE6FLosMLGT7TFV36lmKJfHDfLczO+uXGaxBYS
	lxw1l7enj85BoM1h8xqQiQoMYnWrpWZno0YNyA8FhGnomNuH5psmLLMAj7jFVFenhSjK/yuksXrry
	QfQQdVmQkcoZrRS7RjrdNNDC/wtyO7jXWA44dG7GeFFKh1CzOLrcGG+4AhhVINeEU2mkwKtF3xrh8
	ThOfq5s67wssRvdpgXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQb0J-0040Kf-08;
	Thu, 18 Jan 2024 22:36:55 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQb0E-0040KJ-0B
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 22:36:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6db82a57c50so181160b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 14:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705617407; x=1706222207; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=22psKGJ5/XvThdwDSK02VziHgNEv3yYHumxnTIri9Ik=;
        b=upBYym7JDZ3nWZYSmkVjyyaqGsMwinWUti8FcG2F7nRnV9w2ZifgEpPrAnD2fSB5Pm
         sjU0POget8K0puuJjOwmIjaMWp8070Idw8X6x9qj1XJ10l8E+tE6Wvh/5B/JVtaaAJg9
         UCMQriOlH3Qa6cNNcsmom70XNjwukQJcAR88hqoitYq/QvW2cAOKNcUma7VMF3T/4w4S
         iksfJcS0rD0cz7DagT9UV6pVDknucH8r2DsF7G7aTzjWECP8FBeR24d+bM0+biYpFkKO
         N3MsPMeqeOeg1W8GAw4N5mntqwSL7hb1Xnrz2UYvmM57kJ0bd9Njrj8WRZIeC5hLcTUt
         hfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705617407; x=1706222207;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22psKGJ5/XvThdwDSK02VziHgNEv3yYHumxnTIri9Ik=;
        b=ePGizmRfG9CKUQLUq4exT4VO7NzNPEyWuE1+yQ1ta7mbS2ahpAIcqu0Qa9S6IlJQuD
         RCIHmfOZj7rY4OJUPS39ewj4oEL66j11dPaWJKtes1nW7FlBLOiKefPI7uuf4x52WVrm
         E5VuAXK9mp4GlSV3aQx84PnI5WaVZDJVnV7AETK24YLUQbH4xlZUBZVudslf5Ahu630G
         83+GL7yWBgO/4kCOphnpc5dyzp7XFJJ/7X27f/+atwpOH1jAPJQqJlwwUXRl/82cZI1S
         BuJngz2mHrdNVtOfUB4hHqBTjOgXrjBVLKd/Ag7zrFAySzVYiF5Snv4JQ9//JiwRFYGi
         F1wQ==
X-Gm-Message-State: AOJu0Ywd01U9rWGm023WVFtAIl7oMyXBPWIJCxiZu4FiOEbc/+0xbuid
	XSVi1XiX5y/Eb5k+y00VN1RWzRwvtySEA6BA9jxujKJ0jOfUlcvXpqmYmhpm5pw=
X-Google-Smtp-Source: AGHT+IGa1v+KN/+ULl0Ii7BDD3/Y6hqg1cXKT1geyyY5xoILJoNQPTvRCCfXRozpmgxLg+KkQanQZQ==
X-Received: by 2002:a05:6a00:2308:b0:6db:9684:defe with SMTP id h8-20020a056a00230800b006db9684defemr1482192pfh.8.1705617406785;
        Thu, 18 Jan 2024 14:36:46 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t34-20020a056a0013a200b006da13bc46c0sm3904979pfg.171.2024.01.18.14.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 14:36:46 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 18 Jan 2024 14:36:45 -0800
Subject: [PATCH v2] riscv: lib: Check if output in asm goto supported
MIME-Version: 1.0
Message-Id: <20240118-csum_remove_output_operands_asm_goto-v2-1-5d1b73cf93d4@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAPynqWUC/5XNQQ6DIBCF4asY1qURQmrtqvcwhihOdRYwhkHSx
 nj3Um/Q5f8W79sFQ0Rg8ah2ESEjI4US+lIJtwxhBolTaaFrbWql7tLx5m0ETxksbWndkqUV4hA
 mtgN7O1MiadpWa6eMctCIcrVGeOH7ZLq+9IKcKH5ONavf+ieQlVTSNO7W6HFsJzM+I2ZiDO7qy
 Iv+OI4vzXL07tsAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705617405; l=1498;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Ewf2ArCyVhqQECvgVJiy2phXnKTeR3STay2OCvwENw0=;
 b=8j8Lc3kU83hQIjeeCFyK7o9YgcEczbHdmRGsbhtSGH1IrtSy/F8ki8oeXrvzdncHyn2Ia3Ld9
 x+nDNC7CGyfBtpWARLnVleMssPBiXVhl4azmSkd8VdXYfkkMD2pn8pt
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_143650_277404_10ED7C80 
X-CRM114-Status: UNSURE (   9.02  )
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

The output field of an asm goto statement is not supported by all
compilers. If it is not supported, fallback to the non-optimized code.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: a04c192eabfb ("riscv: Add checksum library")
---
The OutputOperands field for asm goto statements is only supported
starting from GCC 11. Split the asm goto to remove the use of this
feature.
---
Changes in v2:
- Use CC_HAS_ASM_GOTO_TIED_OUTPUT
- Link to v1: https://lore.kernel.org/r/20240118-csum_remove_output_operands_asm_goto-v1-1-47c672bb9d4b@rivosinc.com
---
 arch/riscv/lib/csum.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 06ce8e7250d9..af3df5274ccb 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -156,6 +156,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 	end = (const unsigned long *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
+#ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT
 	/*
 	 * Zbb support saves 6 instructions, so not worth checking without
 	 * alternatives if supported
@@ -214,6 +215,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 		return csum >> 16;
 	}
 no_zbb:
+#endif /* CC_HAS_ASM_GOTO_TIED_OUTPUT */
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
 	csum >>= 32;

---
base-commit: 080c4324fa5e81ff3780206a138223abfb57a68e
change-id: 20240118-csum_remove_output_operands_asm_goto-49922c141ce7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
