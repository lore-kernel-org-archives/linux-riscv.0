Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B50C4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 12:30:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9613260720
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 12:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9613260720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJym55yFIIhWNwuRk0/sn3S5UkOiKZgw7/lHZx5lt3Y=; b=FBq29iynpQinxo
	XG6NqIiocYz8TlsDz41fBsiOE1XsrG60ZSOPCtTPHpjM1e7KqRN1kVn9sTquF9Fc/7vj0wFzL+hay
	6plfDStsJHrF7YizHogZi7uJG/LRRkqaxYJuvTXlybIk2RykGs/v2TqkazLn9De7h9oY25DkoS4ut
	FBB7gPf2ERCssqjkEV1WlW+yqhpV3f/Kq1wOYX0D5Bv40HzBXHYVeiZVaywuLQPq3fb2zkr5+RyOz
	BorDMjiWVchY7xcL8k0l+cJMmX8Tbjkl08uPrMpeEedYKhfXKZxQLjTWP1R6FH7Gt0Jtkguauqk/O
	+JHpz1c3dzUqzm3OukzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBG2f-005z0E-0j; Wed, 04 Aug 2021 12:30:37 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBG2c-005yzH-9x
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 12:30:35 +0000
Received: by mail-ej1-x632.google.com with SMTP id c25so3457778ejb.3
 for <linux-riscv@lists.infradead.org>; Wed, 04 Aug 2021 05:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OLftcCiR2oyNljE54bb27thfQzh14DolSH3s1/1P/+w=;
 b=m45M4wRFC7Zc0J8Gwu3B4lPC/LXioJnqS9oEvr8DV3PmhE8fuVLvxh2rsNNgG4v0Cm
 xYXf9abkKtsKsE81rL/F36DrUNI8wfirBIIb1vhYV4GMbweNlS1fRdoA//UOJo08J+UN
 4n/fhk04AuQMYX0JaAYM58M/sqO/GTx94iIHhMa3Zv4OtVVJ2n4qKDnmkFdL24mz4niS
 BOXXBAOse1NH0nopBEkHzcnWRainTbLcj8CVaJs1XzpG2vnDlDm3x3A1YWYPJQvhFBR0
 uNBaOm8lE7xm1I+njc8XdoXuu7NqGcZih78DLF98n5d9OhkUT58ZmwLy+Z9XmMr8F3ZR
 N6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OLftcCiR2oyNljE54bb27thfQzh14DolSH3s1/1P/+w=;
 b=PE428G4d/0Ltiv9Wpa8MQyx8SYf25UnIfEb5FnkbSfyXshhprwf7H0yUTzp9Tqbanx
 nhx8Ra11yS6QMpB19ECpYi7uhCXJ7IXeEQSaxV5Q1mysqQcupxQBql0Xeu27SKYEImje
 2NKr1MEf6e4fpHVH4TymYdhNr2hUhqaHOXaKtvjxi+9pPXyLU9Tw1Yg1LTxaDMZiJ57V
 pzn45oWNn/CNg3+dEAi9W1PSLPnZw440A7ySCEBSyjuKeX6g84Dxv1BdZ2/2h8l5W0gd
 18WVFS0kQqBMWKKonay40dwICZl6SxGJ9CQ+CuHZvvj17dJrOkQNu4GkFeh1QETPVXJC
 eZiQ==
X-Gm-Message-State: AOAM533BnTV1sJfLyQqMbGwK1+tROML7xnSzO5/Ar71l1o0neizVbAkO
 1live3Qf0Oqnm0jLAVFQ2iw=
X-Google-Smtp-Source: ABdhPJxP6xt6XhnuBtGwOrh2MyWhOJiuzzj9Ab5gP5VWwMnYmfC9koqioV/vQw1tMV0IM1YDaR4mWQ==
X-Received: by 2002:a17:906:c252:: with SMTP id
 bl18mr25700532ejb.519.1628080232108; 
 Wed, 04 Aug 2021 05:30:32 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id f5sm627590ejj.45.2021.08.04.05.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 05:30:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 2/2] riscv: dts: microchip: Add ethernet0 to the aliases
 node
Date: Wed,  4 Aug 2021 20:30:15 +0800
Message-Id: <20210804123015.807929-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804123015.807929-1-bmeng.cn@gmail.com>
References: <20210804123015.807929-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_053034_388445_63F8BABF 
X-CRM114-Status: GOOD (  11.46  )
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

From: Bin Meng <bin.meng@windriver.com>

U-Boot expects this alias to be in place in order to fix up the mac
address of the ethernet node.

Note on the Icicle Kit board, currently only emac1 is enabled so it
becomes the 'ethernet0'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- move the aliases node to board dts

 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index ec79944065c9..baea7d204639 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -14,6 +14,10 @@ / {
 	model = "Microchip PolarFire-SoC Icicle Kit";
 	compatible = "microchip,mpfs-icicle-kit";
 
+	aliases {
+		ethernet0 = &emac1;
+	};
+
 	chosen {
 		stdout-path = &serial0;
 	};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
