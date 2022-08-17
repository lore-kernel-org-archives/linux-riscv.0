Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E588AC2BB41
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YG2ylb9KzUStcp1YpKQKJinrvkUHw6SHnOkjklvfU3M=; b=BkOLE+Y23DqKhQ
	y8PR8GpzEDAioZ3q6pK5hQxV0dsFLXUH+Fwr/aGh+vHsynQEi/HJudqWCFrep6xZuAVUOL7uJqN1Q
	YSx9i9a+HYLrmpfZMZ9HAdipzDPavvSh2DwtJrvWQZO22u/VbxzOygW0bJTI5EbTrK6y0WXJDZx4Y
	W/8fvMdFllPn1qssMvkRDXEX/gAoe73msOFHYJ8UgLrL3PYx6QtB8Ya1Xr9kXsa3GZltNjV+bshvF
	QQo28bhKxgZasyYGM8en+Io39EWJGbJPFUsm5aCPAwEQgEkeb6mXGYmzoTDk6lKJskEzUQhs4zUbf
	jd5KGeJiYKaHT74bospQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPP4-006AHW-UU; Wed, 17 Aug 2022 20:12:38 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPP1-006AGN-Un
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:12:37 +0000
Received: by mail-wr1-x42f.google.com with SMTP id k9so225721wri.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=zUVvLx/M0Ey4WkDNtfvPvUnW+BTA2iCGD2yUtKPlYzA=;
        b=On9ZheEPu5VzxXFRpX263CeSR2D+YOMy3syGCHBmeZktowjXbOdt8R6QvuqBRNbxxL
         qLHMIg1qz/XHfN3OpX+NEB03NUXcg+Ero1BOratzhXGvHps6cujRHFo4dSWkRHji0Qjm
         PNh/tK6+Ae4VS3S86KhYPZ4RcbIFHRkV01d3pe7x+ZlgaXC16k7acLouGUzhxAQptQ0s
         7IzOX+lywCmzL2K9URRyOwPLDlQy1hM8IiNFUo1fUEAyytr1t9x6EEKsUa5svCNLwU+K
         ga6RbTHSe7j/Qku/Nul7iwXXJqbnJ4ayRauV0sy+z2nuVrmXjUDZ9Fe/erADuYqmrsZt
         /JRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=zUVvLx/M0Ey4WkDNtfvPvUnW+BTA2iCGD2yUtKPlYzA=;
        b=SPbZW4btNuN1+UWH03edtw7VWtS4FYR5zwtoiFrzJPD/RDPCLYh62bFq/WkuPWxitk
         ytumyO4EIisGBzkoJ3IiTbdqyuihisn8MDQKmfL0ZNiE6K9qtUBTdBdxfuy1h/0ocxya
         1p69KhVpmGkgb0Ibz9ZBwl38yb30yRKJsAbjjZIl2Mjqpwcb/krSTGtK+cNVt+vpL2r1
         IZ1NASeMlqaL0Mhex4Lpx78OfvI40IMtpXUIHndy9E2M49+dDtq2ZmVqAOkCHiUzzGix
         ebIaCa0gEauNeTzb6nE3ZRoQr21X5UBUCA7iFDoksy589Lo0mRbQisKyFnbbSFK/ZKx7
         XqeQ==
X-Gm-Message-State: ACgBeo3GdOEx/O44RUBsIthb+gALQ8JQmQosrLF1Gck6AJX2QsCgMdDo
	uSF852qmBd6hlJ5WTUjKTGwcpg==
X-Google-Smtp-Source: AA6agR45iTa9lfJ1iLIAYbdFjA17ICwWZtxzP6nWcl2YIhaueG/H0B6ZIQjOkPlREEmFy2FxfmH48Q==
X-Received: by 2002:a5d:59aa:0:b0:21f:57a:77cc with SMTP id p10-20020a5d59aa000000b0021f057a77ccmr14862481wrr.384.1660767154413;
        Wed, 17 Aug 2022 13:12:34 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600c354f00b003a5dfd7e9eesm3029371wmq.44.2022.08.17.13.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:12:33 -0700 (PDT)
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
Subject: [PATCH v3 0/4] Fix dt-validate issues on qemu dtbdumps due to dt-bindings
Date: Wed, 17 Aug 2022 21:12:09 +0100
Message-Id: <20220817201212.990712-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_131236_046944_2558519E 
X-CRM114-Status: GOOD (  10.15  )
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

(correctly sent this time, without duplicate patches)

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
