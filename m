Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C09C0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykgMD4otx1skY1fuF+Qdl6qzarJvukHYckMQO8yxTyQ=; b=3KeijyNByCg+oc
	SfHrqlZtFebJciufURq1SWpfU/nSyodxdnlq9PE8Et+Qs58saBnLKyCYOOi/vjwa5wWbv8P3yZsyR
	FT0CW8zz7Nf2DXP26mHFhlCI7IpTorINAGUAp1hx3pLP/CY1vtaDI/xwneljycaWZKt9W/WtzHfWw
	90XJE645KSrcNtaSGrJ8BKod5poLo4lstz4QKU4mo/oDuufsafP0pAdDUS0Ojwc5CBwpT+hizhbZu
	R9yWI9Bcfz74mZBNgS7ZGtmEUrOr5I23uZ4yfHd/jvfYvtTjlEinjbdhE2JZaFJ8MXsgj3Bt3G3ez
	M9HEyXg+KkCkAVzCiBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCi8x-003qBx-1s;
	Fri, 23 Jun 2023 14:52:11 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCi8u-003q6Q-1E
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 14:52:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3112c11fdc9so716840f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 07:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687531924; x=1690123924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXwLlxrBAUzKuI6pCJ+2fDeWgsjEELKLXFUuRnypKyk=;
        b=lL3V9W78A5I+aw9IPHzSvGStiXJAcyK9oseBImJHqcTFRIzeFtrcwfhFUccwFveC5c
         FjP1BSQz5miFYAXTiYkGd6tAi9Moho8knYdW3SFQed1qYJ4s8cfDxoNLra1MG39S4HvI
         0LwSlqR0pTl24Oplj4VHsUoAu02hE0loutRZfItmZV1b7sZJjXKfVQ5tcKYu5Ko5Iz6F
         ZocE2keOBUjbGUS0iZhm5uM0qLl+nXZ/aYO+URxV1EgvIFjPky2FdlAAr1YIU4wvgDJv
         XZaSjuAcZvCI34Pqb0BXaaMTlKgUFUApSJtQeZ2GAnwOmaaQ/ZQ34tpiN2c+RPjTX2iQ
         5ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531924; x=1690123924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXwLlxrBAUzKuI6pCJ+2fDeWgsjEELKLXFUuRnypKyk=;
        b=gxRFQ6xV+hLtfjp80FqOCXx7iZuXrZ1NYaZ6XOw/f39o58ztzlIYewVJIssbFIlazX
         E5IevV9kkr4ZRMog/4n93iPTt6YpvHfLN6tsEC9EUHREVjqAvk15x+3xfogoyCHJ/HIW
         IrKFBMAGxYfkSqGuuEK7h0jiCOwt/N7rWsLLOPyrbkljLAybGw06Ns5J3jyez/szC9V9
         qgpijBvhAeJ2ZzsH6YcLCBC/CEaZlxhgdqtpQP4Gf5gsSmp12qWKBuQ/an9OP/Oizz8E
         QfzQqXSF565h4GpHoBR1qCSx0q225wVjrgO5vkmM5iGHjbe8hrJoOHOlknnE+zht5Qfq
         or7g==
X-Gm-Message-State: AC+VfDz7UfWFcTePB3pOy2UvEAb3B/KeBGbUY+suD3o70D5253BqZzyc
	LcFSD6fkf3npXLQrsaMoplfoCcnFFiU=
X-Google-Smtp-Source: ACHHUZ6RWwb2PgLhUse9ObwH28b6mon0M9IyGD1WXWNOdn3a4hOrfhjWiJrSrcJGR2eg8MTcPhuNaQ==
X-Received: by 2002:a5d:58c7:0:b0:30e:45ac:810e with SMTP id o7-20020a5d58c7000000b0030e45ac810emr16419057wrf.36.1687531923998;
        Fri, 23 Jun 2023 07:52:03 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e14-20020adfe38e000000b0030fcf3d75c4sm9846161wrm.45.2023.06.23.07.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 07:52:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] pwm: sifive: Simplify using devm_clk_get_prepared()
Date: Fri, 23 Jun 2023 16:51:41 +0200
Message-ID: <168753171950.1191890.189295159991015143.b4-ty@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230418202102.117658-1-u.kleine-koenig@pengutronix.de>
References: <20230418202102.117658-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_075208_430209_14FE07C6 
X-CRM114-Status: UNSURE (   6.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIFR1ZSwgMTggQXByIDIwMjMgMjI6MjE6MDIgKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdy
b3RlOgo+IEluc3RlYWQgb2YgcHJlcGFyaW5nIHRoZSBjbGsgYWZ0ZXIgaXQgd2FzIHJlcXVlc3Rl
ZCBhbmQgdW5wcmVwYXJpbmcgaW4KPiAucHJvYmUoKSdzIGVycm9yIHBhdGggYW5kIC5yZW1vdmUo
KSwgdXNlIGRldm1fY2xrX2dldF9wcmVwYXJlZCgpIHdoaWNoCj4gY29wZXMgZm9yIHVucHJlcGFy
aW5nIGF1dG9tYXRpY2FsbHkuCj4gCj4gCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8xXSBwd206IHNp
Zml2ZTogU2ltcGxpZnkgdXNpbmcgZGV2bV9jbGtfZ2V0X3ByZXBhcmVkKCkKICAgICAgY29tbWl0
OiA1NWU2NDRiODQwYmFmN2E4ODRhMjdiZTgxYjc1ODI3OTRmNTRhODA4CgpCZXN0IHJlZ2FyZHMs
Ci0tIApUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
