Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3CFC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 18:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bbra0hxA67R4l3GMByRmvXJE2415FVfRYH4ApNHzVJw=; b=lV9fwRrZMJtSs5
	CPF1FXG99D6MdsnOELK4VZ8LA0R87jFbm/5e/RcI0nq5ZA8gQM8clBfYRCTYmWdwEAHMHaceE2pwv
	ECRLIVzQS+iJIQe+7v0Emt7lBqWfq1GkAWaUn2D21HBgf6pd3ZsH7mXcQxa+d/3jA4VkwCa3/OAOW
	GO6rmNxYTCCZBXyFe7H3IBN3MNQ5rcDnLrC2KFrVE95Odr24zB11eEcscr8OdcxUgUB3toAogQlIi
	1PTHx50wFbeSgIajlafRjULYuBBjEcA1d70iUi32uaJ87nSUgJimv3FGvAmy0LaJfipFqy9Ne91cH
	yv11ggOoPr6otJs5w46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAyOI-003xfz-V1; Mon, 11 Jul 2022 18:44:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAyOB-003xbx-GD
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 18:44:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id h17so8216950wrx.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 11:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Faba1IAeoFPLJV2hWR4qx2pHr6WFp+URpSyXW9hD/sw=;
        b=EnKbvDK3bChx+ZOchcvV42N2sV91Y4yRRlv8gQYXMV5YZwSb4p4phAYGN2arUTkd1U
         9V/94GurexAHB62cHXmX+NUAm0MzT0A9K05Mp8BmavqOut87xxXt9lXLVLfM0JWRLhC3
         XzHjlOskracRxd3jY8q3Z9h7YfH7Xj0jmi6JTUwwqtB8KhV47qU21mFL+KaCjf1OUtBH
         fdkmCs+vDWudLzSm070UBLxH6KMnAicJv11Gubqd3bfVb541VC007JULyGU4vy24hJZv
         FsuAhASoDzEgHAI9vt4eWUl1dIGDFJuXi/1VF1JD2xhN345jAwYgiCB2SUgXmybObRuN
         hrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Faba1IAeoFPLJV2hWR4qx2pHr6WFp+URpSyXW9hD/sw=;
        b=BROtHYIV0gJBvRXJyjXzX8L8gBrpp+QWoPIXDzd5+sHzsBxmdiZbgVRTo7dkYJiSOL
         0Be+2f6gfIIvYFcn0Zgl55cSR8SMotFlg01Glb12sghXBA02LRL5SdApBnKnm824oV/1
         uhEkHiqLblumWVQqVjiKyDONKz/n507ocVcPyi79PXjayxBZyln6qLFPdX3gIFzlDdKP
         n3PK9xrmYwt15taqHxzo2iJuWCO1XVkBj4TkPzAXJ+EJKATJDM1q96A2I+9goIROQVhZ
         XiJjgWR14UUGWx55jfiaSkp57IaCN2eVyMqY/p25GPjcZoRR/JnFjzfAcl5bMdQnhvPy
         vnLQ==
X-Gm-Message-State: AJIora9rqBmCDiE7dY+bIiYmx08zXD4vWyhrSomXGx0YmealxS2CRIdp
	KUFppZhcVoiUEsC8TMm3Iw5s8YT/AaUdGi8H
X-Google-Smtp-Source: AGRyM1sqEmRYcTGeiTRRmrfP00jXcrV10B5+0GrH64Vg9kxTeAJXcFnx94KqZ4MPYAQZ6yfHVrhfaA==
X-Received: by 2002:adf:eb0f:0:b0:21d:2f1d:8e40 with SMTP id s15-20020adfeb0f000000b0021d2f1d8e40mr17664845wrn.207.1657565048244;
        Mon, 11 Jul 2022 11:44:08 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c410900b003a02cbf862esm7330892wmi.13.2022.07.11.11.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 11:44:07 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add the JH7100's Monitor Core
Date: Mon, 11 Jul 2022 19:43:24 +0100
Message-Id: <20220711184325.1367393-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_114411_604001_511F9FE5 
X-CRM114-Status: UNSURE (   8.41  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey Emil,

Following on from my RFC [0], here's the real patches adding the
monitor core for the JH7100 w/ the ordering changed as requested.

I had a look in the SiFive E24 docs [1] & in [2] which said "16KB
I-cache with 32 Byte cache line". Didn't have anything else to go on,
so I kept the same ratio between lines/sets/size as other SiFive
monitor cores, but since they're not 32 bit I dunno if that's correct
(IOW it is a wild guess).

The dts patch depends on adding the series adding the cpu-map [3]:

Thanks,
Conor.

0: https://lore.kernel.org/linux-riscv/20220710111330.3920699-1-mail@conchuod.ie/
1: https://sifive.cdn.prismic.io/sifive/dc408861-94ce-4d82-a704-caddec98609d_e24_core_complex_manual_21G3.pdf
2: https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf
3: https://lore.kernel.org/linux-riscv/20220705190435.1790466-1-mail@conchuod.ie/

Conor Dooley (2):
  dt-bindings: riscv: document the sifive e24
  riscv: dts: starfive: add the missing monitor core

 .../devicetree/bindings/riscv/cpus.yaml       |  2 ++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      | 21 +++++++++++++++++++
 2 files changed, 23 insertions(+)


base-commit: b6f1f2fa2bddd69ff46a190b8120bd440fd50563
prerequisite-patch-id: 946df827e9dad8ca6e9751fe4ba01fd5fe9d18cc
prerequisite-patch-id: 59626290ee7b1e725bd446a4b7170ee2d6ca9bc0
prerequisite-patch-id: e57a94cb7d69855a4e2d6044dcf86fbfe35cb696
prerequisite-patch-id: 0ba94fd09377953ec4e9692358de569a7932bfa3
prerequisite-patch-id: 398e9b178ce51c924bbd9115020d84b677f773bb
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
