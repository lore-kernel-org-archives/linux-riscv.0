Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E431C32772
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnUY7ZtOzqwKuuwKQA+Mh1kqS8pd/vuuDJFsoteuEZY=; b=SPJWt7o0C7xxXG
	WVli9NTr0JxjPfcip4mrBeGEIjHwPx3BZZsMOfk8TjIwvbErfqoX0BjipKb6fJz4T8pC7BKjhr6nz
	LYbqRBs5wXwdTMX1Q7FHq/WlgE/OHJowezQCoydomgp+pw2HBqe9giA++YrGL4omtVIfglhieCPpH
	n/UgirKcqVTbiz33uy3tPgLhcO6HrXQ4B+NnVvz9neLwm9qOkYDqISVCS3+TkhIV8hFb5R8TmdgBt
	sqb7Yejh0g0oQ8aAGsScvKIO51y3Ec/OZvsM5UHWugeHVj3TblfnJYT7HDXAFsTL8ITBcjW4lg2Om
	+oSaxhxW3T8Hk0Nin8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIl-0066Ym-DL; Wed, 17 Aug 2022 20:06:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPId-0066PD-FW
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:06:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id n4so17367749wrp.10
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=G88Wg8efx4vUqMWMZ62OXKazA2toNV7pxgmBvPS4y7g=;
        b=VzaGcfunVEH2z7tJRNS1AU/vIocqbg6xnzILw4gRFcBEDkijY1Zq4TmA5/TNRldDSx
         WzgaQIj45pktnr3tjYDuiDyxviAqihEm4l2MkHueEnlQXQjanVthYnOkTHEn09mCRbGs
         1MqmO9w4ty96NiqmLtnlo7Ub2udERairrBssiSs6S3plZkziQhalrIMKvkJPE7ilS2IF
         8jKUcOsS2tT7/eTA52ruguZTo4qlgfu4c8mhay7OiLT1A9eHMWIsCbJW7wgPuG0fQkNS
         TH/3JAfFK7hhxh5fd11oPwDkmvnuw9zsoquL8KJ9BEYzhU9+mGSf16ovrpiqU5Nd47RD
         Z5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=G88Wg8efx4vUqMWMZ62OXKazA2toNV7pxgmBvPS4y7g=;
        b=4Xi2ODd1DGRONslcgXmgmUGlkmPcZhiaqL1eoDGFlpKu6ofoaOYbfpRcEPxHiF76bK
         m4U+3wQ/oFNGil496vVrt/76MaTL88F9ZNeN1p2tpLASnl8IT27fxcXGnnbFmmVy7dDc
         cgnsaLhl72OIulrnBvfDQu4rIaYFxMxFdLVv+TV1BxsL4e5bcRxWFBbuZQYQvuO7QwJw
         44Up21v38cenSc2uZLexFtymPPe09gtfYRvgVLKfNpDJvNrbcNyEDOV7UHsJZVbcxn56
         yWt2RfOfr6mtGkCPv9pdQhm09YB8uBpl9yV3KcnAnFDcJEvJzq4egY+U5VWUZ8w3VAR+
         bvnA==
X-Gm-Message-State: ACgBeo1e1IIPaZR6wQfpUhx2valD+/t5PUH3FMNZEKy3hxzEhYJpU89D
	BFXera5wJcFodYrcADeSFDUUwQ==
X-Google-Smtp-Source: AA6agR6RY3pzrMDDeo4DomjmEAqXTBHnmR2N2jKtYWKl/s2Lhds8el5y+ky2C+45OzgIECGp7SjeTQ==
X-Received: by 2002:a5d:5509:0:b0:225:20ac:37fb with SMTP id b9-20020a5d5509000000b0022520ac37fbmr3914379wrv.38.1660766759021;
        Wed, 17 Aug 2022 13:05:59 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:05:58 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Fix dt-validate issues on qemu dtbdumps due to dt-bindings
Date: Wed, 17 Aug 2022 21:05:24 +0100
Message-Id: <20220817200531.988850-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_130559_626975_12B59C9B 
X-CRM114-Status: GOOD (  10.38  )
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
