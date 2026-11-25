Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AF060A263D
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ed0ICVYr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uib7j0Nd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ae2Ycf7UQcXxtqSLqSPzL5+Xh1yz21jyE8l3oHuH06g=; b=Ed0ICVYr9dGtbWwv+e+au3enkV
	iQm08sMeV95ia+QApNTDkXI4L1exF+bh6ktVtL5CknBIa2kznLcp50V/Y8zoCd9k6R10Rx5Cyhr3i
	xYLrnva22ov/Lh6dAXLlitGFcrJBw60YnXat1aRDMYfTn3I+V6vxFJy3NzT5QoFo8qilgj4iRXhj3
	sUIXkSOtR18fETDJMaMuHolYCM5JxdASkj+qgiMhM9r7nbleIfUbiDJ/+Q0qGNu0OSF2gDup6LPW/
	nnyHdXOi5KC4nTxmCRT3rqDOyOZHouQSTODb8mXcn/EHnNa83urDYZq4CQTm11UH6pJH2MWAa8Y0J
	QJSlOOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7i9-00000008ve3-3e1u;
	Wed, 25 Nov 2026 07:46:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7i8-00000008vdw-1iJN
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 07:46:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7344261815;
	Wed, 25 Nov 2026 07:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F261F000CA;
	Wed, 25 Nov 2026 07:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592795;
	bh=wyzL7xSHwG07AHAVXIarfFNMx2ryQoGUjtaQKy+SekM=;
	h=From:Subject:Date:To:Cc;
	b=Uib7j0NdX1D+qDVQjzoYbda9gGP9cz0zWCeDkmvuoT6VOI47SofU7L02PbTC/F7xT
	 0O4jz+wXGbw0pMMam7qmq+Q8v+lPFANKN68intuSGbZlXid1sAOHlKdniVUEIFSfdd
	 D45jGJFEw9NhFbaoPn614zm7LPHSBkHdCAlcUpEIuoe8CNMUJHygEpGYPVO1QcWR3d
	 z4g+7J0GxFvBmB6r/qO/6j1vUUgzIkEo0vp8PCZlX0Oeoib6ScAXxB7A7Zto0H1Qfj
	 Jz9HdLkwdHlu6JnRBvpleuNIRJ4qtT3rULHBaUrXAJAH5ezRyEUyEFYjmeFibKOuEj
	 Nyrm5NhqRpA+A==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/4] riscv: dts: spacemit: Some minor improvements to K3
Date: Wed, 25 Nov 2026 07:46:13 +0000
Message-Id: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBBFryKzdiBJi2KvIi5sMtFRGiWTloJ49
 07bzYfH570DhDKTwK06INOLhbekYOsK/DymiZCDMjjjGmvdFU2H6wVDwQenLeuKxxhIXxNd0xK
 ouWeK/P5V++HP8rwv5Ms3Bef5AUQ9KN53AAAA
X-Change-ID: 20261124-09-k3-dt-minor-misc-fde2610f267e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=dlan@kernel.org;
 h=from:subject:message-id; bh=16U7h0aKOarFfxiA3lDLd7920xWf8TsRkzBLdHH6oTo=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrBpJH5QbFc2ugtaJyOGAfzadyJFj0f9xjO3wvM
 2TuMJekOluJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawaSRxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3zKQ//UVzoytlvzLKEn8GUoC5vVljYFBlGqUThDcXrKWXQzBJkaAmxatmNw
 m89mLvm22ttJbLCptAghfXV0dmJGj9FsEQnlI2/NTAL9Ug2uVe1TOBABEMlICTUA3QpjiuXXTcx
 LsQalHp9iuRf/p/OFZlAqW3FiWQCGrBW3+UZX6ShRldbz1hrTtgl9d8GR2eu79qmvfr93p5ndHE
 oy3ebRDs7F8naF6x4B1pcSQdkZv9WHwemsJVAdfc3tVbX/bfyCZK75Z209iwG/I+kFJmx021UdW
 HvFHv7Rgz+VfJWpJOJyakPEvQTI/gyXzkU93w3Q4UcQ4JhjTXWSXXcO3K/w+HHWaPRQ39wQgVg5
 niQP2R2G4nUcxAH7aSkxs5Te+71Jpfn8iJUD0GyEEFO7EDoJ3rlrF2/isV6EM8UHgUgTPCBO3ks
 aYtQO+E9Ij6zuLe+V9TYtQQvVMaNy/7Acw+n59tC2yyidJ4C/ETB9wEAarZ65JJG8frRUUZOESs
 LHNX+54ft6i4YUT/Ecqg9FfOiLV1kTlWfORKDKPpMrqpZP5MmcIV7JuelWH6DohVh5L6MA81w5b
 VxPeRR9FDINLmP3ZCLJ4COT6xNIhXXgex3D9Fzl0dqjPNIlyQfben36MBEx51pbQR0XKBM0uS22
 dFsNHyKos81+r0PiOW0L73fZPckcW8=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some misc changes combined in this series, the first three
patches are quite minor and obvious, the CD pin patch fix
an issue in U-Boot side which request explicit bias settings.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (4):
      riscv: dts: spacemit: k3: Rename PMIC node
      riscv: dts: spacemit: k3: Use Pin Macro
      riscv: dts: spacemit: k3: Add alias for MicroSD Card
      riscv: dts: spacemit: k3: Set CD pin bias

 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 1 +
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi    | 4 ++--
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts   | 8 ++++----
 3 files changed, 7 insertions(+), 6 deletions(-)
---
base-commit: da3f64e708a342ab2804754fa26fb4a132dc1809
change-id: 20261124-09-k3-dt-minor-misc-fde2610f267e

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
