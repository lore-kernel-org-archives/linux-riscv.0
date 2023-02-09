Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89510C636D6
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tV5pfBtOskjEvdvPMI4XkXQnboca0BHsG4UJmG2zWuM=; b=ro/YwdSiTAUhyf
	L+4udddnCip3t/vczdurS+HH3gB7ljETp/H7RqVXIegBV1MdZJ0+A8Y40twjMjtj4iXbT2sh5k7VC
	EVW+OQRCyHdboCiuuzlh6bx5HNLiDcFJhehySVu1iSevfjThiBdPvt+JY4ta5sJ5OBxzMJYIVggl+
	a8kQC3jDfEJPIFnBKTRsGQj/Aj0SzoZm9WaevB0ZGaqb7sYs94nwQ1x/rIoYOKEgJ3c48BqiIIOn4
	LadSwA5Yjqubc7bwTAh7rG3tlnIGjKFr0ycCNmk0xdrxc3CxolzzBl2HY6Lh4ak9ODnHb67bqAbFX
	z5FJykZInxmR7Zj9CgHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8oq-002Cdr-Rp; Thu, 09 Feb 2023 15:26:40 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ8oo-002CZ5-Ec
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 15:26:39 +0000
Received: by mail-ej1-x62c.google.com with SMTP id p26so7347803ejx.13
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 07:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPEogwNPGzb9EX437UPsSVPibcKNUNGdrZDqrYRtR30=;
        b=b3sCue6n3RjE4xqJgkD8qN0AkCyEMJ0emnA4KWOHkceg0c7oQlYBKxB7Uo7VnTO3MW
         cInYWY4opfY5bPb+nTa1VuySJS6bOTeuEE1jbujvb6MU3yj0QPoTYK1369WJGGbOPDlE
         vZbDrXc8B42YIUIOXlKMgxkVlYtaPiw8CDMMR5mCh+YL5kcWBTladvqMEVbdUIhCQk70
         AlvQJ7wH0haSh2Dw7iEqPc4XlDMj6CN+BnL7+r4Uj91pcZOfKvEJRwL+ak9PxD0aIYL4
         7p7ZTAbFn1MH9xdtxvSqT8NPZdNa9uXsuXyqFZD2OM3y9kSMeejD4iEVOLT71BGHIEHw
         IVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPEogwNPGzb9EX437UPsSVPibcKNUNGdrZDqrYRtR30=;
        b=bPT+5N1fVxGEaWKDNs+5ibjsOR+Ez5dQm9OO2uyvvP2BxBIdeAERsD8+ME8lNEKOVk
         3NO3XB/KVBXJjXlep98esaf/gbA655JBzxYBTQirklUoJApSY23n0+lQwjGAulCid2Xk
         r3/eA9x6BXgLGcGfSDdqcGFSFpmszfIcWuywp6VIWs4qNaA6U3XQFLKdch/w1gqz8h4m
         1TeHElwfighoCqkI8GhP/qslvFSsASKQYWf4VHTO31r5ZCW+18K6pEDTqDm1ng7fT219
         sxoe32Y07LZDOP9sHbFtrozBERwKbaPy1y08tNfzt8BtvefYt9EnG3Tsy0U+bmXpZ0Ri
         PdYQ==
X-Gm-Message-State: AO0yUKXWTBSHFf76PsBL7mSmDp/aLiUlOAuw+cMBRuctYMjiDJajOsLZ
	x+NBUT/77Es20MA2nVtbBBw8Gfkge5OU2/uR
X-Google-Smtp-Source: AK7set+hdCra0whyCsMluYeqc8tO2CxHPuvkqNX0x30WRYplOKw+jW6GPyEK/mp5aPgrGqkjjDDXFg==
X-Received: by 2002:a17:906:fa18:b0:878:54e3:e3e1 with SMTP id lo24-20020a170906fa1800b0087854e3e3e1mr12568946ejb.73.1675956392240;
        Thu, 09 Feb 2023 07:26:32 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906075700b008ab84430157sm980266ejb.200.2023.02.09.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:26:31 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: [PATCH v4 1/8] RISC-V: alternatives: Support patching multiple insns in assembly
Date: Thu,  9 Feb 2023 16:26:21 +0100
Message-Id: <20230209152628.129914-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209152628.129914-1-ajones@ventanamicro.com>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_072638_587629_D35E699F 
X-CRM114-Status: UNSURE (   8.47  )
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
---
 arch/riscv/include/asm/alternative-macros.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 51c6867e02f3..7bc52f33f95f 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -14,7 +14,7 @@
 	.4byte \errata_id
 .endm
 
-.macro ALT_NEW_CONTENT vendor_id, errata_id, enable = 1, new_c : vararg
+.macro ALT_NEW_CONTENT vendor_id, errata_id, enable = 1, new_c
 	.if \enable
 	.pushsection .alternative, "a"
 	ALT_ENTRY 886b, 888f, \vendor_id, \errata_id, 889f - 888f
@@ -41,13 +41,13 @@
 	\old_c
 	.option pop
 887 :
-	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
+	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, "\new_c"
 .endm
 
 .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
 				new_c_2, vendor_id_2, errata_id_2, enable_2
 	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1
-	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
+	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, "\new_c_2"
 .endm
 
 #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
