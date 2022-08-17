Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BCCC25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AnUY7ZtOzqwKuuwKQA+Mh1kqS8pd/vuuDJFsoteuEZY=; b=cnvf9GH4s4HD1h
	5Cpfey4PrnUIAGuYoNnD7Ni/Z5WeT/DLMaw2P88CENz/sP2zmVMRmW2kBvgRJOcHurHcv5YoET4e0
	9kWyryRIztrTjc971oiYPUXs0GIUfl47MWpe9Hw7AV+jKjjnvArCxfoenGa2whti/aDeSt2u+F6sZ
	unLMGWLV60iSChD3/iMKp2zBjjhDhXnIW307C1kzn3sbIZslbEvTzx313fI7AyDc1AaCOPPFsKb9R
	/VhPufrjaVVD9xUh0pctBpgN7/RItyA+MrM4YRBHwqPC7AoIHV8ncH4Tn9KOh1X9gzJHgUN7rHr/p
	jk30fTrMvspRtZoDIkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIc-0066Rc-7V; Wed, 17 Aug 2022 20:05:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIX-0066M4-Ge
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:05:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id u14so2864222wrq.9
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=G88Wg8efx4vUqMWMZ62OXKazA2toNV7pxgmBvPS4y7g=;
        b=UjMVkMOhH0QDp6O/pCgKkjwAgoTr7VLaEZvWBQ+tjcd31e0GYx2VQdEmdGYONFZlBV
         JXSoVTKAwZz2v4YW/Uizoa99V8t3dHzfTeno0mWPMNhh4igom0Bmr6ijGRVDHpyMGd7K
         RD33fy8KrpjEF9DtfgDokOP/K0xkdEBYEZgLbmuvpjzpJ77YnXuGes8IGqUhqOEtcuTz
         1EtmXbFWHbm8sgCgqbfJwoywVRFVNGycJiPJnMqkXnaxVeGp5CUmEstg4+UHY5j1Wvvc
         OYe7bnF33uDXEY5dt1xkYnKlxySlYViNcOylr1RCwj3UfknSZbnUPfMlStx4kPmCFh6a
         AtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=G88Wg8efx4vUqMWMZ62OXKazA2toNV7pxgmBvPS4y7g=;
        b=y3NjiV5NvAnAmKK6FVtOqLJZksJbY9t8RXx3I4r1PQyySiBRIg89UYNL+ClDmrMgAF
         hienFyFvdgCKyuGZDmw71lU6A5AfXV6Ia0r43HT6TjTrvsJ1V/uYHuZeUrPQrmoueFY/
         qkogmHgYCTZRRZjfED8LjeTpOrMBklqk0DhJDpzXWWzD+QANgqylLOh5KSzvl9nxF+vI
         JqMRZ0274y/NJrobaTLQ0wzhi46AZiDuPdx3lMPf1WzRZmVOwvqraV+1egsqDKmtFdwV
         ztwkM8ki6SzURhOV8qT4vxIL10Kp5j5hIUzQWpI8lqIff1Up1bq7yB/kaAnWrxtijWg7
         Peqg==
X-Gm-Message-State: ACgBeo35l3NzgiUpEjUSQlF0styawQPDA9z9LhVdtS7ycfakCtYfnwZw
	VQLDEfgy8dz/bZ2EzZIa03l+ag==
X-Google-Smtp-Source: AA6agR5IgGfJqwk47mOqzOms5cJpBLn149vtKJEQDmN0sxHazUEu1rNO09FeTJ5nbKwwA4+D0l30ow==
X-Received: by 2002:a05:6000:617:b0:225:1d23:467a with SMTP id bn23-20020a056000061700b002251d23467amr4681470wrb.692.1660766749119;
        Wed, 17 Aug 2022 13:05:49 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:05:47 -0700 (PDT)
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
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 0/4] Fix dt-validate issues on qemu dtbdumps due to dt-bindings
Date: Wed, 17 Aug 2022 21:05:19 +0100
Message-Id: <20220817200531.988850-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_130553_649675_C28CB812 
X-CRM114-Status: UNSURE (   9.82  )
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
the auto generated QEMU dtbs. The final patch should be ignored for all
serious purposes unless you want to wash your eyes out afterwards, but
JIC the versioned extensions ever come up, it's there.

Thanks to Rob Herring for reporting these issues [1],
Conor.

To reproduce the errors:
./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
(The processed schema needs to be generated first)

0 - https://lore.kernel.org/linux-riscv/20220810184612.157317-1-mail@conchuod.ie/
1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/

Changes since v1:
- drop the "legacy systems" bit from the binding descriptions
- convert to a regex for the isa string

Conor Dooley (4):
  dt-bindings: timer: sifive,clint: add legacy riscv compatible
  dt-bindings: interrupt-controller: sifive,plic: add legacy riscv
    compatible
  dt-bindings: riscv: add new riscv,isa strings for emulators
  dt-bindings: riscv: isa string bonus content

 .../sifive,plic-1.0.0.yaml                     |  5 +++++
 .../devicetree/bindings/riscv/cpus.yaml        |  9 ++++++---
 .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
 3 files changed, 23 insertions(+), 9 deletions(-)


base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
