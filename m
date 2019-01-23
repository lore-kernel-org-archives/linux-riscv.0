Return-Path: <SRS0=FsxO=P7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCA4C282C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 22:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB2C2184C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 22:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H2ybEHzv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SwF4eAtk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BB2C2184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+fJRLXGYLN8yigIAE0Pu0wP/EW915HLGWJpmC65280=; b=H2ybEHzvJf0jPL
	fsPT1ctFXFqzto87QSxZCvdreKynko4EmhYE1Si+CUh0F5QkvPxQXkOQ3elhMuUPZmyE27pixN/xF
	uPljpFP7qfl7xF9xSP/4gE8O3YyPUTtbfpgnutKFbNpOD9hLnaIqEWAJs49ESy6q/pr0HXdVsRI3k
	hRiO8H8VYYvZ9L7E7p/G4eJEMs5I6IVfdgq46Frl4MyuzzSX0SeZwUG/0B3CBxMzwIWtLQHByCFXa
	0xyVarDNAqagOKWH6859b0nA1IoEXXd8SH7dABrDrtDGaQRH2p2iLpob6CNQxgn0Qb6NrVqlY2iP3
	64Q9CXeo6j+aCbcvQ1bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmRM4-0003iJ-Ci; Wed, 23 Jan 2019 22:50:44 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmRM0-0003eE-BI
 for linux-riscv@lists.infradead.org; Wed, 23 Jan 2019 22:50:41 +0000
Received: by mail-pf1-x442.google.com with SMTP id y126so1928544pfb.4
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jan 2019 14:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=/6LyvfPlaaayoSWGO24Ydygk3Ashu0iFAxYBN/iMh1c=;
 b=SwF4eAtkL4WW7QIxjv1gsdW2unGf+TZkyJRvG3+AEiuIl7Km+rNTkU1gJ2dwxVsSQw
 mgKG3dEv82z1364isSZgaB10VJGADotYcJw6yH0+O0mknubxlvhzdih5otyqHxopIbiO
 eWT6Z20e0Sd+UALP81nVBYL1ngVIAl1Ahni3xdoluw0zRz7B0TqTWeTcXrmjikic3qmZ
 RLArWxhm4GRHdvJZ3bvc+XhauU1+hebay/o2PrqKNClt/V81Z+ZxXyaEd8F0eTfc9jzk
 W9uhyGEnMO3IGLVkGpG+E6xl0WdeXpwIp16aCdNa1aCp4TgwmU9LLCvsJyJZsMxk+w4w
 8thA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=/6LyvfPlaaayoSWGO24Ydygk3Ashu0iFAxYBN/iMh1c=;
 b=hY+M8YohK3vgQcHM5s/uqHJNSzLUo4Q1vAMhWXpE+Lb7+ndhnZQOzKB1fO+3gCcb1a
 YzAEszsUdfHAxN0Hl1HzL4jodiOgaLEv78chylc/iS2oUVHEpdX+JagGDvSx7Pz96Nmu
 XQfeKB+aUOtFox5CuYiTtFQaJNET2CkuR2ttQWjwddlZ4dGHuZmAgad/rOjn8352Gna2
 6YcTV1joK9HHKpPiMpmDcOPbSa1T6cMhnbPlbIammr438HE2oqf8BcLZXe9SORJ07U/+
 9zEc65sNLcAyfjZE8WYQBcEr7C+lGEOQAzyuHO1/8CKn1ok9jQXYqA61sM8eKmum+E4W
 Y0vQ==
X-Gm-Message-State: AJcUukclPm9h06G8pNzRZGHGFr2cBfAoo8wWfxS48W2fyh3h0eRSClnq
 rhQ0ruRsDRa5S0EuoHunO9rEtA==
X-Google-Smtp-Source: ALg8bN7kGLyXPduD++w1IuMQJqaKrYHqolR7UsuQRXlp7fyANmZu25N/XP7zPNiX8AHUAEJckfYTAw==
X-Received: by 2002:a62:710a:: with SMTP id m10mr3899470pfc.69.1548283839602; 
 Wed, 23 Jan 2019 14:50:39 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r66sm31475028pfk.157.2019.01.23.14.50.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jan 2019 14:50:38 -0800 (PST)
Subject: [PATCH 3/3] RISC-V: defconfig: Add CRYPTO_DEV_VIRTIO=y
Date: Wed, 23 Jan 2019 14:50:25 -0800
Message-Id: <20190123225025.32052-4-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20190123225025.32052-1-palmer@sifive.com>
References: <20190123225025.32052-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_145040_386229_2B4045B3 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This allows acceleration of cryptography inside QEMU.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 01fe50707d98..2fd3461e50ab 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -78,5 +78,6 @@ CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
 # CONFIG_RCU_TRACE is not set
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
