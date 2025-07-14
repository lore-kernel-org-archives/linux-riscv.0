Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D796C83F1B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 10:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdjvhFj7FnqACruaqMg+Af0zLDqFihe2MMb2eZEgzV0=; b=UPFPIRV3yj5j1Q
	T4TtMQFmGonXpCSffl575AN4/419Lx0JyhTXLB7ObneQBqqw3brD3qg+AfiqtezDHbFZdqv0/50Oj
	KZKLEkMLDLjb4jBWcVCJ5UPyyJRzk8XH8u3KRpYtul5m7xO/LJEsNuW3qRgBYpoU27ZXj5gkBB4cX
	vLwOb52msrYdVegBbG4qA5Xqp0ndC+EuhUezQwxC+8OrV7RJlFkQoN2+8grkjG6xA0uFF5Jep3W/D
	6nL8kuSg9dDOjvnG60DdJZIhDNB172m54I1o7VfSsqNAaxM/z5MV0oYkQtiSNhp9xEVLi/UawrlfO
	i6JM0v3ArNIt/5o5T3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFyL-00000001rSX-0WmC;
	Mon, 14 Jul 2025 09:59:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFfe-00000001o7f-2yc7
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 09:40:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a575a988f9so2304421f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 02:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486025; x=1753090825; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qq1yIQl81CDUUjvpmEnXhN2Lz/OlMt3l5QjMkKHWpvM=;
        b=tX7PKdtvIfUKmtuHovWUT8kYrfkREDhu+N4Ai6pUXdtPENMRUk0AxAZuhEdtu0dW0w
         b6aDo5Mo0VF+7gwwh/GUSlDzcIEkOqJGqrKLyEDsmkaWxY8oRp7oUQfq8UrmyXCm4bYo
         T+HxIp8pFNaL6+XR/Etns34lFkYWcR5Ig9NoN4KmZmSTBxdAoTnWXccb6MkTmG99qkda
         cY0JFqBMVOANegntZYGFe3Sr49mXZnkUbCg0aQ/iZpqi/yHSOF6XPRL6UAiTH6WSOg8v
         iTL5Q5eGo7VHRhE2dBH0ZSi4mFu+Zornv44chJj29SpK40B6XU5ixLI6LEX8rjnEtHWj
         fN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486025; x=1753090825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qq1yIQl81CDUUjvpmEnXhN2Lz/OlMt3l5QjMkKHWpvM=;
        b=sbDdqttOQ5qcR4QlOgN1zrFAsXBTWhZzjp/V8cyk5UGwb/bmmGkZxeEbi6ujX7Yjp1
         /TgDZOVyRFI9Yy2alKjmbEHYcP3ZdQ5awsa//xWliFGkxhDNIerJ8xKCN+Hh2KGHxQcr
         ORZT3jHOKQtw10kUjbC9XuCG6ZqML/axxJZwyjBApjfQk+wMODvRoW29LYoBPn+Xv710
         vA0rhs4I+jkJoiwhl9G1LH+vY9LMiS7FN/Yjtoh5E5Fkx1Nj4ZCXq4GqC5RWnDur/EB+
         T1nxDETilTIRlw9Sz0DTCi6ihvhpwfuEu7DkXMsT9rc5Vgwj5OnmCGU+0ovRVt7sXb9R
         SrdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzBrBYWOJ4/uL+8pw3t6vzN4Zy6SRVPx1srtSv+LOl5LwIASZaqyiEZit9xfv6o/CGXCDdCfKuSkZLTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN0hqvOAOnh5ekuXU5C2i3MqYPYSo5ngnqVSnYy4vbhKRolGu2
	KJXG4JNLyoYCVMUeIHdsRwpfa+5bIo9Bk0IIodI7paJBIP4QM0j3FEertbdS0F45C2s=
X-Gm-Gg: ASbGncvn+eoqV94fLiQNp2/dnihxXCRLSwr35QIwKrcIngjqaAcRXzb+0oP4ax+qnmD
	jSuVBJGLlyYftUAxtZf4xCU9JY39iZMw0HVxilG4Pfw3536OcmQeVX0AmZU8NcW8aS9Piwb/1OJ
	pf6Fi11BoA2E2xsj7wSsyBjEybASK2j7evLn9jzazeWQxBLRFRtkqY3toFK3h3xjnAI5Tjjs01F
	dLot8NDCK3gcx5R7/8sZgH7RJ7I6IuPecdFsuu4kzTqk6L51ZMYanQ7WuxSWWuI/x6vL6BEwYZr
	RvNsHPrFvVNfDYdHxS1sdpaUWF4cerBuT8Kulc/cdF0Tcg1aVBa5ypi+oe/RVTEKDBD3kcOIoA=
	=
X-Google-Smtp-Source: AGHT+IF6lJB/75RKuYglHguDkP/WuOKNpgun14Va/8fXDBRY/jjqffgn9QMUWocm8IuxU0KZ4gL2CA==
X-Received: by 2002:adf:cd8f:0:b0:3a4:f55a:4ae2 with SMTP id ffacd0b85a97d-3b5f18d9986mr7801135f8f.50.1752486025115;
        Mon, 14 Jul 2025 02:40:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:24 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:29 +0800
Subject: [PATCH v3 2/8] dmaengine: mmp_pdma: Add optional clock support
MIME-Version: 1.0
Message-Id: <20250714-working_dma_0701_v2-v3-2-8b0f5cd71595@riscstar.com>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_024026_753472_E3881777 
X-CRM114-Status: GOOD (  12.08  )
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

Add support for retrieving and enabling an optional clock during
mmp_pdma_probe().

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: No change.
---
 drivers/dma/mmp_pdma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index a95d31103d3063a1d11177a1a37b89ac2fd213e9..4a6dbf55823722d26cc69379d22aaa88fbe19313 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -15,6 +15,7 @@
 #include <linux/device.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/dmapool.h>
+#include <linux/clk.h>
 #include <linux/of_dma.h>
 #include <linux/of.h>
 
@@ -1019,6 +1020,7 @@ static int mmp_pdma_probe(struct platform_device *op)
 {
 	struct mmp_pdma_device *pdev;
 	struct mmp_dma_platdata *pdata = dev_get_platdata(&op->dev);
+	struct clk *clk;
 	int i, ret, irq = 0;
 	int dma_channels = 0, irq_num = 0;
 	const enum dma_slave_buswidth widths =
@@ -1037,6 +1039,10 @@ static int mmp_pdma_probe(struct platform_device *op)
 	if (IS_ERR(pdev->base))
 		return PTR_ERR(pdev->base);
 
+	clk = devm_clk_get_optional_enabled(pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
 	if (pdev->dev->of_node) {
 		/* Parse new and deprecated dma-channels properties */
 		if (of_property_read_u32(pdev->dev->of_node, "dma-channels",

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
