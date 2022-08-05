Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4598AC25B0C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O3yP7o0xuA87e+nSgQlGLyaBuOLa15MfA2iUSgB/Cek=; b=MTGNslj4nj8m8t
	ukiAvrslD8N7nhEynW7m9OlcxII1RL8qukXAMbESHx01mlUzCmS+DIDWjA/cyNEFRYnkOk+Ec0xZq
	rt3frV7BIvbjS4fdB8ED7Jer948zWgT9h9SP9UZSub7lnkKhb/bwc9RNU2tlQpU6FwCsSnoSp2Lph
	qOHGfomz8rwMDieyL56uSY1oNzK6CsRG3LfMTOoyehfyt21z+BmcWzy80F+Sx/XAhn57rCzKaeoRs
	Pbk7kAx+p96ZK5eRj0Bh8trl4hTYkzZMngDMO1o1SkJ8XJMXr12lEnrCCNtGQvWZCEskBbXG0EWAZ
	vSwIvd6KC8xFGX6KQOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK0CE-00Gkcs-61; Fri, 05 Aug 2022 16:29:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK0C9-00GkZW-9I
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 16:29:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id j15so3826306wrr.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=er0g7uHt/REArzX+ze5K8GPRuPY+Jxgp51y8SELP3FM=;
        b=EbOTl21mdJTL1GSzLoH5mndTGZ7rvd3Xg13P4ZKyz1HCSdoZ+u7F/xmaKdmhUrrJYR
         ArAdrwc4a1//4AnluZSlFDO6+T3WonDWZ7YJAoV50fmI/J5ExQUtkLJKbPjLjsScuXwe
         WN1Qs3sMEseZZVv/O9h179kGKXIXUaZ7acdsR24+fFhX69GI2nTzP/kZtlcjr7KN9DOZ
         vFaNNYQYq6E/a41Mn8Y+odfAkjrhdjCAvuuGk00A/HgX+GlhAhe93bBVZfYbqTMm1ZFx
         Vpkg4f2wo26DXiVBb+vHMqHogYZl59hldL5jGPOYrirc97C0RUGdzYLF2J//OSiPFvsa
         0YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=er0g7uHt/REArzX+ze5K8GPRuPY+Jxgp51y8SELP3FM=;
        b=QRVY9byATVuPrwpmLvPsk57OOY4jDNFLQo/lBtTVRbyML7975O4sb3DwDiWEbG4rot
         vOZxFeHODeUaX+1gBBmeFT3Ql0iB9xyuajp33q8JdA9XQh4pc3xX8ph+pb+wpeC06dA0
         Q/z3JMQ5vjB7wcwS3PUMGgugnbluYiaElndvRTaLfoZNtXoe7iplb0mweCIOciE2XF9C
         4vJdEsyEqJFnfs3GzTmamCPilv1YpI+h0eBUGgeB6eBdT+8E0/Z+fRil0rlBTvilGc6q
         hXYcon8gnl93YnI8WtzHJxYBFM08oEyvtcNRVLYM/W5aYoFYRe3Q7MoUfmbZJuuKnlaj
         vt1g==
X-Gm-Message-State: ACgBeo2wv4n/OLhHKWbMxYENX+E86plsD94OtPZlter55ne9lAeTRL75
	IYAfsEvf9gIgEHdQFcVmS6fx9w==
X-Google-Smtp-Source: AA6agR5PYR+Wl+0VOlguEQQuXuRRJGr8efSXklKvUOQvZ7GXAI/mg5rEbgBwI6yH/e0BdmhHI1txbw==
X-Received: by 2002:a05:6000:1542:b0:220:603d:ec93 with SMTP id 2-20020a056000154200b00220603dec93mr5044554wry.73.1659716943539;
        Fri, 05 Aug 2022 09:29:03 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id b10-20020a056000054a00b00220633d96f2sm5210086wrf.72.2022.08.05.09.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 09:29:03 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to dt-bindings
Date: Fri,  5 Aug 2022 17:28:42 +0100
Message-Id: <20220805162844.1554247-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_092905_442311_D2273DA7 
X-CRM114-Status: UNSURE (   9.89  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The device trees produced automatically for the virt and spike machines
fail dt-validate on several grounds. Some of these need to be fixed in
the linux kernel's dt-bindings, but others are caused by bugs in QEMU.

Patches been sent that fix the QEMU issues [0], but a couple of them
need to be fixed in the kernel's dt-bindings. The first patches add
compatibles for "riscv,{clint,plic}0" which are present in drivers and
the auto generated QEMU dtbs. The final patch adds some new ISA strings
which needs scruitiny from someone with more knowledge about what ISA
extension strings should be reported in a dt than I have.

Thanks to Rob Herring for reporting these issues [1],
Conor.

To reproduce the errors:
./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
(The processed schema needs to be generated first)

0 - https://lore.kernel.org/linux-riscv/20220805155405.1504081-1-mail@conchuod.ie
1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/

Conor Dooley (3):
  dt-bindings: timer: sifive,clint: add legacy riscv compatible
  dt-bindings: interrupt-controller: sifive,plic: add legacy riscv
    compatible
  dt-bindings: riscv: add new riscv,isa strings for emulators

 .../sifive,plic-1.0.0.yaml                     |  5 +++++
 .../devicetree/bindings/riscv/cpus.yaml        |  2 ++
 .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
 3 files changed, 19 insertions(+), 6 deletions(-)


base-commit: 42d670bda02fdba0f3944c92f545984501e5788d
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
