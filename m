Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977CAFED2EB
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 08:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qLmPAGrVRKpLK6tw6IVvGoZ5f35IEF8JvjNxdqT373Y=; b=21y15PvrorxCaI
	feInItYCGm007r6TjMVhkegFQUa7dxwr4rvrHGB2tO7lW1gBR+35UsnJ27r7JkJSMNYqU5NvDoHpD
	xTZj8bfcgPv9zFLb+zL15rIPVSmamXiZF90alDjV6e15E3dh8QSBpZqjR3V+gnzUCyIGYufpKOm6S
	36HZipFnDx6lnAoxybVQEUlDFzfJZazY0cRIJObfLs7dn4VGt4ApH9S4SX1l8o1MeQ4oqp+JUaaYI
	u02WqOuhYwZ+IJuZ7S/KJ4wAII9izvZl0R6wyTlfXtZftVedAl3xU76rGr+DrYvqLn1Lnn2GnAmEw
	romVL/+10d0UfzEwvY/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bdY-0000000Del3-0NJL;
	Thu, 12 Mar 2026 08:43:21 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bdS-0000000Dek2-3lZc
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 08:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773304989; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F5hSwpNZcQtPKx7PQE4uUw6GIsAXX1/M4MwaBj7AJ8XzgPjtg/nW1GQ3DCbHGYuda2RvWQHaKnVoAgvLUhf4RViwXDOH8++InsmhJGcIdus2Pw6Nqx6Tg0yD7hCowC3rHtRo3z7lBVnVJnQjL73IayheJ/KOXnJXegTVi3AJYCU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773304989; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uQj6ZycW4k8NABW6ZEGD6JBqWI4xAvj29ErMyDzsZ7k=; 
	b=m2l6mmAxbSZ6YrZB5dsSZ/LhWb93JExKcXB0CoLvvqTJPEs9v0Dm3AXo8bPzI/gtm6ki63XzJDz0ZKmSEKBHztal2mjNExQSon0cBFiQsxesCdZLWh6uDabGPDPF4zX/7YhmqVqOo3bx4JLl3A2bgsWGrx6PlmReDceuXsXrTko=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773304989;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=uQj6ZycW4k8NABW6ZEGD6JBqWI4xAvj29ErMyDzsZ7k=;
	b=iGqgAF3ElbsFNoBBYvYlk+7yISCfZose0UO9SS4fheago7uHeddrXBQot6fi8PXw
	aHkloALKzy/Djrmzef/fbzPgRvjeCI+RKyGUb5QaCES88o08X3hyckMyXvv6INm73IY
	K8GNxEV5a4iTihTzxZcKAjv0xoF91jwrm+RWOLB0=
Received: by mx.zohomail.com with SMTPS id 1773304988251269.8455882910689;
	Thu, 12 Mar 2026 01:43:08 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/2] gpio/pinctrl: spacemit: Add GPIO pin configuration
 support for K1
Date: Thu, 12 Mar 2026 16:42:41 +0800
Message-Id: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqAIBBA0V+JWTfgA3r9SrQoG20IVDQiCP89a
 XkW976QKTFlmJoXEt2cOfgK2TZgjtU7Qt6rQQnVCS0VnhJd5ICZLjTBW3ZoxdBrGhVtq4EaxkS
 Wn386L6V8uku2DGQAAAA=
X-Change-ID: 20260312-k1-gpio-set-config-f0873e92ebac
To: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773304980; l=1284;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=f+PIqqu6oVpYXE4fiunpYM9+RC9U5ZQdIJciIwi3PyY=;
 b=5zW2jnVH1u6pfK3Opx9MYniDsQj3a+gJXL+kgsic5po1fkwmnfqQDhiSxKdD/08ykbVl2Wnfq
 33jyxJufWOAAXHu/XQ/JCfVvmzJZA3UMs2Zh+nGhnJcwaO/FuMdCroW
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_014315_321353_003F41F4 
X-CRM114-Status: UNSURE (   6.58  )
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

This add GPIO pin configuration support for the Spacemit K1 SoC. Some
use cases require configuring pin attributes like pull-up/down when using
GPIO lines.

A practical example is the SD card detection pin on the Banana Pi BPI-F3
board. Since it lacks an external pull-up circuit, the pin must be
configured with an internal pull-up to function correctly. Such
configurations can be specified directly in the devicetree:

    cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;

To address this, add the set_config() callback to the gpio-spacemit-k1
driver to enable pin configuration through pinctrl, and modify the
pinctrl driver to return -ENOTSUPP instead of -EINVAL for unsupported
parameters, allowing the GPIO subsystem to gracefully handle them.

---
Junhui Liu (2):
      pinctrl: spacemit: return -ENOTSUPP for unsupported pin configurations
      gpio: spacemit-k1: Add set_config callback support

 drivers/gpio/gpio-spacemit-k1.c       |  1 +
 drivers/pinctrl/spacemit/pinctrl-k1.c | 21 ++++++++++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)
---
base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
change-id: 20260312-k1-gpio-set-config-f0873e92ebac

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
