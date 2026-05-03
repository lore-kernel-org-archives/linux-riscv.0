Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683F3FF886F
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 16:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+IR/8iF1OrVD8/VvQ37RUDGLqgSDc4UqIKsPyMpzJs=; b=ZssJb7BmFgz2un
	w0n1UVek8QzZINy5mwaeguF+rFYYSZIg1Ae78RuvYKCV/lMGZUasnzJFxQEsG0ChE8S/WbhCz8RMe
	Cv3u1z4pqR2pVZwb3+U3kvuOKIRg64Ie6S8otsz4ILMVlrspBGSBH6DIxoC5vhK/X1YuIoDFMkxLm
	EEV39xZeDgi6/nAhbS84vHCvUQcb1tTbWDJdQ44JVnY6oYLanlr9L7GzOYyBp1l/7m1u+USVd4afN
	ejZqo3uKVvIBJCgwt5D3ZP6+gi4242WcV3lrh4y8JNmhhfvDiKx2wzB6SJYfco7LiWfvXUOFx+2Jn
	S5yRzlXonxwy8OixZMoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZXi-0000000BHkD-2pcJ;
	Sun, 03 May 2026 16:19:42 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZXg-0000000BHjg-1Fo6
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 16:19:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488b150559bso22021095e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 03 May 2026 09:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777825178; x=1778429978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I77XqBnNzy6Xd0uVg7MWgMWJtzfrTV1o+kCHDHq3zPc=;
        b=DoMWm8H70f+JUkdKL+KdVtXwJqpK1H44akF47VoS0vkZ7vxaPoEeoqKZMI5xQqhOFI
         w+AgrRO9iFr8FlKFgB4W3kGu+LjreWZIDuMAOp5Bu04Rnkc4PblSmj3jp+IOafkfX7dY
         2B21sd4xrQOEMA2p/6bqaxL+cMFqJEYULBd0GndB+5WAWbTDY2EgfAPS+wFFwR9Z8mXu
         Yuxen7db13uNDz4E7fpD0fT3NHastJt+zI+USOVQ29jNyxOs5+y8SxLod8sDbq32e5CK
         LR2yaC/TsqsDoz6Dz14yWQBXm12evCIJ5jPXuKmCUrUkcMaR3pISHURD2av/8/D975gr
         TMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777825178; x=1778429978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I77XqBnNzy6Xd0uVg7MWgMWJtzfrTV1o+kCHDHq3zPc=;
        b=UUFjmFVS1PNo/1MDmL5povhmWBJubnglCAKGCMVEwzRSZoJm5HlWYEtAS+g8EkjYAX
         4eOt/pvI0P7a3MZwpq0Rk9lboF2DXWhRJHa/ni1kAMsiG/QefMT+0MTzNVqIJcJHvPOb
         MfefGlHWNPR36/ddXO5rc96xdbjjDQsfsTWVfVlAXzBCNRvty8AmulgE7xXRxFc8GT8q
         R4PI1U8XlSGYBVZ5VNcxc48+HmPvxLIyz7tjRAzGgMjjDDMg6Y2ibCEWf0GFlIUFdvKw
         djy8VZI56kmB6nHfwlZUk1xTkPv6bfLraGXyu3k8IPfNnBHEHUGDw4TL+Tc4IsyfMQ4s
         t7xA==
X-Gm-Message-State: AOJu0YzGvOgz7zN39FIkqZ5x8CBnEKf0PjNZuJlFjH4xDXphZ+DtZP/C
	bltl+88CuAt66DKD2pIPV6A3OgmhT28ii7su5H+mhZsB1XH5tttBfscA
X-Gm-Gg: AeBDiev1UJPP6fWMWSz5GMhpeEbw0UjkosUhB+2GDY8v3Ira5NDY3iYvzoshF4xcIIH
	zTE6eGT+DIiLdHat70+xIkspk/1kxMXWPrK7gTmr23DEDdu52dWYzVJktbrz0ZmEo9ShsaHe15m
	qSmZNhhuuSWRkwYS2FXKE5r4L8/2D9VItrYPAMK3Gu3ALNR+K83LKTPnKN3elJ6S5yVo42BSGPx
	nZYbopzoOBB+D5BQbJWi8dRA8EdAAMbomzQpPyHXmNeNJ9cQRjlR0csnwxqwUD3uHQKEUy0vVT4
	J3ChiPtaaRVF3DZ+vCi+GO352adDYam6XFw0K01ElpEklYasCK5CoBE07gJQK7K9itA/fBDAjpb
	Uoav9jtiCtg6/Rn7Mgy1gYynHTuH8n5nWBMsc7S6wp5xMyGMSF2smtODXTOsH+cXY2/0wE9qsLd
	+7ovm4EOPVnFfEP5cIQpjOruBlO2Xd7kRPat4eP5TncA7cGQkIoueZygXaVZ7awMCognkTZsE7
X-Received: by 2002:a05:6000:2081:b0:43d:77e1:6a69 with SMTP id ffacd0b85a97d-44bb6ab16fdmr11218016f8f.38.1777825178134;
        Sun, 03 May 2026 09:19:38 -0700 (PDT)
Received: from ST.. ([196.221.137.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981dee7asm20072901f8f.21.2026.05.03.09.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:19:37 -0700 (PDT)
From: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Subject: [PATCH v3] riscv: Replace non-standard -1 return with -ENODEV in riscv_of_parent_hartid()
Date: Sun,  3 May 2026 19:19:31 +0300
Message-Id: <20260503161931.688010-1-mohamedaymanworkspace@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260502161802.515547-1-mohamedaymanworkspace@gmail.com>
References: <20260502161802.515547-1-mohamedaymanworkspace@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_091940_379874_44F72244 
X-CRM114-Status: GOOD (  11.01  )
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

riscv_of_parent_hartid() returns -1 when no valid hart ID is found among
the parent nodes. This is non-standard; Linux kernel convention for a
"not found" condition is -ENODEV. Additionally, since several callers
propagate this return value up the call chain, a raw -1 could be
misinterpreted as -EPERM by code inspecting errno values.

Replace the -1 with -ENODEV for clarity and consistency with the rest
of the RISC-V CPU handling code.

Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
---
 arch/riscv/kernel/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc55..414cd55df 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -135,7 +135,7 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 		}
 	}
 
-	return -1;
+	return -ENODEV;
 }
 
 unsigned long __init riscv_get_marchid(void)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
