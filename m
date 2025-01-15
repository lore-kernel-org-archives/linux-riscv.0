Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3DCE77188
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 02:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lQ1uhsuPwsMRH7fPLKOOTPfQNakKJuyexi14EfitXLY=; b=Yk+R50WwFIQVdC
	HIplYEX9bFljV1B8DpInN2WuV22nwfTcy1x7hDU0h/Os9qz7/DrbYktA7AAFgMWAnXLsB3Uini/4p
	x7PILOboL8U13tqy23s7Y7fggYrKLXN88yRP/EV2wM0epDdXiFvKr5hH+uRIIoMbfHY+ABPZ4aWml
	GvG3QSQRrNQ+9KiP4KVBS0pHXXyyMrI1mTAWzMjxmLurID8U8ryQLnUmpE9T3Qt1We6i0nKUKY0pa
	YYiHu4gtMaVU8eOB0ITRy4ewjnN28jjE7AzUxW/8zlA1T53IuyBqFqD1vILfscfp3cktGv37BpVnQ
	4zv65+Gg4c0x3evlpvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtKw-0000000AQom-2vtj;
	Wed, 15 Jan 2025 02:40:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtKu-0000000AQoK-2XcF
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 02:40:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21636268e43so145817285ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 18:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736908851; x=1737513651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KiILRyRfHo+NUtJXMbpq128gxB2UW/YGfDj3MyZiOVE=;
        b=bC/DW6c+oqHmoGK5eaYL61zPxWzKWHMsfWc8OpgjN7Vt40pmqZHV1ziw33DQeskddK
         5hKUiIGjpGSGkrzrgwGKaliIil3WHazlDMYNEUZ1EUpIHQhHU4lYhPz+YA+DB/hT+L8j
         86T8dzpVvl8vH1QoWvK47SnwH4QTOelSpEDUtZdad/rwUgr1amwQPBcPd8qgkoDiFaDn
         F3IjMYgKMsTtnuZ8YpqgYGWi274pq92HJQMgu3LKM706EBk4i16reLz/wGYB3ROo63CC
         gBLE8KkDx9taroci2JL3OafctxfzgcJijwoION5ii3QTaMdgQMiKQyjJdlJIEGMAxbHF
         4ppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736908851; x=1737513651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiILRyRfHo+NUtJXMbpq128gxB2UW/YGfDj3MyZiOVE=;
        b=n7obPnCyIMnYilo3Dugh4Ry7s7fTgTZf6+ZUh4vQHi4EsGzi1cvQpHvEJLhwx0PNqS
         f5uVk4bd+8E9GGPCTuny6J+Bal08Owutbmp4UZl8MgmteOE7vmVFD/EwlsH5ddMmKbIs
         HjgH33Dw1Oee8zsavyOQoKMC5nBsIkjvqFOdB5EvCQXxMjVWqrSkYjSugzTejuvXMiGB
         G6ATio+dsCHpu5uPV8uOCc/yLQ/ptoX9ykraR01HCh4dwrf/y/JThWl1i0zw1C4kDvdD
         3dQOyjBs8uS15NECrQscXawsB7pc6JskAAYKMYf2EBI/Zu5yvz13NXZv9EdyxyI4vZCp
         m45Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTZUEaAMwL22nzrqR/1UUzn0ujiCMmHx5Hjx5s/P0aCOCYKeMepcFs62TANS6TVXqHX76Uk/mE5FBlWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKmXDq/npl0Mquu+YpqrDrwe2wAaudtYkH1vlORxnqnAJSLtkE
	uWWkRlh5gJocPcPklIpCztBU/84KrfwTDHfhQsgIj12NzI72XuhZyBkAi5PCQNs=
X-Gm-Gg: ASbGnctUjzHIIxzYCE1mfPsCyjtLDuDwvyAb4elQrCKyCwFkXYv4VPHLWSigAd9MbEn
	Mq9OS+dtNpyU4dC1PbCKi7TNKPmak6YWSLk0JSOTX4//z4g9V973GEDZ6GpRAnYGpMe+d8D8UYl
	54myd7KDhW7LJDnXZY2LHUli/lNLDlLREhNUBsfVHiE9k0nlWGEaEErYEStltQbqZWGXe+bSron
	RUC1U0GjHPSXPb82J+Z6G6/EjgviGrtHCZJofTs/U0DZdawmpUmlgfNc+anNeyI43as7EKOsejq
	kFSlNaFuRjIMzgs=
X-Google-Smtp-Source: AGHT+IFAimWtf2lTBvrnqOrM8muizhicRypBcekevc3BNNeuhbcAjrIt4O9niFCSSQRXVpLXyqpbPg==
X-Received: by 2002:a05:6a00:6f4a:b0:72d:3861:895c with SMTP id d2e1a72fcca58-72d38618af0mr34186945b3a.8.1736908850691;
        Tue, 14 Jan 2025 18:40:50 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40680e67sm8321841b3a.139.2025.01.14.18.40.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 18:40:50 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v5 0/3] Enable Zicbom in usermode
Date: Wed, 15 Jan 2025 10:40:21 +0800
Message-Id: <20250115024024.84365-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_184052_648972_4AB55BA9 
X-CRM114-Status: UNSURE (   5.76  )
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

v1/v2:
There is only the first patch: RISC-V: Enable cbo.clean/flush in usermode,
which mainly removes the enabling of cbo.inval in user mode.

v3:
Add the functionality of Expose Zicbom and selftests for Zicbom.

v4:
Modify the order of macros, The test_no_cbo_inval function is added
separately.

v5:
1. Modify the order of RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE in hwprobe.rst
2. "TEST_NO_ZICBOINVAL" -> "TEST_NO_CBO_INVAL"

Yunhui Cui (3):
  RISC-V: Enable cbo.clean/flush in usermode
  RISC-V: hwprobe: Expose Zicbom extension and its block size
  RISC-V: selftests: Add TEST_ZICBOM into CBO tests

 Documentation/arch/riscv/hwprobe.rst        |  6 ++
 arch/riscv/include/asm/hwprobe.h            |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
 arch/riscv/kernel/cpufeature.c              |  8 +++
 arch/riscv/kernel/sys_hwprobe.c             |  6 ++
 tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
 6 files changed, 78 insertions(+), 12 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
