Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1598BC54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 20:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/bgc+Kz7dciclUgzJegqowQDX6PwhGuhm6su3sn65s4=; b=zIYBMZOw/3K/dp
	LP1hIBbXF8pAdnjbZ5F22+kZNijXRfBw5F2LJcFOmBJvUl66+J91sZYx3/A4pyVnbXETDn1OPmhmA
	h1qtEiGwaNLPMcyGDwPTmXSu1vF7QiusDdGAoCcA0BpuK4w48sfA2HkV4MUjZmCNmMlZEk4l+AXWv
	Xy9lJlp4eF3Kw20ghB7jCp6H6NpYjzEWxLcwf4FwfViMCwarbmAd144zSU4hWHNe/96t3s6NF19+O
	yu2sPdxM/bfoQGnuPH2fUny7nMa6TPdodVn5yV7PKT9VwExrfI667mMtw6+KqgkBZH49WCVrgXpIK
	QQQ7FqCWsz2QCJLHDKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf4PA-00000006neT-3DBa;
	Tue, 27 Feb 2024 20:50:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf4P7-00000006ndl-2Xm0
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 20:50:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33de64c91abso1114402f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 12:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709067019; x=1709671819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0XHnjehPu8w7ACthUoBFkI7yFqIdEnfMFK14QBWxeOs=;
        b=13K+b8/46jurOJBD9ffKolRmH6Kh4bsBsSlr0q0zVAIof7ZiGaTjZG1TR7+i8QNCj5
         ALYgR5zF+70/Wa4OQH3jFzf1snJykRWx1FsHycGprG8kn/v+MkWCxGpNijXq737TjE6h
         Kn3qUCoXKUfqbVgujSeNmHHd0NT9J3AcIvbtrQ30f4jNDA60Q6SKbX05boaUs6Gd2E3r
         +OYdcbUNy/BlsqCI+P/3Om+JSzSwVCt/6gaS86glcZofY6exY/ZBx/1M8pExlHtF9bkk
         /L9IRgR79uybq9UtL8/fdGftz2B1BvtApUcrcgh58rjkq63Vjv2epQxWhW83Igowh75N
         cpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709067019; x=1709671819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XHnjehPu8w7ACthUoBFkI7yFqIdEnfMFK14QBWxeOs=;
        b=Ww/OhBfogxJNEYnPEjwl5j6B5WqKSk3Bm2vD8ng7IMJf/7zkD/+y+kFpfhpcRPszgn
         IbvipIyvYQetdgfnrrt6n0gBaZCsRGsI1HgzDq924ampGsU7TRow52D7UiI50Kn5wmqS
         wXl1vtvYAdNhK9rOXLuVRu9K9tj1pOqRV5xy6d6nDaNSMqfHxUt/fcukouY5Kv8qubpL
         C2PjAX22kfcKBt40VUM/f6MRnNUNWj0ZOv/0wKPTn93QdJSyS1utI5aRtas5NfPq6hUd
         v1nVB4CZmkOSkS1QLF51fmJ3r53i8ZLaJk/EwvkxUOn5TvbHzwR1/qVzyjFNLJKdZ6kz
         +lXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4ZtYXgiBwpYhfIO+CmHvjgz2cU24HzqwNPHzh/ikqMwxsTw3+XsbbsRFb5C56AH6PLbj0FhaEuv9PFR8QGvjLd+VgbFCzAGHIm+z5l1kn
X-Gm-Message-State: AOJu0YznNZtX80bDZ7ds5MA7kAf6SmJtTGRnhVBFzwLoQail5n88T6UH
	mdE7yalyPNnCm+XM9iJVYyw1sEvcW1i8r5iCrOIhh8TAOm/cPFxUXF9+GA25wqs=
X-Google-Smtp-Source: AGHT+IGg926H9ZvAb29YFFW84p6+A5ehuWN+jwxyTWEE7ddKRSp+9GoX1bKzBsQBX03xsQMwOehwyA==
X-Received: by 2002:a5d:6d0d:0:b0:33d:a452:2fff with SMTP id e13-20020a5d6d0d000000b0033da4522fffmr10131949wrq.11.1709067019379;
        Tue, 27 Feb 2024 12:50:19 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u14-20020a056000038e00b0033dca6f8b44sm9763929wrf.16.2024.02.27.12.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 12:50:19 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 0/2] NAPOT Fixes
Date: Tue, 27 Feb 2024 21:50:14 +0100
Message-Id: <20240227205016.121901-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_125021_666365_8AE13CB2 
X-CRM114-Status: UNSURE (   6.89  )
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

This contains 2 fixes for NAPOT: patch 1 disables the use of NAPOT
mapping for vmalloc/vmap and patch 2 implements pte_leaf_size() to
report NAPOT size.

Alexandre Ghiti (2):
  Revert "riscv: mm: support Svnapot in huge vmap"
  riscv: Fix pte_leaf_size() for NAPOT

 arch/riscv/include/asm/pgtable.h |  4 +++
 arch/riscv/include/asm/vmalloc.h | 61 +-------------------------------
 2 files changed, 5 insertions(+), 60 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
