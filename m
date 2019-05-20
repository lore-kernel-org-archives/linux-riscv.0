Return-Path: <SRS0=cYQk=TU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36879C04AAC
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 12:21:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C0E021726
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 12:21:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U7+YBkIv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZIILwPW/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C0E021726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GEb4R33jhMMePQ/skzkI547F6BNN8+40EqOMjAqN7SA=; b=U7+YBkIv7V0G0M
	qKSwgUwowAj+Dt1lO7I9KpZ5rF2vYWqAETN4I5shzj6pfKgI3BIrK5veQZNIivyXW1K3N9TRlJcP7
	4Q8OPNoOR3Yq4AePwSd3Zk+V78a8M+cR0+NIsRGQdzyo2IxcGTflxuRML2f4xbm/L3PJOFjDdCCgI
	hRzyR3vWTfezYpPlGwXKr3KdMHhNnpRZJW894wM5d7M+LZOyOOLUoW4UGyFe0UFc4EDSI+GzWzhaq
	X46ruNkShSOSo4QcUVChriiqLEh291Bqj4waz1uIAQQS8fTfipj18V2jZ3pM+7aJ9nJvFQjVIhPy0
	1mGZagsGsaVhjf7eK21w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hShI4-0003Pd-C9; Mon, 20 May 2019 12:21:16 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hShI1-0003Ox-Gz
 for linux-riscv@lists.infradead.org; Mon, 20 May 2019 12:21:14 +0000
Received: by mail-pg1-x543.google.com with SMTP id h17so6744439pgv.0
 for <linux-riscv@lists.infradead.org>; Mon, 20 May 2019 05:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id;
 bh=UI2Ry4LzPxHOIisYc6asfzOtY8boyegN6334Ds6sCEI=;
 b=ZIILwPW/GJbpNHIG2d6GJNUh+YC8INguJPg/D9EiCOET24LSnZ2HU2IclERXRMRbw/
 uSaF3s4WN/heNoFQbThqG4Wg6gG86+2+/XewENDYMptRiJ6zDVQqMR4uxClQBdYiR4/e
 RtClcu2Gmc+PTZ0Y8R2pFm/MVF5PMDGtBC72bosaGIQ1P+k+RSfUgWXERbsc8VeBXOm3
 o5MOQemeQ8MmbuTjd9pC2XiLk5XiNfGJZM0J4K+2ZS7j2pkDa7tR2NdlpWvvcMAMB6dj
 qnjyZO3S5tkGQ0sVSXw0LF8aKsW1vU0fTelaptg5kzu0UrtSLZn2l45hc5EVZHbJsjY8
 ekEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=UI2Ry4LzPxHOIisYc6asfzOtY8boyegN6334Ds6sCEI=;
 b=bqh42xQQFgHHhle2FHRkeZQip2OJzVKKnxVu5Dk+tigGZmdLbkBPg7QwW6lixP8iBO
 PgIpcqOyvHLIKiln0yNwi3udryEYuECa46XvDBko9lAlhsUBXTDhuDU1n4TVHZfx59wF
 hpnbJf4PWS6R1qNiKFeO/K/F4ynXvdmj1D725DSe6bAzqmK1Dz7Qy8HwRagRK+DkmXYr
 yUkE+f9i+5Nj6bWVQtTkEF1Xhj/FHYVPlNyOhWsmwu/Go3rtHnUsJ5loVfRhHL6pZTk6
 QEOcVhh6/vWAjUhcW5jtRfjdXHMFqW9rwd1FGRxRkjJzemUxIH7u12zPJ7AvCNidQRCt
 CfxA==
X-Gm-Message-State: APjAAAXtU1MAMe6JzcL09q4OhQOW1d8tV5BbMM8H4maWwdmHOEpDItMS
 Q9qI2pMXWn+JHQIFq29eapqhDw==
X-Google-Smtp-Source: APXvYqylN7mBlUiyo1w+cBYmG/xrjqleVn9q2ejjZEJx8kMEyN8NtMLL9j6m9WUAjkDxTwcIBncIew==
X-Received: by 2002:a62:604:: with SMTP id 4mr80517445pfg.38.1558354872449;
 Mon, 20 May 2019 05:21:12 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 n27sm38137077pfb.129.2019.05.20.05.21.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 05:21:11 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
 andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
 sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Extend dt bindings to support I2C on sifive devices
 and a fix broken IRQ in polling mode.
Date: Mon, 20 May 2019 17:50:14 +0530
Message-Id: <1558354817-12034-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_052113_625846_DA755401 
X-CRM114-Status: UNSURE (   9.74  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The patch is based on mainline v5.1 and extends DT-bindings for Opencore based I2C IP block reimplemented 
in FU540 SoC, available on HiFive unleashed board (Rev A00), and also provides a workaround for broken IRQ
which affects the already available I2C polling mode interface in mainline, for FU540-C000 chipsets. 

The polling mode workaround patch fixes the CPU stall issue, when-ever i2c transfer are initiated.

This workaround checks if it's a FU540 chipset based on device tree information, and check's for open
core's IF(interrupt flag) and TIP flags to break from the polling loop upon completion of transfer.

To test the patch, a PMOD-AD2 sensor is connected to HiFive Unleashed board over J1 connector, and 
appropriate device node is added into board specific device tree as per the information provided in 
dt-bindings in Documentation/devicetree/bindings/i2c/i2c-sifive.txt.
Without this workaround, the CPU stall's infinitely.

Busybox i2c utilities used to verify workaround : i2cdetect, i2cdump, i2cset, i2cget


Patch History:

V3<->V4:
-Incorporated suggestions on v3 patch as follows:
-OCORES_FLAG_BROKEN_IRQ BIT position rectified.
-Updated BORKEN_IRQ flag checks such that if sifive device (Fu540-C000) is identified,then use polling mode as IRQ is broken.

V2<->V3:
-Incorporated review comments on v2 patch as follows:
-Rectified compatibility string sequence with the most specific one at the first (dt bindings). 
-Moved interrupts and interrupt-parent under optional property list (dt-bindings).
-Updated reference to sifive-blocks-ip-versioning.txt and URL to IP repository used (dt-bindings).
-Removed example for i2c0 device node from binding doc (dt-bindings).
-Included sifive,i2c0 device under compatibility table in i2c-ocores driver (i2c-ocores).
-Updated polling mode hooks for SoC specific fix to handle broken IRQ (i2c-ocores).


V1<->V2:
-Incorporate review comments from Andrew
-Extend dt bindings into i2c-ocores.txt instead of adding new file
-Rename SIFIVE_FLAG_POLL to OCORES_FLAG_BROKEN_IRQ

V1:
-Update dt bindings for sifive i2c devices
-Fix broken IRQ affecting i2c polling mode interface.

Sagar Shrikant Kadam (3):
  dt-bindings: i2c: extend existing opencore bindings.
  i2c-ocores: sifive: add support for i2c device on FU540-c000 SoC.
  i2c-ocores: sifive: add polling mode workaround for FU540-C000 SoC

 .../devicetree/bindings/i2c/i2c-ocores.txt         |  7 +++-
 drivers/i2c/busses/i2c-ocores.c                    | 40 +++++++++++++++++++---
 2 files changed, 41 insertions(+), 6 deletions(-)

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
