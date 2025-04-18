Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4020C369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 05:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OpyAIpiYaFXhVZTxeFqDSMpNObbd+tCPFLQmjDdI14=; b=BzLsiggQyj+86R
	4QV3Qqgoy+dAjgSU+5VV8X3lWSZyuHNEMQvypvHppzRu6olO7ZJ/sHwtXA6wwkJYznktPmBOhmX2s
	9FnoqtTHysUPXMjl+bc4d8GTQuZR4ho/9Nj5OkW+Jatv7LY05wS9RWeU3x2p9bQ8Ed+3Jm5gSe+Eq
	hqp0UvZBM1IyCMaIsmRs5uiBsL65dbUb/90QS+rJIXB5GOI5j4ilzqjDlalvXvr5AJGdF8Ptl1uTr
	XfXocUk5QSLXMRc6z5r0rn71j47HwVjtIlE3H8XLofpKKZcnqq7/W/p6FysF5akHckpKkSkXCTfhq
	H5AJ2wKzVBWU6lW45Juw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eN0-0000000F9Y8-2HwH;
	Fri, 18 Apr 2025 05:34:34 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMy-0000000F9Va-0TnA
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:33 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7399838db7fso1602836b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954471; x=1745559271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5/PDhz3AlgX3PPZzfN/Kg9kUFezGYCGeqp5UVya4gU=;
        b=nYgM58oCUZpj8mGjoTfcjOvhzuCTg9TpzdcqMQljtbrzMEuf1GGwoVFoJ/Taknqg91
         Jz8aTqZed0GEZ1AUdgfF63Lg2sM0tuEj/Gh8m5R5XpzArFdGDyDRlIbUZLuSA/hyCrhX
         2ou4ngDSE59gYkFSjeVnllXzw6CHIK6kDRUBnB63cNMZB6v9z+lz0zRiqXHvuD5OGeO6
         mLn2OwDR7S10CYyui3oJGjVEEsS8odh2gM5ss7ghhMuYPRQtmUr5nYwMwGSRvLNmrdwP
         Z4r9cR+tHVu9KNC2Y8e7VP7gMshQ5lJbkzYFjSDLUGe8CmbDOxuzCCcGahQ1ZNMhJwH2
         xxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954471; x=1745559271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5/PDhz3AlgX3PPZzfN/Kg9kUFezGYCGeqp5UVya4gU=;
        b=H7CAlDLHOcMmWZdJMOqM2HBYxGSDLxkKwxS0/8Re4al4ydxqpmkD2KSJZd3Gk+IP0I
         XuvV4Zwv+tkafQqarwuhizdbFNGPaZD1Dsug7jxjQIpJaOBTvRE8bWyWUey/G/yzPQ/n
         Y9Z/lLrEMFumEj2wo5NjiXeM7kYHtCOQWARwDBS86L/S2/L4XY9MSwr9xOBLI4DcbLkP
         koeMcYQq53fhG2IxeaUdkygUlSxYoOP8lPeet2+JMKpOEw9DpHmlV+uhg9qBdYynCCBW
         zVafwXxnhghH29tpaurDjD1lJKg2W1Ii03+dqRFdXK55eb2CWmyIJxc90NkISV+J874u
         xH7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4q8sHIPTvMGKponLxrW3UJBmQ1aHOU4zGBjVPCRvujZtBpjbCaRsrEr65ysrR8YyJdKYhgSFvHohMKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywovx4QY9p4GBSS6Vw6yDZirLGtrcr8JrUbf9Xaazi8PYeivQdI
	gGbdQxyBxdaR/RXAOajYtnzet0vhOnZG6Q9JL4PMUR206wBtC04gV2XTghymk7w=
X-Gm-Gg: ASbGncsAplA2SDIxWFlfuCwvxJ9ze4EOOqdMFNqANtj1QW53Iy9cygeyDczwwTBlRXs
	BKbvAmg423uliwoDXb2oDcbYt/CfmYuCazfuk+JaVhVjdjG8VsRs/OuCoexlqNYU4YEs2IThxIE
	TbmN3okIFgXooWXQJieohwNlCou/glBK2nmkuY5c7Q3+q0WGnWIYyM8IlEBWAEZg7Rvkxt2yPud
	uKlKs5Wu05R2HnpY8A5eSvNsGxkd11/IF/9d6teiWs4QXsgjz2rWWz+JsBKCC+Gv2az4m7a+PM9
	WjwcRCOSvUYD2WFd8WZAUgmBrgy+kbKL/I28UPIF+21rx5sepkuOVtFd7yRiBCA5r8QXvKuJa28
	+hR45LvYJ0BE=
X-Google-Smtp-Source: AGHT+IEvgHp/iuM5AJD/5ZHF+wg4U+RuhgPDEKuSLIEcrDWYUKCuRuyXlRuVUFNg8sIvdQmur1T+cw==
X-Received: by 2002:a05:6a00:23c6:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-73dbe52053dmr4292403b3a.5.1744954471081;
        Thu, 17 Apr 2025 22:34:31 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:30 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 07/12] riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 18 Apr 2025 13:32:34 +0800
Message-Id: <20250418053239.4351-8-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223432_150080_04AA497A 
X-CRM114-Status: UNSURE (   6.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Document the support for SiFive vendor extensions for
FP32-to-int8 Ranged Clip Instructions using
RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 16085b2ee64e..e15405e12239 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -349,3 +349,7 @@ The following keys are defined:
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
 	Instruction Extensions Specification.
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
+        vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
+	Clip Instructions Extensions Specification.
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
