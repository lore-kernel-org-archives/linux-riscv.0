Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10A3E810A6
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kvVrICAwFC+YKNuNOfQGwzvtNulzaEhSN96+trJvEVk=; b=ksjznMDYvHFzc2
	n+5Mj+RGtvdg94DfV8dNGhBpfWS/ujyZ9bsB29GSKb5CARoHs/4uTnYROImBqaBjBA2gZwi5OSUoO
	dZ+BUPy8E+YK/2h+nF096n7u+cmBRxChvggCRkEPgUV5aNzDcZikLPsfeNE5azXl0HIP3JGi11GYk
	y4Ekx82VXW/Drh7jNh2qXbdPxTrMnSj5DvYng3M6efZ8PGDea2THK3hgPAxX/1jhfyxAckD1uuMrX
	aD7w15qQra5WNOIzxPMnr3NcpDb6vsl26UTdhEhvjjeUJYTucdxQWE4U7BLBaotcHzB4w9cfiOwER
	injpujZXhQuhQ8/38MHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPso-000KtY-2n;
	Wed, 27 Sep 2023 08:26:58 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlPsl-000Kt6-0M
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 08:26:56 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1dd1714b9b6so3184905fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 01:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695803213; x=1696408013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MoYbiHoRTBkFkCQeE69Y8EorC+SjrK0dNJelyHZJ5P0=;
        b=LYafzR2iqnPUJ6jNGPcFKUr1aOaNo0lVotkajImFiIM1k2Xlv4yB4WX1/VasoPVxpj
         m1BsppuE3dzVkdyzi3XJq0nCrri0EC3SRmQ/U1qWMEoBgek5hy+QTFnxS8XYeetVbT2l
         711vir9eWy0q9YKvfS/kRwPYWsNlRbNlDUD1CxTOVfwHDoTuuyvsUpFEuyAuF8/jP7Xy
         o3qefmpHKDzJASgdgfwNxQ9pLjdPxoHFxgXg7gv+cRnXNcCsU6h1vJv3kxzoAWe7F6zv
         tzfwJqqQA63Dt5NrAQWgcM1KrmCUeZsYJUAZUD3kyu4MsoeGxEdeJPpSvrRfvzghA/F8
         OJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695803213; x=1696408013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MoYbiHoRTBkFkCQeE69Y8EorC+SjrK0dNJelyHZJ5P0=;
        b=NHDTLrEcTgBLjz7/tL3y5wU0L3nDVE2N48XnmXgh76BUTqIEsZWalQpWiuGOdjyHfS
         2pnc8VYkkUvLGd+kCK+3iGtuS9GC/3aRioL7fSok/bjZu1DnA8UaEMT0mfH+yclW2oL1
         XzLUvyvfPNhC24rGdB/ml/NRzAtNl4UKMrq0qFMtl6khS55+dB49Ab8F1TtaWArMf0us
         YDK92t8Ycnc4S5Qkl6PpHMmRANpBbcEowSfheonL3ux6dQW/Ll2lWI7FtWfIgx2Q4UqF
         JZcHS6RgSdGXuhPr6n47Xxp5QGF5eyI4uzRTRqLBJc9xr9D9tiwvFU5+CmfTN6f+Il/B
         orzA==
X-Gm-Message-State: AOJu0Yw0CfOK331GxqSUMZfIoymDbStDV84XFFMKF0hay0fPG/YW3eYf
	E/MVxcoVTTbpsmdgDrMp+hI=
X-Google-Smtp-Source: AGHT+IGVV/z5+SDGNfk91RauZf5PzYRtx+9PTSX3+r4EWpxM6aEHiB2PiI0uYmG6F7CWjOeVHge57w==
X-Received: by 2002:a05:6870:e2c9:b0:1be:f311:4a29 with SMTP id w9-20020a056870e2c900b001bef3114a29mr1694214oad.20.1695803212619;
        Wed, 27 Sep 2023 01:26:52 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id v3-20020a056870e28300b001dcde628a6fsm1952812oad.42.2023.09.27.01.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:26:52 -0700 (PDT)
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
	apatel@ventanamicro.com,
	unicorn_wang@outlook.com
Subject: [PATCH v3 00/11] Add SOPHGO SOC family Kconfig support
Date: Wed, 27 Sep 2023 16:26:46 +0800
Message-Id: <cover.1695800389.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_012655_172964_AC37251F 
X-CRM114-Status: GOOD (  13.14  )
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

Changes in v3:
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

Changes in v2:
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

Chen Wang (9):
  riscv: Add SOPHGO SOC family Kconfig support
  dt-bindings: vendor-prefixes: add milkv/sophgo
  dt-bindings: riscv: add sophgo sg2042 bindings
  dt-bindings: riscv: Add T-HEAD C920 compatibles
  dt-bindings: interrupt-controller: Add Sophgo SG2042 PLIC
  MAINTAINERS: add two files to sophgo devicetrees entry
  riscv: dts: add initial Sophgo SG2042 SoC device tree
  riscv: dts: sophgo: add Milk-V Pioneer board device tree
  riscv: defconfig: enable SOPHGO SoC

Inochi Amaoto (2):
  dt-bindings: timer: Add Sophgo sg2042 CLINT timer
  dt-bindings: interrupt-controller: Add Sophgo sg2042 CLINT mswi

 .../sifive,plic-1.0.0.yaml                    |    1 +
 .../sophgo,sg2042-clint-mswi.yaml             |   42 +
 .../devicetree/bindings/riscv/cpus.yaml       |    1 +
 .../devicetree/bindings/riscv/sophgo.yaml     |   28 +
 .../timer/sophgo,sg2042-clint-mtimer.yaml     |   42 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    4 +
 MAINTAINERS                                   |    9 +
 arch/riscv/Kconfig.socs                       |    5 +
 arch/riscv/boot/dts/Makefile                  |    1 +
 arch/riscv/boot/dts/sophgo/Makefile           |    3 +
 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi   | 1880 +++++++++++++++++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |   19 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  325 +++
 arch/riscv/configs/defconfig                  |    1 +
 14 files changed, 2361 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-clint-mswi.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/sophgo.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/sophgo,sg2042-clint-mtimer.yaml
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
