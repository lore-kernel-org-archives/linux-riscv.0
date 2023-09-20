Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF29CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 06:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XOOnfuU3IuS8semRxLUEzTuk0TbIioHO2gSvKXJMeng=; b=k0lRRf9iDI6KYa
	sE47LppvUM9NqiCEBgcDeg7wjlMpV6MS2r+5EQZxKhEZFnlGy+Kw5r0ocGrr37OafKB055YAzxUgA
	w630oemfhtwZLixzkE/deRrzQLdSKumjVEUDr0qzgZOT9uCc574rewKuBXqbySDVd0l9+zW45kdmY
	YFf48MFbBLGC2ab8DaE0+uOJKzSpyIqj9XAzy9ae+vy/+KUZpdALMLWdohBbCxOBz1QOzwdcwRG4G
	BI7hMSm215/GNFrN8laI1o3qflvnHPhFQ1HbNtx/pu//jOx76hj07AkrN/MJ8BHY3XyceApxs7Xaa
	pOuYbJT4m40fAsNcUnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqnB-0021su-0z;
	Wed, 20 Sep 2023 06:34:33 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiqn8-0021s8-0J
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 06:34:31 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-57656330b80so4152199eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 23:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695191665; x=1695796465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+O3AJdPC6+mmDlzoTLR1My0ueM7+QDiCckAE4a7Rtso=;
        b=lnqsEYmfM/CDe+rkr0rOMrnUcB2WwxNYq75X3xlTK0yLoOlrsy1VJ8ZowmvUXOdnfP
         dFxwn8OqLfpuDaXfcRSWyu3AR+JmtZ3agFzRvJDUNJnm4t/xJItkB77SCUAJg9V8U/cX
         eSGBdSNvxFWmHATA97dpyX41atwFoIzgWjJDxDF03WNAaqVmCvmDqOWJQGPQ6qvb6IKO
         bq75+5kTZm+8nE5nysMo7+1rTCMA5TNnhy+uApFXDY823LWDIOUgUwg19eqIsOOHehQe
         27KjWuZL4cy5h+XttHzORvluXgK06cu5y+v/56Cjj3j1HxBGjXXgXqNefPBpx46dngOK
         Lr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695191665; x=1695796465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+O3AJdPC6+mmDlzoTLR1My0ueM7+QDiCckAE4a7Rtso=;
        b=g3KgtNFtxeq8vYiuV0Fj4KCvGfly37Nl5aEu+WtTgVwTfwrojKJxidj9IZUdCDJCrD
         Ci3BAHTm5mElkGV91c+jmDBqXOtoy1DbU+B/abO35GYcKXh9FQW+T2oEucMr2vE1whQN
         4s1QQSDJX6Onj3hZWqbGyP9LzJZm1P7DUw//5VtxryMDJ0FA+9tUdLOMByHvQvdn/usz
         UhYZRkCGe7xu46xrBlPLInn4QwNJv3BxWi1CZT0cOSAUUMlr/ilIDcsrsKNkZarZQOm7
         V/7nxoaakU3tWWy6zViaY0hc3LX5Oa+uVREqZ0XVVHlYlQY7vUNDpEROdJYOMbD1iubY
         sJ0w==
X-Gm-Message-State: AOJu0YwCHVxuMnrjj755JC0+gKTtpdPsHchn5e4SeZZvD9DP84HYtKWc
	1YubdQIfBg7Cn+uAyhYuwsE=
X-Google-Smtp-Source: AGHT+IEHnNyf0jXITy3BDsnEYu+CXUH5KU3JnL7xXa/F0/zqdtvEtErvGFatqOAs3bzaIniIkKcHyA==
X-Received: by 2002:a05:6870:d404:b0:1c8:d72a:d6b8 with SMTP id i4-20020a056870d40400b001c8d72ad6b8mr1885261oag.36.1695191664887;
        Tue, 19 Sep 2023 23:34:24 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id r21-20020a056870625500b001d4f1ec39b3sm6842515oak.23.2023.09.19.23.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 23:34:24 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
X-Google-Original-From: Chen Wang <wangchen20@iscas.ac.cn>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v2 00/11] Add Milk-V Pioneer RISC-V board support
Date: Wed, 20 Sep 2023 14:33:48 +0800
Message-Id: <cover.1695189879.git.wangchen20@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_233430_142539_BC546C64 
X-CRM114-Status: GOOD (  13.30  )
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

Thanks,
Chen

---

Changes in v2:
  The patch series is based on v6.6-rc1. You can simply review or test 
  the patches at the link [4].
  - Improve format for comment of commitments as per input from last review.
  - Improve format of DTS as per input from last review.
  - Remove numa related stuff from DTS. This part is just for optimization, may
    add it later if really needed. 

Previous versions:
v1: due to it is not sent in thread, I have listed permlinks of the patchset
    [v1-0/12] ~ [v1-12/12] here for quick reference. You can simply review or
    test the patches at the link [3].

[1]: https://milkv.io/pioneer
[2]: https://en.sophgo.com/product/introduce/sg2042.html
[3]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal
[4]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal-v2
[v1-0/12]:https://lore.kernel.org/linux-riscv/20230915070856.117514-1-wangchen20@iscas.ac.cn/
[v1-1/12]:https://lore.kernel.org/linux-riscv/20230915071005.117575-1-wangchen20@iscas.ac.cn/
[v1-2/12]:https://lore.kernel.org/linux-riscv/20230915071409.117692-1-wangchen20@iscas.ac.cn/
[v1-3/12]:https://lore.kernel.org/linux-riscv/20230915072242.117935-1-wangchen20@iscas.ac.cn/
[v1-4/12]:https://lore.kernel.org/linux-riscv/20230915072333.117991-1-wangchen20@iscas.ac.cn/
[v1-5/12]:https://lore.kernel.org/linux-riscv/20230915072358.118045-1-wangchen20@iscas.ac.cn/
[v1-6/12]:https://lore.kernel.org/linux-riscv/20230915072415.118100-1-wangchen20@iscas.ac.cn/
[v1-7/12]:https://lore.kernel.org/linux-riscv/20230915072431.118154-1-wangchen20@iscas.ac.cn/
[v1-8/12]:https://lore.kernel.org/linux-riscv/20230915072451.118209-1-wangchen20@iscas.ac.cn/
[v1-9/12]:https://lore.kernel.org/linux-riscv/20230915072517.118266-1-wangchen20@iscas.ac.cn/
[v1-10/12]:https://lore.kernel.org/linux-riscv/20230915072558.118325-1-wangchen20@iscas.ac.cn/
[v1-11/12]:https://lore.kernel.org/linux-riscv/20230915072624.118388-1-wangchen20@iscas.ac.cn/
[v1-12/12]:https://lore.kernel.org/linux-riscv/20230915072653.118448-1-wangchen20@iscas.ac.cn/

---

Chen Wang (8):
  riscv: Add SOPHGO SOC family Kconfig support
  dt-bindings: vendor-prefixes: add milkv/sophgo
  dt-bindings: riscv: add sophgo sg2042 bindings
  dt-bindings: riscv: Add T-HEAD C920 compatibles
  dt-bindings: interrupt-controller: Add SOPHGO's SG2042 PLIC
  riscv: dts: add initial SOPHGO SG2042 SoC device tree
  riscv: dts: sophgo: add Milk-V Pioneer board device tree
  riscv: defconfig: enable SOPHGO SoC

Emil Renner Berthing (2):
  dt-bindings: serial: snps-dw-apb-uart: Add Sophgo SG2042 uarts
  serial: 8250_dw: Add Sophgo SG2042 support

Inochi Amaoto (1):
  dt-bindings: timer: Add Sophgo sg2042 clint

 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../devicetree/bindings/riscv/cpus.yaml       |    1 +
 .../devicetree/bindings/riscv/sophgo.yaml     |   28 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
 .../bindings/timer/sifive,clint.yaml          |    8 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    4 +
 MAINTAINERS                                   |    7 +
 arch/riscv/Kconfig.socs                       |    5 +
 arch/riscv/boot/dts/Makefile                  |    1 +
 arch/riscv/boot/dts/sophgo/Makefile           |    3 +
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi   | 1744 +++++++++++++++++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |   19 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  439 +++++
 arch/riscv/configs/defconfig                  |    1 +
 drivers/tty/serial/8250/8250_dw.c             |    5 +-
 15 files changed, 2265 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/sophgo.yaml
 create mode 100644 arch/riscv/boot/dts/sophgo/Makefile
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042.dtsi


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
