Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26C0FED2F0
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+hhG9qYTQuxucm5R/Ox1nAVG0gPpg7QJClgIiI546Q=; b=MGQZAX06oz43tI
	1GqUOXptZZJwccwVrkCyhemCYPBtBvQ+tBMRGtMzAM8Mdg3S7G7qGOA8Zg4B/24vljUt9+cjgjtyQ
	oGde06IkBEl9g2hgU4TJV7bl+g1xdWL4ERoFCEiPVTlr6ncw7gRClyvb1n7nrxKWU7IsdZ3Cqi1q1
	VBaVNBAdsH1379T9eBTlrfbcVxWCoVO/d/Hk1x5M59VE4rmWtNi1Dq43zp8yoNkqxwHH9OShUY3XG
	VvxziFyjWLTzmHwK0+VVHjshNiUaol+yfOtI3BsuV6gWCD42zFOoO5jd7QdkDdN/2ke4fiWw2pYfw
	SHqkL+Teuzm1idEvaj3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bda-0000000DelQ-2Hvm;
	Thu, 12 Mar 2026 08:43:22 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bdX-0000000Dekp-2NKM
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 08:43:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773304995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QeMk9MU0ILTZCpd0gzBtuN0lJS/nAc72jRVK29cEKgT2vWxAqgeJZRdlMW7yGSUDiJwy722rwXOKVjeLkHO1wjPc2Ie5SfuWQcDCH/Cyus+E52fVSdd9iZgK3tMIOgJB3m2J1qv7akKI71864KYYoKfUgJh8FxgzUn98Otk+VgE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773304995; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lLFFlC1eFZuQ+K5xs5pEbHt15H+wC35wY2TANwxBsOA=; 
	b=Lz6re+TwBUzKyUq/9Px0Oye8BZhUPKElvZrPNQKV6OqnP7VqNyg6JBMlDkgUFHrkU+5mokDGc8q5z3fV8+M2a/YAm/y6vBahupsT3vvoS4XOpWPFCtN6QqK7qOJwfCc3W5S1hEgMvMvgNVcEunmh7r+lzS/7T3xHIqFvpctMhmg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773304995;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lLFFlC1eFZuQ+K5xs5pEbHt15H+wC35wY2TANwxBsOA=;
	b=STRLuv8IF+HH5vxvnpJft8h1XKUbKuwze7E+Gb4nFV1rX3bDD4qhOhv8u2shi2Am
	9bWmB84OPz1BTSq+QnnlPUMFVu0oVBngzzYqBZ7tM8jSZKJ+cKsKauNHaxZK3GgXoBB
	/7iPzd2HP1sG4WO1t65nre2gyoA9TtMFnoNC5M8k=
Received: by mx.zohomail.com with SMTPS id 1773304994180870.4146837004669;
	Thu, 12 Mar 2026 01:43:14 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 12 Mar 2026 16:42:42 +0800
Subject: [PATCH 1/2] pinctrl: spacemit: return -ENOTSUPP for unsupported
 pin configurations
MIME-Version: 1.0
Message-Id: <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
To: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773304980; l=2486;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=huf4sOli/OdrIpvyc62HdS32Qh7swj00LsrEz3KIWnA=;
 b=B3MbVb4iVOeA0XP3NHfpH4p1KIgTU4BPfBNQ6hM1nRE+0L4walRbWHRavIXqIsDZnvnmncKDy
 yMmVWx5fDz/BMpuRpwjFuDW6yIZZ9VoH3ty6IdykLrHL6wdbniCEHKI
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_014319_654780_4B7E93E2 
X-CRM114-Status: UNSURE (   9.76  )
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

Return -ENOTSUPP instead of -EINVAL when encountering unsupported pin
configuration parameters. This is more logical and allows the GPIO
subsystem to gracefully handle unsupported parameters via functions like
gpio_set_config_with_argument_optional(), which specifically ignores
-ENOTSUPP but treats others as failure.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 62cab6f6cd0a..b0be62b1c816 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -674,7 +674,7 @@ static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
 			arg = 0;
 		break;
 	default:
-		return -EINVAL;
+		return -ENOTSUPP;
 	}
 
 	*config = pinconf_to_config_packed(param, arg);
@@ -740,7 +740,7 @@ static int spacemit_pinconf_generate_config(struct spacemit_pinctrl *pctrl,
 			}
 			break;
 		default:
-			return -EINVAL;
+			return -ENOTSUPP;
 		}
 	}
 
@@ -814,10 +814,12 @@ static int spacemit_pinconf_set(struct pinctrl_dev *pctldev,
 	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
 	u32 value;
+	int ret;
 
-	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
-					     configs, num_configs, &value))
-		return -EINVAL;
+	ret = spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
+					       configs, num_configs, &value);
+	if (ret)
+		return ret;
 
 	return spacemit_pin_set_config(pctrl, pin, value);
 }
@@ -831,16 +833,17 @@ static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
 	const struct spacemit_pin *spin;
 	const struct group_desc *group;
 	u32 value;
-	int i;
+	int i, ret;
 
 	group = pinctrl_generic_get_group(pctldev, gsel);
 	if (!group)
 		return -EINVAL;
 
 	spin = spacemit_get_pin(pctrl, group->grp.pins[0]);
-	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
-					     configs, num_configs, &value))
-		return -EINVAL;
+	ret = spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
+					       configs, num_configs, &value);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < group->grp.npins; i++)
 		spacemit_pin_set_config(pctrl, group->grp.pins[i], value);

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
