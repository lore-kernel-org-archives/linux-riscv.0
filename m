Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14017CCD193
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltOXPQDH6lZy4EWGfEbiEx532fsjlnnq8kWBQMIdSfo=; b=GjDQjtb1hPEhJb
	pTMzBV3W4JyBwmcYBS4YGnpyc+pK/KhqjdLNZ0RZxhyHItzMw7pWd+hZsCNNHpLqlnsOQxIpJHKHJ
	sG84ZYJEpvZwHiOt7wN2T0yrFJ4lOCBwyqF/SL95JaLT7w8iMsK5p4lyanRJBoEr1pgyxrOJk61lM
	uaesTYH+1aN78Msu/vZgV/Lg5oYfwUc4HqjdcCLElrw4DXz3gLJ8u0IAdqZu7AKpJpqooAaR5D3rd
	tgFkHUb72Y4D/wr4NYV6PW4kXUZ5fQnLCsAUInw5wBRFcQVNCAmNnlopk9vk4cKBSGsIZqV5I2i9g
	gk4S0+4hyF02os8S4Dew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzbD-000000078F7-0zFm;
	Thu, 23 Oct 2025 17:59:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb9-000000078Bq-3mId
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Oct 2025 17:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=n4A20c4iE5OCTLQsbFf/dnrtJtYgptzbIxA7b1V4Ehw=; b=qy3XRnFeusg4xX4Jx0M2KeExJC
	e3fF30Hm/NRNv2m53wXUhzNLSjyRYLd7zpMTvdCCO36U3SUx661Ca849VM4Ia1VHWpECOspYgmQcd
	Z4kX68O4jtst6bN+PMSr72h+vI4fhz+pdrBnwu2ZYz9CBQyc1ZGOSa17TC7+05FsU6rgBJP53aqTy
	QSakm9fxe3b6DRtmpxdRaBKVriy8Gb2W12FMJZUzioW/N433x3pUmh7k6x4L/0155dTuOKOQBUbv7
	GtkOBtrRg29AhQr+/anWGj/NOdC1GwFvJRKF0lGAzLa1dQYfOdoGfOEeP3D+wiZn9ZNZZVMsQEdmx
	4tYUpdFQ==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByjS-00000001ZSe-1F0p
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:04:12 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-33bda2306c5so1161531a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 10:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242375; x=1761847175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4A20c4iE5OCTLQsbFf/dnrtJtYgptzbIxA7b1V4Ehw=;
        b=z6zM0ra1hCfiXiRj2JYFdVIEDQZ+XACRQ3kItjSHALTMsFxseQRUsaxGOT8XYz2Wu5
         Hz9Q7sZsYScjHcIapEPeFxQtAs0rD/2MSTVAkH0w77EDSRk6AGETjzyq1zc66DEY2Pkg
         szjJ4I5z0B+sG95/1wSaOWp/PEwWbdnoMLeCt/SbrEVYD/RqAcCh/Mxqjc5xOrtlVuKM
         Rbd/0cE4bnbXIe1Eqkbm5Y421ILyXPI1plc99fQ77VZIC+N3WUUlqlTKpRTp1gJ+4v+I
         GoN4yGoVhGPdqCiKYFYWoSXD7ifhcB4cIWdGqNm2+UrZhyt/3ZxjLvFyXdCvzrZAmZU/
         O1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242375; x=1761847175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4A20c4iE5OCTLQsbFf/dnrtJtYgptzbIxA7b1V4Ehw=;
        b=UtKkk3KoIkab849MhosycjzgpRGB2odb06zSNDRElqhUCLD2bEXfTQWkb7kmNiOi6z
         YEyK0HYfTE/aDfzLstwFYHqMfTFYVNT+3W1rwbJTVzgF6VwPqk9ETFHrJ9TrGGl8KhP+
         MSBoQ61uDT0tsDy1M0Int7wz5rwVAeHSI5Sle3WzDONGXBvu0+8PruvdJUYUUKfldf2C
         DjFG92dcw0wk21RSd+UXD/eeu8xl6Q6/FTGRXUBO4RaGtWXWjh4avTZyvf8PwMOXY7AA
         7TXnVeOCsgld6gWNVdwp/kGH7IptaX93klNq9IW8XBcslEofCaVnQ0H/MAFjfPTcM+Uf
         5IPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvJ9Mu8fTqQHrC1zwtsK0FH5CV0foczMA+BJ3dugZJR8U8KYVUIvyjxnd1TeuIWM0RO9Yilz/d+OkLOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvZU1UNZnqjAgFDE+b+iBSKtLZ4JWzMEpexp0Vbsct8cIs1jT7
	yVK7kb1uumC78S0IRDD3QsAa7nubHkyOeC2jUUpmRxy9kXlBqyTf1pAF/qmr68hrt60=
X-Gm-Gg: ASbGnctALFJFtsnx02+ltEQEr3FA2zLcO/5NDUACqnC28cJR+c7IG8Jud172GQ1KQr9
	mDaaDqs4WMea8w2cAd+F5skIQoShT1XBddOmsrWeCEFh/gCStyetyxVpJbwLtwjCJxEPO/1JUw0
	GRHO+5ZL38+fG9kkZ1B5HWyNo/YfgIjuygJjguwQVAY+y4ibmNJ4Icm3OzLSybQq+QlBrM3cxib
	SdiHVC3rGa0SHiQzlBc3fibHSQBlnwa6RJ66Hp3BzTH3lC/sAoUWcZin/w40Kt1J6k+daZIGfyd
	i6y+joT5mzBZIZAwFWWrgTNFOk64Q7KAC5l/7kqb3cMLmNCp9/sotzZr9W95OYIQtwybV6/VDTw
	WsVbP1XjvV6XyWK+LYxegk1G6jNUfZ2qa2VDV8uCUpcAWMavp7J5t0gLmWq/IDDOLNAlxinJNl/
	GhGkiVw2LX0JdXo1bJ0VTs+ovfTQ46L84Dvw==
X-Google-Smtp-Source: AGHT+IE97/1pEPN/LuV4xxuaKmjoVVAInH5LYa39rU238Esh33gdeg6v8zj+rsYvlz1t0Nfc0Ga6dw==
X-Received: by 2002:a17:90b:28c4:b0:327:c0c6:8829 with SMTP id 98e67ed59e1d1-33bcf8e4f50mr32926807a91.24.1761242375280;
        Thu, 23 Oct 2025 10:59:35 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:34 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	dlan@gentoo.org
Cc: Frank.li@nxp.com,
	guodong@riscstar.com,
	fustini@kernel.org,
	geert+renesas@glider.be,
	cyy@cyyself.name,
	heylenay@4d2.org,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] riscv: defconfig: enable SPI_FSL_QUADSPI as a module
Date: Thu, 23 Oct 2025 12:59:21 -0500
Message-ID: <20251023175922.528868-10-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_180410_556906_24456E72 
X-CRM114-Status: UNSURE (   8.14  )
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

The SpacemiT K1 SoC QSPI IP uses the Freescale driver.  Enable it as a
module in the default kernel configuration for RISC-V.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc2725cbca187..48afe30d42e88 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -158,6 +158,7 @@ CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_MV64XXX=m
 CONFIG_SPI=y
 CONFIG_SPI_CADENCE_QUADSPI=m
+CONFIG_SPI_FSL_QUADSPI=m
 CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
