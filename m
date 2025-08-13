Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D105CCA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 08:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KC6CeFJYnNaRHqvKqicCQ2syKxxNurb1eRw6NMbnNaI=; b=svTd4b7obAgV4b
	wjAv31IAJBb79sYbMT8MFj/dbsr9/trA+5furfi0f4z9rVBFlnts2I4ehjFpWOXwUegd7dkv68u+Y
	H/t2O5zwg6gD16qPAFNktLZz3mfxfDsQoMjg/sZ2b4y6ZDHloBLVGwewunIRXlshSMLV+5WGahIKT
	rPUahN9TV0DztBfEjZ4IvcpD30YxPPILbPRmMAVnUrl9Wp7DPLPL934JrBqOieWMXfYAOvMCy1UrR
	uxcKtNJaz4Ee4dePU2SmGkEctUrSD0Icji6R/cEw38xwUDqAux4wxKMqaCucxkXW5eqaBZnidCF6p
	4yr5EYU4JXz04cQTL82A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6xD-0000000D7Iu-1nTQ;
	Wed, 13 Aug 2025 08:35:27 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6vQ-0000000D70i-0ZrX
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 08:33:37 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76c3607d960so6837730b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 01:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755074015; x=1755678815; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPDzkkyEE1PeddGvWneD5aTwEAedh3goCtrGQWQAwUQ=;
        b=eV5WQ73AiioWYUaJIpwcWWTtEthIQuS6X77yuKqF0uWPJOia62UvWOcuPn6RCmsVO1
         5rN5yFFFDI2tc/aMZR4SuQk9opKKFbxq7+hYABsar2zgOMvlbjOBqXPtQWqm2+NvpCWC
         UlQ0wMYbwIlUx7ianbuvg+6CWlsMmVkNoncWrvvN2vunYobrNFASM9q6apl1wafUaU5C
         cnb8sni5CYd8kMoDc3s9IPpRL+d+XD5I0fUE2apFmNS6VYSeijgxDcHr/bimwChoUkN3
         tJJ4Pv8mKPfRd4I9OZ9wN9bnrL2TaGdsQgpKEYnQg0C+orPUO3m7B0nQ3JLtbb6QsPyh
         PPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074015; x=1755678815;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPDzkkyEE1PeddGvWneD5aTwEAedh3goCtrGQWQAwUQ=;
        b=PSze+p8eJl1A+nRW40WCieGDackW04jG2xutZqcJMmPTDuFqE3OkNXq2PzSCnirkHy
         3LsU9lC9ILg9qk3TosMCKbCPIvc7tHDw8WP2wf85goy6QgqQC8FvhbotvyYew6bFMZL7
         j1x9nV7eTFqOz46+toZHNw06E1xyoQBYdd9UZ2C2ZaldDJ7mUhNaUzHbk0JtF4oeHkMj
         lE67fqdG7jCRJsFs/qHkrYeY1DYqh1je8wiSxR3rCi+nYQXvzCfkNqH6xUCAMT2xcTbR
         owGPiBbcPVsk8L5ClBNgVoddlyDzZ9DJ1R2keaqmDMoQjZCxSJ8Ttvk6pE/7jUYSwJJX
         9ZXw==
X-Forwarded-Encrypted: i=1; AJvYcCVeLm4MvZZtl2Chi97WVb5Sf0zKI6PHAZHw+Iu+aCjH+JW/oc6qE/bRmdzAwX015A4QtrEY28sRVFjLsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrNnUMhhcobbp1eDLXuQnID5OWRtCRv1aHtO3DFJcPA8sppTFF
	3E+32yqDmAx749YKDXENTIM5CqYbOa485am7J/fEKGXJLbbwswrwucknh4lyeoYUe5Y=
X-Gm-Gg: ASbGnctv6NrzxtQGPB3rN0GKyEG/S2Mv9xbtEy9Zj5R0WyvglFMgYjL9CU8VP9Hvymd
	LOusWsBeafTxTAbp6o0ZVs9f7Q9WKVyN5HDY7nA2MDDC1sAW0Ak5a1K6jsDzStDaKfEweS3ORCN
	4INW4lw0qzEIXHFcxbkhl33nBKJi3gQyy7VvyryvS48P5+Phw0MTZcRPXzc7EovLI1oVL3+E8AI
	vlynhAACpOdD9e8c75qAQM5pFl8Fz4E8BVDoOYuKo1YC4/m76HaIVe8R7dSe41KpqCma0BlfvBQ
	05mX+jRAkVU3TmY8xz/S1T3SHiFnqNQoH5VJgShxmdVAGkccFsEU96sSdHd1BSf4eO7392KkzxX
	l29deEQc5DYDfbcQ0GYE4VA==
X-Google-Smtp-Source: AGHT+IGMVj5qQgOEZF3d8kkN+1z3WSDn/Ir88GWROkr8GIB4WMLaFMX45LhxQA3lGXmOJzy4c16XnA==
X-Received: by 2002:a05:6a20:42a3:b0:240:1ae7:d918 with SMTP id adf61e73a8af0-240a8b8f9bbmr3831126637.45.1755074014305;
        Wed, 13 Aug 2025 01:33:34 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.193.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe50c8sm31307814b3a.120.2025.08.13.01.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 01:33:33 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Subject: [PATCH 0/4] Add SPI NOR DTS node for SG2042 SoC and boards using
 it
Date: Wed, 13 Aug 2025 16:33:16 +0800
Message-Id: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMxNnGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0Nj3eK0dN3igsyUkmLd1FRTMwMTE0szy7RUJaCGgqLUtMwKsGHRsbW
 1AFUvfmFcAAAA
X-Change-ID: 20250813-sfg-spidts-ee56044969fe
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755074006; l=1045;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=r6Pn4FavBLGpo16RFcdQETEDvimR9cNcZh+43E6Wt98=;
 b=+JRymJXHHVyT36A7Tp9FTHfgaMJLxh95vFfkRmpMEHXieKVf0ypJ3KaezY3uVpY51/Y6yJoFM
 N+tGbq15BpaBwiN75DAzUoL6wMYpQiBkPLEyWXLwhJcsugfSnzY6WNR
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_013336_179969_E7110784 
X-CRM114-Status: UNSURE (   6.21  )
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

[PATCH 1/4] and [PATCH 2/4] are copied from patch set [1]
[PATCH v4 4/4] without content changes.

Link: https://lore.kernel.org/linux-riscv/20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com/ [1]

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
Zixian Zeng (4):
      riscv: dts: sophgo: Add SPI NOR node for SG2042
      riscv: dts: sophgo: Enable SPI NOR node for PioneerBox
      riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V1
      riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2

 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       | 24 ++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       | 12 +++++++++++
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
 4 files changed, 84 insertions(+)
---
base-commit: 8a4fdd09c96f6713e6cb47d36e9f9dd6f6694215
change-id: 20250813-sfg-spidts-ee56044969fe

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
