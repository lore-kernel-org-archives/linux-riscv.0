Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAD4C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 12:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lGW0EhYcDulQWzGGYmPxp0wFWV+AXVIqMVXoryFPCg=; b=Ld1qnv2Y6c8p++
	leGQ7DNu6RKDhTsewgtIcyIdOCjwiZrC45AKM5j95bnEfFtAUOMqhJfTK1YEj0Zl+uWEBfjtKwd2L
	qsZ7H+498/TXmPJjkPcK8FXxNB1UYvlj5I8YmevznSrcvUB03UvgfpK3byLOjLXXO7eL9oMJ7fyDk
	ZJapL6ZXJejX6MooWsnYIRqXFuknM1V42HGQ/x8+Kiln7z2fUwCBS2+wUdtXFes2c87cohnN7MVzO
	zaLM3zsoXgSrDNu1i9hl2sG/EWqWMRpR1uFUX8UeKn7NYJfHp4nS4qjmJtsO3BwF5VzdChkyDhl6L
	m2grwNn56NUDewOJGl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9LD-00000003GUX-3MJe;
	Wed, 31 Jan 2024 12:05:19 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9L9-00000003GQi-1RYm
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 12:05:16 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a2f79e79f0cso643006966b.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 04:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706702714; x=1707307514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tlf5LO4n9V7MatL7X6LFUxINPBdX0qrp7L8XhBbm/gg=;
        b=bKcxt2X60b0uiNDByc8amP0VikIpD7pF4sIkA5Nxj3lp2KT+v7Hp9h2k8BLSYRoo5n
         ViBjUun1mbWhTPeihsEWqbAspaUehFo9eBpRFlquD/Ys/1xZOhwPpIOBgFEkPmGVzZ6k
         JySw0nS665B9a+nhe/Py7YbGgo0naQVMzeCEvPRDr8RoZA+f2BSKhTe98o46x2fB9Oqp
         MoGCCXh+A5RmJYhAsV9MUKYBu/E1+CwH/436f2pIHTpxelOwchMfM9xms3duEc8kBBFK
         2HrI7AvUIdNMacl7mdORtcb9zZ62JY2r39K3pI5A2kjiGj2LTyIQ/oTZO4fZoJ7YTHdF
         k6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706702714; x=1707307514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tlf5LO4n9V7MatL7X6LFUxINPBdX0qrp7L8XhBbm/gg=;
        b=m337oYpC1bwua+gTYcM8oumzIPFnzLlIQu9VTslG5SDhDhBDz6lajGZk60Xoll7miN
         cgS+vfbYQoxbY7+LRSYz5LgobFmtHmfR2nW1p2+Cs+4iyusxgC6MvmH6vtRP/Ds2aI3U
         4LxZnBnAtazZoGCaHKkOBzTrUiNT6eO1cTwfZBO18BIe0pKB7MaGk0nZD/twcONT50e2
         FfBxujngKn/Q4MJPzh75WZCJ5zUYzoBq3SMOsXG7ThjDv4wKnD1JQFu7iLixGfG1GgA5
         +2AMq2pzctlXmloaBEWiLaZJXJuHttBuzTvUTf7VUk6cMsAYGaiTpfGqQOFlA/4cKS2W
         K4vA==
X-Gm-Message-State: AOJu0YxjoVivqIoCsRNZPyUIk2k8gDOQJ6QPMoP6K1xBev3vYWM25cBF
	aFRGG/GnhQnFAh7guIrmEmgqpTbNSc6oG3liSf03+jsEYX1y82YKl63ApNN7mAosW3s86SxcKeJ
	I
X-Google-Smtp-Source: AGHT+IFGU35uUUCkisyJo9X187cVy1jBzXdXJOYi8WxO+RVfZ1K6QzrfoaQuUffTWbuyY2GXwRq8Ag==
X-Received: by 2002:a17:906:7185:b0:a36:7bee:5d9b with SMTP id h5-20020a170906718500b00a367bee5d9bmr1008463ejk.76.1706702713847;
        Wed, 31 Jan 2024 04:05:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUcxntpe0wylRHygFmtb4u2LcJ2lXbfRl0tE280VRQobY49+MddmlvWrNB+3uiFlkRBe4ypxa5HbfW8WBoYiAV4w/22/ZTKWIWBao+ijI5LbRYEQZJ0WYGRDQfSp9M4dlj39y9xROQ+vF9drkB/wX7ALNIfHW9OzX/0z6Y3Y9lBJvac7rQCJVhtmBf6+rRfA/rA98c19O3uMdVY2/17JZ3qafyXtooiyMG8t7qYxXNR5vLZB3/m5nwlTSudB8r5cZlS21gA
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ss6-20020a170907c00600b00a3533f17981sm5155801ejc.219.2024.01.31.04.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:05:13 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 1/3] RISC-V: paravirt: steal_time should be static
Date: Wed, 31 Jan 2024 13:05:13 +0100
Message-ID: <20240131120511.200338-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131120511.200338-5-ajones@ventanamicro.com>
References: <20240131120511.200338-5-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_040515_404547_1A4DC26A 
X-CRM114-Status: UNSURE (   9.27  )
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

steal_time is not used outside paravirt.c, make it static,
as sparse suggested.

Fixes: fdf68acccfc6 ("RISC-V: paravirt: Implement steal-time support")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/paravirt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 8e114f5930ce..15c5d4048db5 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -41,7 +41,7 @@ static int __init parse_no_stealacc(char *arg)
 
 early_param("no-steal-acc", parse_no_stealacc);
 
-DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
+static DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
 
 static bool __init has_pv_steal_clock(void)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
