Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099AAC00A5A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 05:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0D7bi2rTLbneoXThAVXXihWuvb/79KU7yhsK5Vu9lTo=; b=ENE0YFSK+9+oTa
	Jz3ggFic7kZ5ASB63HBmESIV+esc7FNObWJSLGcx8HD5UaD49SCFMkZ3iJhyRh2KW0nBadhZhmAeI
	dTy5dtWLBRPw+BOhOh9iRjPBWMn1Ijon/8cpNXWMphIl1wMbfXXtsZGYYJhpqVCRj8RLOJAGqZMP7
	Q922fLzvVFCiXztPYyyirSqGGw5kih57HGZaxWm5DNcA1QAEIRDXMqAzwXRYYeilVjYPW7qmVSU0S
	cQ6Eob0H9cps73RNzi6suUjkGqkkaEgWBdI1u5+80q5Ml+JWWjUjsl74YPrf1LDtq2/dejNg00ZbJ
	qkPZ3UdyMq4hedGDRijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINRs-003fXC-1O; Thu, 19 Jan 2023 05:26:52 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pINRo-003fVS-UA
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 05:26:50 +0000
Received: by mail-qt1-x836.google.com with SMTP id j9so807689qtv.4
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 21:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tC4jG2P7TxWk2xJp/iiDtds8NtE5bfDPvvXdGd6AAck=;
        b=NAGaDdwxyXQU9vq7ltkCPRl1iGhpgYu/A2RgiYg6jwn1rEsUpWIb+1C7cEqotNB2dH
         3kC8jzOXysoav7zP3YE+69BlP0NgLv69Ow30Q+l7FRS9H0JFopH80KG7yEsMmkLITON7
         Y+av8jnv+G3M/d4rtXltAvKRf3LFLxiuTupvkvziaZOtddRCie0OdfyAdB0NEVdqNvkc
         B4svO4SegF0tP6xvxalxDC36jb8wGnEZMWfdoh7p1vGi0Fz5ArhGhu3OlkMBx3DfVbPA
         SxClmoaOnUNIkPS225ElDLrxWGLxfvvO89R39rK3hUtMTLno7NgOTRuAK5UH726aT6zv
         R6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tC4jG2P7TxWk2xJp/iiDtds8NtE5bfDPvvXdGd6AAck=;
        b=znMu5vXhhohctOANubga/evh7yO5u1Cv7kzh+tOqnATfm3EWypSv0TEryPYF/rHEhz
         43jWM2wEIfYLkKdDLmE5auJR0eZMLK/1LzeqL4oiC40NKEEOYz3zUTBNSh7MTPSmtIH3
         V6L8iWWY1Bhh5CJTB6nu8Bjz4QvosS4d4Hb/irqdObgPVGemu9AGWVc4+gUKEyRFqhqd
         +bqorhU6VbcW5NXQ2XN/o44FBcs5RYnbpg+VKIn3WDtewRwW67AM/hUfcqgWuLAAvJbf
         j60a13chnKDERZkmgGOlkA7Mq//TGKr8HrlftK/KA1NC0dUO2iRZAsVp/LM0QdT5E6M3
         zrRw==
X-Gm-Message-State: AFqh2kobhnJrqcjY5E+7ZHub0ABJSirw4Z5hvSv4Ub8MctJakJeoB2CN
	Bv+YdtkINM+2LuIXbPCppyoXBmvOv4sFMA==
X-Google-Smtp-Source: AMrXdXtbA85An2UlTdL2XzbhfLYOvcD87z0EDVwbQ4RYCtnVmmT6y5CqsNyrZiS3va0/p+EQApDNig==
X-Received: by 2002:ac8:5ed2:0:b0:3b6:313a:f461 with SMTP id s18-20020ac85ed2000000b003b6313af461mr12124149qtx.65.1674106005334;
        Wed, 18 Jan 2023 21:26:45 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id v21-20020ac87295000000b003a5430ee366sm507330qto.60.2023.01.18.21.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 21:26:45 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>,
	Yimin Gu <ustcymgu@gmail.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v1 1/2] riscv: Kconfig: Allow RV32 to build with no MMU
Date: Thu, 19 Jan 2023 00:26:41 -0500
Message-Id: <20230119052642.1112171-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
References: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_212648_995983_19D971DA 
X-CRM114-Status: GOOD (  10.40  )
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

From: Yimin Gu <ustcymgu@gmail.com>

Some RISC-V 32bit ores do not have an MMU, and the kernel should be
able to build for them. This patch enables the RV32 to be built with
no MMU support.

Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
CC: Jesse Taube <Mr.Bossman075@gmail.com>
Tested-By: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/riscv/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 59d18881f35b..49759dbe6a8f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -163,8 +163,8 @@ config MMU
 
 config PAGE_OFFSET
 	hex
-	default 0xC0000000 if 32BIT
-	default 0x80000000 if 64BIT && !MMU
+	default 0xC0000000 if 32BIT && MMU
+	default 0x80000000 if !MMU
 	default 0xff60000000000000 if 64BIT
 
 config KASAN_SHADOW_OFFSET
@@ -262,7 +262,6 @@ config ARCH_RV32I
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
-	select MMU
 
 config ARCH_RV64I
 	bool "RV64I"
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
