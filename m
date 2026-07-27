Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDE9C53219
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pfaNS7V8DCgi9pr0VuuIz3gBpGBYb5aru1b1xCdbHjQ=; b=EgYXU4M79l2IBj
	nxY9BacDckdJkrtneWrBIv2U+vbHftVacUkPCtG3lBiL1TlwV1H3BtMaAAH4UE+Ue1/UNOaafMeLv
	t9pPrfCNt4WysAmouexrxySrBpEoxN1O9eEjmsuPJE08VkPnfwaiZiNySEMEy6UMkP/a3lHCADycZ
	LYiIB0Yfyx0hti5Y7MU51Evwhc8dqMTQZ/p7VX9Y+ieE/yhY/01qo9xCsxPhK1xtO/IvrLJ7Nsx8A
	QRHkmzoRGxII5wmqpbLoeXzWFessc883d8aM25AgTgSnbsg4rl3RkgNHkEguXNnGxAK5j9h8h+95P
	tQm4a/Mc34ZGnDZebeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHvx-00000002N31-1gdc;
	Mon, 27 Jul 2026 09:47:41 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHvv-00000002N2U-3pBV
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 09:47:41 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2694384a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 02:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145659; x=1785750459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLPhM0E6IPzEl+l07UYYijZDLOCaVV9s+4+FtNKHwms=;
        b=Ga9UwIgchILArByxxo2PkfYxnDVoauASrLQ5pG58vqN2otq4RK0/BHR95u5mTsn03Y
         kchKkUuSeO6cvx9372kdKqvW5kSAPErYaTXs4P//LyU/r95gGhYUndhSaPv+rPpAJLxn
         sARuB4jgoWGPTanzMhxnBZdcvXlV7ZIEnFkFeLgu0HkgmnRJk5H9h/QfKR792glo9acA
         7nTmSRaqsyPmLy6pPaLlKHGYWCUVsHO5t7MtUsyfZdk5pOX95Us23sOGtWz4aJKQT+gj
         a7M0GZ/09Pg56bo1TP5lDYqLZqSqNrGCiTdkz4R3zvQULfl/JJpfvPdxeIHGHf2iRqxA
         YyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145659; x=1785750459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLPhM0E6IPzEl+l07UYYijZDLOCaVV9s+4+FtNKHwms=;
        b=ZdSgA368Ju8/RNVyXvOO3j4yM6+2Z9uJXN1WJJZGjUutyyPb/7+EtnK6PMBVhJnyeI
         SabT2kFpBBv6nAZY+NoUmL5aHdtmlN+Qyag+8U0F+HKHhVwCcu7e5Z3xdu/OWFnDErNV
         e0rJPbIwLKcAfMwULiDesQCLfNJyza5oJUB6fWF4cGErRk7TYCRjBNMlvMFMcbhxsE9e
         iW+Cn4lp6+PGMk1j4PLc+SzSjPVoKSUh11X8grdk3Uj2TiDsbrR+QwNo6+ODVMmPm7Fy
         5F5mEgZJSZuotx8SNRZVsUnI5N4/nahFLq379UXJuvR6v85YZEqHtSpEC5aIcvQsF2Z1
         ASrg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9qKv9s+DrKcsoJsI2FAum2H+8XzAs/q1CKmzBHIQ8g1nzHuOoTYkjymvg/IH3vmBeHy8hsaEbg+znAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoyBlv6fz7wj/3NRhXqhTIRkmkj5cEKamfWZRSYQMaCg8UbYtZ
	iqSY/j2aonh2i0avs0spOl8QDN99alfxkEOZbZxFEK78I1i0VfXxHSOe
X-Gm-Gg: AR+sD13+tX2t8/3hjN+iNXhK/XiDU1otXGg2EWKK1DRU8lsmPJpSQ4ysvoGGzp1aww5
	V/lE7Ak27oWzz3JbIZZu85DZ9+DHsepD/OxV/lrOr1iJmK29OoUQqoot9sbOtpcNgy3hqoENbfX
	Cmkl/PIxyxFu0kdIwPiYsQPDUQt3MEvCAEEsB9wRvs2YcP9N8OhBLgC+jzFGZT6uLOj7vU6g3cg
	5hV238dpG0jFTCMKTI7vfrcjJrLrC8/dITHpGYlZZDMO65pv4Tyv+OmEZCihU39l4zAcu3R9qGM
	Cat5XPLMRqCCz6av6RQG8mT5QwmaFQwmFO9fWpmyeLi7Zvzjae5WJhoRcnb76IeeQ6Iozsl3D52
	fHQUgkSw+6nDq4Gx7uPOgFdcn/+HtgM/4/qKznhUuVgMwXurvP06u8gPqHBWIOKiYhEiUcNisSg
	AS
X-Received: by 2002:a17:90b:58ac:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-38f57f34fd4mr1073921a91.21.1785145658748;
        Mon, 27 Jul 2026 02:47:38 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0eaa8sm4893167a91.8.2026.07.27.02.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:47:38 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: k3: Add USB/PCIe devices
Date: Mon, 27 Jul 2026 17:47:22 +0800
Message-ID: <20260727094726.890179-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_024739_950881_878230FD 
X-CRM114-Status: UNSURE (   6.09  )
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

DTS for series:
https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com
https://lore.kernel.org/linux-phy/20260703021024.495433-1-inochiama@gmail.com

Changed from v1:
1. Fix clock of usb3d_u2phy.

Inochi Amaoto (2):
  riscv: dts: spacemit: k3: add USB controller and USB phy support
  riscv: dts: spacemit: k3: Add PCIe device node

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  51 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 +++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 237 +++++++++++++++++++
 3 files changed, 321 insertions(+)

--
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
