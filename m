Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFB0C52D76
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 22:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i8pqt4Hl9ZsdOkHYAn/BgXLJcw9Xuk/oF5fFnp9lPgo=; b=heaquT/KSejhKf
	xlQm2r9mKvSFfujW4s9+ZNoDJPMJ86uHP7YS2+rrPiwl0dKKn1s7tta17HxtdevemZl+2M4SdFulj
	Ip2n6eGWSupWcVx728/tESqHEbjTXrmYaDV4NEbtCw48+seAzXxDqxsrSE7I/JmEUJ3cAz8pD2zNd
	Pr6ngdQsLsniwk3jjG3MS9sSAVU7LQvPrgjgl4Bi7oi0nFSXPXHJxjHXwIkknIeP8S4Ede/+2ajlx
	IC+nvQo11Q2LOYA6YIoe8iCwhqpMvU047fgcKCPql091XBVoFD4Ej5dJp67fbPaY5GegnmHtvQZqQ
	ATX/81FVLb0haUtonBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbSFL-000000034Tm-1wHQ;
	Tue, 06 Aug 2024 22:01:35 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbSFI-000000034SQ-0Rwa
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 22:01:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fc4fcbb131so9474445ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 15:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722981690; x=1723586490; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UHyIBHBe7m7I8HTEvfryrMYI7ZE76p9wqPYDI+ZDXCM=;
        b=bhfQpkrkksVJsFiFcVKIkoexR4wWQL9zyNJSAFgzLCetWe2fEF/uXiUynkMHMxjxcJ
         ZIHNiq9y7iUcnLDu0wNEGtzmj8ioqTud+FhYESAQyG1LYvBbAMp+gw9LciLVAnM5AwQf
         KrB7n8WSlWjeyyzBWo1uEZ2kEgR/B46vQ5ERxskOXzBfniLlbygTdeak29SOBmfWfgZk
         KnfeOBedJbGizoQ7ThwI+CyFKk0tKyP1mYTpdlOhMNm1pkus/ckgSYkVZeY/B+BtXMAJ
         WTA+eJpwveMEkxqRL3EEMaYte0Ar3GZ4QdsM3gMboiC7u77l4INulmuIXh6ww8gz5HSq
         65NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722981690; x=1723586490;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHyIBHBe7m7I8HTEvfryrMYI7ZE76p9wqPYDI+ZDXCM=;
        b=qROJ2Zbax+GaWdE5t8DrRqx3NY4ZhJTlm/XV+43yPuRg2Jvv2R/9GUpKvse1As2q8e
         UH7qDOlObvhyc/ECqtnlPO1cfXZ+ytLP7s8QV0lDVxJAylI99JE1aylNO7FFqW9HhNdx
         tVD20Z933FNzdVs2LDj/DF8bCWy+WbWINGPHkYAlQYLQq+N0/r6kCkgHJYILyQFWakMV
         emYHtTOD0nvDCzTorgiRxy43/NJFo362SY7HeBCgeayDPNmcDEZlVag9ZFkTjSWroYA+
         BUz0+lpJgEtsyFIwYmdFQAHxm6TbKo24T2/hKPNsPFVAZcUekOhJ4LfBYGSRfhEAIeje
         BGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU13K2Z2MFKlOS+gLziXJ8uY5Lw/3zRDI5mMbmDFNrRUw97lXJgTBHx2d5MpvuyBBd5tjJ2/H0a07uEOFMzj2Zx/EPrFguE5umpcszUMYv5
X-Gm-Message-State: AOJu0YxfchCCEAIjma70LlcrxX8LyRbQJ28NHMhZnZ3cqm26KpTITVn9
	CV6oktwqLaIJ6A9/eEIPVx9YYPqsVhR3gFJzI9uMA89l3dDl778fFlUdaCPSHIg=
X-Google-Smtp-Source: AGHT+IE7qLlUukythdnkW3zQ3rBGy9VXhyoxZcuSe9mUdEA3w7HpB/xZw/B6gcPQ7Q6jajvAhTnbFg==
X-Received: by 2002:a17:902:e80f:b0:1fa:abda:cf7b with SMTP id d9443c01a7336-1ff5722d9a2mr185899825ad.9.1722981690493;
        Tue, 06 Aug 2024 15:01:30 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f27340sm92578425ad.17.2024.08.06.15.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:01:29 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/2] tools: Add barrier implementations for riscv
Date: Tue, 06 Aug 2024 15:01:22 -0700
Message-Id: <20240806-optimize_ring_buffer_read_riscv-v2-0-ca7e193ae198@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADKdsmYC/4WNQQ6CMBAAv2J6tqasFcWT/zCE0LKFPdCSLTYq4
 e9WEs8eZw4zi4jIhFFcd4tgTBQp+Ayw3wk7tL5HSV1mAQq0OsNJhmmmkd7YMPm+MQ/nkBvGtss
 i2iQBLroqrEZTosiVidHRczvc68wDxTnwaxum4mt/7epvOxVSydIYqxzoo0a8MaUQyduDDaOo1
 3X9AO9O7jDRAAAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andrea Parri <parri.andrea@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722981688; l=914;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=4NHQEehVAG0NwxpUnDGcXm8ebXdDqTJOInrMfedXBo0=;
 b=i+I1n4AKsZR8pKpVgYlgT0CCKtIwC7b2pjgVwea6mE3ubg8yf+0dC42KkaWT+mUnI3SLWIhHt
 NaO616IplJxDAbx7WL1b6cE1qHI/MI/zZt3DmmrqUJNGG0wm4BHUdos
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_150132_491827_35F4919E 
X-CRM114-Status: UNSURE (   8.29  )
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

Add support for riscv specific barrier implementations to the tools
tree, so that fence instructions can be emitted for synchronization.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v2:
- Fix typo in commit message
- Link to v1: https://lore.kernel.org/r/20240729-optimize_ring_buffer_read_riscv-v1-0-6bbc0f2434ee@rivosinc.com

---
Charlie Jenkins (2):
      tools: Add riscv barrier implementation
      tools: Optimize ring buffer for riscv

 tools/arch/riscv/include/asm/barrier.h | 39 ++++++++++++++++++++++++++++++++++
 tools/arch/riscv/include/asm/fence.h   | 13 ++++++++++++
 tools/include/asm/barrier.h            |  2 ++
 tools/include/linux/ring_buffer.h      |  2 +-
 4 files changed, 55 insertions(+), 1 deletion(-)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240725-optimize_ring_buffer_read_riscv-228491c4eb6e
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
