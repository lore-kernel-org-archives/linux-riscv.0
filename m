Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8C4C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6KVolI6UQCpIBOyMB+78Azm19au2xAY2lHqw6XEGSI=; b=su9oXg4QBXsK3k
	QTkkZhQf4XZCaOJvJV3/P0hU/17qdZkMG6yfKFjVDVt3AqUm0Jx2e3TegC+fEZKLfECVNMTT9y6++
	ng6Vl4J5XTVZIlkXfrG4FNTiyJ9z9PhP6ZwPxfbUx+MYDJkBgTnvJOVXzjURA0rIX6FjUtngpVOMa
	5XmKk0m+1qtywlIwN94n8egfqt9czQUErSD4u12L07fyGTjkorOdCuLFsP5hRqxU0+WkIBxQHrg6m
	gv4PjrFAzUzl+gooYZfq6SWy1F7itWg2Tmj632Vs15Br1QPBtbOycdD5a4qmG7/59Nblu/zMpJyHj
	dfIpXRQ0IbHWWwnxT3Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026X-009X5V-AT; Tue, 29 Nov 2022 15:01:01 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026U-009X3K-I2
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 15:00:59 +0000
Received: by mail-ed1-x52a.google.com with SMTP id e13so20136360edj.7
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 07:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZMgtPJyknCU4P1laaEEgl8wws7dZ3Vt3VftbenAHZw=;
        b=gUhNYIl5KiKZ+8Gc8bVYxCS9he8wLeijh3GI5x29qaSIzDOO3tbQBd4L+VgMOwDPfA
         szPXUpAdGNkuXyzCdgQycgYThAvfwPBvp+OL1euQA8H3H8W/6TDpS3SQVQg45gfMO2+N
         Bm1U8mJme0xyZw4oEDm0lEOPcH7xeqvUwnvq+ANg8dyVFOdowcKlCl9I7fehGO7nFlvp
         zL7jFj8kh9xBaPsgXw0/l8zpvd7kSjnh1tfZAODBRSUtASzJr2Uh1Z29Pa+scuwcbC5s
         baTjyb5DrcSc3kwjLgfCP6MKUjD5UInEk4mJFuJZzhlSm3u5Q37mfFURimA23cT2aw2q
         v3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZMgtPJyknCU4P1laaEEgl8wws7dZ3Vt3VftbenAHZw=;
        b=n9lLpAiVD3CPicYKGHxZYaDRlrPzKSeAbngWFuGazXEw2mcF2IUIadvJyIpltx6rzM
         m1mXKSaAb9f/XY6HXVzDr23Y4XkLZACB7bJ2axQmQQMayZW7bulwBqThM8jp5pPeF1fK
         lSTNM31cBu51nJlM3S0BkZZEmNJIcRmaYaogZT+A8ir/9YmRI4I5rUPpqh5NQEg46xGX
         3gAFCRY3ADHb7BUueVtnULFW+jBEuHOY76ACW3GVHMnQsw04Jap9yfWgT811IalqYKUq
         hJeJuIqgUzpiXvseDLaWxAjSzPReT9Vvcg3UJb/HZVbrXOoV0qimwkfeHEguLXNzev0X
         AGLQ==
X-Gm-Message-State: ANoB5pmBPnHs9I2SOpNlCv7wk2+5ciQS6yZvjKcyuIBAwrXFDky7zvBf
	ELxUIV17qei3bk+pLeFuE0S46wnEOVw1Mw==
X-Google-Smtp-Source: AA0mqf7uTCfJvsjsplKyHlSYAEtsM2IS/3wvUGZNWvvT3qGotsC3XTxsNvUuuaoOYSzyRuYN5IGuVQ==
X-Received: by 2002:a05:6402:4028:b0:467:c33e:edd6 with SMTP id d40-20020a056402402800b00467c33eedd6mr28359664eda.146.1669734057120;
        Tue, 29 Nov 2022 07:00:57 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906310a00b007b8a8fc6674sm6282391ejx.12.2022.11.29.07.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:00:56 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: [PATCH v2 1/4] riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2
Date: Tue, 29 Nov 2022 16:00:50 +0100
Message-Id: <20221129150053.50464-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129150053.50464-1-ajones@ventanamicro.com>
References: <20221129150053.50464-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_070058_628535_D5067CBD 
X-CRM114-Status: UNSURE (   8.54  )
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

Build __ALTERNATIVE_CFG_2 by adding on to __ALTERNATIVE_CFG rather
than duplicating it.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/alternative-macros.h | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index ec2f3f1b836f..c7036166af2c 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -49,14 +49,7 @@
 
 .macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
 				  new_c_2, vendor_id_2, errata_id_2, enable_2
-886 :
-	.option push
-	.option norvc
-	.option norelax
-	\old_c
-	.option pop
-887 :
-	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
+	__ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
 	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
 .endm
 
@@ -116,14 +109,7 @@
 					enable_1,			\
 				   new_c_2, vendor_id_2, errata_id_2,	\
 					enable_2)			\
-	"886 :\n"							\
-	".option push\n"						\
-	".option norvc\n"						\
-	".option norelax\n"						\
-	old_c "\n"							\
-	".option pop\n"							\
-	"887 :\n"							\
-	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)	\
+	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1) \
 	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
 
 #define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
