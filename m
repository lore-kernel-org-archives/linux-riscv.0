Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0760ECCD192
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i///nOeTPUEUEYWal3CcQSUmebMFmpxlvw73ZKcuUyM=; b=IBG6Dzbo4+nGPh
	xUCv8WHc9XqZULYiYVBo+4FKCcP8ZzP9PFyst6NyzK6U5bXg0g+uXnXzZQdslji0QXL6HWGhZAWsA
	lJcOoXAaljag8RVs6Xqhg48AfmHy1nXWhiomGapDMPf6rX/TRWeRsnaQqjTU93qFdYZoWzErhN9ky
	gi7s1s+ftE92LOx0N6v4ZfsqdG/v0aM2urlTixi8DfTKnd+4f7PTr3qpqKwlgNUZuMnKsMnJaQDOL
	7JIj9xsEaEkM4uoU71c+1y+4bMmoJrICGHU4NnVFFRxPcIO4INZ6dZv4FMsZL9tLetcYa18DZggo+
	pe02KbV4Qx8LsO9bgFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8h9M-0000000GsjU-2qgd;
	Tue, 14 Oct 2025 15:41:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8h9I-0000000Gsh0-2Sy7
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 15:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760456475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xN6Ef1sp8hGiQor4Puf+nhx4w4uum6cowYv1M66MvxU=;
	b=Y5vpVa7rf3naothIm2opemkMx3hqyGkqllVAkNqujLl/++P6DZsvmC3pB7xEP4yzFInlVF
	kXA06eT4WMZk5l2TMMRNDh6zuVw5/cJxvsESYc117c24HX/vDNQLiBuTVolsmp19NXIb6K
	OdM1u51dHt4wuFiGwq3+5WGKb65QDAU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-Wzx7jiEpPSiE21O4JLAENQ-1; Tue, 14 Oct 2025 11:41:14 -0400
X-MC-Unique: Wzx7jiEpPSiE21O4JLAENQ-1
X-Mimecast-MFC-AGG-ID: Wzx7jiEpPSiE21O4JLAENQ_1760456473
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b448c864d45so522203866b.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 08:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760456473; x=1761061273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xN6Ef1sp8hGiQor4Puf+nhx4w4uum6cowYv1M66MvxU=;
        b=afiWQxDAWJ4331XzV10itZIW3vH2AQakd6u0ojG578DYXL6x5vPZpYAvyyI2pVG5Hr
         pkVS9NK65SwPR3ngYw2a6KTENUK9ecgaBb21ovRlFuB6PQRFb7O+yOgxUB/Cn4Mhb/0I
         VBjVHfjqDuihnEGVhDQthIlkGBE2nIKfgRkFCm3H65FIF2dqmkeFLiNUheSzkBVsfbBc
         PaeWvy6lfZYl2V49W76pQjqFITvc2sD8KirDCSDLKn5fQ5XEpI3Rx0tr97MFA67Oer3n
         xelea5pCmF7taiKJJQb/xqtj4+2Ei2LqxTlzGTEiz8KzyqnHfG1mSfTTM8OxTCfJp4Jr
         pr5A==
X-Forwarded-Encrypted: i=1; AJvYcCVnZDNmrq53iMLgOsG2BHLOucQxK6/xmix3LNaGoOyMMMEWh0tjOOVDn0i8oJdszkbuxT650iMtv6MhVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcuo+SDonOY7J25J6bdHwaMfelRtd+/18JBjf77wT48r8ZAc/Q
	EV4oie4OPqicq3JhBg5HPwJ6obM/tU7JJ+LX6h4yqraulb3dzMJOd5cx5bj46RPO2NVclnt9ols
	0NiZyDSwbmzCGOaTn2wPeehl84cs9qOUChDK4WO+Hy7VgYRRMcNxrcgXDJ2QbckAeK+CfCw==
X-Gm-Gg: ASbGncuuNY0LDTr8RURonjaNTKwy13eLpd3ci2HLjNFfBylUAaMx6YHkKGd+P7oklkb
	TrtJUd15Ng6h2BrbvOAeXZFqh3nUJoQIa+87cSzZRC8Imt4r5vgixchcHvBNVO3suNJ8iB4voIS
	QikuDfweUbcOGyTcDe8OzW4JTIwOFMmGahTwjc430NW+sBoO2tt9Hfwqmc2rBTss8vJxK1jpbW3
	RfxFE+R6yf6pkCpgWXqyURkdynuR/3ybOqU8SVBbetmJoPQkSDgmROe9FbsOnnPJq+pHAUBXXe0
	NYzhuAz2AdLvJ31ftIJ0ImtRzWlduKvYWLNrajeWndtAWCj5Qg==
X-Received: by 2002:a17:906:ee85:b0:b4e:f7cc:6346 with SMTP id a640c23a62f3a-b50aa08f852mr2493215266b.15.1760456472672;
        Tue, 14 Oct 2025 08:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7MKAgrKXHfanZDhLxk8qbmij1H4ExOUqyMqzBv4euyBsK4QKZM6PUBQShnN55eCek+WQ0jw==
X-Received: by 2002:a17:906:ee85:b0:b4e:f7cc:6346 with SMTP id a640c23a62f3a-b50aa08f852mr2493212866b.15.1760456472247;
        Tue, 14 Oct 2025 08:41:12 -0700 (PDT)
Received: from holism.lzampier.com ([148.252.9.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba45b3cbsm7897866b.40.2025.10.14.08.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:41:11 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] Add UltraRISC DP1000 PLIC support
Date: Tue, 14 Oct 2025 16:40:54 +0100
Message-ID: <20251014154100.168236-1-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1hoUiUroZoOjwhEvuXXtdILJqy7EH_EnQMJYHXEt9zE_1760456473
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_084116_694514_662018E1 
X-CRM114-Status: GOOD (  13.28  )
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

This series adds support for the PLIC implementation in the UltraRISC
DP1000 SoC. The UR-CP100 cores used in the DP1000 have a hardware bug in
their PLIC claim register where reading it while multiple interrupts are
pending can return the wrong interrupt ID. The workaround temporarily
disables all interrupts except the first pending one before reading the
claim register, then restores the previous state.

The driver matches on "ultrarisc,cp100-plic" (CPU core compatible), allowing
the quirk to apply to all SoCs using UR-CP100 cores (currently DP1000,
potentially future SoCs).

Charles Mirabile (2):
  dt-bindings: interrupt-controller: add UltraRISC DP1000 PLIC
  irqchip/plic: add support for UltraRISC DP1000 PLIC

Lucas Zampieri (1):
  dt-bindings: vendor-prefixes: add UltraRISC

Changes in v3:
- 0002: Updated commit message to clarify that DP1000 is an SoC and CP100
  is a core (feedback from Conor Dooley)
- 0003: Renamed dp1000_* functions to cp100_* and updated commit message to
  clarify the hardware bug is in the UR-CP100 core implementation, not
  specific to the DP1000 SoC
- 0003: Moved quirk check out of hot interrupt path by creating separate
  plic_handle_irq_cp100() function and selecting handler at probe time
- 0003: Use existing handler->enable_save[] array instead of stack allocation
- 0003: Use readl_relaxed()/writel_relaxed() for better performance

Changes in v2:
- 0002: Changed compatible string pattern to SoC+core: ultrarisc,dp1000-plic
  with ultrarisc,cp100-plic fallback (suggested by Krzysztof and Vivian)
- 0003: Driver now matches on ultrarisc,cp100-plic (core) instead of dp1000 (SoC)
- All patches: Added submitter Signed-off-by to complete DCO chain

 .../sifive,plic-1.0.0.yaml                    |  3 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/irqchip/irq-sifive-plic.c             | 94 ++++++++++++++++++-
 3 files changed, 98 insertions(+), 1 deletion(-)

--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
