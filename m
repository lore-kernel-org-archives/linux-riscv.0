Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD91CA0EED
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8AufCQ4h32PJD030Zha2IxIkwUC/fC9k0Hxgv/HqEuE=; b=J1E7UOiay/DvFF
	XQ2HT60IWazJkTxgJp7S2Vn3IOGdiD62CfKxKSxDOt5hsECkCzJPhWlDkvZsLgAWyFTTtv81/k+LZ
	vDhY47dy4ZKePkbfnZPq35e1zE/Kpn0zE1hduaQaQWbUB7P9mJb4AyxdfA3V+C4PKN//Zv35BtL8W
	handkqH/xpI4Hsz957UDyIx3g83rVdlUcL3kKenKckxbPz0mTSoJoDQ9hJ/nhfHv34FM/9wXgl4mi
	ZOL7rdSvjn93gkb7yEoNndYrgG+9CFA2WNmzgmdOkskYIyKOfCpSue4ft4KZs0jRweqBHCeZ21d8i
	PuIaXkzoWRy4Hw1iTiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRei-00000007AZH-1ahf;
	Mon, 25 Aug 2025 07:30:16 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR6E-0000000757b-0ajL
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 06:54:39 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-74381df8cf1so1226673a34.0
        for <linux-riscv@lists.infradead.org>; Sun, 24 Aug 2025 23:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104877; x=1756709677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjCk9K/9vMZWlVyVVNpjDms4LHQz7N1FEpHm6N3zn4E=;
        b=EMWPIHnKAIXSxs8mPtzXRVA/IsBTxFwotE3jPWfuLWmdlpM3vNU21aR6ROcAQo3EMo
         qMtvUjfFpzEa9VogMH9rRI22H8kqbX+2tM8aCbP8WRC8Dtl5ELFeefmN/rODDyFbuNth
         ZsXF+YxFLgtCmg5MGgEMHz7W5iUquNDY0g1NQA8u+aZX20pED2mZhf/i6R5rZdYtHl9P
         cGLLzPN8YUQ9eM3Khi4JnGjNgROeRlO7XdXWlE+Hd15FLJ/zrp0sx7Keqk2qsZtx18/S
         kbNaqlnnc6kUyr73OIe69Q2jtDLs6yNOuJSROFEl5qh5g+Icp+lKJEF33EI5GNQymp5R
         CvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104877; x=1756709677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjCk9K/9vMZWlVyVVNpjDms4LHQz7N1FEpHm6N3zn4E=;
        b=fHS6N51vectTL4WccelC8kocJOu6trL7B+v1jczCaTW/4t4c5mVabrR79q7e8YP9F+
         vmYLBOMv6HIsFwLMZ7a7Ya6F73DT0UJo4/GYnGEIzo4YmAKG+Do/Yndp+qFo/hhjCagf
         QceJYBDqNXTg0K5VTRfyrTg7HNj3oEpzWElejkfn9lJnE+dlKCu7JLfpjpY6xOklMBev
         DIesmxKcTE5k42TsDSc9uzhb+aIBxKAT73QkToClyhRa8RLAN8teaMUoJMISSkdD5ywe
         S/b+P7F6Uw+GNCkWqDu3pLEYbRyz5C4lqHIJmq6JWFHklXhSbWLbfP/aY2/ScRIwC6vw
         +Kwg==
X-Forwarded-Encrypted: i=1; AJvYcCWilakr1Pog7h3gi0eQSHx4MBmEioT34RVmtBJmas613LxgN8hH4f5Qk7cTrd3JI6ProLPwRAs1/tTVAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxci/w+sft9ynQ30vQQGjyLBTG/iaqluO+rVbs8cVSbDthrRXDg
	6CKViMifQj8Pr1tElowVA3hdLxWoTl77ais7hbYfnwWEFqNL9svPj1jV
X-Gm-Gg: ASbGnct7mZbM5lUeSd7cPTAw04mfXNGPSR/wis8pokuPjhiOOL9pysf6fS/x7PNrTR6
	wxDrNUcrJ4uJdiTTDFyabAYgc7Z27yWuUgj32Lt4zuNVr3dllOPhSPy5PgGfpjm81Bjfmr/xYv8
	c5/f4uRK1mNNhIaaZGIF50SZl2KtQRKooT+tON+AA1lKQ9WHKcsLvArXm6Ewu5KODvO1y70oB6l
	AhCnUKRivWI1Pfz6/27r7IVkWlv6bt2wCVLQ1V5Imzitb/4b1C6EA6UkcwlYJSDKfm3XO3g/6io
	cFRWms2hDZcuzRoHYwR54tn/JXDEdxtIw/ew1VFY8JvA2U8JT1lbKQc9B8PXu4M/HJrxg1eSEWa
	WemPadyx3bsMUzz163X7KVekWQvnYYmo5
X-Google-Smtp-Source: AGHT+IHDP2qnmqjS+OjyuxLINGnH6RRIlWczknh6KUY3WAEc+CTBhXBDniv6qq7QdHd/r3GPOi1JPw==
X-Received: by 2002:a05:6830:6993:b0:741:c135:6afe with SMTP id 46e09a7af769-74500900005mr6184862a34.5.1756104876891;
        Sun, 24 Aug 2025 23:54:36 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-745226acdfcsm433568a34.12.2025.08.24.23.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:54:35 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 0/4] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Mon, 25 Aug 2025 14:54:24 +0800
Message-Id: <cover.1756103516.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235438_178849_488E04F7 
X-CRM114-Status: UNSURE (   7.73  )
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

From: Chen Wang <unicorn_wang@outlook.com>

The original MSI interrupt type was hard-coded, which was not a good idea.
Now it is changed to read the device tree configuration and then set the
interrupt type.

Also improve the code to obtain msi-ranges parameters in this patchset.

This patchset is based on irq/drivers branch of tip.

Chen Wang (4):
  irqchip/sg2042-msi: Improve the logic of obtaining msi-ranges
    parameters
  irqchip/sg2042-msi: Set irq type according to DT configuration
  riscv: sophgo: dts: sg2042: change msi irq type to
    IRQ_TYPE_EDGE_RISING
  riscv: sophgo: dts: sg2044: change msi irq type to
    IRQ_TYPE_EDGE_RISING

 arch/riscv/boot/dts/sophgo/sg2042.dtsi |  2 +-
 arch/riscv/boot/dts/sophgo/sg2044.dtsi |  2 +-
 drivers/irqchip/irq-sg2042-msi.c       | 21 ++++++++-------------
 3 files changed, 10 insertions(+), 15 deletions(-)


base-commit: 8ff1c16c753e293c3ba20583cb64f81ea7b9a451
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
