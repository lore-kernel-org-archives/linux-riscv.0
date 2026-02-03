Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D86E87821
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 13:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cVn4WoflLYSddPVzYu/TLAfCIMq83weiJrRwPp+8kkw=; b=y0BpVHO4267dzu
	oUL6hkB96P6eR8vCOJBLcFqhk0CEoeLeBmEPnlt4FlfOh+KjUqUBjW35sGGEb1ivai2g0hOMRxP8q
	axzCYB0lGoQIG551AuIBVvzVRXGjWvxANatNr5Efa+2UAiYGthGqI3VG8Jg2gz+ujKz95zQMAczdm
	jpZTcmeT45ET9yDGRxc8yMMzq/VJP3eiOn6joh/lPQ3s8VFoXInRbio2Ezdrgilde8UZzefsOfXZU
	PuIYxK27A29dFfMPUZVKkCsZHez+BE4+7Zx9dnzu/4KDcuCPXpT7foNZeuOQb0i999jIlnT8vONDH
	XffM09u/HX5kV7k7Lxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnG4Y-00000006dat-2Qv4;
	Tue, 03 Feb 2026 13:04:02 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnG4W-00000006daP-0A1X
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 13:04:01 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a79ded11a2so37654615ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 05:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770123839; x=1770728639; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIXyJm0lCseTe2hRs5ugea/FiAW2/mhs7M9O2I0yF5E=;
        b=Y2/BiF5cfKe2r40fLEqPgWjyz6egkd2FinQK9hR+4rCFq3Q6c1BhHG5WNnaihIqt+L
         /QF7yv4NXOsWvh2qjKKWnn6lhodXZedyIPmxx/QPfeVGG/Apa/dGlPWHDTrzywOMZHzv
         IUzOoHSkStkX6KRIyloSxE87fBpqrXU3bIoVEDogItoWx8PUxFsN4pWwcrDqAz+4/Bys
         qwG7enCvxPvkR32oL33gBqIFBFxvbI2pp2t4GoC1YBLhBqGfRsdA3Ug4ewI4a1zdqSvD
         BM8iIWwbxhAVM5fHqafVS9gDEsGvFbbwSwtzKpoEHvqJ4E3m11Si5cgUugQqMAiiIXHH
         Jd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770123839; x=1770728639;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIXyJm0lCseTe2hRs5ugea/FiAW2/mhs7M9O2I0yF5E=;
        b=ty/H3nYzkVu71jrZVHJMNIF+fS4AvBy90Yn17efZpNOO6rvlMMLMgl1CS9S8IWRFmK
         bXQBRQKM0UNpHQT8QBho+mUXgI7oCEWIY0T9vhGw4PkJwfXms0EHk+wSv2omKt9QGcdt
         fdAgjooiOID7paYJg8rF4ZCVFLhvqltKWQle+NN3/+fDdH+j7vYeFgpx4hqYKOMyvDsw
         rdUpw8Pd/oNaqnuxVXd7za5qUx5+bj5xugzmMK0QWWctmhSLx2PjAem+Asgf9lQfRKve
         9E94PQ0PLYNbE7m3CCMDTw41hR8A+f06JcZJ4Lp9lK23POtiMX12egQrJtbQFXexkYbH
         aifQ==
X-Gm-Message-State: AOJu0YyTnfAOfP4fUJ4iIX50luHZplgYoXt+ef7rpWqVsr98MBcpl2ZV
	Ay/8DIHvDwMAWymtSKOHhIReUoYygts2WZuC3NHF4XP8CzLHoK57Gyg2
X-Gm-Gg: AZuq6aK2KV9JTFUZhdnx26XyIyZwgY8BjHnzvH2UXfQtdPyuIDEBPnaeD8P1brWVCvq
	4TTYItqN8msdToIkTgsdynSmW09bm9idH+NEBVQtwiWibQOCNSClFhrD9RrIp7fgQEV1Zq/DmXM
	sb/Rda/NyU9adjY0A0Nunb6kTJs8Q/Raz8oQlNxppI3NrCvMf6Z7/R22Fs61BMd45eD2S1VGinY
	UYGxZLYXmBUNFQGMlTxqTIvWXbRq7qvwbWhwmWb3R8YaX5sZcgIROh7UH9Koy9ekcIfFzjmP6st
	e65m9YNzYaJxMiRCMGS1kC9a65lKGRndItp6+KWmHzijH25n9fNTTv3UpdeRraZd64hKq0ZZX0+
	xQSag7WYQ/tXn4Oy4NJsheDcdkDB/eelYdB022FAe1+/kTY7zEAHouQMop4gaeEp8xKDZujvf5a
	yEaN5Oi3aa61Gf6qsFsezt5i6Fg229kWG10ZyW
X-Received: by 2002:a17:902:fc8d:b0:2a0:f47c:cfc with SMTP id d9443c01a7336-2a8d990b3e5mr134748725ad.34.1770123838660;
        Tue, 03 Feb 2026 05:03:58 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:f091:7dff:927e:f788])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b94sm169614815ad.48.2026.02.03.05.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:03:58 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Feb 2026 21:03:52 +0800
Subject: [PATCH] soc: microchip: mpfs: Fix a memory leak in
 mpfs_sys_controller_probe()
MIME-Version: 1.0
Message-Id: <20260203-mpfs-v1-1-666b8704f8f7@gmail.com>
X-B4-Tracking: v=1; b=H4sIADfygWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNj3dyCtGJdI3OjlBQTs6TUNEsDJaDSgqLUtMwKsDHRsbW1AOcFWY5
 WAAAA
X-Change-ID: 20260203-mpfs-272dd46bef90
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770123835; l=1333;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=o0U5ORS4ia6EHbTkAiNn4WLO7U36zOihVM23nqfZpFw=;
 b=JlIHm7wFByMVWo6XUG8fsK9kW363nQxUVozrhPyVnFdo6muGrr91WKWUcR2mz+6ykv2DrbjaH
 QV3hQN7eonXD2uRJIqBYLQMtaITlh+8VZSOHtFswzqs+j7GIWcl+J40
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_050400_085592_468559BD 
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

In mpfs_sys_controller_probe(), when of_get_mtd_device_by_node() fails,
the previously allocated sys_controller was leaked.

Add kfree() to fix this.

Fixes: 742aa6c563d2 ("soc: microchip: mpfs: enable access to the system controller's flash")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 30bc45d17d34..a7401cb79e97 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -142,8 +142,11 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 
 	sys_controller->flash = of_get_mtd_device_by_node(np);
 	of_node_put(np);
-	if (IS_ERR(sys_controller->flash))
-		return dev_err_probe(dev, PTR_ERR(sys_controller->flash), "Failed to get flash\n");
+	if (IS_ERR(sys_controller->flash)) {
+		ret = dev_err_probe(dev, PTR_ERR(sys_controller->flash), "Failed to get flash\n");
+		kfree(sys_controller);
+		return ret;
+	}
 
 no_flash:
 	sys_controller->client.dev = dev;

---
base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
change-id: 20260203-mpfs-272dd46bef90

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
