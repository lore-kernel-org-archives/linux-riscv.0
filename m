Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8E7C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IJyHPtAQo9zi6jMQRifmhdWrMN6ousYKH/F45p3ZVGk=; b=hUlTSQS/ETn5f4
	Vn85mUy2aCytNN685oF2jZt5/B+Adol/dg2i1yEbCqskQ5Ko7vJ+YPn163q0NzN1jB0t0adCNzZBx
	ifeoK+fZ7Zvzucv0qPXggLjktU67llxf7lgfJ/7eYdUjE2kbvWAD/h6VUkhmoF8Y6LBnFT+Okjg0p
	pptWZGZR668w6wAu1jcHTVOce9dkurE4qm6EnOMX6T+e9x5tfabtoncr5yfVpmjs1iFc4g5xBKrzv
	uJ3/zlWcFkw4rLxTDJr8pYLlMbw8pr0LQ1YiqUZ2y6m+emerDTpoj2rms1GI1z7lzJU54oKW0R6qq
	PN9sF/52np2qtch8BXmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOIsu-007l2v-1M;
	Tue, 25 Jul 2023 14:19:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOIsr-007l21-2H
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 14:19:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc244d384so46878645e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690294768; x=1690899568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NuP7PfUWkHmNyDCiiBKijYVB5Ha6vR4zrSGdSILdtOY=;
        b=VobxKKfj3YlLkMovUBsPqivFLT1NQJ6OYhCHAqVTKo9GWx9ePkndLU6RA9fqyBnbX9
         0cEyorheLHBaC3FUSmD55JY9EoBsNwU8YGmrJ6nrSoqx25pRKblUqIhKmr6l4hoxs0Pi
         WpqUv23b/CbIvjtIA9NOhD8EuFNdCi4A+flYzcXovy3RJ4k1usDUx29HqclIi08ouCzR
         a/j6sfz0MvHe+JXGN/kO+kL3mbo2zUkUstTdjll1Jzo5fKn1G0fOR2aRjiddntLh6QhP
         Ga1awsWTGFVzQUVRckzNcjQap5cmvojdYtvXEyDUc6XbjB0MPUPoEMPcZvMOwzChtzNd
         sb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690294768; x=1690899568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NuP7PfUWkHmNyDCiiBKijYVB5Ha6vR4zrSGdSILdtOY=;
        b=WJxWVT7pc4bVutIff6jr/FyUA8xt1JfB4hhnstNXYhJEwQalNpkXbX9K7EZexO4Gci
         FhIITycOOOiXM6SQL0TJOF1QS7XbLW76+YQoPTuHhPixaHcdKRdIl+JUgtJwMKQVcFKR
         A4GeofuWYcSzljY5Tt1MrM9bTCwPy6WLjAPPm5Dahfhtj+VjKGsGfY9VAzo1eHZ3ZpCu
         y2TbwfLDXBWSz+2J23ru4KheCzfvCOTYnO2fTbU5Mb+HIgfD8ch5uj5d7wOUD4xBircw
         EyPFE/TZQ5cdt3XGTIuwnvmxIuepF6gLzSSfJ8GS8IF/htRfjQ/QWR61yDnBqJNdDPsZ
         TY5w==
X-Gm-Message-State: ABy/qLbwJhqZ4lxXNhA7wRrIWtW5jbdiPwvCH5GjFhbsiLgd9uq6VqLI
	PCIl3r91hqvhYtqbikJ5nPPGsQ==
X-Google-Smtp-Source: APBJJlEfIjpTWK3hKuGbaXC9p3pwmKCgC7ZtILnlK9IbfVHDNYwlUwlSUbRxcXQArkn+Q0EUY/j0KA==
X-Received: by 2002:adf:ed08:0:b0:317:634c:46e9 with SMTP id a8-20020adfed08000000b00317634c46e9mr4183117wro.43.1690294767655;
        Tue, 25 Jul 2023 07:19:27 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a17-20020adffad1000000b003143cdc5949sm16619297wrs.9.2023.07.25.07.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 07:19:27 -0700 (PDT)
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
Subject: [PATCH v6 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
Date: Tue, 25 Jul 2023 16:19:23 +0200
Message-Id: <20230725141926.823153-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_071929_745271_B5785AFE 
X-CRM114-Status: GOOD (  11.32  )
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
