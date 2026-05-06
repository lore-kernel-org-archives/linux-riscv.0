Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3704CD3436
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 09:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAPcQpCBUa+NBx+FtO3puP93GiAHG73FURm09UVvx5A=; b=tV+9bjN6pvq3wF
	wqnFCsMGgIx5oCwVf3dsY00d55UBuYskgO9Q5UBwUj3BesR7n5svKtWlehBnHjqDZDwkx0HRN9XGk
	3zEeriTRl2AdhzE4ip0JetqkmrYQGUJDCZoONQ5lSR6jZ8Qvs74gzcg5MRREfK2G3VtWUz9zwGkz8
	Waim+xM2hGo6wSoAvaJLYbgvRRU7ackspT23lr071Pn2qRydcmah0lA6DR5iOjhC95UFcYzrRnKhi
	9xzXEAK3UaYt1KTz5PtQP7dD8J5cjgy3m1J12nObGLVbjm1ve+frCmwdTKpowz1UmaL6eJylIVvpO
	sLsq/KJ1dMv0eifkdK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ1F-00000000QKK-0FAR;
	Wed, 06 May 2026 09:58:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ1D-00000000QIp-1Sw6
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 09:58:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18A4343D94;
	Wed,  6 May 2026 09:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33148C2BCB8;
	Wed,  6 May 2026 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778061495;
	bh=swaIO29uhHgaslA4Hb1JIgdHX4IRPVdujCyvQCSGJPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sr9dxcpKbkrPjay+PbxV7TxKARgnQeSvNiWdxHqqwTNyrWnN71FmZ69sBQgaLvVQf
	 jfhZGtsQFIsRLl9k9OgRgPasiztvdv+jBiqTq/tE3N++VVFnbEA0A/ScgMxM5z2sl5
	 Lp8N0kf+l218jEg7tFKPLbxLeN61EcUyvtV+ayG0qiG5LVUkhIwpdaCzCbcLJGqAFP
	 SfwNY73hVH75Kab2ugZt3wkdwD5h2+LvAyOO2IeTRnNiuanHljXzrPGtD8GjTDZsqk
	 4WzHdhqekeI1A3CusbSWknRQ0nbkXvEVrWedGSn0fPEpinzyGbRdKeJBzY9aWjdpLa
	 1LlIf1TfxLL8Q==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [RFC v1 3/4] pinctrl: spacemit: delete check_power()
Date: Wed,  6 May 2026 10:57:41 +0100
Message-ID: <20260506-backtalk-pregnant-ff4cbd27b4d0@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506-energize-dramatize-051909e54256@spud>
References: <20260506-energize-dramatize-051909e54256@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=f33zeKL5li7qyIF7zuSgaFGlrhBhLaxwN0tJ5RiB2fs=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm/BSa/fc7zKjvqntBa9fW+u13t5l559yMkpVm8yHaN2 g3T7R9CO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRUl9Ghkb7K6GySfZHrVbE +nLKtcfcW7eaP9Uu1v5jRfmelg1TrBkZvodaMm5n71KetaAucPcL7fz3XefyfAtz+vpX7zLwdzf kBQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_025815_427931_E79EDC03 
X-CRM114-Status: UNSURE (   9.75  )
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

AFAICT, this is pointless because generate_config performs this check
too.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 37 ---------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 62cab6f6cd0a8..41d8a34bc386b 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -409,38 +409,6 @@ static inline u32 spacemit_get_drive_strength_mA(enum spacemit_pin_io_type type,
 	}
 }
 
-static int spacemit_pctrl_check_power(struct pinctrl_dev *pctldev,
-				      struct device_node *dn,
-				      struct spacemit_pin_mux_config *pinmuxs,
-				      int num_pins, const char *grpname)
-{
-	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct device *dev = pctrl->dev;
-	enum spacemit_pin_io_type type;
-	u32 power = 0, i;
-
-	of_property_read_u32(dn, "power-source", &power);
-
-	for (i = 0; i < num_pins; i++) {
-		type = spacemit_to_pin_io_type(pinmuxs[i].pin);
-
-		if (type != IO_TYPE_EXTERNAL)
-			continue;
-
-		switch (power) {
-		case PIN_POWER_STATE_1V8:
-		case PIN_POWER_STATE_3V3:
-			break;
-		default:
-			dev_err(dev, "group %s has unsupported power\n",
-				grpname);
-			return -ENOTSUPP;
-		}
-	}
-
-	return 0;
-}
-
 static void spacemit_set_io_pwr_domain(struct spacemit_pinctrl *pctrl,
 				      const struct spacemit_pin *spin,
 				      const enum spacemit_pin_io_type type)
@@ -548,11 +516,6 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				return dev_err_probe(dev, -ENODEV, "failed to get pin %d\n", pins[i]);
 		}
 
-		ret = spacemit_pctrl_check_power(pctldev, child, pinmuxs,
-						 npins, grpname);
-		if (ret < 0)
-			return ret;
-
 		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
 		map[nmaps].data.mux.function = np->name;
 		map[nmaps].data.mux.group = grpname;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
