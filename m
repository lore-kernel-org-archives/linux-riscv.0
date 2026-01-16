Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85473D4A5E6
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 02:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NADhHY26Mhg58+UICMPO42L7KP8GsOQm6SeuCQ8GweI=; b=hNjc8HAUlJn421
	c68W29yH2xUax1X4tU8Jx7T3PZh7OUw8hSx1piuu6v00ygmDtOO+Xojn4iE63XvUhYwRpibfxELsf
	i4hFPyp/ONNCO4FHpwyPTFrl4FIHOf5bE/5zpITkO73Lr8SLvWxRsu+ISCr3IS7wCT0fmUMJI5oyA
	LUpFMjbTKgNRr9tz/5FdbqvrQ7tWclL0YkAGj6MvonJPRzhnPNnusC4rd87cUr0+m5x/lX4kMX5LU
	vcmeZpJjTG6pJaeGPSEeHxqgE4P3zofq28EXBFKKjpqZ9M3tm8ccFDTxHijdi/uLGQWJjt6ZYmdAK
	c0oj91vKKbepntNMWEWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZIi-0000000DRsv-2c9j;
	Fri, 16 Jan 2026 02:11:02 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZIb-0000000DRsO-2DYu
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 02:10:57 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-34ccbf37205so689412a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 18:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768529452; x=1769134252; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d0RqvDSTLRy5sun+KFOAz+29pO93gB9/JlJnbr30Zhk=;
        b=N5ttp6wIr4ne5qJ5OLn2UDdhFEhgn9BHHf1yvrVXDExSxD26vZw6HHAJvZ/JqPgFf6
         0zbniCOCvErQmGWLbeGL8E0NWaKGN5x4H99fzDBvxJL9xKCvx7jWx6vCGlMAuUan/ROM
         qbWw/gEefSgvtjpzNdlWuWovHrdpLEhZdCkZlxlWFn1qPUlrWg2LYaJVzdxYlG1cnxZi
         hGPr7Zhq4n8L9IGSpK3ig4CobhE1uyABoI6UxW0PWnBjIE/2W5nAlrmmhYke8lqEF+7h
         HhJEt3NbJAjZLzSiC92/mlSqdeOCaYcAbhRPRa3lsdLyRM0Hg1ybbF+Oba8gZU77v9B1
         hVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768529452; x=1769134252;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0RqvDSTLRy5sun+KFOAz+29pO93gB9/JlJnbr30Zhk=;
        b=NBugig4wP/BMIroR55+FKy9mFYWdIGSKBRmNVMlc/MNf6Xa9YojbY3WAc4s/CceW6p
         HXabXPybDwHaeKe1oKdJbNqYrvOcLm4olBX7kVX9BRhWMPcTrs1Dv8LyOBjWGcRGp5w/
         6Yg4co8QLUS+ttTCaZvw45dJ0eSNLvre9ENIWDlY1rdW1JHDH2P9zodaGY3x9mX+oy6F
         XhFD2LNv/nYTx7ng/AWxJ8sbjfEnVTTk+3yGWwv5yeHuB7QmYS7A4NPp6eWRpxoqiTiC
         FDwuzj+upTJvjgJj/FgifjUybNsx59ouelkHpdv/GGv6PlKZs0tEaITHWc/aU+vGwJSk
         ManA==
X-Forwarded-Encrypted: i=1; AJvYcCWWHirQs/ccXnm/TAsIzvG+gteGhHXvqZEOv//1CzekClNWk7r0e1rWn9YthRyt0yP3k7GUbSdPKZcjvw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmmw22X6SY5+fd9vCi1jQiZmikVoy7Q6zIK7Z2xqbXl2ZES6pC
	roEbyQZzUJOXZ1Hi7r4MoLb0aLFhsM8lL8XsRp6THDMcszdlGPklowhiZlsCwMcIw2M=
X-Gm-Gg: AY/fxX6Qs/Hd+RFM3jwQDrvW9OkBLCQhR7hLy27w9oGzj/V8E+w3i+42F5qAeDZpuQ4
	jVBz5oUKiOX0E1i0N0D94prCb6CmKlrswQRRkvz9li/NFYtPQym176FsvOj3NTvJsbSxqOFr2cy
	mR2RSx0gP+BR/NP7wkBM36psjbJql/cbcxWcckKMlJS6jp0xQwHIiYg4V8ysnzrdQRMAzfcKwk1
	yhuydyLDYupzzBVwkRAhojZq7SM87ZgjVM7PhKtifLZCDqDexmuI6hksikc7C9Xfs9cdxD3cwJ0
	f9o2n0N6XY7tDG4QS6/t3xpyQZTC4hroawjXBTPBSPLZi79C1qxB7UXjZYEJSUit730UzVW1tg7
	nWW+ui3Twc3ib3JM+hynx9P4AVrxM3oXYD3CTgPQT6AzLuhTy/n6QyiOHgViPEFINiJ6JNiIzhi
	i+ZJ5pRL225UuF64Lgj5QerikpDCVVQ60Q+JqPeCMYvSWzXD7yvYiGdo+g0oIXP6Tr
X-Received: by 2002:a17:90b:570f:b0:330:bca5:13d9 with SMTP id 98e67ed59e1d1-352732775a8mr1013354a91.32.1768529452084;
        Thu, 15 Jan 2026 18:10:52 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35273298968sm364317a91.0.2026.01.15.18.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 18:10:51 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH 0/3] riscv: cpufeature: Add Supm extension id and
 validation
Date: Fri, 16 Jan 2026 10:10:30 +0800
Message-Id: <20260116-supm-ext-id-v1-0-5fcf778ba4a6@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABeeaWkC/y3MQQqDMBCF4auEWTdgggbxKsVFjGM7i0SbiSKId
 +9Uu/wfvO8AxkzI0KkDMm7ENCcJ81AQ3j69UNMoDbayrjLGaV6XqHEvsuvWOmxHX4d6aEAeS8a
 J9kt79ndn/KyClnuEwTPqMMdIpVPpx/zhBvrz/AKCG7PUjgAAAA==
X-Change-ID: 20260116-supm-ext-id-826e8da4c4b5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_181053_845362_C67B2E90 
X-CRM114-Status: UNSURE (   8.16  )
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

Supm as an extension indicates pointer-masking support for user mode
(U-mode). It relies on Ssnpm or Smnpm for the underlying hardware
implementation.

As a ratified feature, define a dedicated RISCV_ISA_EXT_ id for Supm.
However, since Supm is targeting U-mode, it should not be added into
devicetrees that describe hardware running privileged system softwares.

Supm is implied by Ssnpm (S-mode) or Smnpm (M-mode). Add parsing logic
and validation to ensure this dependency.

When CONFIG_RISCV_ISA_SUPM is disabled, Supm validation will fail
regardless of whether Ssnpm or Smnpm exist. This patchset doesn't change
this behavior.

Prior discussions about how Supm should be handled can be found in Links
[1] and [2].

Link: https://lore.kernel.org/lkml/20260101-legume-engraved-0fae8282cfbe@spud/#r [1]
Link: https://lore.kernel.org/all/4ebbe14b-2579-4ba6-808d-d50c24641d04@sifive.com/#r [2]

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (3):
      dt-bindings: riscv: Add Supm extension description
      riscv: cpufeature: Add ISA extension parsing for Supm
      riscv: cpufeature: Clarify ISA spec version for canonical order

 .../devicetree/bindings/riscv/extensions.yaml      | 17 ++++++++++
 arch/riscv/include/asm/hwcap.h                     |  3 +-
 arch/riscv/kernel/cpufeature.c                     | 38 ++++++++++++++++++++--
 3 files changed, 53 insertions(+), 5 deletions(-)
---
base-commit: ef41e6187f77b52e4b17ab9637be8f878e1f7a5b
change-id: 20260116-supm-ext-id-826e8da4c4b5

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
