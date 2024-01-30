Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33ECC48286
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 00:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgOUVfq535+3Y+h5gNRpdRsPxWmyxZ1sOk75AbyqDKA=; b=nT+zYCOdzHmrDM
	6LPjRPiKpgJVv3vOCxRuUdL2wiEFzstTj3hb+C6kYOOnKw8nHBsOiCLul17EI6glcYbWuupeltWo8
	ocjbrv366nTNY/CD4NJvU0WBZ1bGTM1wS6FYypIS2zGxWGZ2FoCn37zvEqAow7IyUPWYSXUVXQpBy
	PWCQzzHjZWdCqOMfoTq2+KlLxPCyekGL+7nxSfCLDWPhrYoNJ/Dx3oevSVsSk6zze0kVY+oTZL1Qn
	UheJ5R/ArV7INM9BT8P/Gwy0YhSGzvrYts5DEVA1Q576i7dNsyDFQcoQqU7tPS3T6rkHYx0ydudxv
	nTPowwW9t78q9sjROETg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUc7o-0000000EiIC-30rG;
	Tue, 30 Jan 2024 00:37:16 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUc7i-0000000EiC4-0X4Q
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 00:37:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d8f3acc758so7606005ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 16:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706575027; x=1707179827; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGh1y1t0UhB5LcXiFRn0m1YgEny22RmTe/CDN12WiLQ=;
        b=NQGmZxeg+t28mF7uCBeZK6YWeiaG4gt4VMGK/ODoJBHX8yMkeikOCQM5rYsxWW5TO3
         2D26udlyw9lq37d1qvEKpsC0Bf/KBdoGISDvNVZEQwsaBd6uX9C/RZ3Xw7TlFfnqdvMn
         vICpFtAaTMV77JsApbKE42LSZdIzUHs3B1DrititLHhsRgTxD83aCVfCNvK2yhmaK2HP
         OZOL5MRviQ06ezgvgYJdmrgmPlC1Rj7/IL0LihshGZEzs0xcesZzHnzxNdwvk+Optz5F
         GL3GJHbxcZZg83rjshHOFck7htSqo3+CaWhuQrAbdRO7ymUSLHOStPVrbgjMdjccKJ0+
         cHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706575027; x=1707179827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGh1y1t0UhB5LcXiFRn0m1YgEny22RmTe/CDN12WiLQ=;
        b=QIKulLXy1P8NlCMVbxTjIhydhTsq8Go6o/pr85YDK+I2vO3DsEeQjeWLIJBoSIYVrk
         tjhrd21+GhBqrFZEC0i1dUb9GsbogkCUm3nt7eMvcJKL+C1lNSDEO3cFRbM5/HWc9uEG
         usm3wRDwFtJJuSPaOMACeufPSxyy/j0/pfvHI8NwPclH2GDg/UP1IaNQWQBRC0ZLrDY8
         WZSRUIrLlxH2QmkSCHJfnFats6/z+W7ZkPNNz79KXYfm5JXlk8j0ZE/eVAv4Ddx5IrXi
         m2mlYvKg63hTLYvLdYMc+G2oYkvSkJEA88DS5DCfl++nG1rN94+ET3mQarcp4BGWwhq4
         ROEw==
X-Gm-Message-State: AOJu0Yy7RwkKug585+aiiVJhCNEK2/OZ6Ioec3CribqQTlSxZx5qYCJt
	5mdT3d7LeCRJ7nVUh1QBhC9+DGvV4pjwy2GHl7pdNY/RBDH/EG/AHLcR0Z+P0a8=
X-Google-Smtp-Source: AGHT+IEZTlAiKexgxrGNCFYzK32fVsyUnQnSz1N1sNMTNGu+/cbpp6v2t6ZHXRA/nQr6fDW9mLkUwQ==
X-Received: by 2002:a17:902:aa85:b0:1d7:c27:2d3c with SMTP id d5-20020a170902aa8500b001d70c272d3cmr167643plr.6.1706575026971;
        Mon, 29 Jan 2024 16:37:06 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id jb9-20020a170903258900b001d8ca3f5e3fsm3406375plb.295.2024.01.29.16.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 16:37:06 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 29 Jan 2024 16:37:02 -0800
Subject: [PATCH 3/3] docs: riscv: Define behavior of mmap
MIME-Version: 1.0
Message-Id: <20240129-use_mmap_hint_address-v1-3-4c74da813ba1@rivosinc.com>
References: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
In-Reply-To: <20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706575021; l=1848;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2lxtSNzBMdkYqwC90W41TvLPqjzE8CkjIf8iMq/P7L4=;
 b=QPhNUZqLeF06ra6K2PNPRoG2n2KtsSvNFDvTmTdvBMXOdHUuJmeRUi0njObakAeeuV1OfWo9q
 etNa+1gFzv1ASKXjUaBTpqtMsyWVZXNQhlsEPcntfZJU7CZKds0vnLR
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_163710_339318_ED27FDD2 
X-CRM114-Status: GOOD (  12.44  )
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

Define mmap on riscv to not provide an address that uses more bits than
the hint address, if provided.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/vm-layout.rst | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index 69ff6da1dbf8..e476b4386bd9 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -144,14 +144,8 @@ passing 0 into the hint address parameter of mmap. On CPUs with an address space
 smaller than sv48, the CPU maximum supported address space will be the default.
 
 Software can "opt-in" to receiving VAs from another VA space by providing
-a hint address to mmap. A hint address passed to mmap will cause the largest
-address space that fits entirely into the hint to be used, unless there is no
-space left in the address space. If there is no space available in the requested
-address space, an address in the next smallest available address space will be
-returned.
-
-For example, in order to obtain 48-bit VA space, a hint address greater than
-:code:`1 << 47` must be provided. Note that this is 47 due to sv48 userspace
-ending at :code:`1 << 47` and the addresses beyond this are reserved for the
-kernel. Similarly, to obtain 57-bit VA space addresses, a hint address greater
-than or equal to :code:`1 << 56` must be provided.
+a hint address to mmap. When a hint address is passed to mmap, the returned
+address will never use more bits than the hint address. For example, if a hint
+address of `1 << 40` is passed to mmap, a valid returned address will never use
+bits 41 through 63. If no mappable addresses are available in that range, mmap
+will return `MAP_FAILED`.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
