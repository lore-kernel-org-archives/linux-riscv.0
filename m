Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69323606A322
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BTSUjDVg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5i+BIjB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kg2lUIrW9Maus2B+a1cqPCzH+0C8CWUX+W2HgL3mixQ=; b=BTSUjDVgX1+cjWTXsCVkSCV6mm
	BGmVbYfsJxS+WEX0F0u2o9UunwsN/wlVbKRgLrrnYXecqcmqm6QCvbbzUfCA1WHFsMYr3lGFKWk92
	iuwg92UKv7rw1bHjB8Am0nDPXljykz3RVU2R9wWOBRmWvrDWrAYAkcCKrghmOlSN2x8rYrJY0f0XH
	sBJ9as0LC0WA4woE+6SHArBDXmSfdO7yQ8GnLkb03P8duI1fB37vDztRkKe79yRgMXv3kZdrB5VCp
	jLAgf1OoB61O6zMRlmbyh/J9hKs+zFdbHYIPLX3qKs6klfNb+uCCNuC+k8UxvFiHv3x8tYS2QP3EW
	sLS3KcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQARP-0000000GirJ-1bov;
	Sun, 08 Nov 2026 21:28:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQARL-0000000GipL-2Mjc
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 21:28:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e46e449e8so176193f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 13:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173317; x=1794778117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=p5i+BIjB5rM4dM2mll9xzJMsOUGfQTGBPbSHGuqJXlQyYohSwjdsdAyEWKvMGwWiZk
         Yt8NmyuPN95hHe9D2NMHcL5rFCfR2l3jMBVTDwboXYKdOStPt4tlQnxNoA64g1YIVZxO
         wms78fqbuSGkPsCVxEnCWmjiMfJvOv1LbmAFOmhCC6Ht37HNfWi2+xvmnR1ICbeEMdNx
         sSo2ODo8nA9DcGuTYw/9tFH7inUpguuX4f5CSPeZcwX4NKQnqy4CKOd6Xv97ZT4dNCVP
         Dhz1V+PAw2YkNSw34BG3ohlPkQh6YVYbk1pg3aq0d9qG1bBGtw0cmJr+umw809BTKUR4
         i9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173317; x=1794778117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=1hBD/V2QeyCxaG1EMg4TXxtPaA/CWHaY9ivhSIssgELOyQrjsvEC/alv2r1FH15/ZO
         qbV2CZU7zej/cBuP1B+GoRgXC9QmONSFevUDq3lq4/k/2uTAZpQ082ejcHk0Y523sGHn
         FsUNvHjXpQMyP6/j+/gkuXUJeYYfjwgEqCJqUJHmhkID0NgwCiHv6Kz5vPasDomjCA//
         VdYlXkVKpuJElL0elu8IOr6MdUYcZFg3meFaHTBw8bikFU4Txo2tLwpzCkP0/Pooayj7
         p/3o5xmvvk6WUlETckFj8RTIv3p6uiYj04/Ly4WbNWRPC7W9eVcJHUFnuB1e9kx6rYBw
         2AUA==
X-Forwarded-Encrypted: i=1; AL+hErG/V/8ynY+s1y1VbowpLs9uQGn/FuQIEnTFIj2XxFeJVpsBCCIJ0D74iRZHfdgfdGvi9IEpva2VdSWZdQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8isTDNi4uj2O5GMC3Cl27Ybb8CsLd24Lpa2M4aUQroxRm82Lge
	sYCEVqDPmTvpsZhkRczJebksiLKWu0rxW0ygzUqUlbkQzmFXWPQixH7Y
X-Gm-Gg: AYBFou0x2r9d63g1jTdSApnGPJvmkUlzJ9d2SHu7ydsN4IpqVPLSfEi6VRUf0JXoLvq
	DrBV8ZnEQlTGVVmGxbg1gDBpYgGPNcGXYapDfz3kAKP9N/B3WdxZX/5uQigLAM2dgMz/LHPw+In
	9QKL/PnzzdAzYNJmNlSy3+UhvuCQC2eQlo1fjP7ceonsGG9MTgR7BHNdeiXZ+HRVf4GKUOhwpVr
	glAOYvztGx/bg8d7OZ+c0A1eoFiLLSVT9KDAhDa+sM6kd+LAYYOlMwTz9O2D24craPQc0IX0qF1
	7OaK+zaKyOs/CrCgQZUfLTfIXF/105+0NmUgbF8HxXBkSBQ3F31x6DUj5h0tuYZNnMttLvDlIrV
	TzU90cVW6gr5thpIc0I7tcZ74A2omtzhqui+P5pACIklftQGSgG6V2ZuT4FinHiCNLb8sT2h1Jz
	2en0Iu0cQAPYbQZ/mO++HCLaxOrzlnZq+ZXnhbTH1cCkOXxeZO8NENl9KBRaXfJaXni4d0D+zyH
	yFMVK5TVDukHf/VnlxmlIpDJ9Ows08OyM0P5zc8hk+ZK3iUgBlkJe3n9MtoFqD+4RJQUvoUQkwX
	/P9csCd1bnDhBIzq+r1rRznlLrK+RXrBWQ==
X-Received: by 2002:a5d:5f50:0:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-4958b34c671mr4024764f8f.24.1794173317559;
        Sun, 08 Nov 2026 13:28:37 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:37 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 3/4] MAINTAINERS: Add entry for the StarFive JH7110 RTC driver
Date: Sun,  8 Nov 2026 21:28:25 +0000
Message-ID: <20261108212826.15890-4-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108212826.15890-1-oo.hehir@gmail.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_132839_608939_DF5CD39B 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add myself as maintainer of the StarFive JH7110 RTC driver and its
binding.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d3..2ee86a46c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26877,6 +26877,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
 F:	sound/soc/starfive/jh7110_pwmdac.c
 
+STARFIVE JH7110 RTC DRIVER
+M:	Owen O'Hehir <oo.hehir@gmail.com>
+L:	linux-rtc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
+F:	drivers/rtc/rtc-jh7110.c
+
 STARFIVE JH7110 SYSCON
 M:	William Qiu <william.qiu@starfivetech.com>
 M:	Xingyu Wu <xingyu.wu@starfivetech.com>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
