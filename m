Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B1EC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OpFOVgXc0uGWtsD5beJxP1HRjWK5K559wMCJqwMbC1Q=; b=Cl6ryGRFgv3s5M
	MtAKpcul7b9CcLp+vyoS3vHg0up8jqOF0aBE7A4JMGxYRQm5qc0wHGZKmdw3E9YxzseU7GEOm5QIK
	eMhP8cU1byCDBSFRfxYRnpzJ83IplFnOooBNvIoacBeQA0W0ZflipDSJjaDZ6GuvgzJw5+3rpzLcR
	6EC+Ya6VhL6b/BJVp5b0XpctrWxKu/mN7xjjyHN3vEA9ZUosZ6iCVTxPgtBuXKtizCsKv9KxpeBAD
	YIUz/qrBb0jDWKESNLwQgwu9dQ2mF26ghEw1uN++Liwct4kxDPI9INQrwZZ2/ki8S1zKKVhzVB8aJ
	74Qm+Jg8h6rLtGg4DmVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUQj-00000009X01-3BEY;
	Wed, 27 Mar 2024 14:39:05 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpUQg-00000009WxO-1fmg
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 14:39:03 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e88e4c8500so4910632b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711550340; x=1712155140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mN5DbQIQ+AIBNK/RUT7CFH7DAU5Dr2ePHZXqS6MjbM=;
        b=iyLiBenK9vljUeLok+iinNJMwTtBAbrWmvQkWqNZVTKeeHSDN7J7CQVWg3OFB/oRHL
         R/RJqgfCquh/0fh55f9n0/KJiXJAf5xv25l7xhJQ7BDIRpb5Qykc+Dh1xvl4M03yHGZs
         B+sHl5MEzqyRZeNH7vopMjZRCoTdQy4f+KambBx2twJw7u04PNcXvmGdqim3zv8lrhfi
         p2cVwnjAwjTZAmgSijd1wDJxLH5dQgxjCJ0XHCM4Kh6lvYszESZc5+Xns5rTBmfKEnij
         +C+GgwB1jQoKvSuliGKUaE1y5CPaRhcXcmgUaFN346WFscJzsefgLCZQStXdhLngXp9U
         imKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711550340; x=1712155140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mN5DbQIQ+AIBNK/RUT7CFH7DAU5Dr2ePHZXqS6MjbM=;
        b=vCs63pcAyK8hy8vRCUjeg+H2VgPTakdGMJQmO0yoEou+H4DK05ZgYvDPC4usx2KKKY
         6u3w2Z1j2Tx42+8tTFqiLSPorSQxAk4F1iB2hNwTy9RLaHXpFyk5tHs6932BHjFNTPmv
         Ko4Hp17ObI2T0l/2bEa7abHocNbJuKqUTSG88P5Ubs+by8HE6F+glTzqnZscMmfls2br
         ImoJc0vU8rHHUJKt3FnSKwGL+ZWXLmDhiEzAmPdaOK+YDiQri7m+A9zGSiCMO026vuMB
         LGTiyAS/bw5O4nJl82K0TRy0BQidsOPLOJGmQW4uvM+GAMK1ozlHo5cLQUWLL8nSI5U1
         Yppg==
X-Forwarded-Encrypted: i=1; AJvYcCUNEACuchD5hhXBCbZnYUxDAsN6bEka3SU9srSyw6tu4Srvx/0+QFBw9aU7KbCBQvjBWSHIali8zZ4j8bBpr2oRUFHBs76cB6UJwFe8WK4h
X-Gm-Message-State: AOJu0YxPin9GwWwlizjtndmKVjAMJid5F6V+rkzOOrblqsMXWdv6S1Aj
	qPwIcMojEXBIJKQlrgn1mmFFVmSq+Gr9IZfFfYUFjjZwwXkrV5EV72LUgB461uc=
X-Google-Smtp-Source: AGHT+IFq1e85Ja3UsvbF0kDZ0KKIY+n5/++k2Pdcp/9sVOeFKvi73RuyART7HuPnTPwU6Zr4lw8MNw==
X-Received: by 2002:a05:6a20:8f0c:b0:1a3:c883:69fe with SMTP id b12-20020a056a208f0c00b001a3c88369femr63081pzk.3.1711550340134;
        Wed, 27 Mar 2024 07:39:00 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id kt1-20020a056a004ba100b006ea98271e43sm7915574pfb.144.2024.03.27.07.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:38:59 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	David Laight <David.Laight@ACULAB.COM>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 0/2] riscv: access_ok() optimization
Date: Wed, 27 Mar 2024 07:38:11 -0700
Message-ID: <20240327143858.711792-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_073902_478701_BB99B175 
X-CRM114-Status: UNSURE (   9.39  )
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


This series optimizes access_ok() by defining TASK_SIZE_MAX. At Alex's
suggestion, I also tried making TASK_SIZE constant (specifically by
making PGDIR_SHIFT a variable instead of a ternary expression, then
replacing the load with an immediate using ALTERNATIVE). This appeared
to slightly improve performance on some implementations (C906) but
regressed it on others (FU740). So I am leaving further optimizations to
a later series.

Changes in v2:
 - Add a patch removing PGDIR_SIZE_L3 and TASK_SIZE_MIN
 - Set TASK_SIZE_MAX to LONG_MAX to optimize the comparison
 - Reword the commit message

Samuel Holland (2):
  riscv: Remove PGDIR_SIZE_L3 and TASK_SIZE_MIN
  riscv: Define TASK_SIZE_MAX for __access_ok()

 arch/riscv/include/asm/pgtable-64.h | 2 --
 arch/riscv/include/asm/pgtable.h    | 3 +--
 2 files changed, 1 insertion(+), 4 deletions(-)

-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
