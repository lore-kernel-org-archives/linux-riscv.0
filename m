Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8523CC6379F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 00:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sdJBepWFEWcGwBb+L/OdwrVihUwl+dy9M8oiK/dGNhA=; b=cBH4MBwwhf9anl
	/oZzm6Fsq7HAAWOx0FJABrZbT1zfH0zXmASM8LWnZJEY0mFG9xWbzThrAHonWk+nBx6i7j9+Tar9k
	ui8gNvZfDMfIIcdJpX+tuUL0P189isWXAl1iJmBdCgVyazkXMdOZphamL+kKMqx1L4cpRawrNkUN2
	J6u80nJeZefJfWzo0IG3l46sSE0MJ89Obi2dcPVAJ6JJqXiluvVczEx5S142ezVXGKNVYlWQzaVt3
	qRIqTLY7pm+Zf2SbMIWu6o38O/AxQtKoeA7Dj0vxR3bHwbAY2kQDJJAuDWYxBDWwnKWocBmZbB/r/
	HpGciQrh2C0kqWkbjm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjsm-00HVH9-Q3; Fri, 03 Feb 2023 00:24:48 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjsj-00HVF1-MP
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 00:24:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso3441392pjb.4
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 16:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=SB3t4JYlAA+oQwqCT5LpoHyIaEDURp+RoSvVL6kae9g=;
        b=2n48YPkTuhyHXe0YW0Ds4VydRRgd020EvcCgxUOEoX9auESQxDFbDEQI+uoGtWthR3
         eD2fJ3qFFjW26dABRbQLY/RGXiB/in/fdnvi+R5ObGdsV326Iki78n4Ki+6b1EAdXBzZ
         NFWjHHnkYiVZUxg0E3xYG5Cf2aXUakq3xB5w1+w+cEvIOvzKgE2p9I5ineASgCSGWKlN
         9+yypfSLiK2Aime6eC3usXfq2rEcgi1lnx3rI9qYqNOJzR9rJ/dBlXRF3LBGwv1HCCUJ
         nUueerwwLqWMJ9HbVDdWyE4MTJ+4j0l3mHNIofME/Z+2zX7YHTVfEAzBe1gE0e7Db8/Q
         8N6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SB3t4JYlAA+oQwqCT5LpoHyIaEDURp+RoSvVL6kae9g=;
        b=kWgUq1SoNGOMwILqTz0RhF0q52SHq3BENlBQ4agOw77OjZYHBm6BMcyzzXdzQ3rd0a
         mm7ingeC/kwGpM8TJdAoLv6qU8RzLOIvywWBi5ZcwG1g9tEQDaS1OqYIExApl07zWCXm
         gQ4Zwg0Q5IJNiM2fnKaoIJkv1a1TXs1TVGXWTzkvDleg/jDygKRZ9TPVZpHQuv/vZ7jH
         GWw303sW3IbHDWfdZKnjupvxQbvA79Q+k33SgVU+OD20TcQp+VjVJbE9e5YPwwuLbJ2d
         QUpcU2MI2vyFrfQX24ziMkGX8y0sOqd1X0LjWolnMhKuH597TGRaCmzmGipliIRQ3Fso
         QPqA==
X-Gm-Message-State: AO0yUKVsA5EVC9sP22PM+Le/hhQqsxgFIZuLVVActX7D/oRDW96f77mO
	KMr9JvHYLcZhm1YoUfcTLUKfYOb07ZrN/mBG
X-Google-Smtp-Source: AK7set9Y9mn51R4yC7bRoZ2oIxyzLwue+6e6T9z6k1E5uOMM2ZR9bjWs6hK0weXCLz/yZaZERwsNJQ==
X-Received: by 2002:a05:6a20:438c:b0:b8:42b0:1215 with SMTP id i12-20020a056a20438c00b000b842b01215mr9393673pzl.5.1675383882491;
        Thu, 02 Feb 2023 16:24:42 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id n4-20020a63b444000000b00478ca052819sm366487pgu.47.2023.02.02.16.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 16:24:42 -0800 (PST)
Subject: [PATCH] Documentation: RISC-V: Define Xlinuxs{s,m}aia
Date: Thu,  2 Feb 2023 16:12:01 -0800
Message-Id: <20230203001201.14770-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_162445_747767_74F3FE15 
X-CRM114-Status: GOOD (  11.95  )
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

The AIA specification was only partially frozen, but provides no way to
refer to the subset of behavior that has been frozen.  It seems like
there's not a whole lot of interest in the non-frozen behavior, so let's
just define an extension that only consists of the frozen behavior

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/extensions.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/riscv/extensions.rst

diff --git a/Documentation/riscv/extensions.rst b/Documentation/riscv/extensions.rst
new file mode 100644
index 000000000000..c12bd3780520
--- /dev/null
+++ b/Documentation/riscv/extensions.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Custom RISC-V Extensions
+========================
+
+* The `Xlinuxsmaia` and `Xlinuxssaia` extensions coorespond to the standard
+  `Smaia` and `Ssaia` extensions as defined by version 1.0-RC2 of the RISC-V
+  Advanced Interrupt Architecture (AIA) specification, with the difference that
+  chapters 5 (Duo-PLIC) and 9 (IOMMU Support for MSIs to Virtual Machines) do
+  not exist.
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
