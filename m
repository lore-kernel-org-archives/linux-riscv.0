Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5BCE92FC0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DjAZmnKDLrqVVYVva5XQOjxsA/0nt7Y7zQYbBh4tMNY=; b=qwE848ujjio79M
	XItBp6xFG0ZyXE66YdfCDw7iYh5fj2oDjZL7DjdZelOnsgQEpW6mlmc4dJhZJdxYNarYEdbnfia1y
	T79N4KsmLHi10L4q2oePe7HO5sJSI2Vw104v9Xf1Y399WXIKD8koGb3yw5Fy+c9iOCuhCL/jo5raE
	vHPo/JgP5J1R8VM9H5a7GMT6XKPi2KQqqo06nz5Lk/8BGo7v3o9GMxxrYyT6aw7f3pGuA/UkIQ8NT
	1T8IOwY/dGWKq8GnCe3oO+i2JpClYrdPr7+PnOu7DXxJjSxnXDNVnz8uUSP5kZY18aGQjGDaxTntf
	L09DDt2hfqNTtYSQOx1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabLK-00000004z0l-17v0;
	Tue, 30 Dec 2025 15:09:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabLH-00000004z0E-2Hb4
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 15:09:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a0b4320665so153393705ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767107339; x=1767712139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PemJfqgrS11N0rN844byXVfn84NqGSNQTH1UI9V6ZpY=;
        b=OudYfSYFWePgHhCXURVSTVUk3H4MWqY/rxZZBu+cXSCaMD58Z2EZEVZpyDMcK0H00B
         5jrwq13Wr5vcRnX7lQhQkSOvEVidmdkZLhZ1ww74NnzlfqjZfJky9vtjOrdZgC8WUxWi
         /+319yQbpUKmslEK3RtCA5+9hXZf67kmPDBz7cpyXZaACHBzI6q/HdnpDe9xlmzrZow/
         CMAs8C4TixjWzdEDEFyKSh5QXYufA3wttFB5z/Nqf/Kdltvy97dxks3XKHnhm4dvQdvs
         50HYQKmSi8j5KWGn2v7FL/1ezyhAjkLxCx3jnx7kpBBM9ARTOaO9siKix9qRQ9pXseBy
         X8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107339; x=1767712139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PemJfqgrS11N0rN844byXVfn84NqGSNQTH1UI9V6ZpY=;
        b=htW6sxWGXkhTjE8VnyBKF7VKlqr1XgYQiYfpkXv54thEKb8L92LpUBDbkGaHzZ0yo4
         P9UIIopv2uHmKU49hBR1iynTmWlUmDJ1PSFsuMxz2am/QUtsxE7EFD0bi9TPc5KGUEGv
         UEZYV/V6ngZyb84vvEKd6uSCcA4PManUP/6JI6nT4s/xfOiHi4AHs/eJd0ot+QVZe17O
         Xinj4Bh5RtGP0TK6X6ahPGtgyVuUJfguKIy8CQTtau9JGq+7KredhycQjbDF4104xdNK
         P1rcbo1CsCUo/jx1wYWcpJnJgrFFGzvmcfgYOAIjtBDnWwKb8XRSid7jD9Sm7ac6Kdx/
         5PXw==
X-Forwarded-Encrypted: i=1; AJvYcCXPv5dwfcRmIl/i4djrhbeXPteSjXFRc0VmK1AH/MVaEUNKW8sNdhfRegMzMUVEqi6WcRGwgytbeaW0PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXaXxk2RoZxoXLc4aRiNz9rfgpxHU+1AR6sxoW+EbfU3bFgfeY
	PEClAdASeMj/JjveFH2DmZLc1kQS+sxgWeCwllnDUA3dKn4CPEFxZ06v
X-Gm-Gg: AY/fxX58tbVDzDLjnzEcFb0a4WjlydE2DtSoNl8uRz2X6WkGbO8ici8lwUX/WLHjEDF
	J6DNVEyaKpXNfGooKrY2ql0tyfMdyU72OK3sJ7hzPIa4XsBdwGneUO2fKR+G9DSiuxkmV262mfO
	bh91Z8T1fn4RMYEoFqtZh4+aifz++qyndKYZtUx0zp/BioYQ+O5oReJBAofMdwNcmO9EWyUWaG2
	CWp6NQhGBg5eidq9RBygeFGUm3hNtN3VapxsTxwehcI83zzj78z7MfE7lZXiicufa0BMYigHVPn
	dLAPGLosByybXT6hhotau9qZOqZ3c/93N0/gB9M5ji7jtzuC6eWTU2j7z1B/5cTJ3wj+aEyGGDE
	jQu4EXreEG9xgSPfwIY1NytiB76kk+pFC30IgqYhpFmfVFDZd2i5KdwnEfSHhwniqf5VXV9RAUl
	zrlUeM
X-Google-Smtp-Source: AGHT+IFOqjFWFdi8qdqJlYdi2yUC/4zRYrjnSmKV+0M3gGTfJ9R/5gjkPTHwfTLiXvQhvLLg5PgOkg==
X-Received: by 2002:a17:903:3d05:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a2f2a507bfmr327890665ad.44.1767107338428;
        Tue, 30 Dec 2025 07:08:58 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82bc9sm305130385ad.36.2025.12.30.07.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:08:58 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: [PATCH 2/3] i2c: k1: add reset support
Date: Tue, 30 Dec 2025 23:06:52 +0800
Message-Id: <20251230150653.42097-2-jyc0019@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230150653.42097-1-jyc0019@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_070900_181491_FB893BB3 
X-CRM114-Status: GOOD (  11.62  )
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

The K1 I2C controller provides a reset line that needs to be deasserted
before the controller can be accessed.

Add reset support to the driver to ensure the controller starts in the
required state.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 drivers/i2c/busses/i2c-k1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index d42c03ef5db5..23661c7ddb67 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -10,6 +10,7 @@
  #include <linux/module.h>
  #include <linux/of_address.h>
  #include <linux/platform_device.h>
+ #include <linux/reset.h>
 
 /* spacemit i2c registers */
 #define SPACEMIT_ICR		 0x0		/* Control register */
@@ -534,6 +535,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = pdev->dev.of_node;
 	struct spacemit_i2c_dev *i2c;
+	struct reset_control *rst;
 	int ret;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -578,6 +580,11 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
 
+	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "failed to acquire deasserted reset\n");
+
 	spacemit_i2c_reset(i2c);
 
 	i2c_set_adapdata(&i2c->adapt, i2c);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
