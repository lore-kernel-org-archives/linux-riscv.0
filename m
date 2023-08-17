Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76F8C27C7A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 13:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=13pTUGozNQ6lFQuWIeeujFuZEUT32VyJ5YZRyP1Id5Q=; b=GWJqVcczCOBhjb
	XUIsOvJ3C/1nWQfjJEYdcoaOCNXsE3eqcbKIqgeJ228Pu0Q7m+q3EbPl69PoQlFZRbNgD7BwIvvXj
	+ib9MYRbaqFw+L3tQZiCF1Vh6Gbbc+hQe1cNdRcr/byTrBJyb5D1i2Mn/omATmimtmlKCzGF1GmnH
	ij4QaaZSEXnHiB5qPIe9A49keYg6t0BgkoYdIeu+p3arCFUcTux9sJByQ57ReE6e7JJqj7dJ/d44/
	fWMo7VSIIT8EM9nXpMdLwWLJdmQ63CqN24iENuC31I5jooGM7HVkQmWIMwtWs0Nto5Z5A8B/zTk8Q
	5YOACbHGFEtcU4Bnlp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcj2-006QfD-0M;
	Thu, 17 Aug 2023 13:07:44 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWciy-006Qe9-0a
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 13:07:42 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c4923195dso1039588366b.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 06:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692277657; x=1692882457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TI4WEo8JBa7BZd/mm79h4G4Y9fT6R4+52BHu8koh6+Q=;
        b=vB1JjgNnYRYIGaf7JSJrPw3vQhtSiLbPIiRuS8F+dMBz7l9Ezb280tjcdqTRNjUNS1
         vGwIXoPDvhsHyBc4tYUR4/X92hqFciBNxmRv5roV6Bw8PljdTqJ9WHDo7oj/AsVbxJjV
         /c8786uf4yTLw7cKhEXg9/PpGqdnh2rGBEucW8AosdbhckX6CQiZwkiKpf7tz0utrC+K
         7qDivPtPENr/tHMoDw9xdsdddwyaulCHlIJXAdRh3fdg0JW9/9FJmQJewpKrB0L0GhQU
         cMd1Q20z2zLldhY1SVLGQCF7VaTpvRD/VU2ae+nu2aeeiJg0Mpkbw4Of82cler629Mbm
         JY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692277657; x=1692882457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TI4WEo8JBa7BZd/mm79h4G4Y9fT6R4+52BHu8koh6+Q=;
        b=aH684JuTuQF5JBV8FlWCRxmk786Y5xk4I4buwTzK4SL2IKzkiCG3wKafVLYQTyUtzG
         eV0qv0/Kso8mFF7h2GDHu7CZSB9aTRmtdiym10I7lCSmQ9/zTn1ttTOt1sIa/LCMW1dz
         9ZK2UUIYMLI0zUxlXQyUMoApgiIc6e5YrZAXy91tN7QD/q+PTkQAPGqaNKiIbnRC0qZm
         ++5WFjkm2Gdn71xZq7vc4+HuMA79Y3dvOhkwK8XM6EsUMJgDVI2qHXhqJ+ReI1tkZ8l1
         KONQlvu8y/a9xMwSCV1kUgj1Wi1S9oDK/1tj1i9IU/wLkaZjyah+K3In2xC+74Wq8NTI
         PU4w==
X-Gm-Message-State: AOJu0Yz+rY8WdyJUZLxDcVRdirksBzBHCsjb5p4LEPNRyXahvs26M5bY
	u5gqx/Vo2GCu9yK0SMKEZI+xzA==
X-Google-Smtp-Source: AGHT+IEuOGz6Ic3C9ppPiDWIIRGMKEkWVcsX7LpLAMv38XoWrqVy0+63u/IO19hIcaWenrDygouLTw==
X-Received: by 2002:a17:906:3058:b0:99c:a23b:b4f4 with SMTP id d24-20020a170906305800b0099ca23bb4f4mr4019871ejd.2.1692277656978;
        Thu, 17 Aug 2023 06:07:36 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([77.205.22.0])
        by smtp.gmail.com with ESMTPSA id k8-20020a1709061c0800b0099d9b50d786sm6863021ejg.199.2023.08.17.06.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 06:07:36 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
Date: Thu, 17 Aug 2023 15:07:32 +0200
Message-Id: <20230817130734.10387-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_060740_239615_E68BFFCA 
X-CRM114-Status: GOOD (  10.74  )
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

The bootargs node is also added by the EFI stub in the function
update_fdt(), so add it to the table.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Song Shuai <songshuaishuai@tinylab.org>
---
- Changes in v5:
  * Rebase on top of docs-next

 Documentation/arch/arm/uefi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/uefi.rst b/Documentation/arch/arm/uefi.rst
index baebe688a006..2b7ad9bd7cd2 100644
--- a/Documentation/arch/arm/uefi.rst
+++ b/Documentation/arch/arm/uefi.rst
@@ -50,7 +50,7 @@ The stub populates the FDT /chosen node with (and the kernel scans for) the
 following parameters:
 
 ==========================  ======   ===========================================
-Name                        Size     Description
+Name                        Type     Description
 ==========================  ======   ===========================================
 linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
 
@@ -67,4 +67,6 @@ linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
 
 kaslr-seed                  64-bit   Entropy used to randomize the kernel image
                                      base address location.
+
+bootargs                    String   Kernel command line
 ==========================  ======   ===========================================
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
