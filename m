Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E14DC25B77
	for <linux-riscv@archiver.kernel.org>; Mon, 20 May 2024 18:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mPguiPKYQv9xDTWHFPizdmjEh0LLaih62OG+cQxvnx4=; b=yns6cVkH1pe9zU
	IZuYJW6jJE2cxFyx+fwEtUb7DSUMtegwqqFvUspnt4Rb3LHGIdLdW8hc7JBQtiUFJfWQ+p6XNc1tV
	DW7KLSfFce005OOMJKc4gMvtUDxpF14oJ869dG452dj0LsHjOOT5zmyGXNDFF7auXNbRx7DVQ2UfJ
	3zyge3ixLetZA/sq6zXvS5Zg3cXGsnYLOLthELT/TcL22jhT/ZJO/GLGdyFbF3MBLJR9F0/+aHRZR
	b7AKUYTW7zLGRFg2AG7b/O5xI49UFjSluxq0SAKKqHqvPZO0ABGl6diagg8NR7VPqXaKdsqycs40k
	N2jEfAtyb4908VMiF0gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s97yO-0000000FHbS-3Ipd;
	Mon, 20 May 2024 18:43:00 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s97yK-0000000FHa8-0F9P;
	Mon, 20 May 2024 18:42:58 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-51f60817e34so5314801e87.2;
        Mon, 20 May 2024 11:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716230571; x=1716835371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d2oO4m1fNwQVp4jNZt/1i65mTC9NxrLa2XCOe6bVJYw=;
        b=ACm2Om6jGfnxkAF1giREAOhOr+NaprRZBPlTy8Jz5UMGlxAOxqd7weRXBFS3hlWHuN
         1a3lGqBVOBntJtyhapRdOQmbo48OqVu8mItdIGdZbayyMVGZdbv1b3xp08jNs2QBGUAg
         rkoRWGidMnqkB9PAPm14rnlIUWuaVW7KuCPbNcst3UZW1K+4XZeRUxjQqBcvvjscXoOs
         xEKG8AZoR9OyJEEAq1CQAad+KrxuD6SRNG24sJnob50rCYsCJXy1sYRzxRukqcBwLVud
         FlKyP7OwhJHOPHT0HSatjEmBGeX9s4LRE6P8/Z90SKmnIfnCoJQpMGB5EgZGQt99grbk
         pCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716230571; x=1716835371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2oO4m1fNwQVp4jNZt/1i65mTC9NxrLa2XCOe6bVJYw=;
        b=XFCBC9ibeUXUuXNzp/SG618+0yb8GdgAu2TeNNz0P58Cb0LWXxexBxKB0zO+UWQZHR
         tCW64E50cfHbwQC4P6ibbzXotW4AEkHhduoW9E1LzkYwdkNTzNVBgwYJEt3D/MVtLHta
         U00RYtU4iT74XsM9Y5CMzJTomGKoQaVAGn0sKyvXTtKj92QCFotAxR7j6hY3mQ2zyjc1
         0LF+q81r+HLlZZtKY9g13JQp8cjhXNlBhSDbll4zBp6IZ6lkr2EA8/2pMwRUgSdW1tIp
         vYXmeVNbKjxu8URT3wNWOsRmKqeG9pFcpkzozxrEzgfAwoyT7kTXJKkUHIce7KZgNBx+
         iwIw==
X-Forwarded-Encrypted: i=1; AJvYcCV/5dSviITV4K8h7WquBXbukr9OvkNngjjgXEDokHSu9MyvBz9Cv8LCaHMmnE7OPYuzPL0/3r/Bjp+7iIJMtpo52aharMEteu7ZUHWD17a5DFdMj7TfrCkTf/Y80fo9siS8kOh+ZlBSxoRXoaZdn/kNfDS2zRM=
X-Gm-Message-State: AOJu0Yzyb39+oidejcY20FVTAfVktk3I8tAtS73S91ql7PQqkvxpP1wP
	ZqFUFeFgY645Q03KhbgQ4wsLeGkU6zXOSkH3H8cVgfbS3jEkl+Y=
X-Google-Smtp-Source: AGHT+IHowG1lUazF8YIjo3wKGFKSPdaQrkEopgqvVcpbn/3onng5ZcWOPaKYiEgzwOJh0DTC8Q41xw==
X-Received: by 2002:a05:6512:3494:b0:516:be80:178f with SMTP id 2adb3069b0e04-5220fe7934bmr19194028e87.43.1716230571213;
        Mon, 20 May 2024 11:42:51 -0700 (PDT)
Received: from localhost.localdomain ([188.162.49.81])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d335csm4368967e87.125.2024.05.20.11.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 11:42:50 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	John Watts <contact@jookia.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Mon, 20 May 2024 21:42:18 +0300
Message-Id: <20240520184227.120956-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_114256_122669_66A49BD2 
X-CRM114-Status: GOOD (  11.95  )
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


v2:
 - fix dt-bindings
 - fix a remark in the driver

v3:
 - fix dt-bindings
 - fix sunxi-d1s-t113.dtsi

v4:
 - fix a remark in the driver

v5:
 - dropped unused varibale in the driver
 - fix dt-bindings

v6:
 - add apb0 clock

v7:
 - fix a remark in the driver
 - add maintainer

v8:
 - fix compile driver for 6.8-rc

v9:
 - fix a remark in the driver
 - fix dt-bindings
 - rename apb0 -> apb

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 387 ++++++++++++++++++
 5 files changed, 494 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
