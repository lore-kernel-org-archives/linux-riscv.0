Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB53EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+6TWnHrjBLJvdHCHtUNWc/fl+pFPvIlNwMt52I5a8g=; b=zSpXkrZNrYjXsC
	mTDg/HTEQDZk6WNLo87h5r83WVP/s7Gw8kOp03O44cv+lMn2W/hapOk8VUWzXwwgehQ+4Lop1Bt4Q
	sscx7uccPX1OzpceJu/y/nN4OTJuL+Yhym35wFVxaHpnj9Ct1PhBXaNK/Dp5hngzBJmWGkN23rp7w
	WtoHsT4EhFoKEfB0mNW8OUm7XUv1Lq0Pya9FKs4pZpIiAJPdqfPH5zYcxvm1TE1JjgB5sC01Brttr
	wNwAE3vmFcJ8LHW8QZZyx5q1mpcxv7Ta+HjgysJPkHpl8E1Dpe4bqjUVp8wa5OycxGEjnFlbqiLtB
	tI7nj2tsMoSTwlnIbDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNAvA-00Gayn-2g;
	Sat, 22 Jul 2023 11:37:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNAv7-00Gaxp-2x
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 11:37:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31716932093so2045866f8f.3
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 04:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690025826; x=1690630626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dia79abijhqNuyOI1X7cuUqq5ei10OSh1lyxFY8ZqEI=;
        b=gFee1fF2iHGRz/47PvRpgdT+WGD2XMVbRI8srdPWpV/H/ekYNozwb9X2w7LVg1vhqJ
         dJhrqklruLlhNCN9gBDAU0H1z3leeaE+LMDwDyXzMIvQBbqQs2yqQpqSb3wtDy/Vhu4C
         wPeyOXc4bW50dYHy2+gn9P0XAT9YoOfoFyEo33miDMeQZbfIVrqoqInBJEbGD4UxPbqf
         S/3gIVuW5No5OH8wZE2MwF0L8GweSWBRAp+rFhmLLi/ymXv5NKZ1C1FOwVOyi1VQ/P4E
         34BJHPg2i0pWbYC8Fa9RfQUcOaqipWJCDB2TPdtLBxNakWNze1BE2ThgCD3uk3x/b4jx
         RqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690025826; x=1690630626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dia79abijhqNuyOI1X7cuUqq5ei10OSh1lyxFY8ZqEI=;
        b=Mw2KKN6kqIJf+DbtvQpbIKTx321AxT3m1VPIr2KTWPHZWFGzpdqngiIDSMaZ9zm28Y
         JQl90FHTiti4XATbTNX/+xpqjDZMJ2Kt94om3Su7UtxyQJMW4KZk+0VYbPEZVlbPNO+z
         SaX9YsYMqyJzT51yj47n/fIjah5ity+3wfl8VOXGjU1X2Iwbt89XaDt2cegqKJpIbSp6
         oFSVLqvN2fS58etZ+I3S6ma3PwwtC2mS2UGqGUkHyxCubdIWbJpUk/zBef/oRPo0QN/F
         s0Qu86Wmltl2yNM3+4HaITa61NrpxWgZGgrqqVFgvL3YF3Pj0mJXeNh9JwnEQRdifhjn
         C5fw==
X-Gm-Message-State: ABy/qLZdQKtNBKm6SGz3AFA/+x4VQro1DjbvwLP9U0MWGKruN08tci3K
	YraJtHlblh25LZIwoNbOu33VSw==
X-Google-Smtp-Source: APBJJlHdUFYwWBgP9YwVZejWD0BEkyDQp4m0NFOwqwPjXSpnUNHV74dw2XItoce9Xsv4xVzhgDkR1A==
X-Received: by 2002:adf:f3c5:0:b0:314:32b6:af3 with SMTP id g5-20020adff3c5000000b0031432b60af3mr2740008wrp.5.1690025825975;
        Sat, 22 Jul 2023 04:37:05 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c16-20020adfe750000000b0030fb828511csm6728788wrn.100.2023.07.22.04.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 04:37:05 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
Date: Sat, 22 Jul 2023 13:34:45 +0200
Message-Id: <20230722113445.630714-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230722113445.630714-1-alexghiti@rivosinc.com>
References: <20230722113445.630714-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_043709_953701_75B0E93A 
X-CRM114-Status: GOOD (  14.46  )
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
