Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304DBEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 07:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++kXoMHzVvMpkrZHbd7NgMk2gRE0oFDOq0Dps6XezDY=; b=pMdMM1fQCqYCQn
	NUqEUXhDyg2TrdnxUfgozWxUnE6/fdWp80pjZpOBvc1panNMm8EJX3/R1/71+hhPXDpyZ91TPd1XI
	W7jxwhUjnyCdoEaFFOwsSjtxzDYDsnnjZACq7G1YX2CbdlHbHp19EK/oemhC03r6AQIgHUI6ePZSg
	i64eOOlEd9icM6ZuPROnA/kd3xltlxuonTzDbakq3SvgbstMOQl/nsSA1egQ+yMkfMkJ0sDzJ+r7T
	UE6ROjPiIwo1aSNaisnjwNQAOkblHSiyxuVPA6uAhiXN064IogWNr/t4KFZxC6/qSSo8CSFYcro8k
	xl+akZ6rUuM+GBjCNegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsCq-00DXaR-24;
	Wed, 21 Jun 2023 07:24:44 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsCo-00DXYz-0R
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 07:24:43 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f9b258f3d8so25149115e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 00:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687332280; x=1689924280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQDRIqOL25lhh2vW3phUacbtXDC/Hgmm9aSu83e6n78=;
        b=x1xZiuScOCs29m4m9pPxoAs5kRoFSS8kxXOiTaBfJ84sHlZ9664m08lrFjOAnyDA4r
         GluBnz5W9XdgDQlJieE05espwRJ5BGtnyYHjFfqLuhWKNHyQE1V2OdOEs4WGtJhkdYyn
         E+6c9H8DAwTdQPWh30EDyF57rZuBbWHtfrXwoSV4LKYvcueXWpyMmAdPQmF0MEGZYr5e
         9YckhhDptG8R6YxttjX08SH+x19OGMv610eFAoRiuDeCaW0qu+1iANLvc61fDTNQPY6e
         JNNWraib49EaorsHJkrKw0gA+RDawGSsyjhtJJxTtvJtamcBuDPdHPuURmVMCHTQR8jW
         oPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332280; x=1689924280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQDRIqOL25lhh2vW3phUacbtXDC/Hgmm9aSu83e6n78=;
        b=fC5U1p9nJ7t4QIgWRl168rTRKmk57BNhInZLXNycaflIjTyXzrR4o7PQjw3FT3ebdR
         UZxlgSeTHgdKoI003t/k/dMwxPfgL9iOucEgT35tJROYB/6U/Fmy/oE2q466xCl0dRWQ
         RAV3r8oULTt4HFt4g1QRIcY4/1QqhKzwnhgqpgoQhUBQI+1UZy5/1kDQZvnr1LTi7qej
         f29zjW4IG5hS9kIEiHqxeckryJD0Lb1Kjixphtsq1Zm3YGvg0AucIHAkoT67bsM6PGZe
         me3gVBY2gHX2p22qooRF8iOTafyunwKWgIBgRkxDXYNCIry9mf3pCGaGmlFi+EMCOsxY
         QMjg==
X-Gm-Message-State: AC+VfDwPZKSUHaNnvsCaEGb5ITXmiMxR09941rpe3198xzO6PaIR7K1z
	5Rhz5JYxF+/GEocQvQkn+6ktag==
X-Google-Smtp-Source: ACHHUZ4dJReKgFWz4Rz1T/e3oc9QKQiJxhIA69ZtlRzSniyGxM7KjXFjlMVaX3q3cDTgs0tucWV0Iw==
X-Received: by 2002:a05:600c:ad2:b0:3f9:bb86:bdd3 with SMTP id c18-20020a05600c0ad200b003f9bb86bdd3mr1606118wmr.7.1687332280108;
        Wed, 21 Jun 2023 00:24:40 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c210f00b003f18b942338sm4181118wml.3.2023.06.21.00.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:24:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Song Shuai <songshuaishuai@tinylab.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
Date: Wed, 21 Jun 2023 09:22:34 +0200
Message-Id: <20230621072234.9900-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621072234.9900-1-alexghiti@rivosinc.com>
References: <20230621072234.9900-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_002442_172160_02A78831 
X-CRM114-Status: GOOD (  14.70  )
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

The EFI stub is supported on RISC-V so update the documentation that
explains how the boot image header was reused to support it.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/riscv/boot-image-header.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/riscv/boot-image-header.rst b/Documentation/riscv/boot-image-header.rst
index a4a45310c4c4..df2ffc173e80 100644
--- a/Documentation/riscv/boot-image-header.rst
+++ b/Documentation/riscv/boot-image-header.rst
@@ -28,11 +28,11 @@ header in future.
 Notes
 =====
 
-- This header can also be reused to support EFI stub for RISC-V in future. EFI
-  specification needs PE/COFF image header in the beginning of the kernel image
-  in order to load it as an EFI application. In order to support EFI stub,
-  code0 should be replaced with "MZ" magic string and res3(at offset 0x3c) should
-  point to the rest of the PE/COFF header.
+- This header is also reused to support EFI stub for RISC-V. EFI specification
+  needs PE/COFF image header in the beginning of the kernel image in order to
+  load it as an EFI application. In order to support EFI stub, code0 is replaced
+  with "MZ" magic string and res3(at offset 0x3c) points to the rest of the
+  PE/COFF header.
 
 - version field indicate header version number
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
