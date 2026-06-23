Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8246CD4F26
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OWXInBDr389MjBjGg8Lz7btDgdxax6sgb9KiYL5TIDs=; b=M+hEpxKdhn3fY0
	I6d/oCk26cwDulDzjPnxTNDRfjI9Qtjk5ZXDxAxdnqJT9lo4yszL8oRf3VA1QXgVURuWV7h2E4vT2
	bfk+9pj7aqTGidf/I9L6cM1DciGF9UGrj2iqd5yPaBBYXoiiXrB5UTTrnf66jsZdFm0YslADJWJW8
	MdnqmXDIsjXqOQPavXNv4rl6oPS0XxaKytNDV9ypgnPePVVN7PG6uGkn0NICQGlTObJ7DXHIekHIo
	+NX/71G9uoC7x986WRVPIOMPPCcVR7cvll9+wGRcsON7ub36u8O4wls5FzZToN5qboY9ramjKfRLq
	/OvCpDewBDP7wy0wdhVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvqY-00000005qq2-0PCq;
	Tue, 23 Jun 2026 07:47:02 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvqV-00000005qon-1ncq
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 07:47:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84536e2857eso3234007b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782200819; x=1782805619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WiYA62dHorpFymdfXssg5HAuL1K3q/QdPM1UUVatA4k=;
        b=krnfZUtH4id9cAQP9fOxObIsPP0v0OAQrm2Aw1EDwQakfrnu4b9RiJfVKNt8nKvn2/
         g7IjHSedoiBlN7lYlQhuBMZ3uIxBIh4RKTfCEaFxL8dOUhn/R5Ps5lckiG5gSEEg+L04
         B2AIOmqBt2GXWZQmIdad9DM+y7ze8vsBKVNujrhYyDSfx9b9yOZVY/2DdINUGzVcEQEq
         UXHLhCIknaKIJHFkAeiCyuJC4rOzt2v+9Bx5tDa7ExQFZgC9rp/WJQKmHFMx71vOyJDr
         wOeu7rakw/WNxo6GplZW0v7ciBANJM/yTQfCvQosJ70fD3g/5s3XJGh45CvGVTYHqwnz
         SvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200819; x=1782805619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiYA62dHorpFymdfXssg5HAuL1K3q/QdPM1UUVatA4k=;
        b=VlG4mdMQetP+c3btVh7Ukg8RGZw/lLqOw7V+QaTAfKmJK5NFPir5kIJA/QEHokv0L6
         ncfFHXAhvFxPXtcGLh3uDF/qujrKlGgn21FZyLrNaP/elpvQwZP0b1aghZ3fkjxUPYdc
         uQZa+PsXry8gSeuuEyIiQtO+mpnhgeL4SfhRlxnSyQxcDeVghNEMMHdEuY4MuE4T4Op4
         payJPw96dwECE70fV2CBXCRWDlb10ewCiFl7Khn0icFJUyIoQAU/3FadB9h/zx4Dj2eR
         4yIQoh0+PGh5TFO0JNfZU1KSULNyUkAeOkkKJ7yYj/uUdL4x1p/32vFrXTyY9fjtXLDC
         44UQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lkB2WiwP2y1YKdEJoM+XCiEt8hpGr6huFaliWaQZ6HrDnmwnCfGW+1zXCaTCKoowHoqHZ4+fOd11TUg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv3/Jyy55hf1+aHBLNXBuSpHGMEI/6rX/YVjpdGFRy2NjUqw2D
	kIhok7mSHRAzdI2OiGEOAGlK4RzXHDY1Iypl0iuJpTqO6mI9U8fA25uc
X-Gm-Gg: AfdE7cmFkkdsfYQWoKwW/gDrr81VxszpP53Rp87o3YMAHKwE9PNozYkSFl3H+Cge5U5
	sK9VSAUpPAmaYWB2wgBZUkVYAJDolOeylSBUG+23ZdZIuVGmLrjMXX24D6zmDw/hUcUh6ykqg/V
	SUPLaBP4CWlU7Z6GBrDc12ojIcRHy+f1Pg83qdKtBWP9oJKJpk0tJDDJfclXxfe4muOKDja6LWB
	L5/ZTw/oq1Xjp45GQ0TRCenZ6F4sRbbJTReGBssojlTOO+NWE9Mqy6Kiul/QpghuH+3RWcmUrm3
	oYR3ATIJRTnJRrFSjnj7nOhl5RSX4OXEgXW2fuQOb78V2U6DNcwizI2bmnvsvGjhm+tNiBR9nYV
	69XAG1BX5eDdUcFtjpMf9rQsFnfjPAa/mkAOsLFNM89aWqg8wBU8kdtGP/jR8FLjZKq16n214oe
	CExCWTmgfVhFeBDmlllUIxvQ==
X-Received: by 2002:a05:6a00:3d09:b0:842:5711:9a2f with SMTP id d2e1a72fcca58-845508a0edamr18772015b3a.36.1782200818608;
        Tue, 23 Jun 2026 00:46:58 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed9516sm9765519b3a.57.2026.06.23.00.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:46:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yixun Lan <dlan@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net v2 0/2] net: stmmac: dwmac-spacemit: Fix wrong macro definition
Date: Tue, 23 Jun 2026 15:46:33 +0800
Message-ID: <20260623074637.503864-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_004659_467079_4611CEAD 
X-CRM114-Status: UNSURE (   7.28  )
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

Fix Wrong macro definition of the Spacemit K3.

Changed from v1:
- https://lore.kernel.org/netdev/20260618064143.1102179-1-inochiama@gmail.com
1. Separate the patch into two patches
2. Use the right macro name for the LPI interrupt.

Inochi Amaoto (2):
  net: stmmac: dwmac-spacemit: Fix wrong phy interface definition
  net: stmmac: dwmac-spacemit: Fix wrong irq definition

 .../net/ethernet/stmicro/stmmac/dwmac-spacemit.c    | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

--
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
