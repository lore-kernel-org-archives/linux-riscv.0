Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55512C07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:03:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28CD72243E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RaTKH4Gk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YAdEmi+5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28CD72243E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXF/+WuoWcnZW0W8FNbdcYddRKLLv4kUTpF5Za2oZUs=; b=RaTKH4Gk+CCMcC
	fQvG9p/2PozRtWISs53LCNZx1aHUVfj5mQez3jUNcEYpAM46wWmz9FjP+OEB1zTqEJeM+drH9KkcY
	vHsJ6H/1FkBxnLVXtxde6pvJFOcJY11x0PB0fv6KAejNeXTXDt6yqiNlVUL/ol0NzGxIgcwiWS452
	Dxvqh3ECjUz0YquqbalQjU3qRESMkxdLCV2o7ptYTD2CYYcG5LA448VJRE4w8rdi5iV5d5C0rkKs+
	AJD13Lpc2xWQWR5xGaRW4dwBA+mLUkGPw5LoVLXvIAxE57DOUhvlF1y/tCBeK0PdNdHIKkEJ8eU8C
	pkM4wWiKwogcP3queCdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMO3V-0005w9-Q8; Tue, 13 Nov 2018 02:03:53 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMO3T-0005pD-5P
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 02:03:52 +0000
Received: by mail-pg1-x541.google.com with SMTP id r9-v6so4910472pgv.6
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 18:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=zug94Vzv51FeDoXqv/Owc4YFJyg6F5D2pwdA3MiL4SU=;
 b=YAdEmi+5kk/cgx1xctWG+qmxX36D1PvrhrrbDX/PK/LF9hFo5ONINPCYv5v9XPgn30
 YzRs3lROa44aY3/3TmYxAJoc1N8Irl5484PizJ54uLQ5a3mgIDqQmSpdyDqIWN90Icoh
 7pu6JlhbtgxB/f3auysNbhR3cepIPuUGq7NTU9df+TMfkBWM0yugz50wV/qhxTWM5Qm1
 AK+ntg014r08knSk/3bXbFrdRBrW+C8/u1bZLE2SXuwgRL6NkHdewLS5DZOM3njQiC+H
 S3zdr7NEQMIs2ppp0nyGf10AagKDVPdEA2sVjePUlI5eGik23rNgdn+RJg0gGB72MtRH
 NDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=zug94Vzv51FeDoXqv/Owc4YFJyg6F5D2pwdA3MiL4SU=;
 b=fOLIzLjV42nhENLaDEHbnuP7f3r/igYGjsQsxwZwqFql7HfaDUkKrosKsL4DOZDGa0
 YOtLgbmMSuTY9e4iKa4rpyVK7XluRzxr/heIxchipGbiPTYaHi2u/8QBfOrurrEt3zuw
 P0ljQLjjpoiHVpyt0vDFfLZ7B6PFbFV9bB49ziSLbQqlQwl9OCJOEdrAXYR/m0axyReX
 N6BwLYE3+yedy9Bx6pzXaM+ujXr45FDIThelLGDO5JioxFbpFprasFGQgJ8fNdzqkKlo
 mkelq1MUl0iBxrxebH5MD+HPtndDW1dgptwV998/GEpuRCPuBfK+yeK1yhJ2dHwfasAq
 092w==
X-Gm-Message-State: AGRZ1gKr6cStoEbhCZTmXFL5hAe9uHNQFnuwdtWfkKIRv/9n4nj29dA+
 0Tsl8NEaNM2xkGhZQRVa0rpCbQ==
X-Google-Smtp-Source: AJdET5ck296g0AwMBEnRSJkYocK/d4MMQtsfrbskiCGncSc1RNOgf6o5kh4lgLi3cJYsOOORJPy9xQ==
X-Received: by 2002:a62:f24f:: with SMTP id
 y15-v6mr3213994pfl.25.1542074620349; 
 Mon, 12 Nov 2018 18:03:40 -0800 (PST)
Received: from localhost ([216.9.110.1])
 by smtp.gmail.com with ESMTPSA id l63-v6sm15869850pfb.75.2018.11.12.18.03.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Nov 2018 18:03:39 -0800 (PST)
Subject: [PATCH 2/7] doc: Indicate that s390 supports KASAN
Date: Mon, 12 Nov 2018 18:01:08 -0800
Message-Id: <20181113020113.29640-3-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
References: <20181113020113.29640-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_180351_201906_4902669B 
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
Message-ID: <20181113020108.keJIclJnU_5lNRKeWfKEPZSwWCdR2wxBJRB93SQLNUg@z>

This was suggested by features-refresh.sh

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/features/debug/KASAN/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/debug/KASAN/arch-support.txt b/Documentation/features/debug/KASAN/arch-support.txt
index 304dcd461795..c68adfc1db0e 100644
--- a/Documentation/features/debug/KASAN/arch-support.txt
+++ b/Documentation/features/debug/KASAN/arch-support.txt
@@ -24,7 +24,7 @@
     |      parisc: | TODO |
     |     powerpc: | TODO |
     |       riscv: | TODO |
-    |        s390: | TODO |
+    |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
     |          um: | TODO |
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
