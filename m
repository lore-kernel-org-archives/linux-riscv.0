Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C600CAC5AC
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 20:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8NOxFLFsurFjf7F8Ad7Y/AnowqtA1/zdYHplxRZJXI=; b=OtmcxguAmcoIEc
	ESbbE4KE/RIDg4vfklwkpnkqG0oWis3Rps8sc1wvAK3e8wgnWEWBGUCrcb4FjxGcBih9gDVI605xo
	IAlD/OoBzU3pydVmkxNOgfaBjxAtWwCvSAvbHtGeIJMqfuNDqd0abagVosv4fwR2iVqw3B8Z0kzWB
	cbu2qPm6JrHfKoZu9InJKMx+b+0EaSocJTlJrnCVNh0mq7gNQhAE4rWzZnpj9nTkXwiZ19R6BrVkE
	vGTNtR8t1f0ZUMpYKnsNydaQDY0laUoqRts8zDMWtog2h7jMV/P1/rAu1g3EewU9wiRsmrlrXmVbq
	Hj8vp8lY27NZ1iiwbvYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19yZ-0000000Eo9E-3LQI;
	Tue, 23 Sep 2025 20:51:03 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19yU-0000000Eo7U-355a
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 20:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=gXFtWOZltPQ79FAzcMiIAfmUK9cn45ibixuAZ79/ZLY=; b=rXJ+GSaSBu8gpPaq78ceWgykof
	yxTcnDd4v/r29b6MA3y5T+c09mv4cIpGVFBvHEBq9eVjfXUurqZ9UHJylIsDct5+dSTn/cX8qXxP8
	T4467Fehao0rcerO7pDuiqkP6uRt2HrQxolLxRfmggg0/HSWo6/29tmmnlhfCrrWPLXj0jEseqHCT
	K/Q5Je1B4+4nslMGpgjdIoTEaDcrOWNEJPRTyXfp4IUnH6/1MUSj3tXOQki5yV0dBix9ShHERjjc4
	l/8DJMC/Xut2wk+O7SEV4aB9/qhkfbDBD1/xx2CDuZkBhCtaXs1/JajciwBKUcpGHCmd4mVLSnM2m
	WLh97BHw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v19yK-00CFVO-2P;
	Tue, 23 Sep 2025 22:50:48 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: [PATCH v2 3/3] riscv: dts: spacemit: add i2c aliases on BPI-F3
Date: Tue, 23 Sep 2025 21:45:43 +0200
Message-ID: <20250923205028.2355244-4-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250923205028.2355244-1-aurelien@aurel32.net>
References: <20250923205028.2355244-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_135100_020670_35DA9E8F 
X-CRM114-Status: UNSURE (   9.25  )
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

Add i2c aliases for i2c2 and i2c8 on BPI-F3. This is useful to keep a
stable number for the /dev entries after loading the i2c-dev module.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
v2: no change

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 994bc23cc1023..b2ef0596168cf 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,8 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		i2c2 = &i2c2;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
