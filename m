Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5943DFF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 10:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gPKNpDj9uLSrwKC9hdwucm73R7oZmQ8aI4IWhrSQWqE=; b=v7GXVrjRoVP1qn
	yX+Ev/ElKUa5DxLUBtqWl7AnbEtysH0/bJOM/VY1KTCdzOAzFW9FKwnsvczT+QvPJL02dMXbLpbxQ
	VcQNQxFmW7Qwvwp+n1vbujwjcmXHS/bMp72iMWcfBwem7s0lBZMiT54JAplwhaU0MtPyuq0cNjrFG
	guDE5MIQe/harMuADHGQCjrpoWeAkyvynvYOs7G5tNr3dLL+NH7AIebiYOAbryjcg57CN5cFZVGnq
	uu//W0trcc+Sn9GbU47G2XQBa99AGD9pwInyaXSlE1EVdgRCKNifmY/pzvhS/VDSXcGX19TOQEQvh
	q2L5dYMUJVH2bbOA1GFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOLv-00000005AUD-0AkE;
	Thu, 30 Apr 2026 10:10:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIOLt-00000005ATu-0LJ7
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 10:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7432C408D7;
	Thu, 30 Apr 2026 10:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9BCC2BCB3;
	Thu, 30 Apr 2026 10:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777543836;
	bh=EqvFN38G79HDAnXBhVWjYz3r2hRoIRTEoiMkhnAtoN0=;
	h=From:To:Cc:Subject:Date:From;
	b=tHvxstCPI/ZD9WUtvG7SafdI1LnJJjAm0B0tCOGOJpg8z+N5OGTSJPPiWxuNT8g8Z
	 e84RsLAZcA0YxDKDNTwmko7XZfRTY7iE2+EH39zBE9ETup8+jAJQxoB74EfI1MnCKC
	 3le0jLllF9innE7JrKx5buCYkA0BWAMb3ybQb2RCiTUCZZIs6dQC3Dog9wrCY+xP+e
	 CW0jA9/wrlfw5JNmzU64yqvnhLJKMh0qNHatnwvH0/126ovE6WKVmVdtwwPXcfGex6
	 eDdK+m+FJMrvzrJuwc4pZ/yi7bGPSkHq3ZdCMAbmaOFxe8RKcBBgRjCdLrYovH2Pq4
	 F8C4hwCDCtEZw==
From: Conor Dooley <conor@kernel.org>
To: broonie@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] microchip core-qspi gpio-cs fixes + cleanup
Date: Thu, 30 Apr 2026 11:10:17 +0100
Message-ID: <20260430-levers-defiling-00406e391c5a@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=977; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iJzKH5JoBUPIXWclDGc7MiyoS0OlrYwr9MtEDV1CR7s=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmftTp+FPXW7OY5ayU2Ufqn4upI04XtH0Vspmn7OAkHB nxVUv3QUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInM2MnIsF0gPio952py5QZh 6+dl7u/iVp1p2LxV26U6Q1ltR5tDEsNfYc+rjx/ab/aWEon5XnU3d98x+5bjLHlW7K99X6Q967N hBwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_031037_239110_6EC31F2D 
X-CRM114-Status: UNSURE (   7.11  )
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

Hey Mark,

v3 with the review comment about the core handing CS_HIGH dealt with.
I noticed that in the same function there was a "raw" BIT(1), which I
replaced with a macro that the patch was already adding for use in the
setup function...

Cheers,
Conor.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Mark Brown <broonie@kernel.org>
CC: Cyril Jean <cyril.jean@microchip.com>
CC: Valentina.FernandezAlanis@microchip.com
CC: linux-riscv@lists.infradead.org
CC: linux-spi@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (3):
  spi: microchip-core-qspi: control built-in cs manually
  spi: microchip-core-qspi: don't attempt to transmit during emulated
    read-only dual/quad operations
  spi: microchip-core-qspi: remove some inline markings

 drivers/spi/spi-microchip-core-qspi.c | 99 +++++++++++++++++++++------
 1 file changed, 79 insertions(+), 20 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
