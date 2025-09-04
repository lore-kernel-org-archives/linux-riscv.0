Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F4CCA1014
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 03:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sksqFBR86NNE8oduwd5A5qfhiX7lxX8oga8PmoYy844=; b=aTAaCy8hhAzwFQ
	a9ZlZU2bONvXyOfwPMOhu3CeeQBMVZufePOGBPaCscHXQxGnQAyuEktI51hhvMwk4PPF7N9vkwDwb
	rlz2zwP8TmI85wQdBQMsEUEb5lZqOL+fLhjkwNWnc25IFpqy8A7xiCoz++svQd5emh8YjxxanQ2Fk
	B7WJjWiov+amHhGWXIMq763ql6vixJwLy7RBsvECmatiYxOPUWb+Wo8U428Ph1GIDYrP5vDaaPZ7E
	QJSff/dIxqWLzUG5Yl0t/Jr662aVfcJdU5M0VlSKMz6SsHAFIu6rMCdyysAEu8a+/mUHuB5rAIu3I
	Zqag12E8CMeRXFqXF7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Cx-00000008Xbr-1cET;
	Thu, 04 Sep 2025 03:00:19 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Cu-00000008Xaf-0bWi
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 03:00:17 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-74382048b8cso413449a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 20:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756954815; x=1757559615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFU219JiYxB+UL7dKKMifccL2sg9lhUG+NSi9MilUC4=;
        b=dLTohrPSPOjgTRs6/MvuTwt49xEaN/mpZd5s1eG06zdSuR9xzDcz6Pu7ahCuH0PitF
         HFgv3+aHydh/kWL+BgoWd9UrB26Ymm6d9fO/piT1LZpL7VT+vQ37FMqSH7Ug5CK9u8Xu
         jsLBjN7+6HQuEUnDrg02XrnfWf3FijfhUaV1S3kBnn7SxLxsh1/SUbRGZvPSlP8vE5n/
         Yb/Ln5gtk9YlGTaSWShVSeIoDrQa/dDCTCQHpdf96d1drfYgjqFnVmcd85Sc0IoNrYX2
         AKJz14ij/Eg7v+Pl3wP/cA3NiA28UgZ19kBC3Kt3vlbTI/t4meRdbCteJN0aMudozr61
         Q/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756954815; x=1757559615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vFU219JiYxB+UL7dKKMifccL2sg9lhUG+NSi9MilUC4=;
        b=PUxnNgTRYwj/zTOcibehc9HdmdgNCO+/tE3HtPj0waO5eOUBbVAH0YBexWj+6vx2c8
         xoQ+mGRfAZzAzUFiDl+vn8B2lj/ju8Obj0QsM+hwpGQ1b4rkWoTUGVDFvr7Gvto2FVY3
         YyCwEPKaj7yv4stKmHbGNkReVHvMBtM6u/67WTBa50X0hdQTL/+LW8i7fuUc+HUhaPLc
         fEEkeSnqv6QV84WDqok5xRjFP4y/tp5WlcEoDV/cPjPNrsdlnZMK2/J0A3g7EG8O9ABY
         qpLBN/mzNOyHnhAt3EWxXov+Db+AzUYs0uEz/ktafGfReRFp68r7hsWOG35xx3tV4ur4
         nHCg==
X-Forwarded-Encrypted: i=1; AJvYcCXkOPboA1mtd9kVyT1/W8mh5J/PoagVrjacLGDDaPGGevjKX+yATB+2yZgKv4c8YYi21InQKN11GuE7cQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK0vtWLqonqeFAJZEwWE5pLbjT9qLo9PTxImeehp9+n4iHTtCF
	f3W/LZlQl5kT9aDYko4eA7dojYR/QrIBbPVUriADnxMPfOiiGE+ZEzBe
X-Gm-Gg: ASbGncvEZCSieQfbbpC/jTpF8ukZltrRKkEWnzHLbSniSt2/dS8x/rJDk1J7Cvujhte
	STzegTW+REcsPfSIJaIW/3ZQKpSOPccrc2Q8iRNCN6jlUcAmZP5X+jK63OPLOrUfZoo82BK8x1i
	L/KLyiPaBQVwY2FnLpoqluAd7sT9BflOCtVM82maUe5xuw/gJt6cTPrzw+yRZ4B1ZaGGfSjxdmf
	6Gj7aydaA475xJISeGByDf9PWBidMOPU39UXf4+vTTnnawqXqAVS2ymce3Ugmo+Cc2Cx1Fpop+K
	T0tFjn0UITOB8dCGIADG6+ukuOOATWvZ9keT2y5NwSehPnGGH2fgZoR5jWZO077bYG/F3P/31nA
	ueCWjnIq6Nyk5BFwYQU+kjmq9EQk/36mFuWizh/S6jh4=
X-Google-Smtp-Source: AGHT+IFKeulPMsBsQALjUqa6sF2+AWk4bJt+0haQDiVNq0B22+NXV63rjkaWnjX7VtXX2WZpPqcF0w==
X-Received: by 2002:a05:6808:1b20:b0:438:3911:48a3 with SMTP id 5614622812f47-4383911506bmr1569553b6e.48.1756954814645;
        Wed, 03 Sep 2025 20:00:14 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4380007b0b6sm2262726b6e.25.2025.09.03.20.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 20:00:13 -0700 (PDT)
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
Subject: [PATCH v3 0/3] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Thu,  4 Sep 2025 11:00:06 +0800
Message-Id: <cover.1756953919.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_200016_184119_5E8BF0E0 
X-CRM114-Status: GOOD (  10.75  )
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

Read the device tree configuration and then use it to set the
interrupt type.

This patchset is based on irq/drivers branch of tip.

---

Changes in v3:
  Thers is no major change in this version. Just adjust the order of the patches
  to change the DTs first. Thanks to Thomas for the suggestion.

Changes in v2:
  The patch series is based on irq/drivers branch of tip. You can simply review
  or test the patches at the link [2].

  Reverted the change to obtain params of "msi-ranges"; it's better not to
  assume the value of "#interrupt-cells" is 2, even though it's known to be
  the case. Thanks to Inochi for the comments.

Changes in v1:
  The patch series is based on irq/drivers branch of tip. You can simply review
  or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/cover.1756103516.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-riscv/cover.1756169460.git.unicorn_wang@outlook.com/ [2]
---

Chen Wang (3):
  riscv: sophgo: dts: sg2042: change msi irq type to
    IRQ_TYPE_EDGE_RISING
  riscv: sophgo: dts: sg2044: change msi irq type to
    IRQ_TYPE_EDGE_RISING
  irqchip/sg2042-msi: Set irq type according to DT configuration

 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
 drivers/irqchip/irq-sg2042-msi.c       | 7 +++++--
 3 files changed, 7 insertions(+), 4 deletions(-)


base-commit: d36bf356068cdb5499b9bc458db9149c0fd938a2
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
