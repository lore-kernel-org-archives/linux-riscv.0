Return-Path: <SRS0=NJ9D=AF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489C5C433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 09:03:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18DCC20857
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 09:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GFUeNJ+0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="P4gDQnvB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18DCC20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RDcXqEKMDQzUOSGyyTg7ub5dxdObxSV85UkQlQGv1CE=; b=GFUeNJ+0/xnLrR9tBTyrsleM+/
	QUpwF/q/t0OxRXByEkaOOovegqmwgRFiOkzohnQlKtg8RNLBEZr0pGgzCtnG5SUzJAeqy1KWSxGbg
	ZIdPbaOAFNqHkUtKZis8Bl0Z4GI1zJruSZonKosAZQtcMZ5LjpyymPhz9+09++TBZvV2ANcSplveR
	dCT+ShQPIdRMz6OtL+Q5XVq/yBng7Y6CnNbfsRLDM8UpiEAHZYtseIS4jo2dDxjREucYcvVt+jKl2
	e7ig6iXK54g4vFBAMSfqXUGKe5tsIncajo6H5K0raTInMrFOLFEFXcbd/jCVURAznJQYr/hgt3arW
	1ll4GR/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo1Jb-0001Cb-P1; Wed, 24 Jun 2020 09:03:31 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo1JZ-0001BT-AT
 for linux-riscv@lists.infradead.org; Wed, 24 Jun 2020 09:03:30 +0000
Received: by mail-pj1-x1043.google.com with SMTP id h22so911224pjf.1
 for <linux-riscv@lists.infradead.org>; Wed, 24 Jun 2020 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuwWstH+orWzdN5oonIi/uqi9D7RHwuB3qVndAM1Epk=;
 b=P4gDQnvBO2gxkNqub6xwOgqwcXxARtbIzm7b8wZjCIIM50ofSjoZcUL+YDs6Q2yC2o
 T9a7lH1XTR93IqWxiFNrQxuYCwt+OfkvxgYNYyc5eD2Ffnp86DWVYmNZaXEWpC/afU+8
 WvVkNlbNd06nIrWRdRDBisUl0QIHUUQMg0MnLr+CW+WyqnRm7yFEVwAzxUUq5ydrP43H
 1bMT5evN3KEu/UftsI4VIJbrk6iq3GpVBzS3iz/SYLbDFlHiTvLGQWKRM6o1MkzSJeXi
 DxcxXgPSgCLUgRy+6EdLglMcCS57Vf26741bEBEQ6VPWwkdi/Hu0k2bIUSIFqYpTiVb0
 RZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CuwWstH+orWzdN5oonIi/uqi9D7RHwuB3qVndAM1Epk=;
 b=cuqSvBBx80BP94imBGi499vnQ9jjeOmQErTRuBLoJenn9arWSVP/ZOjlgJJzrbZ27F
 R/YrqIsgPeVMm2V8cc6LWpBoP3cq2Gg906QX5mfGYsOmewE2pZ0iBNzQ+P3rdGbIDiVm
 N/YUjMb5atTFcu25wsCi4wggfK697KMYHYfMA8T7k9U1qJSShl/gtSy+ZPzAjUJcPlSj
 1RRwyjKAeOGJ3+v6g/IS+ged95Otl/Wc1Oi7IhgiwxA5cMMXcA7vwb9MKyxMz6lJ/pvf
 U86ljDWSoqn5QrNpoDqGxLNhb8qf7977zusLuBUj+eZXGfdcrPlahDGHjI0JrjpEPi2T
 8slw==
X-Gm-Message-State: AOAM532VLpbBUpDkVAD5btAU0uWIM/kMW6/QeaOQ5lPzzuJJup4iHde6
 amgBPxPKrN1tnpK5fZB9w/DaYnP5NGY=
X-Google-Smtp-Source: ABdhPJyYFhg10tCLwL1zdRl/wp1/ko3wN8cohqAyOUivtPimeEG0zDICG05j8PKiDtkss3C/NmHFYA==
X-Received: by 2002:a17:902:e989:: with SMTP id
 f9mr28719637plb.268.1592989405525; 
 Wed, 24 Jun 2020 02:03:25 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v1sm8062046pfn.210.2020.06.24.02.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 02:03:25 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com, guoren@linux.alibaba.com
Subject: [PATCH v2 0/2] riscv: Add context tracker suppor
Date: Wed, 24 Jun 2020 17:03:14 +0800
Message-Id: <cover.1592989082.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset adds support for irq_work via self IPI and context tracking.
It is tested in qemu-system-riscv64 and SiFive HiFive Unleashed board based
on v5.8-rc2.

---
Changes in v2
 - Fix the compiling warning

Greentime Hu (2):
  riscv: Support irq_work via self IPIs
  riscv: Enable context tracking

 arch/riscv/Kconfig                |  1 +
 arch/riscv/include/asm/irq_work.h | 10 ++++++++++
 arch/riscv/kernel/entry.S         | 23 +++++++++++++++++++++++
 arch/riscv/kernel/smp.c           | 15 +++++++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 arch/riscv/include/asm/irq_work.h

-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
