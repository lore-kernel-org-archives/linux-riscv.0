Return-Path: <SRS0=1KMB=TN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA54C04AA7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 21:31:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C8CF20873
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 21:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VE37k+8n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RqsxKwF0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C8CF20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ENKGggEnX4SQXPK+pjnvtfxpy2fPcCUoXitVgIXb1bI=; b=VE37k+8nUIR+Mp
	ZfCbcuek5QHc+u51VVS2q/fhNA2bX2kRqfQ79BhPfChRragAk6jFUUoZ15G44QBlLoSwSXHrNqhgX
	NVSupUSurk1wPVPFdEASPNipKXNeFXwrUCWWZTSAwFcOme3f3NM629ubv65YVduEW0guweQqKT5Fn
	KEwAcVUrQTyeG2erxWQwpp4vSlxT5IJlOVrZnnxQaBqaQLSAjPcBivwAf+a5oAQ7Npwb8wCIWniDR
	rQ199W7WcYDGh4deEyx7tDYuTEinA06WtFhLGZpPZ4mE9beYlcJ45c/0iEHJEK1FuxhEJngbC66tz
	PVhuZN1hyxpWbrSWAdvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQIXK-0000P5-Kb; Mon, 13 May 2019 21:31:06 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQIXG-0000ON-IW
 for linux-riscv@lists.infradead.org; Mon, 13 May 2019 21:31:04 +0000
Received: by mail-it1-x141.google.com with SMTP id l7so1480671ite.2
 for <linux-riscv@lists.infradead.org>; Mon, 13 May 2019 14:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nG/cg6n0i3VSt9q4OWPy6u/pN1SDfSXSymhq0fKGvbU=;
 b=RqsxKwF0KdojF4QODMrB/rU9fsaiNOfClSr+OIrD9umBxWYtvs7bbsk4AGpRC9NijC
 C9lQXaYeGa6z3m+wsbaPl5o5Gp9+JCzAVFkrDufA9vHZBERuo13JsVUaq3ikN8YL3F0w
 M177eKIdp2P06S3dsMJfMYLd2JyotZSvmdCwEdzqGkSOb5tZvOw9hzy4kW0+BejB1bVu
 JncY3m5gfPZ/LrsrpY0PIrH0vvVid6Oo0ssEVPtlobht1O+TpXR1ddrTwrkUQtTJgLLg
 ZnOsfdGJY0QB2LtjLyjGjAvUIPhHt3xKigszby+2nhnlg9IOEjKn1I47ngMnmbieGJbd
 X6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nG/cg6n0i3VSt9q4OWPy6u/pN1SDfSXSymhq0fKGvbU=;
 b=fGIkIB0x5XreDaH1RUtLetNWTOfU2iTBqaA/Y6bjRPB42in6ogUvxJtrbPvdhj6s4l
 Mge6I9YeZvqmQa2Tmjz/CM/Uz8aHGHi3wK6uimi43zbDL+JYi3b9//51EpRIrAUj2LuY
 00XyOZ3mG/FttM22vtB0L7s2Zy8JlP7lAraCk9Dvm8N7ap0GoonRcfnMtymNPktgNq2B
 mpQHyYnSYCIrs14JORv4ivJ/9HNn/XlohcsVd86cAdzErmWe7+vjKXASWziMFqy1be44
 JQKClKrwl/+0YWK3m9myID3iOGKhxJ2Ak2lF9tUmBfeYJn8nhTUOsgfKUlyyq2H8gZfw
 0gWA==
X-Gm-Message-State: APjAAAUF16K3LW98CyswjlhDR1VwXfsFaefH3MTm0joSPnNwD7BKqsKA
 2jN4c4mj/YCAvw9/6Taq5xZqOA==
X-Google-Smtp-Source: APXvYqwk7m0Q/MrpP8+eiR066EdhYUGK5GRiDbH6KYzeur6dRFebxEN9XETfcxzRVeqe5EtcWgllUg==
X-Received: by 2002:a24:b713:: with SMTP id h19mr959141itf.73.1557783060343;
 Mon, 13 May 2019 14:31:00 -0700 (PDT)
Received: from viisi.lan (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 26sm1332438iog.59.2019.05.13.14.30.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 14:30:59 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	pavel@ucw.cz
Subject: [PATCH v2] clk: sifive: restrict Kconfig scope for the FU540 PRCI
 driver
Date: Mon, 13 May 2019 14:30:04 -0700
Message-Id: <20190513213001.23956-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_143102_757533_FEAB3855 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Restrict Kconfig scope for SiFive clock and reset IP block drivers
such that they won't appear on most configurations that are unlikely
to support them.  This is based on a suggestion from Pavel Machek
<pavel@ucw.cz>.  Ideally this should be dependent on
CONFIG_ARCH_SIFIVE, but since that Kconfig directive does not yet
exist, add dependencies on RISCV or COMPILE_TEST for now.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Reported-by: Pavel Machek <pavel@ucw.cz>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
---
This second version incorporates non-functional changes requested
by Stephen Boyd <sboyd@kernel.org>.

 drivers/clk/sifive/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index 8db4a3eb4782..f3b4eb9cb0f5 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -2,6 +2,7 @@
 
 menuconfig CLK_SIFIVE
 	bool "SiFive SoC driver support"
+	depends on RISCV || COMPILE_TEST
 	help
 	  SoC drivers for SiFive Linux-capable SoCs.
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
