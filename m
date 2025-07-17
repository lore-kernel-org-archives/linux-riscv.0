Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0FDC83F3B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrIO1p+ZYeaIvWjinHp6gum2USZPhAUawF/3AHP0t8k=; b=M9KpcvAT1h01bA
	8OUV8wTVstmcDvWyQc/JmDzzjFh0PRCkbVyJ83nNtZ8IHXswCCfK4AAYeSbXud2b26O8YOrMZu59j
	k6R6Mr5vS2iSck2T4jI3wXHnZq9qv3vpV8VMPvkuW49vTR+BQhBqQe33Redos+sVD7DsxP7Vl33Av
	AHnIH+K5GUFJ3tls9zxiM37T73MLHGKldAkW+Wfpi7VLs6Bvt2YRgjK7nF624BmWrwPVhwddMcuX/
	w2FCOpLlcppmhPNNMJN5NZ6k6htSe3qEYKMSFsg8K0zIrCufVpYwvcarY9IzHyCZBrVNZAIi337zp
	VIGfltvYADB3Wb2s0yTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM9l-00000009tHf-33op;
	Thu, 17 Jul 2025 10:48:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLv6-00000009qUu-0jMe;
	Thu, 17 Jul 2025 10:32:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso667233f8f.3;
        Thu, 17 Jul 2025 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748375; x=1753353175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GoTBLEmLxVjzP5x5JCQ9EAKICcOeZGsg/sgJv78VUk=;
        b=KciUATFb8qB2CMDz/xT5m4gtvrcqFLyUrl2awvaAtK7TXs1b4q7Twe6FHgXU9PzCRS
         XaKtRrhDjLOEqZrWQTNuJyM5Rj6+Bf8OjbnVS45woQi5Pg6ewjHgbX8PyoQWmKclibIZ
         GRB0OKseOXw73WXqcKd7UzqQtf1wKCmCyQqhdbA60INdp5xNByJSx0dV2wBI35ogyHF9
         JPj36s4HuVySh3rWNSvqI46axEeZY4IRUqyv6jRuDa/aD9tkwD33hYpkhlSDnkwkohf/
         xVbMw3CEr6GuiYHQYuatdtAJZwNyb3bfGvCRJiS1RN89GKnghnC5LEdReHCn6MQmsNow
         PCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748375; x=1753353175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GoTBLEmLxVjzP5x5JCQ9EAKICcOeZGsg/sgJv78VUk=;
        b=moInIoZVIRgGFmYB88ZN9pkVDTuy4jhUOerhxdnCEBBfC3Rhc3UxEORBUFHcHEvOGs
         xzBid04GP0UD651B6expeVsS1q5iEzreoE1Qr1cPXOAPEMqanK2I1M6t6A2LiVqIuJFv
         4EBzIdeYnUKes9MejX8zO6YZDBXUoB+/bETtiSXw578ibr+dlpFioIlm6g0c7fP6BVYq
         cftN077g2Q2nqrmAUv/hnz/wbm27RJW/vSqNiV7GZ9B/kkE+YVWY9n8+/CK/2fwFdIJB
         84F8VmnU4+T63nIZYn5/BZD2YLp35aknhWQ2IQNo53YUkJvTl9tHpswQ5Fwar9AL1qyL
         GaHw==
X-Forwarded-Encrypted: i=1; AJvYcCVEupNfaTFhIXEGqG9C+DnAGdE6zWLvW3AeTratpzbQWA82sKBMvHkSG43EXBdnipuq21wxuSEPsKgGIU4+rtcZ@lists.infradead.org, AJvYcCWNbJitNZbN6qFRbdRAYDoDWByyGMxt1Z+DpwBz+Gy01Vbv2vUB0V2rf7Xk9xaZorHoHJFXsuNKUgwo+Vk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFEB7uJgQCd7N1KhPzTys/qyDtTifM+MOP/QfNr+JI6TCrH2m8
	1eyQPCpcOoqu4YDVFTyRWKGSB4hznbnnN3Y55VxHaCwDEChgFmLYh0t29hA/4w==
X-Gm-Gg: ASbGncs5yn45T9dKVB4tw6XW2Ucy6fD2ucUpZmU0ewbyP7MnLY+pCMKMj7xyeaDY9pk
	FTOP+2woSOCRCusOBJina5tBdsQ9bJU47QsYLsuBdRzQx8tUVtVJc4r71Kfmq5pIIAorbEHR45e
	FIPGgjeXXqCVqlR8YAK2bK7xjMGSEA8kxJEoGrTZujExlvak6ujMBNMmfLt9yubOAWmoOyvPJaf
	pimj7vMmI39w/0bEZNR3V98rVFqBJp/lnkBfcUyyeNk62tWpmmvkDjPOprvyA9sCUPMBwXzSzXX
	vJNKUV88khrCAM0xFP66JIkzf+fFAi055+aomoMlWum0ULjN2HuButtd5z5fmmy6b/+hIy0RX8d
	QdEtznPDGpMTqABTJ87yAwxOqnPOit9JZeU/npPqL7ImhhyTn6bss3ZUzxSgf8qA4vKra2FPEW3
	8vOcsuvTyibf+9UA==
X-Google-Smtp-Source: AGHT+IFzelVEVcHZ/OEffn+B3ZOPH1G6XXdnoiZLhN8P1cfO9z6/oEzmEO+w51ye1sA65QFg9m/KUA==
X-Received: by 2002:a05:6000:2d84:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3b60dd7d98emr3809652f8f.46.1752748374338;
        Thu, 17 Jul 2025 03:32:54 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd163csm20204660f8f.4.2025.07.17.03.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] bus: mvebu-mbus: Embed syscore_ops in mbus context
Date: Thu, 17 Jul 2025 12:32:37 +0200
Message-ID: <20250717103241.2806798-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_033256_211239_14CB9D05 
X-CRM114-Status: GOOD (  12.19  )
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

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the mbus context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/bus/mvebu-mbus.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 92daa45cc844..1f22bff0773c 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -130,6 +130,7 @@ struct mvebu_mbus_win_data {
 };
 
 struct mvebu_mbus_state {
+	struct syscore_ops syscore;
 	void __iomem *mbuswins_base;
 	void __iomem *sdramwins_base;
 	void __iomem *mbusbridge_base;
@@ -148,6 +149,12 @@ struct mvebu_mbus_state {
 	struct mvebu_mbus_win_data wins[MBUS_WINS_MAX];
 };
 
+static inline struct mvebu_mbus_state *
+syscore_to_mbus(struct syscore_ops *ops)
+{
+	return container_of(ops, struct mvebu_mbus_state, syscore);
+}
+
 static struct mvebu_mbus_state mbus_state;
 
 /*
@@ -1008,7 +1015,7 @@ fs_initcall(mvebu_mbus_debugfs_init);
 
 static int mvebu_mbus_suspend(struct syscore_ops *ops)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = syscore_to_mbus(ops);
 	int win;
 
 	if (!s->mbusbridge_base)
@@ -1042,7 +1049,7 @@ static int mvebu_mbus_suspend(struct syscore_ops *ops)
 
 static void mvebu_mbus_resume(struct syscore_ops *ops)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = syscore_to_mbus(ops);
 	int win;
 
 	writel(s->mbus_bridge_ctrl,
@@ -1069,11 +1076,6 @@ static void mvebu_mbus_resume(struct syscore_ops *ops)
 	}
 }
 
-static struct syscore_ops mvebu_mbus_syscore_ops = {
-	.suspend	= mvebu_mbus_suspend,
-	.resume		= mvebu_mbus_resume,
-};
-
 static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 					 phys_addr_t mbuswins_phys_base,
 					 size_t mbuswins_size,
@@ -1118,7 +1120,9 @@ static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 		writel(UNIT_SYNC_BARRIER_ALL,
 		       mbus->mbuswins_base + UNIT_SYNC_BARRIER_OFF);
 
-	register_syscore_ops(&mvebu_mbus_syscore_ops);
+	mbus->syscore.suspend = mvebu_mbus_suspend;
+	mbus->syscore.resume = mvebu_mbus_resume;
+	register_syscore_ops(&mbus->syscore);
 
 	return 0;
 }
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
