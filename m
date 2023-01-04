Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC6BC4708D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1xzCsqrhmcYGrSZqlqQuP6Ar9+uqBV1F9e9hlJTIDD0=; b=T4BV9MNSQwPhlW
	/hXFk6/ak52KKgwWYGNYZ/CLZ8vfSPv8naCqXAcrXvdrtle7uQgAghNAgI/Z7TddMXeelTETbWOcg
	IovmGhGNaJwRrFafDoU4yD/t4B27QvQieYmKIzWz+19rnY6RDf8DOeEo1a8Dv6PliyrVO+bYWdBJQ
	sDkFmEYtLe6ztS97m6yM6f4vq19rEye+IeEbA4cnz00B+Lc/RXRa6EFpOpAg9+swmknb+Jto91zld
	DfBIOarge6FjfmRYu8WVXPuHnCQawZ7vwRTQS2HFe/hW1GVcflelSsk0+dTadzFzES1nXWlXGh52q
	TP2zz8Zjgo556U6a3d7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD89C-00AqKE-HV; Wed, 04 Jan 2023 18:05:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD899-00AqHd-Ls
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 18:05:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 17B64CE1842;
	Wed,  4 Jan 2023 18:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB01C433EF;
	Wed,  4 Jan 2023 18:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672855545;
	bh=iVmBN9SHSGFL/TV+7lxsQZWmvPT0HnyqZTF9juJjaoE=;
	h=From:To:Cc:Subject:Date:From;
	b=kQEc2kIoUCCFh7Op1s23+WJCbDRblqlVIqVFce+4CF46aXL6XZEp/yMEaBjlVoQLU
	 IM9N1Eegc85q2xWFo9fM8n7UBZsK/iUpFvGk89wZsQpNWqNHB669/AZq7NpASMEkqs
	 0ML6KoTtbUMJcYVN2Pjtx/TALHKsuZSgBUERGqTWgZMUYBvQe3Tm1S2SKnKTn34+hn
	 469P4j0xXhjPXCIDSxDLtFx5zdUJ7ez+L84QR0xq4VUntWOuaAdLWAV+8rsCasc+hp
	 fU63HJfAF+vj0lokM1+PBg89NtsQTEQZPK56nzDGl+crpyGaxBaceol14vSVIA+6gg
	 DGBaBvonyYXWw==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 0/2] dt-bindings: Add a cpu-capacity property for RISC-V
Date: Wed,  4 Jan 2023 18:05:12 +0000
Message-Id: <20230104180513.1379453-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=conor.dooley@microchip.com; h=from:subject; bh=s3BpJ32EHXPzoyo62faAGG7G7L5gAZvAoU9KdjWADYo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlb919wdHcN+r+rJ2Kim/E/iUClU78XqzE1nw3RaAis5xWp KlHtKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwESuBjIyvIhhy5ebwXxh/yP2E3MTzm 82LU30OqrYVZEhNUOS+du504wMP66pvlicmmK99qFWumBMeZPdne3B3NGyzTeOFk0JNz3PBgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_100552_083968_346B070C 
X-CRM114-Status: GOOD (  11.93  )
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

Hey,

Ever since RISC-V starting using generic arch topology code, the code
paths for cpu-capacity have been there but there's no binding defined to
actually convey the information. Defining the same property as used on
arm seems to be the only logical thing to do, so do it.

It's worth noting that right now, actually putting this property in a DT
will cause allocation failures on RISC-V - but there's already a patch
for that thanks to Ley Foon Tan:
https://patchwork.kernel.org/project/linux-riscv/patch/20230103035316.3841303-1-leyfoon.tan@starfivetech.com/

Thanks,
Conor.

CC: Ley Foon Tan <leyfoon.tan@starfivetech.com>
CC: Sudeep Holla <sudeep.holla@arm.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Alex Shi <alexs@kernel.org>
CC: Yanteng Si <siyanteng@loongson.cn>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-doc@vger.kernel.org

Conor Dooley (2):
  dt-bindings: arm: move cpu-capacity to a shared loation
  dt-bindings: riscv: add a capacity-dmips-mhz cpu property

 Documentation/devicetree/bindings/arm/cpus.yaml             | 2 +-
 .../devicetree/bindings/{arm => cpu}/cpu-capacity.txt       | 4 ++--
 Documentation/devicetree/bindings/riscv/cpus.yaml           | 6 ++++++
 Documentation/scheduler/sched-capacity.rst                  | 2 +-
 .../translations/zh_CN/scheduler/sched-capacity.rst         | 2 +-
 5 files changed, 11 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/{arm => cpu}/cpu-capacity.txt (98%)

-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
