Return-Path: <SRS0=meey=XI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBAAC4CEC9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:28:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38930206A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uh7mWsXb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38930206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhAPHaDUDVJB8osVWTUE8wP12C4sZA+KVFl/hdhItzA=; b=uh7mWsXbt4WDhj
	fU/AtgbFwBO7q7joNCmrp8NfAa+aqOS+0CSRVsWRujC0pM/ZeVncN5qCJ54il1TmMk+7Wxe/wuJzl
	UAmabmxu66jAflJ2BjgS3ILH/xLEjCWy1tuGfG7f1wY7KjNuCgT0LYhHBTxyyx9UNC/bwwoFGjbqe
	kAWRYAr5ME0ZU+3GuJ+r8W31PDrjjvtNHbNlpGzHk947H4jgHrO5Mhze2NZF0i3RtNmJFNgMgFHd4
	o5va3S0LEwPKJrjySlHytXnZ58/2re4E6tcXWMeu/FnjniL06INKRGCqBDQa9f2p51SHxX0XM9CmX
	gdxy0rsSywaYK1JosCvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8rEe-0003bn-TC; Fri, 13 Sep 2019 19:28:00 +0000
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8rEd-0003b8-09
 for linux-riscv@lists.infradead.org; Fri, 13 Sep 2019 19:28:00 +0000
Received: by mail-pf1-f196.google.com with SMTP id q10so18697266pfl.0
 for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2019 12:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=25hozf8heqI2cK90aKdZrW84SaxA8aO5TIvypEKLd1w=;
 b=hFkZbvpvi3wPnH7Ei8WsjYBg6xd18QtbSZig+4AYAcQNycUtMcYOmU/t3J8qcIzClM
 qilRNRnAKCGVzDLypAy/7/V65Kplsrl1fK+SrQ9VqTPWSKRnR2sEZ2je0RiKUHGXtagi
 RYV3918fKd4xNOEjXzc3rULnnimmv5aXYFNWFgU1Y53+ZZLDHDpDsngeFwbjiu85ONDZ
 c3Rz4mGNCeAyhanAvymzbykggQPy3x14WDyAG+woYZ0e5g0gzKXPtuSUllvexy3qWL/7
 7gHUgdiZMNfuuwzVaMVwVAagZus7LBGUggrTIEwt8N2qBl0t3IkeWdrvYvtKEzBCDswP
 vIjA==
X-Gm-Message-State: APjAAAXxPDYmCQt3zxAOiOnNYuVzGlR8NcGlXlslbSyrNAV24M7Wfadm
 kFD8kuvOwChHryMIVUPF0Uh/Rw==
X-Google-Smtp-Source: APXvYqzXZiLUzCWsrmiiIXPexcwTfsqYfprwIfHcttwqcinVRNtI4I+Varvmsft4DqNV6kbmJFGzCQ==
X-Received: by 2002:a17:90a:aa0a:: with SMTP id
 k10mr7067102pjq.18.1568402877909; 
 Fri, 13 Sep 2019 12:27:57 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id w11sm37842556pfd.116.2019.09.13.12.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 12:27:57 -0700 (PDT)
Subject: [PATCH 3/4] Documentation: riscv: boot: Whitespace fix
Date: Fri, 13 Sep 2019 12:24:32 -0700
Message-Id: <20190913192433.4316-4-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913192433.4316-1-palmer@sifive.com>
References: <20190913192433.4316-1-palmer@sifive.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_122759_046564_E2FCCCEA 
X-CRM114-Status: GOOD (  11.70  )
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

This fixes a missing space before a "(" that I found when reading the
documentation.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/riscv/boot-image-header.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/riscv/boot-image-header.txt b/Documentation/riscv/boot-image-header.txt
index 219f62ef62c4..e325d1c9ad4c 100644
--- a/Documentation/riscv/boot-image-header.txt
+++ b/Documentation/riscv/boot-image-header.txt
@@ -28,7 +28,7 @@ Notes:
 - This header can also be reused to support EFI stub for RISC-V in future. EFI
   specification needs PE/COFF image header in the beginning of the kernel image
   in order to load it as an EFI application. In order to support EFI stub,
-  code0 should be replaced with "MZ" magic string and res5(at offset 0x3c) should
+  code0 should be replaced with "MZ" magic string and res4 (at offset 0x3c) should
   point to the rest of the PE/COFF header.
 
 - version field indicate header version number.
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
