Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43245CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 23:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvF2vNYQmIeS16V7/+gYVxHrz3INWHugYAu9fIkBbt8=; b=pvNzhV22AdpMLQ
	57Fg3X3EOf4dPPiX6joY7Mpst/4tc+by/t0AZ3rlp2p0mDWQgrVEMy2usxs3TqQuYBq++bE/EUxpw
	CRNvjkzFk0gIk8AFnXwpUMevLcwY1aHFKsaGGbAW8tkSdxKgr7U0H9qs0iQxk1QnJddQAE4X8d9dx
	YcWIUqEbczB9lSvBdqzwxR3drWKWsUOuwDXu/Lv+SfK2eByQCc/MaE0KWo5BgHrrEGEsJQCfVl9LO
	5xuM3kmJI2uDhyNf6lTrUg0R/qJxrv9Pqlhmt/KxTuqix35iQJh8ntkK2sgAmiDqDusmm14S8G7L2
	YjtAtROmlLSwkzB/YncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhGm-00000009QYr-3YGq;
	Wed, 10 Apr 2024 23:22:20 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhGi-00000009QVZ-1nE2
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 23:22:18 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso5775309a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 16:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712791335; x=1713396135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6GWeq3XOyCgOhhTvpF1S7omIve7JbnP/NpPy+2G4KQ=;
        b=AgsG8yt1NBLHY5CxOSr88Lu53fMJzIQwRzq+EYLBU16j13ZGz9BaN5GKrnsoQMhMPK
         dGs7SlsnEt39O/sh8CdUxMZfnCz2AFR9VJ4Vo724v4x11b6RRAcENybqyVJbrfp0e9yx
         hXihyyJCFfpnYPaP0nLpuIu69/mQj00NGzu4VrLyPJxecMmetcikhhTJ1i1QlefzlE1Q
         hULrfLTzj3tT2LfcVtsphmc5sUF9NwDfC+EZRMh7dxGjVDGdVWzUVXRmgn7xaKMrIrA0
         8gGegivsD2g49PVDwP5ahhWGhD/1FHfm7RE4J58gPXRgc18OD5jMjd15i4jjhur7oToP
         JAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712791335; x=1713396135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6GWeq3XOyCgOhhTvpF1S7omIve7JbnP/NpPy+2G4KQ=;
        b=HuZ/tiPkxWZgde+f2JZrHboENjLONV4w46thIPJ/YsyEbADA89AGJHSkgdeyUQgjkR
         pkmj9zujsr8xrweVAj7cmrf3vckjBavrW0CI4okGyRYmfBHx7XwuCddbNckx6jIvEmTv
         qnM8xVTjFaMJ0t5uooLqXC+2rI7SmaWvQ3f2PxQk1PUWuVJIzD2jYT96H2TYyARbEwGr
         EvHS//J+jpPpD3Wrw5vdDoyDpWcvwShIDA6kw0RROWgxm/wovcXiyLgwwAsRf1JqltG1
         w8zrAfc90/b2hvNvvdk0cwmReovEIk1Wg/MoHA/OtAMn3F3wY3f1xhoydphE4KTjlz2l
         3gPw==
X-Forwarded-Encrypted: i=1; AJvYcCVZsmDBt4fei6f0PYsIdnydZ7+xZXzBAWl2rcqy85tOYoydsUi50EDNqGNEaUfqLUNbQQpAbrYdtxoGLyI48y34QHTup79H3iXdDMGK6eDm
X-Gm-Message-State: AOJu0YyCbDAH7N8UgADAR6bGNwie0uuLeGdARVV2YsQtX3QDXUzlADxc
	37JuvZ09XGLotAy5hasuzkY+jrAcdVR9UVRBHKCJGZZktylqr4KbOSpSvP6o3Zg9TlU1uFtJk5b
	C
X-Google-Smtp-Source: AGHT+IHQxkQzWHUTzxTLtP+m4JmR5VZ+DDzJOureKVO+ARelFpk0sk3IDdXuHWSl86HQ9vRbs2OFiQ==
X-Received: by 2002:a17:90a:7c43:b0:2a2:97ce:24f5 with SMTP id e3-20020a17090a7c4300b002a297ce24f5mr4347230pjl.35.1712791335281;
        Wed, 10 Apr 2024 16:22:15 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm161865pjq.40.2024.04.10.16.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 16:22:14 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] cache: sifive_ccache: Use of_iomap() helper
Date: Wed, 10 Apr 2024 16:22:04 -0700
Message-ID: <20240410232211.438277-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410232211.438277-1-samuel.holland@sifive.com>
References: <20240410232211.438277-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_162216_518546_BEEB1E14 
X-CRM114-Status: GOOD (  11.07  )
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

This simplifies the code with no functional change.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/cache/sifive_ccache.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 6874b72ec59d..9833e9f6f36c 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -288,7 +288,6 @@ static struct platform_driver sifive_ccache_driver = {
 static int __init sifive_ccache_init(void)
 {
 	struct device_node *np;
-	struct resource res;
 	const struct of_device_id *match;
 	unsigned long quirks __maybe_unused;
 	int rc;
@@ -299,12 +298,7 @@ static int __init sifive_ccache_init(void)
 
 	quirks = (uintptr_t)match->data;
 
-	if (of_address_to_resource(np, 0, &res)) {
-		rc = -ENODEV;
-		goto err_node_put;
-	}
-
-	ccache_base = ioremap(res.start, resource_size(&res));
+	ccache_base = of_iomap(np, 0);
 	if (!ccache_base) {
 		rc = -ENOMEM;
 		goto err_node_put;
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
