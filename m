Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBAAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:44:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B04D760E94
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B04D760E94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oVb6x/TQQXeZsrP48X+ySlS2mFbuer+KT4zX65fYCw=; b=CVTHJG2VfZDox8
	fXRv6aP1vnkzkUzZKV8+h8LAAUhzcETa+XUDU9sl/Eu30s5XkuKG0fPAmmdgg84PW6jaRGjkF3I7X
	bhbLwp1OLCquFBUqRMoC/3LVM9YkTS49N7QzHcK2PfjwF1jRsL+1LtvErPstmnvaY81y82WCy9Wya
	hA9pMZdqee7CnT2BBCKpVDNbQKYA4l8O/Kp4ckgSjJeNFrrPWLWnfUKIGgvRm8aw66Sa07KmkKTh2
	l3fFDACa3mKqxewERWT52WHVmCAyns74d3Iq7SnGPZSsWkgQL6RirQ0cPRlcJeNwDLNBV6GyZHH/4
	1HkWgh4rPhYKaZSkMCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maI2W-00D2TG-Tb; Tue, 12 Oct 2021 13:41:57 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maI2N-00D2OZ-1F
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:41:48 +0000
Received: by mail-lf1-x12e.google.com with SMTP id y15so87958893lfk.7
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nYnj837QB7gRmzPOTymQ8FnnAOwmMUTYd52xsFO2G8E=;
 b=mzLxDCOM+Kg3hMTCGRfq1Vvfqxnv2JIJfuJpmQKinS03at8nnbmz4UXj5XABkHF9a9
 TN3+jXQjxyarcf8XyWZJUTIDQn1nP31sZ7OfRSJplLaM2Ka50LtAaDQGVORZthrnKUNt
 jYuTvoAFa/wsBMiMnzoJrcrq4Z16Al040Sqsx31szClrRUGb7isdhm2gwO34D9HnvmyS
 o3sJckzgLsD6o1CMbuxOWeXB/mtAHqc09ykFHfJLGiRCZnBT7BVo55J54UJzq4z/9QO2
 Uk7a/tyhLXgmk+K80Lv9BwYfX227eC+F7cdgukCPfy2coNSas62BR4qrpbQu09TtBMFf
 NQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nYnj837QB7gRmzPOTymQ8FnnAOwmMUTYd52xsFO2G8E=;
 b=yF6qWVhFwMnp3fvn13+/Ec51HdS5cS0FrNms0wJ6PzliAa7kjsDQKd6Krpj8pSkCUD
 /1+QCLx8/4PZmaqeTMhMA2PgpHSyBIrIrfPha7S6WASTTEMLqZ/JU466h6o6V9ZaQmXA
 7UItFIUFT9H1qMjyXEpndChVaffv2Fhj+BZkjyHr7ncGrjZ6CEudJHHROOX4bdnQzsGj
 PvfKIkQBQBwkpwTPMbys1kqxW0j+xzogXNqkdk6RqhpAg7kWA+QwerHTNdo9fUdSeh7c
 Q9vxANHpKKsm3/p+qqtuIAXZDiNV+lBjxwoPG3Rv9iqckJtyVB1quMFYN9Rt5PSJ23r6
 XCdw==
X-Gm-Message-State: AOAM530CHLS8x1TZBC3Uy9AMBdH6WRxtf1I36pfrZz/yHMS7P7f6YNJx
 IZUWQ+3R/Zp1Ug7bcy4Agdad2yYRkwpVCw==
X-Google-Smtp-Source: ABdhPJw0Y+Is+pilioHQEW23A3vndAwFNww2YwMV+e5rNNquUVn/AFH1c9Wkphely2wuOYNJLh8ASA==
X-Received: by 2002:a05:6512:1090:: with SMTP id
 j16mr30855989lfg.434.1634046105632; 
 Tue, 12 Oct 2021 06:41:45 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:41:45 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/16] dt-bindings: interrupt-controller: Add StarFive
 JH7100 plic
Date: Tue, 12 Oct 2021 15:40:14 +0200
Message-Id: <20211012134027.684712-4-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_064147_133513_6E8F4596 
X-CRM114-Status: UNSURE (   9.17  )
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

Add compatible string for StarFive JH7100 plic.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 08d5a57ce00f..28b6b17fe4b2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -45,6 +45,7 @@ properties:
     items:
       - enum:
           - sifive,fu540-c000-plic
+          - starfive,jh7100-plic
           - canaan,k210-plic
       - const: sifive,plic-1.0.0
 
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
