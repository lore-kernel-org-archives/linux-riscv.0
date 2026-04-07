Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A2BFF5108
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vC0l/i0E8XPwLHSisUQ7kttQ2eK5aDRp6e6vXlJS/nU=; b=gCIT/0fMfhVfrC
	K5GFzzmm3/qoamO4YJJ1jTpWpSSsPCEEIL2oagaUA96r/z94b4UDhbkZ2S0MRJnGKXAPzQIO+Wgy3
	Ug4dmq5Bm3PCCA1syhsmykzVAUiYWcpsDBuEQ3bWidRrINMMnBg4RMpWaN7MBgfp+Drju33mE9XUa
	R0VFHqA5u3UuTdU0xTxcevU/iR952J4UAd310IPrLprzz783HWpqOj6HDjN+4GJPp7DQYjfMzvmJ9
	4dyrQWlUwZqbqQVqhZAZY75Evwdk/lvkbjc4dPMF8UbrRPPvQH8kCVUck61bg6LjR4mqeVLUemsK/
	OmGFJTrPbKASyvVmXuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Tl-00000006ifs-1BZ5;
	Tue, 07 Apr 2026 15:36:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Tj-00000006ifJ-1jxP
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 15:36:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAD584374F;
	Tue,  7 Apr 2026 15:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558DBC2BC9E;
	Tue,  7 Apr 2026 15:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576193;
	bh=ABxAA5KZ/KapiXOpjczLnUMUzIzNvPjTLK6gf04IbsE=;
	h=From:To:Cc:Subject:Date:From;
	b=hQUsOU3Uzl+VJPQp1QH/hgCeLbC0eX/7fvknsVJUlhO2+/t5aSgA/jlRYeX2kU7X3
	 Ht7kXF9ZvQtq3aBbYEc3a3OrWr2oivkyMD7ec2ouKstm6Dk60gJMv3LT+v+OasIP6X
	 c3kyH+UmVMKwYtOvy/OgxNQ0N2BOTnkttN7Hd+ITmJxML6WXlrDfvBoocB8cZFlPGb
	 aVObMlthpE08esKZxa83X7lg+CeWA1huSXKXRB2J2iKajV0XYTD4DKVIaCdUv8F9cj
	 GmGt0BYtifHJkkT7mudyZvwkjm8kdUMUJ2R3XZIcZfvgdyhfFm88gurpw1Vx2PFFV4
	 9iz38NYkjN2lQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] pic64gx semantic conflict "fixes"
Date: Tue,  7 Apr 2026 16:36:22 +0100
Message-ID: <20260407-rely-speculate-dae3a81ea1fc@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=876; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ZvQZVBPK2T2jYfJjkn4XV7btTIb5sUPd6RKn8R0yH5o=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlXVcqDtTOklpm03lDYcUPNXO315Fb1CVrlczlfKJ40W se5xGl5RykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZid46R4c3l9hm5uS1hylf/ Ln6lqu7EI/l+B6uR6rqLr1qVn2xcfZXhn+m9l4/ubA4JqK2YUJnaLLJVfZHgE1bBm+rR+u9Fdwi wswAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_083635_469431_E2233F26 
X-CRM114-Status: UNSURE (   5.79  )
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

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Paul Walmsley <pjw@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Alexandre Ghiti <alex@ghiti.fr>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (3):
  riscv: dts: microchip: add tsu clock to macb on pic64gx
  riscv: dts: microchip: update pic64gx gpio interrupts to better match
    the SoC
  riscv: dts: microchip: sort pic64gx i2c nodes alphanumerically

 .../dts/microchip/pic64gx-curiosity-kit.dts   | 63 +++++++++++--------
 arch/riscv/boot/dts/microchip/pic64gx.dtsi    | 40 +++++++++---
 2 files changed, 70 insertions(+), 33 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
