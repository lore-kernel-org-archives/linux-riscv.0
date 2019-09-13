Return-Path: <SRS0=meey=XI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F23C4CEC8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:27:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B320C206A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C3C2urdj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B320C206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgiuCwNDxMzOH/C386cDMI1pnHu2UTHxR+ChtcvGBxs=; b=C3C2urdj+TvIHO
	9Yc4iqF+SKnhth7VqXCeoSag6x2wxO57XzlF7JO2XzudZOJ4EgoPQhgVGbpoawGSTzRiLryasIa5N
	Iy4Rz9pHpdD28TBpYudLbL8c4Mi9Va6PAg//+3omEYOrAhlbLDbs2i/VGg24YiYmtUjA9tJnkEh7C
	YF7FGWlrFYKs7LMvJUOtaAykE6+HyIAAeMykmejl52z69JPHsDE5bo8baQxZDHFHHGnJHfbZPKBmx
	iWMnmbOkGsmNMEzxN/HazMTwLvuO6CdcK0/hMjI3ND18o1YXYt9kkCWcZGGYgRscfsMrRF//nlFx5
	TbR6uKMNptx+8sSfmm5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8rEY-0003YI-C1; Fri, 13 Sep 2019 19:27:54 +0000
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8rEV-0003XN-5W
 for linux-riscv@lists.infradead.org; Fri, 13 Sep 2019 19:27:52 +0000
Received: by mail-pf1-f195.google.com with SMTP id r12so18729616pfh.1
 for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2019 12:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=lCOdrx3F9Cx38LjugYRZlt8haUv7INXZFWqjYKoQuE0=;
 b=isD7hYo4kfSIo8upgL6tBuU1AteAAL+js1/dZYUcv3T5DBZN6ch4REOV0WcknNgPaS
 xCbBR5Ym3idX7xzNV4yONYwDbNJrjrqIC6NJcxWAKpm7Y+3Smbuw+5/P9/CyyCswPQst
 7n8EBbZ/CxucvxOH/PSrZ677LMuVfLDlxYXmOzifV548WB6+f61G1zbWMKiIDpDEd56q
 kKUWv9gUBivssdr/VLrrUiCSwoS7lu+kFg4BJVyTiGSCD4w/BiveqRBUIIQzPkddZtub
 ig+Y8VkF7Z++lhMbE7hiGNoNZDWS6mnksLWROUi7svXxQkTjjnFkrLkcUrRRjAP22Cvb
 vH8Q==
X-Gm-Message-State: APjAAAXgJ/vatm7KLZlpEATxNgxmQn2EMFPx++XHxU8BFCkCt/Zz/Pu/
 7Gm4pG8WYkEnzzMy2OVkJ0oqdA==
X-Google-Smtp-Source: APXvYqwLIyPJftelBgAqNrd+v/3hdq0K/E+Xv/Xor8TMScFHprURbfAHWLbJFiTm2Bfjd2jR+mh0bw==
X-Received: by 2002:a63:6901:: with SMTP id e1mr43458719pgc.390.1568402870370; 
 Fri, 13 Sep 2019 12:27:50 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id c15sm31911940pfi.172.2019.09.13.12.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 12:27:49 -0700 (PDT)
Subject: [PATCH 2/4] Documentation: riscv: boot: Don't claim we're compliant
 with PE
Date: Fri, 13 Sep 2019 12:24:31 -0700
Message-Id: <20190913192433.4316-3-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913192433.4316-1-palmer@sifive.com>
References: <20190913192433.4316-1-palmer@sifive.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_122751_219088_567F70E2 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We don't yet have a PE header in our image.  While we could add one, we
shouldn't claim we have one in the documentation.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/riscv/boot-image-header.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/riscv/boot-image-header.txt b/Documentation/riscv/boot-image-header.txt
index 77e8e505bc41..219f62ef62c4 100644
--- a/Documentation/riscv/boot-image-header.txt
+++ b/Documentation/riscv/boot-image-header.txt
@@ -21,7 +21,7 @@ The following 64-byte header is present in decompressed Linux kernel image.
 	u32 res3;		  /* Reserved for additional RISC-V specific header */
 	u32 res4;		  /* Reserved for PE COFF offset */
 
-This header format is compliant with PE/COFF header and largely inspired by,
+This header format can be made compliant with PE/COFF header and largely inspired by,
 but not compatible with, the ARM64 header.
 
 Notes:
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
