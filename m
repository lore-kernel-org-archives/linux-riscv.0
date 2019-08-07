Return-Path: <SRS0=DSzU=WD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E008C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 02:07:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0573820665
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 02:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i9Rt1ZKu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JC4fDjkU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0573820665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ptXeCsNg2v2Vc9Y+h07wJwWFocTK3bkj9S5RN2M0mXE=; b=i9Rt1ZKuE8wDNe
	ayA+m47tf8h0c0ZBFrqMQ52HWdBF6F5IXqeD6uVgLC/gQdonnOFg52Tu9yHBAmpt1HSxPcSfiK0vO
	6yYGfxtb8IS2vTUmMmvcMTDt3ygHDduOuYR87McVJ7kWLM61FUAjzHxyYokVzESNpsJzI1SXBXpbZ
	WTnz2t5HyAJStdDw1uMZ+c76X6A1BDpfwN7wCA40X7kKwDIoS2LoZ62RN7twd2u6vXs/deaJ1H+MD
	THZkAUOH7isV5L9IlQ3AcqlahzJqEAhiwJrx2M2km2OYSVOL+VQOn04B2q+fdhv4tvR216Kc8KZkr
	FqYbPFNQlpFgIuzje1WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvBM6-0001Wn-Ei; Wed, 07 Aug 2019 02:07:10 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvBM4-0001WU-90
 for linux-riscv@lists.infradead.org; Wed, 07 Aug 2019 02:07:09 +0000
Received: by mail-ot1-x342.google.com with SMTP id x21so4819198otq.12
 for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2019 19:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:message-id:user-agent:mime-version;
 bh=MuFa6tZ7vFSe1LOVI7ekbYPMVwhBLKkDTybz3Yw3r44=;
 b=JC4fDjkU965cDljrf9f9H+35WfdDcOLRBf4d4ck2STxWjiyn613K80IfbXIV3yjt8F
 TaxsxQSVs/4+2cFoiO+YzykT21aoLXLSG3wELNAjtQAbQqwTVS6vp8AZpXutrzNEtHs2
 03mhxA0YfSdoqbgMZdbgIGx/odmQ/pVngBPraMDIe2T8BLV5G/b2yzLMgkELXP4+AXmA
 fstCg3FK/zG6HxmSpCXsLx0aDbBr0a4c0CUgL7QlbAVN+Lpdg4RpMokPM66xLHO9o9V0
 3tkCHFklHn3oMNZz3aI/azdbQ/aY+d3txBL9HIzwxyqlEEpCPhJP1ZGIdLenH6lvgwI2
 b4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=MuFa6tZ7vFSe1LOVI7ekbYPMVwhBLKkDTybz3Yw3r44=;
 b=pYJUWRrnu5SJdUfZsNQsd+KpasmFRwhj/iIiOAihrUP8Zz5HaYsl2XkIXoeYlsne2w
 wqvzpcYV+pfi7+KUc97/N5TUJP1H79o4iBXcZARWFWYW3JQitbhPDcWvgSDBqJo6+Pub
 rfnYr4FVi1o7YqPWsVeAEPJrJrqJ4vBTb22o+03JHbdluaFKJEyCwjQ/TcBvH7qoNQZz
 dxcn2AvPET3LjQheYDQdch7hh5LDamoZIpO4RsfiLHGlKtsNk5jVa/xuEjnxvlAWXM9f
 nheq2ckEtqRuwOpxOq7fOGYtnDMmEdpJUXYqwKKKQfK6FCAFOMi3TUZkK5tsN6kyO/4j
 BOdQ==
X-Gm-Message-State: APjAAAXJWQGT/y9UlRXahHYwD6SnaIudwVwlS22fHqah2a+aXvxr7ouA
 Y/ne2kJEofyfQi+i2UhyuuugBDf1iuw=
X-Google-Smtp-Source: APXvYqyRjgjRUfPtCrkI5GZQR86YZZs4UWw3xYp+cV8dbhHh18X0tcLi4UP7kagxmb+VJst8/pQJ1A==
X-Received: by 2002:a02:1441:: with SMTP id 62mr7791725jag.21.1565143627162;
 Tue, 06 Aug 2019 19:07:07 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 h18sm69825603iob.80.2019.08.06.19.07.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 19:07:06 -0700 (PDT)
Date: Tue, 6 Aug 2019 19:07:06 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: delay: use do_div() instead of __udivdi3()
Message-ID: <alpine.DEB.2.21.9999.1908061906240.25231@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_190708_346715_7CAE043C 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


In preparation for removing __udivdi3() from the RISC-V
architecture-specific files, convert its one user to use do_div().
This avoids breaking the RV32 build after __udivdi3() is removed.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 arch/riscv/lib/delay.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
index 87ff89e88f2c..8c686934e0f6 100644
--- a/arch/riscv/lib/delay.c
+++ b/arch/riscv/lib/delay.c
@@ -81,9 +81,14 @@ EXPORT_SYMBOL(__delay);
 void udelay(unsigned long usecs)
 {
 	u64 ucycles = (u64)usecs * lpj_fine * UDELAY_MULT;
+	u64 n;
+	u32 rem;
 
 	if (unlikely(usecs > MAX_UDELAY_US)) {
-		__delay((u64)usecs * riscv_timebase / 1000000ULL);
+		n = (u64)usecs * riscv_timebase;
+		rem = do_div(n, 1000000);
+
+		__delay(n);
 		return;
 	}
 
-- 
2.22.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
