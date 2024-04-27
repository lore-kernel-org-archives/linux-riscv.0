Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A156EC4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 07:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M4euZ2LUNHPslSnhzH13n9QN42uAdfC+LnA8e+MHHfk=; b=TBTFcG0uBEIk75
	uWBi2UnRko2n94HUfgznn3do+DhAILikKOAWa1fEqJ5f/JusAfm7DAn4miU7Jluva4wumc5WPJC6r
	cV5Njds5OCtcBoazrsFJZMuCmHA4RxpERNnZTTmZsapxvOPN5M7Q1tCSp8JmQPgkTxcIsjvrrOGAq
	i6vOmHtzfE/YSXw0eIqwrBS6mUEVEHhfIXEgkaqDggxfX7ftZG3O/hUQsSYObaGRdMkcg0FW0KlGP
	KgFneSqSWoI8uY7NLH4ETr5Otm5HezYr55qp0jw9bO4deiNLdXgqcZlIiQRkwWQO+1cN4RrYF/tsD
	yjTmkINnN6ZG9tQKlbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ctJ-0000000F67f-2bpG;
	Sat, 27 Apr 2024 07:54:37 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ctG-0000000F66e-1hZR
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 07:54:35 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ed04c91c46so2850029b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Apr 2024 00:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714204471; x=1714809271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LryMUWSXWSPRxaQIt2IMtBO24PQkNlmC6gXH6D1bj+M=;
        b=VO0gJXhAG2mIijDzk/gPK/p78z2tocaLhTCUo4UbJ2qS25KwZLBFKe/s0heJHCkrFJ
         6lYV3DFTujIPeqeFSxjXdd7ZRNCdKJuAHRSr9msZVU/wwjqSbNab3ke2WNjN8P5vXq0D
         jjTiulRYC8x2Vi7CZi29YFm6hsbGKLC3YpJXg8RtilXC720Ma91o/PFOJiyHo20kI/0v
         TxOpg1BvN3JRIqVorfNP7U+1HQpQkF4rPRc6d9/+GOMi9kSA9jk8iimmbAxdTdnbua1m
         HskgcErgIvQI4MX2WBuwQ7y77B1FTUAOX7ld1/GIHzXiQXuJ5pUojKu54gQ3hpn2Pib2
         OTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714204471; x=1714809271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LryMUWSXWSPRxaQIt2IMtBO24PQkNlmC6gXH6D1bj+M=;
        b=ejspcRFblHDyBh2zUY6IP+pU+QuvrsvPxRWV3ODWpfmBH0ctKNwte5YqX5xRb+KPif
         g6qn53K17YStsCCNwbu6lR0+SeBi1VBp0KmRWfjpjJhFkAeOI2NYqJP5AxnWDe6rE1tI
         jjITa2bH2jaeRvqqbQ00YszeNDOzxKFfkw9Y8D9VcuLcIvkjIbmUgcDlLIeqWPqHVP9s
         ykwQ4q4VZcm/IqhCjfsNO9xin6E/uRaevZ/i7olUM+t4Q+XTcdVrtyxHhUmj2lY7Vh2i
         vjGCdiQa3WkTsbTTwz+R01EX5ybi0wTxHLQ2v8Ra1ITOWZLt5dYD9V6N+Pb4mmgzJGBq
         sSIw==
X-Forwarded-Encrypted: i=1; AJvYcCU0WAICPMkz8ZIdijGItsrFK+wbYKUa0NQ/YDLYVDLuCUAbUJgElp7E/WBRDUZSSNtaFMUJyZNZbybxAwdSGhboY6/27z18SzQYyNwj2tip
X-Gm-Message-State: AOJu0Yz8XHoV3TG58fgCxLOX9AzaPlPz0FoBPvEadAVE6NEF8ohbXVP9
	vo8SaENQCfoArKEIx5Byu9SqyElUkyrq5cxCHe3zuCegOXNUBEG7
X-Google-Smtp-Source: AGHT+IHwdCsHr6JoQr3UpVGreocmmdoL7npjKTt7RGk906UWUDf90Xrt08F1iukUPLp2fEIKYTRf4Q==
X-Received: by 2002:a05:6a00:1906:b0:6ea:e2d8:468 with SMTP id y6-20020a056a00190600b006eae2d80468mr6341330pfi.26.1714204470669;
        Sat, 27 Apr 2024 00:54:30 -0700 (PDT)
Received: from localhost ([46.3.240.103])
        by smtp.gmail.com with ESMTPSA id m12-20020a63710c000000b005f77b2c207dsm13608057pgc.12.2024.04.27.00.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 00:54:30 -0700 (PDT)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: dlan@gentoo.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v1 0/2] riscv: sophgo: add spi nor support for cv1800 series
Date: Sat, 27 Apr 2024 15:54:24 +0800
Message-Id: <20240427075426.662671-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_005434_491989_4462DDD0 
X-CRM114-Status: UNSURE (   7.35  )
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

add spi nor support for cv1800 series

Jingbao Qiu (2):
  dt-bindings: mtd: add sophgo spi-nor-controller
  spi: add support for sophgo spi-nor controller

 .../bindings/spi/sophgo,spi-cv1800-nor.yaml   |  33 ++
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-sophgo-cv1800.c               | 370 ++++++++++++++++++
 4 files changed, 413 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/sophgo,spi-cv1800-nor.yaml
 create mode 100644 drivers/spi/spi-sophgo-cv1800.c


base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
