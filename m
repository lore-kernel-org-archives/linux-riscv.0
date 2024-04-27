Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1A1C19F53
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bSgyVeIEbcDvsYYSFARhZi3MUj3l/8ASTqnMGuY8sRU=; b=hHGfsY/TXhcbAm
	jncoJWXR7V9loogs2lFdYzJaOdm4vvInTgNS7veApGt7mYBBFImO+EauUK3DTv9cu7ZvdmZxe7hci
	6Q0naY2xk5sIi84LSrxFQFhmtah7eyXEMzLb4w8MQQ2wM9vb0Y8PLlH6ooGrkuRHgD7/A8siWhTHS
	mm8Djg+6+SdvlutwKmTNxKn4pJBE3ZnTQ3KEFyWpZMQ5Uc/c/RF3TYs8sMcF/64aUBz78NsDD8pAo
	cVWGunglzF4QFZhphm5X7TdWWJm36qJJu5sCKoWsuMHJ98puS0eA4oHIdFg/aRyN4NSORROwZwY6a
	K5U+JMsbnB0JVl+V0YGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Veh-0000000ERXg-2FQz;
	Sat, 27 Apr 2024 00:11:03 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Ved-0000000ERVc-1hbY
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 00:11:01 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6f30f69a958so2435724b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 17:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1714176656; x=1714781456; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0X+wom0kXrBkkWPdMk9ez0NtFShVE5HcObxG7YQSUEM=;
        b=O2fXrMqVilVl2VJY/DNjwF1cCbDdVChUKbp/CEQ58+Efoy01PAkc73gAlBVqB2aQvu
         qf2HiLZXRlSXvZjam7i4/g8qTP/GnIWy0UL1AI+Nvvf7qHUjzFHkQBXLUWmaQXUIuOv4
         onNNp38K4IgtYOymymum1DobgMvrPIjMFSGEKlbeOY60bXo4voEpt4wLnkmGciwdJrJ7
         WJQ1BwyEyItnQpE6aClPN7EaFvDRPOSOapLSdDqTEDmyIlGLbhlcoKMlmvmiV2WNxgml
         lnQ0tIoGpKvps1jEgrikGftpiBjTbzb0QuYLS8ZjTojAnKwY7YdooRdzzlM0H5fqx3kn
         R/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714176656; x=1714781456;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0X+wom0kXrBkkWPdMk9ez0NtFShVE5HcObxG7YQSUEM=;
        b=j7a/kFy/5l6N1UzIzZ7ietP3R+c6R/yZ19GYwWm8ZuFCzB+CmdnAkYcyWFKew8tNSR
         AVg3k3E1C9rMbi6biEhU/AaWG9RM2tdh2vla+LRCoizd5cI9F/44FplTKKuxy7KMxl8i
         exzUb8ZKTJo27czxNY+fDg4yTXG7hnnNNl4yT4LI/5uDpMe1XeAn4c377ePBNVypJRnO
         IBudOj29zJIFHRldPthQNnfRmqzykjhfl6dzuacorQSfI1sFvX6O8oqV5+KVvI/i3GMc
         ODgCIGbduYOoFmpd2QUt4q30w+vSGUdj0sDKATPfgfJqx7kn45va0yRckhlbzyuc+ndc
         ynIQ==
X-Gm-Message-State: AOJu0YwHSZz/UDvmDirFYZYUOagzLyVx/HHShUpDnS9vobAUCWQ3pdRe
	vqz1IHWAHnHZbfQw79k5IqIVMC0kMz8rjwKVZEWfaoG+14SzoTS3XM0J96r6iew=
X-Google-Smtp-Source: AGHT+IEjEz8x5csAstQe+EBoqyrLMV5so95s3NngLWP1s+99Pa2FDBg9Mqljlc51ovwGOiHviBdhsg==
X-Received: by 2002:a05:6a20:d80a:b0:1ad:22bd:d6d8 with SMTP id iv10-20020a056a20d80a00b001ad22bdd6d8mr6019864pzb.4.1714176655738;
        Fri, 26 Apr 2024 17:10:55 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:3569:7ce4:94b8:1691])
        by smtp.gmail.com with ESMTPSA id w1-20020a6556c1000000b005f3d54c0a57sm6061883pgs.49.2024.04.26.17.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 17:10:55 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH RFC v2 0/4] clk: thead: Add support for TH1520 AP_SUBSYS
 clock controller
Date: Fri, 26 Apr 2024 17:10:33 -0700
Message-Id: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHlCLGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDEyMz3ZIMQ1MjA93knGzdMiNdQ2OTpLRky6SUlCRDJaCegqLUtMwKsHn
 RSkFuzkqxtbUA48+/pmQAAAA=
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714176654; l=3100;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=1J4s5WkWi0yLsfAU04plHcZTJmipLje1WXfb8fgGcxc=;
 b=16J/aGmQTihk3ouk4xY9w2E0cZ7vJ10E2613HxJBuwgVbWNSdlKeA297VRG2X2bxYYqhOPTFB
 RTLq0s2TI/CAKc6fCIJa2p7mV/aGGNK+RMCY6OK3Lv3pbwdj8KTczZC
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_171059_629174_45704C1D 
X-CRM114-Status: GOOD (  16.40  )
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

This series adds support for the AP sub-system clock controller in the
T-Head TH1520 [1]. Yangtao Li originally submitted this series in May
2023 [2]. Jisheng made additional improvements and then passed on the
work in progress to me.

Changes I made from the original series:
 - corrected the npu_clk enable bit
 - deduplicated CLK_NPU and CLK_NPU_AXI number in header
 - fixed c910_i0_clk reg typo
 - fixed checkpatch and dt_binding_check warnings 
 - rebased on v6.9-rc5
 - revised commit descriptions

Changes since my RFC v1 [4]:
 - squash the header file patch into the DT schema patch
 - describe the changes I made to original series in the cover letter
   instead of the individual patches
 - fix my typo in my email address

TODO:
I am again marking this as an RFC because there is feedback from v1 that
I have not yet addressed. I am posting what I currently have as other
patch series like the TH1520 I2C driver [4] could use the clk driver.

Emil commented that the input predivider is not handled correctly in
ccu_mdiv_recalc_rate(). The PLL multiplies the input frequency and
outputs "Foutvco". This is followed by a post divider to produce
"Foutpostdiv". However, some clocks derive directly from the "Foutvco"
Emil suggested this should really be modeled as two different clocks.

Emil aslo suggested that the rest of the clocks in this driver seem to
be generic gate and mux implementations that should probably be replaced
with devm_clk_hw_register_gate*() and devm_clk_hw_register_mux*().

I'll look to address the above issues in the next revision.

Thank you,
Drew

[1] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
[2] https://lore.kernel.org/linux-riscv/20230515054402.27633-1-frank.li@vivo.com/
[3] https://lore.kernel.org/lkml/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/
[4] https://lore.kernel.org/linux-riscv/20240425082138.374445-1-thomas.bonnefille@bootlin.com/

---
Drew Fustini (4):
      dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS controller
      clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks
      riscv: dts: thead: Add TH1520 AP_SUBSYS clock controller
      riscv: dts: thead: Add clock to TH1520 mmc controllers

 .../bindings/clock/thead,th1520-clk-ap.yaml        |   65 ++
 MAINTAINERS                                        |    3 +
 arch/riscv/boot/dts/thead/th1520.dtsi              |   15 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/thead/Kconfig                          |   12 +
 drivers/clk/thead/Makefile                         |    2 +
 drivers/clk/thead/clk-th1520-ap.c                  | 1018 ++++++++++++++++++++
 include/dt-bindings/clock/thead,th1520-clk-ap.h    |   96 ++
 9 files changed, 1210 insertions(+), 3 deletions(-)
---
base-commit: 14396a29c3cfbd42b4ea5cd0a528264831524062
change-id: 20240426-th1520-clk-v2-134bfc9bddb1

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
