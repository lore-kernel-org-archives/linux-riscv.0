Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA43C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uljzM6kEA4arz298CqRhLPOIVUQa4PBvIaoznNMKHOs=; b=Z/5TxGMcTqnqy0
	/7rK2/sv79eTjpmLlnYlPVjeDEvPT4q9oDCuyf2QcUTi8995MeyORh7qG0Vx/v1GO3iHao6GjYY6I
	TBKrKRwZhX/SUfNIUmruEcrTnfSt1oc03JmOlreTjz10xZkygyKvVkHx9PhA/z2mrjQxmM+J/VqZb
	5ZlVmVGAVtEPg2VekCwMvsdbBhESQTVlP4dgezaWal1w70kIXvJ1Gczz73M4+CiaROIJlfB362EoQ
	Hv0GGOROzf5TPiY9A7DswpSA7ERV1txyNX293t4NmWe+IyTQHjnXdzz1Ynzjeo76vHHT8Q4Tz6T8u
	StM5ck5cvoZ8jXZ7SgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN8Dq-007SYr-1D;
	Tue, 09 Jan 2024 09:16:34 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN8Dn-007SVm-2g
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 09:16:33 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-59602557ff0so1680616eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 01:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704791790; x=1705396590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S5ZhSIArRTK4RfoHAa1IKQyQ/jqRQdYfU3TlnySgOUI=;
        b=N85dw5pwcT/Mkp7qEFGnLJaWCLsftYJNpZEW0XyfGp1rKEctL+FiX//h/MckWecKCp
         MbiUK2H0bYeCGdJCHlisBfABgpHCUFvuLdeZWp1KzcepF6S7g3wZjfHtM/oqJEJDcpNm
         JT50TAlHzxievp01I7IvqZfzlpv0ZMCU6VUyIm9ZFloIEFCFka7gp9Nw5XRXXLjB+rV8
         YWEDkgLsStFslXY8+QoRjZZlv6LWbZmpVFLR8vUxJWs1vPMo9C5dPfeG1VcCS8O1Scal
         xjK4iDRKz/18xqK5y4Nz+Sq1Cj4KhP4DOZQo3G3Y7ztDLANzlrqOd3mKi9rNBOHlTDe7
         JVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704791790; x=1705396590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5ZhSIArRTK4RfoHAa1IKQyQ/jqRQdYfU3TlnySgOUI=;
        b=hzelPMcewM09jzC+oRyd3vljG2eKIMWNkis+c3AecUI6yopEC2V8+/NDZwnPMFMnFi
         qtSrZGFC5v3zH2IItmm1pL/KsQeq6t3GQw8Isa9NkmjFy7cgLBLSBUgxMR/jyRcxvLsV
         KMD7cPmA64FLDsPAGL+pCqg47BfCMAhcroddCAFFzGuv0sJd0IWdRg9E+tuXIDNB1ko/
         +rJy3ugpuM1/vbDtECHtkncx/+xC6W5pxZd95I0UyJDUf/b4EeVPEr9xix1/A4iibYMD
         Lvqve3Eb7vtCnGM05JzQRFCAQi5AjvGLrM+Ya11EpcwANh2dizvIwzuElo4tstp/nQPo
         WsOw==
X-Gm-Message-State: AOJu0Yzfh0uEvbTxtwsKmWTkoLkzmCrJHPOcz1W0xMFv+rBDKttYvpse
	3kFQeheqhJzbdaExg9HkwJ0=
X-Google-Smtp-Source: AGHT+IFC+ax8l/GFUw9c+ZsF4JvmZfycyaUROeGLkmZUhFQLoxdei8HI92/lfl1mvk6eQcA1CzRmOA==
X-Received: by 2002:a05:6820:168e:b0:594:cea0:eeda with SMTP id bc14-20020a056820168e00b00594cea0eedamr3851277oob.2.1704791789026;
        Tue, 09 Jan 2024 01:16:29 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 189-20020a4a03c6000000b005963088920asm313287ooi.32.2024.01.09.01.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 01:16:28 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 0/4] riscv: sophgo: add reset support for SG2042
Date: Tue,  9 Jan 2024 17:16:07 +0800
Message-Id: <cover.1704790558.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_011631_882292_4AB73904 
X-CRM114-Status: UNSURE (   8.66  )
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

From: Chen Wang <unicorn_wang@outlook.com>

This series adds reset controller support for Sophgo SG2042 using
reset-simple driver.

Chen Wang (4):
  dt-bindings: reset: sophgo: support SG2042
  reset: sophgo: add SG2042 reset generator driver
  riscv: dts: add reset generator for Sophgo SG2042 SoC
  riscv: dts: add resets property for uart node

 .../bindings/reset/sophgo,sg2042-reset.yaml   | 35 ++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  9 ++
 drivers/reset/Kconfig                         |  1 +
 drivers/reset/reset-simple.c                  |  2 +
 drivers/reset/sophgo/Kconfig                  | 10 +++
 .../dt-bindings/reset/sophgo,sg2042-reset.h   | 88 +++++++++++++++++++
 6 files changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
 create mode 100644 drivers/reset/sophgo/Kconfig
 create mode 100644 include/dt-bindings/reset/sophgo,sg2042-reset.h


base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
