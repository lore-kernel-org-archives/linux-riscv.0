Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DB9C36010
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aS4M+fXuh2I47WESd6tqCuFJY1aqhuT16rBFglg1UpI=; b=jIT2uuJDKF/ETx
	/qh05Sf1168tGoXWUu7NnR/+4zAibqSIni0YMC+X1JYC+H+RbI0vDb9/3TS5mxe3Zbszs02/3C2JO
	G8q6Z42+3f3v3gZqF5eAwpFtajI/q/w6Jz/koYRKYQFt9aDkYhZRxbxz6hHBjU3f1o+vyXLPRXRWp
	ZkSwk1/PJXo1qESwWkmOZ5ozO+VLEtd/a+qP9CrbCaNJ8+zm/CGLkKsId1HBi1Lo9vSNaZSJrTeTX
	BoPDrcyJLD6Rj3ePTKgeZsY5SfgguzZqhYApU1tbncOo77ryoXOHUVS7Ua0OT3TKVxWE3t/nxfM3N
	GlUDXgPIuDD78fSjB/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u14ux-0000000E5mP-0Q0q;
	Sat, 05 Apr 2025 14:54:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u14ut-0000000E5m0-3bfJ
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 14:54:41 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22548a28d0cso40604775ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Apr 2025 07:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743864879; x=1744469679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nKs0lwSpjYnhUeQPgpDR5O6PnIX9bK5Z7Homt3o7Oqw=;
        b=B7y8gy++iIoBs7wwccJlbfPaoXmkFqFKVmGVhZE6AIdI14w3Bv0YIsW+nrYcIbFXtu
         Tds8kpNPDTOBLlP6Fgt2RbhSQEIfQ/ymT4XkvKIOLw+3qedq5G4ZsHC9BMR7zzie9HGd
         h8WkgpqNHCLRJzLHIJ5omW4JaWTVBJEAB5Cd+n1TvDG83egxV4q5reHwyDLUTGNbrAix
         8nVcLMIfsUP+4W21wF/RoDpEBXIbHTTfd7i19IGSk7Sg4RD352IfZxPtOMheK5XhMIn1
         g8HCgH+uEUZyXRpFad1MKcHDO5LfIMnQm81N/tRH11WQiFDG7kN81ks6C3FZBIccYhaJ
         v03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743864879; x=1744469679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKs0lwSpjYnhUeQPgpDR5O6PnIX9bK5Z7Homt3o7Oqw=;
        b=mHl9E3sMkLeTXOMMqw959E33skNs9/PzG55a3FVxhpdRD+gu556mzPAPinUoHv/jV6
         II1C0gCZMDi1QHFOjOA/HoJWRxRey04KyyRBcpKCDy8blQkwDsRFOSpGSoNnPkLazUFj
         Mom7r2Ldza7iKWrwMl8nA73av+Tqwo0zhatrDsv42km2RiqQQrePLu3C1q181puCyaZg
         TphQlikQZdsC8kVzwhGFjRyNbfNiYI+2cier5zV9EgBef6DkS0GXpQWp2Avt1GAPaHsO
         PeAdtvfbOMRlzRRuF2uZlGKxaIfgXl0NQMfcWJzZ4feZAEd5n5trMUj2kTKwthamMfqa
         zUSA==
X-Forwarded-Encrypted: i=1; AJvYcCU92UNR5Cr8Df+UbyjV/hxhyAC/1vqv5MfUtIv19E972iS0+SojPcEfIDF4h1OFlaYPrKr4FMeaOFHcQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV1aXfyGvDmVMb1luNp8UzJ4iDk1tda4P7RtK3xEFu5+ByOFBR
	oA6PLWvACMUJAqHB5/1g+TGbsjz5Mc4072QxiC1szVvtY0STQ/8y
X-Gm-Gg: ASbGnctXx8JZajplnG7koPKTAKhB8hU2n7qy7AM697kHluLF62c496ZPj3NngDcoHeu
	YdklVdkUN2xVzxY2ZjnPwNfwbGnXe5Gx6lGcxDN5E4Y0cfrnauifLV3AtpBLM7LedsYm6m1Pr4F
	L8RLFcDBD31ELzKaWPH8OGmZdQf//nEjeMHD7cSuTpp6pLL0pUL505ZgUzyjLdCLN5BRpZ0y1p5
	ZUd2GdQsh8qSutijhM4bXuQ/+3b2j9oJUdH0zt+Qs2Te8vsjZg8g0J0uRkUDG4bom4egEPo2Uy/
	FZuL7Hh9Le36yRAVCy7EZqFEreE4dQhGgk1xja0TewKfjQkVPmEZ1CexE/oORq2TqeutyX82h7c
	I7Jqybpuad2eJs0IkflpMRVhvYgHHWcXTLKoqzqijBw==
X-Google-Smtp-Source: AGHT+IGaG+x1ud/97AzdLIBHj4DsVwQhF6qAy3rP10DkocE71F8Il3Fty01NOhrk0Z8YGiYjGzJaQg==
X-Received: by 2002:a17:902:e552:b0:220:c813:dfcc with SMTP id d9443c01a7336-22a8a8b80a3mr92472285ad.40.1743864878867;
        Sat, 05 Apr 2025 07:54:38 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866dccbsm50694485ad.176.2025.04.05.07.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:54:38 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	stable@vger.kernel.org,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: [PATCH v2] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sat,  5 Apr 2025 23:53:54 +0900
Message-Id: <20250405145354.492947-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_075439_894302_376976C6 
X-CRM114-Status: UNSURE (   9.12  )
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

startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
The register is also accessed from write() callback.

If console were printing and startup()/shutdown() callback
gets called, its access to the register could be overwritten.

Add port->lock to startup()/shutdown() callbacks to make sure
their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
write() callback.

Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
Cc: stable@vger.kernel.org
---

This patch used be part of a series for converting sifive driver to
nbcon[0]. It's now sent seperatly as the rest of the series does not
need be applied to the stable branch.

Sincerely,
Ryo Takakura

[0] https://lore.kernel.org/all/20250405043833.397020-1-ryotkkr98@gmail.com/

---
 drivers/tty/serial/sifive.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 5904a2d4c..054a8e630 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -563,8 +563,11 @@ static void sifive_serial_break_ctl(struct uart_port *port, int break_state)
 static int sifive_serial_startup(struct uart_port *port)
 {
 	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(&ssp->port, &flags);
 	__ssp_enable_rxwm(ssp);
+	uart_port_unlock_irqrestore(&ssp->port, flags);
 
 	return 0;
 }
@@ -572,9 +575,12 @@ static int sifive_serial_startup(struct uart_port *port)
 static void sifive_serial_shutdown(struct uart_port *port)
 {
 	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(&ssp->port, &flags);
 	__ssp_disable_rxwm(ssp);
 	__ssp_disable_txwm(ssp);
+	uart_port_unlock_irqrestore(&ssp->port, flags);
 }
 
 /**
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
