Return-Path: <SRS0=meey=XI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C95DC4CEC9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:27:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A81C206A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 19:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H1kgf/1a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A81C206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b665+ps2dwKc/YUZoSkx4ReY9kLkGddbeOVcB8yYjMk=; b=H1kgf/1axRGRz0
	Qzm58bGn9zTPBfwdCxD/k82LLp8WuSrEpM7LputN7NyXh87QOtREd2DgmqmeUqPj7hu8iyabfDcWY
	ABxmFf0BFreNNSWeyU2FOc+hSSr1CDUN+khQew/1pRK4AE6nQ1+0z6e+GwMRBRJeH2TrdgZERZOHB
	TvhYCvA1IXS0eDdC1vg5wwf0KiKZjNWbZmaYc5Pc82zcrjMit1BuOb4cMtDaxsDIBRPK6Ex/vh0XX
	UJ7Ihslk1BR6N+VGwBBofji7vFaVfjcxicQECfafQAF7YGyHr7OhfcACFLWwN/ReUAJ5PEzF/iIfR
	Oz7ZJpW97VDlF8qE3ZsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8rEQ-0003UP-Vd; Fri, 13 Sep 2019 19:27:46 +0000
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8rEO-0003Tq-7S
 for linux-riscv@lists.infradead.org; Fri, 13 Sep 2019 19:27:45 +0000
Received: by mail-pl1-f196.google.com with SMTP id 4so13650320pld.10
 for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2019 12:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=xRy8tgqECP/7yjr3NZhDqgx63nTD8je9wSJ9Ypp6rmY=;
 b=ZJyqw2/DacGkL2FPl5+DhC/FTGkoeeyd9qFfYJ6zqENyMd3VnmhG3sqAPAdiWZZbR3
 nNOX1aSU1dpVV58DXdrk2Ua33/x+oXCEDWobSI3XR0i4VV5gTyl6opzeZLNeIsmaou9M
 cWfmdgJ4DkPSKTP0XtYldG2GTLYdC+BcBVz31AmprUxes/Ao49F15/TKUVW2QeE1Ezse
 pWEjuT0tE5xAUxxQvGvqddln4sJ9cf8enn3oXUWspG+E4QvGXtq2eLZ/VIOanJieb9wV
 ZgStdom5MsxK6WellDf5ZjYsVcoB1r4xqt/fSazgMP85THnCi6OGV4N8Vd9DKujWrFC1
 YikA==
X-Gm-Message-State: APjAAAVYFgBh17UNVZgsi1Wf6bFSUbRBIWBJ+yjGBZBuz5Q0Q5mBDa59
 ZhsjIi+UbTDXL+cliik3pcRoVAMHuufLig==
X-Google-Smtp-Source: APXvYqwyubhTK+NtNEdUSRAA07Jq1LUvNYtXedUpwkJ4Zv1VVc9/mN2GFyMW4ru5mZpYcCFTeIX+dA==
X-Received: by 2002:a17:902:b48c:: with SMTP id
 y12mr36619081plr.161.1568402863075; 
 Fri, 13 Sep 2019 12:27:43 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id z12sm47192310pfj.41.2019.09.13.12.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 12:27:42 -0700 (PDT)
Subject: [PATCH 1/4] Documentation: riscv: boot: We're not compatible with
 arm64
Date: Fri, 13 Sep 2019 12:24:30 -0700
Message-Id: <20190913192433.4316-2-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913192433.4316-1-palmer@sifive.com>
References: <20190913192433.4316-1-palmer@sifive.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_122744_264972_5B7B5245 
X-CRM114-Status: GOOD (  10.75  )
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

The documentation for our bootloader claims that it can be made
compatible with arm64, but that's not true.  There are some differences
between our format and arm64:

* We've used the first 32 bits of their 64-bit "res2" as a version number,
  which we're currently setting to non-zero.
* We're using their "res4" field as our magic number.
* We're treating their magic number as our "res3" field, which nominally
  contains a flag for big endian systems already.  This can't get set, so we
  should just drop it -- it's also not described what the flag means.

This patch removes the claim that our header can be made compatible with
arm64.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/riscv/boot-image-header.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/riscv/boot-image-header.txt b/Documentation/riscv/boot-image-header.txt
index 1b73fea23b39..77e8e505bc41 100644
--- a/Documentation/riscv/boot-image-header.txt
+++ b/Documentation/riscv/boot-image-header.txt
@@ -21,9 +21,8 @@ The following 64-byte header is present in decompressed Linux kernel image.
 	u32 res3;		  /* Reserved for additional RISC-V specific header */
 	u32 res4;		  /* Reserved for PE COFF offset */
 
-This header format is compliant with PE/COFF header and largely inspired from
-ARM64 header. Thus, both ARM64 & RISC-V header can be combined into one common
-header in future.
+This header format is compliant with PE/COFF header and largely inspired by,
+but not compatible with, the ARM64 header.
 
 Notes:
 - This header can also be reused to support EFI stub for RISC-V in future. EFI
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
