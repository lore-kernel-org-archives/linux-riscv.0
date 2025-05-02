Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037E5C3ABAC
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wT1E5USxSxzmHIYwcWTQdz/BzKPT9tFskSAkkZ40RG0=; b=zNkCUi86XMyN/j
	3iKC/5+CtnMEVqLQunBB3UVEgp0W1ZmEq1/+F4FEwKeHd5vKbmVSb25CN4UBE4Y0/+8Xunrvdrpjw
	AbbBvjncYf5GstV3gEwJUVDh+WcKD6ODJMIoVBdCt0VcKu0QsJHX0pzp73EwRDun5GibQj3QLG2N8
	ec8OYjdlMXxAMsDc2PTNdALsIPV9U5c4BAchwb5ehd137mFb2HD/VGPsg3GHyR3rgNphtjv83AQWe
	ajA9/WlDlR88sn5+CqlZAesBnY3KAw/6rte3RO3ZWI1DfaF9LyxauNHbCZU2IHV7sCoagC2YvTqXT
	Z7yn9nPXd+WSdEL7Y36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnhe-00000001b9P-0tVR;
	Fri, 02 May 2025 10:33:10 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnfx-00000001aKn-1W4R
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 10:31:28 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id DA9EFB4C23D2;
	Fri,  2 May 2025 12:31:18 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 0/4] riscv: dts: starfive: jh7110-common: Sync downstream U-Boot changes
Date: Fri,  2 May 2025 03:30:40 -0700
Message-ID: <20250502103101.957016-1-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_033125_570991_D16541C2 
X-CRM114-Status: UNSURE (   6.41  )
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

U-Boot boot loader has adopted using the Linux dt-rebasing tree for dts
with StarFive VisionFive2 board target (and related JH7110 common boards).
Sync the minimum changes from jh7110-common.dtsi needed for boot so these
can be dropped from U-Boot.

Changes since v2:

- 1/5 -> 1/4: Do not replace assigned CPU core or PLL0 clock when adding new
  assignments. Adjust patch name and commit message accordingly.
- 2/5 -> 2/4: Detail reason for qspi setting changes in commit message
- 3/5 -> Drop uart0 clock-frequency patch
- 4/5 -> 3/4: Add reviewed by tag (no change)
- 5/5 -> 4/4: Follow dts coding style sort order. Add bootph-pre-ram hint
  for mmc interfaces

Note: mmc boot source modes of JH7110 loader on mask ROM are deprecated as
of StarFive JH7110 User Guide 1.2 revision. The loader expects data within
range of LBA 0 and LBA 1 in conflict with GUID Partition Table.

SD Card and eMMC boot media are prepared as follows:

# GPT partition SD Card or eMMC as
# 1: Secondary Program Loader @ 0x200000
# 2: Main payload area for use by SPL
# 3: EFI System Partition
sgdisk --clear \
  --new=1:2M:+2M --typecode=1:2E54B353-1271-4842-806F-E436D6AF6985 \
  --new=2:4M:+4M --typecode=2:5B193300-FC78-40CD-8002-E86C45580B47 \
  --new=3:8M:+100M --typecode=3:EF00 /dev/sdX

# Write offset value in bytes of loader 'backup section' SPL as part1 @ 2M
python3 <<-EOF
with open("/dev/sdX", "r+b") as f:
  f.seek(0x0004)
  f.write((0x200000).to_bytes(4, "little"))
EOF

# Write invalid CRC to trigger 'Main section boot fail,use backup section'
python3 <<-EOF
with open("/dev/sdX", "r+b") as f:
  f.seek(0x0290)
  f.write((0x5A5A5A5A).to_bytes(4, "little"))
EOF

E Shattow (4):
  riscv: dts: starfive: jh7110-common: add CPU BUS PERH QSPI clocks to
    syscrg
  riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2
    cycles max 100MHz
  riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
  riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by
    boot loader

 .../boot/dts/starfive/jh7110-common.dtsi      | 31 ++++++++++++++++---
 1 file changed, 27 insertions(+), 4 deletions(-)


base-commit: ebd297a2affadb6f6f4d2e5d975c1eda18ac762d
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
