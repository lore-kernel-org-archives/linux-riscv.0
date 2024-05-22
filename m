Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81432C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 15:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iLHOhT+divTUKroQJnX7SI+zVzQJGND5J9ny6/F54vM=; b=ULItoJitwJnHmo
	Ylc9TxGw/+TJsd/FxzXHfYWcbDYXDG84sFMOFZ53dWGWYM/RY1TSvwGRArw7SSwqrl9myf02121dl
	1mEeueRuVWFhuLbwCivqGtzLdk32cAvhWn7Be9w3qH13Ei8BwZBQUTQpxX0D4gg0VDT+fHY7KyZ62
	w708jmORnuERjZwAqGR5DSzwdEJLodQsE78LhjTPejSqxVCAb9gL2a5VuPs4wDMwMasSPikfeCQhn
	gds8uAxCYCExXEKqnu/X2e9b2eLbzeHCZKnIwnVzPb8kQ4h78JBqpBaiNdXG1CACWXsP1Y8F53JIG
	67XTo0p8n88RInKXG68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9o3V-00000003OZr-0t7J;
	Wed, 22 May 2024 15:39:05 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9o3S-00000003OYz-3Nbd
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 15:39:04 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2b9fe8fc695so2217410a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716392340; x=1716997140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k5AAweMi/Cc3C6ihqSri4sNCdqB5j4IpEH4KDrJTTyE=;
        b=k794oFMv6nl5MKdZERnHgnJj7ZkxDtuJ24m6frraEyyh6Aoooe8LO5e+m2O9xCy4Zg
         KlGZRHPeXD6AehBCHqBQ/isc9D7dh8jGlY3rR2y1NiNTOG30MdC1AVA9Ctfdp/UwufmZ
         Yw9SvvGBtIanPy2s/Ad6tvzwPjgxML+3B832eDIJoAfPPmQxPnkVuGubfYicMtCJ+MDY
         lJam46TjAjXNIza2HQCDbTlUB+CctGpW8XgKj0WjAsILgVEGGPse/y3LBIxmRAK2esPz
         jDE0kSsuTAZaZ3ycYd8s/JPhBaOhtQQIx/ZXBKVeosNO7EtFb+h9F+670lGvEIGER6O/
         wYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716392340; x=1716997140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5AAweMi/Cc3C6ihqSri4sNCdqB5j4IpEH4KDrJTTyE=;
        b=WOUsVwGaU98EfKbEMqcIq5QuZDeCdEKzNGI2cRO1Uf6jJTMeYgpxS1K+iPX5poaJo1
         hpJEP6vLr7JPMUl3GCHbl+zGniVjEQ729vpWRRcxH2Ouv2QL1G8hnwfjbKK9Cp0DGpiJ
         S1bJKrggjMylZH4c+ivLtDXY0/G+d2yl1S8Ah2DbsaqfHTfp+4WRSGeyiaLNkKtIzSpV
         FLi8oY6lLQttlSE1W6RBFZh6VSiwdp0WeLVJlaeQOCeX2vsuKAUc9e1C6K6MOp8KflkR
         uHHnR+f38gPKiSOK72xMxdsVFGKhtLWykbXf0SqCHAi/jd/ofqnQ6piKYi2pxzIXXjFG
         yCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgxesZBCqJoj8GlyrMrxD/bp/OrUAHg09c5Q0Y1oJ8VoecGWO8kpxXMlV6eYiN563b1qRIhqIveNWY79MOafdPiME9Yowg0fVcH18E7C+3
X-Gm-Message-State: AOJu0YxKKecEVszr5XoAspSVaoHBbLO8Lj1J5vdPP84OIFztIdIaGwGG
	iR8RO7U26lZ7HFBYiXm48DzBdZYq0+zcKpGUnI76NX34tQKU+QvI
X-Google-Smtp-Source: AGHT+IG7LfLB2krVUQyQMdVgWaqot3nEz6SRzSR0447sVsZOi3VS9XyroxKBGu5xwHGXLl54QsTP/w==
X-Received: by 2002:a17:90a:8d16:b0:2bd:92e7:e085 with SMTP id 98e67ed59e1d1-2bd9f46e390mr2242146a91.19.1716392340301;
        Wed, 22 May 2024 08:39:00 -0700 (PDT)
Received: from localhost.localdomain ([223.178.84.74])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2b628ea59absm25574077a91.47.2024.05.22.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 08:38:59 -0700 (PDT)
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
Subject: [PATCH v2 0/2] dt-bindings: interrupt-controller: riscv,cpu-intc
Date: Wed, 22 May 2024 21:08:34 +0530
Message-Id: <20240522153835.22712-1-kanakshilledar111@protonmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_083902_874120_3FBDF0D7 
X-CRM114-Status: UNSURE (   9.32  )
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
This patch is currently at v2.
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
