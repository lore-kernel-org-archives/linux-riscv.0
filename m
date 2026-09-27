Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E842FC98328
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 02:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ux1Fw62rgl0QhbXCMU9qXf/HUNEwP8+I54HLiyNOE7g=; b=PBG6+WaFIoB89F
	AP+xKTNYLNhoJmXJgPpNstN5X196P6Z+Z4/s3beA7JtpZ9n/mizlmGkBmWWKQF3PKMulGSmen1T7h
	6qTOqiFg0FI6CeeCEBu0HfuM+ICHQ9agFZdKpWAe/RISyW/0LUypnfbnG59gNJH6dlC/lmu6NQmxB
	B62wj70Fqta444rT0BLqbvfALGHF/PanecVXUYX62Df5qZvqQdvajiplGTeGMFn2Wk40BwQmLkfrV
	BF79BDhZXUO8Z7j/7BZAwxcTpfIyu0tfGfLsYdH35ecPnuPHSZOzl/NNGLlJh9R6CMeDquK4POp7O
	jNiDvTTpMQ4XSmr9bmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4A-0000000FxTl-3Gko;
	Sun, 27 Sep 2026 02:56:38 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf48-0000000FxSM-1Usb
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 02:56:38 +0000
Received: by mail-pj2-x0a.google.com with SMTP id d9443c01a7336-2df9d58a04aso7861245ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2026 19:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477795; x=1791082595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sq4JmY1w64EpSdodr1NUAFBWGL7Pv3Z9QQBcNpt6X+0=;
        b=gfaSTJ85YWQN7gECMtBqjMT04krGYP15liP6ESYffpAntIZk09iHyhF3JnRomBiAdO
         81bXdVQ8Tt9iUBz2E57ZU8+QbVqIrAbtEFtkz/ue2RSst7ZEUFAJo5O/0Ob0AA2G56+b
         oaWFIYk8EFQl4fR7kALLkaL8+/Fnvb4MTg5rovpp/HJTc6DsKik1nqPg8kZwit515vN9
         tp0ELklwaG2JQ93coFVUT8FGVugC7Fkx6nQNYgKbqmbdUmVgEdO1QHQ5LqPZ1Z+ktawz
         LGW6ykM+pGQpieWQ2zOqS1zdXiu18y466+ht3wQdHCDPwtUcFDtC+NfBD6r++3piZyvh
         8XmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477795; x=1791082595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq4JmY1w64EpSdodr1NUAFBWGL7Pv3Z9QQBcNpt6X+0=;
        b=E+FwsgWJwjrXRMejmi3HkfgOnhjA1ROC/lBXk7EArAs5UwxpHK/SAutzAtUxxZVpnO
         ARCbYwW8ASWl1vVuuG1VYPDJx6fy1EDOWlFVCdG0PBS3qkbbhHF2zV/1hggQYvV/7bi3
         iQCxHVYox47yMpB21vfNY39UlXm2tr6G3al3PukmiN0IIVqucB39V2BmvPV/7JuMM1di
         purf4J5Intp53JL2dhlh1LEWfccqqAUmpdURxU7Ztup8Ods6WW42dcWt7373t7icJlt9
         3ZC8uaPDSZSIN2wZrTgIS47Dmxu+X38tfBZPsK2KEyqHUfDsRd2Iy+k1Ls1GO1H6jr4+
         9VjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJycBXln1yvtoXq8GInyU7H7FhMBy8B4gSG9bKKyDzWgtxN3zM6CTUJO10Ux/jjGFVyHSEuQhOA11kag==@lists.infradead.org
X-Gm-Message-State: AFq9FYKQ9rlwlQcNwIPHOCDJokrCHeFJcyvWTS/7XRZfn+h9NsmNyCRi
	oVvpRbJCqeryWeYrSYAuwGOr7Vkb7z86SyiEPu337qyZUNlQWLY06aKinZCGXmq1BUm0
X-Gm-Gg: AYBFou2HBMpcVJ34fhs2F3GBjw0pm8BhkcP8bHifqpXoqdXRV6NQpgOoctxHzc5NCYa
	efnnzEzqPuy24+6sm1Y1TXjJt8wXtPcK6mQEu5ZGR1pq5h7zaL4WvbNC3TSjlr1tSkTtb0fmAV5
	tia64MUnN7FYy9RHkk4XuyNVrU6Ud1YQjXrUtgMoRqZh3ZmFTl1rO8b5fGtrU+esKMZg3xil+tj
	NsokiIuDB1ghGiTc5SU1CXzKMGgs9F/HZR3ru+ooQsBfwKajX+Oq4BQG0jcpjRjFctuHZ2nyuGO
	XYcj4LxOs/+yQhWwR12PI+A5+z3h4J0jTzsfkRlqOHXNg6nfivNCG9IxIjyVgXVZrbrxWiQZ30X
	QhWOg9/kcatADa6fu6OFsxDGn835ylURHHjE3A7spC2gwLYNWYkccWb2C0PIWkjYvrA0OkCT05B
	ptSL50YyIH96REE+/8hdZcoJVhJPLOUigf+voobculue2LLu8QbRCTrPWhfGMhrV6xFw==
X-Received: by 2002:a17:902:f650:b0:2df:8f81:e595 with SMTP id d9443c01a7336-2df9490a525mr51727995ad.6.1790477795247;
        Sat, 26 Sep 2026 19:56:35 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:34 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Sun, 27 Sep 2026 09:56:23 +0700
Message-Id: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_195636_433721_FCDE606F 
X-CRM114-Status: GOOD (  13.72  )
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

This adds the hardware spinlock of the D1 and T113.

The sun6i driver already handles this block, but it looks up its clock
and reset by name, which the binding doesn't allow, so a node written
to the binding never probes. Patch 1 fixes the driver, as suggested
when this came up for the A64 [1]. Patch 3 needs it for the device to
probe.

Wilken asked then for testing with Crust running [2], as Crust owns
part of this block on the SoCs it supports. That doesn't apply here:
Crust doesn't run on the D1 or T113, no devicetree in mainline has this
node for any other SoC, and patch 1 changes only how the clock and
reset are found, not when the driver enables or asserts them.

I tested it on a MangoPi MQ-Dual (T113-S3), not only between the two
Cortex-A7 cores but also against FreeRTOS on the HiFi4 DSP, the other
side this block is there for:
 - the driver finds 32 locks;
 - for each lock, while Linux or the DSP held it, the other side was
   refused, and got it once it was freed;
 - both A7 cores and the DSP each added 1 to a shared counter a million
   times under one lock, and the total was exact in every run. Without
   the lock, over a third of the updates were lost.
I have no D1 board to test on.

[1] https://lore.kernel.org/f720eaf9-01d0-0e57-f6bf-9aade00aafb8@linaro.org
[2] https://lore.kernel.org/20230216095454.54f4d5ca@posteo.net

Nguyen Minh Tien (3):
  hwspinlock: sun6i: Get the clock and the reset without names
  dt-bindings: hwlock: sun6i: Add compatible for Allwinner D1
  riscv: dts: allwinner: d1-t113: Add the hardware spinlock

 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml  | 7 ++++++-
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi         | 9 +++++++++
 drivers/hwspinlock/sun6i_hwspinlock.c                    | 4 ++--
 3 files changed, 17 insertions(+), 3 deletions(-)


base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
