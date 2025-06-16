Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1098EC71155
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yO3wJhVwUj9JcUibKz8scWCgTtPruNtFzECVuSrLn4Y=; b=o3YW4bGUdrAq9A
	VtQftHyOHbH4hCyjgzev+kUT7UwaSRJx3xLg4AzN8c2LlBNEkpNEz70CT26hRNiofIMx19bwUtWQt
	I3vpqQ9mE5RodWjrSVbeIBnp8gU2Hwh/YK3JpHsHlfoXs2xRvtNtzQAZNFJ16tXmzs1FS07OpxJ3q
	zTk2ayXSWQZkNg2Lw0QdVxCgSHNcavZivCGRw19t2F5XKay/mH696UUu4J5smmk3cSaHS+XiNEEGJ
	MKzXbzyDPRiRahDUAwSVBH1pMGwLIL/v9uyaA7mK9ZT6/vNtHUYR0e2El7/3KSg9pzXo1Xzj5BbLF
	8YM34+ogh+N9uZ68XnWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAWB-00000004efb-1nCr;
	Mon, 16 Jun 2025 14:08:59 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9JN-00000004R3m-438Z
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 12:51:43 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3ddc5084952so19044025ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750078301; x=1750683101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/rRqga4nciTe+40s1lGUJde2Ttgzu3tg/+nM/gCFAE=;
        b=Fc252B5xboa4ttrfign45BbhvOActkQw6hAYAmBXTGLtF9ckxJdSLivv+gwgMxXMF6
         Hf6O6wOhavoUOpzcsnUMyeJdHPu6I+3TQb9igPvSEoCb1m2aU1R3VqjuLjejuICzI409
         ONbvNsduyL21KLICEWgoz9gwQrXWDN2JpHJ6w8n08dyaqPlpJQL1X6x6tTyOFQOPAH8L
         knKPEJj2NtAHsO012eyccxac0xzutgGs+WYzJka0Kg0PbQqmjO1SrOaWMJV71b+C+Fti
         +XmU3ack7dyeUI4WhgKUtuC8D1Kmy6MPuOmx+FcKaQ2TrDsaJ1aW+zk5BJE9+s6xqtRF
         3qyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078301; x=1750683101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/rRqga4nciTe+40s1lGUJde2Ttgzu3tg/+nM/gCFAE=;
        b=Dxp4zjsL1BBa252EykZOiajey7C6Afj0HhK6fM8tVwIzEOZW2DHZzhmEebc1vinCkx
         c9P5RT2oiTCwXTxWFiIw4ZqsnkCeXlgqBOPMzbj5HubEYMDY6yF3gr66o//p5Kb4jR1f
         vQVtgPVZdwgTSqunLCPPSaPMmZOMDjFqTiMZSg3U2BoZuVD46fntzR4Kz6+S6TN4+Plk
         kyJyyDn+QkzDVoeaz5C2PfaoPRyVVIT8lCloLq6P0HBen6vJzULcomNqGYbIQTYnsY/I
         hAKaTxv/zN8UvlJ/P1h4c4ZRUmngp5Q+qQ9aoQeaTJQaf42vE9qb45wAQLdVNr4yLdJ3
         OxbA==
X-Forwarded-Encrypted: i=1; AJvYcCUGz1lKVpclzReBVvEYJzyIFblZ8T2FTGz0RDubEnZxRXeck+lcdlA3SmdQCvpGK3mbCRyagmRHPvb+FQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YytHXGbv64SeLIMJq9lsED6r89v1KOE3P08XD6iC2mlIiEGEZil
	pzo/R/HHxYcq8UppguMM1x9cQVtb3KiByM/i1mjQJLB7yOV3SWV/6eHyVIY92kkUIkk=
X-Gm-Gg: ASbGnct0raHwZTiaupp5wCF79shvRYDYBumoJk8KEPReW/h99wHtGpieZz5fdGTLZmn
	dDC7KUTkVSbMzBDYD1ti3B28CXID+7GgBtYXoVwnGvJG46Ix1T+p77BJ7T6jTo/6v2pME+RwnyW
	LHToJZ1TL+jXsSg+n7xM5K6ZQgYFkbyDfE9rRfDeJKSouQgZHoq3FhGJk5dm5v3+J8n/uBVLr1P
	sx31DEqsvJy/J2Z3P9wQ5Jf/gJd77ZKiHFYQ+nuX0GrAHLzGRIMduOdTd7/Dhwzsl9PD5oKq005
	L8n+lT6PfPBm+MMvklPtjJH/6M/2fB5tsmYB7p3htHFI14EG8sgmJBzPnlx0GOuIQVK/uRWa5bJ
	M+L6I86w5hqjMLPmvC05b7lHn/8xJgTk=
X-Google-Smtp-Source: AGHT+IGBM9IfcIVPXLIx3r77XwCbfXk8tkksQXCR2d/8SBqn06Uhn07s7o49RLoWiyjUv193p5+5QQ==
X-Received: by 2002:a05:6e02:1529:b0:3dd:cbbb:b731 with SMTP id e9e14a558f8ab-3de07c55b92mr92098655ab.9.1750078300563;
        Mon, 16 Jun 2025 05:51:40 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b442fsm20352865ab.2.2025.06.16.05.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 05:51:40 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	linux-i2c@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: k1: check for transfer error
Date: Mon, 16 Jun 2025 07:51:36 -0500
Message-ID: <20250616125137.1555453-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_055142_071180_9EC895D2 
X-CRM114-Status: GOOD (  14.67  )
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

If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
complete, or if the hardware reports an error, it returns a negative
error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).

The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
which is the i2c_algorithm->xfer callback function.  It currently
does not save the value returned by spacemit_i2c_xfer_msg().

The result is that transfer errors go unreported, and a caller
has no indication anything is wrong.

When this code was out for review, the return value *was* checked
in early versions.  But for some reason, that assignment got dropped
between versions 5 and 6 of the series, perhaps related to reworking
the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().

Simply assigning the value returned to "ret" fixes the problem.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
---
v3: Rebased on v6.16-rc2; included version in message subject

 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 5965b4cf6220e..b68a21fff0b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret)
-		spacemit_i2c_xfer_msg(i2c);
+		ret = spacemit_i2c_xfer_msg(i2c);
 	else if (ret < 0)
 		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
 	else
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
