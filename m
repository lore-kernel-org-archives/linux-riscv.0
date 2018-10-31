Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE29ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 06:47:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF3C920657
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 06:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UUw5zv0B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="G/cJk7Wi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF3C920657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ym6YwvoC53v+mu1/eZl0eNoMAnFOwUEMiFJwjHaa3wc=; b=UUw5zv0BOHp/r5SCiS3tfV1hFT
	MLb8SHzjKwEUmF/qlZ5uI212o1mwd6jxtAA2l6UVEbybFzGwVSBmsC45f+uvoEX09rsbPGTI6JcnL
	c5HOAXJ6XaHGBotU3J+zLxSMeaTlSLI9jMT6mVRS9SIJYCywM9CZjTMiaARUXK/ZY9w+zzkbb3+K3
	/4A3dajeEa7FxHW+Sg8odA3wMU13iLoCTLR94VMuZjfWjaGJbzUP/WL//dmIbr0M4ZhEc/tdwYUit
	pbIk54aoye4PboM5QO4J2r49tJdHVsFfXrIcELx5fE0CvfrDu32XMh07D3oECpedhd4qCb9TJpH9j
	122am6uA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHkHu-0005ib-RP; Wed, 31 Oct 2018 06:47:34 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHkHr-0005el-Sz
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 06:47:33 +0000
Received: by mail-pg1-x543.google.com with SMTP id m9-v6so4192387pgl.13
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 23:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6Fbt1DrvQ5WLpCxOHM0qCKLv5iGK/kb8b9uOh/P5ZQg=;
 b=G/cJk7WikN8Jxaj2TMSNLJDR23Db8rkhdwuz/k6aCXGFo4rJbKhLrzgNQCJ54GW6JK
 E/RUc66YxFf3Fik67aUvbzRzIqwc9sNeqfEq329jo4NRXic3LeMp7OnXiftm1nEEo1p0
 J553lRpV7peDL17dABbHRockRmtuUIPnDPRx6boVJckAJ1mdpQvl1FbV3/9u8P4Wis+3
 be3f0ysl8PiKrvuDKwnwxvRY6l39/XXoHwBW8y/abS0lp25x3X33b8cMzNq6kTrR5RxD
 V381rl/lE3lbnvjjn5CFVo6Xdngw8IolmPHrASPGCexe7+MoG42iPDnuMfiPTafWn8OV
 zFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6Fbt1DrvQ5WLpCxOHM0qCKLv5iGK/kb8b9uOh/P5ZQg=;
 b=UAIXa2ypxvP5c27qdNonsYFxCDVl6sSfdL/KRH3BMLeW5dk1m88X0OhCLJ5BtYOPHD
 KmNNMg+8epnv/Rf0sm3zR31itKSDdli7pXb+9FtmJ32B3GMFSduNyUDHbSOVaGwHmvJV
 YlmT6ftSot92lRdOQx2xtE8idKPVM2ESm50K63K0o/GlM7+/q0ViKJOrDMKa5FBytToj
 ykuqSFHOGvrMGYnNhw9arUZkPUeG5KVz0ZfW97PntRotms70GzCPy+MBlSjUhjy7LxEU
 lLFtWUHoqKFzh+D0JteAefe+wYzjDLfnn6jg77TrAjuEmI6AFuRaF9vvHJjcPHqyQVNO
 mhQw==
X-Gm-Message-State: AGRZ1gJV+XJMCkATR4ACwqj7Pv0inDvSyojm4mdcix4f2eq+M8cp7Eo1
 Bv2ISVRxzkhgXzmZGDMJVYkmSg==
X-Google-Smtp-Source: AJdET5d3dTC4bp/a8/aQ/XeMhAEVV4k1e+W0RUHKocTGRsln23wbEkpveOOmQVD/QnCtJj/j2KAC3g==
X-Received: by 2002:a63:6b08:: with SMTP id g8mr1910867pgc.119.1540968441269; 
 Tue, 30 Oct 2018 23:47:21 -0700 (PDT)
Received: from localhost.localdomain
 (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
 by smtp.gmail.com with ESMTPSA id z7-v6sm12127306pgi.42.2018.10.30.23.47.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Oct 2018 23:47:19 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 1/3] RISC-V: lib: Fix build error for 64-bit
Date: Tue, 30 Oct 2018 23:47:07 -0700
Message-Id: <20181031064709.30981-2-olof@lixom.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181031064709.30981-1-olof@lixom.net>
References: <20181031064709.30981-1-olof@lixom.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_234731_935037_32920421 
X-CRM114-Status: GOOD (  11.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zongbox@gmail.com>,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031064707.JNGOznwVjKW6OIzo2R2RtQLG7yuwjaGKx1Iev7M8nUI@z>

Fixes the following build error from tinyconfig:

riscv64-unknown-linux-gnu-ld: kernel/sched/fair.o: in function `.L8':
fair.c:(.text+0x70): undefined reference to `__lshrti3'
riscv64-unknown-linux-gnu-ld: kernel/time/clocksource.o: in function `.L0 ':
clocksource.c:(.text+0x334): undefined reference to `__lshrti3'

Fixes: 7f47c73b355f ("RISC-V: Build tishift only on 64-bit")
Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/riscv/lib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 5739bd05d289..4e2e600f7d53 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,6 +3,6 @@ lib-y	+= memcpy.o
 lib-y	+= memset.o
 lib-y	+= uaccess.o
 
-lib-(CONFIG_64BIT) += tishift.o
+lib-$(CONFIG_64BIT) += tishift.o
 
 lib-$(CONFIG_32BIT) += udivdi3.o
-- 
2.11.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
