Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3396EE6425
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 07:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X8whGAQoEtg6I46E8Xoekqh3lD+ZGbG7fQx3DUQnDB0=; b=gIsXXfd5JxXVky
	G5hlJfK1Ffo3f/LHIpbT4K+HrY9HXNrw1ZTjg2WEgBh37Z+S+varnHQgAWOqcxYGY7Mq/2ezenA5J
	34u+PimtdW1M+L0rCoaPssmhdiCX8LKHhpk9AWwKPXhlQqg0yg4zbnzWXyJwRvPp02yG/4jRI8mKZ
	2v/+Kk+vT7f1h09CafKttYTTKHRNXTHW4EckTzFo3Oic2IDQCWMw3MWxDkF+8MkbDc5WIW4xmlV1D
	lLcvBHprlQEbptHoaY9hVLtzNl3Gb3ZvRHkXpfpCCR5STVf6wq+DCeyI+GNX/VhBIsxJHdWSwvCm6
	/re1JUnTiA+DNgxjOQ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2xO-009zWe-2D;
	Fri, 15 Sep 2023 07:09:38 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2xL-009zVZ-2O
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 07:09:37 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6c0e8345c1eso1138924a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 00:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694761774; x=1695366574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bJl6f0UNgp9s5U6+NACE5ZojfzRIittwLj+OcfEUzag=;
        b=fDYX2aW6+PQyj8hdV2ZdGdpWB+EuTiA/CvkWfTO/bAGnaFbnEutwA6yltsd2RUIutK
         PaoM29Oz5f6DdpCR26CUPxYBXSSQ6S3aaNGd6t+R1UgFrH8WKeGm46ZX8INjie5l+tbB
         l6xAD+CCwxkP4ppdGW3GQWsivoybxxlY6VcyQbCI1ruA7SYR5nz4Ii3uKKSCr5WGN4l+
         tsrOPLUkK59+6eluzu2VPIG0wZGUzWuuEAm3VgXWZhZHtn3n4CNks7e+szTiCgs09+ev
         bFHuVPc1mNXGNI5156vbqFNZj8no5gMlCZ/C/BY0PW2VuGPBHpIhYxdKFoqesHXnuuB/
         jlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694761774; x=1695366574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJl6f0UNgp9s5U6+NACE5ZojfzRIittwLj+OcfEUzag=;
        b=Vc1fNC3DJ9swMxPpbH93A4+YG0LNjmY7I+90jieTY0RHS/oPzVYmPtSa7o3KCPHDMF
         XYEDKT1zLdNF1jMZIcO/qS9krIZAk5ZZ7thrDpkzx3DqtxVjmavo7SYNWG11ZoqtZDIw
         rMhfDsPEZfdTylNKGIxsgTscnaynF7qU80wTF6l0Vg2n1RqDNVx4zTbfyJdmUujcvGjP
         kgPsjCZevHIF8+o5qzIX2wNjyZ86OqY5JE14Mur64KUPzYLtpCxeJMV1BQYd+00xqTWz
         V5MtpdT5HnYHMixvLINcNiz96IdFXxGdgJRypi5MYinxqvZQmuckZnR9asIGlq0IjV8V
         X/Xw==
X-Gm-Message-State: AOJu0YzBQPrpCMi0iMybYRwqCJa52ubVV8ssic4cOlsk000xGYhWixlB
	DBXmQUOJcIc4QDqsxkgC3fdIWL9L59jQoRMu
X-Google-Smtp-Source: AGHT+IFd+uJ28ZuLKFUpC0OCCnpyF8Le/2xhZDsYf6fEP9cxkrrHtulYRtTtZ8W5VK2u/bT6/SM10w==
X-Received: by 2002:a05:6358:90d:b0:134:d128:9f5f with SMTP id r13-20020a056358090d00b00134d1289f5fmr700984rwi.9.1694761773768;
        Fri, 15 Sep 2023 00:09:33 -0700 (PDT)
Received: from localhost.localdomain ([222.95.63.58])
        by smtp.gmail.com with ESMTPSA id h2-20020a63b002000000b005777a911342sm2159018pgf.59.2023.09.15.00.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 00:09:33 -0700 (PDT)
From: Wang Chen <unicornxw@gmail.com>
X-Google-Original-From: Wang Chen <wangchen20@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	conor@kernel.org,
	aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	guoren@kernel.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	Wang Chen <wangchen20@iscas.ac.cn>
Subject: [PATCH 00/12] Add Milk-V Pioneer RISC-V board support
Date: Fri, 15 Sep 2023 15:08:56 +0800
Message-Id: <20230915070856.117514-1-wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_000935_781283_CD7BE76E 
X-CRM114-Status: GOOD (  12.51  )
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

Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 [2]
in a standard mATX form factor. Add minimal device
tree files for the SG2042 SOC and the Milk-V Pioneer board.

Now only support basic uart drivers to boot up into a basic console.

The patch series is based on v6.6-rc1. You can simply review or test 
the patches at the link [3]. Hope this series will be merged soon.

Thanks

[1]: https://milkv.io/pioneer
[2]: https://en.sophgo.com/product/introduce/sg2042.html
[3]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal

Emil Renner Berthing (2):
  dt-bindings: serial: snps-dw-apb-uart: Add Sophgo SG2042 uarts
  serial: 8250_dw: Add Sophgo SG2042 support

Inochi Amaoto (1):
  dt-bindings: timer: Add Sophgo sg2042 clint

Wang Chen (8):
  dt-bindings: vendor-prefixes: add milkv/sophgo
  dt-bindings: riscv: add sophgo sg2042 bindings
  dt-bindings: riscv: Add T-HEAD C920 compatibles
  dt-bindings: interrupt-controller: Add SOPHGO's SG2042 PLIC
  riscv: dts: add initial SOPHGO SG2042 SoC device tree
  riscv: dts: sophgo: add Milk-V Pioneer board device tree
  riscv: dts: sophgo: Add sophgo,sg2024-uart compatibles
  riscv: defconfig: enable SOPHGO SoC

xiaoguang.xing (1):
  riscv: Add SOPHGO SOC family Kconfig support

 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../devicetree/bindings/riscv/cpus.yaml       |    1 +
 .../devicetree/bindings/riscv/sophgo.yaml     |   28 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    3 +
 .../bindings/timer/sifive,clint.yaml          |   26 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    4 +
 MAINTAINERS                                   |    7 +
 arch/riscv/Kconfig.socs                       |   10 +
 arch/riscv/boot/dts/Makefile                  |    1 +
 arch/riscv/boot/dts/sophgo/Makefile           |    3 +
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi   | 1794 +++++++++++++++++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |   16 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  513 +++++
 arch/riscv/configs/defconfig                  |    1 +
 drivers/tty/serial/8250/8250_dw.c             |    5 +-
 15 files changed, 2411 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/sophgo.yaml
 create mode 100644 arch/riscv/boot/dts/sophgo/Makefile
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042.dtsi

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
