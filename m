Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED98CD8C89
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 17:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kclLb2GGPV6zLUQnR0zml9ubW1U6EhBOu3lCwF5K1A4=; b=WCj1eC1YjiqGpk
	R4GOLSj7MyZzzymGdFjBLJT00hDepWDlS0PAsspICO0RSmtjOZfjoU4/elBkIeOtn4vW257YkV4ZD
	reO8FyPJo+G2Mi7K75Fg5hSG53vYLIcKZalodk4TITHRVaJgIqXDuJxbSjEY/eJT61zdjUJK7isVG
	kVbRmRE35/HxVqr4nHFVGM4sXELwIriKS0GZfHjw1jwDhYzGf8dBnO4JNdeZ0Nf1fYt/Fb/d+S8Gq
	PzgdA3lY7dECQwfvuJrVmJn8Ypia6uw3ah+YUYESWOdH+wJQxqxhnNgb+Mn3zadqpO4l+qP9wdH4z
	3m9R9RA80F6MXGbZ5GTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHXL-00000002N2b-0K22;
	Sun, 07 Jun 2026 17:43:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHXI-00000002N2D-1kPt
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 17:43:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf1cda2b17so25312905ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jun 2026 10:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780854226; x=1781459026; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ljEzNr/52XcURxVXWbkwKLpno+BGAmwJA55/cYldv40=;
        b=r1FRgtcSphWcCSDSRMAljs632tukPNDcTo1i95YRJPbBgWNS7w9uHM+PGp4Lt1ZPXx
         DVG/WYv/6Kuy6q5YmLWzO5yo6E8Ta7JfE7sBJyGj/asJAqRCYb5LMvSsKxJvo+dNoH2f
         th23zWlyG8tg8nogF1jotUWappgpiZCzxgTbGaow64vb1xQ2jhHgUMQCU1e1jsyjqlMX
         sGP/Y+aJP5uDt4YsUzDF6bbVtyfA264i9vGPBlWF8C7EVs9N61Uv21Gc2YnLGgTW/EYM
         n8iec4y3ITtz5eDvKsLAA9qmbXAfNIEUQJHfO+Q2oH+bulmbo+bqXjxzpvf/GRDi1fBR
         pvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780854226; x=1781459026;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljEzNr/52XcURxVXWbkwKLpno+BGAmwJA55/cYldv40=;
        b=CMnWEnNCMFGyOYoUADgBRECS5lAPjqM8x+CjKQi2HJxV/PCTvGaiegQPVyMn6EJUsq
         FslmiBlPmbb7EYF0RMT/7S530fHe3owh490mJdorsgV4OcF/WrluMjqDNl0aa2lz7ZsP
         FgHIDUq+gVaItF8BN+RxAloR7irFrDxlb2pJiVva/AeXrU/m8B6mUVC7dylB0VqLh1iE
         geAY1OceyArvZ9ck3LnnRxLtCW+mtkk23FLTg4vcsIP35RtKyrQKvDGeu4EIBVPXpDkF
         PQUKAnf5RgMx2Pu7vpip1XknRu6Eh/xM5CVg06g9vygnZ3YCvWRBLOX7xFdIp0aib4Kw
         Mvdw==
X-Forwarded-Encrypted: i=1; AFNElJ9KO1aNuKNKaNlbIcZf0WdXBHAwrFIYSiFkmHc5EuNzK5PvkmjE4RmPrGTw6WtnXfY9qGbmjMoxHwXgZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgtn3TZHsY9rK0wCJIX1UL6uPDRt7GkYF3YKmzBUF2Bp7yi4QV
	142Wj9DiuvVyUYoLA2sk4BCW+iwtnXyV0+X5LHf2+Nw60t/E+wEfwOo+
X-Gm-Gg: Acq92OFKGgi1ZbAuW+sxcJeaLdEvsjoaLvVA9O1jXenT6v2PP7kmNxEyVeuxhGAANV8
	GLr6GujfLtM1j8QVlBe1nAed3NEqR83+K0bJSnUdSlXxCZ1BMJEr5MDTUzE/Zgpqri8amSkFMy0
	veDDqTQ2g3zLoE3JZyEaKqDGh9pHTX8Vd76Bny/XijDkE5gtdBKTp0t0hYp2mYgtCkZaeweV728
	xSsDgGd9gZj76SWD8kS5AHV5e1NBgrJYUNHCsZ567fz+m6w06Af0Bs495G/J6nYPfnFHwBLKGou
	fb1DA4bcWM+ku23AfyeyAGK5WWnXcuFS3cEf3FCjvswIIQrqTfSBuWvCjGj/9u477X5pqdeWDD9
	YBMidYmFD8fY1fPCbTGkHI8PE0b7Gshw+c4MdBPxPEqIw6HtkbOboKi9IT3G5uO1lPRC7vfAPaj
	zrtdNK5Lpv
X-Received: by 2002:a17:903:2385:b0:2c0:dc5c:9069 with SMTP id d9443c01a7336-2c1ec54cc43mr105352365ad.2.1780854226544;
        Sun, 07 Jun 2026 10:43:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::305d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ab01sm149171185ad.71.2026.06.07.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 10:43:46 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Subject: [PATCH 0/2] dt-bindings: Add SpacemiT K1 PDMA request-number
 header and use it in DT
Date: Sun, 07 Jun 2026 13:41:29 -0400
Message-Id: <20260607-b4-k1-pdma-req-macros-v1-0-5b2a3955007c@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEmtJWoC/yXMTQ6CQAxA4auQrm0yMzED8SrGxTAtUgg/tmhMC
 Hd31OW3eG8HYxU2uFQ7KL/EZJkL/KmC3Kf5zihUDMGF6KKrsT3j6HGlKaHyA6eUdTFsKNSRnA+
 ROijtqtzJ+/e93v62Zztw3r4zOI4Pd+e503kAAAA=
X-Change-ID: 20260607-b4-k1-pdma-req-macros-8d276d0126df
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=i0ja/GMMnsxqkiiz4bzIDMyK41VkQXbc7b1PuWg5hTs=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhizVtcf+RTEYiyef1bl9dN0G04D/ube/TrVbUX45bs733
 K+z78tqd5SyMIhxMciKKbIcPtqSvfWVT7Tvc84fMHNYmUCGMHBxCsBEioQZ/srpuqX/tzrjbmTV
 Hr3FuMZ4eYexo2uVd2LgE8FAgdZzHAz/AwM7/+b+yk9NPjLj5yf1wG6HYpPr3pKrI1d/PHeppE2
 aAQA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_104348_465006_586A5A18 
X-CRM114-Status: UNSURE (   8.41  )
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

Currently, K1 device trees specify PDMA peripheral requests as raw numbers.
Add a dt-bindings header naming those request lines, point the binding's
dma-cells description at it, and convert the current user (the K1 SPI3
node) to the new K1_PDMA_* macros.

Patch 1 adds include/dt-bindings/dma/spacemit,k1-pdma.h with the
  K1_PDMA_* request-number macros and update the spacemit,k1-pdma binding's
  dma-cells description.
Patch 2 updates the current pdma user in k1.dtsi to use these request
  number macros.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
Guodong Xu (2):
      dt-bindings: dmaengine: Add SpacemiT K1 PDMA request numbers
      riscv: dts: spacemit: Use symbolic PDMA request numbers on K1

 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  3 +-
 include/dt-bindings/dma/spacemit,k1-pdma.h         | 56 ++++++++++++++++++++++
 3 files changed, 61 insertions(+), 2 deletions(-)
---
base-commit: 793cc54475b49b5b558902b5c13e4bfe66530a50
change-id: 20260607-b4-k1-pdma-req-macros-8d276d0126df

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
