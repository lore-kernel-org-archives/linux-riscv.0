Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A306C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Feb 2022 13:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bqt88Ln4R5ptMQHD6woiwuMRThs+qc5EzrhD/6HuoA=; b=x0kQfkwVmmc+X/
	cDoLyv5L+eTV2I9+ENeTS59/grw0xTGW3al+6JkgfacIxiIfzr5yFeLrcVbhditL9o+ZtPmR/Kv4P
	0je/XeZs3AQgsPAxG+XGSp+SkYDflrlHOX8K6M4VfJFSnXcHwJJPaiFUKNlqVFzHkUwnamF6rwQJT
	ie7zxC8rs2eWleswOQym4+HNiIthVAetftzHLcyrGrg4i/JLaaN/6kHI8ze4RHj7O4J7Pi3eHa4fK
	woT6Oq2c5iD5mRkGmJnJLx0pXJfK+kgDPtpofZ15gjz3qp8b9YbLqCxxvBXhGfdV0CrSg4G8zGuD8
	L+nAYIeV/HG4WRzSOFGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3af-00Eh3V-QD; Fri, 18 Feb 2022 13:46:29 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL3TF-00Edrw-HS
 for linux-riscv@lists.infradead.org; Fri, 18 Feb 2022 13:38:52 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3BDC340296
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645191525;
 bh=cguSXJTSK/jUGjEgH9bI1vq5RLn1H9fQDOjhSSVs79w=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=TQsngHCzn9zqpqt981ryZom9swr51N9uEni5VKWX2OH5fie7OtaVJVWGFaU7qho+L
 o8W3J9RQrKVrDcYPEnfnaZu+cBnVCvkqMfYDZUUKx8RAQ+qFURnUC6o1Z5Ky31epB4
 HQ1Ur9BCmf7FAYTnJjsXJpfpOqU2J3cNC+xEAz5tR8cgz9hJuTLXHzRLtq4Edqst02
 XEVS4vyTN0r5YvA7bsYehd6+E6Rd+MqvxnZTjMIMA/4lkTPyqsi65WaFgIb/lJmT/1
 JPWIUsVb0pV/cT/4pDROYHeLMKRcxoTQwkrEVI2fkffluPlb9Ca/LDi54MXImgUI4r
 WNrxFyJOlYO1g==
Received: by mail-wm1-f69.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so2861401wmj.5
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 05:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cguSXJTSK/jUGjEgH9bI1vq5RLn1H9fQDOjhSSVs79w=;
 b=M4YGM6Y4RcEY0Bw2q8T5lFAxcARqpDlezduHTYj4y4f2wjdtu5GynrNRe4YAhjVnSb
 jVt4bY/PurrK0fE6WGNjsUMDTvjjUzADSeu1dS8GGpiLMtBr7z+pB2imbOdVoK4LB9Hf
 wgCR7eBXgv5PcyvE5U/zRlRFFWlwS9AkZFJCZ28sJw1tiqBQzjwseiXHfJCx4VmHytlR
 jw3jcyxpH9yojhap0Hvma7Ys66Uc4lxYFma2A34taydehfim2VSRzI7i0qt6WenD9rgT
 Bl3AAv+tR4D9WKE6GSD7re4Ky6he56YO+7//CAisJFLAYoAlNj8pUGbEK9m9iX8fPCRy
 AXQA==
X-Gm-Message-State: AOAM532Ofk3MCAQbWZqTq1eUujOxZx7ajRHN8ARf8x/fG1oKrcy97Uiu
 08Q8Y0w6j70/lGepSDtu9y1ddfYnNK+NdWyC7MrYzrh5MB9hLQJlLQlTX/Sk3vqGrCxJUVGz5p5
 ZQ4mD8pAIuYH5CVmJsbFl4LKprthJz8Qoq0/XFYVbqHsG+g==
X-Received: by 2002:a7b:cbc6:0:b0:37b:c56b:9eb9 with SMTP id
 n6-20020a7bcbc6000000b0037bc56b9eb9mr7250946wmi.17.1645191524258; 
 Fri, 18 Feb 2022 05:38:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwdi9qCsRGOKRf5aFH1Q0xUVlWAkuAr/mtea9chk3ia4coprzZyLiP+xUhMh9Zer9nD237Mg==
X-Received: by 2002:a7b:cbc6:0:b0:37b:c56b:9eb9 with SMTP id
 n6-20020a7bcbc6000000b0037bc56b9eb9mr7250929wmi.17.1645191524072; 
 Fri, 18 Feb 2022 05:38:44 -0800 (PST)
Received: from localhost.localdomain (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id g5sm4282472wmk.38.2022.02.18.05.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 05:38:43 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Aleksandr Nogikh <nogikh@google.com>, Nick Hu <nickhu@andestech.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH -fixes 3/4] riscv: Fix DEBUG_VIRTUAL false warnings
Date: Fri, 18 Feb 2022 14:35:12 +0100
Message-Id: <20220218133513.1762929-4-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220218133513.1762929-1-alexandre.ghiti@canonical.com>
References: <20220218133513.1762929-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_053849_749426_F539F675 
X-CRM114-Status: GOOD (  12.02  )
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

KERN_VIRT_SIZE used to encompass the kernel mapping before it was
redefined when moving the kasan mapping next to the kernel mapping to only
match the maximum amount of physical memory.

Then, kernel mapping addresses that go through __virt_to_phys are now
declared as wrong which is not true, one can use __virt_to_phys on such
addresses.

Fix this by redefining the condition that matches wrong addresses.

Fixes: f7ae02333d13 ("riscv: Move KASAN mapping next to the kernel mapping")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/mm/physaddr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/mm/physaddr.c b/arch/riscv/mm/physaddr.c
index e7fd0c253c7b..19cf25a74ee2 100644
--- a/arch/riscv/mm/physaddr.c
+++ b/arch/riscv/mm/physaddr.c
@@ -8,12 +8,10 @@
 
 phys_addr_t __virt_to_phys(unsigned long x)
 {
-	phys_addr_t y = x - PAGE_OFFSET;
-
 	/*
 	 * Boundary checking aginst the kernel linear mapping space.
 	 */
-	WARN(y >= KERN_VIRT_SIZE,
+	WARN(!is_linear_mapping(x) && !is_kernel_mapping(x),
 	     "virt_to_phys used for non-linear address: %pK (%pS)\n",
 	     (void *)x, (void *)x);
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
