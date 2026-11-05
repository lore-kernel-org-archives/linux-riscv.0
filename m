Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD41F606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 20:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AzQdxhuV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gtdzhtyr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CePcu3ZCSzgdPmiKh0ziWIGy0Pw7S2ksCRdi57DsSXE=; b=AzQdxhuV7a7CyRFwzQjDzasDyk
	NOy+RSHCsYEnIiawhXbA7fR5pBidK1jDJr9Uf/aHssxDlSAeWLVybs24nr1FR8tqTEvYPi3U7fy9V
	nxt/98n7dqPcji4/Rb+Eh861yhj/SJQtvn32YLTZt/96MC/nhWuWtafN0YM6hgOnwTHPOl6Babnr6
	xtKZZw/Lka6hC37Ko4si+Ax+JXCz3hEN8qWlQAGhgtQoIxI8Vm3BrSTrfby9UMfKGj6t+M1DMoGTP
	BjffgOEJmue4pb2Hab6OYqQrss7ClM4+QcFwH3SBQwimydagK5/iZsjVGPgxntQP1CcaDG8qKwCrJ
	bE/HOKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3p4-0000000AXDZ-3FB1;
	Thu, 05 Nov 2026 20:12:37 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3ox-0000000AXBl-00x0
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 20:12:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so25005155e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 12:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909544; x=1794514344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oj4+ZYy6IPmEk7n48ZoOfVMyHB9K5zKwdNLmj5eS60A=;
        b=Gtdzhtyrgm1B0jqOYc/L0vQ0FRXiiiV9ftCi8fH8Aua0qbAdtnxoeUaGplDafpUbmg
         qIkewdGXEDvzzT2gYj7Woly++yROF9+b/R+T6ihyiV6eeCj9BxFNZ1OhwWGnBCI9VgC6
         P065GL3Pb7pq76ttPcsiKMuYNru9RRhtuJ71rK3dJT2CpxZIv5ekxI9XVjK2zA6Lhmd4
         5BjDrK3COm+kQY9UzL9QJdNveCgZSwEdbEBbklqxT1x8KgNzDezPltFZJSu2PqV8ptwl
         L7RcDzxdHfYHG0jPNCi7SKVfzbDXYtrZJsY2YRv8vcHG6P4igOjABvVVxgQdb1MIFR1s
         CyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909544; x=1794514344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oj4+ZYy6IPmEk7n48ZoOfVMyHB9K5zKwdNLmj5eS60A=;
        b=G8E5jqahSj/yPNHYZel248S7zSoUVXnE1FMX7DTf9dSsaGKTRQoEaYRzBr9aA+7gaX
         UWU3AoeySkSC8CuDGBzILgw954UMnAi/cJsNOWAp/3iAkv/mObEdWjoMkCWGtddpJBti
         DfNd+8zUjX7al8s4L5gZt+2+aVbA46u3pKn2Ilwo9RoRyM2tRsc8W+F+kvRjA80elpM4
         dnsfHZPlLTxATwBpljSF/syB/kBvrTQHc1TqdiPYdo03ug6/PIKt5lRtMTDrRc9x9H++
         yoym1oMeSD8UfBFHGdDi5QkJiEWFDdRUvCrbqmaoK9i4DEiE6E9m9Loe9bY2RLiBNa7r
         suYw==
X-Forwarded-Encrypted: i=1; AKwUvByw13pdZbE4xpQl1lSe9BSj2hWK+3Q9N2t92USjv35mp+y9l4zG4dt1Tk2HgYl6kZQgz46LGj8XTvBmwA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8VwQc7lTD6NWexLESN+d0ZJvxBCNfKfV8SGuQpb7DtMcCW2EiX
	Z0bs5lzeJ2ukwKlRzhMZi1Cfj/jAuo7pJald1n3qfZoOYZGWcwJl9rMV
X-Gm-Gg: AYBFou1Qw3jaXaL0jUCooRO/OrqPm40HJTzkd3NptI+2VoduzGitEimfZIjfORm7Loj
	D8894ncOJM89KhW0+TzeSfhHMJy62+QU92xJmrssDah/o3avIXBTDjpKcWlbMscqDysypsgAY9t
	dXU6cNzGqDk7P/vmzkQA3CqBgrgyRIeUZ4Mj3yNd3CsokrnfpQc02qgOtcc1QnFpHwZbCD6nN31
	ZwUfvzrpsZklGJR9N+ck0sq4ZuthEPOT9k5iR6oO56106f1KbtWMXzD9HRMsEVjOFNVRGf67dbX
	sRmUH1pNg+Uu4zSPYO9CPybS9r89C55oDsWtjCQLel2VdBjFo/ZRfSWAbRIxVmybNIyzVbUqvqh
	++t2iUINMe2t/5md3wgYIrLAmIzp0atMNl3b6KV/iIE3/FmS9vDBg0rPcEQUrT1pchT4w3RtJdf
	v2bxGKBZDB6QXNKUS5JJYFF9lgY35JTphA5pJKCHzfL/IaXTe1jiP02oGX83yiFvKLT5sY/PhLo
	fAatL194Yr0z1q3wWfv2bVz0W0eUdn/ScD1tJVIADSUQVUsRVDWKO40CGc0gy5DQZVWjciF2KoQ
	NEXU1El4QHJ/rf1wUV+BE7yNuOEuAZ4JH+Or0jw0GaWF8t5pRLX1FPs=
X-Received: by 2002:a05:6000:2dc9:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-492778d2076mr1325704f8f.45.1793909543495;
        Thu, 05 Nov 2026 12:12:23 -0800 (PST)
Received: from localhost ([82.77.126.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1caesm11108369f8f.17.2026.11.05.12.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:12:22 -0800 (PST)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
	linux-staging@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
Date: Thu,  5 Nov 2026 22:11:53 +0200
Message-ID: <20261105201154.37294-2-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_121229_368996_305AA64F 
X-CRM114-Status: GOOD (  12.36  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I'm looking at the fbtft TODO (convert drivers to DRM) and want to check
whether fb_ili9341 can be dropped. Findings against v7.4-rc1:

1. fb_ili9341's init sequence is the MI0283QT-9A one. Comparing register
   writes with drivers/gpu/drm/tiny/mi0283qt.c, the values are identical,
   including the default gamma tables. Differences I found:
   - mi0283qt writes EN3GAM (0xF2) = 0x08; the fbtft write is commented out.
   - mi0283qt always sets MADCTL BGR; fbtft makes it configurable (bgr=).
   - fbtft rotate=270 also sets ML; mi0283qt does not.
   - Rotation maps as DRM rotation = fbtft rotate - 90 (mod 360).
   - fbtft also offers runtime gamma adjustment.

2. fb_ili9341 registers the compatible "ilitek,ili9341", which is also the
   fallback in the dt-schema binding, so it can match nodes that the DRM
   drivers claim via their specific compatibles.

3. In-tree users: no defconfig enables FB_TFT. canaan_kd233 (62363a8e2f56, Feb 2021)
   has a status = "disabled" panel node compatible with "canaan,kd233-tft",
   "ilitek,ili9341". It predates the first DRM driver accepting ilitek,ili9341
   (5a04227326b0, Jul 2021), and none of the DRM drivers match canaan,kd233-tft.
   fbtft requests "dc" and "reset" GPIOs, which fits that node. I haven't tried
   binding it. I suppose that, if the board is used, then it is built against the
   fbtft driver.

4. fb_ili9341 has had only style/mechanical changes in recent years.

Questions:
 a) Is removing fb_ili9341 acceptable, pointing users of other ILI9341
    modules to panel-mipi-dbi? The KD233 node would then have no driver.
 b) Or should KD233 panel support go into a DRM driver first? I don't have
    its init sequence or physical size, or the board...
 c) Is removal of all of fbtft already planned?
 d) Several other fbtft drivers have drm counterparts. Should I inspect those
 to see if removal is needed?

I have not tested on hardware.

Thanks,
Daniel M

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
