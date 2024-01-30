Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8D7C48285
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 19:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgOUVfq535+3Y+h5gNRpdRsPxWmyxZ1sOk75AbyqDKA=; b=P5pU20U7QcB7Ly
	ElQ3D7iJLcG2/47OAZG3YNXVCpG9SDL216g6nN7+RHoD5oGtRDX8QdC3zQZYY3U4sJA5gSTX+mSSb
	x2851EbPJs1bIA3APB1L0J93JeP0jUKUwOIV4LG06egWHV+2rL12UHAGN/hiH6wFAsH3lUhqe/c92
	YF2Hq83/ZC04ZCJPbBbbg8FfX9g7UQzPbiVJOXkg26pcK1AQKO7vgTbLiPSlCSK5fS2lXHlVeZDor
	iXTXK6h96CIAni+yaFqqV6fA2F8ywxq+XTWBihmTUQZ35m483fAhySMNNxJLjQtDpXJOuCzYeqKsI
	eE1UlxGueWC7GpRmnGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUtPc-00000000GcT-2oy2;
	Tue, 30 Jan 2024 19:04:48 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUtPS-00000000GTg-46xM
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 19:04:40 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d8e7df6abcso15164455ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 11:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706641476; x=1707246276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGh1y1t0UhB5LcXiFRn0m1YgEny22RmTe/CDN12WiLQ=;
        b=sjm99lQR5qoyrQCmEnjytshF3krufMqG5rT3BIOWuqowzxOjl9hws/fiGzS8tXAP5L
         Dz72dFzQZUwtLQKMhtjKnZysoSoD9hY8+awZy8mR9Xdo+ibMoM1Jj/sA5gJbrA01iQq7
         txg5WtW3oJUKRE0OJ32qLNluQV3n5VsmhtYBMbtfF9c8cZ9pcghspJj8G6VMRwCYlU1U
         +CRxQIxa2h+O49TiPY3BXTGCxFcZB5eaWK3sHXaHfMZ2B04NQT/oZpO758p2OFujHJY7
         azi2zVdOTmTwdyWSommPzCopjKpJTf1gzBPltadkJbxOlQR/JE00BFbOu1164xKkc4H4
         KOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706641476; x=1707246276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGh1y1t0UhB5LcXiFRn0m1YgEny22RmTe/CDN12WiLQ=;
        b=qUVVM6TAj6UaVeXy13rzssgrJpG00JeWV3jECkl+cHttKOHaSxGgHYFGFN54QZEHtI
         Pjj8O31ae2bNzRRQmpkevlofj5K8BDTIxUZ/j0XSPkdxjPXyoK9slIRR1h/jkPa/o3/A
         n9bit5ZgPoCrtCppt+0oeDzK9uxdHj9w2a0vor5mUiDgVQpEbSTCd+1OfZTheIyOUVit
         NnPLrZJER1WddmIfHQpOsAZ1jSAkKLV1Vx0edj6lN7ltYiTdIF5MlQXSP2mnvepK3WxL
         YRWqoQI86Ya4FLm/OL5f87iq0XM7xMZsNF2MJXOF3kf4t3Ir2dogfviyKa3ux8C7tH2f
         Z1EQ==
X-Gm-Message-State: AOJu0YwJpnZoikhPQUKEbmhEJUzbwu0tj59LC1HAX5Ct84sCVM2tSqtN
	DRMe9Z9Ib92IQFJHyHfyv91VCrtOchDnrhH9m5RcnameNKVEWqmZG/CrFzLQUVk=
X-Google-Smtp-Source: AGHT+IEVbIgYt6XNaKR6BtdW5/KffpCVH/pv+Lo7pyQOi/0UoKVRKbnu4oD2c+g6OjEIw8FcF7U3LQ==
X-Received: by 2002:a17:90a:3dc3:b0:290:6878:db67 with SMTP id i61-20020a17090a3dc300b002906878db67mr5117026pjc.9.1706641476461;
        Tue, 30 Jan 2024 11:04:36 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f6-20020a17090aec8600b00295c3bb9318sm1196541pjy.54.2024.01.30.11.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:04:35 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 30 Jan 2024 11:04:32 -0800
Subject: [PATCH v2 3/3] docs: riscv: Define behavior of mmap
MIME-Version: 1.0
Message-Id: <20240130-use_mmap_hint_address-v2-3-f34ebfd33053@rivosinc.com>
References: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
In-Reply-To: <20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706641471; l=1848;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2lxtSNzBMdkYqwC90W41TvLPqjzE8CkjIf8iMq/P7L4=;
 b=94N9u6Dy7xw5qCDQS+0vjMBDMNCSUN+BRd4o21tz6vC6lNovWVUFsgXKvGka/gJHpv0qpikoL
 uaW/c0J2VbkCXqP7svfJ7tYuinSlvY7wIe5t7X3qvAN/WmnM2V6JlUj
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_110439_060135_685DB3B9 
X-CRM114-Status: GOOD (  12.94  )
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
