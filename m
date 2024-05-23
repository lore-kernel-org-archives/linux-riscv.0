Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC62C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lOoXn13jRS+efv8cLP3PdV5KiUBnj1mKXueqHfme+k4=; b=CJbBZV9AD26mMq
	gdNV5Igoq/+EnH5COo0Gci4+WWHCkSGI9l/kIPtjo98ewIZxyCyqW+K3AG1Hmm2eKpTrETdMNxpnJ
	OVDtBZWnr8lNbUIe02ARbQDwhcGnAmMaJhGXwed0lqpvRpOl46ZPUPwb99rWjkOy4gwyLxfNgz9lt
	ccNF8+J8o00faRZ0WBc9n2ByIzW9ax/FQRMuOBA+5OPRq3lIiDUbTvVpTFJ0/sJAhHiG5+i9Av2F3
	FocVe4/MiteisqeWdjR/ByEpM0GlAgo3qpe/wseVQhVlDJagWoJDeFLucVz5nKJwzGxxHa7KwHlEu
	pzyR9yw8Wi6j3TrnCUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAAfp-00000006hM4-0CGk;
	Thu, 23 May 2024 15:48:09 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAAfk-00000006hKD-32Sa
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 15:48:07 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1eb0e08bfd2so125241615ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 08:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716479282; x=1717084082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o78m7F2cS5EFemgK8KupdgtjgpDVHetWIF7RgPFVkmY=;
        b=BD8ZLI6xzndb/L6stVnE3nBO/gbgsAM+Jv+qYDlhg/OUn0l67/PcoJCo9cNEeKb1Dz
         wTd/yjhwOoZdiswyDDPHGt7HWhZB8XL6lGfpGQ2KS8212CpM6vqm6KCBCu7Fhh4bpQAB
         Qin/yNmsw3ZY0/Q1o2DPx/l3g6xEVxdBMIhvvfFebjnX603kEjc1jwilGWoUn5o+4HJy
         pb+ipznMwSixIQSY3pAKXzdQi0ZcqvqIyYNxOQqk7nATKB74iltgQy58tLyn3Upb803c
         7XbWazv8Ym6HpOS9TDh8hoxrvttPGdpSF30mKHX+MUwy/DuJlTlOZscfv7TzQPD16g5t
         LdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716479282; x=1717084082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o78m7F2cS5EFemgK8KupdgtjgpDVHetWIF7RgPFVkmY=;
        b=Vw59ucWhx0XpRSuOOP/HoJ2SqYwuOUiqc7YfRUyu56jZ8TKOPub39EyDO+5OCvPFVh
         M9wpjUOHkiyg0SGvVkiH099pbzXLvGWkmz4CXIfmH0lZAmTxh3Td2Xld2Q87ZEZ5Uyxk
         XQNt8ckOX/PNAgRVLWaLq20S62BRhu3Kt5GdiAGnh7Gdwt5TMDGxdprkv+NjknOKSAPS
         NMXBRlVW9Q6VeusjbTV1qNxCcA5Xqzq6SqnY+0qhm6YD/8ItZ4eMIlpJUszmTOHhVhyy
         fXDgElKuXgtqf+q7GNOHdFLaqxHGEByl2m9s2dprNPGx1NAK+LNhHNDE9mOOaKuEPF+0
         Ol9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcY+kmnG0oI/70wgIppd3LqKqhtZip6RpGyxdfnBFYG2mGlHDL9SlyanvKROID3AkPTDOwUNPQoTdGvrtFyPIt/voQ2ucC/fB+vyZG//H0
X-Gm-Message-State: AOJu0Yxzg8bd5I5dO9rfTRfN0DMSFw//WL8Wh050/iHBY3mLR29TU3QS
	JsL8z1QSY19QLL0U6hjNnqeFa00JC8RjUEBZQDb/eQX3vz4tTBty
X-Google-Smtp-Source: AGHT+IF4h9aBQCAvqJguyc60LZJdBtiCQ1a9fs+Yy1U0Hmo3zlBITbxQlQVsAh2MWnwEKIk4VYa9SA==
X-Received: by 2002:a17:902:dad1:b0:1f3:4945:28af with SMTP id d9443c01a7336-1f349452ae3mr13316705ad.11.1716479281862;
        Thu, 23 May 2024 08:48:01 -0700 (PDT)
Received: from localhost.localdomain ([223.178.81.93])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1f3361a6678sm18321085ad.178.2024.05.23.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 08:48:01 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
X-Google-Original-From: Kanak Shilledar <kanakshilledar111@protonmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RESEND v3 0/2] dt-bindings: interrupt-controller: riscv,cpu-intc
Date: Thu, 23 May 2024 21:17:46 +0530
Message-Id: <20240523154748.22670-1-kanakshilledar111@protonmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_084804_813562_E57F8C83 
X-CRM114-Status: UNSURE (   9.06  )
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

This series of patches converts the RISC-V CPU interrupt controller to
the newer dt-schema binding.

Patch 1:
This patch is currently at v3 as it has been previously rolled out.
Contains the bindings for the interrupt controller.

Patch 2:
This patch is currently at v3.
Contains the reference to the above interrupt controller. Thus, making
all the RISC-V interrupt controller bindings in a centralized place.

These patches are interdependent.

Kanak Shilledar (2):
  dt-bindings: interrupt-controller: riscv,cpu-intc: convert to dtschema
  dt-bindings: riscv: cpus: add ref to interrupt-controller

 .../interrupt-controller/riscv,cpu-intc.txt   | 52 -------------
 .../interrupt-controller/riscv,cpu-intc.yaml  | 73 +++++++++++++++++++
 .../devicetree/bindings/riscv/cpus.yaml       | 21 +-----
 3 files changed, 74 insertions(+), 72 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml


base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
