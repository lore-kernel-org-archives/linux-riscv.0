Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6A8C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 09:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A1520878
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 09:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FlsGG3db";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFZ79Zf5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A1520878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qIEL7YPh5eR4bbRh9I90cUius8RG7V9sP933YLZLDDw=; b=FlsGG3dbPfKiQYvVy+C3yRy84G
	qcswUoEA8SocU81q3/gTg/FaO8AMS/6Bej97LlaEfobjKpfzoGnfAhKQlmicW/xspDqmld1KDGb/m
	JR0r2ktbqKQZ9FxyP8hY/jUhWEHsQb2ciHpxAjZVOFpGJiWYP8GzJQPjlYjVLPfSKIx35Ckf8OWiG
	vPtNSZzke2GCwQd35bF3MW3T+aIH9/j75VoqXVtlDMeBwDaEGWIcWODtPZX801iTviJYOj7lPDxIa
	Qs8gnbO+flY4Ya0EJF5pgt2ms70JX+MCzoTFV12rMdFQ5ej5X8lVfE/tB0+SrIWBDfIX++dXVhFGv
	JY0I1HJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7GXS-0004z4-M8; Tue, 02 Oct 2018 09:00:18 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7GWk-0003mT-9l
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 08:59:53 +0000
Received: by mail-pl1-x642.google.com with SMTP id s4-v6so656011plp.0
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ul55wigUjE4to1TohXKcjf7rrHR2DeP0tn9CFO87rmQ=;
 b=CFZ79Zf5+QQIBEmidjs8YCnEk8VVl5EER/mq2IdYiihjfwOqs8PoUXrLk++YZ5KCTH
 0xK17rZQDNZC2uw1vyK6rjj2iE6h1zayIGilsMGg7ua3pNjWkp2CAz468nPPUmr435U6
 Yv+ctcTJdUqL5m/E0sguEl8s98xRNZgq3ZORkX1FLyKlc9qDLd5Sf2UqtiLGkzqWsW98
 +rK2uhyy/UoDjSdPxYwszBGUQ4tt+NZ5T/v3X4J/KerziPCTK2D5eNG9XYHbUVuplxpy
 djTQC9s07el73yTec6nOrrVEOOnSQQZzcujX490m5tKjBXAsehBdPN0hMvPgQBsjrnfI
 WZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ul55wigUjE4to1TohXKcjf7rrHR2DeP0tn9CFO87rmQ=;
 b=CzANWYTKyY3waN1PB/+vvUm7BnOG9gXHToU7mxMdaOJRbfLEZrLb3uIKGCbw1xiFya
 bSEbpqsJBNKiJHVQTE4wStnv+B8zMUgsGeHF3w4Z/iC1si2ERD5q16jWQyl4uvMuqJOX
 B+NVpFI8CSg1FCtNrI1zEKQ0nLLfNfL5DG3RXHugk9nLY+4lTcZ33jX5hHOzIKWblMT+
 C2MIIb3J10cQtAN7YpHkAZEJabcuyhIlzz35BNdekia+/46ionhMmIf28DicrhPTGRSr
 KSm/GZO5M7USu/k+R8moFL9l2mevNm45XVIkx+jRsFX23PyPHCtVBxwaPazK4os2NsFF
 Godw==
X-Gm-Message-State: ABuFfohNpzbKFkRRz1XqX7tpXn4evheNr/hk/tXRoGMew1poT5/NLSWP
 Sb2OBhz8/IwD77rFFIAbl/s=
X-Google-Smtp-Source: ACcGV60V1W4uzTZGH81onWdCT6XeGCO25NucCnwHU3i3nFP6GxsnaxLfMiSaLTyONTvCwSB8y6APYQ==
X-Received: by 2002:a63:fa4e:: with SMTP id
 g14-v6mr13732739pgk.18.1538470763770; 
 Tue, 02 Oct 2018 01:59:23 -0700 (PDT)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id 62-v6sm5057927pgc.58.2018.10.02.01.59.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 01:59:23 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v3 1/5] RISC-V: Build tishift only on 64-bit
Date: Tue,  2 Oct 2018 16:52:27 +0800
Message-Id:
 <40c77db9ee2d23479ff90f2658539d29d7a30896.1538470103.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538470103.git.zongbox@gmail.com>
References: <cover.1538470103.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_015934_420826_AC1F9696 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: hch@infradead.org, zong@andestech.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002085227.o7axE9N-9WtHzhqphvA4-UgoO155aZJMuNi13wdrIfo@z>

Only RV64 supports 128 integer size.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/lib/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 445ec84..5739bd0 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -2,6 +2,7 @@ lib-y	+= delay.o
 lib-y	+= memcpy.o
 lib-y	+= memset.o
 lib-y	+= uaccess.o
-lib-y	+= tishift.o
+
+lib-(CONFIG_64BIT) += tishift.o
 
 lib-$(CONFIG_32BIT) += udivdi3.o
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
