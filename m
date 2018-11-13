Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61A9C43610
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:03:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95F3F2243E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:03:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qToEu5iN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="C4qmaTA3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95F3F2243E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52Y1fE3RSqjXCOoXM3bWUztfw2phCShPEG9fXLfon84=; b=qToEu5iNSiv9yU
	0YGsgwb5n9A5Hx4Zh5iuOTlGGNL6/d61GLoy8BkU5tfd+T1IEBXX3yG4gc2VfUCKufiiaWA5K/W2l
	paZqoZ7v165gD0I7DyPcCrFlFvAo5LTRrDCvMAHefvZa8+6qX2K4eBs1rcoymV75qMu9Rbcph/tJq
	uy0triigqCZx+TgnrV7TllxYwegDB8pyZaCT0Ku5IUYDU+jsYvbIDlmQKIkaWnkrpcbf/yP1KNGyY
	pupVNe5nV1cTFI/68KNzfGn9g4G+BcorcUMPYQSYXx7lgIDLHJW4qiduL9eTQZ5yJrBVvBgaAciUw
	MrDHbi4HMoK7lx/TY+jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMO3Z-00061w-Hw; Tue, 13 Nov 2018 02:03:57 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMO3V-0005pQ-2D
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 02:03:54 +0000
Received: by mail-pf1-x444.google.com with SMTP id e22-v6so5203184pfn.8
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 18:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=NUwhYXSJlOLk4MgqEvu2/18kJmm1v5aePUdHVkXphZY=;
 b=C4qmaTA3oAHjZRvcymkthP9RKZi0HUpubM/34AurR79c6Oo9E+sZI7nrlW3eZjwKTg
 qYnHiHtcZ/Qhn6T4LjcpAJBkrK/kKfZIF5ZNVRZzFvJj6i287V4UJhrI6SZXsofpXxLC
 4qlCoHmNcdRSjDFqsmWgi1ATJQBoqylYTDP+5G1lYC1LOqvPvlkxA4fhthLM7osfVJQg
 PtpTja3/B67xIg3UJUGv7INSApBE3Z0+ADyvIkYbM0pXIJpYE83XRcoEsDo9X0jc/sGE
 Xu8jSLN/Sldc+YWfB1VMUiFDdhcCbmUPmVIh+VsOVt4qs5lRBZwri9j/oV8n1Hq57jtl
 z6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=NUwhYXSJlOLk4MgqEvu2/18kJmm1v5aePUdHVkXphZY=;
 b=gH1IPYfA29KV3g5x78FMNOpkSYheRJBGp+Nx2Fba6NBygI2X3zNlCtfuT/3TbcorpX
 R9EtAltdOXJ12sCNsfOTtD2mGoZbPr5oAIOWese3mXPeSrlZVQUWdGLMVTRSDkL/YOSr
 4sQ3AymJDR3P2DzkbBiSOZIRmKsyJqlryb1yckf2hho501p4dZ9fUBqrIfQGWy2GEgtU
 VaJ8m7JP4ePpniCt8CHuRgES/lI/3TA3d8OUKQPoz9tP4VuKOUa/yEcQW/BIgHLYE7PU
 7p+3n/BmQ25AMjZJVgU/AuVtdpZ2fQsFI2Fhxgf3eKGcpwRH5a3X+3qJBGoxQgVBc714
 TcxQ==
X-Gm-Message-State: AGRZ1gLEt3KhJVKHUQ2Oz1hQlx1B+4smiKXre1Gusg+zlnEGyG0iOku6
 kDTLPDQ8IpiT5wuuY8JF8e+lFg==
X-Google-Smtp-Source: AJdET5dyv9OG35uZqV0PsX2J7Sakl0QOMWxpv9ayxV0HozTuG5WYHxf795aoMsccEk0v0MBvGE2aNA==
X-Received: by 2002:a63:9402:: with SMTP id m2mr2890710pge.93.1542074622218;
 Mon, 12 Nov 2018 18:03:42 -0800 (PST)
Received: from localhost ([216.9.110.13])
 by smtp.gmail.com with ESMTPSA id v12-v6sm22272715pfa.167.2018.11.12.18.03.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Nov 2018 18:03:41 -0800 (PST)
Subject: [PATCH 3/7] doc: Indicate that powerpc supports stackprotector
Date: Mon, 12 Nov 2018 18:01:09 -0800
Message-Id: <20181113020113.29640-4-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
References: <20181113020113.29640-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_180353_102585_0E59EC57 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: andrea.parri@amarulasolutions.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net,
 yamada.masahiro@socionext.com, jhogan@kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 jglisse@redhat.com, linux-doc@vger.kernel.org, dhowells@redhat.com,
 jcmvbkbc@gmail.com, rmk+kernel@armlinux.org.uk, mathieu.desnoyers@efficios.com,
 ren_guo@c-sky.com, david.abdurachmanov@gmail.com,
 linux-riscv@lists.infradead.org, mingo@kernel.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113020109.9nqyAM-6YvgFtYZ5f36DItXLnfbzWN7CKIS2pHPCpPY@z>

This was suggested by features-refresh.sh

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/features/debug/stackprotector/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/debug/stackprotector/arch-support.txt b/Documentation/features/debug/stackprotector/arch-support.txt
index 9999ea521f3e..32bbdfc64c32 100644
--- a/Documentation/features/debug/stackprotector/arch-support.txt
+++ b/Documentation/features/debug/stackprotector/arch-support.txt
@@ -22,7 +22,7 @@
     |       nios2: | TODO |
     |    openrisc: | TODO |
     |      parisc: | TODO |
-    |     powerpc: | TODO |
+    |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: | TODO |
     |          sh: |  ok  |
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
