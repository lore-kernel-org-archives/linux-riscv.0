Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7761C8303F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 01:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hRJDaVMt6a1i0xbUKVnssDFF+ToLHgWTwa1We9LXF8Y=; b=lim/1jiBCBY4pW
	SLgy9mrRClWtxxYu9vNyLp1TU8C4Uofspmujn1cq84zTHZ27QL3jX0JJ7DVA6RT+SpTsIlYGJ61Hz
	1+MUtwPs9UlJXRHHDGwVuQqKa8HOigSPSjwjOD/S5+iEXJVULMhY1EoC4HByeAJ58knKwkk7rmn/U
	6Hgi8TbUMRd41RG50vNUCuGvmPoccafaw3eNYKn2jb14GCrIwtzM7Y9uySY7HBNeSgwnN6JNpxPfS
	D4sr4VEh1gmzh1W6CFzgE8BgdR9ZJsBEpBOK6f54vbTEXzHQb1Xk+dDGWB+//LRgttt/zFeBHgnGA
	rf4VKZEt7YoyGgd8nGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqiBj-0000000AFuS-29KJ;
	Tue, 26 Aug 2025 01:09:27 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqiBh-0000000AFtF-0ash
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 01:09:26 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-61bc52fd7a4so3503487eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 18:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756170564; x=1756775364; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jNepx41UElk7QS0w0sFASE9HqsxLVcmPU4Fw7Uj0xgA=;
        b=k0xX/u3mxXbXq4J7x4E5+AAnQZAzaDJgeuvezSKp+ofLTJx4kwP6JhnDA4Q5WoOPhm
         a1W6iRdqv5ycc39IKSwsoORVMM0co6W3wsdTg71OxCCf1d8dkf/6NgkjtXEaPkGAA9Sg
         zJ/a0l6J75uinxYpG2KyqNkbUbq/6Lo6HgBar0URooAIkueqFWqwu+OELNtse63HK0Gy
         nqiTyyyjeMXdPnOJUD3ztJJNhmKQgFLrl+Ibpw5SH4rfpgwa5A/CKlBnG3ATTdNrbrSo
         KYMbsj/hxgA7B3GVIzsHehGdziWruEAEPj89UhY1rLmgOJtaTRDX0QjnJ0CKdUuzx0E3
         tx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756170564; x=1756775364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jNepx41UElk7QS0w0sFASE9HqsxLVcmPU4Fw7Uj0xgA=;
        b=hXsSt7MKTTrS0WvDct9sdyyeLtfsxNx+5uBNV3La7RI4roIBCH5OeBEgYNKMEHPCw0
         bUY0/HZPnX3UFhNM7zTMd6F0UX1Jp0uFClopMyrjpUqVa4en2SLJ6TyQrDeMEeQYwV5I
         QVT84t1Y21/dYCVhofbj9zTj0SmqCNoWiCzdniGhFj5s9tWBdX8JeUYzfu/6wBohiDSW
         BHnd/TxeJXhY6b5+/J6dTPQAR3MPgDWfPmF6oLqjLF5Bwu/A1PCAJuXnJ/t6baQHEGxJ
         uHFEwCwIDMh5QFgJwXrwgVY+VgBljjFwMQmBSfJdUNPmfAvpLxRVUQy4vWDM4515GIqC
         3SzA==
X-Forwarded-Encrypted: i=1; AJvYcCUAuau0k3hN4a2klF2UMZKkFHS4mjaPQIjfoIHiJMSlXyWhxjQZYps+npsnJFRIk04+TmJG2N35zAlPYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrmDdmixAUHK4hWlVIL4CYT2dK3fbBednlLqsRAVbyEyoAeq7+
	3XYIf38eUDthJOccZhfxyWVy3c+3Y2dM33hl1XPWMI3hlrxQ71PgSuRd
X-Gm-Gg: ASbGncuIBhz50VsGynywnewz2bDtCfRtV4xYfOHpJhMcK7GagAh/Bzy9FO0KM+kvPzU
	0cIx8okausoyUlff6vdbKw3a8BMEygQvKP2xtghiQrzG9YVzW8VPK9PmO56jC8lt1arv9HCnbVb
	W1d7qs3Z86otcryB7+yr4f1CUe7wrFYPLxDctBRXocRHW/O1mFfOFYxhz7slsyAJEyIugl8/EqI
	p8gu5+0tn4TItDPTRDKgtYlW0hOd+qIdz/MPFYv6md8s8rcck7bdapL2/2lc7vatJWFVXsIiDd9
	Ru1vk5K2yVQB01rqg9xwdcFlDpKXFdimvx0t9kz8fz+oUVMS/F8PCG0Ti7oTvGym2tbmowUpbqH
	xi/r6bsx91dWyNNYBgyO+IPqSj6Ws9Ec9
X-Google-Smtp-Source: AGHT+IGBtMv/0WW6P6N98C1dIhOAFBvRCQyuAP3X162OIex4ax2CK73yYgTB3SfjwxO4OMw9LImXvw==
X-Received: by 2002:a05:6871:3a11:b0:315:3dd7:91be with SMTP id 586e51a60fabf-315439e84c7mr937923fac.16.1756170564040;
        Mon, 25 Aug 2025 18:09:24 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7ca7ee6sm2168480fac.19.2025.08.25.18.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 18:09:22 -0700 (PDT)
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
Subject: [PATCH v2 0/3] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Tue, 26 Aug 2025 09:09:13 +0800
Message-Id: <cover.1756169460.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_180925_196522_9E3DEC18 
X-CRM114-Status: UNSURE (   9.93  )
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

This patchset is based on irq/drivers branch of tip.

---

Changes in v2:
  The patch series is based on irq/drivers branch of tip.

  Reverted the change to obtain params of "msi-ranges"; it's better not to
  assume the value of "#interrupt-cells" is 2, even though it's known to be
  the case. Thanks to Inochi for the comments.

Changes in v1:
  The patch series is based on irq/drivers branch of tip. You can simply review
  or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/cover.1756103516.git.unicorn_wang@outlook.com/ [1]
---

Chen Wang (3):
  irqchip/sg2042-msi: Set irq type according to DT configuration
  riscv: sophgo: dts: sg2042: change msi irq type to
    IRQ_TYPE_EDGE_RISING
  riscv: sophgo: dts: sg2044: change msi irq type to
    IRQ_TYPE_EDGE_RISING

 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
 drivers/irqchip/irq-sg2042-msi.c       | 7 +++++--
 3 files changed, 7 insertions(+), 4 deletions(-)


base-commit: 8ff1c16c753e293c3ba20583cb64f81ea7b9a451
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
