Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4761C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Dec 2021 13:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9r7tfa7ukBc+Huli7XWkrxTrBCcsuTBHXLPx8CGAv1Q=; b=Jlre8kD8SbRffx
	lzDec7I2upugKh5AJ19bcORwWnA5hSdR7ZzW8J/UkdVXaNgZEzEvdH9vawhZ2Z1ZF7Wr8PQt8DWho
	CkHRkKJL69lycJhK8OfwgWqd07l1Vi/zcW8k35iVuviTGDvDDg6w82ApCDfavTH9jYWfg6F/KVJU9
	795oPUG8xM1hKZuKH57q3IuSwBlwMl2mQgbJBef3I/MY9YyOxE+9DAZ7UV/BF63cpxtG4VS8E2cxi
	ZOW1oRwyju/Ch9eVhE1LpSMoiu9jf1YTm/lut7VYRwH4K7SntWwBoxg/TGdgxhtY2famjdzAR5Sbz
	GtYMVgt0p7Wpb3S7erXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxr5K-005v3p-8S; Thu, 16 Dec 2021 13:46:14 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxqxH-005rJo-Vh
 for linux-riscv@lists.infradead.org; Thu, 16 Dec 2021 13:37:57 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
 by michel.telenet-ops.be with bizsmtp
 id X1dg2600W250X30061dgUe; Thu, 16 Dec 2021 14:37:55 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx2-005Q97-3L; Thu, 16 Dec 2021 14:37:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mxqx1-009xvH-9H; Thu, 16 Dec 2021 14:37:39 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, tomeu.vizoso@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
Date: Thu, 16 Dec 2021 14:37:36 +0100
Message-Id: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639660956.git.geert@linux-m68k.org>
References: <cover.1639660956.git.geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_053756_208333_17599AF3 
X-CRM114-Status: GOOD (  10.22  )
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

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G2L SoC embeds Mali-G31 bifrost GPU.
This patch series aims to add support for the same

It is tested with latest drm-misc-next + mesa 21.3.0 + 
out of tree patch for (du + DSI) + 
platform specific mesa configuration for RZ/G2L.

Tested the kmscube application.

test logs:-
root@smarc-rzg2l:~# kmscube
Using display 0xaaaadb6e7d30 with EGL version 1.4
===================================
EGL information:
  version: "1.4"
  vendor: "Mesa Project"
.....
===================================
OpenGL ES 2.x information:
  version: "OpenGL ES 3.1 Mesa 21.3.0"
  shading language version: "OpenGL ES GLSL ES 3.10"
  vendor: "Panfrost"
  renderer: "Mali-G31 (Panfrost)"
  ....
===================================
^C

root@smarc-rzg2l:~# cat /proc/interrupts | grep panfrost
 82:     587287          0     GICv3 186 Level     panfrost-job
 83:          2          0     GICv3 187 Level     panfrost-mmu
 84:          8          0     GICv3 185 Level     panfrost-gpu

root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
     From  :   To
           :  50000000  62500000 100000000 125000000 200000000 250000000 400000000 500000000   time(ms)
*  50000000:         0         0         0         0         0         0         0         0        72
   62500000:         0         0         0         0         0         0         0         0         0
  100000000:         0         0         0         0         0         0         0         0         0
  125000000:         0         0         0         0         0         0         0         1        68
  200000000:         0         0         0         0         0         0         0         1        68
  250000000:         1         0         0         0         0         0         0         0        84
  400000000:         0         0         0         0         0         0         0         0         0
  500000000:         0         0         0         1         1         1         0         0       736
Total transition : 6
root@smarc-rzg2l:~# kmscube
Using display 0xaaaaf7a421b0 with EGL version 1.4
===================================
EGL information:
  version: "1.4"
  vendor: "Mesa Project"
  .....
===================================
OpenGL ES 2.x information:
  version: "OpenGL ES 3.1 Mesa 21.3.0"
  shading language version: "OpenGL ES GLSL ES 3.10"
  vendor: "Panfrost"
  renderer: "Mali-G31 (Panfrost)"
  ......
===================================

root@smarc-rzg2l:~#
root@smarc-rzg2l:~#
root@smarc-rzg2l:~# cat /sys/class/devfreq/11840000.gpu/trans_stat
     From  :   To
           :  50000000  62500000 100000000 125000000 200000000 250000000 400000000 500000000   time(ms)
*  50000000:         0         0         0         0         0         0         0         1       144
   62500000:         0         0         0         0         0         0         0         0         0
  100000000:         0         0         0         0         0         0         0         9       524
  125000000:         0         0         9         0         0         0         0         3      2544
  200000000:         0         0         0        11         0         0         0        46      3304
  250000000:         1         0         0         0        33         0         0         0      7496
  400000000:         0         0         0         0        16        19         0         0      2024
  500000000:         1         0         0         1         8        15        35         0      4032
Total transition : 208

Platform specific mesa configuration patch for RZ/G2L
---------------------
src/gallium/targets/dri/meson.build
+               'rcar-du_dri.so',
src/gallium/targets/dri/target.c
+DEFINE_LOADER_DRM_ENTRYPOINT(rcar_du)

V2->V3:
 * Moved optional clock-names and reset-names to SoC-specific conditional schemas.
 * minimum number of reset for the generic GPU is set to 1.
 * Documented number of clocks, resets, interrupts and interrupt-names in RZ/G2L
   SoC-specific conditional schemas.
 * Updated commit description for patch#3
V1->V2:
 * Removed clock patches from this seies, as it is accepted for 5.17
 * Added Rb tag from Geert
 * Added reset-names required property for RZ/G2L and updated the board dtsi.

Biju Das (3):
  dt-bindings: gpu: mali-bifrost: Document RZ/G2L support
  arm64: dts: renesas: r9a07g044: Add Mali-G31 GPU node
  arm64: dts: renesas: rzg2l-smarc-som: Add vdd core regulator

 .../bindings/gpu/arm,mali-bifrost.yaml        | 45 ++++++++++++-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 65 +++++++++++++++++++
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi     | 13 ++++
 3 files changed, 121 insertions(+), 2 deletions(-)

-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
