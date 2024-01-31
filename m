Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571FEC47DDB
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 01:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgOUVfq535+3Y+h5gNRpdRsPxWmyxZ1sOk75AbyqDKA=; b=Sj67LguxDnT8xq
	e5jA7nvVxZ9QoO6b5IhGebN1qd+BGLDn6ZaDdp1iqCj1VSuQz9cLrBwT6fgqE21CIWWsngMzj2UNz
	+/+Bx7amYylaNCit5+dwwmHM6mUzIRGgx4YN6fZwJsF/n9w9F5lE4ZzgHiujoSqsOv9dX7tIH3gYJ
	jymLRwscALKZLsTXYmy39ifv6N2HwMVpS00Ke4u7U//lpJjC1cEo9mtkPRyefQMItfxQZbsu1WHn2
	ngVmPHsB1N8yrThRXweN2wPN2bLYjo8hZRegQwKM3ll1/z16Xt0CyJAlpV6s3o3XdEuh/dImQxDli
	t+dawy/PoZcDJ4Km5KOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUz4R-000000016Pr-1CLV;
	Wed, 31 Jan 2024 01:07:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUz4I-000000016Ic-3C19
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 01:07:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d780a392fdso33961335ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 17:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706663228; x=1707268028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGh1y1t0UhB5LcXiFRn0m1YgEny22RmTe/CDN12WiLQ=;
        b=zux7HB4qJE/U9mnaBC/HBNwJwGDDsJH2sJHwjnY3FtOXgGw049FnXx0EX0Kv7BcqAl
         Y36+GZE1Uy5clfLdzMGrOc41brbnv8Noi6u6lB3kJl4poUPAHGV9Lsd4HJmzTO7pnv9d
         303wnExbcRDKgmFFIqHCIeMcUL6Iw9LgqW1Z5mymObyg90VlDw1bzOvPrTjPN7uk5IXa
         nkEfVxJx0+kDZXqp20L/d0Up2DZ/jaQY8eC/ARbRC3qr7hPTieFk57UgEGj8cIvxgieQ
         jcCXv448JyvVsgwAmetj/rrO+NqikwKSIrPbH7621b567jcXI++/EeDeZJT3FuyoyA0t
         7oZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706663228; x=1707268028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGh1y1t0UhB5LcXiFRn0m1YgEny22RmTe/CDN12WiLQ=;
        b=qziQLPR/OWTP7ZBPrt/fOlry/4tJ03gl29t+NtGrwyaSDdqzJVBgf2E6Cp4i6Eh1/U
         ty9sD1dEJWnJU3D1q9cDHEjtcYePPF8WMObhoa+4VUxGmdjGGqAClO9wqvOPJRvnn34N
         nEsAJdXYYoLaONX6QureZwrXupbXBwYzoEEHyAIKF5CNIh5XAEkps5PH5ZHy0ZkiaYj1
         gByFPr9zBLFmlpKEBAFGCJFakdIM0j6UY0pkkJDu6bXSRPaJzNtwAW3UPmjE0/x2uRON
         E23X7IMZgdVggUvWYeuoyIEu2QFHa/6RRC78nk61RO83XiZnRGANJFchZHka7nKxDjbj
         uy8g==
X-Gm-Message-State: AOJu0YzYnaqQpENBsSF3/BenfVQB4M3itEukOJ2/kk33FTUOkAiPj42+
	U2LuXUagbmNBwY/lP2+69e0wCo0veKtLVphE6D2x8NiSz6/i9aRE/djtBvoa5j4=
X-Google-Smtp-Source: AGHT+IEmbM/VilqQzN+bDSe1zgWZkRRaNPdWi6aSgLeBxKervvgWyww593Ha65RTd+Oj6JpwZn8mJA==
X-Received: by 2002:a17:902:ed94:b0:1d7:310e:1e0d with SMTP id e20-20020a170902ed9400b001d7310e1e0dmr263865plj.32.1706663228198;
        Tue, 30 Jan 2024 17:07:08 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r12-20020a170903410c00b001d8d3c276c4sm4970822pld.35.2024.01.30.17.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 17:07:07 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 30 Jan 2024 17:07:02 -0800
Subject: [PATCH v3 3/3] docs: riscv: Define behavior of mmap
MIME-Version: 1.0
Message-Id: <20240130-use_mmap_hint_address-v3-3-8a655cfa8bcb@rivosinc.com>
References: <20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com>
In-Reply-To: <20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706663222; l=1848;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2lxtSNzBMdkYqwC90W41TvLPqjzE8CkjIf8iMq/P7L4=;
 b=VULcNJMPaGSSibunnHmdY8O6pSGdUfVoHdHqVkSZ/6IDh4hPdQyOg/2Va726eHw2pMLSxc0cG
 87Fixe/YDGPCXhl08WlTq3vxGBa82+KW2s0J79eiJ6OVp8GW8Fgr/ii
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_170710_818231_5EC3272A 
X-CRM114-Status: GOOD (  12.87  )
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
