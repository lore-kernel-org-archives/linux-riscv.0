Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE235C61DE2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p3Yym8aUW3v8b5M8SPYBiIEs5sXcRe+Db5kRlz4sqwM=; b=4b8RTnDlmXEKop
	F3C4I2so3UrrLnzo+hMn38UNU+Jlh835C+Hx2z8b51cwyHzNrcE46z9+lpmIba9FSupY4hKAoDLcE
	3S7OoLVL6EbLH6PCoqgQkapTXNojiH0q/qypK0mlRtSmfATrAUvt/qXm5GeChUHBdjZbZjZ9jau1Q
	yFNLA03bvDYJPFzm4fdNX883CrRr8nNnj34ui8WlLXJoJRrfwoa5xlidLsSGpvRjE3Cnvl8qmk5gf
	hCJjmZEbRbs6sZZg4twZXnA7oHVmDnJ2qHIKSU7s9Vzbg38djBOU4R5/PFKl3hQgUIRuyrgfTap6p
	Q1Ssn83GyPjjXPlciviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zbt-000000098FL-3jLf;
	Mon, 31 Aug 2026 10:51:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zbs-000000098FF-3SLr
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 10:51:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5FAD4048D;
	Mon, 31 Aug 2026 10:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F2B1F000E9;
	Mon, 31 Aug 2026 10:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788173487;
	bh=P2wodg4yqW9L09DaFdI07T+E+TZQoKw1npPSdl0WwuE=;
	h=From:To:Cc:Subject:Date;
	b=iw/66AtAm7DJXf94+6xosmvmRsk+2solF2kRwFWfk1/qjNnIItRhbJgMqYQAdyvCl
	 iT0mhiEhfY/99h/43HIESd5Cems9sxaR5crX5x5dl3Kujv/1mYusiSDh9wlHmB/lm9
	 9r0hU9YMwLGAaKPFpFkeS1ZLybkWqPnTLCJB021/3AizlxCGwVx+JRgKvF3+XDYhns
	 d8LI/yoPURNpa+w37fuZOb4CW4E329qvyDPAsdbBzC9igwsRKE6U+CyggiAD2K7vit
	 qZutlT+4aDzNJ/zq0Pnpbe14k79WGeM39VmCzxAs/AUVlA/RwPcKJHLP9ykk8Kv6wQ
	 se6d1unRe+lPQ==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: [PATCH v1 0/3] pinctrl: mpfs-mssio: three fixes
Date: Mon, 31 Aug 2026 11:50:56 +0100
Message-ID: <20260831105056.756259-5-conor@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=conor.dooley@microchip.com; h=from:subject; bh=dAFqel1fVFzTMCYz0l0IMh6g2tT025oTNwx7nOHDtAk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlTYyaEVjwKiF3OGFXNrD81Mer163W7C06rv9W9MME9+ cOeGxIXOkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR8EKGf1oX33y6Yl7lt+xk VuOTGhvr6z33n/xpnfdEfesXpvcpC1Yy/I++zqlu1hBXU5ec6GE0X21az+eG6ju9Ny6es+btsVd cxQUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

Three fixes for issues I encountered, one of which is clearly world
ending if not resolved while the other two should go to stable because
they'll cause the wrong bank voltage setting to be applied or reported
in debugfs.

I discovered these myself while working on a new board that needed novel
pinctrl configuration. I think that few customers have probably been
impacted by incorrect bank voltage setting because it requires trying to
set a bank voltage that differs from what the FPGA configuration set, and
not only are the configurations currently in upstream and Microchip's
vendor devicetrees a match for the FPGA settings, I think customers are
using the FPGA configuration tool instead of pinctrl to configure IO
since that's how it has had to be done for the last several years.
pic64gx is where I spotted it since the config tool can't be used there,
so the impact is limited to users of that SoC that want to have non-default
bank voltages.

Cheers,
Conor.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linusw@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Valentina.FernandezAlanis@microchip.com

Conor Dooley (3):
  pinctrl: mpfs-mssio: fix whitespace in debugfs output
  pinctrl: mpfs-mssio: fix width of unused bank voltage setting
  pinctrl: mpfs-mssio: use correct regmap function to set bank voltage

 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
