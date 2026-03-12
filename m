Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EAEFED2F1
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 08:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4Cz2uVvTGdyUo8FecuYqiNW8ou0t5MLT4mMUQBPaBQ=; b=Bf5DEkearWy92f
	m+iT+SVlZjS+Xv+LP5VJGLK0QWEJ1E2JvK8bQytRi6MFsFn1WHMXmPt0rv9NQ10/KUvrDq4umOAka
	2wGHD4rfVDCWTuyw2hEnk6QbJLbDCidc0S9iXUcob5GWsDhhfr8XSOW8hz6qNa8ZkClASjD+hyTtw
	2coQqNiaz0s+S1euFksSl3VUiPe4F0+5gFJv5OjoyU/XAL9Bp2woud/4lcA5gWZBL+iTUpL+4f0JB
	s0a8J8RXHyMOFBllxK5GMLRHzrcH9WTutLhPIl1W3hFyg8T0Jf81clGX3VdnUhbwGTyTvcaDoXKrY
	/kangnaSr3uEibnwYOVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bdj-0000000DenE-0SKa;
	Thu, 12 Mar 2026 08:43:31 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bdd-0000000DemM-3mUd
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 08:43:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773305003; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QH0Tdbja1Hfyq9EzNR6QnaIzusMndEOL7prvmnj79KYijmWuqObfY5fC8TLQ9KVKPfb+BxHZGtcFCqEgcVp8QmmpdcDrLlNUk7MKnxpyBU/ijOHrR1s8TlODnvQX7d25i1KAc5l+AwCdgoUJX5L4pmSFAkltS0kcK1z5t88xVy4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773305003; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v47EHelxEqjuraNQyB3mSutNBgUfD8I8NAMJB3eHXcA=; 
	b=i9Ux6dtDUFTjb2xxn+MZpaUw76tCepjr1tq/W3HezILypcShCnXigde2VHHTwo6qHvoI6kXSNeEGnPrRUJ3rWLdR1YlosrjQws+tnHrL4QgngcsomQYB3oGPTTroUwe3VWGC7JZsSB4Ashoi9TBDxDWOKa56ewckuilkpIB18YI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773305003;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=v47EHelxEqjuraNQyB3mSutNBgUfD8I8NAMJB3eHXcA=;
	b=ULc3fNhvD8HwrjdbCZhVnPFiEf6ePL3OuXkP2qzv/WtCy4F1tlULMGR8D1aHhB8r
	+HVxQQ4ivY3Eb7eGVOUXKdzgy+wM0Q6a6TqfwFXTXChQN84jq0Zw4SJy0U9R4Rits0m
	qQyZCM94VzQ/czRbKea7/yacW9vMa9ZGr55J2UCo=
Received: by mx.zohomail.com with SMTPS id 1773305000858359.97959519734354;
	Thu, 12 Mar 2026 01:43:20 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 12 Mar 2026 16:42:43 +0800
Subject: [PATCH 2/2] gpio: spacemit-k1: Add set_config callback support
MIME-Version: 1.0
Message-Id: <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech>
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
To: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773304980; l=921;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=9MTfGDEAf9YZnyagaSAAFWByTP/OFXhtAXonoK5uZ0M=;
 b=DA18ygHHkx+XZ8+b+pvbB3WE1hpWwMHQiwrwKhJ7Hk6Yc7YFAF0bqMqkIRFuIdhyiuMDEkL/E
 lG9i3nNvLUVAd13vZsihfmLz+cxFyRnCwTFnwneV812r1MvLYLuWqRR
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_014329_098920_CBB033CE 
X-CRM114-Status: UNSURE (   7.78  )
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

Assign gpiochip_generic_config() to the set_config() callback to support
pin configuration through the GPIO subsystem. This allows users to
configure GPIO pin attributes like pull-up/down when specifying a GPIO
line in the Device Tree.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/gpio/gpio-spacemit-k1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index dbd2e81094b9..5fe813b7f9bb 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -228,6 +228,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	gc->label		= dev_name(dev);
 	gc->request		= gpiochip_generic_request;
 	gc->free		= gpiochip_generic_free;
+	gc->set_config		= gpiochip_generic_config;
 	gc->ngpio		= SPACEMIT_NR_GPIOS_PER_BANK;
 	gc->base		= -1;
 	gc->of_gpio_n_cells	= 3;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
