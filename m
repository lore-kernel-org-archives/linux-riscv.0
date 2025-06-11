Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF3BC7113E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lA+nNmeP1xs6/mGmCf6QvuzOmmEtaXdlMzAlnZ5Tk58=; b=EpDWXddB4mEcdT
	z23KY2OAmqB16uggWh195dmsTxmoP5cb6HHXPCaBskzHdYTMPFZB0nVNYb+0eEx/ewJBgZIykE/s/
	c4Ps9UsL3oSGt6j7sGDnE3DSOfBZkFfgQAlTXsYBd1FhkTOUnfQS1GmwivquD+WMONyTUcxF39zlp
	+uY0jZjLbDogrWGIf+2Gh9ecvOi8B9JEfF1ZbLpjgbtOjViHkhIc9LDpL5/8va4B9xsxyqsBXAJTu
	DNRT+6iQc8qra8iE6NmQ6qaxCdiZD6M+9y8ZdhXXWLr6zw8fBYUmyS+NdLhcH+YzBlp7WnMPmeXse
	ZAvfml0et43qur0CHiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwC-00000009Hks-2T4T;
	Wed, 11 Jun 2025 08:36:00 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGg7-00000009F6T-3GhS;
	Wed, 11 Jun 2025 08:19:24 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6fac1c60e19so7200566d6.1;
        Wed, 11 Jun 2025 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629963; x=1750234763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfmr4VZFRC3blHBv6tjDEsekB2JKza+TxJ7wwghY+Nc=;
        b=Fz1I5GpNgjVsoMXcWoeibAe8T1NPTJQAC8CeISdn3JT1tjpmENuyEdmYllV5sdVOt1
         nh5hQ9T3cPrFDJIY+FzqnhdhAHqGP3bI+23z+dQ+wC13FfhlBiOq5UBMz7gabPfe290p
         h5oUeSLoap/BWPjwPytW/dYrdZiGM6KnvaB1M81ou194+2vglGzg6ZSBkrg+Rsc7+7YT
         XGGcaAul4lxDY6n7WtJg6BM3X1T7tde+yTLx/yzRrWLu3JYGhOzir2/0Sw48lACKXn2I
         VjCAjU1plvCj2dHVfkfKcY1SyPnvaNGkXHgZNZXW30VkXg3GYNsHZzJ9TcOLY/JfyVje
         Vg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629963; x=1750234763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfmr4VZFRC3blHBv6tjDEsekB2JKza+TxJ7wwghY+Nc=;
        b=nbgArqzQ6WDUWIqhiudFjyIFlTBpyqLno1HY/UdvofTauOWqq4z9dLVtxzF+2ZMjGf
         oQye/j9O2MnlBV5VR2yvcqvrzIP+bUbvZYHSrrk91inJnrKvBz6vEgjjIx5k/l1Wf8ei
         Yq9IhWPU6/ov71WP9ZKdyUG3SzgBrsSoowIS2rkdGnBD7W0TUbFItFfEoxKpa3ID9M2G
         ZR2cDwioOk/pd9ZwAlEE2YEO5GeRbMXuRx0QwWa1B3ZfbDXVLFbULOUY+dfH4CHZiXdg
         F9GX+T7ChLNJgPGc/DhGT5yEQbVVzIelhW9GW9vJVVyX+jnQmoOkW2lJlM+WkCaNif05
         L5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKWPQn/6eCVIrzSXtSE0SoobW64AOeuteVUFJ9khT9YCyKGt9LkmSuMqtfiMfWmwVtodyvABnthHi4+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/wiRZZ6FN58eXToYE7OHen3fF5C7snQhAyICzmT0lpMgLLdpo
	iM8TcRigtX+p/arOUZ9AkVifKTn0mDDlvrDtU+WZ0gvSTMsfcDOKcg3E
X-Gm-Gg: ASbGncvR0rqVEX0NNOdd9Rc6VS8yWUKDCcAdvukTn2DqHnV5Y8so8FcmLrGDHaRHs51
	VBs0WJGTfBzDysRx1NAGgNVoqPMAOnLb0awDjony2wmMDEgQvSKKO4vuwpKr8hmKHYJm57m7lBu
	8ZncFq3zdel8IYfAEmbwk2aHGGgia1LtbNaFtLZYzZn1D0jjqV+V31kRuvQGVkHzHZb2EeV8bFM
	HXpHC4PPps+8SF+0pW6LR9N6NwQC3mfGTEJRsX3Kkpkd7uGH3mFQ1SIaPNOItOmSVh8jltBBchv
	JPaH+pnkEJE3ufUpZ2r6IrpWyeSqGDeTGgUsTw==
X-Google-Smtp-Source: AGHT+IHLmdiPK1/hfZ3hYVAS6e/Qa18yyzLJzaoN2F5VMxeq5n4N2SYxR2jD2YHscybgUqgzRxu9HA==
X-Received: by 2002:a05:6214:226a:b0:6fa:a65a:224d with SMTP id 6a1803df08f44-6fb2c37a204mr38375446d6.4.1749629962729;
        Wed, 11 Jun 2025 01:19:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b366easm78768726d6.114.2025.06.11.01.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:19:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/2] riscv: sophgo: add USB phy support for CV18XX series
Date: Wed, 11 Jun 2025 16:18:01 +0800
Message-ID: <20250611081804.1196397-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_011923_821755_4B09CC3E 
X-CRM114-Status: UNSURE (   9.39  )
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

Add USB PHY support for CV18XX/SG200X series

Changed from v3:
1. patch 1: remove vbus-gpio, switch-gpio and dr_mode properties.
2. patch 2: remove all logic related to the bindings change.
3. remove the syscon header file.

Changed from v2:
1. add item description for switch gpios.

Changed from v1:
1. remove dr_mode property and use default mode instead.
2. improve the description of `vbus_det-gpios` and `sophgo,switch-gpios`

Inochi Amaoto (2):
  dt-bindings: phy: Add Sophgo CV1800 USB phy
  phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X

 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml |  54 +++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/sophgo/Kconfig                    |  19 ++
 drivers/phy/sophgo/Makefile                   |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c          | 222 ++++++++++++++++++
 6 files changed, 299 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
 create mode 100644 drivers/phy/sophgo/Kconfig
 create mode 100644 drivers/phy/sophgo/Makefile
 create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
