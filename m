Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43024C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WtlWoL0T8CRsHFq5dzwWZd8Xe6hNRcK2mWSfil9JtcQ=; b=qcNt/hvrV2vF7r
	/EGJzqAD8wkrY6X/PGkOQAMvjbPDMm0Bt1o2wTluxw6B2jqCcMxGVxsikxIQ3ucfekNg5oymrH4Vc
	ljnTzJLJE16y7L3s2jJGLNH+vMgt8P7Oi04Lu8H7K4i4FQSJsQ+JLdjoCZCDWWqAk+rLQE9JdVSdk
	AX41zaDMAWqzQjZl6P8Kb2b8r+TEbBtukqxaPBcKhC0G2Z9IUD900TxAU3WEF0aa99x0f7hgcf+uc
	9LVDNvVEXm+aA6VUW61gxPEPnwdOshw+psO0Z07cPTkTRQgs80GMNm/Qn1deKwI0MENBAk0VRvxSo
	YPwH9nQYROrbKQzNSGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7jc-0000000ChmE-3hfx;
	Wed, 15 Jan 2025 18:03:20 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7jZ-0000000Chlf-3SoJ
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:03:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21675fd60feso155227575ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736964196; x=1737568996; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=xCcJS6u74VCJElVRRlhnuD9s/whziweDY1j24ItnnSo=;
        b=xqfr5Vadgn0NZHFvj7sijv/mrv5EWU1Yu99WoHquK20NMvp+VbEAq8C6JF49y0bsN9
         H8e+pEjF+dgF4sra2v40rA6SFUr70FXegZrdCGayC4OarxR17wn1px/sHMjRyf7ygIhb
         z+Y9xQD2FPhtw24FfQJB6bupR5Zeof5sZWN3A7f5G2lo3E3YfR1CDvEhnkw4LHPe9F69
         BeN3Khk7gjUcFAy/nthPORp/BSQdXyIrZKI2Rv53nLjEK0tVFFDiBIoiILBVPrOmscg0
         +TF8DAaZ/1/UXkh3edViV6R2agyELUARCROe1SZ8ytdvEJeobVw6a6KXfKQs39S4JZOX
         C0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736964196; x=1737568996;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCcJS6u74VCJElVRRlhnuD9s/whziweDY1j24ItnnSo=;
        b=HpCQJWT2d3fLvxnYnwgnjlkay95TcsfUFk+lpeAO1yLhXj9wupQLDWZCEtu3PGc8DC
         DMeaQ5AoJYxVEIAiKwpUH3QLUFBNa7Qb8IeCdmdrm2hTZz43Kyv+/LbPD/HdNFzIsBZ4
         ZANbRgIkfe4vM2hSq2uGPdVxtY/MviZZG+t/DecxaGs3D9hjVRGOmeJDs1Uq1yafK7Ex
         Lbu5TNCKPLLZfVaDjZYBMxkENixmcA9VV10rA7S43Z9DQWG/lfhTHBMCgA7TkmgCcgh8
         JzQPYjx/HbRPL1IdBaYaXx6KIF8LUnAUqwcNcckuQ7qX4qPit88WzcwXuCsKCmr0+byZ
         Si/w==
X-Gm-Message-State: AOJu0YyeALCHI7GW+uKyXDhMCJQ3AEFwDnuZkwZ8F3wlI6qkJ4WhXsg0
	DePqehZ2jfYpqn4ZMqAbdSEqXF5XCD0ZF5ORrOoXGBPfeQd/XxYc7FxsVIQWjRs=
X-Gm-Gg: ASbGncvd3zBfKkMSkBYmmRM1OyXFatO1s7bi52Gz0tnv4VK6yRr/RPw5zLx0on1iy/a
	G+UWso+dRu4dYAv9RJhlAaPbdGg2A4qHIbdheGFNVaCGRb1iEqdOuJZblO4R4B34Uw0bJ+cjs4f
	QMF7nRfv0ovfBvBhJ2gtwY3aHw7k1kNThA0EHt75tGmQPRHDCH7PP98BAbme+2G+0hWOuzx0YBa
	LyixJeT+IcLFnVPrkOjc6l2Vit+LO/P3loifBOJJLODQ0C8RAnJFNw=
X-Google-Smtp-Source: AGHT+IHv1IsqZ42wx5ZtGiv8F5lCrmISv2J1L2XekTFi9/jOWfiZwoHUabBlC8N5ZCV/DUw/EdLE6g==
X-Received: by 2002:a17:902:ea03:b0:216:31aa:12fc with SMTP id d9443c01a7336-21a83f6c665mr550696745ad.24.1736964196487;
        Wed, 15 Jan 2025 10:03:16 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f52bsm86049565ad.8.2025.01.15.10.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:03:15 -0800 (PST)
Subject: [PATCH] RISC-V: Mark riscv_v_init() as __init
Date: Wed, 15 Jan 2025 10:02:51 -0800
Message-ID: <20250115180251.31444-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_100318_126849_10069E9C 
X-CRM114-Status: GOOD (  11.59  )
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

This trips up with Xtheadvector enabled, but as far as I can tell it's
just been an issue since the original patchset.

Fixes: 7ca7a7b9b635 ("riscv: Add sysctl to set the default vector rule for new processes")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/vector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 61ded78fcaec..aba5805119c3 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -319,7 +319,7 @@ static int __init riscv_v_sysctl_init(void)
 static int __init riscv_v_sysctl_init(void) { return 0; }
 #endif /* ! CONFIG_SYSCTL */
 
-static int riscv_v_init(void)
+static int __init riscv_v_init(void)
 {
 	return riscv_v_sysctl_init();
 }
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
