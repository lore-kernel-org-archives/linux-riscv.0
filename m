Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E4CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Dec 2021 19:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xEx35VOmPH0thmG58tnHJ/BtLRw8TRcbpff9HBCaYAY=; b=B/ROR9NrB8fg2C
	tsdZtkhXSAwRAcvBJUX8yUFhcM+HQXFcSFE//PN3gdfMInOmPXTbmNxg9zgisSd5B3l8O9XHf36OH
	jKZPfLLRKLaJJDQxr5jSVd92tl9/P/J/xmenWnVLXyGeodMReLu3WkV6eD6Ap1nyFO/Z4m1PHagT0
	hMVt6HisijUGgwMF2awwZQjIzW5FJ9uOqECrbXQjQZ52KmXH5/kymqvx8/Huca2MC9u8O4flnLVIx
	csAZudEoe2KWB8E5h7qfGMdK59aHmBc8ypo5lwoNNmI69SOmFY9Fb9JOmpkxIqONJeNtZaSVPT7HU
	9IqKnDX1M23nLvYvq8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2eZa-003Kxv-Bt; Wed, 29 Dec 2021 19:25:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2eZY-003Kx8-HB
 for linux-riscv@lists.infradead.org; Wed, 29 Dec 2021 19:25:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 n10-20020a7bc5ca000000b00345c520d38eso12183765wmk.1
 for <linux-riscv@lists.infradead.org>; Wed, 29 Dec 2021 11:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=XWy6zb7VrjyL61C3FIcwxfgOsxnDVpBJZr50LV8zoyg=;
 b=QdY3E+T6Nzxt8AzFFX7vO6vHUytofG/1cq6XPJi6ZvdL/utBcmvgfhMEdZC2rItpKw
 IN477Yjkd9SjAsCbmXtfjHCmWYwXHm+QNFWikdr/82q1Q3wutxL0k8gtgacLmfFbFF4D
 V+ucUKfaCZiDXsAvJL4cg9bme6RRiKN8AzvprAWEuGO5K1lciBEe0WZoxGHoUZZ0pWfi
 1JPqwkMkfsNjl18sem3tgWyVVLG9NhZAaz8xueMUT4lKr3ALMlCTMakept5zGpZmGWoa
 WuM1JTXAegrU2yiXOfm6t8rKNPVR+pSKcuSPtMPcPxW4ElBmDxvsgE2RSECbHUCIsxwM
 izwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XWy6zb7VrjyL61C3FIcwxfgOsxnDVpBJZr50LV8zoyg=;
 b=03cuVtbBtrC/vNCUzYOITf7MfKrvtKnX+XTPP9jIvkQGv7fMkLovPe2e2WCjqsXWEH
 zVrAqoGkDkZgS0q846WZShBi9k2MMk3Bru4gHygCQgXlkdk+4DPuUbaJQL7CgCPlP/HM
 oiqdmzjLrBJgMAVYtiIaFcbMqOTeInj6tJHrD7wrNZZ5SdF3n3AAEZNw4b4v4zs2Xll+
 2+YYiDQskzbSunOD0sdWOBQ/ktc9CXNvS02Wclevm9wtSEue1QmkP0Uaw7QqLPFpBMs9
 IF5UPivbPpLrVQhXvopPYRdwtLERr8CvQiQODj+Lv00EgojhjSzLAO1L6mGtJWKC/LVU
 dYUg==
X-Gm-Message-State: AOAM5312YgW1mRRWKxM/LKHwJnOUqfjapghdzcPaz4nv34++eBrWHS/8
 stEH17wbKMVxaGW+buskkUw=
X-Google-Smtp-Source: ABdhPJxr0N9dwcDiO5BtWfsoSvknY2HG3QX/qXQ9wJPFG5mOIlJi1trxt+7YS2NOS0sgUWu8J1oquA==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr23876084wmj.60.1640805914522; 
 Wed, 29 Dec 2021 11:25:14 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2626:5600:5f5:a4cc:1dcf:a62])
 by smtp.gmail.com with ESMTPSA id g18sm21892379wrv.42.2021.12.29.11.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 11:25:14 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Damien Le Moal <damien.lemoal@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] riscv: canaan: remove useless select of non-existing config
 SYSCON
Date: Wed, 29 Dec 2021 20:24:58 +0100
Message-Id: <20211229192458.25138-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_112516_607719_EAD06241 
X-CRM114-Status: UNSURE (   9.84  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The config SYSCON never existed in the kernel repository; so, the select of
that config in ./drivers/soc/canaan/Kconfig has no effect.

Presumably, this was just some mistake, assuming some symmetry in handling
and naming of configs that simply does not exist.

Remove this useless select of a non-existing config.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/soc/canaan/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
index 853096b7e84c..2527cf5757ec 100644
--- a/drivers/soc/canaan/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -5,7 +5,6 @@ config SOC_K210_SYSCTL
 	depends on RISCV && SOC_CANAAN && OF
 	default SOC_CANAAN
         select PM
-        select SYSCON
         select MFD_SYSCON
 	help
 	  Canaan Kendryte K210 SoC system controller driver.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
