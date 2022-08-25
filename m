Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332A2ECAA25
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w/tsrT0MVfW5h3Pm1FHN/65wA/lU+a+mL2M2NFpyDDY=; b=JjGO4YDFGNLXzK
	e5Tj2kK9feLLLtpyO+Tp0gb0HGpPjuOFJwI8Rs0/2QCCtOLc2DwuM2fKNV323UKrqNI1kW1whQ1t2
	H1uDMlEfC5ua2U5BPzueI4EkfH/8xyNEVU9mhBFOAjutgBztA+31Xfq1j/ilMa9GUoHD+VmcDVE1E
	i7FpNjAOYnREoIpJQ2kMJbIj8PGMq3ofZNb1+ALmKXCps0ybgOnbxBOvzi+U+ofgsZ/5zhYGGjBbs
	8V3KbLWPTMuLuELVwxO1KdI+t1TR3D441fjwt6cMVc9lg3kZ4NozR66P4NU1utEBd9aAJ3w83ZUgy
	FPIs3r2Pg7q/N8wRrPpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHEY-0007ef-7g; Thu, 25 Aug 2022 18:05:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHEO-0007Rq-P5
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 18:05:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id k17so10613858wmr.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 11:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=JUTRY4gaK8Gdeip+jNVieK44Ohhk3yQH8niH5zENkSw=;
        b=UQRwsSKSQOopSzPEnfGl08Wcz8NArorGUNMK0W1lv9/M3NFHsrXasUoP/8N6hnNLyh
         Db+QzkVDzRMXC3hgUyXq0p/ra8hm2s0axZjgkn5/xzjO73xUBq3NWFs8zslI3FobG/9q
         ElabZvviGU6oh6mONYgE7ezidVx0xJSjXX7zA3rtbmtllF1f27STAnj3DnA+VfAXUkMl
         Da7Z8W1c5erVgM2O39G0VW5VS1MZds4EV6uliQXvj/E8xFQyQSOgSyjZyifITgzLG8Ka
         oMAd0Sich0b0OCAAyxB0J9XknMkajEdI82BQg3Gwbo/HoD4VPnFnOKOAkEkcJMZH3M23
         2JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=JUTRY4gaK8Gdeip+jNVieK44Ohhk3yQH8niH5zENkSw=;
        b=aTpY+KP9B+bmrasB8pN4BascyOZnyI7SSLoN2vpRZxTAqGNj7afnROryditZcZRNj8
         4ns7gN8z8tyoqgw2tlxZqyf55ZftMyqLGp/r2jn3YbsNZWRN7WWD8moaTUIvQWSRMLES
         rhWQXE4AWKKMldQRYJE9WnfM2h1ymkyaUcU9koTT28wuomijfOCQ+lWwemqBo7CVyZNX
         0S1jNYyhlx80DFqN7BUBS7ayjUy7KjXB+9EZBvQIUM/tdBGzmTfmXkcyjrbWf5xBbX37
         gBYi+DdzfOvvtdW5vlLWxSVjG7pQXLvJI+u+D6nD6ntjCd2mrL6QTcZeP/NOfXHDhate
         g9JA==
X-Gm-Message-State: ACgBeo3Mv0LzzZq1zmueRzBlPDxaM6tcrt13Nd4ljYFpNnLm2tHl0IL3
	pjWGMQkIVhnK1TIZE4vMUAIOlX1NzXTyFUys
X-Google-Smtp-Source: AA6agR5biMHZOOviA7RBIh8sODjlp+ZpN4gWA6662c/obgpPYUJW3Xon/lSc/ip8BcNFU0lBj4jAww==
X-Received: by 2002:a05:600c:3d09:b0:3a5:e408:ca19 with SMTP id bh9-20020a05600c3d0900b003a5e408ca19mr3121650wmb.135.1661450725527;
        Thu, 25 Aug 2022 11:05:25 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d6044000000b002254a7f4b9csm14967970wrt.48.2022.08.25.11.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 11:05:25 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
Cc: Sagar Kadam <sagar.kadam@sifive.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Atish Patra <atishp@atishpatra.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add a PolarFire SoC l2 compatible
Date: Thu, 25 Aug 2022 19:04:16 +0100
Message-Id: <20220825180417.1259360-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_110528_860865_9F007454 
X-CRM114-Status: GOOD (  10.26  )
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

Whilst re-running checks before sending my dt-fixes PR today I noticed
that I had introduced another dtbs_check warning by applying one of the
patches in it.

PolarFire SoC has 4 cache interrupts, unlike the fu540 (which the dts
re-uses the compatible of currently) which only has 3. Add a new string
to the binding like should've been done in the first place...

The driver does not care which compatible it matches against, and just
uses as many interrupts as are in the dts so will happily work away
without any needed changes there.

@Palmer, you can take this directly as long as my fixes PR for rc3 is
merged if you like, since the application path for the binding is via
you anyway. I suppose I could take both too, but whatever works best
for you (:

Thanks,
Conor.

Conor Dooley (2):
  dt-bindings: riscv: sifive-l2: add a PolarFire SoC compatible
  riscv: dts: microchip: use an mpfs specific l2 compatible

 .../bindings/riscv/sifive-l2-cache.yaml       | 79 ++++++++++++-------
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  2 +-
 2 files changed, 50 insertions(+), 31 deletions(-)

-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
