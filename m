Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF06AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VAG6PNjIYmLqTuGIeOwVsF8LbJffHJHY9dL/+kAaDEs=; b=NaG8/dOmhgk887
	PAaF6d0TdZ77SdUJq9Y5q434tvx8EtlkYvhwlA+7uAzeZhGdrk/6oj5zrn+iumWxi56O+pG/8TWhz
	HvdLWNtzZWgydXEieJFdsoygarLCilrvmuLhpT5wgGPirbU6W1tvxHM1Mdf7VXulkGnaA4x147BA+
	bKbJM5TjYWIlLUS6iXbprTMveHI8DiWzxucGLFkk+kOgUgnSUa4W0uXb9FxpISffHwUkKa8Qk1Vs9
	yVumNG3uXVzM9TQWUzxM8t8qu+z+jWLaEidb3RmttAWOWucH0sr2QX0SaoUBgf4YO9rnaXH6pPb2J
	yo0yvUzuWPYE9j9reQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8rW-0023sh-7h; Wed, 19 Oct 2022 13:11:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol8rT-0023pT-6i
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 13:11:56 +0000
Received: by mail-pj1-x1034.google.com with SMTP id o17-20020a17090aac1100b0020d98b0c0f4so18988719pjq.4
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TnLW0RVC/l/l6ZpSJGiQ9RS55Sh7Bww2u/zF6eZ2bY=;
        b=KVQYSnSwQFUiWWTDWziioJ8nATp3sFAA9sevKxCqCpQA/HkYqlZHsnoYXNx+Yg89JW
         ADG9MTT0eSgkBbdG4uNIHC0BxS6IlVAb0qXbDZVALJfkPpzjOxQ9HZImQWkLXn0lCImH
         B8I/RGkuYTGQ4oHXovOjUyfU12eWG8ApR2HNPlOZM+afMaQZxDgYdv2/eNG8XP0kg1WU
         MlmG+k+QdUIjiFsM8FlM0txbeRzB/ckeVWjS+nO3RKWD5gEtsLHS0uEnD+NYcTru45o/
         48Hwnn0X1r81gKz0TrPhcqp44nRpbh2ehIg6SW3Loxto5vQvZDkyKsNqMD+b3ZxODu76
         9l9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TnLW0RVC/l/l6ZpSJGiQ9RS55Sh7Bww2u/zF6eZ2bY=;
        b=cUUAm9P0cx+FT8/rIXNnzWdKpO74eoh9uqemQfI18cj0KVcMgpzBg2Gjw3TMH7kAiA
         wGGhUmoPnPLn/D/SycNzKOWVuTPrieHL5CUhlAqQtFFemXyKuwJArmNNgLEoeeHuMwrX
         eYujBD88P3GZWKxjZqmpQykW633v0o6nvDB8Ya4kE0ljPKOenMtFmO3QhTaNIEXHiGcy
         KrGiIX3nILBUzSj6fQJ+FGgdMJiFgqRM9jxRjja+Qns66OQKH3twrZdrwTQp35oT86Vh
         FMy2rc6py5Z+WzAMxFxQKC1zzQMwWw2rGsSfzaFvLbnTfKgAxyZxNXswZbWGGsvL2wLW
         1dyw==
X-Gm-Message-State: ACrzQf3Fh998tc9reTtuDurX4GEzwv9xNMoQEUjwVVEiAs7N6y7vgb1L
	2/Os7aQt27ZEDxaCnTH/WogGHA==
X-Google-Smtp-Source: AMsMyM4jEiN+8su71k6+cb/emSNBAIxNnD4Cx9I5sby2nXpdtW41N7UtPPhg792GaGcgy9DpernSOw==
X-Received: by 2002:a17:903:41c3:b0:17f:8def:dc92 with SMTP id u3-20020a17090341c300b0017f8defdc92mr8326965ple.7.1666185112189;
        Wed, 19 Oct 2022 06:11:52 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.102])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902d2cc00b00172897952a0sm10934478plc.283.2022.10.19.06.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 06:11:51 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 4/4] RISC-V: Enable PMEM drivers
Date: Wed, 19 Oct 2022 18:41:28 +0530
Message-Id: <20221019131128.237026-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019131128.237026-1-apatel@ventanamicro.com>
References: <20221019131128.237026-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_061155_252644_692B4D73 
X-CRM114-Status: UNSURE (   7.57  )
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

We now have PMEM arch support available in RISC-V kernel so let us
enable relevant drivers in defconfig.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 05fd5fcf24f9..462da9f7410d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -159,6 +159,7 @@ CONFIG_VIRTIO_MMIO=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
+CONFIG_LIBNVDIMM=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
