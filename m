Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06442C282C5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CmEBBKI0cRJyvKvvYp08Wg6uJ7M83sdwWDc1JjXhBU=; b=LH+KMcPimDjIQu
	4seZZj7kEAYN4l7ko7ry0J+svSFScK36eFf3cYhL5gsroW6tSXk91mJNEJpxLMpXRrb1YoYuGWnv1
	uHn9RdkoP7uiJ5FXTxVFdaOIjjumH+iMgAOI+8ZkWL+A8QL9ZC2Q4BdMkIifwPTIB2GA85rK/w/Hw
	cnWFwRB8t5oLms6jdCi/1P5f7WJh2e69VNs1D0Mx32dsXCQcx9f+0lPqIkZ4BybcorVq8357IF2xf
	nIeIj1WVFNY13qUlg5q2ct6kqRb+y5oeleLvWOzNy+POB4FvAH2vOCWejlFcB6Kw1UjZ5pHy0pWQ3
	cZs5vShfeYB5S9981QUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndom-00000007VBH-0tfV;
	Thu, 27 Feb 2025 13:20:48 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd8d-00000007O9S-3gIU
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:37:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22349dc31bcso13638655ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740659835; x=1741264635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNRn4grONdQPyJNJQgM7dzqjQjDGa6sfyVxFxG4j7Yo=;
        b=Zw0T+3oTj1LOyD3gwJFEWT5HxnQdIQVHI2punuSg6GjLuxGjRY8s4aZOp1BRVx28mp
         sCenFfDZokeW9kJTHnSDOQGbFIRTdysCqOfsotksZ9+d1cRyuX7m6t07U0pCuocAq8zr
         spG7VsjYHLsbGMUPYZAw4wU/BeA9/k3xDcguNoyYUp992LVWS12X0EUP/JSvOJkY5P5W
         VZm0LUwNhJKQXdAjih0m9febcIxLKS4ElnEnx8pALcLbth8ozsPqCLldNnwVLx4J5QaK
         FWNPAjQDiy/Hb1zjcGPv2HQbUg1+/+iNJYRc4jGOg4CBW2vwh8WtkpOHosyghlUvKSPS
         W1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659835; x=1741264635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNRn4grONdQPyJNJQgM7dzqjQjDGa6sfyVxFxG4j7Yo=;
        b=qpJy4ijwQ4UAvjdKG3CSSo2wf1wZczPg1tgEhRJTSB7qR+3AwRZ5UwXM0gQ4n8PbnX
         UVDiKnkzQu6MR0noe1froPOrWrlfEgI+w0QkXWPPsOMVwUow43NHIqWuOjQTmWNLJ2kU
         rJnk47DZSipaCpEw9iUD4plAf6X2d7je+G/X8eosoqZSUpY04L7U2I4lpWJ5Ti6iK1N4
         fx/di+TdnNASko8WFP2m6gwZYBbiPCZdiGdmmGU432ptUMNEOEOabJNzJI6KYxhsQX3P
         slYNotliLssJfVqwp/KwoStzNbU6mlLMoHkd4TkEpZB8QGkQ1hozsjCmNHDIYgPW2TlZ
         bcrQ==
X-Gm-Message-State: AOJu0Yyt10xhxtf+W0rqvaXknZ8wqMauN04aIiJ3vqBJIV/9CZ/k6wcw
	1Fos5EWFBB1eHfCOOfw8M5DrBjS89f6/kV4C6nQnZDvkM3f/IjV2QDW+r+xFts/ANUh+0vGasm7
	wHaQ=
X-Gm-Gg: ASbGncuRpkgqc1APewhudMluQSDR9Z0uOO0m7o265jkSOiHB1EzJA14MzmB9zZ1qfdS
	d7gxQfXnn6sZoRCzs3X+ILFPfz00NkC51t9Es9Nq1rEOc+lauBP4B9qDo3wr6ehsSuih0A4i/0A
	u4mMBzBXXL0icOfYuHQUVzwtUZLoohfnb1SCCIQLw8jueRbOAxy/yQTCO9X2Siwc3n4GEbVifmX
	6v7BKNs+ZV65gE9ptTzy0kmS2kv8Gj/DMHDyLqWlcco0br3V1CNpSyaYh4QQ1QXp5Zupj6RzS1W
	ORBEnNTYNsv9dKUT+dfmH2reydp/R+0F9USG
X-Google-Smtp-Source: AGHT+IG53PBDiu6FVTVuBFXKbMl/pH0m+lbJmkXDl+xjPCROuVKlD+c6+Y7yRaOAw5SWzcbapXcaKA==
X-Received: by 2002:a17:902:e752:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-2233bf6806bmr72051025ad.12.1740659834816;
        Thu, 27 Feb 2025 04:37:14 -0800 (PST)
Received: from ventana-bhyve.. ([49.37.249.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bddsm13219135ad.140.2025.02.27.04.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:37:14 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v1 07/10] riscv: Add RISC-V entries in processor type and ISA strings
Date: Thu, 27 Feb 2025 18:06:25 +0530
Message-ID: <20250227123628.2931490-8-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
References: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043715_913347_1332996D 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

- Add RISCV in processor type
- Add RISCV32/64 in ISA

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 drivers/firmware/efi/cper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/cper.c b/drivers/firmware/efi/cper.c
index b69e68ef3f02..f2908296a48f 100644
--- a/drivers/firmware/efi/cper.c
+++ b/drivers/firmware/efi/cper.c
@@ -110,6 +110,7 @@ static const char * const proc_type_strs[] = {
 	"IA32/X64",
 	"IA64",
 	"ARM",
+	"RISCV",
 };
 
 static const char * const proc_isa_strs[] = {
@@ -118,6 +119,8 @@ static const char * const proc_isa_strs[] = {
 	"X64",
 	"ARM A32/T32",
 	"ARM A64",
+	"RISCV32",
+	"RISCV64",
 };
 
 const char * const cper_proc_error_type_strs[] = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
