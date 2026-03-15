Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EDDD58B0F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Mar 2026 07:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=feNwdCBVTIzJbQtvOTESTkdosRLLEefYQZyYqH6qgrE=; b=cje9Q1dF3wSny5
	97T7l3kfhTuLr3beQU9QK9dA48aIxkr+MQUPcU9ZXzWe53ixgG5ChAqVyFIcJtgz2NxKcVHaN2Qqq
	4GZQbo889zyIdEIOfSRpztzTCX5t/aDp3xVQ26rZtTmGkPTlcMlO0dQGyLLaV1fxHSCWnI5fXpn2I
	n5YDJIO22e75lCq7rMXB0Wxn4jSrZIRfyMWimRgir6kHurcYQHdAddmko7tixoOb0/SRKg/h6aFof
	3UrrDm2gveRChPIuQXzOCLUVW1ZZXoOuXgAaoAxjYldgvagrm/21h2Bw0AaPyoZyfC7hjnzKTINBS
	a78AyKkMwJwPh2nWGbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1fjh-00000002SHO-0ZzM;
	Sun, 15 Mar 2026 07:18:05 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1fjd-00000002SH4-2q3s
	for linux-riscv@lists.infradead.org;
	Sun, 15 Mar 2026 07:18:02 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ae88e16485so24607545ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Mar 2026 00:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773559080; x=1774163880; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmB+4AfDJQoT99kSuCamxfMIbT8/uyLGRZ2V2BFS2Jk=;
        b=SqshZtXfD1vZ68wpjCkjxOZDSNwOitQKsKLvn06z5/ZaNiudqIpFqxQq3W+p/bQE/T
         SnSRv4tMjz+7+qZ5iqMmCtUzZ5Phl9+XEyccgOLK1RJ4aYvemnjM+0oKmcDpon6wMssr
         PD6FSMtFLouMk5U2jAMCy/l8x4eoTLUrM1pMoYtr7G+eT5rYVweyCCNQ6V1Tf+EkndW7
         VgzNSB2V0V+VjvjIWg9bJhnthfN2jPYAQPa5o91gIIYlq93jPTGiwnbY9pw3rwA921cS
         iJChAv5gqhbBA7nWJZBNki+0DohjfXCwAHclI/VfZbHrIkHGneA5UN0nHlRiS+Lbd71i
         teZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773559080; x=1774163880;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmB+4AfDJQoT99kSuCamxfMIbT8/uyLGRZ2V2BFS2Jk=;
        b=cDuTVKjegzizjLOoDROy0ADDGDR4JpuoSde7mU5QnXZmEVMKLhh9Du5c7C8l4GS0qu
         EOZUiUrHfSfJd2BwHn4UgEiM71qzsa6qtje3M5otNIRGg10+HPgVZXj1+m8CQ7fHettb
         IcJzap+KqJJYEJ4ztCd/QqT96JKa5e7LG/4c8ALv7EjwcJQQ6WdzUo2+YbqacmiS5TKx
         rkH6jaH92t4r7d9N4Pfwux0cyWvLhAZN4UOAMb3tQuv2TyW+TlSHKjvz4KF3dm7sbN8p
         HJO5vyWOlIvePXBDPWAmq/mFrau1RZN1twqGqeJEHVMPk4n0XJirzQ6f1oseP0XvVj9F
         PITQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0yJ+tYJDmTPWNEBWVBJ80/7jr3CXtp00cehJ5ldO445fENzSOgcZd0AOR+KeWoyIDuyaK/aPzAcT4mg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1b2DU7zb4g61qteEVVgJYZ5B8spYRapZafTOOvnVzqYanxuuq
	8/sbUhzh3cJZeKu+smmx20gmxdEThggxRaMc6hwro8q1guo/tJx93D8z
X-Gm-Gg: ATEYQzy5c0LqAVYFH1KywY0caBr565yrnbcc1bOby1UGSya8NO7S5L57pHDKsBJOImp
	15Bu+WPTie7Gu0ctoW9Ts9SMfp3SJ0u0hROdH+exdR2qOCNUUWfhH9vAeE9tJxmYD/445+T+lC6
	Fw5IGp5Grr/ClswnW4CzW/oo9+b8U0S8JhQMAutfqfYvHMd21UYBtR11TTB/ttP+ttGV+wu+OLX
	i6fYxTjV6Iw2LTc13fc1ZRIc7YV6QSoe7bGv5KEP5kq+IBPnGvcpFKpTzoVj/yOuFltwPCBCloL
	62ceamBCSoKZSo+2gGGm9eAH+QEKB5tcnWsKEcbya3heCMKM9ZeOOz5188oLA2TkSSD53PVTwA5
	u6zddr0eVNhtwKhwnRPU92c1fxhMS0F9aQPHSoXODu2jYgrTcS4iZdhDUMSmByQDdl1zNBXURnI
	O1YLHR4GMtanSuqSvtUviEN0Tjgzj8PJ/WfhOh
X-Received: by 2002:a17:902:cecf:b0:2ae:cbd9:5f2a with SMTP id d9443c01a7336-2aecbd961acmr92596685ad.11.1773559079937;
        Sun, 15 Mar 2026 00:17:59 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56cb7fsm87285415ad.6.2026.03.15.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 00:17:59 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 15 Mar 2026 15:17:54 +0800
Subject: [PATCH] irqchip/riscv-rpmi-sysmsi: Fix mailbox channel leak in
 rpmi_sysmsi_probe()
MIME-Version: 1.0
Message-Id: <20260315-sysmsi-v1-1-5f090c86c2ca@gmail.com>
X-B4-Tracking: v=1; b=H4sIACFdtmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0NT3eLK4tziTN00MyNTkzQzU3MDwzQloOKCotS0zAqwQdGxtbUA09f
 2HVgAAAA=
X-Change-ID: 20260315-sysmsi-f6254f65701f
To: Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>, 
 Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Sunil V L <sunilvl@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773559076; l=1079;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=tcQw2kHiC9GSxdTDYKfZrPmy6kro67MTQ4O0GCXNUmE=;
 b=92SpKj9FxV87KIFWQ02U8AtxkgcLsgAkrosCGnPj2ue44MhpG2PET9Xd9SyE3A5bCsSZqaEjR
 H1FxIkU82XoAgnDGhNdAlcZU97KWiIudzcnQsWtyLVHTRfe4+oGQP1d
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_001801_753962_3B65C47D 
X-CRM114-Status: UNSURE (   8.64  )
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

When riscv_acpi_get_gsi_info() fails, the mailbox channel previously
requested via mbox_request_channel() is not freed. Add the missing
mbox_free_channel() call to prevent the resource leak.

Fixes: 4752b0cfbc37 ("irqchip/riscv-rpmi-sysmsi: Add ACPI support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
index 5c74c561ce31..612f3972f7af 100644
--- a/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+++ b/drivers/irqchip/irq-riscv-rpmi-sysmsi.c
@@ -250,6 +250,7 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
 		rc = riscv_acpi_get_gsi_info(fwnode, &priv->gsi_base, &id,
 					     &nr_irqs, NULL);
 		if (rc) {
+			mbox_free_channel(priv->chan);
 			dev_err(dev, "failed to find GSI mapping\n");
 			return rc;
 		}

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260315-sysmsi-f6254f65701f

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
