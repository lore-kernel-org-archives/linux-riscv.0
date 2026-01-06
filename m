Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7D7CD0432
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 03:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=puFnwy2hoqvRYR1LHGmDsr6Suirfr6DQrmU1j5tkjSA=; b=H8xb/hI5W+5zOR
	mo6C/e3I/zHGmJgKgAH2B9d9Ok3lYVkRAtuGqlRJqCwIs5as8CWiYv0Gc4cWP0mPM51NhHWQZ8Dt/
	XJiVlsAFrOsSWJnZdNDI1DSrXzlhlbB6h2TCwQcuVGniA/pXbeiNidZbiLkSkTz+iWTIHb9ybV8hs
	DKPGxL540LMwHtb2LQdJ03S9GM6RVVwappbumR4THZ/GP1gwNrzFeL3yL4iutBr+Efi4J0fF4CBt0
	SibK9OrHSPjrp+QYAAEOypIU1yhGjHris7kIqQcmnTVNP0BPkcH1x2onH6hZGDyQIri/AYDLm0gdf
	C5gdVPikY4umDVJtbMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxSH-0000000CMgJ-0oij;
	Tue, 06 Jan 2026 03:09:57 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxSE-0000000CMfx-0put
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 03:09:55 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3B789340ED8;
	Tue, 06 Jan 2026 03:09:47 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/2] riscv: spacemit: add gpio support for K3 SoC
Date: Tue, 06 Jan 2026 11:09:31 +0800
Message-Id: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOt8XGkC/23MSwrDIBSF4a0Ux71Fr1VjR91H6SCPGyOFGDRIS
 8jeawIdBDo8B75/YYmip8Rup4VFyj75MJYhzyfWDvXoCHxXNkOOSiBa4AgvCW7yASrbaLKq7Xq
 tWAFTpN6/99jjWfbg0xziZ29nsb1/M1kAB9SWjDaVqpvm7micQ7iE6NjWyfizmgt+PVgslhtpj
 JFWVaI+2HVdv+lY+ejhAAAA
X-Change-ID: 20251229-02-k3-gpio-89b6e95cdf65
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=KD1oy6BZNEd6FReBRpFkWMij6GCuCmsGS/RrQ5+b7sQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpXHzys7SYXHsuJ+qzfW4i9RLnYCerTUdT97kfA
 xQ8ZmC8+I6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVx88hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1Bng/8CkIoBd5fnVv5W2zXHkECrMh24tL+3muE1GfQ9Y7ggNKMuMhGOdo7/
 QnsumQ/8fYml0PghxlcM2eEAOEjKdDBUquZHMP6FEX7YgVrAecmqmPARtUrHgUXAGSvT0sKXdrZ
 3svP5Ax7TrFGIG7l5a4EWHtdPrWL+fgeS1K7bcKahSRGiOvrsiaugV2qvfJnK/iYFnRB/UuDzm6
 wr01+Qe/9F0W24iss0bSibNqbMHM2vKDhfGdaEaRrLaZQT9WgMnbjJe9e81NN3lYCqYFDbmQRNq
 nbYGd/a/fAdm1/N0GtcUvyMe85oh4P63g9J4nPTyjyUwPYx7nVV8/1G9xVprz4LKEx77FUZsfhx
 kKhF6ANTgXqVuzrGp3bm4lgHqGYIn1gvZD+AnsH8MDzTJrE2vVr3hZ6AsQyyRbsz5A9bqSN2c+k
 nRayOiK5liodR3j04vCBGKVqdJbZ778QMdBOO4R7TICBLjvfBpQn4APr3i5RguPiLlnLJOi0RmO
 O6Z4qBH/lYZKGESgO0q8Jsq1DohIyhh163TX0zVYvY0R30xAqrAkW0JSAEHvLHB5Vx2yeChI4th
 G6Y8vgFAggtp0isM8Z0OKCwEkyM2JhbVAV2lgmWi2+Khi4sYhB7n7UP9z0LlXY7KakFXx3wymvv
 FCzNuScFhEMA3j8ih0g4X29eCUD92c=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_190954_273881_BCF81C91 
X-CRM114-Status: UNSURE (   7.44  )
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

Introduce gpio support for SpacemiT K3 SoC, the gpio controller
changes its register layout and bank offset, while mostly shares
other IP logic, so adjust the driver to support this.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v3:
- fix enum coding style
- Link to v2: https://lore.kernel.org/r/20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org

Changes in v2:
- collect tags
- refactor gpio register read/write, introduce helper function
- Link to v1: https://lore.kernel.org/r/20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org

---
Yixun Lan (2):
      dt-bindings: gpio: spacemit: add compatible name for K3 SoC
      gpio: spacemit: Add GPIO support for K3 SoC

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |   4 +-
 drivers/gpio/gpio-spacemit-k1.c                    | 163 +++++++++++++++------
 2 files changed, 120 insertions(+), 47 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-02-k3-gpio-89b6e95cdf65

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
