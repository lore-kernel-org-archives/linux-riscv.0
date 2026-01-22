Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6531C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5li8cQykRguH5kj9YCssxZiSt1xbvKnoVkpweeV4Y1I=; b=3P0vHoDzEZQeca
	9L/1Mz2CN00k+oXoDB8e6aWU3zRqNOxPPYoXebdafjBe49sv64YimgkXq4rXUujy1rpC9FADFcQMy
	dnF1TJo2hhtGa9JbGFQOIw1lq+118MMG05+5lc93YKD0wYxgVpNvm/yOKUPujt1Kk6aEUlwXPx+po
	2iGdk+0hVwvUIlw39AWcviqsXS9fEq9xi7QEtSGBP6mxsX6imuB7h/UvIjZUtzue03psshIdd3CJZ
	UoiT9bdbXt9NYOe8VEVbOghN99sD3Tom0vf7eGYOeUCp32o49Ml3gaBqlE2/cSnmfbUOtACr1e8+g
	IpwMC4C3KY6qYhk/an+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip91-00000006Xdx-0Rn6;
	Thu, 22 Jan 2026 07:30:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vip8y-00000006Xdd-3ufR
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:30:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a0a95200e8so4796365ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 23:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769067015; x=1769671815; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rr//05gnIsnuXVsjz8imH47FYtOzf0eSZEjsWbe6eJ4=;
        b=tzDMu0otcIXVyDmdXBhiCmY9A64WoKF+nGBfbHeiKVQQnfj8Hn8lTLrKAip+0GolCw
         CK0MSXHMcFttUh6YEdQd5s2MZXVPyHMQfQJgoeUUBPg7mbqh+jl/w6JK8rn/QWxmxa+U
         dJd3BeL6dzX6qJ6/rt83LdA9f8YlwTnZY6SJpRFfLM6pIxMQiRiB3KdehPo+lxeTCPjT
         pXe666C3SmCCPYuvxL8zkewiy1ZMO39C3+LYyrkWep7uYg/zJHsYvP2VM3L2qQuzb57D
         J1ZCX9l1Yh+K2aCeAnG+97HSpvFmbBV4g5ycsLENRvQOyRI5JEd3N7EFKRWAtmrBb5uV
         dLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067015; x=1769671815;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr//05gnIsnuXVsjz8imH47FYtOzf0eSZEjsWbe6eJ4=;
        b=ffiVNLneD5wp1S0Q1szNXBKWBb+fdgwGe+Nh+pf8Z3VhQiWhlcgx2leMFAC4Baydic
         Ub9a+aosQG823JU0AgUq5UxiRCa6gYYT8imUZ2l8mNJOmEgqibAoz7QC4IxFEo8A9OGU
         EDue6rUQM4gtPqzid16BYDYlZVXNkTFELcR/CtTfEAIktofoAy1DtUHwwhuoDBxxsixz
         vy85FCXOe0mZMJqbGgtdTkOqBbXfNbDD/nzx48P87UAFIAOvjR5f2cBiK2T6k3JR7HkB
         74PCNUB2e3eBXC47gZAo3QY7pGASkJsiQaPHKx3lyjaQYmVeeO28NUyNokZDEglP/Bpj
         BCyg==
X-Forwarded-Encrypted: i=1; AJvYcCVLCqctMi3Vl7pKF+4Gv2dNFwehffhhMtP77HwOds2DMKUP8E6RsTXAEmqXYKuKyBJA5BcLnI2DN0rtKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj4fO6dXLfPT7RMoMyvZe73lK4bJg4M4f8GlKIU810ofoTbuqA
	jo1P13OHc13yq+P0aNBs6c70qC3YW/ZqWkq66PMVOiAplC4QDzONE2+Ga8uu74W3oRc=
X-Gm-Gg: AZuq6aKEMIBx6+E+XZVnvCdEYStA7jlYxeqn4qZs1uHwM90TQ8BPSBqWb+AjY8wo3tc
	8bqvqLFmRbwjayeuYp8JF8oN4Rtv7uD7TJrodBLWqMw82OjBERrWGuYaIfpq/WYU9NJWphbT3/L
	dNOMIkU7n0aTNd7/CWHp27OwLPopKgGBX0I9D6Ejcj4iII8nkTQIXdqtqfveKEuiLMOlBHMmuMl
	M8essra8jwATraa+dr5XSO7JUilQ/m360dxj9YGoSgRhQ5md0ET2+tuUjLCeP2Ovi3MfISZnsfY
	Kgp/XUxSGuUVg4a9BM7GQA+lYo1VaGsDICyfi6odRMf2Glp739BV+kMtJADIJ7LhNvHuNQII7oc
	uMwHTNtzwL402p+X/T8egqnlIqz3/CIH3DtYYB4OTVlI//xZH3K5q34p29dI8cb4SXpXRi0IzlY
	osgpg1/POl6lFgvYxyR65bMs+oKewPMVo=
X-Received: by 2002:a17:902:e84b:b0:2a0:d4e3:7181 with SMTP id d9443c01a7336-2a76b1693d2mr79306355ad.49.1769067014961;
        Wed, 21 Jan 2026 23:30:14 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm171691845ad.23.2026.01.21.23.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:30:14 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and support
 board power tree
Date: Thu, 22 Jan 2026 17:43:41 +0800
Message-Id: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE3xcWkC/yXMwQqDMBCE4VcJe+4WEzCor1I8pOmk3YOabqwUx
 HdvqMd/YL6dClRQaDA7KTYpssw17MVQfIX5CZZHbXKN8411jksOEZOsnC0HtL1HQte1ieojK5J
 8/9ptPFvx/lR0PUe6hwKOy1SBwWz+anvW6Gk8jh8j8q9vigAAAA==
X-Change-ID: 20260122-spacemit-p1-ae596efe885f
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233017_281826_680B8D51 
X-CRM114-Status: UNSURE (   7.43  )
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

This series fixes hardware voltage constraints and enables flexible power
tree configurations for the SpacemiT P1 PMIC.

Patch 1, n_voltages is corrected to match hardware register widths, as the
previous values prevented regulators from reaching higher operational
voltages (e.g., 3.3V on LDOs).

Patch 2-4, hardcoded supply assumptions are replaced with explicit
devicetree properties. PMIC supply connections are board-design decisions.
Moving this to DT allows supporting varied topologies without driver
modifications.

Note: Patch 3 introduces a bisect breakage by transitioning to
pin-specific supply names. Probe failures will occur on existing board
(K1 Bananapi F3) until Patch 4 updates the corresponding DTS file.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (4):
      regulator: spacemit-p1: Fix n_voltages for BUCK and LDO regulators
      dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
      regulator: spacemit-p1: Update supply names
      riscv: dts: spacemit: k1-bananapi-f3: Update PMIC supply properties

 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 58 +++++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 12 ++++-
 drivers/regulator/spacemit-p1.c                    | 25 ++++++----
 3 files changed, 80 insertions(+), 15 deletions(-)
---
base-commit: c8a4a774a9b0d2c86593492625874e27e9cbc9a9
change-id: 20260122-spacemit-p1-ae596efe885f

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
