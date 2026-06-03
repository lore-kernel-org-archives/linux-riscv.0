Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B52CD6E5D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 22:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N9vBlB2coycfO/8VyXVX42Nnw1r7PObdv8YCSKS2Y0g=; b=DmTxAs4fqgZ4m1
	vH+FEZziUaA4MoXTUoLdtLGKBtpQb+Pslej7lwNqrRBueMEwObgwY6JM7mb5LgrRTI4PTyjznvP8d
	LYfzNclPpq5wM1nFxEqDUZy/GQPC6gZAThkgTjIf7SbCJXT5mQTn9DavBclidSnb1aG491KxtdX4g
	cfgPFCWKdj5B070Eqs+MORYYUh8lo/OXoyANxLwi9KjPQ1GE++CFuzvKPmSyxYcm+ZjtFAR3mMZiT
	xZotC6EexNi50zVAEW91vzTSb3eg26T6W8LGMiE/0MzBi7LxAGNucja52bjbuX08c7lvMkpewRD0x
	M93bo8dIUflFKoHcr6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXZc-0000000DszM-0Kda;
	Tue, 02 Jun 2026 22:27:00 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXZY-0000000Dsyp-3iQL
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 22:26:58 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8422871b42dso2003975b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 15:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780439216; x=1781044016; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OeVUpNSoatWZgvnpwiX5OT5mqrXXwumAUSFwCDIGdLo=;
        b=XC8pZxvcZZpWt4yWX/I+ufuPgbMbzs/85NH3h8OzsSQaaQe9hadcJXfse5kgUQ1kFE
         V4CU6MgNqK8d28I+kak8xa8Tw4IScHhji4FxmRGD0Jq9kHYQHSWOt2mLJcSVI053UHZy
         7u3ZBnlqJMhy2f+t4Ea7kDHh7n2Kx8vPGkggdRU4GGVif5Py+HDMJFOlw/RclspDzVCz
         Gl7NjcWUB+jYaWSdchKmjX/C2SfvhLi6cKnNQRkKb+X+9oiD+tC7A8seDEgK+4M3kep9
         eWBVGQQk1+KXxxfw1/6iryrrjODMxtyPtiOpV26PMCMVf3rNVc5L9G/+JIMmNuoncCwA
         j2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439216; x=1781044016;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeVUpNSoatWZgvnpwiX5OT5mqrXXwumAUSFwCDIGdLo=;
        b=YS0KpQSIvHb8vGIJlJUEJoFxoTAjljP+bWG+ix6Dhe4Uc3ON1qxAexZo2z2ZFIw6b+
         W69LEiFeAFQVu1MqTvVadpqrbLFXsLeWdXdAJ5L3DQvaCHcAoPQrelmipjFxL81xsUlC
         KzvzPiN2dzAztwQMEIWZBe9fGgQyjIDgD6PoXwRSO7aVNgg0Q/281yWVOOL3tSqHtmzu
         QXoKGB3WWWCyTLW7A9vs9vHlSy+R8mrSSgtS9JTpMJ0Hft9iWCw0q1yXBtkA9xaUPSft
         iwTocBTPC3vZs1wZgXQ5mhMWYRGt1NZu4DuceWtL7zwnYvHTzTpBiXivcfvYoCuSqSkG
         3VmA==
X-Forwarded-Encrypted: i=1; AFNElJ8uJ7c7ZjiMJdEIP2sRAcmYuM+bk0125REoboqPzh9FdnxsSzwHz6HkT4zcaK9RLKR2mQGDHzUU+z6TZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNQddrY/m/8BeGTys12eSaUfLXsFu++UyqtuSyt320oAquFh0t
	g7aeCBRktic6cNrKdZu2a5N4WNg0C0lT2NHHkWIgAXZ9qoASaGNIroIx
X-Gm-Gg: Acq92OHYiGnMSzc82ykYVgFh0vnLEdM9hAjqGZx+/yrdoMpLM95sckWk/C+5QA1RcEg
	u1mdPeBZ8gaOSqzdbEtHRELr5SrNjW+VIVBcj8b6iUrFa+atAkHnSIqegryOL/o/AJ5D1v7nIak
	2njVJQB6PMggdabPTLpSATxn/YAGZFdc45erBJv9wIqUWRSGXb1Gvi+N6xTI+h4EH6UVAm5s7X8
	75vi4Iho+tHHX7LZz6Fo3d21xJ+WeDExJsrpLn2v8WnFoCvbkZJhEWT6j0n7KdMHCNfC6oIJggh
	XS0nNyt5OpxP5JmYSEW49cGNN6OYJO5zG1n5ShzNaQerp71CN7ELrif9hhMlowldyNq4H065agQ
	kREUvK28HEK/y8fZz1SLeKySECDoTfJP7yEROwWTWM0cfThM6ubg1lfOliePVSH3Mmy5E24DBGc
	/bFzy98D02UA==
X-Received: by 2002:a05:6a00:994:b0:82f:623f:e5b3 with SMTP id d2e1a72fcca58-84284ec082cmr697402b3a.34.1780439216068;
        Tue, 02 Jun 2026 15:26:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428291ed20sm1009556b3a.61.2026.06.02.15.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:26:55 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 06:26:11 -0400
Subject: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
MIME-Version: 1.0
Message-Id: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEIBIGoC/42OSw7CMAwFr1J5TVDSNhVhxT1QF0kwrRH9KA4Vq
 MrdScsFkOXF6D2NvQJjIGQ4FysEXIhpGjOUhwJ8b8cOBd0yQynLRjZSCVcLnq3HgaIIyBjFYGm
 MeTGwqJ22Rmlj9ElDdswB7/Te/df2x/xyD/Rxk26NnjhO4bM/sKit9++tRYk81lVS1WhspS9dj
 p9HPw3QppS+E2+mk9wAAAA=
X-Change-ID: 20260601-b4-spacemit-reset-maintainers-4b5a91599585
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>, 
 Alex Elder <elder@riscstar.com>, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1925; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=r6qoe5HnCPTD19cVd5ECsifmTZ9MzU9r06AoxVG7f/U=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFRr9Jp11YX2pOOvB0ofZVq+/ya80/G6++ZPCv8tAul
 5ULNPgdOkpZGMS4GGTFFFkOH23J3vrKJ9r3OecPmDmsTCBDGLg4BWAimokM/7N6NrPN+Mm0bFvO
 x9a1SSrueiyil3/VqattEQ63Pld6fS/D/8gu+aT6vAcc2s2t+4/pHbcp8ZwcMrfFUFWvVTVx3vN
 tjAA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_152656_953375_00E1248A 
X-CRM114-Status: GOOD (  10.18  )
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

Add a MAINTAINERS entry for the SpacemiT reset controller driver
(drivers/reset/spacemit/) and its reset-ID header. I intend to
maintain it: the K1 and K3 instances now, and future SpacemiT SoCs
that reuse the common code.

Link: https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
I introduced the drivers/reset/spacemit/ subdirectory, moved and
refactored the existing K1 reset support (originally written by
Alex Elder) into it, and wrote the K3 reset driver.
  
I contributed it as Guodong Xu <guodong@riscstar.com>;
docular.xu@gmail.com is my current address. A matching .mailmap update
is summited at
https://lore.kernel.org/all/20260601-b4-mailmap-guodong-xu-v1-1-ee9eff1e57ba@gmail.com/

Changes in v2:
- Reword the commit message
- Add L: spacemit@lists.linux.dev
- Collect Alex Elder's Acked-by
- Link to v1: https://patch.msgid.link/20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ec290e38b44a..b7ef4ff2a2054 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25119,6 +25119,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 F:	drivers/i2c/busses/i2c-k1.c
 
+SPACEMIT RESET CONTROLLER DRIVER
+M:	Guodong Xu <docular.xu@gmail.com>
+L:	linux-riscv@lists.infradead.org
+L:	spacemit@lists.linux.dev
+S:	Maintained
+F:	drivers/reset/spacemit/
+F:	include/dt-bindings/reset/spacemit,k3-resets.h
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-b4-spacemit-reset-maintainers-4b5a91599585

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
