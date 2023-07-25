Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91456C001DE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06WAkuaTXkrRQbXW+hpIQcNMHfBCccz0ctxRdrTZ6b0=; b=IZd2u+D5MyIQUO
	0ypv9FtBAGI5wqMCoPVbcE2dozyR3SJo9WlqPnIhNApmfbpkMbjOJjtMij9tzpqpABZ3AWdGH0Uy9
	nzQLjCGuwRmON7A8Ou3ZmvdnZWIrkDrOb82Dp4suEWyoaTMTuHnF5JUKVW2unjDhODp0rItVUPaNL
	LdFpryes7sdf6Orh083aOUjTR1PxVAno3O67xevyN569oI5ZYmnheTLDGRre0MQ75p8bIdNx2aBQg
	YDebwJGqU0MbkgTvZ4goG7PmMtw9PjDkNuMYQeNrHgUe5ibHQDxuPbTiDY7A/tBI53/tuLcdTu5l9
	Uu+jCE0d/ZE0Z/YKF+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOIus-007lQn-2G;
	Tue, 25 Jul 2023 14:21:34 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOIuq-007lQ0-01
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 14:21:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3175d5ca8dbso2032120f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 07:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690294890; x=1690899690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UwYYe6ucZvdBvqF8iQhg0hDnshi1xav4hUdpbdxiqw=;
        b=WbIR7n/yzc9VAozw8Sk+VSB2504MVtOdu1vnFMj5noYjek5szstVImCB0Qp6a7sqFz
         Gz1gOgq/xvFNwR6NQej4DgG6nd0XEbv7N3vBqNr4x74ijnVGuP6dp2xAnyb09iyks1TD
         U3hriTLler5E7fm9b3s9X5Pv4EUZBMV+gFxGRvGwNfHZyV9OSzwvCZH1U0E6XOZvuUqY
         p07D4iEfPMttDvKhK+zGj8L1eAcWLj/Q3iN5wQ36akJ38bS8XiId2FJF9QSZk+K+/BxR
         fR8/8EV1BgMPvCEA5uZCfxHxHjuyY1xOUxXk1NtodoYq/XT1SGJTBfJWvqEg23Om2VK+
         P3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690294890; x=1690899690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UwYYe6ucZvdBvqF8iQhg0hDnshi1xav4hUdpbdxiqw=;
        b=WIZZ6MitJ4NdaG1IRNp3w2iUDFMurIgyxTxeR8jkSqWa/2u9aC4y9wDQDgQc1n3JgT
         HZaP64jOaaPqHPsFnfB2tMPcQT5sBXeYO+9zd8CdBSQAcAXMul5w0XnZkgMVDfEiMsih
         /e+anFEhuljG1BZ1UhCJv7dprEKnKVAr1GediSU58GI2OKB8LYFznPLmn2Yef6E7E4um
         kj9lIDnnFGJG6wNU5fRmG0VzaV5sBfazWRQ1HTPIaEDxsHfttDsf6JF0kJKzxNzVcuBB
         vibWrT6Uc7zmfKI4Gcf3liVTeqIU/oX/Ahcq3WNkVxE3OmpGZwd7FpwxSm8OvDusnF1M
         RldQ==
X-Gm-Message-State: ABy/qLa1G+G7q/6UdwvU/QeESMsdLqYhYFUT3JMWp3bS64D4h04yJPRM
	eBQDwkGmPg0wmdgZExqqZX5Knw==
X-Google-Smtp-Source: APBJJlHTPdf8WSeLzfqvdw+Iv3zNCwUMRolvKBj5Y5BArZHknPJjzTL9f7IYaGzso0TGmRYunEA55Q==
X-Received: by 2002:a5d:45c1:0:b0:313:ee5b:d4bc with SMTP id b1-20020a5d45c1000000b00313ee5bd4bcmr9304252wrs.5.1690294889769;
        Tue, 25 Jul 2023 07:21:29 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x10-20020adff0ca000000b00314367cf43asm16503568wro.106.2023.07.25.07.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 07:21:29 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
Date: Tue, 25 Jul 2023 16:19:25 +0200
Message-Id: <20230725141926.823153-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230725141926.823153-1-alexghiti@rivosinc.com>
References: <20230725141926.823153-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_072132_040133_FCF3F20C 
X-CRM114-Status: GOOD (  15.35  )
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
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---

- Changes in v5:
  * Rebase on top of docs-next

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
