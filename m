Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7190E8FDB1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XZM6padwpXP6pp/F1VNjW1RFVDWwMKD3T0usrXnMRaw=; b=fVzhAWqbFFvKwd
	mKiTyLlTTDg06LyYSEbh+6hsF6p7vhv4z+08DSzJIQbUJOwZ8uv/wxZmjd7dp34Rn2a+onGaE3iy4
	8sVy3ah6KPShRDxt/H8Eb1I0impO8HhVO91JrClprFOyZ4ianzXA+C1VlnMNML2XR8MPUsHOAtg2w
	+iqgZNTu/tIhhI65TRMEWRb7ksEHuEx4zsoNG1JSHaXYuY/WJCV41fTUkYKMMU858AgGX2m6jjW82
	Kgs0ThvwnigLf299566+Zcd2shKRYm+wH8blbWMcv1jtBVBtvCcf2OTcwj4kSNhHlzk1R1+HVBL6+
	VV2ry7MOaWkqQiPgGQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCej-00000003hmG-2YHb;
	Mon, 29 Dec 2025 12:47:25 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCeg-00000003hlR-36N8
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 12:47:23 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0AC9A340E0F;
	Mon, 29 Dec 2025 12:47:15 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] riscv: spacemit: add gpio support for K3 SoC
Date: Mon, 29 Dec 2025 20:46:37 +0800
Message-Id: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC14UmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNLXQMj3Wxj3fSCzHxdC8sks1RL0+SUNDNTJaCGgqLUtMwKsGHRsbW
 1AO0+2JpcAAAA
X-Change-ID: 20251229-02-k3-gpio-89b6e95cdf65
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=708; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=DvF/P/1gjL65Zy3gYiCJA7NSnSH5fV+faqeQ1r4BicU=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpUnhJMZXvUgQB1WyFvfptVeu3MYAZQtR3fPzAN
 DU08sZsvb6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVJ4SRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+35eBAAnlvUGasHhjZStZlVMpBsmUD8mklplKz53hGmV3Z9FvMMC3iMvD5yF
 /j6LIKjJNouAM/QQGqR6Gs3OXAm389MaZxyUjUWD4JMwfuB1UZJnI74wA70V7581K3jLRKtuwC4
 mIdv2fhLfoBxuq7gZjXp1lRGmzTjY+wpES7xIOTKe5lGFpoBmH17PKsCXiTvFNSguicFeOdZMk2
 xb/fNrdbhvDC1ILPi5iL+90XjFpg/JGpvQolayEb78ZgLMNqSE0qcNGElTNmvKi9yeTtDkaS3w/
 oXV421W/NlM6Qss0hDrIMAlmAdMIZI7d4RMj9g0vqQzbykDYHNzpWI1HuvQYLcc6WmBW177Es9z
 QpeJo0cMzaEWAHhtY/EoI5zG82t6+w8Pl7PS0+m9foswvDW6jVyLZ4LKCdiPCdVBLWl1x0uefbF
 bgKEQUPDxkHW4qr3roKFF4mQntF9AF0ZoXcfHiuiCMI9/FKSrEvy6JYw1ulIxYPrboso6NGBw8g
 RkfNLQxWrBKQN0QnV/Fd8Atuxxc8+CN1sZ0YdXeIxqBzHJfuRIlAgMJO0OA2S16JTwWtdONpfWN
 FAOfm4hF3Skdtq2GpbblMRfl6w0VrTRaD1yqs3+0tlBJZWvQFmwTHRpfN/aO6BK9D4PFraUzKsk
 nFdkOVU5Ycb2w12aIHzr1+Ymz8P29E=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_044722_804772_AC1FA525 
X-CRM114-Status: UNSURE (   5.82  )
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
Yixun Lan (2):
      dt-bindings: gpio: spacemit: add compatible name for K3 SoC
      gpio: spacemit: Add GPIO support for K3 SoC

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |   4 +-
 drivers/gpio/gpio-spacemit-k1.c                    | 150 +++++++++++++++------
 2 files changed, 109 insertions(+), 45 deletions(-)
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
