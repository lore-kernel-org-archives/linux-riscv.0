Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74344E92FFD
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 07:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XRxNRlYAPjtxFe+Z5mYadyVfXOJ0x4dwasinnW0HAPw=; b=IXAnPiPuSvIUEm
	0Dw9y7fCHeDrYb/uyI4MOD9JQVpv+X8in3x9NaZ6zo1lBsXHW6YjTnuq4TZOLclgNr495F1/AoX8T
	2sfVEEQm2xF8+X6XMh1cmR1eWhzz49xPcwDVo2hQ43PMvIkKoP3ad+Y6DyX9yjlxH9B9idqXUtlpC
	oQu4asbmoOoXGxIScS6fp4Yt6oNCsN2NMxuZWCsQ8UrfIRXSvQoUxwVvPfuNRdktQUNB1wwD/E5hr
	bj2YmLNB35zZ2Dhdd7p2N/z0bOPF9cQbRsQH458ZgtyprP86uIh15ne6HXbGwd6sL9aZ93CHi2HHB
	H5sAxHHIBjaD3xD6MWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp26k-0078dM-1N;
	Sat, 07 Oct 2023 07:52:18 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp26g-0078cc-0p
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 07:52:16 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6c4f1f0774dso1933115a34.2
        for <linux-riscv@lists.infradead.org>; Sat, 07 Oct 2023 00:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696665132; x=1697269932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dWKeZClVDNfE0So7VZ4pIq0hNbqjkSr0/ljukMM3ovM=;
        b=MnDbJ3A+LbiajkyB3thB8erZgWzXdyfX/J7YrOsnaPCOfdcDUAUsZe5HVLxOLMRhqZ
         wKT+Q2YWJXA2R6bCPtzU8VvZBUuW68rqRVFHmbNEeQdZMxWmby3g4Vvq9uaMy8uzMv9C
         0O7UGboYbqDUm2u2TPvpaMohgXCU/84a+wFMqNhrCiGxzRU+Xx61GNRjTvxOtP6dSeic
         YyZExwT2M3fespAxgWPVY2RIekg7TFIogkqZXhcWsWEMOlIdEXk0BB8rhaYX0aHw9hsJ
         W5Y1KU6eIkJDrQtdS7ttNT5hfL1V0fzipP8N+IzI+PfytsSI1LmvgdomjLxiW8m96QET
         otwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696665132; x=1697269932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWKeZClVDNfE0So7VZ4pIq0hNbqjkSr0/ljukMM3ovM=;
        b=K/nadSXgh4/j7tY5y2A5nMKeI9kguFz0Rjg3pJmtZcHU7bb6ME0zt0bi1TXWJ2SRSg
         F/BWNYKhp+y7zPNGnFJrnEPpf+XBktBG/SOtp9ColfPq+HHu+xdOydiUngivvt8UerD3
         JS3Y+xPURULRhNUDf8cd0Cgr+lgEZ4s/bZmZpTyZjgHpbDIGwa3SOcNl/OMcbylA1c7M
         b8ENgJtOkPYplCp+5rr4tERSCKSP5csTvDTV1vt3ht0ADAGkBqHpHluPaH2+2/xy6CkZ
         sz59j/aGH/6Fl3bayz8+OXby2uGcHjRL59OzJV3Ay9MsKIqWr7HDWS0qyo5JzMjhcNig
         bFhQ==
X-Gm-Message-State: AOJu0YxCQh0lm9oSib1D7Rh076aGh32seWt4kGC47wuQBJjLoKwfauYP
	lWmPPP4hrv4gJAwyqKyPNIU=
X-Google-Smtp-Source: AGHT+IFa/2c1DveRTEF3n6nFpcOHxweHFzgtiW7qY9f2w5gQcY9IpaJvjg05thOsqoy+pQy2tCfRIg==
X-Received: by 2002:a05:6830:155a:b0:6b9:146a:f1c9 with SMTP id l26-20020a056830155a00b006b9146af1c9mr10304109otp.0.1696665131722;
        Sat, 07 Oct 2023 00:52:11 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id s6-20020a056830148600b006b9d8c31e94sm837383otq.39.2023.10.07.00.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 00:52:11 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v5 00/10] Add Milk-V Pioneer RISC-V board support
Date: Sat,  7 Oct 2023 15:52:04 +0800
Message-Id: <cover.1696663037.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_005214_320241_E1BE9465 
X-CRM114-Status: GOOD (  15.04  )
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

Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 [2]
in a standard mATX form factor. Add minimal device
tree files for the SG2042 SOC and the Milk-V Pioneer board.

Now only support basic uart drivers to boot up into a basic console.

Thanks,
Chen

---

Changes in v5:
  The patch series is based on v6.6-rc1. You can simply review or test
  the patches at the link [7].
  - dts: changed plic to support external interrupt
  - pickup improvements from Conor, details refer to [8].

Changes in v4:
  The patch series is based on v6.6-rc1. You can simply review or test
  the patches at the link [6].
  - Update bindings files for sg2042 clint as per intput from reviewers:
    - rename filename from sophgo,sg2042-clint-mswi/sg2042-clint-mtimer
      to thead,c900-aclint-mswi/thead,c900-aclint-mtimer.
    - rename compatible strings accordingly.
  - Update dts as per input from reviewers: don't use macro for cpus's isa
    properties; use new compatible strings for mtimer/mswi of clint.
  - Use only one email-address for SoB.

Changes in v3 [v3]:
  The patch series is based on v6.6-rc1. You can simply review or test
  the patches at the link [5].
  - add new vendor specific compatible strings to identify timer/mswi for sg2042 clint
  - updated maintainers info. for sophgo devicetree
  - remove the quirk changes for uart
  - updated dts, such as:
    - add "riscv,isa-base"/"riscv,isa-extensions" for cpus
    - update l2 cache node's name
    - remove memory and pmu nodes
  - fixed other issues as per input from reviewers.

Changes in v2 [v2]:
  The patch series is based on v6.6-rc1. You can simply review or test
  the patches at the link [4].
  - Improve format for comment of commitments as per input from last review.
  - Improve format of DTS as per input from last review.
  - Remove numa related stuff from DTS. This part is just for optimization, may
    add it later if really needed.

Changes in v1:
   The patch series is based on v6.6-rc1. Due to it is not sent in thread,
   I have listed permlinks of the patchset [v1-0/12] ~ [v1-12/12] here for
   quick reference. You can simply review or test the patches at the link [3].

[1]: https://milkv.io/pioneer
[2]: https://en.sophgo.com/product/introduce/sg2042.html
[3]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal
[4]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal-v2
[5]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal-v3
[6]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal-v4
[7]: https://github.com/unicornx/linux-riscv/commits/milkv-pioneer-minimal-v5
[8]: https://lore.kernel.org/linux-riscv/20231006-empathy-unrefined-ff1168095093@spud/
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
[v2]:https://lore.kernel.org/linux-riscv/cover.1695189879.git.wangchen20@iscas.ac.cn/
[v3]:https://lore.kernel.org/linux-riscv/cover.1695804418.git.unicornxw@gmail.com/

---

Chen Wang (8):
  riscv: Add SOPHGO SOC family Kconfig support
  dt-bindings: vendor-prefixes: add milkv/sophgo
  dt-bindings: riscv: add sophgo sg2042 bindings
  dt-bindings: riscv: Add T-HEAD C920 compatibles
  dt-bindings: interrupt-controller: Add Sophgo SG2042 PLIC
  riscv: dts: add initial Sophgo SG2042 SoC device tree
  riscv: dts: sophgo: add Milk-V Pioneer board device tree
  riscv: defconfig: enable SOPHGO SoC

Inochi Amaoto (2):
  dt-bindings: timer: Add Sophgo sg2042 CLINT timer
  dt-bindings: interrupt-controller: Add Sophgo sg2042 CLINT mswi

 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../thead,c900-aclint-mswi.yaml               |   43 +
 .../devicetree/bindings/riscv/cpus.yaml       |    1 +
 .../devicetree/bindings/riscv/sophgo.yaml     |   28 +
 .../timer/thead,c900-aclint-mtimer.yaml       |   43 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    4 +
 MAINTAINERS                                   |    7 +
 arch/riscv/Kconfig.socs                       |    5 +
 arch/riscv/boot/dts/Makefile                  |    1 +
 arch/riscv/boot/dts/sophgo/Makefile           |    2 +
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi   | 2000 +++++++++++++++++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |   19 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  325 +++
 arch/riscv/configs/defconfig                  |    3 +-
 14 files changed, 2481 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/sophgo.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
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
