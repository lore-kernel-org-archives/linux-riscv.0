Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C27CC5AE59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 07:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uew7gMXOkMxYqHbL8tesJ2EVHj/3GWzN+Qw6L2/Syuo=; b=FBtQPE4reLyGjh
	BYQNqi0GnURVcUVBtAC3tQ+QZILUqB06Hce1dM61gdsLMwqSsYZwVOAAMRvx8jm4bEqVIyEEoY8iG
	LsnXTx6KGUi5rVRdw7/ZGAL141CMhswy1e56GifmWWxiYafPIF7xzOeubHV7TL3DaLdQEMr+rhFng
	fJtVJF6sfVZt6B+iieiCxigd+8ypf9Efd/yd+3n6A3WSqmtK3rhE1MSRSjVDXDre+s0EVVMYp5U1n
	dU+cnrfT3c9mNZwQttnqV4+VZGxk3jEj83RiDtbgOMtEz/azLFKYjaIfHqEv3JITO3IXY75u1Ud93
	wxgeSOS50/ONWvpXsztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN58f-0000000ExIi-1gDt;
	Thu, 05 Jun 2025 07:35:49 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN56q-0000000Ex8E-1rts
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 07:33:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22c336fcdaaso5216505ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jun 2025 00:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749108835; x=1749713635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVZjus1ELPzuP51DN+x+ciUrQVA+2y5n7YpTYBbGMMA=;
        b=eZK4KJ/2VlahVOHALGHmJ5s8EKLBpevz7ELyOeLhUvPKhnmmCH4m+RujqKAEqvOvyJ
         GBlzvA8MbuTYkBKX6jvuPvTlJjxYdALg9tSsEr/mhY1NXj2iYW/ZRQxB8z7DO13t7ZXA
         pN7yIbDnGvFe0E0+zT7zyA4XQR+e7qBCDDR+SuBgIaT0lcsW3W5ceEP57s7af2+S0gIk
         Wesy0PB2RklDqX27zHJIb7dC5j7YX+iGZQQJWGtTUY6RK75vMhem3gMSBjB67QyAdFu1
         6gKVhaniE/991o4+L7KoQb0HFXQfCdlJ89x9ra1xbLTiiS9G7pNF8/q5U1bC6Sa8D/wU
         XK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749108835; x=1749713635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVZjus1ELPzuP51DN+x+ciUrQVA+2y5n7YpTYBbGMMA=;
        b=ls9io5yqP7SXmpA9Ewr3xQTSWqY42j+R9o6EUHRnynoe7NlLePO/E2pG1rKmsdB9x/
         ob9jTkhzRjBoMkxj6k8O2syNFHUHQpPcZUncHaEU51wIQ4FjMPdiXpw1NBpu4+AnVCax
         pAIHt8LP2p0gri9lW0ZEH2mgm5DSb8cZTHD+DtUapmjFF7h62xCxmfGprhyYXTFA6B/N
         /NLXcRL7YD3ZhcMMYwP4oumxk3pLr/AzOllZ/hQZmOrR3TB4HSdNOAIfW08YbxHJGQFU
         28dT8h8qXK7+hQS4VEtESzjNlS84FclVfYetm4aQ/WQBECp8h/NqMnyVH1KjHuu8sNis
         bY5w==
X-Forwarded-Encrypted: i=1; AJvYcCX/2E2XxACiDPwxTMpTmOeHoeuJXZFjpkISZrSNJ83/c4/KlJMwRKG25Al+4olbYbY3Ehnj5XyuNBw8Dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNzkXIVvbh6X6ywjhLTeGTU7BM45SoR07jm5lo5zjTkSyla6xM
	IMg7d/ksPo8BlOi7/K/7sexZokCqgaSpeqrqTU8uQAOlDcoy0I7PzWUZm+etHcG8hBc=
X-Gm-Gg: ASbGnct1G60CI7FCxw3QRA4WHa0MIDcNmPKs4T/tTVtIPZKyyUaLXNAB1JvxmtRlwc8
	8HsQ3Ehr6XPvXy9jTnoPnERVkg1W1JQzUYvfGIAEfTDLsDjcLs8vWYNSSpdtS9kRqgVkBOAjjS5
	P3EBfrN3D3lB5PhKoCgrLWo+Bit0870jpdAgwCcou9Z79sn7MrN87hkXHf0OhJwuiDVCBHIueSu
	yCNeWPASLD3QbY90Zfi4m7PUGtZ5/0clwNy8kJR3nUYTa1SRwn4nb9eThdFKEqFdtkBz0te38CQ
	GwYkgwkk5QBBoK2whg9HkO/8UrNxt2kf5KAYzI+NXENRzInz9juJWKcTPuE=
X-Google-Smtp-Source: AGHT+IH0324sFIz083/koIgx+gH9KYl0BcA5zNyP6D3F8oqFko/vUktQ55Hf8LJzzH/VR98FTVsa5g==
X-Received: by 2002:a17:903:2304:b0:234:eadc:c0b4 with SMTP id d9443c01a7336-235e11fdc01mr89861685ad.44.1749108835283;
        Thu, 05 Jun 2025 00:33:55 -0700 (PDT)
Received: from thelio.tailc1103.ts.net ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14abdsm114511405ad.239.2025.06.05.00.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:33:54 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>
Subject: [PATCH] riscv: defconfig: Enable TH1520 aon, mbox and reset support
Date: Thu,  5 Jun 2025 00:17:48 -0700
Message-ID: <20250605071940.348873-3-drew@pdp7.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_003356_729639_4671C7DA 
X-CRM114-Status: UNSURE (   6.98  )
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

Enable TH1520 Always-On (AON) firmware protocol, TH1520 Mailbox and
TH1520 reset controller.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fe8bd8afb418..86b13177f27b 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -178,6 +178,7 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_GPIO=y
+CONFIG_RESET_TH1520=m
 CONFIG_MEDIA_SUPPORT=m
 CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_VIDEO_CADENCE_CSI2RX=m
@@ -258,7 +259,9 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_TH1520_AON_PROTOCOL=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
+CONFIG_THEAD_TH1520_MBOX=m
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
