Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4B7F3C245
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 12:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C2rXHtEqHN+HMY8pavo3zyTe7P7Mkk2/Iy/gjEBrTyA=; b=1aaCKsIC1Jed61
	9DwNe5nN2Hcz/gtnENF1zq0IzrURZ2xoXv1HECX1N7i64b5goyRU/uaWgfrPEJOq7SyJdgqefUVTE
	G0sdSJGxOJhlpOGbtz4Zl2N5eTkIkL6tTTPSMmduWO+HZtok7lHDy6A7W9BT/t3Z4t43unMZYKUw0
	ppoqK/rrQ+TYnHmfDgUUtFTa+kd9HnfIAZQ/jZQHL9c03WT7ZecjgSHAYrW3/6xA1TbMSeeLfH1sp
	EaS6n7KHE3F1jin9lLa93kyjA00EHrqZ6gMU4RZJ6wN5Dgr+JKhR7NHvbIYzSW2HSDgBLIXsi6tU0
	nrZAGZmMnk1dg+1Puu6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZX3-00000007IY7-2g9Z;
	Mon, 09 Mar 2026 12:16:21 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZX0-00000007IX2-2bcK
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 12:16:20 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-829a9c03780so2620823b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 05:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773058578; x=1773663378; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKRuQiFEyPdm5c9YpYtOx5qgVqbgbBx3fb6W7NjM1Qs=;
        b=LdgXbxVBceT7y/EIfoMrmilyqwvE7X/TuREvsqGsh7xZFFHWTQpCTlo7UUDAeg8Tz8
         d0eNaAnisAfdtUByx7Tx9GSi3b8yVtWXujN5Li0glxJCf48G2v7Di5b4vPgIZjiuI1Vg
         ZLeyFBYHTanBz4TetQw71ivZ7jpUKhKX2p5PzErtRrVvqb84xHJOJhPaf5pBMkExhHZY
         b6jD4zVf3NXWoWJFrP39rkmoeHsFzw3mna04AXOO19isf11C7AoxAD9DF1g75SWwN9Z5
         vOQfl5gbrmaVu1ZkqZN1SDTIzc0gpUNMUvfJ7Ieq4+F1lI99HVm6FqcQ3p3J0CjcQEVF
         YNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058578; x=1773663378;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKRuQiFEyPdm5c9YpYtOx5qgVqbgbBx3fb6W7NjM1Qs=;
        b=uKycFz6SKeZXX/7bVn8tH7hFmmycbNbzi2FLvjIwBLd41kwYAGB/kX9mweXDSaiBtx
         h3Vn3phInuSO1HnY9XZU5pbpvxzNRijIEAfDNxv760hHyxiUv2PV9mF1knLatDU/+v2z
         32rLjd8+xyl/+an5LtNpeqEpxElB+RUuHiPg67iulkFBe4Noo+wkaGG+XP1ZpyYD1DA6
         rJVoPbpFXgvprSXlY5WSv9QpKo+e1nr1wClGt7bcdjejmhO6o4AesQ0Rq49Cmwe8wQkv
         KyaKeY6o585goxPjqJZfpftL9vBK4n24ztzjSiS0CBsVO+p83LOZWWrYFLdyLVlC9V/R
         Hgmg==
X-Gm-Message-State: AOJu0YytRL09UjW2Ng83bteBsK7nXBFlLqz1JbTS+ktsXbGFgtRLBHkg
	4U3azCms/SLKJTEqpIysunVy67cml6XHJyKMHSQLiJCg9T9XrQ1zLK3v
X-Gm-Gg: ATEYQzyjrIwYPliLoEysPZjNgVdSreyNHyUcb7rpujQ4wP8rugC8Kz1OuUc+RLv4yHz
	5tsVzn95V7tQXz78QhisT5mxSMlFM709qAzAPyce4nwXQzSg9GnJ042/pJy8EwaRX6akdOiuc1/
	qcHChqUKMn9KM13/Ev80Rs3Uyu6661jaZpTm2EEhvRHUaGqf4T8fjSgZhYhCZ6zOVfmLiOCWkWx
	qntUaFBOc0c2XblpH1pI+VQLvR+n3FgzPJqVzX6x/oV3aCeh69CxukfQD7783zVZmba2X2aqebL
	uJj2zjMlol4hbwFKdtEPhmaGjK/qJhUZcwSfVY9dI4s05GchwNK5YuiZgkjEMTiTmVwa1R1Wqm9
	CUbi9ppyf8vKfwnk2CF51eUzgEZKwcoT8cxoseJxBI1dLJqq8h1UMUYwIP+Xo18Ixkmz6rmCqm9
	iHOjyxcE/F3+cJuTjRZK14AxNRfez0pl3zzSNb
X-Received: by 2002:a05:6a20:258f:b0:398:6e6b:da08 with SMTP id adf61e73a8af0-3986e6bdcf6mr7848532637.29.1773058577462;
        Mon, 09 Mar 2026 05:16:17 -0700 (PDT)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:a816:d74a:dc19:1ab8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0a7156sm9525693a12.2.2026.03.09.05.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:16:17 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/2] soc: microchip: mpfs: Fix resource leak on driver
 unbind
Date: Mon, 09 Mar 2026 20:16:13 +0800
Message-Id: <20260309-mpfs-v1-0-0dd89f34f962@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA26rmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNL3dyCtGLdFIM0i+RUc5MkC3NLJaDSgqLUtMwKsDHRsbW1AMBSxxx
 WAAAA
X-Change-ID: 20260309-mpfs-d0f8ce74b879
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773058576; l=538;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=vFf79FzxMVOztJRlXHpBxqZv0zyHB1A8IaAhC+cXeD4=;
 b=BY4bobV9xSDrZE4BwD+t69QaLTSmhGK5sTe4i4vclwWq8n3iuEhFPD4H/gEZtjExapC0E6/uU
 Fd1G3brA3jQDDU24v+Ng/lH4DE7XU4VgGOuTJRmtN/GJg7ZrcZ8D74p
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_051618_706141_AF832E4E 
X-CRM114-Status: UNSURE (   5.45  )
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (2):
      soc: microchip: mpfs-control-scb: Fix resource leak on driver unbind
      soc: microchip: mpfs-mss-top-sysreg: Fix resource leak on driver unbind

 drivers/soc/microchip/mpfs-control-scb.c    | 6 ++++--
 drivers/soc/microchip/mpfs-mss-top-sysreg.c | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-mpfs-d0f8ce74b879

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
