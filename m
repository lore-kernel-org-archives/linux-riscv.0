Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869C7C7EE2F
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q91OhDQkGu5c1cSfyNNr4+6As/oaOqpmy4usTUTe7EM=; b=4L3hDBY8oFgeFm
	pLM0LjC0HqqQSQaokpk5kK2A2oAJKAwCIpzeGhYklbJTdCZ2dz7huns+FQafC8Tp/K4MxWyk1r1P7
	9Mt8wQeisvHbp8JTkacxJ9BmF/bG3e/ZrTGcGihTV9asqQlODXFWyYcN2KIZLe/xhU6QiJ4R3bQfW
	Z9PmbC4v+TIdlotTR7f4wukRvvA/+1ZJ6lLWCjqxzv2tBgdVi8txdkxXbbHqpY0cV/t9BVSpTMfdE
	zf4D6jtL/pbnfGMBvCxgCmzq+qgKso8VmCzds2vLUPou44EDjBcP6yPlcC0Sa4hOahx2Px5xo6jYF
	kTuyllg4KbFkv0MLOe0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbuK-003JGE-IP; Fri, 24 Feb 2023 17:30:56 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVau5-00371t-A2
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 16:26:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id bo30so13936028wrb.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 08:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYNxCoy2kO8Df1US+5U8F6a2dVH3sUiqyDcA4T+cIdk=;
        b=En6Si0WFgSuFebHftBEO8bUQY7IXWNBN8xsTRVwkNrqnPGfu+D8r/lYQcuhdU8YUPP
         YgRH44w/1MWw8wEHfpe7mB7OWrRWbLHMGvuyPv/WSDum94YBwysEwpw552laUM2K8L0d
         +MDRijxrej0aeRLxf7Dpl5bA/cOZoff5DCrhZQxXe/4cSN1FUxqlpPAN+JRo7AirD5yI
         Ro09nnO6q3z/UwhLgl8D6zfK0a74bGu8FTaYZC7G2OENX6Np7Iq1jKSklpL/ttYjDV2C
         /oEpU0uEhBUEj0TwxlCeOsnYfqM6POjbCpx8+P+YDm4rVgAHYhcNYxyNh/U6nn8ZmT9F
         V3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYNxCoy2kO8Df1US+5U8F6a2dVH3sUiqyDcA4T+cIdk=;
        b=7gWDwiprw+2HBdTzLymDxesN46WHbMIOa573Y9k04koky8GVfJnVkFMrJHxuQ2EYlj
         Zsug4ft72hE3xEGwBRRaTffjMtGab6HGlVqnKkYSyD4PdgSjtST5DK0Uy7Qqix6sg8+7
         bXpUDkWe83ADYb85LXwnEEBww/z/Cb9Ecra++GDF8s+NHUrV0KdVVq4WRgCwt1u5P0wn
         pu7dxNmVfXGJzawOqZZhBrxL7gJFgOinlk4NcapyMcB8VHC0v6eN2Ami6wMmj5cwGy8v
         JhZRoOZbb58hud2d0bWIJt+3dbImfYuc2JpEA2CrfPEz8b3f2Depr57zh1L/rE+FzJ2M
         pl2A==
X-Gm-Message-State: AO0yUKVS0J2n/BYJg9BG7ArVAmxMFfMbaHL1QaFIEW85xLawczwMTqgK
	lGtzWHk1AOrxkezy1X8cDdhBWjYticU370Lq
X-Google-Smtp-Source: AK7set/GnWAY+QoOE4/JlyN7MAfKde64aupvlOHt32saZ6ryvyjf7Edvr9vRivLB3FGJ0yazaa1Mkw==
X-Received: by 2002:a5d:5512:0:b0:2c7:1210:feaa with SMTP id b18-20020a5d5512000000b002c71210feaamr5381917wrv.26.1677255993449;
        Fri, 24 Feb 2023 08:26:33 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d5350000000b002c53cc7504csm10368171wrv.78.2023.02.24.08.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 08:26:33 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Conor Dooley ' <conor.dooley@microchip.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Sudip Mukherjee ' <sudip.mukherjee@codethink.co.uk>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>
Subject: [PATCH v6 1/8] RISC-V: alternatives: Support patching multiple insns in assembly
Date: Fri, 24 Feb 2023 17:26:24 +0100
Message-Id: <20230224162631.405473-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224162631.405473-1-ajones@ventanamicro.com>
References: <20230224162631.405473-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_082637_354743_B3F9B582 
X-CRM114-Status: UNSURE (   8.05  )
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

As pointed out in commit d374a16539b1 ("RISC-V: fix compile error
from deduplicated __ALTERNATIVE_CFG_2"), we need quotes around
parameters passed to macros within macros to avoid spaces being
interpreted as separators. ALT_NEW_CONTENT was trying to handle
this by defining new_c has a vararg, but this isn't sufficient
for calling ALTERNATIVE() from assembly with multiple instructions
in the new/old sequences. Remove the vararg "hack" and use quotes.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/alternative-macros.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 993a44a8fdac..b8c55fb3ab2c 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -14,7 +14,7 @@
 	.4byte \patch_id
 .endm
 
-.macro ALT_NEW_CONTENT vendor_id, patch_id, enable = 1, new_c : vararg
+.macro ALT_NEW_CONTENT vendor_id, patch_id, enable = 1, new_c
 	.if \enable
 	.pushsection .alternative, "a"
 	ALT_ENTRY 886b, 888f, \vendor_id, \patch_id, 889f - 888f
@@ -41,13 +41,13 @@
 	\old_c
 	.option pop
 887 :
-	ALT_NEW_CONTENT \vendor_id, \patch_id, \enable, \new_c
+	ALT_NEW_CONTENT \vendor_id, \patch_id, \enable, "\new_c"
 .endm
 
 .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, patch_id_1, enable_1,	\
 				new_c_2, vendor_id_2, patch_id_2, enable_2
 	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \patch_id_1, \enable_1
-	ALT_NEW_CONTENT \vendor_id_2, \patch_id_2, \enable_2, \new_c_2
+	ALT_NEW_CONTENT \vendor_id_2, \patch_id_2, \enable_2, "\new_c_2"
 .endm
 
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
