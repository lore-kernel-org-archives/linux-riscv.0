Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D9EC32772
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Aug 2022 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nWUJ4P+w0PmshAQgfjk2u08lf/42+fGdQAUtO6FCYX4=; b=G8bgIAZ8cJGPR2
	XC8/lWImt6iTijvN3kSngejFmknay6rDXJsbSoE+pRseQkuD43tuaZKqvuK4eW1sn272k0rXvGQ6N
	MZAkIMYQTm6+aNOU70UIzeZRkj5kMn185031zWsak6W8IBw0kWAoOfVSsivI1rcuZqUeG5UlKqDph
	qDvwgg8ARKf3y4TM7vTHuOSW7hRd9GDXxB1WdbT6pe5PgXxWIEfjc7+CZx0kf696Q5qJPYbXaVO7J
	SpKEOQyXFbI96KbTBPfSJH2ewuPgA1UP0UHQFR/yGGdyDUCgqH+rZmrs1jUF+WvXjFRpjq0KqYPDP
	gDvavPK5q+sLAx2ozcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYiw-0084uW-Vm; Tue, 23 Aug 2022 18:34:03 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYis-0084s2-RP
	for linux-riscv@lists.infradead.org; Tue, 23 Aug 2022 18:34:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id n7so18019458wrv.4
        for <linux-riscv@lists.infradead.org>; Tue, 23 Aug 2022 11:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=q+TKEP48DscTRDbw52nvoVUMRS8D3Vksl/C8HoYqAy4=;
        b=WpT9FPSBFg5gj+3SEKAhIEbYy3VkM3t5SkcVrrpMsQvWqW6CpC+os07Y68qsl5lQwm
         AD9aui8SzjnCNTdK/B+NdogzMwQrEARSnmNh4Em/mpaCF3tt1dncmTSuRqeFOdwzSLIA
         ls1vTNAj6nNguGE8AWF1bWbb7hbNKits7Us+r+sE8+Zf745XQuV65ozSkZ799QhNmWIt
         r/QETJq4bRmHVBSsM/Lb9KTTbgiafcDeVKvFZzseo/e4jvxjzHuGzjhdqFjndp7rnJ8+
         2fdRyICsC9C/YbtB+TJEha0s9c6kCOxBi+SMHs9CTaMBb9rbeDhdjijQkuK0JShl4rxX
         z1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=q+TKEP48DscTRDbw52nvoVUMRS8D3Vksl/C8HoYqAy4=;
        b=7aGRFLCfvuNeeUE1wy/LoZmLz8G25N4ueCGKG3Tc+ErJwb3pTRMj7SJawvUSZC+Gln
         rRzLcmReKo8Ay7ty0sUHAIONO6+QkdQI1+q88GoOzL8LG6rrRcI8tBpzKoc1Ylt1SL2o
         hSLQ/buRDtEnyUpEkbv38mqf5NdaWBzaRfHY7/Ry98zpDRgXUAQa/dSpTHk0r1bgKWOn
         47xa63G33/hzFdlZeCweUB0WbjZXUI44Bd9AD2AaoQd/gMm9r5c6ilUdD89vtuNGEDQQ
         hFmXF9ON9qqJ01iYzm57j4pkhJr5cu+MW8RqkzoIfFcQtBdUiqoWSYM/RxdiB/mcHF2s
         FKgQ==
X-Gm-Message-State: ACgBeo19Xk/l7OYZWNEVpj7gYlMyLKB1idsSIN5b2GhxPWm1lKTMIe6k
	iz3OK3akK237ITgu9aXhMDpOwg==
X-Google-Smtp-Source: AA6agR4eKdmNbLaAlee4FvNn9BWllAehRRH4lTp5MXW2JWFAbIkwID5iLn+33HA0tJYbINEHH4yyMQ==
X-Received: by 2002:a05:6000:18a1:b0:222:c54a:3081 with SMTP id b1-20020a05600018a100b00222c54a3081mr13725350wri.666.1661279633502;
        Tue, 23 Aug 2022 11:33:53 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c1d9000b003a5fcae64d4sm19396556wms.29.2022.08.23.11.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 11:33:52 -0700 (PDT)
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
Subject: [PATCH v4 0/4] Fix dt-validate issues on qemu dtbdumps due to dt-bindings
Date: Tue, 23 Aug 2022 19:33:16 +0100
Message-Id: <20220823183319.3314940-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_113358_925390_84030C80 
X-CRM114-Status: GOOD (  10.56  )
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

Changes since v3:
- dropped the charset restrictions for standard multiletter isa extensions

Changes since v2:
- removed the extra patches from the directory

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
