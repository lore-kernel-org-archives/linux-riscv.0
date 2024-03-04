Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845AAC54E41
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pWNkdSPG1+CNicSiwxb4J1Em+R1KTmkMqU/bdnFhMzg=; b=XRbR7T5OVryUzg
	tt4k4VcNeZMNLKg7yfHuDURrJN46/PtGMph0kCBC7THh6GaLrnvqaYv8uydkxifYmyRCKcaIbKqcV
	rqRcbTvu8Jb0MSEB9pPF+gTGN1a2qM2HjciCGqyuY6A5QO4z+G/gKQYJmTPawbH896UwKpoZDb+VK
	X+pKgN9nEOZZ7fY+x9RPpiNwRy5h8xOb6myrhloJfI6nSyh/2d1BzPT/HKIbx0mh6dP0dBxeayggm
	zPIoULluhCF4CIi/TwNHoFFgcwTW08lfvbDSePLpCCtvWCkeZyx9lcgH/cOlm1EJv/YDJlauGk9lM
	W5Uk+O+01GdX0yKpLRSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4Ah-00000008FK1-1jH0;
	Mon, 04 Mar 2024 08:59:43 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh4Ae-00000008FIj-2chW
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 08:59:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dca160163dso40912155ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2024 00:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709542777; x=1710147577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCgMNgIsQ5yH5yGtzt3c+nzo8902LdhWh/xibCGfDJw=;
        b=CmQbGEDcRxvOldb3AyNzg1ol+FxyYRXzMdqsP5qzo7wrp17bi2rrkP5nDQ1sqBpuPQ
         WExV7GhbjByeIDoFg0S+SgaSKmSqOHqrL3FNN4XiOtTRs4I/weihuL4ksbA3owsv3M4G
         gvi2Wv5tnvSwUJj1aOLY32zhV0aKNPSOdkUher7l+LjCzWYS7ZpsEbEa2dppxPmd6Ulg
         Ol6KJNX8V5fXE1J1secu5yin58aAuR2UiyQ1AeAvni5Ox4yE/f8LEv9G9E/UeeZltCHc
         qHHO7Eyi4vAhKLnTCu6ixaYIcCIIRmz4TRSrSZsPyvqi5qjhNz8zhsGGEY0CtU4tSYot
         uIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709542777; x=1710147577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCgMNgIsQ5yH5yGtzt3c+nzo8902LdhWh/xibCGfDJw=;
        b=OFq5GCR51rLeOUptpVkPN3aBpLQzkMlOPziklM0vGKgkW8jgKcCFUXLGkAPkcDtl/2
         3bfuzP2E9iCeyEF01VtK5Q/nnhtQhOoffc46VmEkRu8egrJ+EjvyPxX3R4nejjcWndjx
         7WwsHBfr8JX07Ubg2b2i1lUJ7WSjGFoA4GycBfy2ZUUNCYCdPnMnyjzRtTGfS7ItImd6
         uzAmyOepHTv4mYThJN6o/rtIhW6f2GhNJ0oWfn78Nnhy2wW013mnzJFmqSzg/YJqXBc0
         bZft7EIN6rW4BK2o54zunE38Fbe9NdcnkcrgobJcGm4+JqYI9pkWxXijxNQG4TIj4M3W
         a5AA==
X-Forwarded-Encrypted: i=1; AJvYcCW0ChA4Tx1Ed0pKvrR5r90/gg/7eaFmcBo85Zox1x7SACebHqp/9zjCPSSgF/gR0ENyWcJ4NqJa86SK2KqxnmoDhPvtt+wR3c/xFcY6wbos
X-Gm-Message-State: AOJu0YweVrkZPaJTNzmG45N8LdyQPN1kLC0wqLBecT/e6qRh7QYlS3ij
	PtPpRY8vI+w3ZhNzKj6hodkJ9CJqfmsdGpIAlPNfVa8B5j2NJTB9EafYf90Z6bka9Gxg
X-Google-Smtp-Source: AGHT+IGJssglye0z9dA/EIYkGmMwL5UqzajKCPrB/EkEGyZOtMVWFHXED5Fw+PmbpEjlmLhJKYdCOg==
X-Received: by 2002:a17:902:ab96:b0:1dc:abeb:22fe with SMTP id f22-20020a170902ab9600b001dcabeb22femr8317535plr.65.1709542777408;
        Mon, 04 Mar 2024 00:59:37 -0800 (PST)
Received: from localhost ([46.3.240.108])
        by smtp.gmail.com with ESMTPSA id s13-20020a170902ea0d00b001dcc0c84721sm7982371plg.99.2024.03.04.00.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:59:37 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v4 0/2] riscv: pwm: sophgo: add pwm support for CV1800
Date: Mon,  4 Mar 2024 16:59:31 +0800
Message-Id: <20240304085933.1246964-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_005940_693169_2D505B92 
X-CRM114-Status: GOOD (  12.69  )
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

The Sophgo CV1800 chip provides a set of four independent
PWM channel outputs.
This series adds PWM controller support for Sophgo cv1800.

Changes since v3:
- use macro instead of npwm number
- add support for polarity feature
- add Output-Enable/OE check

v3: https://lore.kernel.org/all/20240223082014.109385-1-qiujingbao.dlmu@gmail.com/

Changes since v2:
- use 0x08 instead of macro
- split if statements based on conditions
- in order to round up, first calculate the
  number of high-level cycles, then subtract
  it from the PERIOD to obtain the number of HLPERIOD
- use new pwmchip_alloc() API instead of old style

v2: https://lore.kernel.org/all/20240212121729.1086718-1-qiujingbao.dlmu@gmail.com/

Changes since v1:
- drop full stop from subject
- re-order maintainers and description
- pass checkpatch.pl --strict
- fix naming errors
- add "Limitations" section
- use a driver specific prefix for all defines
- using bool instead u32 in cv1800_pwm_enable
- check and set state->polarity
- use mul_u64_u64_div_u64
- use clk_rate_exclusive_get(), balance with clk_rate_exclusive_put()
- using macro definitions instead of shift operations
- remove shift operation on 0
- use priv replace cv_pwm
- hardcode npwm
- set atomic to true
- remove MODULE_ALIAS

v1: https://lore.kernel.org/all/20240207055856.672184-1-qiujingbao.dlmu@gmail.com/

Jingbao Qiu (2):
  dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC
  pwm: sophgo: add pwm support for Sophgo CV1800 SoC

 .../bindings/pwm/sophgo,cv1800-pwm.yaml       |  45 +++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-cv1800.c                      | 314 ++++++++++++++++++
 4 files changed, 370 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
 create mode 100644 drivers/pwm/pwm-cv1800.c


base-commit: 801de0882d8a95aa1b1fe67df1696e037d785656
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
